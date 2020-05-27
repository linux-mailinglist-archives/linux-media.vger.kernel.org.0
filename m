Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C84191E33EC
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 02:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726734AbgE0AGO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 20:06:14 -0400
Received: from mga06.intel.com ([134.134.136.31]:64764 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725801AbgE0AGN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 20:06:13 -0400
IronPort-SDR: iO2eau9J5zPMzr7hwEcrokpZsH08WUktKYatNenfDr48H090IbwlySj/ov9WvIVkvRMiaeau/g
 dVlJ2KZe8LAw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 17:04:51 -0700
IronPort-SDR: Yz1lTlnRzHMBPMZfxHAPbUIglmUzk0GzFsaRHhazLj7Jxxazdgg+63kB0tukXY/QSERsJnkCsq
 o3jsGWh7vDgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,439,1583222400"; 
   d="scan'208";a="266645879"
Received: from pl-dbox.sh.intel.com (HELO intel.com) ([10.239.159.39])
  by orsmga003.jf.intel.com with ESMTP; 26 May 2020 17:04:48 -0700
Date:   Wed, 27 May 2020 08:03:44 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kbuild-all@lists.01.org, linux-media@vger.kernel.org
Subject: [ragnatech:media-tree 418/504] checkpatch: ERROR: that open brace {
 should be on the previous line
Message-ID: <20200527000344.GA7184@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Heirloom mailx 12.5 6/20/10
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

tree:   git://git.ragnatech.se/linux media-tree
head:   938b29db3aa9c293c7c1366b16e55e308f1a1ddd
commit: 406ae76079036fa9f335b70037cb971c14305cad [418/504] media: atomisp: sh_css: detect ISP version at runtime
reproduce:
        scripts/checkpatch.pl 0001-media-atomisp-sh_css-detect-ISP-version-at-runtime.patch

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

# many are suggestions rather than must-fix

WARNING: Prefer using '"%s...", __func__' to using 'load_preview_binaries', this function's name, in a string
#87: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:3060:
+				    "load_preview_binaries() num_invalid_frames=%d dvs_frame_delay=%d\n",

ERROR: that open brace { should be on the previous line
#279: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5225:
+	if (!stream)
+	{

ERROR: that open brace { should be on the previous line
#292: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5234:
+	if (!main_pipe)
+	{

ERROR: that open brace { should be on the previous line
#311: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5248:
+	for (i = 0; i < stream->num_pipes; i++)
+	{

CHECK: Alignment should match open parenthesis
#315: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5252:
+		IA_CSS_LOG("Send the stop-request to the pipe: pipe_id=%d",
+			stream->pipes[i]->pipeline.pipe_id);

WARNING: braces {} are not necessary for single statement blocks
#333: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5270:
+	if (err != IA_CSS_SUCCESS) {
+		goto ERR;
+	}

ERROR: that open brace { should be on the previous line
#347: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5284:
+	if (main_pipe->stream->config.continuous)
+	{

CHECK: Alignment should match open parenthesis
#367: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5304:
+		IA_CSS_LOG("Send the stop-request to the pipe: pipe_id=%d",
+			copy_pipe->pipeline.pipe_id);

WARNING: Block comments should align the * on each line
#486: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5844:
+			/* Select resolution for TNR. If
+			* output_system_in_resolution(GDC_out_resolution) is

WARNING: line over 80 characters
#487: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5845:
+			* being used, then select that as it will also be in resolution for

WARNING: Block comments use a trailing */ on a separate line
#488: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5846:
+			* TNR. At present, it only make sense for Skycam */

WARNING: line over 80 characters
#491: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5849:
+				tnr_width = pipe->config.output_system_in_res.width;

WARNING: line over 80 characters
#492: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5850:
+				tnr_height = pipe->config.output_system_in_res.height;

WARNING: line over 80 characters
#498: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5856:
+			/* Make tnr reference buffers output block width(in pix) align */

WARNING: line over 80 characters
#500: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5858:
+						       (mycs->video_binary.info->sp.block.block_width * ISP_NWAY));

WARNING: line over 80 characters
#525: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:5866:
+					       mycs->video_binary.info->sp.block.output_block_height);

WARNING: line over 80 characters
#641: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6366:
+							&capture_pp_descr, capt_pp_in_info,

CHECK: Alignment should match open parenthesis
#641: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6366:
+		ia_css_pipe_get_capturepp_binarydesc(pipe,
+							&capture_pp_descr, capt_pp_in_info,

WARNING: line over 80 characters
#642: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6367:
+							&capt_pp_out_info, &vf_info);

CHECK: Alignment should match open parenthesis
#644: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6369:
+		err = ia_css_binary_find(&capture_pp_descr,
+					    &mycs->capture_pp_binary);

WARNING: line over 80 characters
#654: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6379:
+							&capt_ldc_descr, &prim_out_info,

CHECK: Alignment should match open parenthesis
#654: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6379:
+			ia_css_pipe_get_ldc_binarydesc(pipe,
+							&capt_ldc_descr, &prim_out_info,

CHECK: Alignment should match open parenthesis
#658: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6383:
+			err = ia_css_binary_find(&capt_ldc_descr,
+						    &mycs->capture_ldc_binary);

WARNING: line over 80 characters
#707: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6396:
+			if (pipe->enable_viewfinder[IA_CSS_PIPE_OUTPUT_STAGE_0] &&

WARNING: line over 80 characters
#710: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6399:
+			ia_css_pipe_get_primary_binarydesc(pipe, &prim_descr[i], &prim_in_info,

WARNING: line over 80 characters
#711: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6400:
+							    &prim_out_info, local_vf_info, i);

CHECK: Alignment should match open parenthesis
#711: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6400:
+			ia_css_pipe_get_primary_binarydesc(pipe, &prim_descr[i], &prim_in_info,
+							    &prim_out_info, local_vf_info, i);

WARNING: line over 80 characters
#712: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6401:
+			err = ia_css_binary_find(&prim_descr[i], &mycs->primary_binary[i]);

WARNING: line over 80 characters
#730: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6412:
+			vf_pp_in_info = &mycs->primary_binary[mycs->num_primary_stage - 1].vf_frame_info;

ERROR: open brace '{' following function definitions go on the next line
#754: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6464:
+static enum ia_css_err
+allocate_delay_frames(struct ia_css_pipe *pipe) {

ERROR: that open brace { should be on the previous line
#772: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6475:
+	if (!pipe)
+	{

ERROR: that open brace { should be on the previous line
#835: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6487:
+	switch (mode)
+	{

WARNING: line over 80 characters
#838: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6490:
+		struct ia_css_capture_settings *mycs_capture = &pipe->pipe_settings.capture;

WARNING: line over 80 characters
#844: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6496:
+		struct ia_css_video_settings *mycs_video = &pipe->pipe_settings.video;

WARNING: Block comments should align the * on each line
#848: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6500:
+		/*The ref frame expects
+		    *	1. Y plane

WARNING: line over 80 characters
#856: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6508:
+		    *	TODO: make this ref_frame format as a separate frame format

WARNING: line over 80 characters
#863: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6515:
+		struct ia_css_preview_settings *mycs_preview = &pipe->pipe_settings.preview;

WARNING: Block comments should align the * on each line
#867: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6519:
+		/*The ref frame expects
+		    *	1. Y plane

WARNING: line over 80 characters
#875: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6527:
+		    *	TODO: make this ref_frame format as a separate frame format

ERROR: that open brace { should be on the previous line
#898: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6540:
+	for (i = 0; i < num_delay_frames; i++)
+	{

WARNING: line over 80 characters
#900: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6542:
+		err = ia_css_frame_allocate_from_info(&delay_frames[i],	&ref_info);

CHECK: Lines should not end with a '('
#908: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6550:
+static enum ia_css_err load_advanced_binaries(

ERROR: open brace '{' following function definitions go on the next line
#908: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6550:
+static enum ia_css_err load_advanced_binaries(
+    struct ia_css_pipe *pipe) {

WARNING: please, no spaces at the start of a line
#909: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6551:
+    struct ia_css_pipe *pipe) {$

CHECK: Alignment should match open parenthesis
#932: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6564:
+	assert(pipe->mode == IA_CSS_PIPE_ID_CAPTURE ||
+		pipe->mode == IA_CSS_PIPE_ID_COPY);

CHECK: Alignment should match open parenthesis
#954: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6577:
+	ia_css_frame_info_set_format(&vf_info,
+					IA_CSS_FRAME_FORMAT_YUV_LINE);

WARNING: line over 80 characters
#962: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6585:
+							&capture_pp_descr, &post_out_info, pipe_out_info, &vf_info);

CHECK: Alignment should match open parenthesis
#962: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6585:
+		ia_css_pipe_get_capturepp_binarydesc(pipe,
+							&capture_pp_descr, &post_out_info, pipe_out_info, &vf_info);

WARNING: line over 80 characters
#964: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6587:
+					    &pipe->pipe_settings.capture.capture_pp_binary);

CHECK: Alignment should match open parenthesis
#964: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6587:
+		err = ia_css_binary_find(&capture_pp_descr,
+					    &pipe->pipe_settings.capture.capture_pp_binary);

WARNING: line over 80 characters
#983: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6599:
+						    &post_gdc_descr, &post_in_info, &post_out_info, &vf_info);

WARNING: line over 80 characters
#985: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6601:
+					    &pipe->pipe_settings.capture.post_isp_binary);

CHECK: Alignment should match open parenthesis
#985: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6601:
+		err = ia_css_binary_find(&post_gdc_descr,
+					    &pipe->pipe_settings.capture.post_isp_binary);

WARNING: line over 80 characters
#1007: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6611:
+						&pipe->pipe_settings.capture.post_isp_binary.in_frame_info);

CHECK: Alignment should match open parenthesis
#1007: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6611:
+		ia_css_pipe_get_gdc_binarydesc(pipe, &gdc_descr, &gdc_in_info,
+						&pipe->pipe_settings.capture.post_isp_binary.in_frame_info);

WARNING: line over 80 characters
#1009: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6613:
+					    &pipe->pipe_settings.capture.anr_gdc_binary);

CHECK: Alignment should match open parenthesis
#1009: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6613:
+		err = ia_css_binary_find(&gdc_descr,
+					    &pipe->pipe_settings.capture.anr_gdc_binary);

WARNING: line over 80 characters
#1030: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6624:
+		ia_css_pipe_get_pre_gdc_binarydesc(pipe, &pre_gdc_descr, &pre_in_info,

WARNING: line over 80 characters
#1031: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6625:
+						    &pipe->pipe_settings.capture.anr_gdc_binary.in_frame_info);

CHECK: Alignment should match open parenthesis
#1031: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6625:
+		ia_css_pipe_get_pre_gdc_binarydesc(pipe, &pre_gdc_descr, &pre_in_info,
+						    &pipe->pipe_settings.capture.anr_gdc_binary.in_frame_info);

WARNING: line over 80 characters
#1033: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6627:
+					    &pipe->pipe_settings.capture.pre_isp_binary);

CHECK: Alignment should match open parenthesis
#1033: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6627:
+		err = ia_css_binary_find(&pre_gdc_descr,
+					    &pipe->pipe_settings.capture.pre_isp_binary);

WARNING: line over 80 characters
#1052: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6637:
+		    &pipe->pipe_settings.capture.capture_pp_binary.vf_frame_info;

WARNING: line over 80 characters
#1074: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6647:
+						&vf_pp_descr, vf_pp_in_info, pipe_vf_out_info);

WARNING: line over 80 characters
#1076: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6649:
+					    &pipe->pipe_settings.capture.vf_pp_binary);

CHECK: Alignment should match open parenthesis
#1076: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6649:
+		err = ia_css_binary_find(&vf_pp_descr,
+					    &pipe->pipe_settings.capture.vf_pp_binary);

CHECK: Alignment should match open parenthesis
#1096: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6661:
+		load_copy_binary(pipe,
+				    &pipe->pipe_settings.capture.copy_binary,

WARNING: line over 80 characters
#1097: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6662:
+				    &pipe->pipe_settings.capture.pre_isp_binary);

CHECK: Lines should not end with a '('
#1111: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6667:
+static enum ia_css_err load_bayer_isp_binaries(

ERROR: open brace '{' following function definitions go on the next line
#1111: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6667:
+static enum ia_css_err load_bayer_isp_binaries(
+    struct ia_css_pipe *pipe) {

WARNING: please, no spaces at the start of a line
#1112: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6668:
+    struct ia_css_pipe *pipe) {$

CHECK: Alignment should match open parenthesis
#1129: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6676:
+	assert(pipe->mode == IA_CSS_PIPE_ID_CAPTURE ||
+		pipe->mode == IA_CSS_PIPE_ID_COPY);

CHECK: Alignment should match open parenthesis
#1146: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6687:
+	ia_css_pipe_get_pre_de_binarydesc(pipe, &pre_de_descr,
+					    &pre_isp_in_info,

WARNING: line over 80 characters
#1155: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6691:
+				    &pipe->pipe_settings.capture.pre_isp_binary);

CHECK: Alignment should match open parenthesis
#1155: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6691:
+	err = ia_css_binary_find(&pre_de_descr,
+				    &pipe->pipe_settings.capture.pre_isp_binary);

CHECK: Lines should not end with a '('
#1165: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6696:
+static enum ia_css_err load_low_light_binaries(

ERROR: open brace '{' following function definitions go on the next line
#1165: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6696:
+static enum ia_css_err load_low_light_binaries(
+    struct ia_css_pipe *pipe) {

WARNING: please, no spaces at the start of a line
#1166: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6697:
+    struct ia_css_pipe *pipe) {$

CHECK: Alignment should match open parenthesis
#1181: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6709:
+	assert(pipe->mode == IA_CSS_PIPE_ID_CAPTURE ||
+		pipe->mode == IA_CSS_PIPE_ID_COPY);

CHECK: Alignment should match open parenthesis
#1218: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6724:
+	ia_css_frame_info_set_format(&vf_info,
+					IA_CSS_FRAME_FORMAT_YUV_LINE);

WARNING: line over 80 characters
#1229: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6732:
+							&capture_pp_descr, &post_out_info, pipe_out_info, &vf_info);

CHECK: Alignment should match open parenthesis
#1229: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6732:
+		ia_css_pipe_get_capturepp_binarydesc(pipe,
+							&capture_pp_descr, &post_out_info, pipe_out_info, &vf_info);

WARNING: line over 80 characters
#1231: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6734:
+					    &pipe->pipe_settings.capture.capture_pp_binary);

CHECK: Alignment should match open parenthesis
#1231: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6734:
+		err = ia_css_binary_find(&capture_pp_descr,
+					    &pipe->pipe_settings.capture.capture_pp_binary);

WARNING: line over 80 characters
#1272: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6746:
+						    &post_anr_descr, &post_in_info, &post_out_info, &vf_info);

WARNING: line over 80 characters
#1274: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6748:
+					    &pipe->pipe_settings.capture.post_isp_binary);

CHECK: Alignment should match open parenthesis
#1274: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6748:
+		err = ia_css_binary_find(&post_anr_descr,
+					    &pipe->pipe_settings.capture.post_isp_binary);

WARNING: line over 80 characters
#1296: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6758:
+						&pipe->pipe_settings.capture.post_isp_binary.in_frame_info);

CHECK: Alignment should match open parenthesis
#1296: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6758:
+		ia_css_pipe_get_anr_binarydesc(pipe, &anr_descr, &anr_in_info,
+						&pipe->pipe_settings.capture.post_isp_binary.in_frame_info);

WARNING: line over 80 characters
#1298: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6760:
+					    &pipe->pipe_settings.capture.anr_gdc_binary);

CHECK: Alignment should match open parenthesis
#1298: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6760:
+		err = ia_css_binary_find(&anr_descr,
+					    &pipe->pipe_settings.capture.anr_gdc_binary);

WARNING: line over 80 characters
#1321: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6771:
+		ia_css_pipe_get_pre_anr_binarydesc(pipe, &pre_anr_descr, &pre_in_info,

WARNING: line over 80 characters
#1322: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6772:
+						    &pipe->pipe_settings.capture.anr_gdc_binary.in_frame_info);

CHECK: Alignment should match open parenthesis
#1322: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6772:
+		ia_css_pipe_get_pre_anr_binarydesc(pipe, &pre_anr_descr, &pre_in_info,
+						    &pipe->pipe_settings.capture.anr_gdc_binary.in_frame_info);

WARNING: line over 80 characters
#1324: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6774:
+					    &pipe->pipe_settings.capture.pre_isp_binary);

CHECK: Alignment should match open parenthesis
#1324: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6774:
+		err = ia_css_binary_find(&pre_anr_descr,
+					    &pipe->pipe_settings.capture.pre_isp_binary);

WARNING: line over 80 characters
#1342: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6784:
+		    &pipe->pipe_settings.capture.capture_pp_binary.vf_frame_info;

WARNING: line over 80 characters
#1361: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6794:
+						&vf_pp_descr, vf_pp_in_info, pipe_vf_out_info);

WARNING: line over 80 characters
#1363: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6796:
+					    &pipe->pipe_settings.capture.vf_pp_binary);

CHECK: Alignment should match open parenthesis
#1363: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6796:
+		err = ia_css_binary_find(&vf_pp_descr,
+					    &pipe->pipe_settings.capture.vf_pp_binary);

WARNING: line over 80 characters
#1382: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6808:
+					&pipe->pipe_settings.capture.copy_binary,

CHECK: Alignment should match open parenthesis
#1382: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6808:
+		err = load_copy_binary(pipe,
+					&pipe->pipe_settings.capture.copy_binary,

WARNING: line over 80 characters
#1383: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6809:
+					&pipe->pipe_settings.capture.pre_isp_binary);

ERROR: open brace '{' following function definitions go on the next line
#1392: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6814:
+static bool copy_on_sp(struct ia_css_pipe *pipe) {

WARNING: line over 80 characters
#1398: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6818:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "copy_on_sp() enter:\n");

WARNING: Prefer using '"%s...", __func__' to using 'copy_on_sp', this function's name, in a string
#1398: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6818:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "copy_on_sp() enter:\n");

WARNING: line over 80 characters
#1407: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6824:
+	rval &= (pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_RAW);

CHECK: Lines should not end with a '('
#1425: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6833:
+static enum ia_css_err load_capture_binaries(

ERROR: open brace '{' following function definitions go on the next line
#1425: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6833:
+static enum ia_css_err load_capture_binaries(
+    struct ia_css_pipe *pipe) {

WARNING: please, no spaces at the start of a line
#1426: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6834:
+    struct ia_css_pipe *pipe) {$

CHECK: Alignment should match open parenthesis
#1437: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6841:
+	assert(pipe->mode == IA_CSS_PIPE_ID_CAPTURE ||
+		pipe->mode == IA_CSS_PIPE_ID_COPY);

WARNING: Block comments use * on subsequent lines
#1471: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6849:
+	/* in primary, advanced,low light or bayer,
+						the input format must be raw */

WARNING: Block comments use a trailing */ on a separate line
#1471: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6849:
+						the input format must be raw */

WARNING: line over 80 characters
#1473: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6851:
+	    pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_ADVANCED ||

WARNING: line over 80 characters
#1474: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6852:
+	    pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_BAYER ||

WARNING: line over 80 characters
#1475: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6853:
+	    pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_LOW_LIGHT;

WARNING: line over 80 characters
#1476: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6854:
+	err = ia_css_util_check_input(&pipe->stream->config, must_be_raw, false);

WARNING: line over 80 characters
#1482: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6860:
+	    pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8) {

CHECK: Lines should not end with a '('
#1483: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6861:
+		ia_css_frame_info_init(

WARNING: line over 80 characters
#1503: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6876:
+			pipe->pipe_settings.capture.copy_binary.online = pipe->stream->config.online;

ERROR: open brace '{' following function definitions go on the next line
#1551: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6901:
+static enum ia_css_err
+unload_capture_binaries(struct ia_css_pipe *pipe) {

WARNING: line over 80 characters
#1573: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6907:
+	if ((!pipe) || ((pipe->mode != IA_CSS_PIPE_ID_CAPTURE) && (pipe->mode != IA_CSS_PIPE_ID_COPY)))

ERROR: that open brace { should be on the previous line
#1573: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6907:
+	if ((!pipe) || ((pipe->mode != IA_CSS_PIPE_ID_CAPTURE) && (pipe->mode != IA_CSS_PIPE_ID_COPY)))
+	{

WARNING: line over 80 characters
#1580: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6914:
+		ia_css_binary_unload(&pipe->pipe_settings.capture.primary_binary[i]);

WARNING: line over 80 characters
#1593: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6923:
+		ia_css_binary_unload(&pipe->pipe_settings.capture.yuv_scaler_binary[i]);

ERROR: open brace '{' following function definitions go on the next line
#1614: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6934:
+static bool
+need_downscaling(const struct ia_css_resolution in_res,
+		    const struct ia_css_resolution out_res) {

CHECK: Alignment should match open parenthesis
#1616: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6936:
+need_downscaling(const struct ia_css_resolution in_res,
+		    const struct ia_css_resolution out_res) {

ERROR: open brace '{' following function definitions go on the next line
#1628: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6943:
+static bool
+need_yuv_scaler_stage(const struct ia_css_pipe *pipe) {

WARNING: line over 80 characters
#1652: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6958:
+		(pipe->output_info[0].format != IA_CSS_FRAME_FORMAT_CSI_MIPI_LEGACY_YUV420_8));

CHECK: Lines should not end with a '('
#1700: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6982:
+static enum ia_css_err ia_css_pipe_create_cas_scaler_desc_single_output(

ERROR: open brace '{' following function definitions go on the next line
#1700: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6982:
+static enum ia_css_err ia_css_pipe_create_cas_scaler_desc_single_output(
+    struct ia_css_frame_info *cas_scaler_in_info,
+    struct ia_css_frame_info *cas_scaler_out_info,
+    struct ia_css_frame_info *cas_scaler_vf_info,
+    struct ia_css_cas_binary_descr *descr) {

WARNING: please, no spaces at the start of a line
#1701: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6983:
+    struct ia_css_frame_info *cas_scaler_in_info,$

WARNING: please, no spaces at the start of a line
#1702: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6984:
+    struct ia_css_frame_info *cas_scaler_out_info,$

WARNING: please, no spaces at the start of a line
#1703: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6985:
+    struct ia_css_frame_info *cas_scaler_vf_info,$

WARNING: please, no spaces at the start of a line
#1704: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:6986:
+    struct ia_css_cas_binary_descr *descr) {$

WARNING: line over 80 characters
#1730: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7000:
+	/* We assume that this function is used only for single output port case. */

CHECK: Alignment should match open parenthesis
#1739: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7004:
+	hor_ds_factor = CEIL_DIV(cas_scaler_in_info->res.width,
+				    cas_scaler_out_info->res.width);

CHECK: Alignment should match open parenthesis
#1741: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7006:
+	ver_ds_factor = CEIL_DIV(cas_scaler_in_info->res.height,
+				    cas_scaler_out_info->res.height);

WARNING: line over 80 characters
#1742: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7007:
+	/* use the same horizontal and vertical downscaling factor for simplicity */

WARNING: line over 80 characters
#1816: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7016:
+	descr->in_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),

CHECK: Alignment should match open parenthesis
#1817: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7017:
+	descr->in_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),
+				    GFP_KERNEL);

CHECK: Lines should not end with a '('
#1822: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7022:
+	descr->internal_out_info = kmalloc(descr->num_stage * sizeof(

WARNING: line over 80 characters
#1823: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7023:
+						struct ia_css_frame_info), GFP_KERNEL);

WARNING: line over 80 characters
#1828: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7028:
+	descr->out_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),

CHECK: Alignment should match open parenthesis
#1829: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7029:
+	descr->out_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),
+				    GFP_KERNEL);

WARNING: line over 80 characters
#1834: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7034:
+	descr->vf_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),

CHECK: Alignment should match open parenthesis
#1835: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7035:
+	descr->vf_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),
+				    GFP_KERNEL);

WARNING: line over 80 characters
#1840: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7040:
+	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool), GFP_KERNEL);

WARNING: line over 80 characters
#1852: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7052:
+			if ((descr->num_output_stage > 1) && (i != (descr->num_stage - 1))) {

WARNING: line over 80 characters
#1853: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7053:
+				descr->internal_out_info[i].res.width = cas_scaler_out_info->res.width;

WARNING: line over 80 characters
#1854: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7054:
+				descr->internal_out_info[i].res.height = cas_scaler_out_info->res.height;

WARNING: line over 80 characters
#1855: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7055:
+				descr->internal_out_info[i].padded_width = cas_scaler_out_info->padded_width;

WARNING: line over 80 characters
#1868: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7062:
+			descr->out_info[i].res.width = cas_scaler_out_info->res.width;

WARNING: line over 80 characters
#1869: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7063:
+			descr->out_info[i].res.height = cas_scaler_out_info->res.height;

WARNING: line over 80 characters
#1870: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7064:
+			descr->out_info[i].padded_width = cas_scaler_out_info->padded_width;

WARNING: line over 80 characters
#1873: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7067:
+				descr->vf_info[i].res.width = cas_scaler_vf_info->res.width;

WARNING: line over 80 characters
#1874: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7068:
+				descr->vf_info[i].res.height = cas_scaler_vf_info->res.height;

WARNING: line over 80 characters
#1875: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7069:
+				descr->vf_info[i].padded_width = cas_scaler_vf_info->padded_width;

WARNING: line over 80 characters
#1876: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7070:
+				ia_css_frame_info_set_format(&descr->vf_info[i], IA_CSS_FRAME_FORMAT_YUV_LINE);

WARNING: line over 80 characters
#1891: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7078:
+			descr->internal_out_info[i].res.width = tmp_in_info.res.width /

WARNING: line over 80 characters
#1892: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7079:
+								max_scale_factor_per_stage;

WARNING: line over 80 characters
#1893: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7080:
+			descr->internal_out_info[i].res.height = tmp_in_info.res.height /

WARNING: line over 80 characters
#1895: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7082:
+			descr->internal_out_info[i].format = IA_CSS_FRAME_FORMAT_YUV420;

WARNING: line over 80 characters
#1897: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7084:
+						tmp_in_info.res.width / max_scale_factor_per_stage,

CHECK: Alignment should match open parenthesis
#1897: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7084:
+			ia_css_frame_info_init(&descr->internal_out_info[i],
+						tmp_in_info.res.width / max_scale_factor_per_stage,

WARNING: line over 80 characters
#1898: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7085:
+						tmp_in_info.res.height / max_scale_factor_per_stage,

CHECK: Lines should not end with a '('
#1929: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7102:
+static enum ia_css_err ia_css_pipe_create_cas_scaler_desc(

ERROR: open brace '{' following function definitions go on the next line
#1929: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7102:
+static enum ia_css_err ia_css_pipe_create_cas_scaler_desc(
+    struct ia_css_pipe *pipe,
+    struct ia_css_cas_binary_descr *descr) {

WARNING: please, no spaces at the start of a line
#1930: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7103:
+    struct ia_css_pipe *pipe,$

WARNING: please, no spaces at the start of a line
#1931: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7104:
+    struct ia_css_cas_binary_descr *descr) {$

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_pipe_create_cas_scaler_desc', this function's name, in a string
#1949: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7119:
+			    "ia_css_pipe_create_cas_scaler_desc() enter:\n");

WARNING: line over 80 characters
#1987: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7141:
+			hor_scale_factor[i] = CEIL_DIV(in_info.res.width, out_info[i]->res.width);

WARNING: line over 80 characters
#1988: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7142:
+			ver_scale_factor[i] = CEIL_DIV(in_info.res.height, out_info[i]->res.height);

WARNING: line over 80 characters
#1989: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7143:
+			/* use the same horizontal and vertical scaling factor for simplicity */

WARNING: line over 80 characters
#2052: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7161:
+					sizeof(struct ia_css_frame_info), GFP_KERNEL);

CHECK: Alignment should match open parenthesis
#2052: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7161:
+	descr->in_info = kmalloc_array(descr->num_stage,
+					sizeof(struct ia_css_frame_info), GFP_KERNEL);

CHECK: Lines should not end with a '('
#2057: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7166:
+	descr->internal_out_info = kmalloc(descr->num_stage * sizeof(

WARNING: line over 80 characters
#2058: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7167:
+						struct ia_css_frame_info), GFP_KERNEL);

WARNING: line over 80 characters
#2063: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7172:
+	descr->out_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),

CHECK: Alignment should match open parenthesis
#2064: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7173:
+	descr->out_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),
+				    GFP_KERNEL);

WARNING: line over 80 characters
#2069: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7178:
+	descr->vf_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),

CHECK: Alignment should match open parenthesis
#2070: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7179:
+	descr->vf_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),
+				    GFP_KERNEL);

WARNING: line over 80 characters
#2075: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7184:
+	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool), GFP_KERNEL);

WARNING: line over 80 characters
#2090: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7193:
+				assert((out_info[i - 1]->res.width >= out_info[i]->res.width) &&

WARNING: line over 80 characters
#2091: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7194:
+					(out_info[i - 1]->res.height >= out_info[i]->res.height));

CHECK: Alignment should match open parenthesis
#2091: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7194:
+				assert((out_info[i - 1]->res.width >= out_info[i]->res.width) &&
+					(out_info[i - 1]->res.height >= out_info[i]->res.height));

WARNING: line over 80 characters
#2147: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7209:
+			if ((descr->num_output_stage > 1) && (i != (descr->num_stage - 1))) {

WARNING: line over 80 characters
#2148: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7210:
+				descr->internal_out_info[i].res.width = out_info[j]->res.width;

WARNING: line over 80 characters
#2149: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7211:
+				descr->internal_out_info[i].res.height = out_info[j]->res.height;

WARNING: line over 80 characters
#2150: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7212:
+				descr->internal_out_info[i].padded_width = out_info[j]->padded_width;

WARNING: line over 80 characters
#2165: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7221:
+			descr->out_info[i].padded_width = out_info[j]->padded_width;

WARNING: line over 80 characters
#2168: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7224:
+				descr->vf_info[i].res.width = vf_out_info[j]->res.width;

WARNING: line over 80 characters
#2169: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7225:
+				descr->vf_info[i].res.height = vf_out_info[j]->res.height;

WARNING: line over 80 characters
#2170: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7226:
+				descr->vf_info[i].padded_width = vf_out_info[j]->padded_width;

WARNING: line over 80 characters
#2171: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7227:
+				ia_css_frame_info_set_format(&descr->vf_info[i], IA_CSS_FRAME_FORMAT_YUV_LINE);

WARNING: line over 80 characters
#2205: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7236:
+			descr->internal_out_info[i].res.width = tmp_in_info.res.width /

WARNING: line over 80 characters
#2206: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7237:
+								max_scale_factor_per_stage;

WARNING: line over 80 characters
#2207: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7238:
+			descr->internal_out_info[i].res.height = tmp_in_info.res.height /

WARNING: line over 80 characters
#2209: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7240:
+			descr->internal_out_info[i].format = IA_CSS_FRAME_FORMAT_YUV420;

WARNING: line over 80 characters
#2211: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7242:
+						tmp_in_info.res.width / max_scale_factor_per_stage,

CHECK: Alignment should match open parenthesis
#2211: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7242:
+			ia_css_frame_info_init(&descr->internal_out_info[i],
+						tmp_in_info.res.width / max_scale_factor_per_stage,

WARNING: line over 80 characters
#2212: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7243:
+						tmp_in_info.res.height / max_scale_factor_per_stage,

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_pipe_create_cas_scaler_desc', this function's name, in a string
#2223: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7254:
+			    "ia_css_pipe_create_cas_scaler_desc() leave, err=%d\n",

ERROR: open brace '{' following function definitions go on the next line
#2246: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7259:
+static void ia_css_pipe_destroy_cas_scaler_desc(struct ia_css_cas_binary_descr
+	*descr) {

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_pipe_destroy_cas_scaler_desc', this function's name, in a string
#2249: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7262:
+			    "ia_css_pipe_destroy_cas_scaler_desc() enter:\n");

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_pipe_destroy_cas_scaler_desc', this function's name, in a string
#2261: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7274:
+			    "ia_css_pipe_destroy_cas_scaler_desc() leave\n");

ERROR: open brace '{' following function definitions go on the next line
#2268: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7277:
+static enum ia_css_err
+load_yuvpp_binaries(struct ia_css_pipe *pipe) {

WARNING: line over 80 characters
#2299: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7296:
+	/* Set both must_be_raw and must_be_yuv to false then yuvpp can take rgb inputs */

ERROR: that open brace { should be on the previous line
#2313: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7303:
+	for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++)
+	{

WARNING: line over 80 characters
#2316: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7306:
+			err = ia_css_util_check_vf_out_info(&pipe->output_info[i],

WARNING: line over 80 characters
#2317: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7307:
+							    &pipe->vf_output_info[i]);

ERROR: that open brace { should be on the previous line
#2388: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7318:
+	if (need_scaler)
+	{

CHECK: Alignment should match open parenthesis
#2443: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7323:
+		err = ia_css_pipe_create_cas_scaler_desc(pipe,
+			&cas_scaler_descr);

WARNING: Prefer kcalloc over kzalloc with multiply
#2448: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7328:
+		mycs->yuv_scaler_binary = kzalloc(cas_scaler_descr.num_stage *
+						    sizeof(struct ia_css_binary), GFP_KERNEL);

WARNING: line over 80 characters
#2449: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7329:
+						    sizeof(struct ia_css_binary), GFP_KERNEL);

WARNING: line over 80 characters
#2465: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7341:
+			mycs->is_output_stage[i] = cas_scaler_descr.is_output_stage[i];

WARNING: line over 80 characters
#2467: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7343:
+								&yuv_scaler_descr, &cas_scaler_descr.in_info[i],

CHECK: Alignment should match open parenthesis
#2467: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7343:
+			ia_css_pipe_get_yuvscaler_binarydesc(pipe,
+								&yuv_scaler_descr, &cas_scaler_descr.in_info[i],

WARNING: line over 80 characters
#2468: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7344:
+								&cas_scaler_descr.out_info[i],

WARNING: line over 80 characters
#2469: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7345:
+								&cas_scaler_descr.internal_out_info[i],

WARNING: line over 80 characters
#2470: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7346:
+								&cas_scaler_descr.vf_info[i]);

WARNING: line over 80 characters
#2472: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7348:
+						    &mycs->yuv_scaler_binary[i]);

CHECK: Alignment should match open parenthesis
#2472: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7348:
+			err = ia_css_binary_find(&yuv_scaler_descr,
+						    &mycs->yuv_scaler_binary[i]);

ERROR: that open brace { should be on the previous line
#2477: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7353:
+	} else
+	{

CHECK: Unbalanced braces around else statement
#2477: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7353:
+	} else

ERROR: that open brace { should be on the previous line
#2484: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7358:
+	if (need_scaler)
+	{

ERROR: that open brace { should be on the previous line
#2487: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7361:
+	} else
+	{

CHECK: Unbalanced braces around else statement
#2487: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7361:
+	} else

WARNING: Block comments should align the * on each line
#2505: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7368:
+	/*
+	    * NOTES

WARNING: line over 80 characters
#2506: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7369:
+	    * - Why does the "yuvpp" pipe needs "isp_copy_binary" (i.e. ISP Copy) when

WARNING: line over 80 characters
#2509: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7372:
+	    *   In most use cases, the first stage in the "yuvpp" pipe is the "yuv_scale_

WARNING: line over 80 characters
#2510: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7373:
+	    *   binary". However, the "yuv_scale_binary" does NOT support the input-frame

WARNING: line over 80 characters
#2513: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7376:
+	    *   Hence, the "isp_copy_binary" is required to be present in front of the "yuv

WARNING: line over 80 characters
#2514: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7377:
+	    *   _scale_binary". It would translate the input-frame to the frame formats that

WARNING: line over 80 characters
#2517: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7380:
+	    *   Please refer to "FrameWork/css/isp/pipes/capture_pp/capture_pp_1.0/capture_

WARNING: line over 80 characters
#2518: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7381:
+	    *   pp_defs.h" for the list of input-frame formats that are supported by the

WARNING: line over 80 characters
#2522: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7385:
+	    (pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_YUV422_8);

ERROR: that open brace { should be on the previous line
#2527: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7390:
+	if (need_isp_copy_binary)
+	{

CHECK: Alignment should match open parenthesis
#2530: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7393:
+		err = load_copy_binary(pipe,
+					&mycs->copy_binary,

WARNING: Block comments should align the * on each line
#2541: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7400:
+		/*
+		    * NOTES

WARNING: line over 80 characters
#2542: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7401:
+		    * - Why is "pipe->pipe_settings.capture.copy_binary.online" specified?

WARNING: line over 80 characters
#2544: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7403:
+		    *   In some use cases, the first stage in the "yuvpp" pipe is the

WARNING: line over 80 characters
#2545: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7404:
+		    *   "isp_copy_binary". The "isp_copy_binary" is designed to process

WARNING: line over 80 characters
#2546: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7405:
+		    *   the input from either the system DDR or from the IPU internal VMEM.

WARNING: line over 80 characters
#2547: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7406:
+		    *   So it provides the flag "online" to specify where its input is from,

WARNING: line over 80 characters
#2550: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7409:
+		    *      (1) "online <= true", the input is from the IPU internal VMEM.

WARNING: line over 80 characters
#2551: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7410:
+		    *      (2) "online <= false", the input is from the system DDR.

WARNING: line over 80 characters
#2553: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7412:
+		    *   In other use cases, the first stage in the "yuvpp" pipe is the

WARNING: line over 80 characters
#2554: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7413:
+		    *   "yuv_scale_binary". "The "yuv_scale_binary" is designed to process the

WARNING: line over 80 characters
#2555: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7414:
+		    *   input ONLY from the system DDR. So it does not provide the flag "online"

WARNING: line over 80 characters
#2558: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7417:
+		pipe->pipe_settings.capture.copy_binary.online = pipe->stream->config.online;

ERROR: that open brace { should be on the previous line
#2562: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7421:
+	if (need_scaler)
+	{

ERROR: that open brace { should be on the previous line
#2576: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7432:
+	} else
+	{

CHECK: Unbalanced braces around else statement
#2576: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7432:
+	} else

WARNING: braces {} are not necessary for single statement blocks
#2580: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7436:
+		for (i = 1; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++) {
+			vf_pp_in_info[i] = NULL;
+		}

WARNING: line over 80 characters
#2585: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7441:
+	mycs->vf_pp_binary = kzalloc(mycs->num_vf_pp * sizeof(struct ia_css_binary),

CHECK: Alignment should match open parenthesis
#2586: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7442:
+	mycs->vf_pp_binary = kzalloc(mycs->num_vf_pp * sizeof(struct ia_css_binary),
+					GFP_KERNEL);

ERROR: that open brace { should be on the previous line
#2587: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7443:
+	if (!mycs->vf_pp_binary)
+	{

WARNING: line over 80 characters
#2617: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7456:
+								&vf_pp_descr, vf_pp_in_info[i], &pipe->vf_output_info[i]);

WARNING: line over 80 characters
#2618: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7457:
+				err = ia_css_binary_find(&vf_pp_descr, &mycs->vf_pp_binary[i]);

ERROR: that open brace { should be on the previous line
#2637: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7468:
+	if (need_scaler)
+	{

WARNING: line over 80 characters
#2641: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7472:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "load_yuvpp_binaries() leave, err=%d\n",

WARNING: Prefer using '"%s...", __func__' to using 'load_yuvpp_binaries', this function's name, in a string
#2641: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7472:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "load_yuvpp_binaries() leave, err=%d\n",

ERROR: open brace '{' following function definitions go on the next line
#2651: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7477:
+static enum ia_css_err
+unload_yuvpp_binaries(struct ia_css_pipe *pipe) {

ERROR: that open brace { should be on the previous line
#2663: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7483:
+	if ((!pipe) || (pipe->mode != IA_CSS_PIPE_ID_YUVPP))
+	{

ERROR: that open brace { should be on the previous line
#2669: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7489:
+	for (i = 0; i < pipe->pipe_settings.yuvpp.num_yuv_scaler; i++)
+	{

WARNING: line over 80 characters
#2671: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7491:
+		ia_css_binary_unload(&pipe->pipe_settings.yuvpp.yuv_scaler_binary[i]);

ERROR: that open brace { should be on the previous line
#2673: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7493:
+	for (i = 0; i < pipe->pipe_settings.yuvpp.num_vf_pp; i++)
+	{

WARNING: line over 80 characters
#2675: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7495:
+		ia_css_binary_unload(&pipe->pipe_settings.yuvpp.vf_pp_binary[i]);

ERROR: open brace '{' following function definitions go on the next line
#2690: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7508:
+static enum ia_css_err yuvpp_start(struct ia_css_pipe *pipe) {

WARNING: line over 80 characters
#2724: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7528:
+#if !defined(HAS_NO_INPUT_SYSTEM) && (defined(USE_INPUT_SYSTEM_VERSION_2) || defined(USE_INPUT_SYSTEM_VERSION_2401))

WARNING: line over 80 characters
#2739: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7539:
+		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);

ERROR: open brace '{' following function definitions go on the next line
#2779: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7549:
+static enum ia_css_err
+sh_css_pipe_unload_binaries(struct ia_css_pipe *pipe) {

ERROR: that open brace { should be on the previous line
#2785: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7555:
+	if (!pipe)
+	{

ERROR: that open brace { should be on the previous line
#2791: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7561:
+	if (pipe->config.mode == IA_CSS_PIPE_MODE_COPY)
+	{

ERROR: that open brace { should be on the previous line
#2797: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7567:
+	switch (pipe->mode)
+	{

ERROR: open brace '{' following function definitions go on the next line
#2821: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7588:
+static enum ia_css_err
+sh_css_pipe_load_binaries(struct ia_css_pipe *pipe) {

WARNING: line over 80 characters
#2828: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7593:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "sh_css_pipe_load_binaries() enter:\n");

WARNING: Prefer using '"%s...", __func__' to using 'sh_css_pipe_load_binaries', this function's name, in a string
#2828: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7593:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "sh_css_pipe_load_binaries() enter:\n");

ERROR: that open brace { should be on the previous line
#2854: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7599:
+	switch (pipe->mode)
+	{

ERROR: that open brace { should be on the previous line
#2874: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7619:
+	if (err != IA_CSS_SUCCESS)
+	{

WARNING: line over 80 characters
#2877: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7622:
+			/* currently css does not support multiple error returns in a single function,

WARNING: Block comments use a trailing */ on a separate line
#2878: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7623:
+			    * using IA_CSS_ERR_INTERNAL_ERROR in this case */

WARNING: Block comments should align the * on each line
#2878: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7623:
+			/* currently css does not support multiple error returns in a single function,
+			    * using IA_CSS_ERR_INTERNAL_ERROR in this case */

ERROR: open brace '{' following function definitions go on the next line
#2915: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7630:
+static enum ia_css_err
+create_host_yuvpp_pipeline(struct ia_css_pipe *pipe) {

ERROR: that open brace { should be on the previous line
#2964: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7658:
+	if ((!pipe) || (!pipe->stream) || (pipe->mode != IA_CSS_PIPE_ID_YUVPP))
+	{

ERROR: that open brace { should be on the previous line
#2971: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7665:
+	for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++)
+	{

WARNING: Block comments should align the * on each line
#2995: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7677:
+	/* When the input system is 2401, always enable 'in_frameinfo_memory'
+	    * except for the following:

WARNING: line over 80 characters
#3001: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7683:
+	buffered_sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR;

WARNING: line over 80 characters
#3005: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7687:
+	!((sensor && (online || continuous)) || (buffered_sensor && continuous));

WARNING: line over 80 characters
#3010: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7690:
+	need_in_frameinfo_memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;

WARNING: Block comments should align the * on each line
#3019: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7693:
+	/* the input frame can come from:
+	    *  a) memory: connect yuvscaler to me->in_frame

WARNING: line over 80 characters
#3020: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7694:
+	    *  b) sensor, via copy binary: connect yuvscaler to copy binary later on */

WARNING: Block comments use a trailing */ on a separate line
#3020: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7694:
+	    *  b) sensor, via copy binary: connect yuvscaler to copy binary later on */

ERROR: that open brace { should be on the previous line
#3021: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7695:
+	if (need_in_frameinfo_memory)
+	{

WARNING: line over 80 characters
#3026: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7700:
+		    * "pipe->stream->config.input_config.format" represents the sensor output

WARNING: Block comments should align the * on each line
#3026: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7700:
+		/*
+		    * "pipe->stream->config.input_config.format" represents the sensor output

WARNING: line over 80 characters
#3029: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7703:
+		    * "in_frame_format" represents the imaging pipe's input frame format, e.g.

WARNING: line over 80 characters
#3036: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7710:
+			in_frame_format = IA_CSS_FRAME_FORMAT_CSI_MIPI_LEGACY_YUV420_8;

WARNING: line over 80 characters
#3074: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7714:
+			    * When the sensor output frame format is "ATOMISP_INPUT_FORMAT_YUV422_8",

WARNING: line over 80 characters
#3075: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7715:
+			    * the "isp_copy_var" binary is selected as the first stage in the yuvpp

WARNING: line over 80 characters
#3078: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7718:
+			    * For the "isp_copy_var" binary, it reads the YUV422-8 pixels from

WARNING: line over 80 characters
#3079: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7719:
+			    * the frame buffer (at DDR) to the frame-line buffer (at VMEM).

WARNING: line over 80 characters
#3081: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7721:
+			    * By now, the "isp_copy_var" binary does NOT provide a separated

WARNING: line over 80 characters
#3082: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7722:
+			    * frame-line buffer to store the YUV422-8 pixels. Instead, it stores

WARNING: line over 80 characters
#3083: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7723:
+			    * the YUV422-8 pixels in the frame-line buffer which is designed to

WARNING: line over 80 characters
#3086: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7726:
+			    * To direct the "isp_copy_var" binary reading from the RAW frame-line

WARNING: line over 80 characters
#3087: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7727:
+			    * buffer, its input frame format must be specified as "IA_CSS_FRAME_

ERROR: that open brace { should be on the previous line
#3108: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7745:
+	} else
+	{

CHECK: Unbalanced braces around else statement
#3108: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7745:
+	} else

ERROR: that open brace { should be on the previous line
#3113: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7750:
+	for (i = 0; i < num_output_stage; i++)
+	{

WARNING: line over 80 characters
#3117: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7754:
+			err = init_out_frameinfo_defaults(pipe, &me->out_frame[i], i);

WARNING: line over 80 characters
#3152: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7764:
+			err = init_vf_frameinfo_defaults(pipe, &me->vf_frame[i], i);

ERROR: that open brace { should be on the previous line
#3173: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7778:
+	if (pipe->pipe_settings.yuvpp.copy_binary.info)
+	{

WARNING: line over 80 characters
#3191: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7789:
+			ia_css_pipe_util_set_output_frames(bin_out_frame, 0, NULL);

WARNING: line over 80 characters
#3192: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7790:
+			ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,

WARNING: line over 80 characters
#3193: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7791:
+							    bin_out_frame, in_frame_local, NULL);

CHECK: Alignment should match open parenthesis
#3193: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7791:
+			ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
+							    bin_out_frame, in_frame_local, NULL);

WARNING: line over 80 characters
#3195: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7793:
+			ia_css_pipe_util_set_output_frames(bin_out_frame, 0, out_frame[0]);

WARNING: line over 80 characters
#3196: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7794:
+			ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,

WARNING: line over 80 characters
#3197: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7795:
+							    bin_out_frame, in_frame_local, NULL);

CHECK: Alignment should match open parenthesis
#3197: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7795:
+			ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
+							    bin_out_frame, in_frame_local, NULL);

CHECK: Alignment should match open parenthesis
#3201: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7799:
+		err = ia_css_pipeline_create_and_add_stage(me,
+			&stage_desc,

WARNING: line over 80 characters
#3210: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7808:
+			/* if we use yuv scaler binary, vf output should be from there */

WARNING: line over 80 characters
#3214: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7812:
+			/* connect output of copy binary to input of yuv scaler */

ERROR: that open brace { should be on the previous line
#3219: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7817:
+	if (need_scaler)
+	{

WARNING: line over 80 characters
#3241: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7833:
+			err = add_yuv_scaler_stage(pipe, me, tmp_in_frame, tmp_out_frame,

CHECK: Alignment should match open parenthesis
#3242: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7834:
+			err = add_yuv_scaler_stage(pipe, me, tmp_in_frame, tmp_out_frame,
+						    NULL,

WARNING: line over 80 characters
#3261: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7845:
+				if (tmp_vf_frame && (tmp_vf_frame->info.res.width != 0)) {

WARNING: line over 80 characters
#3262: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7846:
+					in_frame = yuv_scaler_stage->args.out_vf_frame;

WARNING: line over 80 characters
#3263: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7847:
+					err = add_vf_pp_stage(pipe, in_frame, tmp_vf_frame, &vf_pp_binary[j],

CHECK: Alignment should match open parenthesis
#3264: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7848:
+					err = add_vf_pp_stage(pipe, in_frame, tmp_vf_frame, &vf_pp_binary[j],
+								&vf_pp_stage);

ERROR: that open brace { should be on the previous line
#3274: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7858:
+	} else if (copy_stage)
+	{

WARNING: line over 80 characters
#3278: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7862:
+			err = add_vf_pp_stage(pipe, in_frame, vf_frame[0], &vf_pp_binary[0],

CHECK: Alignment should match open parenthesis
#3279: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7863:
+			err = add_vf_pp_stage(pipe, in_frame, vf_frame[0], &vf_pp_binary[0],
+						&vf_pp_stage);

WARNING: line over 80 characters
#3302: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7871:
+	ia_css_pipeline_finalize_stages(&pipe->pipeline, pipe->stream->config.continuous);

ERROR: open brace '{' following function definitions go on the next line
#3346: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7878:
+static enum ia_css_err
+create_host_copy_pipeline(struct ia_css_pipe *pipe,
+			    unsigned int max_input_width,
+			    struct ia_css_frame *out_frame) {

CHECK: Alignment should match open parenthesis
#3348: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7880:
+create_host_copy_pipeline(struct ia_css_pipe *pipe,
+			    unsigned int max_input_width,

WARNING: Prefer using '"%s...", __func__' to using 'create_host_copy_pipeline', this function's name, in a string
#3356: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7887:
+			    "create_host_copy_pipeline() enter:\n");

ERROR: that open brace { should be on the previous line
#3377: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7897:
+	if (copy_on_sp(pipe) &&
+	    pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8)
+	{

WARNING: line over 80 characters
#3378: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7898:
+	    pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8)

CHECK: Lines should not end with a '('
#3380: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7900:
+		ia_css_frame_info_init(

ERROR: that open brace { should be on the previous line
#3386: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7906:
+	} else if (out_frame->info.format == IA_CSS_FRAME_FORMAT_RAW)
+	{

WARNING: line over 80 characters
#3403: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7917:
+					    IA_CSS_PIPELINE_RAW_COPY, max_input_width);

CHECK: Alignment should match open parenthesis
#3403: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7917:
+	ia_css_pipe_get_sp_func_stage_desc(&stage_desc, out_frame,
+					    IA_CSS_PIPELINE_RAW_COPY, max_input_width);

CHECK: Alignment should match open parenthesis
#3405: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7919:
+	err = ia_css_pipeline_create_and_add_stage(me,
+		&stage_desc,

WARNING: line over 80 characters
#3422: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7922:
+	ia_css_pipeline_finalize_stages(&pipe->pipeline, pipe->stream->config.continuous);

WARNING: Prefer using '"%s...", __func__' to using 'create_host_copy_pipeline', this function's name, in a string
#3428: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7925:
+			    "create_host_copy_pipeline() leave:\n");

ERROR: open brace '{' following function definitions go on the next line
#3439: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7930:
+static enum ia_css_err
+create_host_isyscopy_capture_pipeline(struct ia_css_pipe *pipe) {

WARNING: line over 80 characters
#3448: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7939:
+	unsigned int max_input_width = MAX_VECTORS_PER_INPUT_LINE_CONT * ISP_VEC_NELEMS;

WARNING: Prefer using '"%s...", __func__' to using 'create_host_isyscopy_capture_pipeline', this function's name, in a string
#3453: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7942:
+			    "create_host_isyscopy_capture_pipeline() enter:\n");

WARNING: line over 80 characters
#3474: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7951:
+	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);

WARNING: line over 80 characters
#3475: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7952:
+	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, thread_id, &queue_id);

WARNING: line over 80 characters
#3486: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7960:
+					    IA_CSS_PIPELINE_ISYS_COPY, max_input_width);

CHECK: Alignment should match open parenthesis
#3486: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7960:
+	ia_css_pipe_get_sp_func_stage_desc(&stage_desc, out_frame,
+					    IA_CSS_PIPELINE_ISYS_COPY, max_input_width);

CHECK: Alignment should match open parenthesis
#3488: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7962:
+	err = ia_css_pipeline_create_and_add_stage(me,
+		&stage_desc, &out_stage);

WARNING: Prefer using '"%s...", __func__' to using 'create_host_isyscopy_capture_pipeline', this function's name, in a string
#3516: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7969:
+			    "create_host_isyscopy_capture_pipeline() leave:\n");

ERROR: open brace '{' following function definitions go on the next line
#3525: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:7974:
+static enum ia_css_err
+create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {

WARNING: line over 80 characters
#3601: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8013:
+	assert(pipe->mode == IA_CSS_PIPE_ID_CAPTURE || pipe->mode == IA_CSS_PIPE_ID_COPY);

WARNING: Block comments should align the * on each line
#3629: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8023:
+	/* When the input system is 2401, always enable 'in_frameinfo_memory'
+	    * except for the following:

WARNING: line over 80 characters
#3636: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8030:
+	buffered_sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR);

WARNING: line over 80 characters
#3640: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8034:
+	!((sensor && (online || continuous)) || (buffered_sensor && (online || continuous)));

WARNING: line over 80 characters
#3645: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8037:
+	need_in_frameinfo_memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;

ERROR: that open brace { should be on the previous line
#3665: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8039:
+	if (need_in_frameinfo_memory)
+	{

WARNING: line over 80 characters
#3668: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8042:
+							IA_CSS_FRAME_FORMAT_RAW);

ERROR: that open brace { should be on the previous line
#3688: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8049:
+	} else
+	{

CHECK: Unbalanced braces around else statement
#3688: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8049:
+	} else

ERROR: that open brace { should be on the previous line
#3694: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8055:
+	if (err != IA_CSS_SUCCESS)
+	{

ERROR: that open brace { should be on the previous line
#3702: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8063:
+	if (pipe->enable_viewfinder[IA_CSS_PIPE_OUTPUT_STAGE_0])
+	{

WARNING: line over 80 characters
#3704: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8065:
+		if (mode == IA_CSS_CAPTURE_MODE_RAW || mode == IA_CSS_CAPTURE_MODE_BAYER) {

ERROR: that open brace { should be on the previous line
#3711: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8072:
+	} else
+	{

CHECK: Unbalanced braces around else statement
#3711: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8072:
+	} else

ERROR: that open brace { should be on the previous line
#3749: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8079:
+	if ((num_primary_stage == 0) && (mode == IA_CSS_CAPTURE_MODE_PRIMARY))
+	{

ERROR: that open brace { should be on the previous line
#3754: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8084:
+	for (i = 0; i < num_primary_stage; i++)
+	{

WARNING: line over 80 characters
#3756: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8086:
+		primary_binary[i] = &pipe->pipe_settings.capture.primary_binary[i];

ERROR: that open brace { should be on the previous line
#3774: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8104:
+	if (pipe->pipe_settings.capture.copy_binary.info)
+	{

WARNING: line over 80 characters
#3777: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8107:
+			ia_css_pipe_util_set_output_frames(out_frames, 0, out_frame);

WARNING: line over 80 characters
#3804: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8111:
+								    out_frames, in_frame, NULL);

WARNING: line over 80 characters
#3806: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8113:
+				in_frame = pipe->stream->last_pipe->continuous_frames[0];

WARNING: line over 80 characters
#3807: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8114:
+				ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,

WARNING: line over 80 characters
#3808: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8115:
+								    out_frames, in_frame, NULL);

CHECK: Alignment should match open parenthesis
#3808: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8115:
+				ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
+								    out_frames, in_frame, NULL);

WARNING: line over 80 characters
#3814: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8118:
+			ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,

WARNING: line over 80 characters
#3815: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8119:
+							    out_frames, NULL, NULL);

CHECK: Alignment should match open parenthesis
#3815: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8119:
+			ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
+							    out_frames, NULL, NULL);

WARNING: line over 80 characters
#3818: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8122:
+			ia_css_pipe_util_set_output_frames(out_frames, 0, in_frame);

WARNING: line over 80 characters
#3819: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8123:
+			ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,

WARNING: line over 80 characters
#3820: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8124:
+							    out_frames, NULL, NULL);

CHECK: Alignment should match open parenthesis
#3820: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8124:
+			ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
+							    out_frames, NULL, NULL);

CHECK: Alignment should match open parenthesis
#3828: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8128:
+		err = ia_css_pipeline_create_and_add_stage(me,
+			&stage_desc,

ERROR: that open brace { should be on the previous line
#3834: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8134:
+	} else if (pipe->stream->config.continuous)
+	{

ERROR: that open brace { should be on the previous line
#3844: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8139:
+	if (mode == IA_CSS_CAPTURE_MODE_PRIMARY)
+	{

WARNING: line over 80 characters
#3859: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8152:
+			if (!need_pp && (i == num_primary_stage - 1) && !need_ldc)

WARNING: line over 80 characters
#3909: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8157:
+			ia_css_pipe_util_set_output_frames(out_frames, 0, local_out_frame);

WARNING: line over 80 characters
#3911: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8159:
+			    * WARNING: The #if def flag has been added below as a

WARNING: Block comments should align the * on each line
#3911: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8159:
+			/*
+			    * WARNING: The #if def flag has been added below as a

WARNING: line over 80 characters
#3912: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8160:
+			    * temporary solution to solve the problem of enabling the

WARNING: line over 80 characters
#3913: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8161:
+			    * view finder in a single binary in a capture flow. The

WARNING: line over 80 characters
#3914: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8162:
+			    * vf-pp stage has been removed from Skycam in the solution

WARNING: line over 80 characters
#3915: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8163:
+			    * provided. The vf-pp stage should be re-introduced when

WARNING: line over 80 characters
#3916: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8164:
+			    * required. This  * should not be considered as a clean solution.

WARNING: line over 80 characters
#3917: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8165:
+			    * Proper investigation should be done to come up with the clean

WARNING: Block comments use a trailing */ on a separate line
#3919: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8167:
+			    * */

WARNING: line over 80 characters
#3920: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8168:
+			ia_css_pipe_get_generic_stage_desc(&stage_desc, primary_binary[i],

WARNING: line over 80 characters
#3921: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8169:
+							    out_frames, local_in_frame, NULL);

CHECK: Alignment should match open parenthesis
#3921: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8169:
+			ia_css_pipe_get_generic_stage_desc(&stage_desc, primary_binary[i],
+							    out_frames, local_in_frame, NULL);

WARNING: Block comments use * on subsequent lines
#3932: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8179:
+		/* If we use copy iso primary,
+		    the input must be yuv iso raw */

WARNING: Block comments use a trailing */ on a separate line
#3932: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8179:
+		    the input must be yuv iso raw */

ERROR: that open brace { should be on the previous line
#3937: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8184:
+	} else if (mode == IA_CSS_CAPTURE_MODE_ADVANCED ||
+		    mode == IA_CSS_CAPTURE_MODE_LOW_LIGHT)
+	{

CHECK: Alignment should match open parenthesis
#3942: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8189:
+		ia_css_pipe_get_generic_stage_desc(&stage_desc, pre_isp_binary,
+						    out_frames, in_frame, NULL);

CHECK: Alignment should match open parenthesis
#3944: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8191:
+		err = ia_css_pipeline_create_and_add_stage(me,
+			&stage_desc, NULL);

CHECK: Alignment should match open parenthesis
#3951: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8198:
+		ia_css_pipe_get_generic_stage_desc(&stage_desc, anr_gdc_binary,
+						    out_frames, NULL, NULL);

CHECK: Alignment should match open parenthesis
#3953: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8200:
+		err = ia_css_pipeline_create_and_add_stage(me,
+			&stage_desc, NULL);

WARNING: line over 80 characters
#3979: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8208:
+			ia_css_pipe_get_generic_stage_desc(&stage_desc, post_isp_binary,

WARNING: line over 80 characters
#3980: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8209:
+							    out_frames, NULL, NULL);

CHECK: Alignment should match open parenthesis
#3980: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8209:
+			ia_css_pipe_get_generic_stage_desc(&stage_desc, post_isp_binary,
+							    out_frames, NULL, NULL);

WARNING: line over 80 characters
#3992: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8212:
+			ia_css_pipe_get_generic_stage_desc(&stage_desc, post_isp_binary,

WARNING: line over 80 characters
#3993: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8213:
+							    out_frames, NULL, NULL);

CHECK: Alignment should match open parenthesis
#3993: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8213:
+			ia_css_pipe_get_generic_stage_desc(&stage_desc, post_isp_binary,
+							    out_frames, NULL, NULL);

CHECK: Alignment should match open parenthesis
#3997: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8217:
+		err = ia_css_pipeline_create_and_add_stage(me,
+			&stage_desc, &current_stage);

ERROR: that open brace { should be on the previous line
#4002: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8222:
+	} else if (mode == IA_CSS_CAPTURE_MODE_BAYER)
+	{

CHECK: Alignment should match open parenthesis
#4006: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8226:
+		ia_css_pipe_get_generic_stage_desc(&stage_desc, pre_isp_binary,
+						    out_frames, in_frame, NULL);

CHECK: Alignment should match open parenthesis
#4008: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8228:
+		err = ia_css_pipeline_create_and_add_stage(me,
+			&stage_desc,

ERROR: that open brace { should be on the previous line
#4020: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8237:
+	if (need_pp && current_stage)
+	{

WARNING: line over 80 characters
#4048: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8246:
+							    out_frames, local_in_frame, NULL);

CHECK: Alignment should match open parenthesis
#4060: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8253:
+		err = add_capture_pp_stage(pipe, me, local_in_frame,
+					    need_yuv_pp ? NULL : out_frame,

ERROR: that open brace { should be on the previous line
#4063: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8256:
+	if (need_ldc && current_stage)
+	{

WARNING: line over 80 characters
#4067: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8260:
+		ia_css_pipe_get_generic_stage_desc(&stage_desc, capture_ldc_binary,

CHECK: Alignment should match open parenthesis
#4068: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8261:
+		ia_css_pipe_get_generic_stage_desc(&stage_desc, capture_ldc_binary,
+						    out_frames, in_frame, NULL);

CHECK: Alignment should match open parenthesis
#4070: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8263:
+		err = ia_css_pipeline_create_and_add_stage(me,
+			&stage_desc,

ERROR: that open brace { should be on the previous line
#4072: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8265:
+	} else if (need_pp && current_stage)
+	{

WARNING: line over 80 characters
#4075: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8268:
+		err = add_capture_pp_stage(pipe, me, in_frame, need_yuv_pp ? NULL : out_frame,

CHECK: Alignment should match open parenthesis
#4076: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8269:
+		err = add_capture_pp_stage(pipe, me, in_frame, need_yuv_pp ? NULL : out_frame,
 #endif

ERROR: that open brace { should be on the previous line
#4101: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8278:
+	if (need_yuv_pp && current_stage)
+	{

WARNING: line over 80 characters
#4103: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8280:
+		struct ia_css_frame *tmp_in_frame = current_stage->args.out_frame[0];

CHECK: Using comparison to true is error prone
#4119: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8284:
+			if (is_output_stage[i] == true)

WARNING: line over 80 characters
#4138: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8289:
+			err = add_yuv_scaler_stage(pipe, me, tmp_in_frame, tmp_out_frame,

CHECK: Alignment should match open parenthesis
#4139: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8290:
+			err = add_yuv_scaler_stage(pipe, me, tmp_in_frame, tmp_out_frame,
+						    NULL,

WARNING: Block comments should align the * on each line
#4170: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8303:
+	/*
+	    * WARNING: The #if def flag has been added below as a

WARNING: Block comments use a trailing */ on a separate line
#4177: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8310:
+	    * */

WARNING: line over 80 characters
#4178: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8311:
+	if (mode != IA_CSS_CAPTURE_MODE_RAW && mode != IA_CSS_CAPTURE_MODE_BAYER && current_stage && vf_frame)

ERROR: that open brace { should be on the previous line
#4178: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8311:
+	if (mode != IA_CSS_CAPTURE_MODE_RAW && mode != IA_CSS_CAPTURE_MODE_BAYER && current_stage && vf_frame)
+	{

CHECK: Alignment should match open parenthesis
#4182: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8315:
+		err = add_vf_pp_stage(pipe, in_frame, vf_frame, vf_pp_binary,
+					&current_stage);

WARNING: line over 80 characters
#4188: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8321:
+	ia_css_pipeline_finalize_stages(&pipe->pipeline, pipe->stream->config.continuous);

WARNING: Prefer using '"%s...", __func__' to using 'create_host_regular_capture_pipeline', this function's name, in a string
#4192: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8324:
+			    "create_host_regular_capture_pipeline() leave:\n");

ERROR: open brace '{' following function definitions go on the next line
#4197: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8329:
+static enum ia_css_err
+create_host_capture_pipeline(struct ia_css_pipe *pipe) {

ERROR: that open brace { should be on the previous line
#4207: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8339:
+	if (err != IA_CSS_SUCCESS)
+	{

CHECK: Lines should not end with a '('
#4223: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8350:
+static enum ia_css_err capture_start(

ERROR: open brace '{' following function definitions go on the next line
#4223: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8350:
+static enum ia_css_err capture_start(
+    struct ia_css_pipe *pipe) {

WARNING: please, no spaces at the start of a line
#4224: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8351:
+    struct ia_css_pipe *pipe) {$

WARNING: line over 80 characters
#4252: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8365:
+	if ((pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_RAW   ||

WARNING: line over 80 characters
#4253: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8366:
+		pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_BAYER) &&

CHECK: Alignment should match open parenthesis
#4253: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8366:
+	if ((pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_RAW   ||
+		pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_BAYER) &&

WARNING: line over 80 characters
#4298: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8396:
+		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);

WARNING: line over 80 characters
#4320: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8403:
+	    * old isys: for IA_CSS_PIPE_MODE_COPY pipe, isys rx has to be configured,

WARNING: Block comments should align the * on each line
#4320: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8403:
+	/*
+	    * old isys: for IA_CSS_PIPE_MODE_COPY pipe, isys rx has to be configured,

WARNING: line over 80 characters
#4321: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8404:
+	    * which is currently done in start_binary(); but COPY pipe contains no binary,

WARNING: line over 80 characters
#4322: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8405:
+	    * and does not call start_binary(); so we need to configure the rx here.

CHECK: Alignment should match open parenthesis
#4327: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8410:
+		ia_css_isys_rx_configure(&pipe->stream->csi_rx_config,
+					    pipe->stream->config.mode);

ERROR: open brace '{' following function definitions go on the next line
#4344: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8419:
+static enum ia_css_err
+sh_css_pipe_get_output_frame_info(struct ia_css_pipe *pipe,
+				    struct ia_css_frame_info *info,
+				    unsigned int idx) {

CHECK: Alignment should match open parenthesis
#4346: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8421:
+sh_css_pipe_get_output_frame_info(struct ia_css_pipe *pipe,
+				    struct ia_css_frame_info *info,

WARNING: Prefer using '"%s...", __func__' to using 'sh_css_pipe_get_output_frame_info', this function's name, in a string
#4368: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8427:
+			    "sh_css_pipe_get_output_frame_info() enter:\n");

ERROR: that open brace { should be on the previous line
#4374: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8430:
+	if (copy_on_sp(pipe) &&
+	    pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8)
+	{

WARNING: line over 80 characters
#4375: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8431:
+	    pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8)

CHECK: Lines should not end with a '('
#4377: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8433:
+		ia_css_frame_info_init(

ERROR: that open brace { should be on the previous line
#4383: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8439:
+	} else if (info->format == IA_CSS_FRAME_FORMAT_RAW ||
+		    info->format == IA_CSS_FRAME_FORMAT_RAW_PACKED)
+	{

WARNING: Prefer using '"%s...", __func__' to using 'sh_css_pipe_get_output_frame_info', this function's name, in a string
#4391: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8447:
+			    "sh_css_pipe_get_output_frame_info() leave:\n");

ERROR: open brace '{' following function definitions go on the next line
#4402: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8452:
+void
+ia_css_stream_send_input_frame(const struct ia_css_stream *stream,
+				const unsigned short *data,
+				unsigned int width,
+				unsigned int height) {

CHECK: Alignment should match open parenthesis
#4404: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8454:
+ia_css_stream_send_input_frame(const struct ia_css_stream *stream,
+				const unsigned short *data,

CHECK: Lines should not end with a '('
#4415: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8459:
+	ia_css_inputfifo_send_input_frame(

ERROR: open brace '{' following function definitions go on the next line
#4425: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8466:
+void
+ia_css_stream_start_input_frame(const struct ia_css_stream *stream) {

CHECK: Lines should not end with a '('
#4434: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8470:
+	ia_css_inputfifo_start_frame(

ERROR: open brace '{' following function definitions go on the next line
#4447: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8476:
+void
+ia_css_stream_send_input_line(const struct ia_css_stream *stream,
+				const unsigned short *data,
+				unsigned int width,
+				const unsigned short *data2,
+				unsigned int width2) {

CHECK: Alignment should match open parenthesis
#4449: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8478:
+ia_css_stream_send_input_line(const struct ia_css_stream *stream,
+				const unsigned short *data,

CHECK: Alignment should match open parenthesis
#4459: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8485:
+	ia_css_inputfifo_send_line(stream->config.channel_id,
+				    data, width, data2, width2);

ERROR: open brace '{' following function definitions go on the next line
#4473: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8488:
+void
+ia_css_stream_send_input_embedded_line(const struct ia_css_stream *stream,
+					enum atomisp_input_format format,
+					const unsigned short *data,
+					unsigned int width) {

CHECK: Alignment should match open parenthesis
#4475: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8490:
+ia_css_stream_send_input_embedded_line(const struct ia_css_stream *stream,
+					enum atomisp_input_format format,

ERROR: open brace '{' following function definitions go on the next line
#4488: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8500:
+void
+ia_css_stream_end_input_frame(const struct ia_css_stream *stream) {

ERROR: open brace '{' following function definitions go on the next line
#4510: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8508:
+static void
+append_firmware(struct ia_css_fw_info **l, struct ia_css_fw_info *firmware) {

WARNING: line over 80 characters
#4521: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8519:
+	/*firmware->next = NULL;*/ /* when multiple acc extensions are loaded, 'next' can be not NULL */

ERROR: open brace '{' following function definitions go on the next line
#4525: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8523:
+static void
+remove_firmware(struct ia_css_fw_info **l, struct ia_css_fw_info *firmware) {

WARNING: line over 80 characters
#4531: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8529:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "remove_firmware() enter:\n");

WARNING: Prefer using '"%s...", __func__' to using 'remove_firmware', this function's name, in a string
#4531: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8529:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "remove_firmware() enter:\n");

WARNING: line over 80 characters
#4533: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8531:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "remove_firmware() leave:\n");

WARNING: Prefer using '"%s...", __func__' to using 'remove_firmware', this function's name, in a string
#4533: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8531:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "remove_firmware() leave:\n");

WARNING: line over 80 characters
#4534: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8532:
+	return; /* removing single and multiple firmware is handled in acc_unload_extension() */

ERROR: open brace '{' following function definitions go on the next line
#4544: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8535:
+static enum ia_css_err upload_isp_code(struct ia_css_fw_info *firmware) {

CHECK: Lines should not end with a '('
#4568: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8550:
+		    (const unsigned char *)(IA_CSS_EXT_ISP_PROG_NAME(

ERROR: open brace '{' following function definitions go on the next line
#4595: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8564:
+static enum ia_css_err
+acc_load_extension(struct ia_css_fw_info *firmware) {

ERROR: that open brace { should be on the previous line
#4603: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8569:
+	while (hd)
+	{

ERROR: open brace '{' following function definitions go on the next line
#4628: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8583:
+static void
+acc_unload_extension(struct ia_css_fw_info *firmware) {

ERROR: open brace '{' following function definitions go on the next line
#4675: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8606:
+static enum ia_css_err
+ia_css_pipe_load_extension(struct ia_css_pipe *pipe,
+			    struct ia_css_fw_info *firmware) {

CHECK: Alignment should match open parenthesis
#4677: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8608:
+ia_css_pipe_load_extension(struct ia_css_pipe *pipe,
+			    struct ia_css_fw_info *firmware) {

ERROR: that open brace { should be on the previous line
#4688: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8613:
+	if ((!firmware) || (!pipe))
+	{

ERROR: that open brace { should be on the previous line
#4698: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8619:
+	if (firmware->info.isp.type == IA_CSS_ACC_OUTPUT)
+	{

CHECK: braces {} should be used on all arms of this statement
#4700: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8621:
+		if (&pipe->output_stage)
[...]
+		else {
[...]

CHECK: Unbalanced braces around else statement
#4702: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8623:
+		else {

ERROR: that open brace { should be on the previous line
#4723: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8627:
+	} else if (firmware->info.isp.type == IA_CSS_ACC_VIEWFINDER)
+	{

CHECK: braces {} should be used on all arms of this statement
#4725: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8629:
+		if (&pipe->vf_stage)
[...]
+		else {
[...]

CHECK: Unbalanced braces around else statement
#4727: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8631:
+		else {

ERROR: open brace '{' following function definitions go on the next line
#4759: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8643:
+static void
+ia_css_pipe_unload_extension(struct ia_css_pipe *pipe,
+				struct ia_css_fw_info *firmware) {

CHECK: Alignment should match open parenthesis
#4761: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8645:
+ia_css_pipe_unload_extension(struct ia_css_pipe *pipe,
+				struct ia_css_fw_info *firmware) {

ERROR: open brace '{' following function definitions go on the next line
#4796: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8663:
+bool
+ia_css_pipeline_uses_params(struct ia_css_pipeline *me) {

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_pipeline_uses_params', this function's name, in a string
#4811: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8670:
+			    "ia_css_pipeline_uses_params() enter: me=%p\n", me);

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_pipeline_uses_params', this function's name, in a string
#4819: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8675:
+					    "ia_css_pipeline_uses_params() leave: return_bool=true\n");

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_pipeline_uses_params', this function's name, in a string
#4823: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8679:
+			    "ia_css_pipeline_uses_params() leave: return_bool=false\n");

ERROR: open brace '{' following function definitions go on the next line
#4830: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8683:
+static enum ia_css_err
+sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
+				const void *acc_fw) {

CHECK: Alignment should match open parenthesis
#4832: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8685:
+sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
+				const void *acc_fw) {

CHECK: Using comparison to false is error prone
#4842: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8690:
+	if (fw->loaded == false)

WARNING: Prefer using '"%s...", __func__' to using 'sh_css_pipeline_add_acc_stage', this function's name, in a string
#4850: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8694:
+			    "sh_css_pipeline_add_acc_stage() enter: pipeline=%p, acc_fw=%p\n",

ERROR: that open brace { should be on the previous line
#4862: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8697:
+	if (err == IA_CSS_SUCCESS)
+	{

CHECK: Alignment should match open parenthesis
#4870: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8703:
+		err = ia_css_pipeline_create_and_add_stage(pipeline,
+			&stage_desc,

WARNING: line over 80 characters
#4880: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8708:
+			    "sh_css_pipeline_add_acc_stage() leave: return_err=%d\n", err);

WARNING: Prefer using '"%s...", __func__' to using 'sh_css_pipeline_add_acc_stage', this function's name, in a string
#4880: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8708:
+			    "sh_css_pipeline_add_acc_stage() leave: return_err=%d\n", err);

WARNING: Block comments should align the * on each line
#4890: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8713:
+/*
+    * @brief Tag a specific frame in continuous capture.

ERROR: open brace '{' following function definitions go on the next line
#4893: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8716:
+enum ia_css_err ia_css_stream_capture_frame(struct ia_css_stream *stream,
+	unsigned int exp_id) {

CHECK: Alignment should match open parenthesis
#4894: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8717:
+enum ia_css_err ia_css_stream_capture_frame(struct ia_css_stream *stream,
+	unsigned int exp_id) {

WARNING: Block comments should align the * on each line
#4956: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8742:
+	/* Enqueue the encoded tag to the host2sp queue.
+	    * Note: The pipe and stage IDs for tag_cmd queue are hard-coded to 0

WARNING: line over 80 characters
#4958: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8744:
+	    * It is mainly because it is enough to have only one tag_cmd queue */

WARNING: Block comments use a trailing */ on a separate line
#4958: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8744:
+	    * It is mainly because it is enough to have only one tag_cmd queue */

WARNING: Block comments should align the * on each line
#4970: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8752:
+/*
+    * @brief Configure the continuous capture.

CHECK: Lines should not end with a '('
#4973: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8755:
+enum ia_css_err ia_css_stream_capture(

ERROR: open brace '{' following function definitions go on the next line
#4973: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8755:
+enum ia_css_err ia_css_stream_capture(
+    struct ia_css_stream *stream,
+    int num_captures,
+    unsigned int skip,
+    int offset) {

WARNING: please, no spaces at the start of a line
#4974: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8756:
+    struct ia_css_stream *stream,$

WARNING: please, no spaces at the start of a line
#4975: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8757:
+    int num_captures,$

WARNING: please, no spaces at the start of a line
#4976: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8758:
+    unsigned int skip,$

WARNING: please, no spaces at the start of a line
#4977: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8759:
+    int offset) {$

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_capture', this function's name, in a string
#4997: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8768:
+			    "ia_css_stream_capture() enter: num_captures=%d, skip=%d, offset=%d\n",

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_capture', this function's name, in a string
#5024: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8788:
+				    "ia_css_stream_capture() leaving:queues unavailable\n");

WARNING: Block comments should align the * on each line
#5029: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8793:
+	/* Enqueue the encoded tag to the host2sp queue.
+	    * Note: The pipe and stage IDs for tag_cmd queue are hard-coded to 0

WARNING: line over 80 characters
#5031: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8795:
+	    * It is mainly because it is enough to have only one tag_cmd queue */

WARNING: Block comments use a trailing */ on a separate line
#5031: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8795:
+	    * It is mainly because it is enough to have only one tag_cmd queue */

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_capture', this function's name, in a string
#5035: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8799:
+			    "ia_css_stream_capture() leave: return_err=%d\n",

ERROR: open brace '{' following function definitions go on the next line
#5041: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8805:
+void ia_css_stream_request_flash(struct ia_css_stream *stream) {

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_request_flash', this function's name, in a string
#5046: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8810:
+			    "ia_css_stream_request_flash() enter: void\n");

CHECK: braces {} should be used on all arms of this statement
#5060: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8815:
+	if (sh_css_sp_is_running()) {
[...]
+	} else
[...]

WARNING: line over 80 characters
#5062: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8817:
+			IA_CSS_ERROR("Call to 'sh-css_write_host2sp_command()' failed");

CHECK: Unbalanced braces around else statement
#5066: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8821:
+	} else

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_request_flash', this function's name, in a string
#5074: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8826:
+			    "ia_css_stream_request_flash() leave: return_void\n");

ERROR: open brace '{' following function definitions go on the next line
#5081: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8829:
+static void
+sh_css_init_host_sp_control_vars(void) {

WARNING: Prefer using '"%s...", __func__' to using 'sh_css_init_host_sp_control_vars', this function's name, in a string
#5111: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8849:
+			    "sh_css_init_host_sp_control_vars() enter: void\n");

WARNING: line over 80 characters
#5125: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8857:
+	HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb = fw->info.sp.invalidate_tlb;

WARNING: line over 80 characters
#5134: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8863:
+	(void)HIVE_ADDR_ia_css_ispctrl_sp_isp_started; /* Suppres warnings in CRUN */

WARNING: line over 80 characters
#5163: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8873:
+				(unsigned int)sp_address_of(ia_css_ispctrl_sp_isp_started),

CHECK: Alignment should match open parenthesis
#5163: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8873:
+	sp_dmem_store_uint32(SP0_ID,
+				(unsigned int)sp_address_of(ia_css_ispctrl_sp_isp_started),

WARNING: line over 80 characters
#5167: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8877:
+				(unsigned int)sp_address_of(host_sp_queues_initialized),

CHECK: Alignment should match open parenthesis
#5167: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8877:
+	sp_dmem_store_uint32(SP0_ID,
+				(unsigned int)sp_address_of(host_sp_queues_initialized),

CHECK: Alignment should match open parenthesis
#5170: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8880:
+	sp_dmem_store_uint32(SP0_ID,
+				(unsigned int)sp_address_of(sp_sleep_mode),

WARNING: line over 80 characters
#5173: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8883:
+				(unsigned int)sp_address_of(ia_css_dmaproxy_sp_invalidate_tlb),

CHECK: Alignment should match open parenthesis
#5173: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8883:
+	sp_dmem_store_uint32(SP0_ID,
+				(unsigned int)sp_address_of(ia_css_dmaproxy_sp_invalidate_tlb),

WARNING: line over 80 characters
#5180: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8887:
+				(unsigned int)sp_address_of(sp_stop_copy_preview),

CHECK: Alignment should match open parenthesis
#5180: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8887:
+	sp_dmem_store_uint32(SP0_ID,
+				(unsigned int)sp_address_of(sp_stop_copy_preview),

WARNING: line over 80 characters
#5181: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8888:
+				my_css.stop_copy_preview ? (uint32_t)(1) : (uint32_t)(0));

WARNING: Prefer using '"%s...", __func__' to using 'sh_css_init_host_sp_control_vars', this function's name, in a string
#5200: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8900:
+			    "sh_css_init_host_sp_control_vars() leave: return_void\n");

WARNING: Block comments should align the * on each line
#5204: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8904:
+/*
+    * create the internal structures and fill in the configuration data

ERROR: open brace '{' following function definitions go on the next line
#5206: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8906:
+void ia_css_pipe_config_defaults(struct ia_css_pipe_config *pipe_config) {

WARNING: line over 80 characters
#5207: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8907:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_pipe_config_defaults()\n");

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_pipe_config_defaults', this function's name, in a string
#5207: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8907:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_pipe_config_defaults()\n");

ERROR: open brace '{' following function definitions go on the next line
#5211: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8911:
+void
+ia_css_pipe_extra_config_defaults(struct ia_css_pipe_extra_config
+				    *extra_config) {

ERROR: open brace '{' following function definitions go on the next line
#5278: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8928:
+void ia_css_stream_config_defaults(struct ia_css_stream_config *stream_config) {

WARNING: line over 80 characters
#5279: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8929:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_config_defaults()\n");

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_config_defaults', this function's name, in a string
#5279: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8929:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_config_defaults()\n");

WARNING: Block comments should align the * on each line
#5286: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8936:
+	/* temporary default value for backwards compatibility.
+	    * This field used to be hardcoded within CSS but this has now

WARNING: Block comments use a trailing */ on a separate line
#5287: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8937:
+	    * been moved to the stream_config struct. */

ERROR: open brace '{' following function definitions go on the next line
#5291: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8941:
+static enum ia_css_err
+ia_css_acc_pipe_create(struct ia_css_pipe *pipe) {

ERROR: that open brace { should be on the previous line
#5295: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8945:
+	if (!pipe)
+	{

WARNING: line over 80 characters
#5305: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8951:
+	/* There is not meaning for num_execs = 0 semantically. Run atleast once. */

ERROR: that open brace { should be on the previous line
#5310: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8955:
+	if (pipe->config.acc_extension)
+	{

WARNING: line over 80 characters
#5312: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8957:
+		err = ia_css_pipe_load_extension(pipe, pipe->config.acc_extension);

ERROR: open brace '{' following function definitions go on the next line
#5321: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8963:
+enum ia_css_err
+ia_css_pipe_create(const struct ia_css_pipe_config *config,
+		    struct ia_css_pipe **pipe) {

CHECK: Alignment should match open parenthesis
#5323: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8965:
+ia_css_pipe_create(const struct ia_css_pipe_config *config,
+		    struct ia_css_pipe **pipe) {

ERROR: that open brace { should be on the previous line
#5337: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8973:
+	if (!config)
+	{

CHECK: Please use a blank line after function/struct/union/enum declarations
#5352: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8982:
+}
+if (!pipe)

ERROR: that open brace { should be on the previous line
#5352: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8982:
+if (!pipe)
+{

ERROR: that open brace { should be on the previous line
#5372: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:8994:
+if (err == IA_CSS_SUCCESS)
+{

ERROR: open brace '{' following function definitions go on the next line
#5393: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9005:
+enum ia_css_err
+ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
+			    const struct ia_css_pipe_extra_config *extra_config,
+			    struct ia_css_pipe **pipe) {

CHECK: Alignment should match open parenthesis
#5395: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9007:
+ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
+			    const struct ia_css_pipe_extra_config *extra_config,

WARNING: line over 80 characters
#5402: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9013:
+	IA_CSS_ENTER_PRIVATE("config = %p, extra_config = %p and pipe = %p", config, extra_config, pipe);

ERROR: that open brace { should be on the previous line
#5411: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9016:
+	if (my_css.pipe_counter >= IA_CSS_PIPELINE_NUM_MAX)
+	{

ERROR: that open brace { should be on the previous line
#5422: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9022:
+	if ((!pipe) || (!config))
+	{

ERROR: that open brace { should be on the previous line
#5440: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9032:
+	if (err != IA_CSS_SUCCESS)
+	{

ERROR: that open brace { should be on the previous line
#5473: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9045:
+	if (config->mode == IA_CSS_PIPE_MODE_ACC)
+	{

WARNING: Block comments should align the * on each line
#5476: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9048:
+		/* Temporary hack to migrate acceleration to CSS 2.0.
+		    * In the future the code for all pipe types should be

WARNING: Block comments use a trailing */ on a separate line
#5477: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9049:
+		    * unified. */

WARNING: line over 80 characters
#5505: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9061:
+	/* Use config value when dvs_frame_delay setting equal to 2, otherwise always 1 by default */

WARNING: line over 80 characters
#5537: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9067:
+	/* we still keep enable_raw_binning for backward compatibility, for any new

WARNING: line over 80 characters
#5538: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9068:
+	    fractional bayer downscaling, we should use bayer_ds_out_res. if both are

WARNING: Block comments use * on subsequent lines
#5538: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9068:
+	/* we still keep enable_raw_binning for backward compatibility, for any new
+	    fractional bayer downscaling, we should use bayer_ds_out_res. if both are

WARNING: line over 80 characters
#5539: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9069:
+	    specified, bayer_ds_out_res will take precedence.if none is specified, we

WARNING: line over 80 characters
#5540: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9070:
+	    set bayer_ds_out_res equal to IF output resolution(IF may do cropping on

WARNING: Block comments use a trailing */ on a separate line
#5541: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9071:
+	    sensor output) or use default decimation factor 1. */

ERROR: that open brace { should be on the previous line
#5542: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9072:
+	if (internal_pipe->extra_config.enable_raw_binning &&
+	    internal_pipe->config.bayer_ds_out_res.width)
+	{

WARNING: line over 80 characters
#5545: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9075:
+		/* fill some code here, if no code is needed, please remove it during integration */

ERROR: that open brace { should be on the previous line
#5549: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9079:
+	if ((internal_pipe->config.vf_pp_in_res.width ||
+		internal_pipe->config.capt_pp_in_res.width))
+	{

CHECK: Alignment should match open parenthesis
#5550: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9080:
+	if ((internal_pipe->config.vf_pp_in_res.width ||
+		internal_pipe->config.capt_pp_in_res.width))

ERROR: that open brace { should be on the previous line
#5616: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9101:
+	if (internal_pipe->config.vf_pp_in_res.width &&
+	    internal_pipe->config.mode == IA_CSS_PIPE_MODE_PREVIEW)
+	{

CHECK: Lines should not end with a '('
#5619: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9104:
+		ia_css_frame_info_init(

ERROR: that open brace { should be on the previous line
#5626: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9111:
+	if (internal_pipe->config.bayer_ds_out_res.width)
+	{

CHECK: Lines should not end with a '('
#5628: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9113:
+		ia_css_frame_info_init(

ERROR: that open brace { should be on the previous line
#5636: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9121:
+	for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++)
+	{

CHECK: Lines should not end with a '('
#5639: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9124:
+			err = sh_css_pipe_configure_output(

WARNING: line over 80 characters
#5641: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9126:
+				    internal_pipe->config.output_info[i].res.width,

WARNING: line over 80 characters
#5642: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9127:
+				    internal_pipe->config.output_info[i].res.height,

WARNING: line over 80 characters
#5643: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9128:
+				    internal_pipe->config.output_info[i].padded_width,

CHECK: Lines should not end with a '('
#5662: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9143:
+			err = sh_css_pipe_configure_viewfinder(

WARNING: line over 80 characters
#5664: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9145:
+				    internal_pipe->config.vf_output_info[i].res.width,

WARNING: line over 80 characters
#5665: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9146:
+				    internal_pipe->config.vf_output_info[i].res.height,

WARNING: line over 80 characters
#5666: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9147:
+				    internal_pipe->config.vf_output_info[i].padded_width,

WARNING: line over 80 characters
#5667: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9148:
+				    internal_pipe->config.vf_output_info[i].format,

ERROR: that open brace { should be on the previous line
#5702: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9158:
+	if (internal_pipe->config.acc_extension)
+	{

WARNING: line over 80 characters
#5705: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9161:
+						    internal_pipe->config.acc_extension);

CHECK: Alignment should match open parenthesis
#5705: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9161:
+		err = ia_css_pipe_load_extension(internal_pipe,
+						    internal_pipe->config.acc_extension);

ERROR: open brace '{' following function definitions go on the next line
#5733: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9177:
+enum ia_css_err
+ia_css_pipe_get_info(const struct ia_css_pipe *pipe,
+			struct ia_css_pipe_info *pipe_info) {

CHECK: Alignment should match open parenthesis
#5735: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9179:
+ia_css_pipe_get_info(const struct ia_css_pipe *pipe,
+			struct ia_css_pipe_info *pipe_info) {

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_pipe_get_info', this function's name, in a string
#5737: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9181:
+			    "ia_css_pipe_get_info()\n");

ERROR: that open brace { should be on the previous line
#5739: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9183:
+	if (!pipe_info)
+	{

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_pipe_get_info', this function's name, in a string
#5742: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9186:
+				    "ia_css_pipe_get_info: pipe_info cannot be NULL\n");

ERROR: that open brace { should be on the previous line
#5745: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9189:
+	if (!pipe || !pipe->stream)
+	{

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_pipe_get_info', this function's name, in a string
#5748: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9192:
+				    "ia_css_pipe_get_info: ia_css_stream_create needs to be called before ia_css_[stream/pipe]_get_info\n");

WARNING: line over 80 characters
#5753: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9197:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_pipe_get_info() leave\n");

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_pipe_get_info', this function's name, in a string
#5753: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9197:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_pipe_get_info() leave\n");

ERROR: open brace '{' following function definitions go on the next line
#5758: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9201:
+bool ia_css_pipe_has_dvs_stats(struct ia_css_pipe_info *pipe_info) {

WARNING: line over 80 characters
#5763: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9206:
+			if (pipe_info->grid_info.dvs_grid.dvs_stat_grid_info.grd_cfg[i].grd_start.enable)

ERROR: open brace '{' following function definitions go on the next line
#5778: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9214:
+enum ia_css_err
+ia_css_pipe_override_frame_format(struct ia_css_pipe *pipe,
+				    int pin_index,
+				    enum ia_css_frame_format new_format) {

CHECK: Alignment should match open parenthesis
#5780: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9216:
+ia_css_pipe_override_frame_format(struct ia_css_pipe *pipe,
+				    int pin_index,

WARNING: line over 80 characters
#5815: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9220:
+	IA_CSS_ENTER_PRIVATE("pipe = %p, pin_index = %d, new_formats = %d", pipe, pin_index, new_format);

ERROR: that open brace { should be on the previous line
#5817: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9222:
+	if (!pipe)
+	{

ERROR: that open brace { should be on the previous line
#5824: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9229:
+	if (0 != pin_index && 1 != pin_index)
+	{

ERROR: that open brace { should be on the previous line
#5831: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9236:
+	if (new_format != IA_CSS_FRAME_FORMAT_NV12_TILEY)
+	{

WARNING: else is not generally useful after a break or return
#5837: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9242:
+		return err;
+	} else

ERROR: that open brace { should be on the previous line
#5837: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9242:
+	} else
+	{

CHECK: Unbalanced braces around else statement
#5837: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9242:
+	} else

WARNING: braces {} are not necessary for any arm of this statement
#5841: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9246:
+			if (pin_index == 0) {
[...]
+			} else {
[...]

ERROR: open brace '{' following function definitions go on the next line
#5859: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9259:
+static enum ia_css_err
+ia_css_stream_configure_rx(struct ia_css_stream *stream) {

ERROR: that open brace { should be on the previous line
#5920: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9288:
+	else
+	{

WARNING: Block comments use a trailing */ on a separate line
#5923: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9291:
+		    * struct */

WARNING: Block comments should align the * on each line
#5923: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9291:
+		/* not implemented yet, requires extension of the rx_cfg_t
+		    * struct */

WARNING: line over 80 characters
#5926: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9294:
+	stream->csi_rx_config.is_two_ppc = (stream->config.pixels_per_clock == 2);

ERROR: open brace '{' following function definitions go on the next line
#5938: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9300:
+static struct ia_css_pipe *
+find_pipe(struct ia_css_pipe *pipes[],
+	    unsigned int num_pipes,
+	    enum ia_css_pipe_mode mode,
+	    bool copy_pipe) {

CHECK: Alignment should match open parenthesis
#5940: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9302:
+find_pipe(struct ia_css_pipe *pipes[],
+	    unsigned int num_pipes,

ERROR: open brace '{' following function definitions go on the next line
#5971: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9319:
+static enum ia_css_err
+ia_css_acc_stream_create(struct ia_css_stream *stream) {

ERROR: that open brace { should be on the previous line
#5983: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9327:
+	if (!stream)
+	{

ERROR: that open brace { should be on the previous line
#5989: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9333:
+	for (i = 0;  i < stream->num_pipes; i++)
+	{

ERROR: that open brace { should be on the previous line
#6023: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9348:
+	if (err != IA_CSS_SUCCESS)
+	{

ERROR: that open brace { should be on the previous line
#6032: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9354:
+	for (i = 0;  i < stream->num_pipes; i++)
+	{

ERROR: that open brace { should be on the previous line
#6050: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9363:
+	if (err != IA_CSS_SUCCESS)
+	{

ERROR: open brace '{' following function definitions go on the next line
#6073: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9376:
+static enum ia_css_err
+metadata_info_init(const struct ia_css_metadata_config *mdc,
+		    struct ia_css_metadata_info *md) {

CHECK: Alignment should match open parenthesis
#6075: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9378:
+metadata_info_init(const struct ia_css_metadata_config *mdc,
+		    struct ia_css_metadata_info *md) {

WARNING: Block comments use a trailing */ on a separate line
#6089: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9385:
+	    * of the port going to DDR, this is a HW requirements (DMA). */

WARNING: Block comments should align the * on each line
#6089: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9385:
+	/* We round up the stride to a multiple of the width
+	    * of the port going to DDR, this is a HW requirements (DMA). */

ERROR: open brace '{' following function definitions go on the next line
#6099: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9392:
+static enum ia_css_err check_pipe_resolutions(const struct ia_css_pipe *pipe) {

WARNING: line over 80 characters
#6139: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9404:
+				    pipe->config.input_effective_res.height) != IA_CSS_SUCCESS) {

CHECK: Alignment should match open parenthesis
#6139: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9404:
+	if (ia_css_util_check_res(pipe->config.input_effective_res.width,
+				    pipe->config.input_effective_res.height) != IA_CSS_SUCCESS) {

CHECK: Lines should not end with a '('
#6144: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9409:
+	if (!ia_css_util_resolution_is_zero(

WARNING: line over 80 characters
#6147: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9412:
+					    pipe->stream->config.input_config.input_res)) {

CHECK: Alignment should match open parenthesis
#6147: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9412:
+		if (!ia_css_util_res_leq(pipe->config.input_effective_res,
+					    pipe->stream->config.input_config.input_res)) {

WARNING: line over 80 characters
#6148: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9413:
+			IA_CSS_ERROR("effective resolution is larger than input resolution");

WARNING: line over 80 characters
#6161: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9423:
+	if (!ia_css_util_resolution_is_even(pipe->config.vf_output_info[0].res)) {

ERROR: open brace '{' following function definitions go on the next line
#6185: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9433:
+enum ia_css_err
+ia_css_stream_create(const struct ia_css_stream_config *stream_config,
+			int num_pipes,
+			struct ia_css_pipe *pipes[],
+			struct ia_css_stream **stream) {

CHECK: Alignment should match open parenthesis
#6187: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9435:
+ia_css_stream_create(const struct ia_css_stream_config *stream_config,
+			int num_pipes,

ERROR: that open brace { should be on the previous line
#6222: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9457:
+	if (num_pipes == 0 ||
+	    !stream ||
+	    !pipes)
+	{

WARNING: line over 80 characters
#6240: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9467:
+	/* We don't support metadata for JPEG stream, since they both use str2mem */

WARNING: line over 80 characters
#6241: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9468:
+	if (stream_config->input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8 &&

ERROR: that open brace { should be on the previous line
#6241: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9468:
+	if (stream_config->input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8 &&
+	    stream_config->metadata_config.resolution.height > 0)
+	{

ERROR: that open brace { should be on the previous line
#6258: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9478:
+	if (stream_config->online && stream_config->pack_raw_pixels)
+	{

WARNING: line over 80 characters
#6260: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9480:
+		IA_CSS_LOG("online and pack raw is invalid on input system 2401");

WARNING: line over 80 characters
#6282: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9496:
+			unsigned int port = (unsigned int)stream_config->source.port.port;

WARNING: line over 80 characters
#6308: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9505:
+				my_css.mipi_frame_size[port] = my_css.size_mem_words;

WARNING: line over 80 characters
#6309: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9506:
+			} else if (stream_config->mipi_buffer_config.size_mem_words != 0) {

WARNING: line over 80 characters
#6310: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9507:
+				my_css.mipi_frame_size[port] = stream_config->mipi_buffer_config.size_mem_words;

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_create', this function's name, in a string
#6313: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9510:
+						    "ia_css_stream_create() exit: error, need to set mipi frame size.\n");

WARNING: line over 80 characters
#6314: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9511:
+				assert(stream_config->mipi_buffer_config.size_mem_words != 0);

WARNING: line over 80 characters
#6336: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9519:
+				    2; /* Temp change: Default for backwards compatibility. */

WARNING: line over 80 characters
#6337: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9520:
+			} else if (stream_config->mipi_buffer_config.nof_mipi_buffers != 0) {

WARNING: line over 80 characters
#6339: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9522:
+				    stream_config->mipi_buffer_config.nof_mipi_buffers;

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_create', this function's name, in a string
#6342: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9525:
+						    "ia_css_stream_create() exit: error, need to set number of mipi frames.\n");

WARNING: line over 80 characters
#6343: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9526:
+				assert(stream_config->mipi_buffer_config.nof_mipi_buffers != 0);

ERROR: that open brace { should be on the previous line
#6360: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9536:
+	if (err != IA_CSS_SUCCESS)
+	{

CHECK: Prefer kmalloc(sizeof(*curr_stream)...) over kmalloc(sizeof(struct ia_css_stream)...)
#6378: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9543:
+	curr_stream = kmalloc(sizeof(struct ia_css_stream), GFP_KERNEL);

ERROR: that open brace { should be on the previous line
#6379: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9544:
+	if (!curr_stream)
+	{

WARNING: line over 80 characters
#6410: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9556:
+	curr_stream->pipes = kcalloc(num_pipes, sizeof(struct ia_css_pipe *), GFP_KERNEL);

ERROR: that open brace { should be on the previous line
#6411: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9557:
+	if (!curr_stream->pipes)
+	{

WARNING: line over 80 characters
#6421: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9567:
+	spcopyonly = (num_pipes == 1) && (pipes[0]->config.mode == IA_CSS_PIPE_MODE_COPY);

ERROR: that open brace { should be on the previous line
#6444: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9581:
+	if (curr_stream->config.online)
+	{

WARNING: line over 80 characters
#6456: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9588:
+	/* in case driver doesn't configure init number of raw buffers, configure it here */

WARNING: line over 80 characters
#6458: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9590:
+		curr_stream->config.target_num_cont_raw_buf = NUM_CONTINUOUS_FRAMES;

WARNING: line over 80 characters
#6460: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9592:
+		curr_stream->config.init_num_cont_raw_buf = curr_stream->config.target_num_cont_raw_buf;

CHECK: Lines should not end with a '('
#6468: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9596:
+		sh_css_sp_configure_enable_raw_pool_locking(

ERROR: that open brace { should be on the previous line
#6477: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9600:
+	switch (curr_stream->config.mode)
+	{

WARNING: line over 80 characters
#6498: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9610:
+		IA_CSS_LOG("tpg_configuration: x_mask=%d, y_mask=%d, x_delta=%d, y_delta=%d, xy_mask=%d",

CHECK: Alignment should match open parenthesis
#6499: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9611:
+		IA_CSS_LOG("tpg_configuration: x_mask=%d, y_mask=%d, x_delta=%d, y_delta=%d, xy_mask=%d",
 			    curr_stream->config.source.tpg.x_mask,

CHECK: Lines should not end with a '('
#6505: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9617:
+		sh_css_sp_configure_tpg(

CHECK: Alignment should match open parenthesis
#6550: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9641:
+	err = aspect_ratio_crop_init(curr_stream,
+					pipes,

ERROR: that open brace { should be on the previous line
#6552: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9643:
+	if (err != IA_CSS_SUCCESS)
+	{

ERROR: that open brace { should be on the previous line
#6558: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9649:
+	for (i = 0; i < num_pipes; i++)
+	{

WARNING: line over 80 characters
#6583: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9660:
+			effective_res = curr_pipe->stream->config.input_config.effective_res;

WARNING: Block comments use a trailing */ on a separate line
#6600: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9664:
+			    * supported on the new input system. */

WARNING: Block comments should align the * on each line
#6600: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9664:
+			/* The aspect ratio cropping is currently only
+			    * supported on the new input system. */

WARNING: line over 80 characters
#6601: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9665:
+			if (aspect_ratio_crop_check(aspect_ratio_crop_enabled, curr_pipe)) {

WARNING: line over 80 characters
#6609: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9673:
+					    * effective resolution from driver. */

WARNING: Block comments use a trailing */ on a separate line
#6609: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9673:
+					    * effective resolution from driver. */

WARNING: Block comments should align the * on each line
#6609: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9673:
+					/* in case of error fallback to default
+					    * effective resolution from driver. */

WARNING: line over 80 characters
#6610: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9674:
+					IA_CSS_LOG("aspect_ratio_crop() failed with err(%d)", err);

CHECK: Alignment should match open parenthesis
#6623: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9681:
+		IA_CSS_LOG("effective_res=%dx%d",
+			    effective_res.width,

ERROR: that open brace { should be on the previous line
#6667: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9702:
+	if (num_pipes == 1 && pipes[0]->config.mode == IA_CSS_PIPE_MODE_ACC)
+	{

ERROR: that open brace { should be on the previous line
#6674: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9709:
+	if (!spcopyonly)
+	{

WARNING: line over 80 characters
#6678: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9713:
+							curr_stream->config.sensor_binning_factor);

CHECK: Alignment should match open parenthesis
#6678: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9713:
+		    sh_css_params_set_binning_factor(curr_stream,
+							curr_stream->config.sensor_binning_factor);

ERROR: that open brace { should be on the previous line
#6679: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9714:
+	} else
+	{

CHECK: Unbalanced braces around else statement
#6679: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9714:
+	} else

WARNING: line over 80 characters
#6705: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9720:
+		    curr_stream->config.sensor_binning_factor, sensor_binning_changed);

CHECK: Alignment should match open parenthesis
#6705: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9720:
+	IA_CSS_LOG("sensor_binning=%d, changed=%d",
+		    curr_stream->config.sensor_binning_factor, sensor_binning_changed);

WARNING: Block comments use a trailing */ on a separate line
#6710: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9725:
+	    * pipe in continuous capture mode. */

WARNING: Block comments should align the * on each line
#6710: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9725:
+	/* Temporary hack: we give the preview pipe a reference to the capture
+	    * pipe in continuous capture mode. */

ERROR: that open brace { should be on the previous line
#6711: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9726:
+	if (curr_stream->config.continuous)
+	{

WARNING: line over 80 characters
#6722: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9737:
+			curr_stream->disable_cont_vf = curr_stream->config.disable_cont_viewfinder;

WARNING: line over 80 characters
#6751: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9743:
+		/* Create copy pipe here, since it may not be exposed to the driver */

CHECK: Alignment should match open parenthesis
#6753: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9745:
+		preview_pipe = find_pipe(pipes, num_pipes,
+					    IA_CSS_PIPE_MODE_PREVIEW, false);

CHECK: Alignment should match open parenthesis
#6755: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9747:
+		video_pipe = find_pipe(pipes, num_pipes,
+					IA_CSS_PIPE_MODE_VIDEO, false);

CHECK: Alignment should match open parenthesis
#6757: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9749:
+		acc_pipe = find_pipe(pipes, num_pipes,
+					IA_CSS_PIPE_MODE_ACC, false);

WARNING: line over 80 characters
#6758: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9750:
+		if (acc_pipe && num_pipes == 2 && curr_stream->cont_capt == true)

CHECK: Using comparison to true is error prone
#6758: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9750:
+		if (acc_pipe && num_pipes == 2 && curr_stream->cont_capt == true)

WARNING: line over 80 characters
#6760: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9752:
+			    false; /* preview + QoS case will not need cont_capt switch */

CHECK: Using comparison to true is error prone
#6761: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9753:
+		if (curr_stream->cont_capt == true) {

WARNING: line over 80 characters
#6763: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9755:
+						    IA_CSS_PIPE_MODE_CAPTURE, false);

CHECK: Alignment should match open parenthesis
#6763: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9755:
+			capture_pipe = find_pipe(pipes, num_pipes,
+						    IA_CSS_PIPE_MODE_CAPTURE, false);

WARNING: line over 80 characters
#6800: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9767:
+		if (preview_pipe && !preview_pipe->pipe_settings.preview.copy_pipe) {

WARNING: line over 80 characters
#6801: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9768:
+			err = create_pipe(IA_CSS_PIPE_MODE_CAPTURE, &copy_pipe, true);

WARNING: line over 80 characters
#6805: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9772:
+			preview_pipe->pipe_settings.preview.copy_pipe = copy_pipe;

WARNING: braces {} are not necessary for single statement blocks
#6814: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9775:
+		if (preview_pipe && (curr_stream->cont_capt == true)) {
+			preview_pipe->pipe_settings.preview.capture_pipe = capture_pipe;
+		}

CHECK: Using comparison to true is error prone
#6814: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9775:
+		if (preview_pipe && (curr_stream->cont_capt == true)) {

WARNING: line over 80 characters
#6815: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9776:
+			preview_pipe->pipe_settings.preview.capture_pipe = capture_pipe;

WARNING: line over 80 characters
#6818: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9779:
+			err = create_pipe(IA_CSS_PIPE_MODE_CAPTURE, &copy_pipe, true);

WARNING: braces {} are not necessary for single statement blocks
#6825: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9786:
+		if (video_pipe && (curr_stream->cont_capt == true)) {
+			video_pipe->pipe_settings.video.capture_pipe = capture_pipe;
+		}

CHECK: Using comparison to true is error prone
#6825: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9786:
+		if (video_pipe && (curr_stream->cont_capt == true)) {

WARNING: line over 80 characters
#6826: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9787:
+			video_pipe->pipe_settings.video.capture_pipe = capture_pipe;

WARNING: braces {} are not necessary for single statement blocks
#6828: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9789:
+		if (preview_pipe && acc_pipe) {
+			preview_pipe->pipe_settings.preview.acc_pipe = acc_pipe;
+		}

ERROR: that open brace { should be on the previous line
#6832: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9793:
+	for (i = 0; i < num_pipes; i++)
+	{

ERROR: that open brace { should be on the previous line
#6864: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9815:
+	for (i = 0; i < num_pipes; i++)
+	{

WARNING: line over 80 characters
#6880: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9829:
+								&pipe_info->output_info[j], j);

WARNING: line over 80 characters
#6897: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9835:
+			pipe_info->output_system_in_res_info = curr_pipe->config.output_system_in_res;

WARNING: line over 80 characters
#6909: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9840:
+								    &pipe_info->shading_info, NULL);

CHECK: Alignment should match open parenthesis
#6909: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9840:
+				err = sh_css_pipe_get_shading_info(curr_pipe,
+								    &pipe_info->shading_info, NULL);

WARNING: line over 80 characters
#6912: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9843:
+								    &pipe_info->shading_info, &curr_pipe->config);

CHECK: Alignment should match open parenthesis
#6912: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9843:
+				err = sh_css_pipe_get_shading_info(curr_pipe,
+								    &pipe_info->shading_info, &curr_pipe->config);

WARNING: line over 80 characters
#6922: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9853:
+									&pipe_info->vf_output_info[j], j);

CHECK: Alignment should match open parenthesis
#6922: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9853:
+				sh_css_pipe_get_viewfinder_frame_info(curr_pipe,
+									&pipe_info->vf_output_info[j], j);

WARNING: line over 80 characters
#6941: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9859:
+		my_css.active_pipes[ia_css_pipe_get_pipe_num(curr_pipe)] = curr_pipe;

ERROR: that open brace { should be on the previous line
#6960: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9866:
+	if (err != IA_CSS_SUCCESS)
+	{

ERROR: that open brace { should be on the previous line
#6973: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9872:
+	for (i = 0; i < num_pipes; i++)
+	{

ERROR: that open brace { should be on the previous line
#6983: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9880:
+	if (err != IA_CSS_SUCCESS)
+	{

WARNING: line over 80 characters
#6985: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9882:
+		IA_CSS_LOG("create_host_pipeline_structure: return_err=%d", err);

WARNING: line over 80 characters
#7016: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9895:
+					IA_CSS_LOG("entered stream into loc=%d", i);

WARNING: line over 80 characters
#7017: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9896:
+					my_css_save.stream_seeds[i].orig_stream = stream;

WARNING: line over 80 characters
#7018: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9897:
+					my_css_save.stream_seeds[i].stream = curr_stream;

WARNING: line over 80 characters
#7019: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9898:
+					my_css_save.stream_seeds[i].num_pipes = num_pipes;

WARNING: line over 80 characters
#7020: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9899:
+					my_css_save.stream_seeds[i].stream_config = *stream_config;

WARNING: line over 80 characters
#7022: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9901:
+						my_css_save.stream_seeds[i].pipe_config[j] = pipes[j]->config;

WARNING: line over 80 characters
#7023: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9902:
+						my_css_save.stream_seeds[i].pipes[j] = pipes[j];

WARNING: line over 80 characters
#7024: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9903:
+						my_css_save.stream_seeds[i].orig_pipes[j] = &pipes[j];

ERROR: open brace '{' following function definitions go on the next line
#7060: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9918:
+enum ia_css_err
+ia_css_stream_destroy(struct ia_css_stream *stream) {

ERROR: that open brace { should be on the previous line
#7073: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9924:
+	if (!stream)
+	{

ERROR: that open brace { should be on the previous line
#7086: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9933:
+	if ((stream->last_pipe) &&
+	    ia_css_pipeline_is_mapped(stream->last_pipe->pipe_num))
+	{

WARNING: line over 80 characters
#7114: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9940:
+			struct sh_css_sp_pipeline_terminal *sp_pipeline_input_terminal;

CHECK: Lines should not end with a '('
#7119: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9945:
+				if (ia_css_pipeline_get_sp_thread_id(

WARNING: line over 80 characters
#7120: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9946:
+					ia_css_pipe_get_pipe_num(entry), &sp_thread_id) != true)

WARNING: line over 80 characters
#7126: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9952:
+				for (i = 0; i < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; i++) {

WARNING: line over 80 characters
#7128: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9954:
+					&sp_pipeline_input_terminal->context.virtual_input_system_stream[i];

WARNING: line over 80 characters
#7129: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9955:
+					if (stream->config.isys_config[i].valid && isys_stream->valid)

WARNING: line over 80 characters
#7130: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9956:
+						ia_css_isys_stream_destroy(isys_stream);

WARNING: line over 80 characters
#7150: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9960:
+		free_mpi = stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR;

WARNING: line over 80 characters
#7152: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9962:
+			free_mpi |= stream->config.mode == IA_CSS_INPUT_MODE_TPG;

WARNING: line over 80 characters
#7153: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9963:
+			free_mpi |= stream->config.mode == IA_CSS_INPUT_MODE_PRBS;

WARNING: line over 80 characters
#7160: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9970:
+				    * some test stream create-destroy cycles do not generate output frames

WARNING: Block comments should align the * on each line
#7160: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9970:
+				/* free any mipi frames that are remaining:
+				    * some test stream create-destroy cycles do not generate output frames

WARNING: line over 80 characters
#7161: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9971:
+				    * and the mipi buffer is not freed in the deque function

ERROR: that open brace { should be on the previous line
#7200: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:9995:
+	for (i = 0; i < stream->num_pipes; i++)
+	{

WARNING: line over 80 characters
#7227: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10006:
+				IA_CSS_LOG("clearing stream on internal preview copy pipe");

WARNING: line over 80 characters
#7228: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10007:
+				entry->pipe_settings.preview.copy_pipe->stream = NULL;

WARNING: line over 80 characters
#7232: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10011:
+				IA_CSS_LOG("clearing stream on internal video copy pipe");

WARNING: line over 80 characters
#7233: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10012:
+				entry->pipe_settings.video.copy_pipe->stream = NULL;

ERROR: that open brace { should be on the previous line
#7276: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10025:
+			if (my_css_save.stream_seeds[i].stream == stream)
+			{

ERROR: open brace '{' following function definitions go on the next line
#7309: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10040:
+enum ia_css_err
+ia_css_stream_get_info(const struct ia_css_stream *stream,
+			struct ia_css_stream_info *stream_info) {

CHECK: Alignment should match open parenthesis
#7311: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10042:
+ia_css_stream_get_info(const struct ia_css_stream *stream,
+			struct ia_css_stream_info *stream_info) {

WARNING: line over 80 characters
#7312: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10043:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_get_info: enter/exit\n");

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_get_info', this function's name, in a string
#7312: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10043:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_get_info: enter/exit\n");

WARNING: Block comments should align the * on each line
#7321: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10052:
+/*
+    * Rebuild a stream, including allocating structs, setting configuration and

WARNING: line over 80 characters
#7324: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10055:
+    * The stream handle is used to identify the correct entry in the css_save struct

ERROR: open brace '{' following function definitions go on the next line
#7326: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10057:
+enum ia_css_err
+ia_css_stream_load(struct ia_css_stream *stream) {

CHECK: Blank lines aren't necessary after an open brace '{'
#7328: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10059:
+ia_css_stream_load(struct ia_css_stream *stream) {
+

WARNING: line over 80 characters
#7338: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10073:
+								    &my_css_save.stream_seeds[i].pipes[j])) != IA_CSS_SUCCESS) {

WARNING: line over 80 characters
#7349: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10084:
+							my_css_save.stream_seeds[i].num_pipes,

WARNING: line over 80 characters
#7350: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10085:
+							my_css_save.stream_seeds[i].pipes,

WARNING: line over 80 characters
#7351: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10086:
+							&my_css_save.stream_seeds[i].stream);

ERROR: open brace '{' following function definitions go on the next line
#7371: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10105:
+enum ia_css_err
+ia_css_stream_start(struct ia_css_stream *stream) {

ERROR: that open brace { should be on the previous line
#7383: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10110:
+	if ((!stream) || (!stream->last_pipe))
+	{

ERROR: that open brace { should be on the previous line
#7402: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10121:
+	if (err != IA_CSS_SUCCESS)
+	{

ERROR: that open brace { should be on the previous line
#7426: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10137:
+	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
+	{

WARNING: line over 80 characters
#7429: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10140:
+		unsigned int port = (unsigned int)(stream->config.source.port.port);

WARNING: line over 80 characters
#7435: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10142:
+		for (idx = 0; idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT; idx++) {

ERROR: that open brace { should be on the previous line
#7449: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10150:
+	if (stream->config.mode != IA_CSS_INPUT_MODE_MEMORY)
+	{

ERROR: open brace '{' following function definitions go on the next line
#7469: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10163:
+enum ia_css_err
+ia_css_stream_stop(struct ia_css_stream *stream) {

WARNING: line over 80 characters
#7478: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10167:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_stop() enter/exit\n");

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_stop', this function's name, in a string
#7478: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10167:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_stop() enter/exit\n");

WARNING: line over 80 characters
#7481: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10170:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_stop: stopping %d\n",

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_stop', this function's name, in a string
#7481: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10170:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_stop: stopping %d\n",

ERROR: that open brace { should be on the previous line
#7491: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10175:
+	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
+	{

WARNING: line over 80 characters
#7494: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10178:
+		unsigned int port = (unsigned int)(stream->config.source.port.port);

WARNING: line over 80 characters
#7499: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10180:
+		for (idx = 0; idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT; idx++) {

WARNING: braces {} are not necessary for single statement blocks
#7499: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10180:
+		for (idx = 0; idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT; idx++) {
+			sh_css_sp_group.config.mipi_sizes_for_check[port][idx] = 0;
 		}

WARNING: line over 80 characters
#7500: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10181:
+			sh_css_sp_group.config.mipi_sizes_for_check[port][idx] = 0;

WARNING: braces {} are not necessary for any arm of this statement
#7508: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10186:
+	if (!atomisp_hw_is_isp2401) {
[...]
+	} else {
[...]

WARNING: line over 80 characters
#7509: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10187:
+		err = ia_css_pipeline_request_stop(&stream->last_pipe->pipeline);

WARNING: Block comments use a trailing */ on a separate line
#7537: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10196:
+	    * semantics do not allow that. */

WARNING: Block comments should align the * on each line
#7537: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10196:
+	/* Ideally, unmapping should happen after pipeline_stop, but current
+	    * semantics do not allow that. */

ERROR: open brace '{' following function definitions go on the next line
#7553: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10202:
+bool
+ia_css_stream_has_stopped(struct ia_css_stream *stream) {

WARNING: braces {} are not necessary for any arm of this statement
#7580: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10208:
+	if (!atomisp_hw_is_isp2401) {
[...]
+	} else {
[...]

WARNING: line over 80 characters
#7581: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10209:
+		stopped = ia_css_pipeline_has_stopped(&stream->last_pipe->pipeline);

WARNING: Block comments should align the * on each line
#7602: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10219:
+/*
+    * Destroy the stream and all the pipes related to it.

WARNING: line over 80 characters
#7603: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10220:
+    * The stream handle is used to identify the correct entry in the css_save struct

ERROR: open brace '{' following function definitions go on the next line
#7605: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10222:
+enum ia_css_err
+ia_css_stream_unload(struct ia_css_stream *stream) {

WARNING: line over 80 characters
#7614: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10227:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_unload() enter,\n");

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_unload', this function's name, in a string
#7614: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10227:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_unload() enter,\n");

ERROR: that open brace { should be on the previous line
#7618: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10231:
+		if (my_css_save.stream_seeds[i].stream == stream)
+		{

WARNING: line over 80 characters
#7627: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10236:
+					    "ia_css_stream_unload(): unloading %d (%p)\n", i,

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_unload', this function's name, in a string
#7627: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10236:
+					    "ia_css_stream_unload(): unloading %d (%p)\n", i,

WARNING: line over 80 characters
#7630: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10239:
+			for (j = 0; j < my_css_save.stream_seeds[i].num_pipes; j++)

WARNING: line over 80 characters
#7631: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10240:
+				ia_css_pipe_destroy(my_css_save.stream_seeds[i].pipes[j]);

WARNING: line over 80 characters
#7633: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10242:
+					    "ia_css_stream_unload(): after unloading %d (%p)\n", i,

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_unload', this function's name, in a string
#7633: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10242:
+					    "ia_css_stream_unload(): after unloading %d (%p)\n", i,

WARNING: line over 80 characters
#7637: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10246:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_unload() exit,\n");

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_stream_unload', this function's name, in a string
#7637: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10246:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_unload() exit,\n");

ERROR: open brace '{' following function definitions go on the next line
#7645: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10250:
+enum ia_css_err
+ia_css_temp_pipe_to_pipe_id(const struct ia_css_pipe *pipe,
+			    enum ia_css_pipe_id *pipe_id) {

WARNING: line over 80 characters
#7648: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10253:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_temp_pipe_to_pipe_id() enter/exit\n");

WARNING: Prefer using '"%s...", __func__' to using 'ia_css_temp_pipe_to_pipe_id', this function's name, in a string
#7648: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10253:
+	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_temp_pipe_to_pipe_id() enter/exit\n");

ERROR: open brace '{' following function definitions go on the next line
#7659: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10262:
+enum atomisp_input_format
+ia_css_stream_get_format(const struct ia_css_stream *stream) {

ERROR: open brace '{' following function definitions go on the next line
#7670: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10267:
+bool
+ia_css_stream_get_two_pixels_per_clock(const struct ia_css_stream *stream) {

ERROR: open brace '{' following function definitions go on the next line
#7677: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10272:
+struct ia_css_binary *
+ia_css_stream_get_shading_correction_binary(const struct ia_css_stream
+	*stream) {

ERROR: open brace '{' following function definitions go on the next line
#7716: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10291:
+struct ia_css_binary *
+ia_css_stream_get_dvs_binary(const struct ia_css_stream *stream) {

ERROR: open brace '{' following function definitions go on the next line
#7741: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10310:
+struct ia_css_binary *
+ia_css_stream_get_3a_binary(const struct ia_css_stream *stream) {

ERROR: open brace '{' following function definitions go on the next line
#7770: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10331:
+enum ia_css_err
+ia_css_stream_set_output_padded_width(struct ia_css_stream *stream,
+					unsigned int output_padded_width) {

CHECK: Alignment should match open parenthesis
#7772: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10333:
+ia_css_stream_set_output_padded_width(struct ia_css_stream *stream,
+					unsigned int output_padded_width) {

WARNING: line over 80 characters
#7790: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10342:
+	/* set the config also just in case (redundant info? why do we save config in pipe?) */

WARNING: line over 80 characters
#7791: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10343:
+	pipe->config.output_info[IA_CSS_PIPE_OUTPUT_STAGE_0].padded_width = output_padded_width;

WARNING: line over 80 characters
#7792: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10344:
+	pipe->output_info[IA_CSS_PIPE_OUTPUT_STAGE_0].padded_width = output_padded_width;

ERROR: open brace '{' following function definitions go on the next line
#7814: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10349:
+static struct ia_css_binary *
+ia_css_pipe_get_shading_correction_binary(const struct ia_css_pipe *pipe) {

WARNING: line over 80 characters
#7822: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10357:
+		binary = (struct ia_css_binary *)&pipe->pipe_settings.preview.preview_binary;

WARNING: line over 80 characters
#7825: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10360:
+		binary = (struct ia_css_binary *)&pipe->pipe_settings.video.video_binary;

WARNING: line over 80 characters
#7828: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10363:
+		if (pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_PRIMARY) {

WARNING: line over 80 characters
#7831: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10366:
+			for (i = 0; i < pipe->pipe_settings.capture.num_primary_stage; i++) {

WARNING: line over 80 characters
#7832: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10367:
+				if (pipe->pipe_settings.capture.primary_binary[i].info->sp.enable.sc) {

WARNING: line over 80 characters
#7833: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10368:
+					binary = (struct ia_css_binary *)&pipe->pipe_settings.capture.primary_binary[i];

WARNING: line over 80 characters
#7852: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10374:
+			binary = (struct ia_css_binary *)&pipe->pipe_settings.capture.pre_isp_binary;

WARNING: line over 80 characters
#7855: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10377:
+			    pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_LOW_LIGHT) {

WARNING: line over 80 characters
#7856: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10378:
+			if (pipe->config.isp_pipe_version == IA_CSS_PIPE_VERSION_1)

WARNING: line over 80 characters
#7857: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10379:
+				binary = (struct ia_css_binary *)&pipe->pipe_settings.capture.pre_isp_binary;

WARNING: line over 80 characters
#7858: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10380:
+			else if (pipe->config.isp_pipe_version == IA_CSS_PIPE_VERSION_2_2)

WARNING: line over 80 characters
#7859: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10381:
+				binary = (struct ia_css_binary *)&pipe->pipe_settings.capture.post_isp_binary;

ERROR: open brace '{' following function definitions go on the next line
#7879: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10394:
+static struct ia_css_binary *
+ia_css_pipe_get_s3a_binary(const struct ia_css_pipe *pipe) {

WARNING: line over 80 characters
#7904: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10402:
+		binary = (struct ia_css_binary *)&pipe->pipe_settings.preview.preview_binary;

WARNING: line over 80 characters
#7907: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10405:
+		binary = (struct ia_css_binary *)&pipe->pipe_settings.video.video_binary;

WARNING: line over 80 characters
#7910: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10408:
+		if (pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_PRIMARY) {

WARNING: line over 80 characters
#7913: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10411:
+			for (i = 0; i < pipe->pipe_settings.capture.num_primary_stage; i++) {

WARNING: line over 80 characters
#7914: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10412:
+				if (pipe->pipe_settings.capture.primary_binary[i].info->sp.enable.s3a) {

WARNING: line over 80 characters
#7915: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10413:
+					binary = (struct ia_css_binary *)&pipe->pipe_settings.capture.primary_binary[i];

WARNING: line over 80 characters
#7936: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10419:
+			binary = (struct ia_css_binary *)&pipe->pipe_settings.capture.pre_isp_binary;

WARNING: line over 80 characters
#7939: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10422:
+			    pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_LOW_LIGHT) {

WARNING: line over 80 characters
#7940: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10423:
+			if (pipe->config.isp_pipe_version == IA_CSS_PIPE_VERSION_1)

WARNING: line over 80 characters
#7941: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10424:
+				binary = (struct ia_css_binary *)&pipe->pipe_settings.capture.pre_isp_binary;

WARNING: line over 80 characters
#7942: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10425:
+			else if (pipe->config.isp_pipe_version == IA_CSS_PIPE_VERSION_2_2)

WARNING: line over 80 characters
#7943: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10426:
+				binary = (struct ia_css_binary *)&pipe->pipe_settings.capture.post_isp_binary;

ERROR: open brace '{' following function definitions go on the next line
#7974: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10441:
+static struct ia_css_binary *
+ia_css_pipe_get_sdis_binary(const struct ia_css_pipe *pipe) {

WARNING: line over 80 characters
#7985: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10449:
+		binary = (struct ia_css_binary *)&pipe->pipe_settings.video.video_binary;

ERROR: open brace '{' following function definitions go on the next line
#8005: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10461:
+struct ia_css_pipeline *
+ia_css_pipe_get_pipeline(const struct ia_css_pipe *pipe) {

ERROR: open brace '{' following function definitions go on the next line
#8020: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10468:
+unsigned int
+ia_css_pipe_get_pipe_num(const struct ia_css_pipe *pipe) {

WARNING: Block comments use * on subsequent lines
#8027: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10473:
+	/* KW was not sure this function was not returning a value
+	    that was out of range; so added an assert, and, for the

ERROR: open brace '{' following function definitions go on the next line
#8044: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10485:
+unsigned int
+ia_css_pipe_get_isp_pipe_version(const struct ia_css_pipe *pipe) {

ERROR: open brace '{' following function definitions go on the next line
#8057: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10494:
+enum ia_css_err
+ia_css_start_sp(void) {

WARNING: line over 80 characters
#8081: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10504:
+	while ((ia_css_spctrl_get_state(SP0_ID) != IA_CSS_SP_SW_INITIALIZED) && timeout)

ERROR: that open brace { should be on the previous line
#8081: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10504:
+	while ((ia_css_spctrl_get_state(SP0_ID) != IA_CSS_SP_SW_INITIALIZED) && timeout)
+	{

ERROR: that open brace { should be on the previous line
#8086: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10509:
+	if (timeout == 0)
+	{

WARNING: line over 80 characters
#8103: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10521:
+	/* AM: At the moment it will be done only when there is no stream active. */

WARNING: Block comments should align the * on each line
#8123: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10531:
+/*
+    *	Time to wait SP for termincate. Only condition when this can happen

ERROR: open brace '{' following function definitions go on the next line
#8133: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10537:
+enum ia_css_err
+ia_css_stop_sp(void) {

ERROR: that open brace { should be on the previous line
#8145: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10544:
+	if (!sh_css_sp_is_running())
+	{

WARNING: line over 80 characters
#8153: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10549:
+		/* Return an error - stop SP should not have been called by driver */

ERROR: that open brace { should be on the previous line
#8206: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10568:
+	while (!ia_css_spctrl_is_idle(SP0_ID) && timeout)
+	{

WARNING: Unnecessary parentheses
#8211: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10573:
+	if ((ia_css_spctrl_get_state(SP0_ID) != IA_CSS_SP_SW_TERMINATED))

ERROR: that open brace { should be on the previous line
#8216: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10576:
+	if (timeout == 0)
+	{

ERROR: that open brace { should be on the previous line
#8222: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10582:
+	while (!isp_ctrl_getbit(ISP0_ID, ISP_SC_REG, ISP_IDLE_BIT) && timeout)
+	{

ERROR: that open brace { should be on the previous line
#8227: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10587:
+	if (timeout == 0)
+	{

ERROR: open brace '{' following function definitions go on the next line
#8257: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10602:
+enum ia_css_err
+ia_css_update_continuous_frames(struct ia_css_stream *stream) {

CHECK: Lines should not end with a '('
#8270: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10607:
+	ia_css_debug_dtrace(

ERROR: that open brace { should be on the previous line
#8274: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10611:
+	if (!stream)
+	{

ERROR: that open brace { should be on the previous line
#8286: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10621:
+	for (i = stream->config.init_num_cont_raw_buf;
+		i < stream->config.target_num_cont_raw_buf; i++)
+	{

WARNING: line over 80 characters
#8290: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10625:
+						    pipe->continuous_frames[i], pipe->cont_md_buffers[i]);

CHECK: Lines should not end with a '('
#8294: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10629:
+	ia_css_debug_dtrace(

ERROR: open brace '{' following function definitions go on the next line
#8308: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10636:
+void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map) {

WARNING: line over 80 characters
#8330: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10653:
+	need_input_queue = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;

WARNING: line over 80 characters
#8345: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10660:
+			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_INPUT_FRAME, map);

WARNING: line over 80 characters
#8346: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10661:
+		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, map);

WARNING: line over 80 characters
#8347: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10662:
+		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PARAMETER_SET, map);

WARNING: line over 80 characters
#8348: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10663:
+		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PER_FRAME_PARAMETER_SET, map);

WARNING: line over 80 characters
#8359: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10668:
+		    pipe->pipe_settings.preview.preview_binary.info->sp.enable.s3a)

WARNING: line over 80 characters
#8360: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10669:
+			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_3A_STATISTICS, map);

WARNING: line over 80 characters
#8371: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10674:
+			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_INPUT_FRAME, map);

WARNING: line over 80 characters
#8372: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10675:
+		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, map);

WARNING: line over 80 characters
#8373: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10676:
+		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME, map);

WARNING: line over 80 characters
#8374: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10677:
+		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PARAMETER_SET, map);

WARNING: line over 80 characters
#8375: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10678:
+		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PER_FRAME_PARAMETER_SET, map);

WARNING: line over 80 characters
#8395: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10682:
+		if (pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_PRIMARY) {

WARNING: line over 80 characters
#8396: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10683:
+			for (i = 0; i < pipe->pipe_settings.capture.num_primary_stage; i++) {

WARNING: line over 80 characters
#8397: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10684:
+				if (pipe->pipe_settings.capture.primary_binary[i].info &&

WARNING: line over 80 characters
#8398: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10685:
+				    pipe->pipe_settings.capture.primary_binary[i].info->sp.enable.s3a) {

WARNING: line over 80 characters
#8418: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10692:
+			    pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_LOW_LIGHT ||

WARNING: line over 80 characters
#8419: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10693:
+			    pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_BAYER) {

WARNING: line over 80 characters
#8421: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10695:
+			    pipe->pipe_settings.capture.pre_isp_binary.info->sp.enable.s3a)

WARNING: line over 80 characters
#8435: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10700:
+			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_INPUT_FRAME, map);

WARNING: line over 80 characters
#8436: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10701:
+		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, map);

WARNING: line over 80 characters
#8438: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10703:
+			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME, map);

WARNING: line over 80 characters
#8439: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10704:
+		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PARAMETER_SET, map);

WARNING: line over 80 characters
#8440: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10705:
+		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PER_FRAME_PARAMETER_SET, map);

WARNING: line over 80 characters
#8451: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10711:
+			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_3A_STATISTICS, map);

WARNING: line over 80 characters
#8455: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10715:
+			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_DIS_STATISTICS, map);

WARNING: line over 80 characters
#8458: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10718:
+			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_INPUT_FRAME, map);

WARNING: line over 80 characters
#8469: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10726:
+			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_INPUT_FRAME, map);

WARNING: line over 80 characters
#8470: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10727:
+		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, map);

WARNING: line over 80 characters
#8471: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10728:
+		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PARAMETER_SET, map);

WARNING: line over 80 characters
#8472: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10729:
+		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PER_FRAME_PARAMETER_SET, map);

WARNING: line over 80 characters
#8490: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10737:
+			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_OUTPUT_FRAME + idx, map);

WARNING: line over 80 characters
#8492: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10739:
+				ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME + idx, map);

WARNING: line over 80 characters
#8495: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10742:
+			ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_INPUT_FRAME, map);

WARNING: line over 80 characters
#8496: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10743:
+		ia_css_queue_map(thread_id, IA_CSS_BUFFER_TYPE_PARAMETER_SET, map);

ERROR: open brace '{' following function definitions go on the next line
#8526: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10752:
+static enum ia_css_err set_config_on_frame_enqueue(struct ia_css_frame_info
+	*info, struct frame_data_wrapper *frame) {

WARNING: line over 80 characters
#8530: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10756:
+	/* currently we support configuration on frame enqueue only on YUV formats */

WARNING: line over 80 characters
#8531: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10757:
+	/* on other formats the padded_width is zeroed for no configuration override */

WARNING: braces {} are not necessary for any arm of this statement
#8535: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10761:
+		if (info->padded_width > info->res.width) {
[...]
+		} else if ((info->padded_width < info->res.width) && (info->padded_width > 0)) {
[...]

WARNING: line over 80 characters
#8536: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10762:
+			frame->config_on_frame_enqueue.padded_width = info->padded_width;

WARNING: line over 80 characters
#8537: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10763:
+		} else if ((info->padded_width < info->res.width) && (info->padded_width > 0)) {

WARNING: line over 80 characters
#8542: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10766:
+		/* nothing to do if width == padded width or padded width is zeroed (the same) */

ERROR: open brace '{' following function definitions go on the next line
#8555: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10776:
+enum ia_css_err
+ia_css_unlock_raw_frame(struct ia_css_stream *stream, uint32_t exp_id) {

WARNING: Block comments use a trailing */ on a separate line
#8570: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10783:
+	    * unlock message. */

WARNING: Block comments should align the * on each line
#8570: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10783:
+	/* Only continuous streams have a tagger to which we can send the
+	    * unlock message. */

ERROR: that open brace { should be on the previous line
#8571: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10784:
+	if (!stream || !stream->config.continuous)
+	{

ERROR: that open brace { should be on the previous line
#8583: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10790:
+	if (exp_id > IA_CSS_ISYS_MAX_EXPOSURE_ID ||
+	    exp_id < IA_CSS_ISYS_MIN_EXPOSURE_ID)
+	{

WARNING: Block comments use a trailing */ on a separate line
#8595: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10798:
+	    * we can safely assign it to an 8-bit argument here. */

WARNING: Block comments should align the * on each line
#8595: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10798:
+	/* Send the event. Since we verified that the exp_id is valid,
+	    * we can safely assign it to an 8-bit argument here. */

CHECK: Lines should not end with a '('
#8596: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10799:
+	ret = ia_css_bufq_enqueue_psys_event(

WARNING: Block comments should align the * on each line
#8616: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10807:
+/* @brief	Set the state (Enable or Disable) of the Extension stage in the
+    *		given pipe.

ERROR: open brace '{' following function definitions go on the next line
#8618: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10809:
+enum ia_css_err
+ia_css_pipe_set_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
+				bool enable) {

CHECK: Alignment should match open parenthesis
#8620: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10811:
+ia_css_pipe_set_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
+				bool enable) {

ERROR: that open brace { should be on the previous line
#8647: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10819:
+	if (!pipe || !pipe->stream)
+	{

ERROR: that open brace { should be on the previous line
#8651: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10823:
+	} else if (!(pipe->config.acc_extension))
+	{

ERROR: that open brace { should be on the previous line
#8655: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10827:
+	} else if (!sh_css_sp_is_running())
+	{

ERROR: that open brace { should be on the previous line
#8659: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10831:
+	} else
+	{

CHECK: Unbalanced braces around else statement
#8659: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10831:
+	} else

WARNING: line over 80 characters
#8662: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10834:
+		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);

WARNING: line over 80 characters
#8663: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10835:
+		err = ia_css_pipeline_get_stage_from_fw(&pipe->pipeline, fw_handle, &stage);

WARNING: line over 80 characters
#8665: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10837:
+			/* Set the Extension State;. TODO: Add check for stage firmware.type (QOS)*/

CHECK: Lines should not end with a '('
#8666: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10838:
+			err = ia_css_bufq_enqueue_psys_event(

WARNING: line over 80 characters
#8685: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10845:
+					SH_CSS_QOS_STAGE_ENABLE(&sh_css_sp_group.pipe[thread_id], stage->stage_num);

WARNING: line over 80 characters
#8687: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10847:
+					SH_CSS_QOS_STAGE_DISABLE(&sh_css_sp_group.pipe[thread_id], stage->stage_num);

WARNING: Block comments should align the * on each line
#8707: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10856:
+/*	@brief	Get the state (Enable or Disable) of the Extension stage in the
+    *	given pipe.

ERROR: open brace '{' following function definitions go on the next line
#8709: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10858:
+enum ia_css_err
+ia_css_pipe_get_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
+				bool *enable) {

CHECK: Alignment should match open parenthesis
#8711: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10860:
+ia_css_pipe_get_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
+				bool *enable) {

ERROR: that open brace { should be on the previous line
#8738: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10868:
+	if (!pipe || !pipe->stream)
+	{

ERROR: that open brace { should be on the previous line
#8742: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10872:
+	} else if (!(pipe->config.acc_extension))
+	{

ERROR: that open brace { should be on the previous line
#8746: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10876:
+	} else if (!sh_css_sp_is_running())
+	{

ERROR: that open brace { should be on the previous line
#8750: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10880:
+	} else
+	{

CHECK: Unbalanced braces around else statement
#8750: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10880:
+	} else

WARNING: line over 80 characters
#8752: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10882:
+		/* Query the threadid and stage_num corresponding to the Extension firmware*/

WARNING: line over 80 characters
#8753: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10883:
+		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);

WARNING: line over 80 characters
#8754: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10884:
+		err = ia_css_pipeline_get_stage_from_fw(&pipe->pipeline, fw_handle, &stage);

WARNING: line over 80 characters
#8763: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10888:
+			*enable = (SH_CSS_QOS_STAGE_IS_ENABLED(&sh_css_sp_group.pipe[thread_id],

WARNING: line over 80 characters
#8764: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10889:
+								stage->stage_num)) ? true : false;

ERROR: open brace '{' following function definitions go on the next line
#8793: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10897:
+enum ia_css_err
+ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
+					uint32_t fw_handle,
+					struct ia_css_isp_param_css_segments *css_seg,
+					struct ia_css_isp_param_isp_segments *isp_seg) {

CHECK: Alignment should match open parenthesis
#8795: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10899:
+ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
+					uint32_t fw_handle,

CHECK: Prefer kernel type 'u32' over 'uint32_t'
#8795: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10899:
+					uint32_t fw_handle,

WARNING: line over 80 characters
#8796: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10900:
+					struct ia_css_isp_param_css_segments *css_seg,

WARNING: line over 80 characters
#8797: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10901:
+					struct ia_css_isp_param_isp_segments *isp_seg) {

ERROR: that open brace { should be on the previous line
#8869: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10919:
+	if (!pipe || !pipe->stream)
+	{

ERROR: that open brace { should be on the previous line
#8873: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10923:
+	} else if (!(pipe->config.acc_extension))
+	{

ERROR: that open brace { should be on the previous line
#8877: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10927:
+	} else if (!sh_css_sp_is_running())
+	{

ERROR: that open brace { should be on the previous line
#8881: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10931:
+	} else
+	{

CHECK: Unbalanced braces around else statement
#8881: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10931:
+	} else

WARNING: line over 80 characters
#8883: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10933:
+		/* Query the thread_id and stage_num corresponding to the Extension firmware */

WARNING: line over 80 characters
#8884: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10934:
+		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);

WARNING: line over 80 characters
#8885: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10935:
+		err = ia_css_pipeline_get_stage_from_fw(&pipe->pipeline, fw_handle, &stage);

WARNING: line over 80 characters
#8888: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10938:
+			enabled = (SH_CSS_QOS_STAGE_IS_ENABLED(&sh_css_sp_group.pipe[thread_id],

WARNING: line over 80 characters
#8889: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10939:
+								stage->stage_num)) ? true : false;

WARNING: line over 80 characters
#8890: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10940:
+			/* Update mapped arg only when extension stage is not enabled */

WARNING: line over 80 characters
#8892: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10942:
+				IA_CSS_ERROR("Leaving: cannot update when stage is enabled.");

WARNING: line over 80 characters
#8899: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10949:
+						(unsigned int)sp_address_of(sp_group),

CHECK: Alignment should match open parenthesis
#8899: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10949:
+				sp_dmem_load(SP0_ID,
+						(unsigned int)sp_address_of(sp_group),

WARNING: line over 80 characters
#8900: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10950:
+						&sp_group, sizeof(struct sh_css_sp_group));

WARNING: line over 80 characters
#8901: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10951:
+				mmgr_load(sp_group.pipe[thread_id].sp_stage_addr[stage_num],

WARNING: line over 80 characters
#8902: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10952:
+					    &sp_stage, sizeof(struct sh_css_sp_stage));

CHECK: Alignment should match open parenthesis
#8902: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10952:
+				mmgr_load(sp_group.pipe[thread_id].sp_stage_addr[stage_num],
+					    &sp_stage, sizeof(struct sh_css_sp_stage));

WARNING: line over 80 characters
#8905: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10955:
+					    &isp_stage, sizeof(struct sh_css_isp_stage));

CHECK: Alignment should match open parenthesis
#8905: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10955:
+				mmgr_load(sp_stage.isp_stage_addr,
+					    &isp_stage, sizeof(struct sh_css_isp_stage));

WARNING: line over 80 characters
#8907: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10957:
+				for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++) {

WARNING: line over 80 characters
#8908: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10958:
+					isp_stage.mem_initializers.params[IA_CSS_PARAM_CLASS_PARAM][mem].address =

WARNING: line over 80 characters
#8909: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10959:
+					    css_seg->params[IA_CSS_PARAM_CLASS_PARAM][mem].address;

WARNING: line over 80 characters
#8910: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10960:
+					isp_stage.mem_initializers.params[IA_CSS_PARAM_CLASS_PARAM][mem].size =

WARNING: line over 80 characters
#8911: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10961:
+					    css_seg->params[IA_CSS_PARAM_CLASS_PARAM][mem].size;

WARNING: line over 80 characters
#8912: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10962:
+					isp_stage.binary_info.mem_initializers.params[IA_CSS_PARAM_CLASS_PARAM][mem].address

WARNING: line over 80 characters
#8914: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10964:
+						isp_seg->params[IA_CSS_PARAM_CLASS_PARAM][mem].address;

WARNING: line over 80 characters
#8915: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10965:
+					isp_stage.binary_info.mem_initializers.params[IA_CSS_PARAM_CLASS_PARAM][mem].size

WARNING: line over 80 characters
#8917: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10967:
+						isp_seg->params[IA_CSS_PARAM_CLASS_PARAM][mem].size;

WARNING: line over 80 characters
#8921: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10971:
+					    &isp_stage, sizeof(struct sh_css_isp_stage));

CHECK: Alignment should match open parenthesis
#8921: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10971:
+				mmgr_store(sp_stage.isp_stage_addr,
+					    &isp_stage, sizeof(struct sh_css_isp_stage));

ERROR: open brace '{' following function definitions go on the next line
#8950: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10980:
+static enum ia_css_err
+aspect_ratio_crop_init(struct ia_css_stream *curr_stream,
+			struct ia_css_pipe *pipes[],
+			bool *do_crop_status) {

CHECK: Alignment should match open parenthesis
#8952: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10982:
+aspect_ratio_crop_init(struct ia_css_stream *curr_stream,
+			struct ia_css_pipe *pipes[],

ERROR: that open brace { should be on the previous line
#8964: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10989:
+	if ((!curr_stream) ||
+	    (curr_stream->num_pipes == 0) ||
+	    (!pipes) ||
+	    (!do_crop_status))
+	{

ERROR: that open brace { should be on the previous line
#8980: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:10999:
+	for (i = 0; i < curr_stream->num_pipes; i++)
+	{

ERROR: open brace '{' following function definitions go on the next line
#9003: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11013:
+static bool
+aspect_ratio_crop_check(bool enabled, struct ia_css_pipe *curr_pipe) {

ERROR: open brace '{' following function definitions go on the next line
#9035: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11027:
+static enum ia_css_err
+aspect_ratio_crop(struct ia_css_pipe *curr_pipe,
+		    struct ia_css_resolution *effective_res) {

CHECK: Alignment should match open parenthesis
#9037: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11029:
+aspect_ratio_crop(struct ia_css_pipe *curr_pipe,
+		    struct ia_css_resolution *effective_res) {

ERROR: that open brace { should be on the previous line
#9054: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11038:
+	if ((!curr_pipe) ||
+	    (!effective_res))
+	{

ERROR: that open brace { should be on the previous line
#9065: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11046:
+	if ((curr_pipe->config.mode != IA_CSS_PIPE_MODE_PREVIEW) &&
+	    (curr_pipe->config.mode != IA_CSS_PIPE_MODE_VIDEO) &&
+	    (curr_pipe->config.mode != IA_CSS_PIPE_MODE_CAPTURE))
+	{

ERROR: that open brace { should be on the previous line
#9133: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11070:
+	switch (curr_pipe->config.mode)
+	{

CHECK: Alignment should match open parenthesis
#9154: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11091:
+		IA_CSS_ERROR("aspect ratio cropping invalid args: mode[%d]\n",
+				curr_pipe->config.mode);

ERROR: that open brace { should be on the previous line
#9161: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11097:
+	if (err == IA_CSS_SUCCESS)
+	{

ERROR: that open brace { should be on the previous line
#9164: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11100:
+	} else
+	{

CHECK: Unbalanced braces around else statement
#9164: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11100:
+	} else

WARNING: Block comments use a trailing */ on a separate line
#9167: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11103:
+		    * effective resolution from driver. */

WARNING: Block comments should align the * on each line
#9167: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11103:
+		/* in case of error fallback to default
+		    * effective resolution from driver. */

WARNING: line over 80 characters
#9168: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11104:
+		IA_CSS_LOG("ia_css_frame_find_crop_resolution() failed with err(%d)", err);

ERROR: open brace '{' following function definitions go on the next line
#9180: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11110:
+static void
+sh_css_hmm_buffer_record_init(void) {

ERROR: open brace '{' following function definitions go on the next line
#9201: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11118:
+static void
+sh_css_hmm_buffer_record_uninit(void) {

WARNING: line over 80 characters
#9210: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11127:
+				ia_css_rmgr_rel_vbuf(hmm_buffer_pool, &buffer_record->h_vbuf);

ERROR: open brace '{' following function definitions go on the next line
#9225: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11134:
+static void
+sh_css_hmm_buffer_record_reset(struct sh_css_hmm_buffer_record *buffer_record) {

ERROR: open brace '{' following function definitions go on the next line
#9259: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11143:
+static struct sh_css_hmm_buffer_record
+*sh_css_hmm_buffer_record_acquire(struct ia_css_rmgr_vbuf_handle *h_vbuf,
+				    enum ia_css_buffer_type type,
+				    hrt_address kernel_ptr) {

CHECK: Alignment should match open parenthesis
#9270: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11153:
+	assert((type > IA_CSS_BUFFER_TYPE_INVALID) &&
+		(type < IA_CSS_NUM_DYNAMIC_BUFFER_TYPE));

ERROR: open brace '{' following function definitions go on the next line
#9311: drivers/staging/media/atomisp/pci/atomisp2/css2400/sh_css.c:11172:
+static struct sh_css_hmm_buffer_record
+*sh_css_hmm_buffer_record_validate(hrt_vaddress ddr_buffer_addr,
+				    enum ia_css_buffer_type type) {

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
