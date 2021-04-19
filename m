Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEFD3364A85
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 21:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241986AbhDSTYJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 15:24:09 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:35679 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241871AbhDSTYE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 15:24:04 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BAB7660003;
        Mon, 19 Apr 2021 19:23:31 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 8/8]  staging: media: atomisp: Fix alignment and line length issues
Date:   Mon, 19 Apr 2021 15:26:02 -0400
Message-Id: <20210419192602.498815-9-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192602.498815-1-vrzh@vrzh.net>
References: <20210419192602.498815-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

 Fix alignment style issues and adjacent line length issues in sh_css.c

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 619 +++++++++++----------
 1 file changed, 333 insertions(+), 286 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index ea096e6f90e5..1d264c675e54 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -239,8 +239,8 @@ ia_css_reset_defaults(struct sh_css *css);
 static void
 sh_css_init_host_sp_control_vars(void);
 
-static int set_num_primary_stages(unsigned int *num,
-	enum ia_css_pipe_version version);
+static int
+set_num_primary_stages(unsigned int *num, enum ia_css_pipe_version version);
 
 static bool
 need_capture_pp(const struct ia_css_pipe *pipe);
@@ -2994,9 +2994,8 @@ static int add_firmwares(
 
 		ia_css_pipe_get_firmwares_stage_desc(&stage_desc, binary,
 						     out, in, vf, fw, binary_mode);
-		err = ia_css_pipeline_create_and_add_stage(me,
-			&stage_desc,
-			&extra_stage);
+		err = ia_css_pipeline_create_and_add_stage(me, &stage_desc,
+							   &extra_stage);
 		if (err)
 			return err;
 		if (fw->info.isp.sp.enable.output != 0)
@@ -3104,9 +3103,8 @@ static int add_yuv_scaler_stage(
 		ia_css_pipe_get_generic_stage_desc(&stage_desc,
 						   yuv_scaler_binary, out_frames, in_frame, vf_frame);
 	}
-	err = ia_css_pipeline_create_and_add_stage(me,
-		&stage_desc,
-		pre_vf_pp_stage);
+	err = ia_css_pipeline_create_and_add_stage(me, &stage_desc,
+						   pre_vf_pp_stage);
 	if (err)
 		return err;
 	in_frame = (*pre_vf_pp_stage)->args.out_frame[0];
@@ -3164,9 +3162,8 @@ static int add_capture_pp_stage(
 		ia_css_pipe_get_generic_stage_desc(&stage_desc,
 						   capture_pp_binary, out_frames, NULL, vf_frame);
 	}
-	err = ia_css_pipeline_create_and_add_stage(me,
-		&stage_desc,
-		capture_pp_stage);
+	err = ia_css_pipeline_create_and_add_stage(me, &stage_desc,
+						   capture_pp_stage);
 	if (err)
 		return err;
 	err = add_firmwares(me, capture_pp_binary, pipe->output_stage, last_fw,
@@ -3521,9 +3518,8 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 		ia_css_pipe_util_set_output_frames(out_frames, 0, NULL);
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
 						   out_frames, NULL, NULL);
-		err = ia_css_pipeline_create_and_add_stage(me,
-			&stage_desc,
-			&copy_stage);
+		err = ia_css_pipeline_create_and_add_stage(me, &stage_desc,
+							   &copy_stage);
 		if (err)
 			goto ERR;
 		in_frame = me->stages->args.out_frame[0];
@@ -3550,9 +3546,8 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, video_binary,
 						   out_frames, in_frame, vf_frame);
 	}
-	err = ia_css_pipeline_create_and_add_stage(me,
-		&stage_desc,
-		&video_stage);
+	err = ia_css_pipeline_create_and_add_stage(me, &stage_desc,
+						   &video_stage);
 	if (err)
 		goto ERR;
 
@@ -3617,8 +3612,8 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 		for (i = 0; i < num_yuv_scaler; i++) {
 			tmp_out_frame = is_output_stage[i] ? out_frame : NULL;
 
-			err = add_yuv_scaler_stage(pipe, me, tmp_in_frame, tmp_out_frame,
-						   NULL,
+			err = add_yuv_scaler_stage(pipe, me, tmp_in_frame,
+						   tmp_out_frame, NULL,
 						   &yuv_scaler_binary[i],
 						   &yuv_scaler_stage);
 
@@ -3757,9 +3752,8 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe)
 		ia_css_pipe_util_set_output_frames(out_frames, 0, NULL);
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
 						   out_frames, NULL, NULL);
-		err = ia_css_pipeline_create_and_add_stage(me,
-			&stage_desc,
-			&copy_stage);
+		err = ia_css_pipeline_create_and_add_stage(me, &stage_desc,
+							   &copy_stage);
 		if (err)
 			goto ERR;
 		in_frame = me->stages->args.out_frame[0];
@@ -3785,9 +3779,8 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe)
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, preview_binary,
 						   out_frames, in_frame, NULL);
 	}
-	err = ia_css_pipeline_create_and_add_stage(me,
-		&stage_desc,
-		&preview_stage);
+	err = ia_css_pipeline_create_and_add_stage(me, &stage_desc,
+						   &preview_stage);
 	if (err)
 		goto ERR;
 	/* If we use copy iso preview, the input must be yuv iso raw */
@@ -4120,8 +4113,8 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 	}
 
 	hmm_store(h_vbuf->vptr,
-		   (void *)(&ddr_buffer),
-		   sizeof(struct sh_css_hmm_buffer));
+		  (void *)(&ddr_buffer),
+		  sizeof(struct sh_css_hmm_buffer));
 	if ((buf_type == IA_CSS_BUFFER_TYPE_3A_STATISTICS) ||
 	    (buf_type == IA_CSS_BUFFER_TYPE_DIS_STATISTICS) ||
 	    (buf_type == IA_CSS_BUFFER_TYPE_LACE_STATISTICS)) {
@@ -4282,8 +4275,8 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 		}
 
 		hmm_load(ddr_buffer_addr,
-			  &ddr_buffer,
-			  sizeof(struct sh_css_hmm_buffer));
+			 &ddr_buffer,
+			 sizeof(struct sh_css_hmm_buffer));
 
 		/* if the kernel_ptr is 0 or an invalid, return an error.
 		 * do not access the buffer via the kernal_ptr.
@@ -4936,7 +4929,7 @@ sh_css_pipes_stop(struct ia_css_stream *stream)
 	for (i = 0; i < stream->num_pipes; i++) {
 		/* send the "stop" request to the "ia_css_pipe" instance */
 		IA_CSS_LOG("Send the stop-request to the pipe: pipe_id=%d",
-			stream->pipes[i]->pipeline.pipe_id);
+			   stream->pipes[i]->pipeline.pipe_id);
 		err = ia_css_pipeline_request_stop(&stream->pipes[i]->pipeline);
 
 		/*
@@ -4985,7 +4978,7 @@ sh_css_pipes_stop(struct ia_css_stream *stream)
 
 		/* send the "stop" request to "Copy Pipe" */
 		IA_CSS_LOG("Send the stop-request to the pipe: pipe_id=%d",
-			copy_pipe->pipeline.pipe_id);
+			   copy_pipe->pipeline.pipe_id);
 		err = ia_css_pipeline_request_stop(&copy_pipe->pipeline);
 	}
 
