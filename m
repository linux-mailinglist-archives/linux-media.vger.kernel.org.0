Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 355334530D3
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 12:32:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235510AbhKPLfS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 06:35:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:35184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235189AbhKPLco (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 06:32:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A213261BF6;
        Tue, 16 Nov 2021 11:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637062148;
        bh=pLvEitHi25Sj0Gs1Tw+e+91BublgvdDb7EyvZ6K2fS4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gFYaD7kyGDOi7qKzBvRQbMIyVIhUjM93lpCM27NKlarfQJL3799coXafLhzZdqyYb
         RGuerRjykx10fYh+R+3hCiIXXwJZuKiWIj8fm+gxsIqjvhb5RDm13LzNg5jPNWL5FB
         oLxi15g5Ra5yTOkhOoLaWV8Bfh0Lh9qg0/sKc9W9pOwrVwVtzqmTYP6Egi8Cj2iQKb
         JJU4f2r+3I6fHkHlHIY7Iu6YFXlmgWdFdkRa/7zmPU8KwYPF2xYfLLuhzd45ogSuap
         qeMucDTAMJv1g/eaHco+Z4TCLlTDUuw4GkV5beaV0x5bTify/ikEvT++Q2106rYmkg
         fGg7d2TzkqFBQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mmwe9-008QgA-Ne; Tue, 16 Nov 2021 11:29:05 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Martiros Shakhzadyan <vrzh@vrzh.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 22/23] media: atomisp: make sh_css similar to Intel Aero driver
Date:   Tue, 16 Nov 2021 11:29:03 +0000
Message-Id: <3ce81621f5fe97c490745185260f70ddb401b0ec.1637061474.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637061474.git.mchehab+huawei@kernel.org>
References: <cover.1637061474.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As we're using the firmware from Intel Aero, ensure that the
logic inside sh_css as similar as possible to such driver.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/23] at: https://lore.kernel.org/all/cover.1637061474.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/sh_css.c | 150 +++------------------
 1 file changed, 19 insertions(+), 131 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 8bcf610ccae3..e5e22f966286 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -210,7 +210,6 @@ ia_css_pipe_check_format(struct ia_css_pipe *pipe,
 
 /* ISP 2401 */
 static int
-static int
 ia_css_pipe_load_extension(struct ia_css_pipe *pipe,
 			   struct ia_css_fw_info *firmware);
 
@@ -1023,17 +1022,6 @@ sh_css_config_input_network(struct ia_css_stream *stream)
 			pipe = stream->last_pipe->pipe_settings.video.copy_pipe;
 	} else {
 		pipe = stream->last_pipe;
-		if (stream->last_pipe->config.mode == IA_CSS_PIPE_MODE_CAPTURE) {
-			/*
-			 * We need to poll the ISYS HW in capture_indication itself
-			 * for "non-continuous" capture usecase for getting accurate
-			 * isys frame capture timestamps.
-			 * This is because the capturepipe propcessing takes longer
-			 * to execute than the input system frame capture.
-			 * 2401 specific
-			 */
-			early_polling = true;
-		}
 	}
 
 	if (!pipe)
@@ -2695,17 +2683,6 @@ load_preview_binaries(struct ia_css_pipe *pipe)
 	if (err)
 		return err;
 
-	if (IS_ISP2401) {
-		/* The delay latency determines the number of invalid frames after
-		* a stream is started. */
-		pipe->num_invalid_frames = pipe->dvs_frame_delay;
-		pipe->info.num_invalid_frames = pipe->num_invalid_frames;
-
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
-				    "load_preview_binaries() num_invalid_frames=%d dvs_frame_delay=%d\n",
-				    pipe->num_invalid_frames, pipe->dvs_frame_delay);
-	}
-
 	/* The vf_pp binary is needed when (further) YUV downscaling is required */
 	need_vf_pp |= mycs->preview_binary.out_frame_info[0].res.width != pipe_out_info->res.width;
 	need_vf_pp |= mycs->preview_binary.out_frame_info[0].res.height != pipe_out_info->res.height;
