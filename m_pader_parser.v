`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of 
// Engineer: Electronics
// 
// Create Date:    01:09:11 04/12/2014 
// Design Name: 
// Module Name:    m_pader_parser 
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
module m_pader_parser(input clk,rst,byte_rdy,byte_stop,input [7:0] data_in,
								output reg overflow_err,flag_0_15,output reg [31:0] padd_out,output reg padding_done,output reg strt_a_h
    );
												//we only need to take 32-bit data in one cycle
	 reg [7:0] block_512 [63:0]; //8bit word * 64 add = 512
	 reg [6:0] add_512_block; // Memory Address Register !7 bit reg can address 127 loc max
	 reg [63:0] m_size;  // l 64-bit number encoded for representing the length of input message
	 reg temp_chk; //to run if(temp_chk) func only once in if(stop_byte)
	 
	 reg [6:0] add_out0;
	 reg [6:0] add_out1;
	 reg [6:0] add_out2;
	 reg [6:0] add_out3;
	 
	 
	 always@(posedge clk)
	 begin
	 if(rst==0)
	 begin
		add_out0=7'd0;
		add_out1=7'd1;
		add_out2=7'd2;
		add_out3=7'd3;
		add_512_block=7'd0;
		m_size=64'd0;
		padding_done=1'b0;
		padd_out=32'd0;
		overflow_err=1'b0;
		temp_chk=1'b0;
		flag_0_15=1'b0;
		strt_a_h=1'b0;
	 end
	 else
	 begin
	 if(byte_rdy) //data stop byte received and checked by UART and byte_rdy=1
	 begin
	 block_512[add_512_block]=data_in;
	 add_512_block=add_512_block+1;
	 end
	 else  	//byte_rdy would go down after byte is tranferd and UART is in IDLE
				//else start padding when stop byte is received 
	 begin
		if(byte_stop)
		begin
					//padding begins
			if(add_512_block<55)
			begin
				if(temp_chk==0)
				begin
				padding_done=1'b0; //in progress
				m_size[63:0]=(add_512_block)*8; //add is incremented but we also start add from '0' so its good
				block_512[add_512_block]=8'b1_000_0000; //as add_512_block is already on new location --->> add 1_000_0000 byte
				temp_chk=1'b1;
				end //no else
				
				if(add_512_block<55)
				begin
				
					case(add_512_block)
					7'd1: begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd2: begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd3: begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd4: begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd5: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd6: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd7: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd8: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd9: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd10: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd11: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd12: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd13: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd14: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd15: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd16: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd17: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd18: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd19: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd20: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd21: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd22: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd23: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd24: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd25: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd26: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd27: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd28: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd29: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd30: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd31: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd32: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd33: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd34: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd35: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd36: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd37: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd38: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd39: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd40: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd41: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd42: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd43: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd44: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd45: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd46: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd47: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd48: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd49: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd50: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd51: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd52: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd53: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd54: 
					begin
							add_512_block=add_512_block+1;
							block_512[add_512_block]=8'd0;
					end
					7'd55: 
					begin
							block_512[add_512_block]=8'd0; //last address for '0's of  K
					end
					
					default:
					begin
							overflow_err=1'b1; //if address was <55 still no case started
							padding_done=1'b0; //then there is an error 
					end
					
					endcase
				end
			end
			else
			begin
			strt_a_h=1'b1;//to start iterative_processing right after padding_done
			block_512[63]=m_size[7:0];
			block_512[62]=m_size[15:8];
			block_512[61]=m_size[23:16];
			block_512[60]=m_size[31:24];
			block_512[59]=m_size[39:32];	//allocating the 64-bit m_size in the block
			block_512[58]=m_size[47:40];
			block_512[57]=m_size[55:48];
			block_512[56]=m_size[63:56];  //block_512[56] location for LSB of 64-bit m_size
			
			padding_done=1'b1; //out this to start m_iteration
			
			end
		end
		else
		begin
		//avoiding stop byte check to keep less out flags
		end
	 end
	 
	 if(add_512_block==55 && byte_stop==0)	//to make sure data is less than or equal allowed space and
														// we have free space for padding
	 begin
	 overflow_err=1'b1;
	 padding_done=1'b0; //if overflow !! don't start Hashing
	 end
	 else
	 begin
	 overflow_err=1'b0;				//Overflow of input message
	 end
	 
	 if(padding_done==1)		//parsing
	 begin
		if(add_out0==0)		//set 0 in reset
		begin
			padd_out[7:0]=block_512[add_out3];
			padd_out[15:8]=block_512[add_out2];		//taken 32-bit data
			padd_out[23:16]=block_512[add_out1];
			padd_out[31:24]=block_512[add_out0];
			
			add_out0=add_out0+7'd4;
			add_out1=add_out1+7'd4;
			add_out2=add_out2+7'd4;		//to take 4 addresses in 1 cycle
			add_out3=add_out3+7'd4;
		
		end
		else
		begin
			if(add_out3<64)		//to stop after last location is addressed
			begin
			
			padd_out[7:0]=block_512[add_out3];
			padd_out[15:8]=block_512[add_out2];		//taken 32-bit data
			padd_out[23:16]=block_512[add_out1];
			padd_out[31:24]=block_512[add_out0];
			
			add_out0=add_out0+7'd4;
			add_out1=add_out1+7'd4;
			add_out2=add_out2+7'd4;		//to take 4 addresses in 1 cycle
			add_out3=add_out3+7'd4;
			
			end
			else
			begin
			flag_0_15=1'b1;
			end
		end
	 end
	 else
	 begin
	 //nothing
	 end
	 end
	 end
endmodule