@@ -5813,7 +5806,7 @@ static bool need_capt_ldc(
 }
 
 static int set_num_primary_stages(unsigned int *num,
-	enum ia_css_pipe_version version)
+				  enum ia_css_pipe_version version)
 {
 	int err = 0;
 
@@ -6013,10 +6006,13 @@ static int load_primary_binaries(
 			capt_pp_in_info = &prim_out_info;
 
 		ia_css_pipe_get_capturepp_binarydesc(pipe,
-							&capture_pp_descr, capt_pp_in_info,
-							&capt_pp_out_info, &vf_info);
+						     &capture_pp_descr,
+						     capt_pp_in_info,
+						     &capt_pp_out_info,
+						     &vf_info);
+
 		err = ia_css_binary_find(&capture_pp_descr,
-					    &mycs->capture_pp_binary);
+					 &mycs->capture_pp_binary);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
@@ -6026,11 +6022,12 @@ static int load_primary_binaries(
 			struct ia_css_binary_descr capt_ldc_descr;
 
 			ia_css_pipe_get_ldc_binarydesc(pipe,
-							&capt_ldc_descr, &prim_out_info,
-							&capt_ldc_out_info);
+						       &capt_ldc_descr,
+						       &prim_out_info,
+						       &capt_ldc_out_info);
 
 			err = ia_css_binary_find(&capt_ldc_descr,
-						    &mycs->capture_ldc_binary);
+						 &mycs->capture_ldc_binary);
 			if (err) {
 				IA_CSS_LEAVE_ERR_PRIVATE(err);
 				return err;
@@ -6047,8 +6044,9 @@ static int load_primary_binaries(
 		if (pipe->enable_viewfinder[IA_CSS_PIPE_OUTPUT_STAGE_0] &&
 		    (i == mycs->num_primary_stage - 1))
 			local_vf_info = &vf_info;
-		ia_css_pipe_get_primary_binarydesc(pipe, &prim_descr[i], &prim_in_info,
-						    &prim_out_info, local_vf_info, i);
+		ia_css_pipe_get_primary_binarydesc(pipe, &prim_descr[i],
+						   &prim_in_info, &prim_out_info,
+						   local_vf_info, i);
 		err = ia_css_binary_find(&prim_descr[i], &mycs->primary_binary[i]);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -6100,8 +6098,8 @@ static int load_primary_binaries(
 	/* ISP Copy */
 	if (need_isp_copy_binary) {
 		err = load_copy_binary(pipe,
-					&mycs->copy_binary,
-					&mycs->primary_binary[0]);
+				       &mycs->copy_binary,
+				       &mycs->primary_binary[0]);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
@@ -6209,7 +6207,7 @@ static int load_advanced_binaries(struct ia_css_pipe *pipe)
 
 	assert(pipe);
 	assert(pipe->mode == IA_CSS_PIPE_ID_CAPTURE ||
-		pipe->mode == IA_CSS_PIPE_ID_COPY);
+	       pipe->mode == IA_CSS_PIPE_ID_COPY);
 	if (pipe->pipe_settings.capture.pre_isp_binary.info)
 		return 0;
 	pipe_out_info = &pipe->output_info[0];
@@ -6222,17 +6220,18 @@ static int load_advanced_binaries(struct ia_css_pipe *pipe)
 	need_pp = need_capture_pp(pipe);
 
 	ia_css_frame_info_set_format(&vf_info,
-					IA_CSS_FRAME_FORMAT_YUV_LINE);
+				     IA_CSS_FRAME_FORMAT_YUV_LINE);
 
 	/* we build up the pipeline starting at the end */
 	/* Capture post-processing */
 	if (need_pp) {
 		struct ia_css_binary_descr capture_pp_descr;
 
-		ia_css_pipe_get_capturepp_binarydesc(pipe,
-							&capture_pp_descr, &post_out_info, pipe_out_info, &vf_info);
+		ia_css_pipe_get_capturepp_binarydesc(pipe, &capture_pp_descr,
+						     &post_out_info,
+						     pipe_out_info, &vf_info);
 		err = ia_css_binary_find(&capture_pp_descr,
-					    &pipe->pipe_settings.capture.capture_pp_binary);
+					 &pipe->pipe_settings.capture.capture_pp_binary);
 		if (err)
 			return err;
 	} else {
@@ -6243,10 +6242,11 @@ static int load_advanced_binaries(struct ia_css_pipe *pipe)
 	{
 		struct ia_css_binary_descr post_gdc_descr;
 
-		ia_css_pipe_get_post_gdc_binarydesc(pipe,
-						    &post_gdc_descr, &post_in_info, &post_out_info, &vf_info);
+		ia_css_pipe_get_post_gdc_binarydesc(pipe, &post_gdc_descr,
+						    &post_in_info,
+						    &post_out_info, &vf_info);
 		err = ia_css_binary_find(&post_gdc_descr,
-					    &pipe->pipe_settings.capture.post_isp_binary);
+					 &pipe->pipe_settings.capture.post_isp_binary);
 		if (err)
 			return err;
 	}
@@ -6256,9 +6256,9 @@ static int load_advanced_binaries(struct ia_css_pipe *pipe)
 		struct ia_css_binary_descr gdc_descr;
 
 		ia_css_pipe_get_gdc_binarydesc(pipe, &gdc_descr, &gdc_in_info,
-						&pipe->pipe_settings.capture.post_isp_binary.in_frame_info);
+					       &pipe->pipe_settings.capture.post_isp_binary.in_frame_info);
 		err = ia_css_binary_find(&gdc_descr,
-					    &pipe->pipe_settings.capture.anr_gdc_binary);
+					 &pipe->pipe_settings.capture.anr_gdc_binary);
 		if (err)
 			return err;
 	}
@@ -6270,9 +6270,9 @@ static int load_advanced_binaries(struct ia_css_pipe *pipe)
 		struct ia_css_binary_descr pre_gdc_descr;
 
 		ia_css_pipe_get_pre_gdc_binarydesc(pipe, &pre_gdc_descr, &pre_in_info,
-						    &pipe->pipe_settings.capture.anr_gdc_binary.in_frame_info);
+						   &pipe->pipe_settings.capture.anr_gdc_binary.in_frame_info);
 		err = ia_css_binary_find(&pre_gdc_descr,
-					    &pipe->pipe_settings.capture.pre_isp_binary);
+					 &pipe->pipe_settings.capture.pre_isp_binary);
 		if (err)
 			return err;
 	}
@@ -6294,7 +6294,7 @@ static int load_advanced_binaries(struct ia_css_pipe *pipe)
 		ia_css_pipe_get_vfpp_binarydesc(pipe,
 						&vf_pp_descr, vf_pp_in_info, pipe_vf_out_info);
 		err = ia_css_binary_find(&vf_pp_descr,
-					    &pipe->pipe_settings.capture.vf_pp_binary);
+					 &pipe->pipe_settings.capture.vf_pp_binary);
 		if (err)
 			return err;
 	}
@@ -6306,8 +6306,8 @@ static int load_advanced_binaries(struct ia_css_pipe *pipe)
 #endif
 	if (need_isp_copy)
 		load_copy_binary(pipe,
-				    &pipe->pipe_settings.capture.copy_binary,
-				    &pipe->pipe_settings.capture.pre_isp_binary);
+				 &pipe->pipe_settings.capture.copy_binary,
+				 &pipe->pipe_settings.capture.pre_isp_binary);
 
 	return err;
 }
@@ -6321,7 +6321,7 @@ static int load_bayer_isp_binaries(struct ia_css_pipe *pipe)
 	IA_CSS_ENTER_PRIVATE("");
 	assert(pipe);
 	assert(pipe->mode == IA_CSS_PIPE_ID_CAPTURE ||
-		pipe->mode == IA_CSS_PIPE_ID_COPY);
+	       pipe->mode == IA_CSS_PIPE_ID_COPY);
 	pipe_out_info = &pipe->output_info[0];
 
 	if (pipe->pipe_settings.capture.pre_isp_binary.info)
@@ -6332,11 +6332,11 @@ static int load_bayer_isp_binaries(struct ia_css_pipe *pipe)
 		return err;
 
 	ia_css_pipe_get_pre_de_binarydesc(pipe, &pre_de_descr,
-					    &pre_isp_in_info,
-					    pipe_out_info);
+					  &pre_isp_in_info,
+					  pipe_out_info);
 
 	err = ia_css_binary_find(&pre_de_descr,
-				    &pipe->pipe_settings.capture.pre_isp_binary);
+				 &pipe->pipe_settings.capture.pre_isp_binary);
 
 	return err;
 }
@@ -6354,7 +6354,7 @@ static int load_low_light_binaries(struct ia_css_pipe *pipe)
 	IA_CSS_ENTER_PRIVATE("");
 	assert(pipe);
 	assert(pipe->mode == IA_CSS_PIPE_ID_CAPTURE ||
-		pipe->mode == IA_CSS_PIPE_ID_COPY);
+	       pipe->mode == IA_CSS_PIPE_ID_COPY);
 
 	if (pipe->pipe_settings.capture.pre_isp_binary.info)
 		return 0;
