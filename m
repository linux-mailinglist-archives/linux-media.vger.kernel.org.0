Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76BC364A79
	for <lists+linux-media@lfdr.de>; Mon, 19 Apr 2021 21:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241675AbhDSTXj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Apr 2021 15:23:39 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:54565 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239503AbhDSTXj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Apr 2021 15:23:39 -0400
X-Originating-IP: 24.194.32.49
Received: from coplandos.local (cpe-24-194-32-49.nycap.res.rr.com [24.194.32.49])
        (Authenticated sender: vrzh@vrzh.net)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 18BAD6000C;
        Mon, 19 Apr 2021 19:23:05 +0000 (UTC)
From:   Martiros Shakhzadyan <vrzh@vrzh.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Martiros Shakhzadyan <vrzh@vrzh.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: [PATCH 1/8] staging: media: atomisp: Fix the rest of sh_css.c brace issues
Date:   Mon, 19 Apr 2021 15:25:55 -0400
Message-Id: <20210419192602.498815-2-vrzh@vrzh.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192602.498815-1-vrzh@vrzh.net>
References: <20210419192602.498815-1-vrzh@vrzh.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the remainder of brace coding style issues.

Signed-off-by: Martiros Shakhzadyan <vrzh@vrzh.net>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 1134 +++++++++-----------
 1 file changed, 498 insertions(+), 636 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 01ce6005ead4..ac748da7a7ef 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1101,8 +1101,7 @@ sh_css_config_input_network(struct ia_css_stream *stream)
 	/* get the target input terminal */
 	sp_pipeline_input_terminal = &sh_css_sp_group.pipe_io[sp_thread_id].input;
 
