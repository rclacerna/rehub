class FileManagersController < ApplicationController
  def index
  #  render :file => '/app/views/file_managers/upload.html.erb'
  end

  def create
    @filename_n_wordcount = []
    @records = Dir.glob("public/files/*")
    if request.post?
# gets file input from the user
      uploaded_io_arr = []
      uploaded_io_arr << params[:query]
      uploaded_io_arr << params[:file2]
      uploaded_io_arr << params[:file3]
      uploaded_io_arr << params[:file4]
      uploaded_io_arr << params[:file5]
      uploaded_io_arr << params[:file6]
      uploaded_io_arr << params[:file7]
      filename_arr = []
      doc_num = uploaded_io_arr.compact!.size
# This saves the file to the public folder
      uploaded_io_arr.each do |value|
        File.open(Rails.root.join('public', 'files', value.original_filename), 'wb') do |file|
          file.write(value.read)
          filename_arr << value.original_filename            # to arr of original file names e.g VM Level Load Balancing in Cloud Environment.pdf
        end

# This gets the file of the same name from the public folder
        filename_arr.each do |each_filename|                 #goes through each file name
          file_handle = File.expand_path(Rails.root.join('public', 'files',each_filename)) # searches public folder for each file name
          page_text = []
          PDF::Reader.open(file_handle) do |reader|        # Reads pdf, and extract the text
            reader.pages.each do |page|
              page_text << page.text
            end
          end
          doc_text = page_text.join(' ')
          hash = {:key => each_filename, :value => doc_text}

# This gets the word counts of chosen documents e.g Cloud => 4, the => 89, christmas => 1
          document1 = TfIdfSimilarity::Document.new(hash[:value])
          term_n_counts = document1.term_counts
          @data = {:key => each_filename, :value => term_n_counts}
        end
        @filename_n_wordcount << @data
      end
#files are deleted after data have been extracted from pdf
      uploaded_io_arr.each do |value|
        File.delete(Rails.root.join('public', 'files', value.original_filename))
      end
      self.find_similarity(@filename_n_wordcount, doc_num)
    end
  end

  def find_similarity(filename_n_wordcount ,doc_num)
    get = Tf_idf_hash.new(filename_n_wordcount, doc_num)
    @tf_idf = 	get.tf_idf(get.tf, get.idf)
    first_file = @tf_idf.to_a
    query = Hash[*first_file[0]]

    cos_gem = Cosine_similarity_hash.new
    @cosine = cos_gem.cosine_sim(@tf_idf , query)

    @result = @cosine.keys
  end

end