@@ -6369,17 +6369,18 @@ static int load_low_light_binaries(struct ia_css_pipe *pipe)
 	need_pp = need_capture_pp(pipe);
 
 	ia_css_frame_info_set_format(&vf_info,
-					IA_CSS_FRAME_FORMAT_YUV_LINE);
+				     IA_CSS_FRAME_FORMAT_YUV_LINE);
 
 	/* we build up the pipeline starting at the end */
 	/* Capture post-processing */
 	if (need_pp) {
 		struct ia_css_binary_descr capture_pp_descr;
 
-		ia_css_pipe_get_capturepp_binarydesc(pipe,
-							&capture_pp_descr, &post_out_info, pipe_out_info, &vf_info);
+		ia_css_pipe_get_capturepp_binarydesc(pipe, &capture_pp_descr,
+						     &post_out_info,
+						     pipe_out_info, &vf_info);
 		err = ia_css_binary_find(&capture_pp_descr,
-					    &pipe->pipe_settings.capture.capture_pp_binary);
+					 &pipe->pipe_settings.capture.capture_pp_binary);
 		if (err)
 			return err;
 	} else {
@@ -6393,7 +6394,7 @@ static int load_low_light_binaries(struct ia_css_pipe *pipe)
 		ia_css_pipe_get_post_anr_binarydesc(pipe,
 						    &post_anr_descr, &post_in_info, &post_out_info, &vf_info);
 		err = ia_css_binary_find(&post_anr_descr,
-					    &pipe->pipe_settings.capture.post_isp_binary);
+					 &pipe->pipe_settings.capture.post_isp_binary);
 		if (err)
 			return err;
 	}
@@ -6403,9 +6404,9 @@ static int load_low_light_binaries(struct ia_css_pipe *pipe)
 		struct ia_css_binary_descr anr_descr;
 
 		ia_css_pipe_get_anr_binarydesc(pipe, &anr_descr, &anr_in_info,
-						&pipe->pipe_settings.capture.post_isp_binary.in_frame_info);
+					       &pipe->pipe_settings.capture.post_isp_binary.in_frame_info);
 		err = ia_css_binary_find(&anr_descr,
-					    &pipe->pipe_settings.capture.anr_gdc_binary);
+					 &pipe->pipe_settings.capture.anr_gdc_binary);
 		if (err)
 			return err;
 	}
@@ -6417,9 +6418,9 @@ static int load_low_light_binaries(struct ia_css_pipe *pipe)
 		struct ia_css_binary_descr pre_anr_descr;
 
 		ia_css_pipe_get_pre_anr_binarydesc(pipe, &pre_anr_descr, &pre_in_info,
-						    &pipe->pipe_settings.capture.anr_gdc_binary.in_frame_info);
+						   &pipe->pipe_settings.capture.anr_gdc_binary.in_frame_info);
 		err = ia_css_binary_find(&pre_anr_descr,
-					    &pipe->pipe_settings.capture.pre_isp_binary);
+					 &pipe->pipe_settings.capture.pre_isp_binary);
 		if (err)
 			return err;
 	}
@@ -6438,10 +6439,10 @@ static int load_low_light_binaries(struct ia_css_pipe *pipe)
 	{
 		struct ia_css_binary_descr vf_pp_descr;
 
-		ia_css_pipe_get_vfpp_binarydesc(pipe,
-						&vf_pp_descr, vf_pp_in_info, pipe_vf_out_info);
+		ia_css_pipe_get_vfpp_binarydesc(pipe, &vf_pp_descr,
+						vf_pp_in_info, pipe_vf_out_info);
 		err = ia_css_binary_find(&vf_pp_descr,
-					    &pipe->pipe_settings.capture.vf_pp_binary);
+					 &pipe->pipe_settings.capture.vf_pp_binary);
 		if (err)
 			return err;
 	}
@@ -6453,8 +6454,8 @@ static int load_low_light_binaries(struct ia_css_pipe *pipe)
 #endif
 	if (need_isp_copy)
 		err = load_copy_binary(pipe,
-					&pipe->pipe_settings.capture.copy_binary,
-					&pipe->pipe_settings.capture.pre_isp_binary);
+				       &pipe->pipe_settings.capture.copy_binary,
+				       &pipe->pipe_settings.capture.pre_isp_binary);
 
 	return err;
 }
@@ -6487,7 +6488,7 @@ static int load_capture_binaries(struct ia_css_pipe *pipe)
 	IA_CSS_ENTER_PRIVATE("");
 	assert(pipe);
 	assert(pipe->mode == IA_CSS_PIPE_ID_CAPTURE ||
-		pipe->mode == IA_CSS_PIPE_ID_COPY);
+	       pipe->mode == IA_CSS_PIPE_ID_COPY);
 
 	if (pipe->pipe_settings.capture.primary_binary[0].info) {
 		IA_CSS_LEAVE_ERR_PRIVATE(0);
@@ -6583,7 +6584,7 @@ unload_capture_binaries(struct ia_css_pipe *pipe)
 
 static bool
 need_downscaling(const struct ia_css_resolution in_res,
-		    const struct ia_css_resolution out_res)
+		 const struct ia_css_resolution out_res)
 {
 	if (in_res.width > out_res.width || in_res.height > out_res.height)
 		return true;
@@ -6654,9 +6655,9 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 	descr->num_output_stage = 1;
 
 	hor_ds_factor = CEIL_DIV(cas_scaler_in_info->res.width,
-				    cas_scaler_out_info->res.width);
+				 cas_scaler_out_info->res.width);
 	ver_ds_factor = CEIL_DIV(cas_scaler_in_info->res.height,
-				    cas_scaler_out_info->res.height);
+				 cas_scaler_out_info->res.height);
 	/* use the same horizontal and vertical downscaling factor for simplicity */
 	assert(hor_ds_factor == ver_ds_factor);
 
@@ -6666,31 +6667,36 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 		i *= max_scale_factor_per_stage;
 	}
 
-	descr->in_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),
-				    GFP_KERNEL);
+	descr->in_info = kmalloc(descr->num_stage *
+				 sizeof(struct ia_css_frame_info),
+				 GFP_KERNEL);
 	if (!descr->in_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage * sizeof(
-						struct ia_css_frame_info), GFP_KERNEL);
+	descr->internal_out_info = kmalloc(descr->num_stage *
+					   sizeof(struct ia_css_frame_info),
+					   GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),
-				    GFP_KERNEL);
+	descr->out_info = kmalloc(descr->num_stage *
+				  sizeof(struct ia_css_frame_info),
+				  GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),
-				    GFP_KERNEL);
+	descr->vf_info = kmalloc(descr->num_stage *
+				 sizeof(struct ia_css_frame_info),
+				 GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool), GFP_KERNEL);
+	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
+					 GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
@@ -6734,9 +6740,9 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 				max_scale_factor_per_stage;
 			descr->internal_out_info[i].format = IA_CSS_FRAME_FORMAT_YUV420;
 			ia_css_frame_info_init(&descr->internal_out_info[i],
-						tmp_in_info.res.width / max_scale_factor_per_stage,
-						tmp_in_info.res.height / max_scale_factor_per_stage,
-						IA_CSS_FRAME_FORMAT_YUV420, 0);
+					       tmp_in_info.res.width / max_scale_factor_per_stage,
+					       tmp_in_info.res.height / max_scale_factor_per_stage,
+					       IA_CSS_FRAME_FORMAT_YUV420, 0);
 			descr->out_info[i].res.width = 0;
 			descr->out_info[i].res.height = 0;
 			descr->vf_info[i].res.width = 0;
