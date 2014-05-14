`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:41 04/04/2014 
// Design Name: 
// Module Name:    top_sha 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top_sha(input clk,rst,byte_rdy,byte_stop,input [7:0] data_in,
					output overflow_err,output [255:0] Hash_Digest
    );
	 
	 reg [31:0] K;
	 reg temp_case;
	 
	 wire flag_0_15,padding_done;
	 wire [6:0] counter_iteration;
	 wire [31:0] data_in_padd,w_data_schdulr;
	 wire [31:0] a_out,b_out,c_out,d_out,e_out,f_out,g_out,h_out;
	 
	 m_pader_parser			m_pad_pars(clk,rst,byte_rdy,byte_stop,data_in,overflow_err,flag_0_15,data_in_padd,padding_done,strt_a_h);
	 m_scheduler 				msg_scheduler(clk,rst,flag_0_15,padding_done,data_in_padd,w_data_schdulr,counter_iteration);
	 interative_processing	iter_processing(clk,rst,w_data_schdulr,K,counter_iteration,padding_done,a_out,b_out,c_out,d_out,e_out,f_out,g_out,h_out);
	 m_digest					m_out_digest(clk,rst,counter_iteration,a_out,b_out,c_out,d_out,e_out,f_out,g_out,h_out,Hash_Digest);
	 
	 always@(posedge clk)
	 begin
	 if(rst==0)
	 begin
	 K=32'd0;
	 temp_case=1'b0;
	 end
	 else
	 begin
	 if(padding_done==1)
	 begin
	 case(temp_case)
	 1'b0: temp_case=1'b1;
	 1'b1: begin
		 case(counter_iteration)
		 7'd0: K = 32'h71374491;
		 7'd1: K = 32'hb5c0fbcf;
		 7'd2: K = 32'he9b5dba5;
		 7'd3: K = 32'h3956c25b;
		 7'd4: K = 32'h59f111f1;
		 7'd5: K = 32'h923f82a4;
		 7'd6: K = 32'hab1c5ed5;
		 7'd7: K = 32'hd807aa98;
		 7'd8: K = 32'h12835b01;
		 7'd9: K = 32'h243185be;
		 7'd10: K = 32'h550c7dc3;
		 7'd11: K = 32'h72be5d74;
		 7'd12: K = 32'h80deb1fe;
		 7'd13: K = 32'h9bdc06a7;
		 7'd14: K = 32'hc19bf174;
		 7'd15: K = 32'he49b69c1;
		 7'd16: K = 32'hefbe4786;
		 7'd17: K = 32'h0fc19dc6;
		 7'd18: K = 32'h240ca1cc;
		 7'd19: K = 32'h2de92c6f;
		 7'd20: K = 32'h4a7484aa;
		 7'd21: K = 32'h5cb0a9dc;
		 7'd22: K = 32'h76f988da;
		 7'd23: K = 32'h983e5152;
		 7'd24: K = 32'ha831c66d;
		 7'd25: K = 32'hb00327c8;
		 7'd26: K = 32'hbf597fc7;
		 7'd27: K = 32'hc6e00bf3;
		 7'd28: K = 32'hd5a79147;
		 7'd29: K = 32'h06ca6351;
		 7'd30: K = 32'h14292967;
		 7'd31: K = 32'h27b70a85;
		 7'd32: K = 32'h2e1b2138;
		 7'd33: K = 32'h4d2c6dfc;
		 7'd34: K = 32'h53380d13;
		 7'd35: K = 32'h650a7354;
		 7'd36: K = 32'h766a0abb;
		 7'd37: K = 32'h81c2c92e;
		 7'd38: K = 32'h92722c85;
		 7'd39: K = 32'ha2bfe8a1;
		 7'd40: K = 32'ha81a664b;
		 7'd41: K = 32'hc24b8b70;
		 7'd42: K = 32'hc76c51a3;
		 7'd43: K = 32'hd192e819;
		 7'd44: K = 32'hd6990624;
		 7'd45: K = 32'hf40e3585;
		 7'd46: K = 32'h106aa070;
		 7'd47: K = 32'h19a4c116;
		 7'd48: K = 32'h1e376c08;
		 7'd49: K = 32'h2748774c;
		 7'd50: K = 32'h34b0bcb5;
		 7'd51: K = 32'h391c0cb3;
		 7'd52: K = 32'h4ed8aa4a;
		 7'd53: K = 32'h5b9cca4f;
		 7'd54: K = 32'h682e6ff3;
		 7'd55: K = 32'h748f82ee;
		 7'd56: K = 32'h78a5636f;
		 7'd57: K = 32'h84c87814;
		 7'd58: K = 32'h8cc70208;
		 7'd59: K = 32'h90befffa;
		 7'd60: K = 32'ha4506ceb;
		 7'd61: K = 32'hbef9a3f7;
		 7'd62: K = 32'hc67178f2; //63 values 
		 default:K=32'd0;
		 endcase
		 end
		 endcase			//end temp_case
	 end
	 else
	 begin
	 K=32'h428a2f98; //64th values
	 end
	 end
	 end

endmodule