@@ -4847,6 +4824,8 @@ sh_css_pipe_get_grid_info(struct ia_css_pipe *pipe,
 		ia_css_binary_dvs_stat_grid_info(binary, info, pipe);
 	} else {
 		memset(&info->dvs_grid, 0, sizeof(info->dvs_grid));
+		memset(&info->dvs_grid.dvs_stat_grid_info, 0,
+			   sizeof(info->dvs_grid.dvs_stat_grid_info));
 	}
 
 	if (binary) {
@@ -5173,35 +5152,10 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 		return err;
 
 	if (mycs->video_binary.info->sp.enable.block_output) {
-		unsigned int tnr_width;
-		unsigned int tnr_height;
-
 		tnr_info = mycs->video_binary.out_frame_info[0];
 
-		if (IS_ISP2401) {
-			/* Select resolution for TNR. If
-			* output_system_in_resolution(GDC_out_resolution) is
-			* being used, then select that as it will also be in resolution for
-			* TNR. At present, it only make sense for Skycam */
-			if (pipe->config.output_system_in_res.width &&
-			    pipe->config.output_system_in_res.height) {
-				tnr_width = pipe->config.output_system_in_res.width;
-				tnr_height = pipe->config.output_system_in_res.height;
-			} else {
-				tnr_width = tnr_info.res.width;
-				tnr_height = tnr_info.res.height;
-			}
-
-			/* Make tnr reference buffers output block width(in pix) align */
-			tnr_info.res.width  = CEIL_MUL(tnr_width,
-						       (mycs->video_binary.info->sp.block.block_width * ISP_NWAY));
-			tnr_info.padded_width = tnr_info.res.width;
-		} else {
-			tnr_height = tnr_info.res.height;
-		}
-
 		/* Make tnr reference buffers output block height align */
-		tnr_info.res.height = CEIL_MUL(tnr_height,
+		tnr_info.res.height = CEIL_MUL(tnr_info.res.height,
 					       mycs->video_binary.info->sp.block.output_block_height);
 	} else {
 		tnr_info = mycs->video_binary.internal_frame_info;
@@ -5434,12 +5388,6 @@ static bool need_capture_pp(
 	assert(pipe);
 	assert(pipe->mode == IA_CSS_PIPE_ID_CAPTURE);
 
-	if (IS_ISP2401) {
-		/* ldc and capture_pp are not supported in the same pipeline */
-		if (need_capt_ldc(pipe))
-			return false;
-	}
-
 	/* determine whether we need to use the capture_pp binary.
 	 * This is needed for:
 	 *   1. XNR or
@@ -5648,33 +5596,13 @@ static int load_primary_binaries(
 
 	/* TODO Do we disable ldc for skycam */
 	need_ldc = need_capt_ldc(pipe);
-	if (IS_ISP2401 && need_ldc) {
-		/* ldc and capt_pp are not supported in the same pipeline */
-		struct ia_css_binary_descr capt_ldc_descr;
-
-		ia_css_pipe_get_ldc_binarydesc(pipe,
-					       &capt_ldc_descr, &prim_out_info,
-					       &capt_pp_out_info);
-
-		err = ia_css_binary_find(&capt_ldc_descr,
-					 &mycs->capture_ldc_binary);
-		if (err) {
-			IA_CSS_LEAVE_ERR_PRIVATE(err);
-			return err;
-		}
-		need_pp = false;
-		need_ldc = false;
-	}
 
 	/* we build up the pipeline starting at the end */
 	/* Capture post-processing */
 	if (need_pp) {
 		struct ia_css_binary_descr capture_pp_descr;
 
-		if (!IS_ISP2401)
-			capt_pp_in_info = need_ldc ? &capt_ldc_out_info : &prim_out_info;
-		else
-			capt_pp_in_info = &prim_out_info;
+		capt_pp_in_info = need_ldc ? &capt_ldc_out_info : &prim_out_info;
 
 		ia_css_pipe_get_capturepp_binarydesc(pipe,
 						     &capture_pp_descr,
@@ -7575,7 +7503,6 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 		}
 	}
 
-#ifndef ISP2401
 	if (need_pp && current_stage) {
 		struct ia_css_frame *local_in_frame = NULL;
 
@@ -7595,20 +7522,6 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 		}
 		err = add_capture_pp_stage(pipe, me, local_in_frame,
 					   need_yuv_pp ? NULL : out_frame,
-#else
-	/* ldc and capture_pp not supported in same pipeline */
-	if (need_ldc && current_stage) {
-		in_frame = current_stage->args.out_frame[0];
-		ia_css_pipe_util_set_output_frames(out_frames, 0, out_frame);
-		ia_css_pipe_get_generic_stage_desc(&stage_desc, capture_ldc_binary,
-						   out_frames, in_frame, NULL);
-		err = ia_css_pipeline_create_and_add_stage(me, &stage_desc,
-							   NULL);
-	} else if (need_pp && current_stage) {
-		in_frame = current_stage->args.out_frame[0];
-		err = add_capture_pp_stage(pipe, me, in_frame,
-					   need_yuv_pp ? NULL : out_frame,
-#endif
 					   capture_pp_binary,
 					   &current_stage);
 		if (err) {
@@ -7722,7 +7635,7 @@ static int capture_start(struct ia_css_pipe *pipe)
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
-#elif defined(ISP2401)
+#else
 	if (pipe->config.mode != IA_CSS_PIPE_MODE_COPY) {
 		err = send_mipi_frames(pipe);
 		if (err) {
@@ -7730,7 +7643,6 @@ static int capture_start(struct ia_css_pipe *pipe)
 			return err;
 		}
 	}
-
 #endif
 
 	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
@@ -8176,9 +8088,7 @@ sh_css_init_host_sp_control_vars(void)
 	unsigned int HIVE_ADDR_host_sp_queues_initialized;
 	unsigned int HIVE_ADDR_sp_sleep_mode;
 	unsigned int HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb;
-#ifndef ISP2401
 	unsigned int HIVE_ADDR_sp_stop_copy_preview;
-#endif
 	unsigned int HIVE_ADDR_host_sp_com;
 	unsigned int o = offsetof(struct host_sp_communication, host2sp_command)
 			    / sizeof(int);
@@ -8195,9 +8105,7 @@ sh_css_init_host_sp_control_vars(void)
 	    fw->info.sp.host_sp_queues_initialized;
 	HIVE_ADDR_sp_sleep_mode = fw->info.sp.sleep_mode;
 	HIVE_ADDR_ia_css_dmaproxy_sp_invalidate_tlb = fw->info.sp.invalidate_tlb;
-#ifndef ISP2401
 	HIVE_ADDR_sp_stop_copy_preview = fw->info.sp.stop_copy_preview;
-#endif
 	HIVE_ADDR_host_sp_com = fw->info.sp.host_sp_com;
 
 	sp_dmem_store_uint32(SP0_ID,
@@ -8213,11 +8121,9 @@ sh_css_init_host_sp_control_vars(void)
 	sp_dmem_store_uint32(SP0_ID,
 			     (unsigned int)sp_address_of(ia_css_dmaproxy_sp_invalidate_tlb),
 			     (uint32_t)(false));
-#ifndef ISP2401
 	sp_dmem_store_uint32(SP0_ID,
 			     (unsigned int)sp_address_of(sp_stop_copy_preview),
 			     my_css.stop_copy_preview ? (uint32_t)(1) : (uint32_t)(0));
-#endif
 	store_sp_array_uint(host_sp_com, o, host2sp_cmd_ready);
 
 	for (i = 0; i < N_CSI_PORTS; i++) {
@@ -8937,9 +8843,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		if (num_pipes >= 2) {
 			curr_stream->cont_capt = true;
 			curr_stream->disable_cont_vf = curr_stream->config.disable_cont_viewfinder;
-
-			if (!IS_ISP2401)
-				curr_stream->stop_copy_preview = my_css.stop_copy_preview;
+			curr_stream->stop_copy_preview = my_css.stop_copy_preview;
 		}
 
 		/* Create copy pipe here, since it may not be exposed to the driver */
@@ -8997,16 +8901,15 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		/* set current stream */
 		curr_pipe->stream = curr_stream;
 
-		if (!IS_ISP2401) {
-			/* take over effective info */
+		/* take over effective info */
+
+		effective_res = curr_pipe->config.input_effective_res;
+		err = ia_css_util_check_res(
+			effective_res.width,
+			effective_res.height);
+		if (err)
+			goto ERR;
 
-			effective_res = curr_pipe->config.input_effective_res;
-			err = ia_css_util_check_res(
-				effective_res.width,
-				effective_res.height);
-			if (err)
-				goto ERR;
-		}
 		/* sensor binning per pipe */
 		if (sensor_binning_changed)
 			sh_css_pipe_free_shading_table(curr_pipe);
@@ -9031,9 +8934,6 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 				goto ERR;
 		}
 
-		if (IS_ISP2401)
-			pipe_info->output_system_in_res_info = curr_pipe->config.output_system_in_res;
-
 		if (!spcopyonly) {
 			if (!IS_ISP2401)
 				err = sh_css_pipe_get_shading_info(curr_pipe,
@@ -9133,8 +9033,6 @@ ia_css_stream_destroy(struct ia_css_stream *stream)
 	if ((stream->last_pipe) &&
 	    ia_css_pipeline_is_mapped(stream->last_pipe->pipe_num)) {
 #if defined(ISP2401)
-		bool free_mpi;
-
 		for (i = 0; i < stream->num_pipes; i++) {
 			struct ia_css_pipe *entry = stream->pipes[i];
 			unsigned int sp_thread_id;
@@ -9158,13 +9056,7 @@ ia_css_stream_destroy(struct ia_css_stream *stream)
 				}
 			}
 		}
-		free_mpi = stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR;
-		if (IS_ISP2401) {
-			free_mpi |= stream->config.mode == IA_CSS_INPUT_MODE_TPG;
-			free_mpi |= stream->config.mode == IA_CSS_INPUT_MODE_PRBS;
-		}
-
-		if (free_mpi) {
+		if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 			for (i = 0; i < stream->num_pipes; i++) {
 				struct ia_css_pipe *entry = stream->pipes[i];
 				/*
@@ -9699,14 +9591,10 @@ ia_css_stop_sp(void)
 	}
 
 	/* For now, stop whole SP */
-	if (!IS_ISP2401) {
-		sh_css_write_host2sp_command(host2sp_cmd_terminate);
-	} else {
-		if (!sh_css_write_host2sp_command(host2sp_cmd_terminate)) {
-			IA_CSS_ERROR("Call to 'sh-css_write_host2sp_command()' failed");
-			ia_css_debug_dump_sp_sw_debug_info();
-			ia_css_debug_dump_debug_info(NULL);
-		}
+	if (!sh_css_write_host2sp_command(host2sp_cmd_terminate)) {
+		IA_CSS_ERROR("Call to 'sh-css_write_host2sp_command()' failed");
+		ia_css_debug_dump_sp_sw_debug_info();
+		ia_css_debug_dump_debug_info(NULL);
 	}
 
 	sh_css_sp_set_sp_running(false);
-- 
2.33.1