@@ -6811,30 +6817,35 @@ static int ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
 	descr->num_stage = num_stages;
 
 	descr->in_info = kmalloc_array(descr->num_stage,
-					sizeof(struct ia_css_frame_info), GFP_KERNEL);
+				       sizeof(struct ia_css_frame_info),
+				       GFP_KERNEL);
 	if (!descr->in_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->internal_out_info = kmalloc(descr->num_stage * sizeof(
-						struct ia_css_frame_info), GFP_KERNEL);
+	descr->internal_out_info = kmalloc(descr->num_stage *
+					   sizeof(struct ia_css_frame_info),
+					   GFP_KERNEL);
 	if (!descr->internal_out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->out_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),
-				    GFP_KERNEL);
+	descr->out_info = kmalloc(descr->num_stage *
+				  sizeof(struct ia_css_frame_info),
+				  GFP_KERNEL);
 	if (!descr->out_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->vf_info = kmalloc(descr->num_stage * sizeof(struct ia_css_frame_info),
-				    GFP_KERNEL);
+	descr->vf_info = kmalloc(descr->num_stage *
+				 sizeof(struct ia_css_frame_info),
+				 GFP_KERNEL);
 	if (!descr->vf_info) {
 		err = -ENOMEM;
 		goto ERR;
 	}
-	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool), GFP_KERNEL);
+	descr->is_output_stage = kmalloc(descr->num_stage * sizeof(bool),
+					 GFP_KERNEL);
 	if (!descr->is_output_stage) {
 		err = -ENOMEM;
 		goto ERR;
@@ -6844,7 +6855,7 @@ static int ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
 		if (out_info[i]) {
 			if (i > 0) {
 				assert((out_info[i - 1]->res.width >= out_info[i]->res.width) &&
-					(out_info[i - 1]->res.height >= out_info[i]->res.height));
+				       (out_info[i - 1]->res.height >= out_info[i]->res.height));
 			}
 		}
 	}
@@ -6892,9 +6903,9 @@ static int ia_css_pipe_create_cas_scaler_desc(struct ia_css_pipe *pipe,
 				max_scale_factor_per_stage;
 			descr->internal_out_info[i].format = IA_CSS_FRAME_FORMAT_YUV420;
 			ia_css_frame_info_init(&descr->internal_out_info[i],
-						tmp_in_info.res.width / max_scale_factor_per_stage,
-						tmp_in_info.res.height / max_scale_factor_per_stage,
-						IA_CSS_FRAME_FORMAT_YUV420, 0);
+					       tmp_in_info.res.width / max_scale_factor_per_stage,
+					       tmp_in_info.res.height / max_scale_factor_per_stage,
+					       IA_CSS_FRAME_FORMAT_YUV420, 0);
 			descr->out_info[i].res.width = 0;
 			descr->out_info[i].res.height = 0;
 			descr->vf_info[i].res.width = 0;
@@ -6973,13 +6984,14 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
 		struct ia_css_binary_descr yuv_scaler_descr;
 
 		err = ia_css_pipe_create_cas_scaler_desc(pipe,
-			&cas_scaler_descr);
+							 &cas_scaler_descr);
 		if (err)
 			goto ERR;
 		mycs->num_output = cas_scaler_descr.num_output_stage;
 		mycs->num_yuv_scaler = cas_scaler_descr.num_stage;
 		mycs->yuv_scaler_binary = kzalloc(cas_scaler_descr.num_stage *
-						    sizeof(struct ia_css_binary), GFP_KERNEL);
+						  sizeof(struct ia_css_binary),
+						  GFP_KERNEL);
 		if (!mycs->yuv_scaler_binary) {
 			err = -ENOMEM;
 			goto ERR;
@@ -6993,12 +7005,13 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
 		for (i = 0; i < cas_scaler_descr.num_stage; i++) {
 			mycs->is_output_stage[i] = cas_scaler_descr.is_output_stage[i];
 			ia_css_pipe_get_yuvscaler_binarydesc(pipe,
-								&yuv_scaler_descr, &cas_scaler_descr.in_info[i],
-								&cas_scaler_descr.out_info[i],
-								&cas_scaler_descr.internal_out_info[i],
-								&cas_scaler_descr.vf_info[i]);
+							     &yuv_scaler_descr,
+							     &cas_scaler_descr.in_info[i],
+							     &cas_scaler_descr.out_info[i],
+							     &cas_scaler_descr.internal_out_info[i],
+							     &cas_scaler_descr.vf_info[i]);
 			err = ia_css_binary_find(&yuv_scaler_descr,
-						    &mycs->yuv_scaler_binary[i]);
+						 &mycs->yuv_scaler_binary[i]);
 			if (err)
 				goto ERR;
 		}
@@ -7038,8 +7051,8 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
 
 	if (need_isp_copy_binary) {
 		err = load_copy_binary(pipe,
-					&mycs->copy_binary,
-					next_binary);
+				       &mycs->copy_binary,
+				       next_binary);
 
 		if (err)
 			goto ERR;
@@ -7084,8 +7097,9 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
 
 		mycs->num_vf_pp = 1;
 	}
-	mycs->vf_pp_binary = kzalloc(mycs->num_vf_pp * sizeof(struct ia_css_binary),
-					GFP_KERNEL);
+	mycs->vf_pp_binary = kzalloc(mycs->num_vf_pp *
+				     sizeof(struct ia_css_binary),
+				     GFP_KERNEL);
 	if (!mycs->vf_pp_binary) {
 		err = -ENOMEM;
 		goto ERR;
@@ -7414,18 +7428,26 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
 #endif
 
 		if (need_scaler) {
-			ia_css_pipe_util_set_output_frames(bin_out_frame, 0, NULL);
-			ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
-							    bin_out_frame, in_frame_local, NULL);
+			ia_css_pipe_util_set_output_frames(bin_out_frame,
+							   0, NULL);
+			ia_css_pipe_get_generic_stage_desc(&stage_desc,
+							   copy_binary,
+							   bin_out_frame,
+							   in_frame_local,
+							   NULL);
 		} else {
-			ia_css_pipe_util_set_output_frames(bin_out_frame, 0, out_frame[0]);
-			ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
-							    bin_out_frame, in_frame_local, NULL);
+			ia_css_pipe_util_set_output_frames(bin_out_frame,
+							   0, out_frame[0]);
+			ia_css_pipe_get_generic_stage_desc(&stage_desc,
+							   copy_binary,
+							   bin_out_frame,
+							   in_frame_local,
+							   NULL);
 		}
 
 		err = ia_css_pipeline_create_and_add_stage(me,
-			&stage_desc,
-			&copy_stage);
+							   &stage_desc,
+							   &copy_stage);
 
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -7457,10 +7479,11 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
 				tmp_vf_frame = NULL;
 			}
 
