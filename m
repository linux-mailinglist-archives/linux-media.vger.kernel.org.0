Return-Path: <linux-media+bounces-64252-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YrHDBn4uJ2pGtAIAu9opvQ
	(envelope-from <linux-media+bounces-64252-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 23:05:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD965A998
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 23:05:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=nynKs3m3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64252-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64252-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AA6F3026F32
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 21:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DFC37998B;
	Mon,  8 Jun 2026 21:01:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5172A2D5925
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 21:01:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780952516; cv=none; b=ALXDmM2vN2v7rCOhZvuJoHUkvfbLWHFOKHtcuXIXK+RcpdtLNrDcOik0uDZ07TKRqQWlZYVcKI0y7KprtbrzciAG22TbcfRgYVvAMyfOWBQpbsj/0cvbCciHdFaWaV70JchqTAJfkzmKmcJR6W75qqslZ9a44vI3UmjE9BxNFGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780952516; c=relaxed/simple;
	bh=x0VNXafTtJkLE+kO/GRB93OuIv1kzJ4jqrxepkx+lCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tw4OXKVETeqAAyWIGn6I17Q4r9RGh0BqEznl1RjFN6QKaECX77UPGQBsaIo7stwlzTQMWQBq2u/Wi/+uTssqcZ4/BHVW9Z9bkees5UGxVZGoeggBCQTIk4m9akPL1zIgQHMJ9l4niBBOGcfdmx/GdrOd0SgBQYTzM6vArBCIGlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nynKs3m3; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3456A267;
	Mon,  8 Jun 2026 23:01:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780952483;
	bh=x0VNXafTtJkLE+kO/GRB93OuIv1kzJ4jqrxepkx+lCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nynKs3m35hO+r/VHiedepK6LCBJGXWPu8nhLCNSkzL92dax+o1yBmRv+KcVil6il9
	 uufoMfKUsJ+lhX5R4qJXiuN4PIceGw6jVuEmqPjpGV7i1aONe/Zwt2X8q/Y8cUkYET
	 zf7Jnpt4noCDABr4IcWMXPaHD/nGJBy3aL42Cmr4=
Date: Tue, 9 Jun 2026 00:01:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-media@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
	Kate Hsuan <hpa@redhat.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Julien Massot <julien.massot@collabora.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	"Yan, Dongcheng" <dongcheng.yan@intel.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda Delgado <ribalda@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	"Yu, Ong Hock" <ong.hock.yu@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Rishikesh Donadkar <r-donadkar@ti.com>
Subject: Re: [PATCH v5 06/10] media: imx219: Fix vertical blanking and
 exposure for analogue binning
Message-ID: <20260608210149.GA980660@killaraus.ideasonboard.com>
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com>
 <20260607215356.842932-7-sakari.ailus@linux.intel.com>
 <aiZnQgyEBkZH7er0@zed>
 <178091466607.16054.13972332068848565738@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <178091466607.16054.13972332068848565738@freya>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64252-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,jjverkuil.nl,raspberrypi.com,vger.kernel.org,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,nxp.com,apitzsch.eu,kernel.org,ti.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:hans@jjverkuil.nl,m:dave.stevenson@raspberrypi.com,m:linux-media@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6ABD965A998

I wanted to check the valid of the static read-only registers, and ended
up dumping all registers while the sensor is running (using the
1920x1080 cropped mode, no binning). Here are the results, for the
non-zero registers. A large number of registers follow the CCS
specifications, registers marked with a (*) differ.

I will reply to the ongoing discussion separately.

0x0000 - module_model_id = 0x0219
0x0002 - ??? = 0x20
0x0004 - Lot_ID (*) = 0x686b17
0x0007 - Wafer_Num (*) = 0x0f
0x000d - Chip_Number (*) = 0x0945
0x0018 - FRM_CNT (*) = 0x56
0x0019 - PX_ORDER (*) = RGGB (0x01)
0x001b - DT_PEDESTAL (*) = 64
0x0040 - frame_format_model_type = 2-Byte Generic Frame Format (0x01)
0x0041 - frame_format_model_subtype = 1 Column, 2 Rows (0x12)
0x0042 - frame_format_descriptor_0 = Visible Pixel data: 3280 (0x5cd0)
0x0044 - frame_format_descriptor_1 = Embedded data: 2 (0x1002)
0x0046 - frame_format_descriptor_2 = Visible Pixel data: 2464 (0x59a0)
0x0086 - analog_gain_code_max = 224
0x0088 - analog_gain_code_step_size = 1
0x008e - analog_gain_c0 = 256
0x0090 - analog_gain_m1 = -1
0x0092 - analog_gain_c1 = 256
0x00c0 - data_format_model_type = 2-byte data format (0x01)
0x00c1 - data_format_model_subtype = 1 descriptor
0x00c2 - data_format_descriptor_0 = 10 bit uncompressed, 8 bit compressed (0x0a08)
0x00c4 - data_format_descriptor_1 = 10 bit uncompressed, 10 bit compressed (0x0a0a)
0x0100 - mode_select = 0x01
0x0105 - mask_corrupted_frames = 0x01
0x0114 - CSI_lane_mode (*) = 2 lanes (0x01)
0x0118 - TCLK_POST (*) = 119
0x011a - THS_PREPARE (*) = 71
0x011c - THS_ZERO_MIN (*) = 103
0x011e - THS_TRAIL (*) = 63
0x0120 - TCLK_TRAIL_MIN (*) = 55
0x0122 - TCLK_PREPARE (*) = 63
0x0124 - TCLK_ZERO (*) = 255
0x0126 - TLPX (*) = 55
0x012a - EXCK_FREQ (*) = 24
0x0142 - READOUT_V_CNT (*) = 0x5c70
0x0157 - ANA_GAIN_GLOBAL_A (*) = 232
0x0158 - DIG_GAIN_GLOBAL_A (*) = 256
0x015a - COARSE_INTEGRATION_TIME_A (*) = 1108
0x0160 - FRM_LENGTH_A (*) = 1112
0x0162 - LINE_LENGTH_A (*) = 3448
0x0164 - X_ADD_STA_A (*) = 680
0x0166 - X_ADD_END_A (*) = 2599
0x0168 - Y_ADD_STA_A (*) = 692
0x016a - Y_ADD_END_A (*) = 1771
0x016c - x_output_size (*) = 1920
0x016e - y_output_size (*) = 1080
0x0170 - X_ODD_INC_A (*) = 1
0x0171 - Y_ODD_INC_A (*) = 1
0x018a - COARSE_INTEG_TIME_SHORT_A (*) = 500
0x018c - CSI_DATA_FORMAT_A (*) = 0x0a0a
0x0192 - LSC_SELECT_TABLE_A (*) = 0x01
0x0194 - LSC_WHITE_BALANCE_RG_A (*) = 0x1000
0x0196 - ??? (*) = 0x10
0x0258 - DIG_GAIN_GLOBAL_B (*) = 256
0x025a - COARSE_INTEGRATION_TIME_B (*) = 1000
0x0260 - FRM_LENGTH_B (*) = 2728
0x0262 - LINE_LENGTH_B (*) = 3448
0x0266 - X_ADD_END_B (*) = 3279
0x026a - Y_ADD_END_B (*) = 2463
0x026c - x_output_size (*) = 3280
0x026e - y_output_size (*) = 2464
0x0270 - X_ODD_INC_B (*) = 1
0x0271 - Y_ODD_INC_B (*) = 1
0x028a - COARSE_INTEG_TIME_SHORT_B (*) = 500
0x028c - CSI_DATA_FORMAT_B (*) = 0x0a0a
0x0292 - LSC_SELECT_TABLE_B (*) = 0x01
0x0294 - LSC_WHITE_BALANCE_RG_B (*) = 0x10
0x0296 - ??? = 0x10
0x0300 - vt_pix_clk_div = 5
0x0302 - vt_sys_clk_div = 1
0x0304 - vt_pre_pll_clk_div = 3
0x0305 - op_pre_pll_clk_div = 3
0x0306 - vt_pll_multiplier = 57
0x0308 - op_pix_clk_div = 10
0x030a - op_sys_clk_div = 1
0x030d - op_pll_multiplier = 114
0x0319 - ??? = 0x03
0x031a - ??? = 0x01
0x031b - ??? = 0x4c
0x031d - ??? = 0x03
0x031e - ??? = 0x01
0x031f - ??? = 0x4c
0x0322 - FLASH_STROBE_DIV (*) = 1
0x0334 - FLASH_STROBE_HI_PERIOD_RS (*) = 1
0x0336 - FLASH_STROBE_LO_PERIOD_RS (*) = 1
0x0338 - FLASH_STROBE_COUNT_RS (*) = 1
0x0380 - x_even_inc = 0x01
0x0382 - x_odd_inc = 0x01
0x0388 - FINE_INTEG_TIME (*) = 500
0x0602 - test_data_red = 0x03ff
0x0604 - test_data_greenR = 0x03ff
0x0606 - test_data_blue = 0x03ff
0x0608 - test_data_greenB = 0x03ff
0x0624 - TP_WINDOW_WIDTH (*) = 1920
0x0626 - TP_WINDOW_HEIGHT (*) = 1080
0x1004 - coarse_integration_time_min = 1
0x1006 - coarse_integration_time_max_margin = 4
0x1081 - digital_gain_capability = 1
0x1084 - digital_gain_min = 256
0x1086 - digital_gain_max = 4095
0x1088 - digital_gain_step_size = 1
0x1100 - min_ext_clk_freq_mhz = 6.0 (0x40c00000)
0x1104 - max_ext_clk_freq_mhz = 27.0 (0x41d80000)
0x1108 - min_vt_pre_pll_clk_div = 1
0x110a - max_vt_pre_pll_clk_div = 13
0x110c - min_vt_pll_ip_freq_mhz = 6.0 (0x40c00000)
0x1110 - max_vt_pll_ip_freq_mhz = 27.0 (0x41d80000)
0x1114 - min_vt_pll_multiplier = 8
0x1116 - max_vt_pll_multiplier = 2047
0x1118 - min_pll_op_freq_mhz = 400.0 (0x43c80000)
0x111c - max_pll_op_freq_mhz = 916.0 (0x44650000)
0x1120 - min_vt_sys_clk_div = 1
0x1122 - max_vt_sys_clk_div = 2
0x1124 - min_vt_sys_clk_freq_mhz = 200.0 (0x43480000)
0x1128 - max_vt_sys_clk_freq_mhz = 700.0 (0x442f0000)
0x112c - min_vt_pix_clk_freq_mhz = 80.0 (0x42a00000)
0x1130 - max_vt_pix_clk_freq_mhz = 140.0 (0x430c0000)
0x1134 - min_vt_pix_clk_div = 5
0x1136 - max_vt_pix_clk_div = 5
0x1140 - min_frame_length_lines = 256
0x1142 - max_frame_length_lines = 65534
0x1144 - min_line_length_pck = 3448
0x1146 - max_line_length_pck = 32752
0x1148 - min_line_blanking_pck = 168
0x114a - min_frame_blanking_lines = 32
0x1160 - min_op_sys_clk_div = 1
0x1162 - max_op_sys_clk_div = 2
0x1164 - min_op_sys_clk_freq_mhz = 200.0 (0x43480000)
0x1168 - max_op_sys_clk_freq_mhz = 916.0 (0x44650000)
0x116c - min_op_pix_clk_freq_mhz (*) = 20.0 (0x41a00000)
0x1170 - max_op_pix_clk_freq_mhz (*) = 114.5 (0x42e50000)
0x1174 - min_op_pix_clk_div (*) = 8
0x1176 - max_op_pix_clk_div (*) = 10
0x1184 - x_addr_max = 3279
0x1186 - y_addr_max = 2463
0x1188 - min_x_output_size = 256
0x118a - min_y_output_size = 256
0x118c - max_x_output_size = 3280
0x118e - max_y_output_size = 2464
0x11c0 - min_even_inc = 1
0x11c2 - max_even_inc = 1
0x11c4 - min_odd_inc = 1
0x11c6 - max_odd_inc = 3
0x1211 - ??? = 1
0x1300 - compression_capability = 1

On Mon, Jun 08, 2026 at 04:01:06PM +0530, Jai Luthra wrote:
> Hi Jacopo, Sakari,
> ++ Dave, Hans and Laurent,
> 
> Quoting Jacopo Mondi (2026-06-08 12:28:46)
> > Hi Sakari
> > 
> > On Mon, Jun 08, 2026 at 12:53:52AM +0300, Sakari Ailus wrote:
> > > When vertical analogue binning is in use, the minimum frame length in
> > > lines decreases to around half of the normal. In relation to the sensor's
> > > output size this means vertical blanking can be negative but that's not an
> > > issue as control values are signed. Remove the workaround for this
> > 
> > Didn't we just discussed two weeks ago in media summit how negative
> > blankings are a bad idea, and of all drivers one could decide to play
> > with imx219 is probably the worse due it's large use base and the fact
> > libcamera doesn't support negative blankings ?
> > 
> > Have I missed something ?
> > 
> 
> I think it would be helpful if I write down clearly how this sensor
> operates (to the best of my knowledge) so we can decide on the correct
> fix:
> 
> --------------------
> 
> IMX219 sensor has an active resolution of 3280x2464.
> 
> The driver currently programs the sensor VT pixel clock as fixed for a
> given lane configuration.
> 
> In 2-lane mode it reads 182.4 MPixel/second:
> 
>     #define IMX219_PIXEL_RATE		182400000
> 
> And the framerate is given by:
> 
>     PIXEL_RATE / (FRAME_LENGTH * LINE_LENGTH)
> 
> where FRAME_LENGTH and LINE_LENGTH are registers that include the active
> height and width along with blankings.
> 
> There are restrictions on the minimum of the LINE_LENGTH register and
> minimum vertical blanking (32), which cap the framerate for the full resolution
> mode.
> 
>     MIN_LINE_LENGTH: 0xd78 => 3448 pixels
>     MIN_FRAME_LENGTH: ACTIVE_HEIGHT + MIN_VBLANK (32) = 2464 + 32
>                            => 2496 lines
> 
> The maximum frame rate is
> 
>     182400000/(2496*3448) => ~ 21.2 frames/second
> 
> --------------------
> 
> A user might want to stream a lower resolution with the full field-of-view,
> let's take 1640x1232 (which is exactly 1/2 of active area) as an example.
> 
> The sensor hardware can achieve this using two different binning modes:
> 
>     2x2-binning (regval: 0x1)
>     2x2-analog-(special)-binning (regval: 0x3)
> 
> The sensor pipeline looks like:
> 
> active pixel array ->
>     analogue crop (none) ->
>         2x2 binning and ADC readout ->
>                 output to CSI-2 bus
> 
> The mode names suggest that binning can happen either before or after ADC,
> but the datasheet is not very clear about the process. We can infer
> some details though. See below..
> 
> --------------------
> 
> With the "normal" 2x2-binning mode the sensor allows programming
> FRAME_LENGTH to a lower value. The driver still uses the min blanking of 32
> lines, but the height is now 1232, half of the 2464 before.
> 
>     MIN_LINE_LENGTH: 0xd78 => 3448 pixels
>     MIN_FRAME_LENGTH: READOUT_HEIGHT + MIN_VBLANK = 1232 + 32
>                            => 1264 lines
> 
> The maximum frame rate is
> 
>     182400000/(1264*3448) => ~ 41.8 frames/second
> 
> --------------------
> 
> With the "special" 2x2-binning mode, the datasheet notes that FRAME_LENGTH
> register should be in units of 2 Lines instead of 1 Line. This means
> cutting it down by half once more:
> 
>     MIN_FRAME_LENGTH: (READOUT_HEIGHT + MIN_VBLANK)/2 = (1232 + 32)/2
>                            => 632 lines
> 
> While there is a slightly higher minimum enforced for the line length:
> 
>     MIN_LINE_LENGTH: 0xde8 => 3560 pixels
> 
> The maximum frame rate is
> 
>     182400000/(632*3560) => ~ 81.0 frames/second
> 
> ===================
> 
> Through the minimum allowed values of the FRAME_LENGTH and LINE_LENGTH
> registers and maximum possible framerate, I think it is safe to say that:
> 
>     2x2-binning => Readout half the pixels (do vertical averaging in the
>                                             analogue domain, before ADC
>                                             reads out the voltages)
> 
>     2x2-special-binning => Readout a quarter of the pixels (???)
> 
> FRAME_LENGTH being 1/4th of normal would seem to suggest that it is a 4x1
> binning (combining 4 lines instead of blocks of 2x2).. which does not make
> sense to me.
> 
> My best guess is that in 2x2-special-binning mode the sensor does *both
> horizontal and vertical* averaging in the analogue domain, before the ADC
> reads out the voltages.
> 
> A higher minimum LINE_LENGTH value for this mode is the best "hard"
> evidence I have for this guess unfortunately, as the datasheet is quite
> lacking on this topic.
> 
> ====================
> 
> The APIs before Sakari's series expose HBLANK and VBLANK controls instead
> of the actual FRAME_LENGTH/LINE_LENGTH registers to the userspace.
> 
> The minimum value of FRAME_LENGTH is 632 when we are streaming 1640x1232,
> so the sensor registers would suggest that we have a *negative vertical
> blanking*. Which as Jacopo and Laurent both point out, does not make any
> conceptual sense whatsoever.
> 
> What the driver does today to avoid these negative values is to double the
> PIXEL_RATE control value to 364800000 when using 2x2-special-binning mode
> (and thus userspace has no idea the FRAME_LENGTH/VBLANK is in units of
>  2xLines)
> 
> As Sakari pointed out, that does not make any sense either. The sensor PLL
> values are completely unchanged, so the pixel readout must still be
> happening at the same rate. Moreover, the new raw sensor model will expose
> FRAME_LENGTH and LINE_LENGTH directly to userspace, and this hack of
> doubling the PIXEL_RATE breaks those calculations.
> 
> ===================
> 
> If we want to support the new raw sensor model (that mandates the new
> FRAME_LENGTH and LINE_LENGTH controls) for this sensor we have to
> fix the PIXEL_RATE for sure. I see two options going forward:
> 
> OPTION 1 (as proposed by Sakari):
> 
>     Fix PIXEL_RATE to 182400000 and allow **negative values** for HBLANK
>     and VBLANK controls when using 2x2-special-binning mode.
> 
>     This will break any userspace tools, many libcamera pipelines included,
>     that never expected those control values to be negative (even though
>     the API has always permitted those)
> 
> OPTION 2 (something that struck me today morning discussing with Jacopo):
>     
>     Fix PIXEL_RATE to 182400000 but **adjust the HBLANK values** to go
>     lower to compensate, which will diverge from the sensor registers which
>     keep MIN_LINE_LENGTH fixed across both binning modes.
> 
>     This will make the driver quite more complicated, but userspace
>     expectations of non-negative blankings will be met. And it's likely
>     that the sensor is internally doing pre-ADC averaging horizontally as
>     well, or so my best guess is.
> 
> Of course, there are other options to just leave this highly used sensor
> alone, or support embedded data and internal pads without mandating the new
> FRAME_LENGTH and LINE_LENGTH controls. But I personally would leave that as
> a last resort.
> 
> > > non-issue that doubled the pixel rate, frame length in lines and exposure
> > > time.
> > >
> > > The resulting change also fixes the minimum, the maximum and the step
> > > values for the control.
> > >
> > > Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> > > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Regards,

Laurent Pinchart

