module Megam
  class API
    def get_one_assembly(asm_id)
      @options = { path: "/assembly/#{asm_id}", body: '' }.merge(@options)

      request(
        expects: 200,
        method: :get,
        body: @options[:body]
      )
    end

    def update_assembly(new_asm)
      @options = { path: '/assembly/update',
                   body: Megam::JSONCompat.to_json(new_asm) }.merge(@options)

      request(
        expects: [200, 201],
        method: :post,
        body: @options[:body]
      )
   end

    def upgrade_assembly(asm_id)
      @options = { path: "/assembly/upgrade/#{asm_id}", body: '' }.merge(@options)

      request(
        expects: [200, 201],
        method: :get,
        body: @options[:body]
      )
   end

   def list_assembly
     @options = {:path => "/assembly",:body => ""}.merge(@options)

     request(
       :expects  => 200,
       :method   => :get,
       :body     => @options[:body]
     )
   end

   def delete_assembly(id, asms_id)
     @options = {path: "/admin/assembly/#{asms_id}/#{id}",
              :body => ''}.merge(@options)

     request(
     :expects  => 200,
     :method   => :delete,
     :body     => @options[:body]
    )
  end

  end
end