-			err = add_yuv_scaler_stage(pipe, me, tmp_in_frame, tmp_out_frame,
-						    NULL,
-						    &yuv_scaler_binary[i],
-						    &yuv_scaler_stage);
+			err = add_yuv_scaler_stage(pipe, me, tmp_in_frame,
+						   tmp_out_frame,
+						   NULL,
+						   &yuv_scaler_binary[i],
+						   &yuv_scaler_stage);
 
 			if (err) {
 				IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -7471,8 +7494,10 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
 			if (pipe->pipe_settings.yuvpp.is_output_stage[i]) {
 				if (tmp_vf_frame && (tmp_vf_frame->info.res.width != 0)) {
 					in_frame = yuv_scaler_stage->args.out_vf_frame;
-					err = add_vf_pp_stage(pipe, in_frame, tmp_vf_frame, &vf_pp_binary[j],
-								&vf_pp_stage);
+					err = add_vf_pp_stage(pipe, in_frame,
+							      tmp_vf_frame,
+							      &vf_pp_binary[j],
+							      &vf_pp_stage);
 
 					if (err) {
 						IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -7485,8 +7510,8 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
 	} else if (copy_stage) {
 		if (vf_frame[0] && vf_frame[0]->info.res.width != 0) {
 			in_frame = copy_stage->args.out_vf_frame;
-			err = add_vf_pp_stage(pipe, in_frame, vf_frame[0], &vf_pp_binary[0],
-						&vf_pp_stage);
+			err = add_vf_pp_stage(pipe, in_frame, vf_frame[0],
+					      &vf_pp_binary[0], &vf_pp_stage);
 		}
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -7494,7 +7519,8 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
 		}
 	}
 
-	ia_css_pipeline_finalize_stages(&pipe->pipeline, pipe->stream->config.continuous);
+	ia_css_pipeline_finalize_stages(&pipe->pipeline,
+					pipe->stream->config.continuous);
 
 	IA_CSS_LEAVE_ERR_PRIVATE(0);
 
@@ -7503,8 +7529,8 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
 
 static int
 create_host_copy_pipeline(struct ia_css_pipe *pipe,
-			    unsigned int max_input_width,
-			    struct ia_css_frame *out_frame)
+			  unsigned int max_input_width,
+			  struct ia_css_frame *out_frame)
 {
 	struct ia_css_pipeline *me;
 	int err = 0;
@@ -7523,12 +7549,8 @@ create_host_copy_pipeline(struct ia_css_pipe *pipe,
 
 	if (copy_on_sp(pipe) &&
 	    pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8) {
-		ia_css_frame_info_init(
-		    &out_frame->info,
-		    JPEG_BYTES,
-		    1,
-		    IA_CSS_FRAME_FORMAT_BINARY_8,
-		    0);
+		ia_css_frame_info_init(&out_frame->info, JPEG_BYTES, 1,
+				       IA_CSS_FRAME_FORMAT_BINARY_8, 0);
 	} else if (out_frame->info.format == IA_CSS_FRAME_FORMAT_RAW) {
 		out_frame->info.raw_bit_depth =
 		ia_css_pipe_util_pipe_input_format_bpp(pipe);
@@ -7539,12 +7561,12 @@ create_host_copy_pipeline(struct ia_css_pipe *pipe,
 	pipe->mode  = IA_CSS_PIPE_ID_COPY;
 
 	ia_css_pipe_get_sp_func_stage_desc(&stage_desc, out_frame,
-					    IA_CSS_PIPELINE_RAW_COPY, max_input_width);
-	err = ia_css_pipeline_create_and_add_stage(me,
-		&stage_desc,
-		NULL);
+					   IA_CSS_PIPELINE_RAW_COPY,
+					   max_input_width);
+	err = ia_css_pipeline_create_and_add_stage(me, &stage_desc, NULL);
 
-	ia_css_pipeline_finalize_stages(&pipe->pipeline, pipe->stream->config.continuous);
+	ia_css_pipeline_finalize_stages(&pipe->pipeline,
+					pipe->stream->config.continuous);
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 			    "create_host_copy_pipeline() leave:\n");
@@ -7583,9 +7605,10 @@ create_host_isyscopy_capture_pipeline(struct ia_css_pipe *pipe)
 	me->pipe_id = IA_CSS_PIPE_ID_CAPTURE;
 	pipe->mode  = IA_CSS_PIPE_ID_CAPTURE;
 	ia_css_pipe_get_sp_func_stage_desc(&stage_desc, out_frame,
-					    IA_CSS_PIPELINE_ISYS_COPY, max_input_width);
+					   IA_CSS_PIPELINE_ISYS_COPY,
+					   max_input_width);
 	err = ia_css_pipeline_create_and_add_stage(me,
-		&stage_desc, &out_stage);
+						   &stage_desc, &out_stage);
 	if (err)
 		return err;
 
@@ -7637,7 +7660,8 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 	IA_CSS_ENTER_PRIVATE("");
 	assert(pipe);
 	assert(pipe->stream);
-	assert(pipe->mode == IA_CSS_PIPE_ID_CAPTURE || pipe->mode == IA_CSS_PIPE_ID_COPY);
+	assert(pipe->mode == IA_CSS_PIPE_ID_CAPTURE ||
+	       pipe->mode == IA_CSS_PIPE_ID_COPY);
 
 	me = &pipe->pipeline;
 	mode = pipe->config.default_capture_config.mode;
@@ -7727,26 +7751,37 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 			ia_css_pipe_util_set_output_frames(out_frames, 0, out_frame);
 #if defined(ISP2401)
 			if (!continuous) {
-				ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
-								    out_frames, in_frame, NULL);
+				ia_css_pipe_get_generic_stage_desc(&stage_desc,
+								   copy_binary,
+								   out_frames,
+								   in_frame,
+								   NULL);
 			} else {
 				in_frame = pipe->stream->last_pipe->continuous_frames[0];
-				ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
-								    out_frames, in_frame, NULL);
+				ia_css_pipe_get_generic_stage_desc(&stage_desc,
+								   copy_binary,
+								   out_frames,
+								   in_frame,
+								   NULL);
 			}
 #else
-			ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
-							    out_frames, NULL, NULL);
+			ia_css_pipe_get_generic_stage_desc(&stage_desc,
+							   copy_binary,
+							   out_frames,
+							   NULL, NULL);
 #endif
 		} else {
-			ia_css_pipe_util_set_output_frames(out_frames, 0, in_frame);
-			ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
-							    out_frames, NULL, NULL);
+			ia_css_pipe_util_set_output_frames(out_frames, 0,
+							   in_frame);
+			ia_css_pipe_get_generic_stage_desc(&stage_desc,
+							   copy_binary,
+							   out_frames,
+							   NULL, NULL);
 		}
 
 		err = ia_css_pipeline_create_and_add_stage(me,
-			&stage_desc,
-			&current_stage);
+							   &stage_desc,
+							   &current_stage);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
@@ -7783,11 +7818,14 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 			    * Proper investigation should be done to come up with the clean
 			    * solution.
 			    * */
-			ia_css_pipe_get_generic_stage_desc(&stage_desc, primary_binary[i],
-							    out_frames, local_in_frame, NULL);
+			ia_css_pipe_get_generic_stage_desc(&stage_desc,
+							   primary_binary[i],
+							   out_frames,
+							   local_in_frame,
+							   NULL);
 			err = ia_css_pipeline_create_and_add_stage(me,
-				&stage_desc,
-				&current_stage);
+								   &stage_desc,
+								   &current_stage);
 			if (err) {
 				IA_CSS_LEAVE_ERR_PRIVATE(err);
 				return err;
@@ -7803,18 +7841,18 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 		    mode == IA_CSS_CAPTURE_MODE_LOW_LIGHT) {
 		ia_css_pipe_util_set_output_frames(out_frames, 0, NULL);
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, pre_isp_binary,
-						    out_frames, in_frame, NULL);
-		err = ia_css_pipeline_create_and_add_stage(me,
-			&stage_desc, NULL);
+						   out_frames, in_frame, NULL);
+		err = ia_css_pipeline_create_and_add_stage(me, &stage_desc,
+							   NULL);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
 		}
 		ia_css_pipe_util_set_output_frames(out_frames, 0, NULL);
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, anr_gdc_binary,
-						    out_frames, NULL, NULL);
-		err = ia_css_pipeline_create_and_add_stage(me,
-			&stage_desc, NULL);
+						   out_frames, NULL, NULL);
+		err = ia_css_pipeline_create_and_add_stage(me, &stage_desc,
+							   NULL);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
@@ -7822,16 +7860,21 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 
 		if (need_pp) {
 			ia_css_pipe_util_set_output_frames(out_frames, 0, NULL);
-			ia_css_pipe_get_generic_stage_desc(&stage_desc, post_isp_binary,
-							    out_frames, NULL, NULL);
+			ia_css_pipe_get_generic_stage_desc(&stage_desc,
+							   post_isp_binary,
+							   out_frames,
+							   NULL, NULL);
 		} else {
-			ia_css_pipe_util_set_output_frames(out_frames, 0, out_frame);
-			ia_css_pipe_get_generic_stage_desc(&stage_desc, post_isp_binary,
-							    out_frames, NULL, NULL);
+			ia_css_pipe_util_set_output_frames(out_frames, 0,
+							   out_frame);
+			ia_css_pipe_get_generic_stage_desc(&stage_desc,
+							   post_isp_binary,
+							   out_frames,
+							   NULL, NULL);
 		}
 