-	for (i = 0; i < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; i++)
-	{
+	for (i = 0; i < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; i++) {
 		/* initialization */
 		memset((void *)(&isys_stream_descr), 0, sizeof(ia_css_isys_descr_t));
 		sp_pipeline_input_terminal->context.virtual_input_system_stream[i].valid = 0;
@@ -2156,7 +2155,6 @@ init_pipe_defaults(enum ia_css_pipe_mode mode,
 		   struct ia_css_pipe *pipe,
 		   bool copy_pipe)
 {
-
 	if (!pipe) {
 		IA_CSS_ERROR("NULL pipe parameter");
 		return -EINVAL;
@@ -2258,12 +2256,12 @@ pipe_release_pipe_num(unsigned int pipe_num)
 static int
 create_pipe(enum ia_css_pipe_mode mode,
 	    struct ia_css_pipe **pipe,
-	    bool copy_pipe) {
+	    bool copy_pipe)
+{
 	int err = 0;
 	struct ia_css_pipe *me;
 
-	if (!pipe)
-	{
+	if (!pipe) {
 		IA_CSS_ERROR("NULL pipe parameter");
 		return -EINVAL;
 	}
@@ -2273,15 +2271,13 @@ create_pipe(enum ia_css_pipe_mode mode,
 		return -ENOMEM;
 
 	err = init_pipe_defaults(mode, me, copy_pipe);
-	if (err)
-	{
+	if (err) {
 		kfree(me);
 		return err;
 	}
 
 	err = pipe_generate_pipe_num(me, &me->pipe_num);
-	if (err)
-	{
+	if (err) {
 		kfree(me);
 		return err;
 	}
@@ -2326,26 +2322,24 @@ static void sh_css_pipe_free_acc_binaries(
 }
 
 int
-ia_css_pipe_destroy(struct ia_css_pipe *pipe) {
+ia_css_pipe_destroy(struct ia_css_pipe *pipe)
+{
 	int err = 0;
 
 	IA_CSS_ENTER("pipe = %p", pipe);
 
-	if (!pipe)
-	{
+	if (!pipe) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
 
-	if (pipe->stream)
-	{
+	if (pipe->stream) {
 		IA_CSS_LOG("ia_css_stream_destroy not called!");
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
 
-	switch (pipe->config.mode)
-	{
+	switch (pipe->config.mode) {
 	case IA_CSS_PIPE_MODE_PREVIEW:
 		/* need to take into account that this function is also called
 		   on the internal copy pipe */
@@ -2409,9 +2403,8 @@ ia_css_pipe_destroy(struct ia_css_pipe *pipe) {
 
 	/* Temporarily, not every sh_css_pipe has an acc_extension. */
 	if (pipe->config.acc_extension)
-	{
 		ia_css_pipe_unload_extension(pipe, pipe->config.acc_extension);
-	}
+
 	kfree(pipe);
 	IA_CSS_LEAVE("err = %d", err);
 	return err;
@@ -2441,9 +2434,9 @@ ia_css_uninit(void)
 	ifmtr_set_if_blocking_mode_reset = true;
 #endif
 
-	if (!fw_explicitly_loaded) {
+	if (!fw_explicitly_loaded)
 		ia_css_unload_firmware();
-	}
+
 	ia_css_spctrl_unload_fw(SP0_ID);
 	sh_css_sp_set_sp_running(false);
 	/* check and free any remaining mipi frames */
@@ -2630,7 +2623,8 @@ static int load_copy_binary(
 
 static int
 alloc_continuous_frames(
-    struct ia_css_pipe *pipe, bool init_time) {
+    struct ia_css_pipe *pipe, bool init_time)
+{
 	int err = 0;
 	struct ia_css_frame_info ref_info;
 	enum ia_css_pipe_id pipe_id;
@@ -2640,8 +2634,7 @@ alloc_continuous_frames(
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p, init_time = %d", pipe, init_time);
 
-	if ((!pipe) || (!pipe->stream))
-	{
+	if ((!pipe) || (!pipe->stream)) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -2649,26 +2642,22 @@ alloc_continuous_frames(
 	pipe_id = pipe->mode;
 	continuous = pipe->stream->config.continuous;
 
-	if (continuous)
-	{
+	if (continuous) {
 		if (init_time) {
 			num_frames = pipe->stream->config.init_num_cont_raw_buf;
 			pipe->stream->continuous_pipe = pipe;
-		} else
+		} else {
 			num_frames = pipe->stream->config.target_num_cont_raw_buf;
-	} else
-	{
+		}
+	} else {
 		num_frames = NUM_ONLINE_INIT_CONTINUOUS_FRAMES;
 	}
 
-	if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
-	{
+	if (pipe_id == IA_CSS_PIPE_ID_PREVIEW) {
 		ref_info = pipe->pipe_settings.preview.preview_binary.in_frame_info;
-	} else if (pipe_id == IA_CSS_PIPE_ID_VIDEO)
-	{
+	} else if (pipe_id == IA_CSS_PIPE_ID_VIDEO) {
 		ref_info = pipe->pipe_settings.video.video_binary.in_frame_info;
-	} else
-	{
+	} else {
 		/* should not happen */
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
@@ -2684,8 +2673,7 @@ alloc_continuous_frames(
 #endif
 
 #if !defined(HAS_NO_PACKED_RAW_PIXELS)
-	if (pipe->stream->config.pack_raw_pixels)
-	{
+	if (pipe->stream->config.pack_raw_pixels) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "alloc_continuous_frames() IA_CSS_FRAME_FORMAT_RAW_PACKED\n");
 		ref_info.format = IA_CSS_FRAME_FORMAT_RAW_PACKED;
@@ -2714,8 +2702,7 @@ alloc_continuous_frames(
 	else
 		idx = pipe->stream->config.init_num_cont_raw_buf;
 
-	for (i = idx; i < NUM_CONTINUOUS_FRAMES; i++)
-	{
+	for (i = idx; i < NUM_CONTINUOUS_FRAMES; i++) {
 		/* free previous frame */
 		if (pipe->continuous_frames[i]) {
 			ia_css_frame_free(pipe->continuous_frames[i]);
@@ -2745,14 +2732,16 @@ alloc_continuous_frames(
 }
 
 int
-ia_css_alloc_continuous_frame_remain(struct ia_css_stream *stream) {
+ia_css_alloc_continuous_frame_remain(struct ia_css_stream *stream)
+{
 	if (!stream)
 		return -EINVAL;
 	return alloc_continuous_frames(stream->continuous_pipe, false);
 }
 
 static int
-load_preview_binaries(struct ia_css_pipe *pipe) {
+load_preview_binaries(struct ia_css_pipe *pipe)
+{
 	struct ia_css_frame_info prev_in_info,
 		prev_bds_out_info,
 		prev_out_info,
@@ -2860,8 +2849,7 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
 	 * then the preview binary selection is done again.
 	 */
 	if (need_vf_pp &&
-	    (mycs->preview_binary.out_frame_info[0].format != IA_CSS_FRAME_FORMAT_YUV_LINE))
-	{
+	    (mycs->preview_binary.out_frame_info[0].format != IA_CSS_FRAME_FORMAT_YUV_LINE)) {
 		/* Preview step 2 */
 		if (pipe->vf_yuv_ds_input_info.res.width)
 			prev_vf_info = pipe->vf_yuv_ds_input_info;
@@ -2886,8 +2874,7 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
 			return err;
 	}
 
-	if (need_vf_pp)
-	{
+	if (need_vf_pp) {
 		struct ia_css_binary_descr vf_pp_descr;
 
 		/* Viewfinder post-processing */
@@ -2918,8 +2905,7 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
 #endif
 
 	/* Copy */
-	if (need_isp_copy_binary)
-	{
+	if (need_isp_copy_binary) {
 		err = load_copy_binary(pipe,
 				       &mycs->copy_binary,
 				       &mycs->preview_binary);
@@ -2927,8 +2913,7 @@ load_preview_binaries(struct ia_css_pipe *pipe) {
 			return err;
 	}
 
-	if (pipe->shading_table)
-	{
+	if (pipe->shading_table) {
 		ia_css_shading_table_free(pipe->shading_table);
 		pipe->shading_table = NULL;
 	}
@@ -2943,11 +2928,11 @@ ia_css_binary_unload(struct ia_css_binary *binary)
 }
 
 static int
-unload_preview_binaries(struct ia_css_pipe *pipe) {
+unload_preview_binaries(struct ia_css_pipe *pipe)
+{
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
 
-	if ((!pipe) || (pipe->mode != IA_CSS_PIPE_ID_PREVIEW))
-	{
+	if ((!pipe) || (pipe->mode != IA_CSS_PIPE_ID_PREVIEW)) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -3000,15 +2985,15 @@ static int add_firmwares(
 		struct ia_css_frame *in = NULL;
 		struct ia_css_frame *vf = NULL;
 
-		if ((fw == last_fw) && (fw->info.isp.sp.enable.out_frame  != 0)) {
+		if ((fw == last_fw) && (fw->info.isp.sp.enable.out_frame  != 0))
 			out[0] = out_frame;
-		}
-		if (fw->info.isp.sp.enable.in_frame != 0) {
+
+		if (fw->info.isp.sp.enable.in_frame != 0)
 			in = in_frame;
-		}
-		if (fw->info.isp.sp.enable.out_frame != 0) {
+
+		if (fw->info.isp.sp.enable.out_frame != 0)
 			vf = vf_frame;
-		}
+
 		ia_css_pipe_get_firmwares_stage_desc(&stage_desc, binary,
 						     out, in, vf, fw, binary_mode);
 		err = ia_css_pipeline_create_and_add_stage(me,
@@ -3222,7 +3207,8 @@ static void sh_css_setup_queues(void)
 
 static int
 init_vf_frameinfo_defaults(struct ia_css_pipe *pipe,
-			   struct ia_css_frame *vf_frame, unsigned int idx) {
+			   struct ia_css_frame *vf_frame, unsigned int idx)
+{
 	int err = 0;
 	unsigned int thread_id;
 	enum sh_css_queue_id queue_id;
@@ -3387,7 +3373,8 @@ ia_css_get_crop_offsets(
 
 static int
 init_in_frameinfo_memory_defaults(struct ia_css_pipe *pipe,
-				  struct ia_css_frame *frame, enum ia_css_frame_format format) {
+				  struct ia_css_frame *frame, enum ia_css_frame_format format)
+{
 	struct ia_css_frame *in_frame;
 	int err = 0;
 	unsigned int thread_id;
@@ -3428,7 +3415,8 @@ init_in_frameinfo_memory_defaults(struct ia_css_pipe *pipe,
 
 static int
 init_out_frameinfo_defaults(struct ia_css_pipe *pipe,
-			    struct ia_css_frame *out_frame, unsigned int idx) {
+			    struct ia_css_frame *out_frame, unsigned int idx)
+{
 	int err = 0;
 	unsigned int thread_id;
 	enum sh_css_queue_id queue_id;
@@ -3659,14 +3647,14 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 }
 
 static int
-create_host_acc_pipeline(struct ia_css_pipe *pipe) {
+create_host_acc_pipeline(struct ia_css_pipe *pipe)
+{
 	int err = 0;
 	const struct ia_css_fw_info *fw;
 	unsigned int i;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
-	if ((!pipe) || (!pipe->stream))
-	{
+	if ((!pipe) || (!pipe->stream)) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -3677,15 +3665,13 @@ create_host_acc_pipeline(struct ia_css_pipe *pipe) {
 		pipe->pipeline.pipe_qos_config = 0;
 
 	fw = pipe->vf_stage;
-	for (i = 0; fw; fw = fw->next)
-	{
+	for (i = 0; fw; fw = fw->next) {
 		err = sh_css_pipeline_add_acc_stage(&pipe->pipeline, fw);
 		if (err)
 			goto ERR;
 	}
 
-	for (i = 0; i < pipe->config.num_acc_stages; i++)
-	{
+	for (i = 0; i < pipe->config.num_acc_stages; i++) {
 		struct ia_css_fw_info *fw = pipe->config.acc_stages[i];
 
 		err = sh_css_pipeline_add_acc_stage(&pipe->pipeline, fw);
@@ -3702,7 +3688,8 @@ create_host_acc_pipeline(struct ia_css_pipe *pipe) {
 
 /* Create stages for preview */
 static int
-create_host_preview_pipeline(struct ia_css_pipe *pipe) {
+create_host_preview_pipeline(struct ia_css_pipe *pipe)
+{
 	struct ia_css_pipeline_stage *copy_stage = NULL;
 	struct ia_css_pipeline_stage *preview_stage = NULL;
 	struct ia_css_pipeline_stage *vf_pp_stage = NULL;
@@ -3722,8 +3709,7 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe) {
 #endif
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
-	if ((!pipe) || (!pipe->stream) || (pipe->mode != IA_CSS_PIPE_ID_PREVIEW))
-	{
+	if ((!pipe) || (!pipe->stream) || (pipe->mode != IA_CSS_PIPE_ID_PREVIEW)) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -3751,16 +3737,14 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe) {
 	/* Construct in_frame info (only in case we have dynamic input */
 	need_in_frameinfo_memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
 #endif
-	if (need_in_frameinfo_memory)
-	{
+	if (need_in_frameinfo_memory) {
 		err = init_in_frameinfo_memory_defaults(pipe, &me->in_frame,
 							IA_CSS_FRAME_FORMAT_RAW);
 		if (err)
 			goto ERR;
 
 		in_frame = &me->in_frame;
-	} else
-	{
+	} else {
 		in_frame = NULL;
 	}
 
@@ -3774,8 +3758,7 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe) {
 	if (pipe->pipe_settings.preview.vf_pp_binary.info)
 		vf_pp_binary = &pipe->pipe_settings.preview.vf_pp_binary;
 
-	if (pipe->pipe_settings.preview.copy_binary.info)
-	{
+	if (pipe->pipe_settings.preview.copy_binary.info) {
 		ia_css_pipe_util_set_output_frames(out_frames, 0, NULL);
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, copy_binary,
 						   out_frames, NULL, NULL);
@@ -3790,21 +3773,19 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe) {
 		/* When continuous is enabled, configure in_frame with the
 		 * last pipe, which is the copy pipe.
 		 */
-		if (continuous || !online) {
+		if (continuous || !online)
 			in_frame = pipe->stream->last_pipe->continuous_frames[0];
-		}
+
 #else
 		in_frame = pipe->continuous_frames[0];
 #endif
 	}
 
-	if (vf_pp_binary)
-	{
+	if (vf_pp_binary) {
 		ia_css_pipe_util_set_output_frames(out_frames, 0, NULL);
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, preview_binary,
 						   out_frames, in_frame, NULL);
-	} else
-	{
+	} else {
 		ia_css_pipe_util_set_output_frames(out_frames, 0, out_frame);
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, preview_binary,
 						   out_frames, in_frame, NULL);
@@ -3818,14 +3799,12 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe) {
 	preview_stage->args.copy_vf =
 	    preview_binary->info->sp.pipeline.mode == IA_CSS_BINARY_MODE_COPY;
 	preview_stage->args.copy_output = !preview_stage->args.copy_vf;
-	if (preview_stage->args.copy_vf && !preview_stage->args.out_vf_frame)
-	{
+	if (preview_stage->args.copy_vf && !preview_stage->args.out_vf_frame) {
 		/* in case of copy, use the vf frame as output frame */
 		preview_stage->args.out_vf_frame =
 		    preview_stage->args.out_frame[0];
 	}
-	if (vf_pp_binary)
-	{
+	if (vf_pp_binary) {
 		if (preview_binary->info->sp.pipeline.mode == IA_CSS_BINARY_MODE_COPY)
 			in_frame = preview_stage->args.out_vf_frame;
 		else
@@ -3865,7 +3844,8 @@ static void send_raw_frames(struct ia_css_pipe *pipe)
 }
 
 static int
-preview_start(struct ia_css_pipe *pipe) {
+preview_start(struct ia_css_pipe *pipe)
+{
 	int err = 0;
 	struct ia_css_pipe *copy_pipe, *capture_pipe;
 	struct ia_css_pipe *acc_pipe;
@@ -3875,8 +3855,7 @@ preview_start(struct ia_css_pipe *pipe) {
 	const struct ia_css_isp_parameters *params = NULL;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
-	if ((!pipe) || (!pipe->stream) || (pipe->mode != IA_CSS_PIPE_ID_PREVIEW))
-	{
+	if ((!pipe) || (!pipe->stream) || (pipe->mode != IA_CSS_PIPE_ID_PREVIEW)) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -3903,8 +3882,7 @@ preview_start(struct ia_css_pipe *pipe) {
 		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 		copy_ovrd = 1 << thread_id;
 
-		if (pipe->stream->cont_capt)
-		{
+		if (pipe->stream->cont_capt) {
 			ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(capture_pipe),
 							 &thread_id);
 			copy_ovrd |= 1 << thread_id;
@@ -3917,8 +3895,7 @@ preview_start(struct ia_css_pipe *pipe) {
 	}
 
 	/* Construct and load the copy pipe */
-	if (pipe->stream->config.continuous)
-	{
+	if (pipe->stream->config.continuous) {
 		sh_css_sp_init_pipeline(&copy_pipe->pipeline,
 					IA_CSS_PIPE_ID_COPY,
 					(uint8_t)ia_css_pipe_get_pipe_num(copy_pipe),
@@ -3939,8 +3916,7 @@ preview_start(struct ia_css_pipe *pipe) {
 	}
 
 	/* Construct and load the capture pipe */
-	if (pipe->stream->cont_capt)
-	{
+	if (pipe->stream->cont_capt) {
 		sh_css_sp_init_pipeline(&capture_pipe->pipeline,
 					IA_CSS_PIPE_ID_CAPTURE,
 					(uint8_t)ia_css_pipe_get_pipe_num(capture_pipe),
@@ -3958,8 +3934,7 @@ preview_start(struct ia_css_pipe *pipe) {
 					params);
 	}
 
-	if (acc_pipe)
-	{
+	if (acc_pipe) {
 		sh_css_sp_init_pipeline(&acc_pipe->pipeline,
 					IA_CSS_PIPE_ID_ACC,
 					(uint8_t)ia_css_pipe_get_pipe_num(acc_pipe),
@@ -3985,7 +3960,8 @@ preview_start(struct ia_css_pipe *pipe) {
 
 int
 ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
-			   const struct ia_css_buffer *buffer) {
+			   const struct ia_css_buffer *buffer)
+{
 	int return_err = 0;
 	unsigned int thread_id;
 	enum sh_css_queue_id queue_id;
@@ -4000,8 +3976,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 
 	IA_CSS_ENTER("pipe=%p, buffer=%p", pipe, buffer);
 
-	if ((!pipe) || (!buffer))
-	{
+	if ((!pipe) || (!buffer)) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
@@ -4010,8 +3985,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 	/* following code will be enabled when IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME
 	   is removed */
 #if 0
-	if (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME)
-	{
+	if (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME) {
 		bool found_pipe = false;
 
 		for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++) {
@@ -4025,8 +3999,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 		if (!found_pipe)
 			return -EINVAL;
 	}
-	if (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME)
-	{
+	if (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME) {
 		bool found_pipe = false;
 
 		for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++) {
@@ -4049,34 +4022,29 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 	assert(buf_type < IA_CSS_NUM_DYNAMIC_BUFFER_TYPE);
 	if ((buf_type == IA_CSS_BUFFER_TYPE_INVALID) ||
 	    (buf_type >= IA_CSS_NUM_DYNAMIC_BUFFER_TYPE) ||
-	    (pipe_id >= IA_CSS_PIPE_ID_NUM))
-	{
+	    (pipe_id >= IA_CSS_PIPE_ID_NUM)) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
 
 	ret_err = ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
-	if (!ret_err)
-	{
+	if (!ret_err) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
 
 	ret_err = ia_css_query_internal_queue_id(buf_type, thread_id, &queue_id);
-	if (!ret_err)
-	{
+	if (!ret_err) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
 
-	if ((queue_id <= SH_CSS_INVALID_QUEUE_ID) || (queue_id >= SH_CSS_MAX_NUM_QUEUES))
-	{
+	if ((queue_id <= SH_CSS_INVALID_QUEUE_ID) || (queue_id >= SH_CSS_MAX_NUM_QUEUES)) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
 
-	if (!sh_css_sp_is_running())
-	{
+	if (!sh_css_sp_is_running()) {
 		IA_CSS_LOG("SP is not running!");
 		IA_CSS_LEAVE_ERR(-EBUSY);
 		/* SP is not running. The queues are not valid */
@@ -4094,24 +4062,21 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 	ddr_buffer.cookie_ptr = buffer->driver_cookie;
 	ddr_buffer.timing_data = buffer->timing_data;
 
-	if (buf_type == IA_CSS_BUFFER_TYPE_3A_STATISTICS)
-	{
+	if (buf_type == IA_CSS_BUFFER_TYPE_3A_STATISTICS) {
 		if (!buffer->data.stats_3a) {
 			IA_CSS_LEAVE_ERR(-EINVAL);
 			return -EINVAL;
 		}
 		ddr_buffer.kernel_ptr = HOST_ADDRESS(buffer->data.stats_3a);
 		ddr_buffer.payload.s3a = *buffer->data.stats_3a;
-	} else if (buf_type == IA_CSS_BUFFER_TYPE_DIS_STATISTICS)
-	{
+	} else if (buf_type == IA_CSS_BUFFER_TYPE_DIS_STATISTICS) {
 		if (!buffer->data.stats_dvs) {
 			IA_CSS_LEAVE_ERR(-EINVAL);
 			return -EINVAL;
 		}
 		ddr_buffer.kernel_ptr = HOST_ADDRESS(buffer->data.stats_dvs);
 		ddr_buffer.payload.dis = *buffer->data.stats_dvs;
-	} else if (buf_type == IA_CSS_BUFFER_TYPE_METADATA)
-	{
+	} else if (buf_type == IA_CSS_BUFFER_TYPE_METADATA) {
 		if (!buffer->data.metadata) {
 			IA_CSS_LEAVE_ERR(-EINVAL);
 			return -EINVAL;
@@ -4122,8 +4087,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 		   || (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME)
 		   || (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME)
 		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME))
-	{
+		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME)) {
 		if (!buffer->data.frame) {
 			IA_CSS_LEAVE_ERR(-EINVAL);
 			return -EINVAL;
@@ -4158,8 +4122,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 	assert(h_vbuf);
 	assert(h_vbuf->vptr != 0x0);
 
-	if ((!h_vbuf) || (h_vbuf->vptr == 0x0))
-	{
+	if ((!h_vbuf) || (h_vbuf->vptr == 0x0)) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
@@ -4169,8 +4132,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 		   sizeof(struct sh_css_hmm_buffer));
 	if ((buf_type == IA_CSS_BUFFER_TYPE_3A_STATISTICS)
 	    || (buf_type == IA_CSS_BUFFER_TYPE_DIS_STATISTICS)
-	    || (buf_type == IA_CSS_BUFFER_TYPE_LACE_STATISTICS))
-	{
+	    || (buf_type == IA_CSS_BUFFER_TYPE_LACE_STATISTICS)) {
 		if (!pipeline) {
 			ia_css_rmgr_rel_vbuf(hmm_buffer_pool, &h_vbuf);
 			IA_CSS_LOG("pipeline is empty!");
@@ -4193,8 +4155,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 		   || (buf_type == IA_CSS_BUFFER_TYPE_VF_OUTPUT_FRAME)
 		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME)
 		   || (buf_type == IA_CSS_BUFFER_TYPE_SEC_VF_OUTPUT_FRAME)
-		   || (buf_type == IA_CSS_BUFFER_TYPE_METADATA))
-	{
+		   || (buf_type == IA_CSS_BUFFER_TYPE_METADATA)) {
 		return_err = ia_css_bufq_enqueue_buffer(thread_id,
 							queue_id,
 							(uint32_t)h_vbuf->vptr);
@@ -4208,8 +4169,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 #endif
 	}
 
-	if (!return_err)
-	{
+	if (!return_err) {
 		if (sh_css_hmm_buffer_record_acquire(
 			h_vbuf, buf_type,
 			HOST_ADDRESS(ddr_buffer.kernel_ptr))) {
@@ -4224,8 +4184,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 	 * Tell the SP which queues are not empty,
 	 * by sending the software event.
 	 */
-	if (!return_err)
-	{
+	if (!return_err) {
 		if (!sh_css_sp_is_running()) {
 			/* SP is not running. The queues are not valid */
 			IA_CSS_LOG("SP is not running!");
@@ -4237,8 +4196,7 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 				 (uint8_t)thread_id,
 				 queue_id,
 				 0);
-	} else
-	{
+	} else {
 		ia_css_rmgr_rel_vbuf(hmm_buffer_pool, &h_vbuf);
 		IA_CSS_ERROR("buffer not enqueued");
 	}
@@ -4253,7 +4211,8 @@ ia_css_pipe_enqueue_buffer(struct ia_css_pipe *pipe,
 	 */
 int
 ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
-			   struct ia_css_buffer *buffer) {
+			   struct ia_css_buffer *buffer)
+{
 	int return_err;
 	enum sh_css_queue_id queue_id;
 	ia_css_ptr ddr_buffer_addr = (ia_css_ptr)0;
@@ -4266,8 +4225,7 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 
 	IA_CSS_ENTER("pipe=%p, buffer=%p", pipe, buffer);
 
-	if ((!pipe) || (!buffer))
-	{
+	if ((!pipe) || (!buffer)) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
@@ -4281,27 +4239,23 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 	ddr_buffer.kernel_ptr = 0;
 
 	ret_err = ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
-	if (!ret_err)
-	{
+	if (!ret_err) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
 
 	ret_err = ia_css_query_internal_queue_id(buf_type, thread_id, &queue_id);
-	if (!ret_err)
-	{
+	if (!ret_err) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
 
-	if ((queue_id <= SH_CSS_INVALID_QUEUE_ID) || (queue_id >= SH_CSS_MAX_NUM_QUEUES))
-	{
+	if ((queue_id <= SH_CSS_INVALID_QUEUE_ID) || (queue_id >= SH_CSS_MAX_NUM_QUEUES)) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
 
-	if (!sh_css_sp_is_running())
-	{
+	if (!sh_css_sp_is_running()) {
 		IA_CSS_LOG("SP is not running!");
 		IA_CSS_LEAVE_ERR(-EBUSY);
 		/* SP is not running. The queues are not valid */
@@ -4311,8 +4265,7 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 	return_err = ia_css_bufq_dequeue_buffer(queue_id,
 						(uint32_t *)&ddr_buffer_addr);
 
-	if (!return_err)
-	{
+	if (!return_err) {
 		struct ia_css_frame *frame;
 		struct sh_css_hmm_buffer_record *hmm_buffer_record = NULL;
 
@@ -4454,8 +4407,7 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 	 * Tell the SP which queues are not full,
 	 * by sending the software event.
 	 */
-	if (!return_err)
-	{
+	if (!return_err) {
 		if (!sh_css_sp_is_running()) {
 			IA_CSS_LOG("SP is not running!");
 			IA_CSS_LEAVE_ERR(-EBUSY);
@@ -4504,12 +4456,14 @@ static enum ia_css_event_type convert_event_sp_to_host_domain[] = {
 };
 
 int
-ia_css_dequeue_event(struct ia_css_event *event) {
+ia_css_dequeue_event(struct ia_css_event *event)
+{
 	return ia_css_dequeue_psys_event(event);
 }
 
 int
-ia_css_dequeue_psys_event(struct ia_css_event *event) {
+ia_css_dequeue_psys_event(struct ia_css_event *event)
+{
 	enum ia_css_pipe_id pipe_id = 0;
 	u8 payload[4] = {0, 0, 0, 0};
 	int ret_err;
@@ -4524,11 +4478,9 @@ ia_css_dequeue_psys_event(struct ia_css_event *event) {
 	if (!event)
 		return -EINVAL;
 
+	/* SP is not running. The queues are not valid */
 	if (!sh_css_sp_is_running())
-	{
-		/* SP is not running. The queues are not valid */
 		return -EBUSY;
-	}
 
 	/* dequeue the event (if any) from the psys event queue */
 	ret_err = ia_css_bufq_dequeue_psys_event(payload);
@@ -4555,8 +4507,7 @@ ia_css_dequeue_psys_event(struct ia_css_event *event) {
 	event->timer_code = 0;
 	event->timer_subcode = 0;
 
-	if (event->type == IA_CSS_EVENT_TYPE_TIMER)
-	{
+	if (event->type == IA_CSS_EVENT_TYPE_TIMER) {
 		/* timer event ??? get the 2nd event and decode the data into the event struct */
 		u32 tmp_data;
 		/* 1st event: LSB 16-bit timer data and code */
@@ -4580,37 +4531,32 @@ ia_css_dequeue_psys_event(struct ia_css_event *event) {
 			tmp_data = ((payload[1] & 0xFF) | ((payload[3] & 0xFF) << 8));
 			event->timer_data |= (tmp_data << 16);
 			event->timer_subcode = payload[2];
-		}
+		} else {
 		/* It's a non timer event. So clear first half of the timer event data.
 		* If the second part of the TIMER event is not received, we discard
 		* the first half of the timer data and process the non timer event without
 		* affecting the flow. So the non timer event falls through
 		* the code. */
-		else {
 			event->timer_data = 0;
 			event->timer_code = 0;
 			event->timer_subcode = 0;
 			IA_CSS_ERROR("Missing 2nd timer event. Timer event discarded");
 		}
 	}
-	if (event->type == IA_CSS_EVENT_TYPE_PORT_EOF)
-	{
+	if (event->type == IA_CSS_EVENT_TYPE_PORT_EOF) {
 		event->port = (enum mipi_port_id)payload[1];
 		event->exp_id = payload[3];
-	} else if (event->type == IA_CSS_EVENT_TYPE_FW_WARNING)
-	{
+	} else if (event->type == IA_CSS_EVENT_TYPE_FW_WARNING) {
 		event->fw_warning = (enum ia_css_fw_warning)payload[1];
 		/* exp_id is only available in these warning types */
 		if (event->fw_warning == IA_CSS_FW_WARNING_EXP_ID_LOCKED ||
 		    event->fw_warning == IA_CSS_FW_WARNING_TAG_EXP_ID_FAILED)
 			event->exp_id = payload[3];
-	} else if (event->type == IA_CSS_EVENT_TYPE_FW_ASSERT)
-	{
+	} else if (event->type == IA_CSS_EVENT_TYPE_FW_ASSERT) {
 		event->fw_assert_module_id = payload[1]; /* module */
 		event->fw_assert_line_no = (payload[2] << 8) + payload[3];
 		/* payload[2] is line_no>>8, payload[3] is line_no&0xff */
-	} else if (event->type != IA_CSS_EVENT_TYPE_TIMER)
-	{
+	} else if (event->type != IA_CSS_EVENT_TYPE_TIMER) {
 		/* pipe related events.
 		 * payload[1] contains the pipe_num,
 		 * payload[2] contains the pipe_id. These are different. */
@@ -4660,7 +4606,8 @@ ia_css_dequeue_psys_event(struct ia_css_event *event) {
 }
 
 int
-ia_css_dequeue_isys_event(struct ia_css_event *event) {
+ia_css_dequeue_isys_event(struct ia_css_event *event)
+{
 	u8 payload[4] = {0, 0, 0, 0};
 	int err = 0;
 
@@ -4670,11 +4617,9 @@ ia_css_dequeue_isys_event(struct ia_css_event *event) {
 	if (!event)
 		return -EINVAL;
 
+	/* SP is not running. The queues are not valid */
 	if (!sh_css_sp_is_running())
-	{
-		/* SP is not running. The queues are not valid */
 		return -EBUSY;
-	}
 
 	err = ia_css_bufq_dequeue_isys_event(payload);
 	if (err)
@@ -4707,7 +4652,8 @@ acc_start(struct ia_css_pipe *pipe)
 }
 
 static int
-sh_css_pipe_start(struct ia_css_stream *stream) {
+sh_css_pipe_start(struct ia_css_stream *stream)
+{
 	int err = 0;
 
 	struct ia_css_pipe *pipe;
@@ -4716,22 +4662,19 @@ sh_css_pipe_start(struct ia_css_stream *stream) {
 
 	IA_CSS_ENTER_PRIVATE("stream = %p", stream);
 
-	if (!stream)
-	{
+	if (!stream) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
 	pipe = stream->last_pipe;
-	if (!pipe)
-	{
+	if (!pipe) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
 
 	pipe_id = pipe->mode;
 
-	if (stream->started)
-	{
+	if (stream->started) {
 		IA_CSS_WARNING("Cannot start stream that is already started");
 		IA_CSS_LEAVE_ERR(err);
 		return err;
@@ -4739,8 +4682,7 @@ sh_css_pipe_start(struct ia_css_stream *stream) {
 
 	pipe->stop_requested = false;
 
-	switch (pipe_id)
-	{
+	switch (pipe_id) {
 	case IA_CSS_PIPE_ID_PREVIEW:
 		err = preview_start(pipe);
 		break;
@@ -4760,8 +4702,7 @@ sh_css_pipe_start(struct ia_css_stream *stream) {
 		err = -EINVAL;
 	}
 	/* DH regular multi pipe - not continuous mode: start the next pipes too */
-	if (!stream->config.continuous)
-	{
+	if (!stream->config.continuous) {
 		int i;
 
 		for (i = 1; i < stream->num_pipes && 0 == err ; i++) {
@@ -4791,8 +4732,7 @@ sh_css_pipe_start(struct ia_css_stream *stream) {
 			}
 		}
 	}
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
@@ -4802,8 +4742,7 @@ sh_css_pipe_start(struct ia_css_stream *stream) {
 	 * don't use ISP parameters anyway. So this should be okay.
 	 * The SP binary (jpeg) copy does not use any parameters.
 	 */
-	if (!copy_on_sp(pipe))
-	{
+	if (!copy_on_sp(pipe)) {
 		sh_css_invalidate_params(stream);
 		err = sh_css_param_update_isp_params(pipe,
 						     stream->isp_params_configs, true, NULL);
@@ -4817,8 +4756,7 @@ sh_css_pipe_start(struct ia_css_stream *stream) {
 
 	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 
-	if (!sh_css_sp_is_running())
-	{
+	if (!sh_css_sp_is_running()) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EBUSY);
 		/* SP is not running. The queues are not valid */
 		return -EBUSY;
@@ -4827,8 +4765,7 @@ sh_css_pipe_start(struct ia_css_stream *stream) {
 				       (uint8_t)thread_id, 0, 0);
 
 	/* DH regular multi pipe - not continuous mode: enqueue event to the next pipes too */
-	if (!stream->config.continuous)
-	{
+	if (!stream->config.continuous) {
 		int i;
 
 		for (i = 1; i < stream->num_pipes; i++) {
@@ -4842,8 +4779,7 @@ sh_css_pipe_start(struct ia_css_stream *stream) {
 	}
 
 	/* in case of continuous capture mode, we also start capture thread and copy thread*/
-	if (pipe->stream->config.continuous)
-	{
+	if (pipe->stream->config.continuous) {
 		struct ia_css_pipe *copy_pipe = NULL;
 
 		if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
@@ -4862,8 +4798,7 @@ sh_css_pipe_start(struct ia_css_stream *stream) {
 		    IA_CSS_PSYS_SW_EVENT_START_STREAM,
 		    (uint8_t)thread_id, 0,  0);
 	}
-	if (pipe->stream->cont_capt)
-	{
+	if (pipe->stream->cont_capt) {
 		struct ia_css_pipe *capture_pipe = NULL;
 
 		if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
@@ -4884,8 +4819,7 @@ sh_css_pipe_start(struct ia_css_stream *stream) {
 	}
 
 	/* in case of PREVIEW mode, check whether QOS acc_pipe is available, then start the qos pipe */
-	if (pipe_id == IA_CSS_PIPE_ID_PREVIEW)
-	{
+	if (pipe_id == IA_CSS_PIPE_ID_PREVIEW) {
 		struct ia_css_pipe *acc_pipe = NULL;
 
 		acc_pipe = pipe->pipe_settings.preview.acc_pipe;
@@ -4936,7 +4870,8 @@ sh_css_continuous_is_enabled(uint8_t pipe_num)
 /* ISP2400 */
 int
 ia_css_stream_get_max_buffer_depth(struct ia_css_stream *stream,
-				   int *buffer_depth) {
+				   int *buffer_depth)
+{
 	if (!buffer_depth)
 		return -EINVAL;
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_get_max_buffer_depth() enter: void\n");
@@ -4946,7 +4881,8 @@ ia_css_stream_get_max_buffer_depth(struct ia_css_stream *stream,
 }
 
 int
-ia_css_stream_set_buffer_depth(struct ia_css_stream *stream, int buffer_depth) {
+ia_css_stream_set_buffer_depth(struct ia_css_stream *stream, int buffer_depth)
+{
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_set_buffer_depth() enter: num_frames=%d\n", buffer_depth);
 	(void)stream;
 	if (buffer_depth > NUM_CONTINUOUS_FRAMES || buffer_depth < 1)
@@ -4960,7 +4896,8 @@ ia_css_stream_set_buffer_depth(struct ia_css_stream *stream, int buffer_depth) {
 /* ISP2401 */
 int
 ia_css_stream_get_buffer_depth(struct ia_css_stream *stream,
-			       int *buffer_depth) {
+			       int *buffer_depth)
+{
 	if (!buffer_depth)
 		return -EINVAL;
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_get_buffer_depth() enter: void\n");
@@ -4985,8 +4922,7 @@ sh_css_pipes_stop(struct ia_css_stream *stream)
 	int i;
 
 	assert(stream);
-	if (!stream)
-	{
+	if (!stream) {
 		IA_CSS_LOG("stream does NOT exist!");
 		err = -EINVAL;
 		goto ERR;
@@ -4994,8 +4930,7 @@ sh_css_pipes_stop(struct ia_css_stream *stream)
 
 	main_pipe = stream->last_pipe;
 	assert(main_pipe);
-	if (!main_pipe)
-	{
+	if (!main_pipe) {
 		IA_CSS_LOG("main_pipe does NOT exist!");
 		err = -EINVAL;
 		goto ERR;
@@ -5008,8 +4943,7 @@ sh_css_pipes_stop(struct ia_css_stream *stream)
 	 * Stop all "ia_css_pipe" instances in this target
 	 * "ia_css_stream" instance.
 	 */
-	for (i = 0; i < stream->num_pipes; i++)
-	{
+	for (i = 0; i < stream->num_pipes; i++) {
 		/* send the "stop" request to the "ia_css_pipe" instance */
 		IA_CSS_LOG("Send the stop-request to the pipe: pipe_id=%d",
 			stream->pipes[i]->pipeline.pipe_id);
@@ -5043,8 +4977,7 @@ sh_css_pipes_stop(struct ia_css_stream *stream)
 	 *
 	 * We need to stop this "Copy Pipe", as well.
 	 */
-	if (main_pipe->stream->config.continuous)
-	{
+	if (main_pipe->stream->config.continuous) {
 		struct ia_css_pipe *copy_pipe = NULL;
 
 		/* get the reference to "Copy Pipe" */
@@ -5220,8 +5153,7 @@ sh_css_pipe_get_shading_info(struct ia_css_pipe *pipe,
 
 	binary = ia_css_pipe_get_shading_correction_binary(pipe);
 
-	if (binary)
-	{
+	if (binary) {
 		err = ia_css_binary_get_shading_info(binary,
 						     IA_CSS_SHADING_CORRECTION_TYPE_1,
 						     pipe->required_bds_factor,
@@ -5231,8 +5163,7 @@ sh_css_pipe_get_shading_info(struct ia_css_pipe *pipe,
 		/* Other function calls can be added here when other shading correction types will be added
 		 * in the future.
 		 */
-	} else
-	{
+	} else {
 		/* When the pipe does not have a binary which has the shading
 		 * correction, this function does not need to fill the shading
 		 * information. It is not a error case, and then
@@ -5245,7 +5176,8 @@ sh_css_pipe_get_shading_info(struct ia_css_pipe *pipe,
 
 static int
 sh_css_pipe_get_grid_info(struct ia_css_pipe *pipe,
-			  struct ia_css_grid_info *info) {
+			  struct ia_css_grid_info *info)
+{
 	int err = 0;
 	struct ia_css_binary *binary = NULL;
 
@@ -5256,30 +5188,27 @@ sh_css_pipe_get_grid_info(struct ia_css_pipe *pipe,
 
 	binary = ia_css_pipe_get_s3a_binary(pipe);
 
-	if (binary)
-	{
+	if (binary) {
 		err = ia_css_binary_3a_grid_info(binary, info, pipe);
 		if (err)
 			goto ERR;
-	} else
+	} else {
 		memset(&info->s3a_grid, 0, sizeof(info->s3a_grid));
+	}
 
 	binary = ia_css_pipe_get_sdis_binary(pipe);
 
-	if (binary)
-	{
+	if (binary) {
 		ia_css_binary_dvs_grid_info(binary, info, pipe);
 		ia_css_binary_dvs_stat_grid_info(binary, info, pipe);
-	} else
-	{
+	} else {
 		memset(&info->dvs_grid.dvs_grid_info, 0,
 		       sizeof(info->dvs_grid.dvs_grid_info));
 		memset(&info->dvs_grid.dvs_stat_grid_info, 0,
 		       sizeof(info->dvs_grid.dvs_stat_grid_info));
 	}
 
-	if (binary)
-	{
+	if (binary) {
 		/* copy pipe does not have ISP binary*/
 		info->isp_in_width = binary->internal_frame_info.res.width;
 		info->isp_in_height = binary->internal_frame_info.res.height;
@@ -5299,7 +5228,8 @@ ERR :
  */
 static int
 ia_css_pipe_check_format(struct ia_css_pipe *pipe,
-			 enum ia_css_frame_format format) {
+			 enum ia_css_frame_format format)
+{
 	const enum ia_css_frame_format *supported_formats;
 	int number_of_formats;
 	int found = 0;
@@ -5307,8 +5237,7 @@ ia_css_pipe_check_format(struct ia_css_pipe *pipe,
 
 	IA_CSS_ENTER_PRIVATE("");
 
-	if (NULL == pipe || NULL == pipe->pipe_settings.video.video_binary.info)
-	{
+	if (NULL == pipe || NULL == pipe->pipe_settings.video.video_binary.info) {
 		IA_CSS_ERROR("Pipe or binary info is not set");
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
@@ -5317,15 +5246,13 @@ ia_css_pipe_check_format(struct ia_css_pipe *pipe,
 	supported_formats = pipe->pipe_settings.video.video_binary.info->output_formats;
 	number_of_formats = sizeof(pipe->pipe_settings.video.video_binary.info->output_formats) / sizeof(enum ia_css_frame_format);
 
-	for (i = 0; i < number_of_formats && !found; i++)
-	{
+	for (i = 0; i < number_of_formats && !found; i++) {
 		if (supported_formats[i] == format) {
 			found = 1;
 			break;
 		}
 	}
-	if (!found)
-	{
+	if (!found) {
 		IA_CSS_ERROR("Requested format is not supported by binary");
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
@@ -5476,10 +5403,10 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 					 &mycs->video_binary);
 
 		if (err) {
-			if (video_vf_info) {
-				/* This will do another video binary lookup later for YUV_LINE format*/
+			/* This will do another video binary lookup later for YUV_LINE format*/
+			if (video_vf_info)
 				need_vf_pp = true;
-			} else
+			else
 				return err;
 		} else if (video_vf_info) {
 			/* The first video binary lookup is successful, but we may
@@ -5642,13 +5569,13 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 }
 
 static int
-unload_video_binaries(struct ia_css_pipe *pipe) {
+unload_video_binaries(struct ia_css_pipe *pipe)
+{
 	unsigned int i;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
 
-	if ((!pipe) || (pipe->mode != IA_CSS_PIPE_ID_VIDEO))
-	{
+	if ((!pipe) || (pipe->mode != IA_CSS_PIPE_ID_VIDEO)) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -5798,31 +5725,29 @@ static int
 sh_css_pipe_configure_viewfinder(struct ia_css_pipe *pipe, unsigned int width,
 				 unsigned int height, unsigned int min_width,
 				 enum ia_css_frame_format format,
-				 unsigned int idx) {
+				 unsigned int idx)
+{
 	int err = 0;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p, width = %d, height = %d, min_width = %d, format = %d, idx = %d\n",
 			     pipe, width, height, min_width, format, idx);
 
-	if (!pipe)
-	{
+	if (!pipe) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
 
 	err = ia_css_util_check_res(width, height);
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
 	if (pipe->vf_output_info[idx].res.width != width ||
 	    pipe->vf_output_info[idx].res.height != height ||
 	    pipe->vf_output_info[idx].format != format)
-	{
 		ia_css_frame_info_init(&pipe->vf_output_info[idx], width, height,
 				       format, min_width);
-	}
+
 	IA_CSS_LEAVE_ERR_PRIVATE(0);
 	return 0;
 }
@@ -6202,7 +6127,8 @@ static int load_primary_binaries(
 }
 
 static int
-allocate_delay_frames(struct ia_css_pipe *pipe) {
+allocate_delay_frames(struct ia_css_pipe *pipe)
+{
 	unsigned int num_delay_frames = 0, i = 0;
 	unsigned int dvs_frame_delay = 0;
 	struct ia_css_frame_info ref_info;
@@ -6212,8 +6138,7 @@ allocate_delay_frames(struct ia_css_pipe *pipe) {
 
 	IA_CSS_ENTER_PRIVATE("");
 
-	if (!pipe)
-	{
+	if (!pipe) {
 		IA_CSS_ERROR("Invalid args - pipe %p", pipe);
 		return -EINVAL;
 	}
@@ -6224,8 +6149,7 @@ allocate_delay_frames(struct ia_css_pipe *pipe) {
 	if (dvs_frame_delay > 0)
 		num_delay_frames = dvs_frame_delay + 1;
 
-	switch (mode)
-	{
+	switch (mode) {
 	case IA_CSS_PIPE_ID_CAPTURE: {
 		struct ia_css_capture_settings *mycs_capture = &pipe->pipe_settings.capture;
 		(void)mycs_capture;
@@ -6277,8 +6201,7 @@ allocate_delay_frames(struct ia_css_pipe *pipe) {
 	ref_info.raw_bit_depth = SH_CSS_REF_BIT_DEPTH;
 
 	assert(num_delay_frames <= MAX_NUM_VIDEO_DELAY_FRAMES);
-	for (i = 0; i < num_delay_frames; i++)
-	{
+	for (i = 0; i < num_delay_frames; i++) {
 		err = ia_css_frame_allocate_from_info(&delay_frames[i],	&ref_info);
 		if (err)
 			return err;
@@ -6288,7 +6211,8 @@ allocate_delay_frames(struct ia_css_pipe *pipe) {
 }
 
 static int load_advanced_binaries(
-    struct ia_css_pipe *pipe) {
+    struct ia_css_pipe *pipe)
+{
 	struct ia_css_frame_info pre_in_info, gdc_in_info,
 			post_in_info, post_out_info,
 			vf_info, *vf_pp_in_info, *pipe_out_info,
@@ -6405,7 +6329,8 @@ static int load_advanced_binaries(
 }
 
 static int load_bayer_isp_binaries(
-    struct ia_css_pipe *pipe) {
+    struct ia_css_pipe *pipe)
+{
 	struct ia_css_frame_info pre_isp_in_info, *pipe_out_info;
 	int err = 0;
 	struct ia_css_binary_descr pre_de_descr;
@@ -6434,7 +6359,8 @@ static int load_bayer_isp_binaries(
 }
 
 static int load_low_light_binaries(
-    struct ia_css_pipe *pipe) {
+    struct ia_css_pipe *pipe)
+{
 	struct ia_css_frame_info pre_in_info, anr_in_info,
 			post_in_info, post_out_info,
 			vf_info, *pipe_vf_out_info, *pipe_out_info,
@@ -6572,7 +6498,8 @@ static bool copy_on_sp(struct ia_css_pipe *pipe)
 }
 
 static int load_capture_binaries(
-    struct ia_css_pipe *pipe) {
+    struct ia_css_pipe *pipe)
+{
 	int err = 0;
 	bool must_be_raw;
 
@@ -6640,13 +6567,13 @@ static int load_capture_binaries(
 }
 
 static int
-unload_capture_binaries(struct ia_css_pipe *pipe) {
+unload_capture_binaries(struct ia_css_pipe *pipe)
+{
 	unsigned int i;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
 
-	if ((!pipe) || ((pipe->mode != IA_CSS_PIPE_ID_CAPTURE) && (pipe->mode != IA_CSS_PIPE_ID_COPY)))
-	{
+	if ((!pipe) || ((pipe->mode != IA_CSS_PIPE_ID_CAPTURE) && (pipe->mode != IA_CSS_PIPE_ID_COPY))) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -6674,7 +6601,8 @@ unload_capture_binaries(struct ia_css_pipe *pipe) {
 
 static bool
 need_downscaling(const struct ia_css_resolution in_res,
-		    const struct ia_css_resolution out_res) {
+		    const struct ia_css_resolution out_res)
+{
 	if (in_res.width > out_res.width || in_res.height > out_res.height)
 		return true;
 
@@ -6682,7 +6610,8 @@ need_downscaling(const struct ia_css_resolution in_res,
 }
 
 static bool
-need_yuv_scaler_stage(const struct ia_css_pipe *pipe) {
+need_yuv_scaler_stage(const struct ia_css_pipe *pipe)
+{
 	unsigned int i;
 	struct ia_css_resolution in_res, out_res;
 
@@ -6724,7 +6653,8 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
     struct ia_css_frame_info *cas_scaler_in_info,
     struct ia_css_frame_info *cas_scaler_out_info,
     struct ia_css_frame_info *cas_scaler_vf_info,
-    struct ia_css_cas_binary_descr *descr) {
+    struct ia_css_cas_binary_descr *descr)
+{
 	unsigned int i;
 	unsigned int hor_ds_factor = 0, ver_ds_factor = 0;
 	int err = 0;
@@ -6842,7 +6772,8 @@ static int ia_css_pipe_create_cas_scaler_desc_single_output(
 /* FIXME: merge most of this and single output version */
 static int ia_css_pipe_create_cas_scaler_desc(
     struct ia_css_pipe *pipe,
-    struct ia_css_cas_binary_descr *descr) {
+    struct ia_css_cas_binary_descr *descr)
+{
 	struct ia_css_frame_info in_info = IA_CSS_BINARY_DEFAULT_FRAME_INFO;
 	struct ia_css_frame_info *out_info[IA_CSS_PIPE_MAX_OUTPUT_STAGE];
 	struct ia_css_frame_info *vf_out_info[IA_CSS_PIPE_MAX_OUTPUT_STAGE];
@@ -6998,7 +6929,8 @@ static int ia_css_pipe_create_cas_scaler_desc(
 }
 
 static void ia_css_pipe_destroy_cas_scaler_desc(struct ia_css_cas_binary_descr
-	*descr) {
+	*descr)
+{
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 			    "ia_css_pipe_destroy_cas_scaler_desc() enter:\n");
 	kfree(descr->in_info);
@@ -7016,7 +6948,8 @@ static void ia_css_pipe_destroy_cas_scaler_desc(struct ia_css_cas_binary_descr
 }
 
 static int
-load_yuvpp_binaries(struct ia_css_pipe *pipe) {
+load_yuvpp_binaries(struct ia_css_pipe *pipe)
+{
 	int err = 0;
 	bool need_scaler = false;
 	struct ia_css_frame_info *vf_pp_in_info[IA_CSS_PIPE_MAX_OUTPUT_STAGE];
@@ -7041,8 +6974,7 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe) {
 
 	mycs = &pipe->pipe_settings.yuvpp;
 
-	for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++)
-	{
+	for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++) {
 		if (pipe->vf_output_info[i].res.width != 0) {
 			err = ia_css_util_check_vf_out_info(&pipe->output_info[i],
 							    &pipe->vf_output_info[i]);
@@ -7056,8 +6988,7 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe) {
 
 	/* we build up the pipeline starting at the end */
 	/* Capture post-processing */
-	if (need_scaler)
-	{
+	if (need_scaler) {
 		struct ia_css_binary_descr yuv_scaler_descr;
 
 		err = ia_css_pipe_create_cas_scaler_desc(pipe,
@@ -7091,18 +7022,14 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe) {
 				goto ERR;
 		}
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
-	} else
-	{
+	} else {
 		mycs->num_output = 1;
 	}
 
 	if (need_scaler)
-	{
 		next_binary = &mycs->yuv_scaler_binary[0];
-	} else
-	{
+	else
 		next_binary = NULL;
-	}
 
 #if defined(ISP2401)
 	/*
@@ -7128,8 +7055,7 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe) {
 	need_isp_copy_binary = true;
 #endif /*  ISP2401 */
 
-	if (need_isp_copy_binary)
-	{
+	if (need_isp_copy_binary) {
 		err = load_copy_binary(pipe,
 					&mycs->copy_binary,
 					next_binary);
@@ -7159,8 +7085,7 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe) {
 	}
 
 	/* Viewfinder post-processing */
-	if (need_scaler)
-	{
+	if (need_scaler) {
 		for (i = 0, j = 0; i < mycs->num_yuv_scaler; i++) {
 			if (mycs->is_output_stage[i]) {
 				assert(j < 2);
@@ -7170,19 +7095,17 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe) {
 			}
 		}
 		mycs->num_vf_pp = j;
-	} else
-	{
+	} else {
 		vf_pp_in_info[0] =
 		    &mycs->copy_binary.vf_frame_info;
-		for (i = 1; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++) {
+		for (i = 1; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++)
 			vf_pp_in_info[i] = NULL;
-		}
+
 		mycs->num_vf_pp = 1;
 	}
 	mycs->vf_pp_binary = kzalloc(mycs->num_vf_pp * sizeof(struct ia_css_binary),
 					GFP_KERNEL);
-	if (!mycs->vf_pp_binary)
-	{
+	if (!mycs->vf_pp_binary) {
 		err = -ENOMEM;
 		goto ERR;
 	}
@@ -7190,8 +7113,7 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe) {
 	{
 		struct ia_css_binary_descr vf_pp_descr;
 
-		for (i = 0; i < mycs->num_vf_pp; i++)
-		{
+		for (i = 0; i < mycs->num_vf_pp; i++) {
 			if (pipe->vf_output_info[i].res.width != 0) {
 				ia_css_pipe_get_vfpp_binarydesc(pipe,
 								&vf_pp_descr, vf_pp_in_info[i], &pipe->vf_output_info[i]);
@@ -7207,34 +7129,31 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe) {
 
 ERR:
 	if (need_scaler)
-	{
 		ia_css_pipe_destroy_cas_scaler_desc(&cas_scaler_descr);
-	}
+
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "load_yuvpp_binaries() leave, err=%d\n",
 			    err);
 	return err;
 }
 
 static int
-unload_yuvpp_binaries(struct ia_css_pipe *pipe) {
+unload_yuvpp_binaries(struct ia_css_pipe *pipe)
+{
 	unsigned int i;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
 
-	if ((!pipe) || (pipe->mode != IA_CSS_PIPE_ID_YUVPP))
-	{
+	if ((!pipe) || (pipe->mode != IA_CSS_PIPE_ID_YUVPP)) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
 	ia_css_binary_unload(&pipe->pipe_settings.yuvpp.copy_binary);
 	for (i = 0; i < pipe->pipe_settings.yuvpp.num_yuv_scaler; i++)
-	{
 		ia_css_binary_unload(&pipe->pipe_settings.yuvpp.yuv_scaler_binary[i]);
-	}
+
 	for (i = 0; i < pipe->pipe_settings.yuvpp.num_vf_pp; i++)
-	{
 		ia_css_binary_unload(&pipe->pipe_settings.yuvpp.vf_pp_binary[i]);
-	}
+
 	kfree(pipe->pipe_settings.yuvpp.is_output_stage);
 	pipe->pipe_settings.yuvpp.is_output_stage = NULL;
 	kfree(pipe->pipe_settings.yuvpp.yuv_scaler_binary);
@@ -7284,25 +7203,23 @@ static int yuvpp_start(struct ia_css_pipe *pipe)
 }
 
 static int
-sh_css_pipe_unload_binaries(struct ia_css_pipe *pipe) {
+sh_css_pipe_unload_binaries(struct ia_css_pipe *pipe)
+{
 	int err = 0;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
 
-	if (!pipe)
-	{
+	if (!pipe) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
 	/* PIPE_MODE_COPY has no binaries, but has output frames to outside*/
-	if (pipe->config.mode == IA_CSS_PIPE_MODE_COPY)
-	{
+	if (pipe->config.mode == IA_CSS_PIPE_MODE_COPY) {
 		IA_CSS_LEAVE_ERR_PRIVATE(0);
 		return 0;
 	}
 
-	switch (pipe->mode)
-	{
+	switch (pipe->mode) {
 	case IA_CSS_PIPE_ID_PREVIEW:
 		err = unload_preview_binaries(pipe);
 		break;
@@ -7323,7 +7240,8 @@ sh_css_pipe_unload_binaries(struct ia_css_pipe *pipe) {
 }
 
 static int
-sh_css_pipe_load_binaries(struct ia_css_pipe *pipe) {
+sh_css_pipe_load_binaries(struct ia_css_pipe *pipe)
+{
 	int err = 0;
 
 	assert(pipe);
@@ -7333,8 +7251,7 @@ sh_css_pipe_load_binaries(struct ia_css_pipe *pipe) {
 	if (pipe->config.mode == IA_CSS_PIPE_MODE_COPY)
 		return err;
 
-	switch (pipe->mode)
-	{
+	switch (pipe->mode) {
 	case IA_CSS_PIPE_ID_PREVIEW:
 		err = load_preview_binaries(pipe);
 		break;
@@ -7353,8 +7270,7 @@ sh_css_pipe_load_binaries(struct ia_css_pipe *pipe) {
 		err = -EINVAL;
 		break;
 	}
-	if (err)
-	{
+	if (err) {
 		if (sh_css_pipe_unload_binaries(pipe)) {
 			/* currently css does not support multiple error returns in a single function,
 			    * using -EINVAL in this case */
@@ -7365,7 +7281,8 @@ sh_css_pipe_load_binaries(struct ia_css_pipe *pipe) {
 }
 
 static int
-create_host_yuvpp_pipeline(struct ia_css_pipe *pipe) {
+create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
+{
 	struct ia_css_pipeline *me;
 	int err = 0;
 	struct ia_css_pipeline_stage *vf_pp_stage = NULL,
@@ -7392,15 +7309,13 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe) {
 #endif
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
-	if ((!pipe) || (!pipe->stream) || (pipe->mode != IA_CSS_PIPE_ID_YUVPP))
-	{
+	if ((!pipe) || (!pipe->stream) || (pipe->mode != IA_CSS_PIPE_ID_YUVPP)) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
 	me = &pipe->pipeline;
 	ia_css_pipeline_clean(me);
-	for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++)
-	{
+	for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++) {
 		out_frame[i] = NULL;
 		vf_frame[i] = NULL;
 	}
@@ -7428,8 +7343,7 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe) {
 	/* the input frame can come from:
 	    *  a) memory: connect yuvscaler to me->in_frame
 	    *  b) sensor, via copy binary: connect yuvscaler to copy binary later on */
-	if (need_in_frameinfo_memory)
-	{
+	if (need_in_frameinfo_memory) {
 		/* TODO: improve for different input formats. */
 
 		/*
@@ -7478,13 +7392,11 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe) {
 		}
 
 		in_frame = &me->in_frame;
-	} else
-	{
+	} else {
 		in_frame = NULL;
 	}
 
-	for (i = 0; i < num_output_stage; i++)
-	{
+	for (i = 0; i < num_output_stage; i++) {
 		assert(i < IA_CSS_PIPE_MAX_OUTPUT_STAGE);
 		if (pipe->output_info[i].res.width != 0) {
 			err = init_out_frameinfo_defaults(pipe, &me->out_frame[i], i);
@@ -7511,8 +7423,7 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe) {
 	yuv_scaler_binary = pipe->pipe_settings.yuvpp.yuv_scaler_binary;
 	need_scaler = need_yuv_scaler_stage(pipe);
 
-	if (pipe->pipe_settings.yuvpp.copy_binary.info)
-	{
+	if (pipe->pipe_settings.yuvpp.copy_binary.info) {
 		struct ia_css_frame *in_frame_local = NULL;
 
 #ifdef ISP2401
@@ -7550,8 +7461,7 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe) {
 		}
 	}
 
-	if (need_scaler)
-	{
+	if (need_scaler) {
 		struct ia_css_frame *tmp_out_frame = NULL;
 		struct ia_css_frame *tmp_vf_frame = NULL;
 		struct ia_css_frame *tmp_in_frame = in_frame;
@@ -7591,8 +7501,7 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe) {
 				j++;
 			}
 		}
-	} else if (copy_stage)
-	{
+	} else if (copy_stage) {
 		if (vf_frame[0] && vf_frame[0]->info.res.width != 0) {
 			in_frame = copy_stage->args.out_vf_frame;
 			err = add_vf_pp_stage(pipe, in_frame, vf_frame[0], &vf_pp_binary[0],
@@ -7614,7 +7523,8 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe) {
 static int
 create_host_copy_pipeline(struct ia_css_pipe *pipe,
 			    unsigned int max_input_width,
-			    struct ia_css_frame *out_frame) {
+			    struct ia_css_frame *out_frame)
+{
 	struct ia_css_pipeline *me;
 	int err = 0;
 	struct ia_css_pipeline_stage_desc stage_desc;
@@ -7631,16 +7541,14 @@ create_host_copy_pipeline(struct ia_css_pipe *pipe,
 	out_frame->flash_state = IA_CSS_FRAME_FLASH_STATE_NONE;
 
 	if (copy_on_sp(pipe) &&
-	    pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8)
-	{
+	    pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8) {
 		ia_css_frame_info_init(
 		    &out_frame->info,
 		    JPEG_BYTES,
 		    1,
 		    IA_CSS_FRAME_FORMAT_BINARY_8,
 		    0);
-	} else if (out_frame->info.format == IA_CSS_FRAME_FORMAT_RAW)
-	{
+	} else if (out_frame->info.format == IA_CSS_FRAME_FORMAT_RAW) {
 		out_frame->info.raw_bit_depth =
 		ia_css_pipe_util_pipe_input_format_bpp(pipe);
 	}
@@ -7664,7 +7572,8 @@ create_host_copy_pipeline(struct ia_css_pipe *pipe,
 }
 
 static int
-create_host_isyscopy_capture_pipeline(struct ia_css_pipe *pipe) {
+create_host_isyscopy_capture_pipeline(struct ia_css_pipe *pipe)
+{
 	struct ia_css_pipeline *me = &pipe->pipeline;
 	int err = 0;
 	struct ia_css_pipeline_stage_desc stage_desc;
@@ -7708,7 +7617,8 @@ create_host_isyscopy_capture_pipeline(struct ia_css_pipe *pipe) {
 }
 
 static int
-create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
+create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
+{
 	struct ia_css_pipeline *me;
 	int err = 0;
 	enum ia_css_capture_mode mode;
@@ -7772,8 +7682,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 	/* Construct in_frame info (only in case we have dynamic input */
 	need_in_frameinfo_memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
 #endif
-	if (need_in_frameinfo_memory)
-	{
+	if (need_in_frameinfo_memory) {
 		err = init_in_frameinfo_memory_defaults(pipe, &me->in_frame,
 							IA_CSS_FRAME_FORMAT_RAW);
 		if (err) {
@@ -7782,22 +7691,19 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 		}
 
 		in_frame = &me->in_frame;
-	} else
-	{
+	} else {
 		in_frame = NULL;
 	}
 
 	err = init_out_frameinfo_defaults(pipe, &me->out_frame[0], 0);
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
 	out_frame = &me->out_frame[0];
 
 	/* Construct vf_frame info (only in case we have VF) */
-	if (pipe->enable_viewfinder[IA_CSS_PIPE_OUTPUT_STAGE_0])
-	{
+	if (pipe->enable_viewfinder[IA_CSS_PIPE_OUTPUT_STAGE_0]) {
 		if (mode == IA_CSS_CAPTURE_MODE_RAW || mode == IA_CSS_CAPTURE_MODE_BAYER) {
 			/* These modes don't support viewfinder output */
 			vf_frame = NULL;
@@ -7805,22 +7711,20 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 			init_vf_frameinfo_defaults(pipe, &me->vf_frame[0], 0);
 			vf_frame = &me->vf_frame[0];
 		}
-	} else
-	{
+	} else {
 		vf_frame = NULL;
 	}
 
 	copy_binary       = &pipe->pipe_settings.capture.copy_binary;
 	num_primary_stage = pipe->pipe_settings.capture.num_primary_stage;
-	if ((num_primary_stage == 0) && (mode == IA_CSS_CAPTURE_MODE_PRIMARY))
-	{
+	if ((num_primary_stage == 0) && (mode == IA_CSS_CAPTURE_MODE_PRIMARY)) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
+
 	for (i = 0; i < num_primary_stage; i++)
-	{
 		primary_binary[i] = &pipe->pipe_settings.capture.primary_binary[i];
-	}
+
 	vf_pp_binary      = &pipe->pipe_settings.capture.vf_pp_binary;
 	pre_isp_binary    = &pipe->pipe_settings.capture.pre_isp_binary;
 	anr_gdc_binary    = &pipe->pipe_settings.capture.anr_gdc_binary;
@@ -7837,8 +7741,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 	need_yuv_pp = (yuv_scaler_binary && yuv_scaler_binary->info);
 	need_ldc = (capture_ldc_binary && capture_ldc_binary->info);
 
-	if (pipe->pipe_settings.capture.copy_binary.info)
-	{
+	if (pipe->pipe_settings.capture.copy_binary.info) {
 		if (raw) {
 			ia_css_pipe_util_set_output_frames(out_frames, 0, out_frame);
 #if defined(ISP2401)
@@ -7867,13 +7770,11 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
 		}
-	} else if (pipe->stream->config.continuous)
-	{
+	} else if (pipe->stream->config.continuous) {
 		in_frame = pipe->stream->last_pipe->continuous_frames[0];
 	}
 
-	if (mode == IA_CSS_CAPTURE_MODE_PRIMARY)
-	{
+	if (mode == IA_CSS_CAPTURE_MODE_PRIMARY) {
 		struct ia_css_frame *local_in_frame = NULL;
 		struct ia_css_frame *local_out_frame = NULL;
 
@@ -7918,8 +7819,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 		    IA_CSS_BINARY_MODE_COPY;
 		current_stage->args.copy_output = current_stage->args.copy_vf;
 	} else if (mode == IA_CSS_CAPTURE_MODE_ADVANCED ||
-		    mode == IA_CSS_CAPTURE_MODE_LOW_LIGHT)
-	{
+		    mode == IA_CSS_CAPTURE_MODE_LOW_LIGHT) {
 		ia_css_pipe_util_set_output_frames(out_frames, 0, NULL);
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, pre_isp_binary,
 						    out_frames, in_frame, NULL);
@@ -7955,8 +7855,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
 		}
-	} else if (mode == IA_CSS_CAPTURE_MODE_BAYER)
-	{
+	} else if (mode == IA_CSS_CAPTURE_MODE_BAYER) {
 		ia_css_pipe_util_set_output_frames(out_frames, 0, out_frame);
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, pre_isp_binary,
 						    out_frames, in_frame, NULL);
@@ -7970,8 +7869,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 	}
 
 #ifndef ISP2401
-	if (need_pp && current_stage)
-	{
+	if (need_pp && current_stage) {
 		struct ia_css_frame *local_in_frame = NULL;
 
 		local_in_frame = current_stage->args.out_frame[0];
@@ -7989,8 +7887,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 					    need_yuv_pp ? NULL : out_frame,
 #else
 	/* ldc and capture_pp not supported in same pipeline */
-	if (need_ldc && current_stage)
-	{
+	if (need_ldc && current_stage) {
 		in_frame = current_stage->args.out_frame[0];
 		ia_css_pipe_util_set_output_frames(out_frames, 0, out_frame);
 		ia_css_pipe_get_generic_stage_desc(&stage_desc, capture_ldc_binary,
@@ -7998,8 +7895,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 		err = ia_css_pipeline_create_and_add_stage(me,
 			&stage_desc,
 			NULL);
-	} else if (need_pp && current_stage)
-	{
+	} else if (need_pp && current_stage) {
 		in_frame = current_stage->args.out_frame[0];
 		err = add_capture_pp_stage(pipe, me, in_frame, need_yuv_pp ? NULL : out_frame,
 #endif
@@ -8011,8 +7907,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 		}
 	}
 
-	if (need_yuv_pp && current_stage)
-	{
+	if (need_yuv_pp && current_stage) {
 		struct ia_css_frame *tmp_in_frame = current_stage->args.out_frame[0];
 		struct ia_css_frame *tmp_out_frame = NULL;
 
@@ -8044,8 +7939,7 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 	    * should not be considered as a clean solution. Proper
 	    * investigation should be done to come up with the clean solution.
 	    * */
-	if (mode != IA_CSS_CAPTURE_MODE_RAW && mode != IA_CSS_CAPTURE_MODE_BAYER && current_stage && vf_frame)
-	{
+	if (mode != IA_CSS_CAPTURE_MODE_RAW && mode != IA_CSS_CAPTURE_MODE_BAYER && current_stage && vf_frame) {
 		in_frame = current_stage->args.out_vf_frame;
 		err = add_vf_pp_stage(pipe, in_frame, vf_frame, vf_pp_binary,
 					&current_stage);
@@ -8063,7 +7957,8 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe) {
 }
 
 static int
-create_host_capture_pipeline(struct ia_css_pipe *pipe) {
+create_host_capture_pipeline(struct ia_css_pipe *pipe)
+{
 	int err = 0;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
@@ -8072,8 +7967,7 @@ create_host_capture_pipeline(struct ia_css_pipe *pipe) {
 		err = create_host_isyscopy_capture_pipeline(pipe);
 	else
 		err = create_host_regular_capture_pipeline(pipe);
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
@@ -8084,7 +7978,8 @@ create_host_capture_pipeline(struct ia_css_pipe *pipe) {
 }
 
 static int capture_start(
-    struct ia_css_pipe *pipe) {
+    struct ia_css_pipe *pipe)
+{
 	struct ia_css_pipeline *me;
 
 	int err = 0;
@@ -8155,7 +8050,8 @@ static int capture_start(
 static int
 sh_css_pipe_get_output_frame_info(struct ia_css_pipe *pipe,
 				    struct ia_css_frame_info *info,
-				    unsigned int idx) {
+				    unsigned int idx)
+{
 	assert(pipe);
 	assert(info);
 
@@ -8164,8 +8060,7 @@ sh_css_pipe_get_output_frame_info(struct ia_css_pipe *pipe,
 
 	*info = pipe->output_info[idx];
 	if (copy_on_sp(pipe) &&
-	    pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8)
-	{
+	    pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8) {
 		ia_css_frame_info_init(
 		    info,
 		    JPEG_BYTES,
@@ -8173,8 +8068,7 @@ sh_css_pipe_get_output_frame_info(struct ia_css_pipe *pipe,
 		    IA_CSS_FRAME_FORMAT_BINARY_8,
 		    0);
 	} else if (info->format == IA_CSS_FRAME_FORMAT_RAW ||
-		    info->format == IA_CSS_FRAME_FORMAT_RAW_PACKED)
-	{
+		    info->format == IA_CSS_FRAME_FORMAT_RAW_PACKED) {
 		info->raw_bit_depth =
 		ia_css_pipe_util_pipe_input_format_bpp(pipe);
 	}
@@ -8188,7 +8082,8 @@ void
 ia_css_stream_send_input_frame(const struct ia_css_stream *stream,
 				const unsigned short *data,
 				unsigned int width,
-				unsigned int height) {
+				unsigned int height)
+{
 	assert(stream);
 
 	ia_css_inputfifo_send_input_frame(
@@ -8199,7 +8094,8 @@ ia_css_stream_send_input_frame(const struct ia_css_stream *stream,
 }
 
 void
-ia_css_stream_start_input_frame(const struct ia_css_stream *stream) {
+ia_css_stream_start_input_frame(const struct ia_css_stream *stream)
+{
 	assert(stream);
 
 	ia_css_inputfifo_start_frame(
@@ -8213,7 +8109,8 @@ ia_css_stream_send_input_line(const struct ia_css_stream *stream,
 				const unsigned short *data,
 				unsigned int width,
 				const unsigned short *data2,
-				unsigned int width2) {
+				unsigned int width2)
+{
 	assert(stream);
 
 	ia_css_inputfifo_send_line(stream->config.channel_id,
@@ -8224,7 +8121,8 @@ void
 ia_css_stream_send_input_embedded_line(const struct ia_css_stream *stream,
 					enum atomisp_input_format format,
 					const unsigned short *data,
-					unsigned int width) {
+					unsigned int width)
+{
 	assert(stream);
 	if (!data || width == 0)
 		return;
@@ -8233,14 +8131,16 @@ ia_css_stream_send_input_embedded_line(const struct ia_css_stream *stream,
 }
 
 void
-ia_css_stream_end_input_frame(const struct ia_css_stream *stream) {
+ia_css_stream_end_input_frame(const struct ia_css_stream *stream)
+{
 	assert(stream);
 
 	ia_css_inputfifo_end_frame(stream->config.channel_id);
 }
 
 static void
-append_firmware(struct ia_css_fw_info **l, struct ia_css_fw_info *firmware) {
+append_firmware(struct ia_css_fw_info **l, struct ia_css_fw_info *firmware)
+{
 	IA_CSS_ENTER_PRIVATE("l = %p, firmware = %p", l, firmware);
 	if (!l) {
 		IA_CSS_ERROR("NULL fw_info");
@@ -8255,7 +8155,8 @@ append_firmware(struct ia_css_fw_info **l, struct ia_css_fw_info *firmware) {
 }
 
 static void
-remove_firmware(struct ia_css_fw_info **l, struct ia_css_fw_info *firmware) {
+remove_firmware(struct ia_css_fw_info **l, struct ia_css_fw_info *firmware)
+{
 	assert(*l);
 	assert(firmware);
 	(void)l;
@@ -8297,12 +8198,12 @@ static int upload_isp_code(struct ia_css_fw_info *firmware)
 }
 
 static int
-acc_load_extension(struct ia_css_fw_info *firmware) {
+acc_load_extension(struct ia_css_fw_info *firmware)
+{
 	int err;
 	struct ia_css_fw_info *hd = firmware;
 
-	while (hd)
-	{
+	while (hd) {
 		err = upload_isp_code(hd);
 		if (err)
 			return err;
@@ -8316,7 +8217,8 @@ acc_load_extension(struct ia_css_fw_info *firmware) {
 }
 
 static void
-acc_unload_extension(struct ia_css_fw_info *firmware) {
+acc_unload_extension(struct ia_css_fw_info *firmware)
+{
 	struct ia_css_fw_info *hd = firmware;
 	struct ia_css_fw_info *hdn = NULL;
 
@@ -8340,13 +8242,13 @@ acc_unload_extension(struct ia_css_fw_info *firmware) {
 /* Load firmware for extension */
 static int
 ia_css_pipe_load_extension(struct ia_css_pipe *pipe,
-			    struct ia_css_fw_info *firmware) {
+			    struct ia_css_fw_info *firmware)
+{
 	int err = 0;
 
 	IA_CSS_ENTER_PRIVATE("fw = %p pipe = %p", firmware, pipe);
 
-	if ((!firmware) || (!pipe))
-	{
+	if ((!firmware) || (!pipe)) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -8364,7 +8266,8 @@ ia_css_pipe_load_extension(struct ia_css_pipe *pipe,
 /* Unload firmware for extension */
 static void
 ia_css_pipe_unload_extension(struct ia_css_pipe *pipe,
-				struct ia_css_fw_info *firmware) {
+				struct ia_css_fw_info *firmware)
+{
 	IA_CSS_ENTER_PRIVATE("fw = %p pipe = %p", firmware, pipe);
 
 	if ((!firmware) || (!pipe)) {
@@ -8383,7 +8286,8 @@ ia_css_pipe_unload_extension(struct ia_css_pipe *pipe,
 }
 
 bool
-ia_css_pipeline_uses_params(struct ia_css_pipeline *me) {
+ia_css_pipeline_uses_params(struct ia_css_pipeline *me)
+{
 	struct ia_css_pipeline_stage *stage;
 
 	assert(me);
@@ -8404,7 +8308,8 @@ ia_css_pipeline_uses_params(struct ia_css_pipeline *me) {
 
 static int
 sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
-				const void *acc_fw) {
+				const void *acc_fw)
+{
 	struct ia_css_fw_info *fw = (struct ia_css_fw_info *)acc_fw;
 	/* In QoS case, load_extension already called, so skipping */
 	int	err = 0;
@@ -8416,8 +8321,7 @@ sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
 			    "sh_css_pipeline_add_acc_stage() enter: pipeline=%p, acc_fw=%p\n",
 			    pipeline, acc_fw);
 
-	if (!err)
-	{
+	if (!err) {
 		struct ia_css_pipeline_stage_desc stage_desc;
 
 		ia_css_pipe_get_acc_stage_desc(&stage_desc, NULL, fw);
@@ -8436,7 +8340,8 @@ sh_css_pipeline_add_acc_stage(struct ia_css_pipeline *pipeline,
     * Refer to "sh_css_internal.h" for details.
     */
 int ia_css_stream_capture_frame(struct ia_css_stream *stream,
-	unsigned int exp_id) {
+	unsigned int exp_id)
+{
 	struct sh_css_tag_descr tag_descr;
 	u32 encoded_tag_descr;
 	int err;
@@ -8478,7 +8383,8 @@ int ia_css_stream_capture(
     struct ia_css_stream *stream,
     int num_captures,
     unsigned int skip,
-    int offset) {
+    int offset)
+{
 	struct sh_css_tag_descr tag_descr;
 	unsigned int encoded_tag_descr;
 	int return_err;
@@ -8541,8 +8447,9 @@ void ia_css_stream_request_flash(struct ia_css_stream *stream)
 			ia_css_debug_dump_sp_sw_debug_info();
 			ia_css_debug_dump_debug_info(NULL);
 		}
-	} else
+	} else {
 		IA_CSS_LOG("SP is not running!");
+	}
 
 #endif
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
@@ -8550,7 +8457,8 @@ void ia_css_stream_request_flash(struct ia_css_stream *stream)
 }
 
 static void
-sh_css_init_host_sp_control_vars(void) {
+sh_css_init_host_sp_control_vars(void)
+{
 	const struct ia_css_fw_info *fw;
 	unsigned int HIVE_ADDR_ia_css_ispctrl_sp_isp_started;
 
@@ -8634,7 +8542,8 @@ void ia_css_pipe_config_defaults(struct ia_css_pipe_config *pipe_config)
 
 void
 ia_css_pipe_extra_config_defaults(struct ia_css_pipe_extra_config
-				    *extra_config) {
+				    *extra_config)
+{
 	if (!extra_config) {
 		IA_CSS_ERROR("NULL input parameter");
 		return;
@@ -8664,11 +8573,11 @@ void ia_css_stream_config_defaults(struct ia_css_stream_config *stream_config)
 }
 
 static int
-ia_css_acc_pipe_create(struct ia_css_pipe *pipe) {
+ia_css_acc_pipe_create(struct ia_css_pipe *pipe)
+{
 	int err = 0;
 
-	if (!pipe)
-	{
+	if (!pipe) {
 		IA_CSS_ERROR("NULL input parameter");
 		return -EINVAL;
 	}
@@ -8678,9 +8587,7 @@ ia_css_acc_pipe_create(struct ia_css_pipe *pipe) {
 		pipe->config.acc_num_execs = 1;
 
 	if (pipe->config.acc_extension)
-	{
 		err = ia_css_pipe_load_extension(pipe, pipe->config.acc_extension);
-	}
 
 	return err;
 }
@@ -8699,9 +8606,8 @@ int ia_css_pipe_create(const struct ia_css_pipe_config *config,
 
 	err = ia_css_pipe_create_extra(config, NULL, pipe);
 
-	if (err == 0) {
+	if (err == 0)
 		IA_CSS_LOG("pipe created successfully = %p", *pipe);
-	}
 
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
 
@@ -8711,7 +8617,8 @@ int ia_css_pipe_create(const struct ia_css_pipe_config *config,
 int
 ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 			    const struct ia_css_pipe_extra_config *extra_config,
-			    struct ia_css_pipe **pipe) {
+			    struct ia_css_pipe **pipe)
+{
 	int err = -EINVAL;
 	struct ia_css_pipe *internal_pipe = NULL;
 	unsigned int i;
@@ -8719,14 +8626,12 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 	IA_CSS_ENTER_PRIVATE("config = %p, extra_config = %p and pipe = %p", config, extra_config, pipe);
 
 	/* do not allow to create more than the maximum limit */
-	if (my_css.pipe_counter >= IA_CSS_PIPELINE_NUM_MAX)
-	{
+	if (my_css.pipe_counter >= IA_CSS_PIPELINE_NUM_MAX) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-ENOSPC);
 		return -EINVAL;
 	}
 
-	if ((!pipe) || (!config))
-	{
+	if ((!pipe) || (!config)) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
@@ -8735,8 +8640,7 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 	ia_css_debug_dump_pipe_extra_config(extra_config);
 
 	err = create_pipe(config->mode, &internal_pipe, false);
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
@@ -8748,8 +8652,7 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 	else
 		ia_css_pipe_extra_config_defaults(&internal_pipe->extra_config);
 
-	if (config->mode == IA_CSS_PIPE_MODE_ACC)
-	{
+	if (config->mode == IA_CSS_PIPE_MODE_ACC) {
 		/* Temporary hack to migrate acceleration to CSS 2.0.
 		    * In the future the code for all pipe types should be
 		    * unified. */
@@ -8776,15 +8679,13 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 	    set bayer_ds_out_res equal to IF output resolution(IF may do cropping on
 	    sensor output) or use default decimation factor 1. */
 	if (internal_pipe->extra_config.enable_raw_binning &&
-	    internal_pipe->config.bayer_ds_out_res.width)
-	{
+	    internal_pipe->config.bayer_ds_out_res.width) {
 		/* fill some code here, if no code is needed, please remove it during integration */
 	}
 
 	/* YUV downscaling */
 	if ((internal_pipe->config.vf_pp_in_res.width ||
-		internal_pipe->config.capt_pp_in_res.width))
-	{
+		internal_pipe->config.capt_pp_in_res.width)) {
 		enum ia_css_frame_format format;
 
 		if (internal_pipe->config.vf_pp_in_res.width) {
@@ -8805,8 +8706,7 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 		}
 	}
 	if (internal_pipe->config.vf_pp_in_res.width &&
-	    internal_pipe->config.mode == IA_CSS_PIPE_MODE_PREVIEW)
-	{
+	    internal_pipe->config.mode == IA_CSS_PIPE_MODE_PREVIEW) {
 		ia_css_frame_info_init(
 		    &internal_pipe->vf_yuv_ds_input_info,
 		    internal_pipe->config.vf_pp_in_res.width,
@@ -8814,8 +8714,7 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 		    IA_CSS_FRAME_FORMAT_YUV_LINE, 0);
 	}
 	/* handle bayer downscaling output info */
-	if (internal_pipe->config.bayer_ds_out_res.width)
-	{
+	if (internal_pipe->config.bayer_ds_out_res.width) {
 		ia_css_frame_info_init(
 		    &internal_pipe->bds_output_info,
 		    internal_pipe->config.bayer_ds_out_res.width,
@@ -8824,8 +8723,7 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 	}
 
 	/* handle output info, assume always needed */
-	for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++)
-	{
+	for (i = 0; i < IA_CSS_PIPE_MAX_OUTPUT_STAGE; i++) {
 		if (internal_pipe->config.output_info[i].res.width) {
 			err = sh_css_pipe_configure_output(
 				    internal_pipe,
@@ -8861,8 +8759,7 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 			}
 		}
 	}
-	if (internal_pipe->config.acc_extension)
-	{
+	if (internal_pipe->config.acc_extension) {
 		err = ia_css_pipe_load_extension(internal_pipe,
 						    internal_pipe->config.acc_extension);
 		if (err) {
@@ -8882,18 +8779,18 @@ ia_css_pipe_create_extra(const struct ia_css_pipe_config *config,
 
 int
 ia_css_pipe_get_info(const struct ia_css_pipe *pipe,
-			struct ia_css_pipe_info *pipe_info) {
+			struct ia_css_pipe_info *pipe_info)
+{
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 			    "ia_css_pipe_get_info()\n");
+
 	assert(pipe_info);
-	if (!pipe_info)
-	{
+	if (!pipe_info) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR,
 				    "ia_css_pipe_get_info: pipe_info cannot be NULL\n");
 		return -EINVAL;
 	}
-	if (!pipe || !pipe->stream)
-	{
+	if (!pipe || !pipe->stream) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_ERROR,
 				    "ia_css_pipe_get_info: ia_css_stream_create needs to be called before ia_css_[stream/pipe]_get_info\n");
 		return -EINVAL;
@@ -8921,40 +8818,36 @@ bool ia_css_pipe_has_dvs_stats(struct ia_css_pipe_info *pipe_info)
 int
 ia_css_pipe_override_frame_format(struct ia_css_pipe *pipe,
 				    int pin_index,
-				    enum ia_css_frame_format new_format) {
+				    enum ia_css_frame_format new_format)
+{
 	int err = 0;
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p, pin_index = %d, new_formats = %d", pipe, pin_index, new_format);
 
-	if (!pipe)
-	{
+	if (!pipe) {
 		IA_CSS_ERROR("pipe is not set");
 		err = -EINVAL;
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
-	if (0 != pin_index && 1 != pin_index)
-	{
+	if (0 != pin_index && 1 != pin_index) {
 		IA_CSS_ERROR("pin index is not valid");
 		err = -EINVAL;
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
-	if (new_format != IA_CSS_FRAME_FORMAT_NV12_TILEY)
-	{
+	if (new_format != IA_CSS_FRAME_FORMAT_NV12_TILEY) {
 		IA_CSS_ERROR("new format is not valid");
 		err = -EINVAL;
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
-	} else
-	{
+	} else {
 		err = ia_css_pipe_check_format(pipe, new_format);
 		if (!err) {
-			if (pin_index == 0) {
+			if (pin_index == 0)
 				pipe->output_info[0].format = new_format;
-			} else {
+			else
 				pipe->vf_output_info[0].format = new_format;
-			}
 		}
 	}
 	IA_CSS_LEAVE_ERR_PRIVATE(err);
@@ -8964,7 +8857,8 @@ ia_css_pipe_override_frame_format(struct ia_css_pipe *pipe,
 #if !defined(ISP2401)
 /* Configuration of INPUT_SYSTEM_VERSION_2401 is done on SP */
 static int
-ia_css_stream_configure_rx(struct ia_css_stream *stream) {
+ia_css_stream_configure_rx(struct ia_css_stream *stream)
+{
 	struct ia_css_input_port *config;
 
 	assert(stream);
@@ -8993,11 +8887,10 @@ ia_css_stream_configure_rx(struct ia_css_stream *stream) {
 	if (config->compression.type == IA_CSS_CSI2_COMPRESSION_TYPE_NONE)
 		stream->csi_rx_config.comp = MIPI_PREDICTOR_NONE;
 	else
-	{
 		/* not implemented yet, requires extension of the rx_cfg_t
 		    * struct */
 		return -EINVAL;
-	}
+
 	stream->csi_rx_config.is_two_ppc = (stream->config.pixels_per_clock == 2);
 	stream->reconfigure_css_rx = true;
 	return 0;
@@ -9008,7 +8901,8 @@ static struct ia_css_pipe *
 find_pipe(struct ia_css_pipe *pipes[],
 	    unsigned int num_pipes,
 	    enum ia_css_pipe_mode mode,
-	    bool copy_pipe) {
+	    bool copy_pipe)
+{
 	unsigned int i;
 
 	assert(pipes);
@@ -9024,21 +8918,20 @@ find_pipe(struct ia_css_pipe *pipes[],
 }
 
 static int
-ia_css_acc_stream_create(struct ia_css_stream *stream) {
+ia_css_acc_stream_create(struct ia_css_stream *stream)
+{
 	int i;
 	int err = 0;
 
 	assert(stream);
 	IA_CSS_ENTER_PRIVATE("stream = %p", stream);
 
-	if (!stream)
-	{
+	if (!stream) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-EINVAL);
 		return -EINVAL;
 	}
 
-	for (i = 0;  i < stream->num_pipes; i++)
-	{
+	for (i = 0;  i < stream->num_pipes; i++) {
 		struct ia_css_pipe *pipe = stream->pipes[i];
 
 		assert(pipe);
@@ -9052,14 +8945,12 @@ ia_css_acc_stream_create(struct ia_css_stream *stream) {
 
 	/* Map SP threads before doing anything. */
 	err = map_sp_threads(stream, true);
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
 
-	for (i = 0;  i < stream->num_pipes; i++)
-	{
+	for (i = 0;  i < stream->num_pipes; i++) {
 		struct ia_css_pipe *pipe = stream->pipes[i];
 
 		assert(pipe);
@@ -9067,8 +8958,7 @@ ia_css_acc_stream_create(struct ia_css_stream *stream) {
 	}
 
 	err = create_host_pipeline_structure(stream);
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
 	}
@@ -9082,7 +8972,8 @@ ia_css_acc_stream_create(struct ia_css_stream *stream) {
 
 static int
 metadata_info_init(const struct ia_css_metadata_config *mdc,
-		    struct ia_css_metadata_info *md) {
+		    struct ia_css_metadata_info *md)
+{
 	/* Either both width and height should be set or neither */
 	if ((mdc->resolution.height > 0) ^ (mdc->resolution.width > 0))
 		return -EINVAL;
@@ -9142,7 +9033,8 @@ int
 ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 			int num_pipes,
 			struct ia_css_pipe *pipes[],
-			struct ia_css_stream **stream) {
+			struct ia_css_stream **stream)
+{
 	struct ia_css_pipe *curr_pipe;
 	struct ia_css_stream *curr_stream = NULL;
 	bool spcopyonly;
@@ -9161,8 +9053,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	/* some checks */
 	if (num_pipes == 0 ||
 	    !stream ||
-	    !pipes)
-	{
+	    !pipes) {
 		err = -EINVAL;
 		IA_CSS_LEAVE_ERR(err);
 		return err;
@@ -9171,8 +9062,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 #if !defined(ISP2401)
 	/* We don't support metadata for JPEG stream, since they both use str2mem */
 	if (stream_config->input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8 &&
-	    stream_config->metadata_config.resolution.height > 0)
-	{
+	    stream_config->metadata_config.resolution.height > 0) {
 		err = -EINVAL;
 		IA_CSS_LEAVE_ERR(err);
 		return err;
@@ -9180,8 +9070,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 #endif
 
 #ifdef ISP2401
-	if (stream_config->online && stream_config->pack_raw_pixels)
-	{
+	if (stream_config->online && stream_config->pack_raw_pixels) {
 		IA_CSS_LOG("online and pack raw is invalid on input system 2401");
 		err = -EINVAL;
 		IA_CSS_LEAVE_ERR(err);
@@ -9236,16 +9125,14 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 
 	/* Currently we only supported metadata up to a certain size. */
 	err = metadata_info_init(&stream_config->metadata_config, &md_info);
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LEAVE_ERR(err);
 		return err;
 	}
 
 	/* allocate the stream instance */
 	curr_stream = kzalloc(sizeof(struct ia_css_stream), GFP_KERNEL);
-	if (!curr_stream)
-	{
+	if (!curr_stream) {
 		err = -ENOMEM;
 		IA_CSS_LEAVE_ERR(err);
 		return err;
@@ -9256,8 +9143,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	/* allocate pipes */
 	curr_stream->num_pipes = num_pipes;
 	curr_stream->pipes = kcalloc(num_pipes, sizeof(struct ia_css_pipe *), GFP_KERNEL);
-	if (!curr_stream->pipes)
-	{
+	if (!curr_stream->pipes) {
 		curr_stream->num_pipes = 0;
 		kfree(curr_stream);
 		curr_stream = NULL;
@@ -9280,8 +9166,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 #endif
 
 #ifdef ISP2401
-	if (curr_stream->config.online)
-	{
+	if (curr_stream->config.online) {
 		curr_stream->config.source.port.num_lanes =
 		    stream_config->source.port.num_lanes;
 		curr_stream->config.mode =  IA_CSS_INPUT_MODE_BUFFERED_SENSOR;
@@ -9299,8 +9184,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		    curr_stream->config.lock_all);
 
 	/* copy mode specific stuff */
-	switch (curr_stream->config.mode)
-	{
+	switch (curr_stream->config.mode) {
 	case IA_CSS_INPUT_MODE_SENSOR:
 	case IA_CSS_INPUT_MODE_BUFFERED_SENSOR:
 #if !defined(ISP2401)
@@ -9342,14 +9226,12 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	err = aspect_ratio_crop_init(curr_stream,
 					pipes,
 					&aspect_ratio_crop_enabled);
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LEAVE_ERR(err);
 		goto ERR;
 	}
 #endif
-	for (i = 0; i < num_pipes; i++)
-	{
+	for (i = 0; i < num_pipes; i++) {
 		struct ia_css_resolution effective_res;
 
 		curr_pipe = pipes[i];
@@ -9389,9 +9271,8 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 			if (pipes[i]->config.mode != IA_CSS_PIPE_MODE_ACC &&
 			    pipes[i]->config.mode != IA_CSS_PIPE_MODE_COPY) {
 				err = check_pipe_resolutions(pipes[i]);
-				if (err) {
+				if (err)
 					goto ERR;
-				}
 			}
 		}
 	}
@@ -9401,20 +9282,17 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		goto ERR;
 	IA_CSS_LOG("isp_params_configs: %p", curr_stream->isp_params_configs);
 
-	if (num_pipes == 1 && pipes[0]->config.mode == IA_CSS_PIPE_MODE_ACC)
-	{
+	if (num_pipes == 1 && pipes[0]->config.mode == IA_CSS_PIPE_MODE_ACC) {
 		*stream = curr_stream;
 		err = ia_css_acc_stream_create(curr_stream);
 		goto ERR;
 	}
 	/* sensor binning */
-	if (!spcopyonly)
-	{
+	if (!spcopyonly) {
 		sensor_binning_changed =
 		    sh_css_params_set_binning_factor(curr_stream,
 							curr_stream->config.sensor_binning_factor);
-	} else
-	{
+	} else {
 		sensor_binning_changed = false;
 	}
 
@@ -9425,8 +9303,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	curr_stream->cont_capt = false;
 	/* Temporary hack: we give the preview pipe a reference to the capture
 	    * pipe in continuous capture mode. */
-	if (curr_stream->config.continuous)
-	{
+	if (curr_stream->config.continuous) {
 		/* Search for the preview pipe and create the copy pipe */
 		struct ia_css_pipe *preview_pipe;
 		struct ia_css_pipe *video_pipe;
@@ -9474,9 +9351,9 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 			preview_pipe->pipe_settings.preview.copy_pipe = copy_pipe;
 			copy_pipe->stream = curr_stream;
 		}
-		if (preview_pipe && curr_stream->cont_capt) {
+		if (preview_pipe && curr_stream->cont_capt)
 			preview_pipe->pipe_settings.preview.capture_pipe = capture_pipe;
-		}
+
 		if (video_pipe && !video_pipe->pipe_settings.video.copy_pipe) {
 			err = create_pipe(IA_CSS_PIPE_MODE_CAPTURE, &copy_pipe, true);
 			if (err)
@@ -9485,15 +9362,13 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 			video_pipe->pipe_settings.video.copy_pipe = copy_pipe;
 			copy_pipe->stream = curr_stream;
 		}
-		if (video_pipe && curr_stream->cont_capt) {
+		if (video_pipe && curr_stream->cont_capt)
 			video_pipe->pipe_settings.video.capture_pipe = capture_pipe;
-		}
-		if (preview_pipe && acc_pipe) {
+
+		if (preview_pipe && acc_pipe)
 			preview_pipe->pipe_settings.preview.acc_pipe = acc_pipe;
-		}
 	}
-	for (i = 0; i < num_pipes; i++)
-	{
+	for (i = 0; i < num_pipes; i++) {
 		curr_pipe = pipes[i];
 		/* set current stream */
 		curr_pipe->stream = curr_stream;
@@ -9514,8 +9389,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	}
 
 	/* now pipes have been configured, info should be available */
-	for (i = 0; i < num_pipes; i++)
-	{
+	for (i = 0; i < num_pipes; i++) {
 		struct ia_css_pipe_info *pipe_info = NULL;
 
 		curr_pipe = pipes[i];
@@ -9565,22 +9439,19 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 
 	/* Map SP threads before doing anything. */
 	err = map_sp_threads(curr_stream, true);
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LOG("map_sp_threads: return_err=%d", err);
 		goto ERR;
 	}
 
-	for (i = 0; i < num_pipes; i++)
-	{
+	for (i = 0; i < num_pipes; i++) {
 		curr_pipe = pipes[i];
 		ia_css_pipe_map_queue(curr_pipe, true);
 	}
 
 	/* Create host side pipeline objects without stages */
 	err = create_host_pipeline_structure(curr_stream);
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LOG("create_host_pipeline_structure: return_err=%d", err);
 		goto ERR;
 	}
@@ -9618,13 +9489,13 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 }
 
 int
-ia_css_stream_destroy(struct ia_css_stream *stream) {
+ia_css_stream_destroy(struct ia_css_stream *stream)
+{
 	int i;
 	int err = 0;
 
 	IA_CSS_ENTER_PRIVATE("stream = %p", stream);
-	if (!stream)
-	{
+	if (!stream) {
 		err = -EINVAL;
 		IA_CSS_LEAVE_ERR_PRIVATE(err);
 		return err;
@@ -9633,8 +9504,7 @@ ia_css_stream_destroy(struct ia_css_stream *stream) {
 	ia_css_stream_isp_parameters_uninit(stream);
 
 	if ((stream->last_pipe) &&
-	    ia_css_pipeline_is_mapped(stream->last_pipe->pipe_num))
-	{
+	    ia_css_pipeline_is_mapped(stream->last_pipe->pipe_num)) {
 #if defined(ISP2401)
 		bool free_mpi;
 
@@ -9696,8 +9566,7 @@ ia_css_stream_destroy(struct ia_css_stream *stream) {
 	}
 
 	/* remove references from pipes to stream */
-	for (i = 0; i < stream->num_pipes; i++)
-	{
+	for (i = 0; i < stream->num_pipes; i++) {
 		struct ia_css_pipe *entry = stream->pipes[i];
 
 		assert(entry);
@@ -9726,8 +9595,7 @@ ia_css_stream_destroy(struct ia_css_stream *stream) {
 	/* working mode: take out of the seed list */
 	if (my_css_save.mode == sh_css_mode_working) {
 		for (i = 0; i < MAX_ACTIVE_STREAMS; i++) {
-			if (my_css_save.stream_seeds[i].stream == stream)
-			{
+			if (my_css_save.stream_seeds[i].stream == stream) {
 				IA_CSS_LOG("took out stream %d", i);
 				my_css_save.stream_seeds[i].stream = NULL;
 				break;
@@ -9743,7 +9611,8 @@ ia_css_stream_destroy(struct ia_css_stream *stream) {
 
 int
 ia_css_stream_get_info(const struct ia_css_stream *stream,
-			struct ia_css_stream_info *stream_info) {
+			struct ia_css_stream_info *stream_info)
+{
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_get_info: enter/exit\n");
 	assert(stream);
 	assert(stream_info);
@@ -9759,15 +9628,15 @@ ia_css_stream_get_info(const struct ia_css_stream *stream,
     * The stream handle is used to identify the correct entry in the css_save struct
     */
 int
-ia_css_stream_load(struct ia_css_stream *stream) {
+ia_css_stream_load(struct ia_css_stream *stream)
+{
 	if (!IS_ISP2401) {
 		int i;
 		int err;
 
 		assert(stream);
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,	"ia_css_stream_load() enter,\n");
-		for (i = 0; i < MAX_ACTIVE_STREAMS; i++)
-		{
+		for (i = 0; i < MAX_ACTIVE_STREAMS; i++) {
 			if (my_css_save.stream_seeds[i].stream == stream) {
 				int j;
 
@@ -9806,12 +9675,12 @@ ia_css_stream_load(struct ia_css_stream *stream) {
 }
 
 int
-ia_css_stream_start(struct ia_css_stream *stream) {
+ia_css_stream_start(struct ia_css_stream *stream)
+{
 	int err = 0;
 
 	IA_CSS_ENTER("stream = %p", stream);
-	if ((!stream) || (!stream->last_pipe))
-	{
+	if ((!stream) || (!stream->last_pipe)) {
 		IA_CSS_LEAVE_ERR(-EINVAL);
 		return -EINVAL;
 	}
@@ -9821,8 +9690,7 @@ ia_css_stream_start(struct ia_css_stream *stream) {
 
 	/* Create host side pipeline. */
 	err = create_host_pipeline(stream);
-	if (err)
-	{
+	if (err) {
 		IA_CSS_LEAVE_ERR(err);
 		return err;
 	}
@@ -9835,8 +9703,7 @@ ia_css_stream_start(struct ia_css_stream *stream) {
 
 #if !defined(ISP2401)
 	/* Initialize mipi size checks */
-	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-	{
+	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 		unsigned int idx;
 		unsigned int port = (unsigned int)(stream->config.source.port.port);
 
@@ -9847,8 +9714,7 @@ ia_css_stream_start(struct ia_css_stream *stream) {
 	}
 #endif
 
-	if (stream->config.mode != IA_CSS_INPUT_MODE_MEMORY)
-	{
+	if (stream->config.mode != IA_CSS_INPUT_MODE_MEMORY) {
 		err = sh_css_config_input_network(stream);
 		if (err)
 			return err;
@@ -9860,7 +9726,8 @@ ia_css_stream_start(struct ia_css_stream *stream) {
 }
 
 int
-ia_css_stream_stop(struct ia_css_stream *stream) {
+ia_css_stream_stop(struct ia_css_stream *stream)
+{
 	int err = 0;
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_stream_stop() enter/exit\n");
@@ -9871,22 +9738,19 @@ ia_css_stream_stop(struct ia_css_stream *stream) {
 
 #if !defined(ISP2401)
 	/* De-initialize mipi size checks */
-	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-	{
+	if (stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR) {
 		unsigned int idx;
 		unsigned int port = (unsigned int)(stream->config.source.port.port);
 
-		for (idx = 0; idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT; idx++) {
+		for (idx = 0; idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT; idx++)
 			sh_css_sp_group.config.mipi_sizes_for_check[port][idx] = 0;
-		}
 	}
 #endif
 
-	if (!IS_ISP2401) {
+	if (!IS_ISP2401)
 		err = ia_css_pipeline_request_stop(&stream->last_pipe->pipeline);
-	} else {
+	else
 		err = sh_css_pipes_stop(stream);
-	}
 
 	if (err)
 		return err;
@@ -9899,16 +9763,16 @@ ia_css_stream_stop(struct ia_css_stream *stream) {
 }
 
 bool
-ia_css_stream_has_stopped(struct ia_css_stream *stream) {
+ia_css_stream_has_stopped(struct ia_css_stream *stream)
+{
 	bool stopped;
 
 	assert(stream);
 
-	if (!IS_ISP2401) {
+	if (!IS_ISP2401)
 		stopped = ia_css_pipeline_has_stopped(&stream->last_pipe->pipeline);
-	} else {
+	else
 		stopped = sh_css_pipes_have_stopped(stream);
-	}
 
 	return stopped;
 }
@@ -9919,7 +9783,8 @@ ia_css_stream_has_stopped(struct ia_css_stream *stream) {
     * The stream handle is used to identify the correct entry in the css_save struct
     */
 int
-ia_css_stream_unload(struct ia_css_stream *stream) {
+ia_css_stream_unload(struct ia_css_stream *stream)
+{
 	int i;
 
 	assert(stream);
@@ -9927,8 +9792,7 @@ ia_css_stream_unload(struct ia_css_stream *stream) {
 	/* some checks */
 	assert(stream);
 	for (i = 0; i < MAX_ACTIVE_STREAMS; i++)
-		if (my_css_save.stream_seeds[i].stream == stream)
-		{
+		if (my_css_save.stream_seeds[i].stream == stream) {
 			int j;
 
 			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
@@ -9948,7 +9812,8 @@ ia_css_stream_unload(struct ia_css_stream *stream) {
 
 int
 ia_css_temp_pipe_to_pipe_id(const struct ia_css_pipe *pipe,
-			    enum ia_css_pipe_id *pipe_id) {
+			    enum ia_css_pipe_id *pipe_id)
+{
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE, "ia_css_temp_pipe_to_pipe_id() enter/exit\n");
 	if (pipe)
 		*pipe_id = pipe->mode;
@@ -9959,18 +9824,21 @@ ia_css_temp_pipe_to_pipe_id(const struct ia_css_pipe *pipe,
 }
 
 enum atomisp_input_format
-ia_css_stream_get_format(const struct ia_css_stream *stream) {
+ia_css_stream_get_format(const struct ia_css_stream *stream)
+{
 	return stream->config.input_config.format;
 }
 
 bool
-ia_css_stream_get_two_pixels_per_clock(const struct ia_css_stream *stream) {
+ia_css_stream_get_two_pixels_per_clock(const struct ia_css_stream *stream)
+{
 	return (stream->config.pixels_per_clock == 2);
 }
 
 struct ia_css_binary *
 ia_css_stream_get_shading_correction_binary(const struct ia_css_stream
-	*stream) {
+	*stream)
+{
 	struct ia_css_pipe *pipe;
 
 	assert(stream);
@@ -9988,7 +9856,8 @@ ia_css_stream_get_shading_correction_binary(const struct ia_css_stream
 }
 
 struct ia_css_binary *
-ia_css_stream_get_dvs_binary(const struct ia_css_stream *stream) {
+ia_css_stream_get_dvs_binary(const struct ia_css_stream *stream)
+{
 	int i;
 	struct ia_css_pipe *video_pipe = NULL;
 
@@ -10007,7 +9876,8 @@ ia_css_stream_get_dvs_binary(const struct ia_css_stream *stream) {
 }
 
 struct ia_css_binary *
-ia_css_stream_get_3a_binary(const struct ia_css_stream *stream) {
+ia_css_stream_get_3a_binary(const struct ia_css_stream *stream)
+{
 	struct ia_css_pipe *pipe;
 	struct ia_css_binary *s3a_binary = NULL;
 
@@ -10029,7 +9899,8 @@ ia_css_stream_get_3a_binary(const struct ia_css_stream *stream) {
 
 int
 ia_css_stream_set_output_padded_width(struct ia_css_stream *stream,
-					unsigned int output_padded_width) {
+					unsigned int output_padded_width)
+{
 	struct ia_css_pipe *pipe;
 
 	assert(stream);
@@ -10046,7 +9917,8 @@ ia_css_stream_set_output_padded_width(struct ia_css_stream *stream,
 }
 
 static struct ia_css_binary *
-ia_css_pipe_get_shading_correction_binary(const struct ia_css_pipe *pipe) {
+ia_css_pipe_get_shading_correction_binary(const struct ia_css_pipe *pipe)
+{
 	struct ia_css_binary *binary = NULL;
 
 	assert(pipe);
@@ -10091,7 +9963,8 @@ ia_css_pipe_get_shading_correction_binary(const struct ia_css_pipe *pipe) {
 }
 
 static struct ia_css_binary *
-ia_css_pipe_get_s3a_binary(const struct ia_css_pipe *pipe) {
+ia_css_pipe_get_s3a_binary(const struct ia_css_pipe *pipe)
+{
 	struct ia_css_binary *binary = NULL;
 
 	assert(pipe);
@@ -10114,9 +9987,9 @@ ia_css_pipe_get_s3a_binary(const struct ia_css_pipe *pipe) {
 				}
 			}
 		} else if (pipe->config.default_capture_config.mode ==
-			    IA_CSS_CAPTURE_MODE_BAYER)
+			    IA_CSS_CAPTURE_MODE_BAYER) {
 			binary = (struct ia_css_binary *)&pipe->pipe_settings.capture.pre_isp_binary;
-		else if (pipe->config.default_capture_config.mode ==
+		} else if (pipe->config.default_capture_config.mode ==
 			    IA_CSS_CAPTURE_MODE_ADVANCED ||
 			    pipe->config.default_capture_config.mode == IA_CSS_CAPTURE_MODE_LOW_LIGHT) {
 			if (pipe->config.isp_pipe_version == IA_CSS_PIPE_VERSION_1)
@@ -10138,7 +10011,8 @@ ia_css_pipe_get_s3a_binary(const struct ia_css_pipe *pipe) {
 }
 
 static struct ia_css_binary *
-ia_css_pipe_get_sdis_binary(const struct ia_css_pipe *pipe) {
+ia_css_pipe_get_sdis_binary(const struct ia_css_pipe *pipe)
+{
 	struct ia_css_binary *binary = NULL;
 
 	assert(pipe);
@@ -10158,14 +10032,16 @@ ia_css_pipe_get_sdis_binary(const struct ia_css_pipe *pipe) {
 }
 
 struct ia_css_pipeline *
-ia_css_pipe_get_pipeline(const struct ia_css_pipe *pipe) {
+ia_css_pipe_get_pipeline(const struct ia_css_pipe *pipe)
+{
 	assert(pipe);
 
 	return (struct ia_css_pipeline *)&pipe->pipeline;
 }
 
 unsigned int
-ia_css_pipe_get_pipe_num(const struct ia_css_pipe *pipe) {
+ia_css_pipe_get_pipe_num(const struct ia_css_pipe *pipe)
+{
 	assert(pipe);
 
 	/* KW was not sure this function was not returning a value
@@ -10182,7 +10058,8 @@ ia_css_pipe_get_pipe_num(const struct ia_css_pipe *pipe) {
 }
 
 unsigned int
-ia_css_pipe_get_isp_pipe_version(const struct ia_css_pipe *pipe) {
+ia_css_pipe_get_isp_pipe_version(const struct ia_css_pipe *pipe)
+{
 	assert(pipe);
 
 	return (unsigned int)pipe->config.isp_pipe_version;
@@ -10191,7 +10068,8 @@ ia_css_pipe_get_isp_pipe_version(const struct ia_css_pipe *pipe) {
 #define SP_START_TIMEOUT_US 30000000
 
 int
-ia_css_start_sp(void) {
+ia_css_start_sp(void)
+{
 	unsigned long timeout;
 	int err = 0;
 
@@ -10200,13 +10078,11 @@ ia_css_start_sp(void) {
 
 	/* waiting for the SP is completely started */
 	timeout = SP_START_TIMEOUT_US;
-	while ((ia_css_spctrl_get_state(SP0_ID) != IA_CSS_SP_SW_INITIALIZED) && timeout)
-	{
+	while ((ia_css_spctrl_get_state(SP0_ID) != IA_CSS_SP_SW_INITIALIZED) && timeout) {
 		timeout--;
 		udelay(1);
 	}
-	if (timeout == 0)
-	{
+	if (timeout == 0) {
 		IA_CSS_ERROR("timeout during SP initialization");
 		return -EINVAL;
 	}
@@ -10234,14 +10110,14 @@ ia_css_start_sp(void) {
 #define SP_SHUTDOWN_TIMEOUT_US 200000
 
 int
-ia_css_stop_sp(void) {
+ia_css_stop_sp(void)
+{
 	unsigned long timeout;
 	int err = 0;
 
 	IA_CSS_ENTER("void");
 
-	if (!sh_css_sp_is_running())
-	{
+	if (!sh_css_sp_is_running()) {
 		err = -EINVAL;
 		IA_CSS_LEAVE("SP already stopped : return_err=%d", err);
 
@@ -10253,8 +10129,7 @@ ia_css_stop_sp(void) {
 	if (!IS_ISP2401) {
 		sh_css_write_host2sp_command(host2sp_cmd_terminate);
 	} else {
-		if (!sh_css_write_host2sp_command(host2sp_cmd_terminate))
-		{
+		if (!sh_css_write_host2sp_command(host2sp_cmd_terminate)) {
 			IA_CSS_ERROR("Call to 'sh-css_write_host2sp_command()' failed");
 			ia_css_debug_dump_sp_sw_debug_info();
 			ia_css_debug_dump_debug_info(NULL);
@@ -10264,27 +10139,23 @@ ia_css_stop_sp(void) {
 	sh_css_sp_set_sp_running(false);
 
 	timeout = SP_SHUTDOWN_TIMEOUT_US;
-	while (!ia_css_spctrl_is_idle(SP0_ID) && timeout)
-	{
+	while (!ia_css_spctrl_is_idle(SP0_ID) && timeout) {
 		timeout--;
 		udelay(1);
 	}
 	if ((ia_css_spctrl_get_state(SP0_ID) != IA_CSS_SP_SW_TERMINATED))
 		IA_CSS_WARNING("SP has not terminated (SW)");
 
-	if (timeout == 0)
-	{
+	if (timeout == 0) {
 		IA_CSS_WARNING("SP is not idle");
 		ia_css_debug_dump_sp_sw_debug_info();
 	}
 	timeout = SP_SHUTDOWN_TIMEOUT_US;
-	while (!isp_ctrl_getbit(ISP0_ID, ISP_SC_REG, ISP_IDLE_BIT) && timeout)
-	{
+	while (!isp_ctrl_getbit(ISP0_ID, ISP_SC_REG, ISP_IDLE_BIT) && timeout) {
 		timeout--;
 		udelay(1);
 	}
-	if (timeout == 0)
-	{
+	if (timeout == 0) {
 		IA_CSS_WARNING("ISP is not idle");
 		ia_css_debug_dump_sp_sw_debug_info();
 	}
@@ -10299,7 +10170,8 @@ ia_css_stop_sp(void) {
 }
 
 int
-ia_css_update_continuous_frames(struct ia_css_stream *stream) {
+ia_css_update_continuous_frames(struct ia_css_stream *stream)
+{
 	struct ia_css_pipe *pipe;
 	unsigned int i;
 
@@ -10307,8 +10179,7 @@ ia_css_update_continuous_frames(struct ia_css_stream *stream) {
 	    IA_CSS_DEBUG_TRACE,
 	    "sh_css_update_continuous_frames() enter:\n");
 
-	if (!stream)
-	{
+	if (!stream) {
 		ia_css_debug_dtrace(
 		    IA_CSS_DEBUG_TRACE,
 		    "sh_css_update_continuous_frames() leave: invalid stream, return_void\n");
@@ -10319,10 +10190,9 @@ ia_css_update_continuous_frames(struct ia_css_stream *stream) {
 
 	for (i = stream->config.init_num_cont_raw_buf;
 		i < stream->config.target_num_cont_raw_buf; i++)
-	{
 		sh_css_update_host2sp_offline_frame(i,
 						    pipe->continuous_frames[i], pipe->cont_md_buffers[i]);
-	}
+
 	sh_css_update_host2sp_cont_num_raw_frames
 	(stream->config.target_num_cont_raw_buf, true);
 	ia_css_debug_dtrace(
@@ -10448,7 +10318,8 @@ void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map)
 
 #if CONFIG_ON_FRAME_ENQUEUE()
 static int set_config_on_frame_enqueue(struct ia_css_frame_info
-	*info, struct frame_data_wrapper *frame) {
+	*info, struct frame_data_wrapper *frame)
+{
 	frame->config_on_frame_enqueue.padded_width = 0;
 
 	/* currently we support configuration on frame enqueue only on YUV formats */
@@ -10456,11 +10327,11 @@ static int set_config_on_frame_enqueue(struct ia_css_frame_info
 	switch (info->format) {
 	case IA_CSS_FRAME_FORMAT_YUV420:
 	case IA_CSS_FRAME_FORMAT_NV12:
-		if (info->padded_width > info->res.width) {
+		if (info->padded_width > info->res.width)
 			frame->config_on_frame_enqueue.padded_width = info->padded_width;
-		} else if ((info->padded_width < info->res.width) && (info->padded_width > 0)) {
+		else if ((info->padded_width < info->res.width) && (info->padded_width > 0))
 			return -EINVAL;
-		}
+
 		/* nothing to do if width == padded width or padded width is zeroed (the same) */
 		break;
 	default:
@@ -10472,22 +10343,21 @@ static int set_config_on_frame_enqueue(struct ia_css_frame_info
 #endif
 
 int
-ia_css_unlock_raw_frame(struct ia_css_stream *stream, uint32_t exp_id) {
+ia_css_unlock_raw_frame(struct ia_css_stream *stream, uint32_t exp_id)
+{
 	int ret;
 
 	IA_CSS_ENTER("");
 
 	/* Only continuous streams have a tagger to which we can send the
 	    * unlock message. */
-	if (!stream || !stream->config.continuous)
-	{
+	if (!stream || !stream->config.continuous) {
 		IA_CSS_ERROR("invalid stream pointer");
 		return -EINVAL;
 	}
 
 	if (exp_id > IA_CSS_ISYS_MAX_EXPOSURE_ID ||
-	    exp_id < IA_CSS_ISYS_MIN_EXPOSURE_ID)
-	{
+	    exp_id < IA_CSS_ISYS_MIN_EXPOSURE_ID) {
 		IA_CSS_ERROR("invalid exposure ID: %d\n", exp_id);
 		return -EINVAL;
 	}
@@ -10506,7 +10376,8 @@ ia_css_unlock_raw_frame(struct ia_css_stream *stream, uint32_t exp_id) {
     */
 int
 ia_css_pipe_set_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
-				bool enable) {
+				bool enable)
+{
 	unsigned int thread_id;
 	struct ia_css_pipeline_stage *stage;
 	int err = 0;
@@ -10514,20 +10385,16 @@ ia_css_pipe_set_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
 	IA_CSS_ENTER("");
 
 	/* Parameter Check */
-	if (!pipe || !pipe->stream)
-	{
+	if (!pipe || !pipe->stream) {
 		IA_CSS_ERROR("Invalid Pipe.");
 		err = -EINVAL;
-	} else if (!(pipe->config.acc_extension))
-	{
+	} else if (!(pipe->config.acc_extension)) {
 		IA_CSS_ERROR("Invalid Pipe(No Extension Firmware)");
 		err = -EINVAL;
-	} else if (!sh_css_sp_is_running())
-	{
+	} else if (!sh_css_sp_is_running()) {
 		IA_CSS_ERROR("Leaving: queue unavailable.");
 		err = -EBUSY;
-	} else
-	{
+	} else {
 		/* Query the threadid and stage_num for the Extension firmware*/
 		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 		err = ia_css_pipeline_get_stage_from_fw(&pipe->pipeline, fw_handle, &stage);
@@ -10555,7 +10422,8 @@ ia_css_pipe_set_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
     */
 int
 ia_css_pipe_get_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
-				bool *enable) {
+				bool *enable)
+{
 	struct ia_css_pipeline_stage *stage;
 	unsigned int thread_id;
 	int err = 0;
@@ -10563,20 +10431,16 @@ ia_css_pipe_get_qos_ext_state(struct ia_css_pipe *pipe, uint32_t fw_handle,
 	IA_CSS_ENTER("");
 
 	/* Parameter Check */
-	if (!pipe || !pipe->stream)
-	{
+	if (!pipe || !pipe->stream) {
 		IA_CSS_ERROR("Invalid Pipe.");
 		err = -EINVAL;
-	} else if (!(pipe->config.acc_extension))
-	{
+	} else if (!(pipe->config.acc_extension)) {
 		IA_CSS_ERROR("Invalid Pipe (No Extension Firmware).");
 		err = -EINVAL;
-	} else if (!sh_css_sp_is_running())
-	{
+	} else if (!sh_css_sp_is_running()) {
 		IA_CSS_ERROR("Leaving: queue unavailable.");
 		err = -EBUSY;
-	} else
-	{
+	} else {
 		/* Query the threadid and stage_num corresponding to the Extension firmware*/
 		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 		err = ia_css_pipeline_get_stage_from_fw(&pipe->pipeline, fw_handle, &stage);
@@ -10596,7 +10460,8 @@ int
 ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
 					u32 fw_handle,
 					struct ia_css_isp_param_css_segments *css_seg,
-					struct ia_css_isp_param_isp_segments *isp_seg) {
+					struct ia_css_isp_param_isp_segments *isp_seg)
+{
 	unsigned int HIVE_ADDR_sp_group;
 	static struct sh_css_sp_group sp_group;
 	static struct sh_css_sp_stage sp_stage;
@@ -10614,20 +10479,16 @@ ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
 	fw = &sh_css_sp_fw;
 
 	/* Parameter Check */
-	if (!pipe || !pipe->stream)
-	{
+	if (!pipe || !pipe->stream) {
 		IA_CSS_ERROR("Invalid Pipe.");
 		err = -EINVAL;
-	} else if (!(pipe->config.acc_extension))
-	{
+	} else if (!(pipe->config.acc_extension)) {
 		IA_CSS_ERROR("Invalid Pipe (No Extension Firmware).");
 		err = -EINVAL;
-	} else if (!sh_css_sp_is_running())
-	{
+	} else if (!sh_css_sp_is_running()) {
 		IA_CSS_ERROR("Leaving: queue unavailable.");
 		err = -EBUSY;
-	} else
-	{
+	} else {
 		/* Query the thread_id and stage_num corresponding to the Extension firmware */
 		ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 		err = ia_css_pipeline_get_stage_from_fw(&pipe->pipeline, fw_handle, &stage);
@@ -10678,7 +10539,8 @@ ia_css_pipe_update_qos_ext_mapped_arg(struct ia_css_pipe *pipe,
 static int
 aspect_ratio_crop_init(struct ia_css_stream *curr_stream,
 			struct ia_css_pipe *pipes[],
-			bool *do_crop_status) {
+			bool *do_crop_status)
+{
 	int err = 0;
 	int i;
 	struct ia_css_pipe *curr_pipe;
@@ -10687,15 +10549,13 @@ aspect_ratio_crop_init(struct ia_css_stream *curr_stream,
 	if ((!curr_stream) ||
 	    (curr_stream->num_pipes == 0) ||
 	    (!pipes) ||
-	    (!do_crop_status))
-	{
+	    (!do_crop_status)) {
 		err = -EINVAL;
 		IA_CSS_LEAVE_ERR(err);
 		return err;
 	}
 
-	for (i = 0; i < curr_stream->num_pipes; i++)
-	{
+	for (i = 0; i < curr_stream->num_pipes; i++) {
 		curr_pipe = pipes[i];
 		pipe_mask |= (1 << curr_pipe->config.mode);
 	}
@@ -10709,7 +10569,8 @@ aspect_ratio_crop_init(struct ia_css_stream *curr_stream,
 }
 
 static bool
-aspect_ratio_crop_check(bool enabled, struct ia_css_pipe *curr_pipe) {
+aspect_ratio_crop_check(bool enabled, struct ia_css_pipe *curr_pipe)
+{
 	bool status = false;
 
 	if ((curr_pipe) && enabled) {
@@ -10724,7 +10585,8 @@ aspect_ratio_crop_check(bool enabled, struct ia_css_pipe *curr_pipe) {
 
 static int
 aspect_ratio_crop(struct ia_css_pipe *curr_pipe,
-		    struct ia_css_resolution *effective_res) {
+		    struct ia_css_resolution *effective_res)
+{
 	int err = 0;
 	struct ia_css_resolution crop_res;
 	struct ia_css_resolution *in_res = NULL;
@@ -10734,8 +10596,7 @@ aspect_ratio_crop(struct ia_css_pipe *curr_pipe,
 	bool use_capt_pp_in_res = false;
 
 	if ((!curr_pipe) ||
-	    (!effective_res))
-	{
+	    (!effective_res)) {
 		err = -EINVAL;
 		IA_CSS_LEAVE_ERR(err);
 		return err;
@@ -10743,8 +10604,7 @@ aspect_ratio_crop(struct ia_css_pipe *curr_pipe,
 
 	if ((curr_pipe->config.mode != IA_CSS_PIPE_MODE_PREVIEW) &&
 	    (curr_pipe->config.mode != IA_CSS_PIPE_MODE_VIDEO) &&
-	    (curr_pipe->config.mode != IA_CSS_PIPE_MODE_CAPTURE))
-	{
+	    (curr_pipe->config.mode != IA_CSS_PIPE_MODE_CAPTURE)) {
 		err = -EINVAL;
 		IA_CSS_LEAVE_ERR(err);
 		return err;
@@ -10765,8 +10625,7 @@ aspect_ratio_crop(struct ia_css_pipe *curr_pipe,
 	in_res = &curr_pipe->stream->config.input_config.effective_res;
 	out_res = &curr_pipe->output_info[0].res;
 
-	switch (curr_pipe->config.mode)
-	{
+	switch (curr_pipe->config.mode) {
 	case IA_CSS_PIPE_MODE_PREVIEW:
 		if (use_bds_output_info)
 			out_res = &curr_pipe->bds_output_info.res;
@@ -10793,20 +10652,19 @@ aspect_ratio_crop(struct ia_css_pipe *curr_pipe,
 
 	err = ia_css_frame_find_crop_resolution(in_res, out_res, &crop_res);
 	if (!err)
-	{
 		*effective_res = crop_res;
-	} else
-	{
+	else
 		/* in case of error fallback to default
 		    * effective resolution from driver. */
 		IA_CSS_LOG("ia_css_frame_find_crop_resolution() failed with err(%d)", err);
-	}
+
 	return err;
 }
 #endif
 
 static void
-sh_css_hmm_buffer_record_init(void) {
+sh_css_hmm_buffer_record_init(void)
+{
 	int i;
 
 	for (i = 0; i < MAX_HMM_BUFFER_NUM; i++)
@@ -10814,7 +10672,8 @@ sh_css_hmm_buffer_record_init(void) {
 }
 
 static void
-sh_css_hmm_buffer_record_uninit(void) {
+sh_css_hmm_buffer_record_uninit(void)
+{
 	int i;
 	struct sh_css_hmm_buffer_record *buffer_record = NULL;
 
@@ -10830,7 +10689,8 @@ sh_css_hmm_buffer_record_uninit(void) {
 }
 
 static void
-sh_css_hmm_buffer_record_reset(struct sh_css_hmm_buffer_record *buffer_record) {
+sh_css_hmm_buffer_record_reset(struct sh_css_hmm_buffer_record *buffer_record)
+{
 	assert(buffer_record);
 	buffer_record->in_use = false;
 	buffer_record->type = IA_CSS_BUFFER_TYPE_INVALID;
@@ -10841,7 +10701,8 @@ sh_css_hmm_buffer_record_reset(struct sh_css_hmm_buffer_record *buffer_record) {
 static struct sh_css_hmm_buffer_record
 *sh_css_hmm_buffer_record_acquire(struct ia_css_rmgr_vbuf_handle *h_vbuf,
 				    enum ia_css_buffer_type type,
-				    hrt_address kernel_ptr) {
+				    hrt_address kernel_ptr)
+{
 	int i;
 	struct sh_css_hmm_buffer_record *buffer_record = NULL;
 	struct sh_css_hmm_buffer_record *out_buffer_record = NULL;
@@ -10869,7 +10730,8 @@ static struct sh_css_hmm_buffer_record
 
 static struct sh_css_hmm_buffer_record
 *sh_css_hmm_buffer_record_validate(ia_css_ptr ddr_buffer_addr,
-				    enum ia_css_buffer_type type) {
+				    enum ia_css_buffer_type type)
+{
 	int i;
 	struct sh_css_hmm_buffer_record *buffer_record = NULL;
 	bool found_record = false;
-- 
2.31.1