-		err = ia_css_pipeline_create_and_add_stage(me,
-			&stage_desc, &current_stage);
+		err = ia_css_pipeline_create_and_add_stage(me, &stage_desc,
+							   &current_stage);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
@@ -7839,10 +7882,9 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 	} else if (mode == IA_CSS_CAPTURE_MODE_BAYER) {
 		ia_css_pipe_util_set_output_frames(out_frames, 0, out_frame);
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, pre_isp_binary,
-						    out_frames, in_frame, NULL);
-		err = ia_css_pipeline_create_and_add_stage(me,
-			&stage_desc,
-			NULL);
+						   out_frames, in_frame, NULL);
+		err = ia_css_pipeline_create_and_add_stage(me, &stage_desc,
+							   NULL);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
@@ -7857,31 +7899,34 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 
 		if (need_ldc) {
 			ia_css_pipe_util_set_output_frames(out_frames, 0, NULL);
-			ia_css_pipe_get_generic_stage_desc(&stage_desc, capture_ldc_binary,
-							    out_frames, local_in_frame, NULL);
+			ia_css_pipe_get_generic_stage_desc(&stage_desc,
+							   capture_ldc_binary,
+							   out_frames,
+							   local_in_frame,
+							   NULL);
 			err = ia_css_pipeline_create_and_add_stage(me,
-				&stage_desc,
-				&current_stage);
+								   &stage_desc,
+								   &current_stage);
 			local_in_frame = current_stage->args.out_frame[0];
 		}
 		err = add_capture_pp_stage(pipe, me, local_in_frame,
-					    need_yuv_pp ? NULL : out_frame,
+					   need_yuv_pp ? NULL : out_frame,
 #else
 	/* ldc and capture_pp not supported in same pipeline */
 	if (need_ldc && current_stage) {
 		in_frame = current_stage->args.out_frame[0];
 		ia_css_pipe_util_set_output_frames(out_frames, 0, out_frame);
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, capture_ldc_binary,
-						    out_frames, in_frame, NULL);
-		err = ia_css_pipeline_create_and_add_stage(me,
-			&stage_desc,
-			NULL);
+						   out_frames, in_frame, NULL);
+		err = ia_css_pipeline_create_and_add_stage(me, &stage_desc,
+							   NULL);
 	} else if (need_pp && current_stage) {
 		in_frame = current_stage->args.out_frame[0];
-		err = add_capture_pp_stage(pipe, me, in_frame, need_yuv_pp ? NULL : out_frame,
+		err = add_capture_pp_stage(pipe, me, in_frame,
+					   need_yuv_pp ? NULL : out_frame,
 #endif
-					    capture_pp_binary,
-					    &current_stage);
+					   capture_pp_binary,
+					   &current_stage);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
@@ -7898,10 +7943,10 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 			else
 				tmp_out_frame = NULL;
 
-			err = add_yuv_scaler_stage(pipe, me, tmp_in_frame, tmp_out_frame,
-						    NULL,
-						    &yuv_scaler_binary[i],
-						    &yuv_scaler_stage);
+			err = add_yuv_scaler_stage(pipe, me, tmp_in_frame,
+						   tmp_out_frame, NULL,
+						   &yuv_scaler_binary[i],
+						   &yuv_scaler_stage);
 			if (err) {
 				IA_CSS_LEAVE_ERR_PRIVATE(err);
 				return err;
@@ -7925,7 +7970,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 	    current_stage && vf_frame) {
 		in_frame = current_stage->args.out_vf_frame;
 		err = add_vf_pp_stage(pipe, in_frame, vf_frame, vf_pp_binary,
-					&current_stage);
+				      &current_stage);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
@@ -7976,7 +8021,7 @@ static int capture_start(struct ia_css_pipe *pipe)
 	me = &pipe->pipeline;
 
 	if ((pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_RAW   ||
-		pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_BAYER) &&
+	     pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_BAYER) &&
 	    (pipe->config.mode != IA_CSS_PIPE_MODE_COPY)) {
 		if (copy_on_sp(pipe)) {
 			err = start_copy_on_sp(pipe, &me->out_frame[0]);
@@ -8020,7 +8065,7 @@ static int capture_start(struct ia_css_pipe *pipe)
 	if (pipe->config.mode == IA_CSS_PIPE_MODE_COPY &&
 	    pipe->stream->reconfigure_css_rx) {
 		ia_css_isys_rx_configure(&pipe->stream->csi_rx_config,
-					    pipe->stream->config.mode);
+					 pipe->stream->config.mode);
 		pipe->stream->reconfigure_css_rx = false;
 	}
 #endif
@@ -8031,8 +8076,8 @@ static int capture_start(struct ia_css_pipe *pipe)
 
 static int
 sh_css_pipe_get_output_frame_info(struct ia_css_pipe *pipe,
-				    struct ia_css_frame_info *info,
-				    unsigned int idx)
+				  struct ia_css_frame_info *info,
+				  unsigned int idx)
 {
 	assert(pipe);
 	assert(info);
@@ -8050,7 +8095,7 @@ sh_css_pipe_get_output_frame_info(struct ia_css_pipe *pipe,
 		    IA_CSS_FRAME_FORMAT_BINARY_8,
 		    0);
 	} else if (info->format == IA_CSS_FRAME_FORMAT_RAW ||
-		    info->format == IA_CSS_FRAME_FORMAT_RAW_PACKED) {
+		   info->format == IA_CSS_FRAME_FORMAT_RAW_PACKED) {
 		info->raw_bit_depth =
 		ia_css_pipe_util_pipe_input_format_bpp(pipe);
 	}
@@ -8062,9 +8107,9 @@ sh_css_pipe_get_output_frame_info(struct ia_css_pipe *pipe,
 
 void
 ia_css_stream_send_input_frame(const struct ia_css_stream *stream,
-				const unsigned short *data,
-				unsigned int width,
-				unsigned int height)
+			       const unsigned short *data,
+			       unsigned int width,
+			       unsigned int height)
 {
 	assert(stream);
 
@@ -8088,22 +8133,22 @@ ia_css_stream_start_input_frame(const struct ia_css_stream *stream)
 
 void
 ia_css_stream_send_input_line(const struct ia_css_stream *stream,
-				const unsigned short *data,
-				unsigned int width,
-				const unsigned short *data2,
-				unsigned int width2)
+			      const unsigned short *data,
+			      unsigned int width,
+			      const unsigned short *data2,
+			      unsigned int width2)
 {
 	assert(stream);
 
 	ia_css_inputfifo_send_line(stream->config.channel_id,
-				    data, width, data2, width2);
+				   data, width, data2, width2);
 }
 
 void
 ia_css_stream_send_input_embedded_line(const struct ia_css_stream *stream,
-					enum atomisp_input_format format,
-					const unsigned short *data,
-					unsigned int width)
+				       enum atomisp_input_format format,
+				       const unsigned short *data,
+				       unsigned int width)
 {
 	assert(stream);
 	if (!data || width == 0)
@@ -8224,7 +8269,7 @@ acc_unload_extension(struct ia_css_fw_info *firmware)
 /* Load firmware for extension */
 static int
 ia_css_pipe_load_extension(struct ia_css_pipe *pipe,
-			    struct ia_css_fw_info *firmware)
+			   struct ia_css_fw_info *firmware)
 {
 	int err = 0;
 
@@ -8248,7 +8293,7 @@ ia_css_pipe_load_extension(struct ia_css_pipe *pipe,
 /* Unload firmware for extension */
 static void
 ia_css_pipe_unload_extension(struct ia_css_pipe *pipe,
-				struct ia_css_fw_info *firmware)
+			     struct ia_css_fw_info *firmware)
 {
 	IA_CSS_ENTER_PRIVATE("fw = %p pipe = %p", firmware, pipe);
 
@@ -8290,7 +8335,7 @@ ia_css_pipeline_uses_params(struct ia_css_pipeline *me)
 
 static int
 sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
-				const void *acc_fw)
+			      const void *acc_fw)
 {
 	struct ia_css_fw_info *fw = (struct ia_css_fw_info *)acc_fw;
 	/* In QoS case, load_extension already called, so skipping */
@@ -8308,8 +8353,8 @@ sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
 
 		ia_css_pipe_get_acc_stage_desc(&stage_desc, NULL, fw);
 		err = ia_css_pipeline_create_and_add_stage(pipeline,
-			&stage_desc,
-			NULL);
+							   &stage_desc,
+							   NULL);
 	}
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
@@ -8322,7 +8367,7 @@ sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
     * Refer to "sh_css_internal.h" for details.
     */
 int ia_css_stream_capture_frame(struct ia_css_stream *stream,
-	unsigned int exp_id)
+				unsigned int exp_id)
 {
 	struct sh_css_tag_descr tag_descr;
 	u32 encoded_tag_descr;
@@ -8478,22 +8523,22 @@ sh_css_init_host_sp_control_vars(void)
 	(void)HIVE_ADDR_host_sp_com;
 
 	sp_dmem_store_uint32(SP0_ID,
-				(unsigned int)sp_address_of(ia_css_ispctrl_sp_isp_started),
-				(uint32_t)(0));
+			     (unsigned int)sp_address_of(ia_css_ispctrl_sp_isp_started),
+			     (uint32_t)(0));
 
 	sp_dmem_store_uint32(SP0_ID,
-				(unsigned int)sp_address_of(host_sp_queues_initialized),
-				(uint32_t)(0));
+			     (unsigned int)sp_address_of(host_sp_queues_initialized),
+			     (uint32_t)(0));
 	sp_dmem_store_uint32(SP0_ID,
-				(unsigned int)sp_address_of(sp_sleep_mode),
-				(uint32_t)(0));
+			     (unsigned int)sp_address_of(sp_sleep_mode),
+			     (uint32_t)(0));
 	sp_dmem_store_uint32(SP0_ID,
-				(unsigned int)sp_address_of(ia_css_dmaproxy_sp_invalidate_tlb),
-				(uint32_t)(false));
+			     (unsigned int)sp_address_of(ia_css_dmaproxy_sp_invalidate_tlb),
+			     (uint32_t)(false));
 #ifndef ISP2401
 	sp_dmem_store_uint32(SP0_ID,
-				(unsigned int)sp_address_of(sp_stop_copy_preview),
-				my_css.stop_copy_preview ? (uint32_t)(1) : (uint32_t)(0));
+			     (unsigned int)sp_address_of(sp_stop_copy_preview),
+			     my_css.stop_copy_preview ? (uint32_t)(1) : (uint32_t)(0));
 #endif
 	store_sp_array_uint(host_sp_com, o, host2sp_cmd_ready);
 
@@ -8520,8 +8565,7 @@ void ia_css_pipe_config_defaults(struct ia_css_pipe_config *pipe_config)
 }
 
 void
-ia_css_pipe_extra_config_defaults(struct ia_css_pipe_extra_config
-				    *extra_config)
+ia_css_pipe_extra_config_defaults(struct ia_css_pipe_extra_config *extra_config)
 {
 	if (!extra_config) {
 		IA_CSS_ERROR("NULL input parameter");
@@ -8595,8 +8639,8 @@ int ia_css_pipe_create(const struct ia_css_pipe_config *config,
 
 int
 ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
-			    const struct ia_css_pipe_extra_config *extra_config,
-			    struct ia_css_pipe **pipe)
+			 const struct ia_css_pipe_extra_config *extra_config,
+			 struct ia_css_pipe **pipe)
 {
 	int err = -EINVAL;
 	struct ia_css_pipe *internal_pipe = NULL;
@@ -8664,7 +8708,7 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 
 	/* YUV downscaling */
 	if ((internal_pipe->config.vf_pp_in_res.width ||
-		internal_pipe->config.capt_pp_in_res.width)) {
+	     internal_pipe->config.capt_pp_in_res.width)) {
 		enum ia_css_frame_format format;
 
 		if (internal_pipe->config.vf_pp_in_res.width) {
@@ -8740,7 +8784,7 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 	}
 	if (internal_pipe->config.acc_extension) {
 		err = ia_css_pipe_load_extension(internal_pipe,
-						    internal_pipe->config.acc_extension);
+						 internal_pipe->config.acc_extension);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			kvfree(internal_pipe);
@@ -8758,7 +8802,7 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 
 int
 ia_css_pipe_get_info(const struct ia_css_pipe *pipe,
-			struct ia_css_pipe_info *pipe_info)
+		     struct ia_css_pipe_info *pipe_info)
 {
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 			    "ia_css_pipe_get_info()\n");
@@ -8794,8 +8838,8 @@ bool ia_css_pipe_has_dvs_stats(struct ia_css_pipe_info *pipe_info)
 
 int
 ia_css_pipe_override_frame_format(struct ia_css_pipe *pipe,
-				    int pin_index,
-				    enum ia_css_frame_format new_format)
+				  int pin_index,
+				  enum ia_css_frame_format new_format)
 {
 	int err = 0;
 
@@ -8875,10 +8919,8 @@ ia_css_stream_configure_rx(struct ia_css_stream *stream)
 #endif
 
 static struct ia_css_pipe *
-find_pipe(struct ia_css_pipe *pipes[],
-	    unsigned int num_pipes,
-	    enum ia_css_pipe_mode mode,
-	    bool copy_pipe)
+find_pipe(struct ia_css_pipe *pipes[], unsigned int num_pipes,
+	  enum ia_css_pipe_mode mode, bool copy_pipe)
 {
 	unsigned int i;
 
@@ -8947,7 +8989,7 @@ ia_css_acc_stream_create(struct ia_css_stream *stream)
 
 static int
 metadata_info_init(const struct ia_css_metadata_config *mdc,
-		    struct ia_css_metadata_info *md)
+		   struct ia_css_metadata_info *md)
 {
 	/* Either both width and height should be set or neither */
 	if ((mdc->resolution.height > 0) ^ (mdc->resolution.width > 0))
@@ -8975,7 +9017,7 @@ static int check_pipe_resolutions(const struct ia_css_pipe *pipe)
 	}
 
 	if (ia_css_util_check_res(pipe->config.input_effective_res.width,
-				    pipe->config.input_effective_res.height) != 0) {
+				  pipe->config.input_effective_res.height) != 0) {
 		IA_CSS_ERROR("effective resolution not supported");
 		err = -EINVAL;
 		goto EXIT;
@@ -8983,7 +9025,7 @@ static int check_pipe_resolutions(const struct ia_css_pipe *pipe)
 	if (!ia_css_util_resolution_is_zero(
 		pipe->stream->config.input_config.input_res)) {
 		if (!ia_css_util_res_leq(pipe->config.input_effective_res,
-					    pipe->stream->config.input_config.input_res)) {
+					 pipe->stream->config.input_config.input_res)) {
 			IA_CSS_ERROR("effective resolution is larger than input resolution");
 			err = -EINVAL;
 			goto EXIT;
@@ -9006,9 +9048,9 @@ static int check_pipe_resolutions(const struct ia_css_pipe *pipe)
 
 int
 ia_css_stream_create(const struct ia_css_stream_config *stream_config,
-			int num_pipes,
-			struct ia_css_pipe *pipes[],
-			struct ia_css_stream **stream)
+		     int num_pipes,
+		     struct ia_css_pipe *pipes[],
+		     struct ia_css_stream **stream)
 {
 	struct ia_css_pipe *curr_pipe;
 	struct ia_css_stream *curr_stream = NULL;
@@ -9169,11 +9211,11 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	case IA_CSS_INPUT_MODE_TPG:
 #if !defined(ISP2401)
 		IA_CSS_LOG("tpg_configuration: x_mask=%d, y_mask=%d, x_delta=%d, y_delta=%d, xy_mask=%d",
-			    curr_stream->config.source.tpg.x_mask,
-			    curr_stream->config.source.tpg.y_mask,
-			    curr_stream->config.source.tpg.x_delta,
-			    curr_stream->config.source.tpg.y_delta,
-			    curr_stream->config.source.tpg.xy_mask);
+			   curr_stream->config.source.tpg.x_mask,
+			   curr_stream->config.source.tpg.y_mask,
+			   curr_stream->config.source.tpg.x_delta,
+			   curr_stream->config.source.tpg.y_delta,
+			   curr_stream->config.source.tpg.xy_mask);
 
 		sh_css_sp_configure_tpg(
 		    curr_stream->config.source.tpg.x_mask,
@@ -9198,9 +9240,8 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	}
 
 #ifdef ISP2401
-	err = aspect_ratio_crop_init(curr_stream,
-					pipes,
-					&aspect_ratio_crop_enabled);
+	err = aspect_ratio_crop_init(curr_stream, pipes,
+				     &aspect_ratio_crop_enabled);
 	if (err) {
 		IA_CSS_LEAVE_ERR(err);
 		goto ERR;
@@ -9237,8 +9278,8 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 			curr_pipe->config.input_effective_res = effective_res;
 		}
 		IA_CSS_LOG("effective_res=%dx%d",
-			    effective_res.width,
-			    effective_res.height);
+			   effective_res.width,
+			   effective_res.height);
 	}
 
 	if (IS_ISP2401) {
@@ -9266,13 +9307,13 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	if (!spcopyonly) {
 		sensor_binning_changed =
 		    sh_css_params_set_binning_factor(curr_stream,
-							curr_stream->config.sensor_binning_factor);
+						     curr_stream->config.sensor_binning_factor);
 	} else {
 		sensor_binning_changed = false;
 	}
 
 	IA_CSS_LOG("sensor_binning=%d, changed=%d",
-		    curr_stream->config.sensor_binning_factor, sensor_binning_changed);
+		   curr_stream->config.sensor_binning_factor, sensor_binning_changed);
 	/* loop over pipes */
 	IA_CSS_LOG("num_pipes=%d", num_pipes);
 	curr_stream->cont_capt = false;
@@ -9296,17 +9337,18 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 
 		/* Create copy pipe here, since it may not be exposed to the driver */
 		preview_pipe = find_pipe(pipes, num_pipes,
-					    IA_CSS_PIPE_MODE_PREVIEW, false);
+					 IA_CSS_PIPE_MODE_PREVIEW, false);
 		video_pipe = find_pipe(pipes, num_pipes,
-					IA_CSS_PIPE_MODE_VIDEO, false);
-		acc_pipe = find_pipe(pipes, num_pipes,
-					IA_CSS_PIPE_MODE_ACC, false);
+				       IA_CSS_PIPE_MODE_VIDEO, false);
+		acc_pipe = find_pipe(pipes, num_pipes, IA_CSS_PIPE_MODE_ACC,
+				     false);
 		if (acc_pipe && num_pipes == 2 && curr_stream->cont_capt)
 			curr_stream->cont_capt =
 			    false; /* preview + QoS case will not need cont_capt switch */
 		if (curr_stream->cont_capt) {
 			capture_pipe = find_pipe(pipes, num_pipes,
-						    IA_CSS_PIPE_MODE_CAPTURE, false);
+						 IA_CSS_PIPE_MODE_CAPTURE,
+						 false);
 			if (!capture_pipe) {
 				err = -EINVAL;
 				goto ERR;
@@ -9388,10 +9430,12 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		if (!spcopyonly) {
 			if (!IS_ISP2401)
 				err = sh_css_pipe_get_shading_info(curr_pipe,
-								    &pipe_info->shading_info, NULL);
+								   &pipe_info->shading_info,
+								   NULL);
 			else
 				err = sh_css_pipe_get_shading_info(curr_pipe,
-								    &pipe_info->shading_info, &curr_pipe->config);
+								   &pipe_info->shading_info,
+								   &curr_pipe->config);
 
 			if (err)
 				goto ERR;
@@ -9401,7 +9445,8 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 				goto ERR;
 			for (j = 0; j < IA_CSS_PIPE_MAX_OUTPUT_STAGE; j++) {
 				sh_css_pipe_get_viewfinder_frame_info(curr_pipe,
-									&pipe_info->vf_output_info[j], j);
+								      &pipe_info->vf_output_info[j],
+								      j);
 				if (err)
 					goto ERR;
 			}
@@ -9586,7 +9631,7 @@ ia_css_stream_destroy(struct ia_css_stream *stream)
 
 int
 ia_css_stream_get_info(const struct ia_css_stream *stream,
-			struct ia_css_stream_info *stream_info)
+		       struct ia_css_stream_info *stream_info)
 {
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_get_info: enter/exit\n");
 	assert(stream);
@@ -9872,7 +9917,7 @@ ia_css_stream_get_3a_binary(const struct ia_css_stream *stream)
 
 int
 ia_css_stream_set_output_padded_width(struct ia_css_stream *stream,
-					unsigned int output_padded_width)
+				      unsigned int output_padded_width)
 {
 	struct ia_css_pipe *pipe;
 
@@ -10349,7 +10394,7 @@ ia_css_unlock_raw_frame(struct ia_css_stream *stream, uint32_t exp_id)
     */
 int
 ia_css_pipe_set_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
-				bool enable)
+			      bool enable)
 {
 	unsigned int thread_id;
 	struct ia_css_pipeline_stage *stage;
@@ -10395,7 +10440,7 @@ ia_css_pipe_set_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
     */
 int
 ia_css_pipe_get_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
-				bool *enable)
+			      bool *enable)
 {
 	struct ia_css_pipeline_stage *stage;
 	unsigned int thread_id;
@@ -10431,9 +10476,9 @@ ia_css_pipe_get_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
 /* ISP2401 */
 int
 ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
-					u32 fw_handle,
-					struct ia_css_isp_param_css_segments *css_seg,
-					struct ia_css_isp_param_isp_segments *isp_seg)
+				      u32 fw_handle,
+				      struct ia_css_isp_param_css_segments *css_seg,
+				      struct ia_css_isp_param_isp_segments *isp_seg)
 {
 	unsigned int HIVE_ADDR_sp_group;
 	static struct sh_css_sp_group sp_group;
@@ -10468,7 +10513,7 @@ ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
 		if (!err) {
 			/* Get the Extension State */
 			enabled = (SH_CSS_QOS_STAGE_IS_ENABLED(&sh_css_sp_group.pipe[thread_id],
-								stage->stage_num)) ? true : false;
+							       stage->stage_num)) ? true : false;
 			/* Update mapped arg only when extension stage is not enabled */
 			if (enabled) {
 				IA_CSS_ERROR("Leaving: cannot update when stage is enabled.");
@@ -10478,13 +10523,14 @@ ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
 
 				HIVE_ADDR_sp_group = fw->info.sp.group;
 				sp_dmem_load(SP0_ID,
-						(unsigned int)sp_address_of(sp_group),
-						&sp_group, sizeof(struct sh_css_sp_group));
+					     (unsigned int)sp_address_of(sp_group),
+					     &sp_group,
+					     sizeof(struct sh_css_sp_group));
 				hmm_load(sp_group.pipe[thread_id].sp_stage_addr[stage_num],
-					    &sp_stage, sizeof(struct sh_css_sp_stage));
+					 &sp_stage, sizeof(struct sh_css_sp_stage));
 
 				hmm_load(sp_stage.isp_stage_addr,
-					    &isp_stage, sizeof(struct sh_css_isp_stage));
+					 &isp_stage, sizeof(struct sh_css_isp_stage));
 
 				for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++) {
 					isp_stage.mem_initializers.params[IA_CSS_PARAM_CLASS_PARAM][mem].address =
@@ -10500,7 +10546,8 @@ ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
 				}
 
 				hmm_store(sp_stage.isp_stage_addr,
-					    &isp_stage, sizeof(struct sh_css_isp_stage));
+					  &isp_stage,
+					  sizeof(struct sh_css_isp_stage));
 			}
 		}
 	}
@@ -10511,8 +10558,8 @@ ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
 #ifdef ISP2401
 static int
 aspect_ratio_crop_init(struct ia_css_stream *curr_stream,
-			struct ia_css_pipe *pipes[],
-			bool *do_crop_status)
+		       struct ia_css_pipe *pipes[],
+		       bool *do_crop_status)
 {
 	int err = 0;
 	int i;
@@ -10558,7 +10605,7 @@ aspect_ratio_crop_check(bool enabled, struct ia_css_pipe *curr_pipe)
 
 static int
 aspect_ratio_crop(struct ia_css_pipe *curr_pipe,
-		    struct ia_css_resolution *effective_res)
+		  struct ia_css_resolution *effective_res)
 {
 	int err = 0;
 	struct ia_css_resolution crop_res;
@@ -10618,7 +10665,7 @@ aspect_ratio_crop(struct ia_css_pipe *curr_pipe,
 	case IA_CSS_PIPE_MODE_YUVPP:
 	default:
 		IA_CSS_ERROR("aspect ratio cropping invalid args: mode[%d]\n",
-				curr_pipe->config.mode);
+			     curr_pipe->config.mode);
 		assert(0);
 		break;
 	}
@@ -10682,7 +10729,7 @@ static struct sh_css_hmm_buffer_record
 
 	assert(h_vbuf);
 	assert((type > IA_CSS_BUFFER_TYPE_INVALID) &&
-		(type < IA_CSS_NUM_DYNAMIC_BUFFER_TYPE));
+	       (type < IA_CSS_NUM_DYNAMIC_BUFFER_TYPE));
 	assert(kernel_ptr != 0);
 
 	buffer_record = &hmm_buffer_record[0];
-- 
2.31.1

