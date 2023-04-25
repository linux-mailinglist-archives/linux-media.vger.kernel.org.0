Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB2B6EDD2B
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 09:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232881AbjDYHuD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Apr 2023 03:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232858AbjDYHuA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Apr 2023 03:50:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD742D76
        for <linux-media@vger.kernel.org>; Tue, 25 Apr 2023 00:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682408954;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hzMIL0O6Rqu1+Aul5k0V93FsMhWBw1S3BMNzB6eXgvI=;
        b=B9/OlToJC1kXyts9Ed+rgm4yE6zvLitccTrFuDLaUHYQgZwHzepPAM8uPm5vFZVrTXDXQ9
        g8WftTYhtcfkHehKysUXapgbPjUv9Ynfm2M6HCex4dwHi0oNEQ+KfMfMgClY9vCKmko/Tm
        qu/a0TnFxLgtCJyjXKl+TLbQOA3zGHY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-594-EE9mc24mMBGmW3PpZfxLRQ-1; Tue, 25 Apr 2023 03:49:13 -0400
X-MC-Unique: EE9mc24mMBGmW3PpZfxLRQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBF78800B35;
        Tue, 25 Apr 2023 07:49:12 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.153])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 174CE14171B8;
        Tue, 25 Apr 2023 07:49:08 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc:     Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 1/5] staging: media: atomisp: sh_css: Remove #ifdef ISP2401
Date:   Tue, 25 Apr 2023 15:48:37 +0800
Message-Id: <20230425074841.29063-2-hpa@redhat.com>
In-Reply-To: <20230425074841.29063-1-hpa@redhat.com>
References: <20230425074841.29063-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_PDS_OTHER_BAD_TLD,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The actions of ISP2401 and 2400 are determined at the runtime.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 584 ++++++++++-----------
 1 file changed, 286 insertions(+), 298 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 93789500416f..0cc008b3c921 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -1529,15 +1529,14 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 
 	mipi_init();
 
-#ifndef ISP2401
 	/*
 	 * In case this has been programmed already, update internal
 	 * data structure ...
 	 * DEPRECATED
 	 */
-	my_css.page_table_base_index = mmu_get_page_table_base_index(MMU0_ID);
+	if (!IS_ISP2401)
+		my_css.page_table_base_index = mmu_get_page_table_base_index(MMU0_ID);
 
-#endif
 	my_css.irq_type = irq_type;
 
 	my_css_save.irq_type = irq_type;
@@ -1596,10 +1595,8 @@ ia_css_init(struct device *dev, const struct ia_css_env *env,
 	 * sh_css_init_buffer_queues();
 	 */
 
-#if defined(ISP2401)
-	gp_device_reg_store(GP_DEVICE0_ID, _REG_GP_SWITCH_ISYS2401_ADDR, 1);
-#endif
-
+	if (IS_ISP2401)
+		gp_device_reg_store(GP_DEVICE0_ID, _REG_GP_SWITCH_ISYS2401_ADDR, 1);
 
 	if (!IS_ISP2401)
 		dma_set_max_burst_size(DMA0_ID, HIVE_DMA_BUS_DDR_CONN,
@@ -2128,13 +2125,13 @@ ia_css_pipe_destroy(struct ia_css_pipe *pipe)
 						    err);
 			}
 		}
-#ifndef ISP2401
-		ia_css_frame_free_multiple(NUM_VIDEO_TNR_FRAMES,
-					   pipe->pipe_settings.video.tnr_frames);
-#else
-		ia_css_frame_free_multiple(NUM_VIDEO_TNR_FRAMES,
-					   pipe->pipe_settings.video.tnr_frames);
-#endif
+		if (IS_ISP2401)
+			ia_css_frame_free_multiple(NUM_VIDEO_TNR_FRAMES,
+						   pipe->pipe_settings.video.tnr_frames);
+		else
+			ia_css_frame_free_multiple(NUM_VIDEO_TNR_FRAMES,
+						   pipe->pipe_settings.video.tnr_frames);
+
 		ia_css_frame_free_multiple(MAX_NUM_VIDEO_DELAY_FRAMES,
 					   pipe->pipe_settings.video.delay_frames);
 		break;
@@ -2238,11 +2235,10 @@ int ia_css_irq_translate(
 		case virq_isys_csi:
 			infos |= IA_CSS_IRQ_INFO_INPUT_SYSTEM_ERROR;
 			break;
-#if !defined(ISP2401)
 		case virq_ifmt0_id:
-			infos |= IA_CSS_IRQ_INFO_IF_ERROR;
+			if (!IS_ISP2401)
+				infos |= IA_CSS_IRQ_INFO_IF_ERROR;
 			break;
-#endif
 		case virq_dma:
 			infos |= IA_CSS_IRQ_INFO_DMA_ERROR;
 			break;
@@ -2277,27 +2273,34 @@ int ia_css_irq_enable(
 	IA_CSS_ENTER("info=%d, enable=%d", info, enable);
 
 	switch (info) {
-#if !defined(ISP2401)
 	case IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF:
+		if (IS_ISP2401)
+			/* Just ignore those unused IRQs without printing errors */
+			return 0;
+
 		irq = virq_isys_sof;
 		break;
 	case IA_CSS_IRQ_INFO_CSS_RECEIVER_EOF:
+		if (IS_ISP2401)
+			/* Just ignore those unused IRQs without printing errors */
+			return 0;
+
 		irq = virq_isys_eof;
 		break;
 	case IA_CSS_IRQ_INFO_INPUT_SYSTEM_ERROR:
+		if (IS_ISP2401)
+			/* Just ignore those unused IRQs without printing errors */
+			return 0;
+
 		irq = virq_isys_csi;
 		break;
 	case IA_CSS_IRQ_INFO_IF_ERROR:
+		if (IS_ISP2401)
+			/* Just ignore those unused IRQs without printing errors */
+			return 0;
+
 		irq = virq_ifmt0_id;
 		break;
-#else
-	case IA_CSS_IRQ_INFO_CSS_RECEIVER_SOF:
-	case IA_CSS_IRQ_INFO_CSS_RECEIVER_EOF:
-	case IA_CSS_IRQ_INFO_INPUT_SYSTEM_ERROR:
-	case IA_CSS_IRQ_INFO_IF_ERROR:
-		/* Just ignore those unused IRQs without printing errors */
-		return 0;
-#endif
 	case IA_CSS_IRQ_INFO_DMA_ERROR:
 		irq = virq_dma;
 		break;
@@ -2413,14 +2416,14 @@ alloc_continuous_frames(struct ia_css_pipe *pipe, bool init_time)
 		return -EINVAL;
 	}
 
-#if defined(ISP2401)
-	/* For CSI2+, the continuous frame will hold the full input frame */
-	ref_info.res.width = pipe->stream->config.input_config.input_res.width;
-	ref_info.res.height = pipe->stream->config.input_config.input_res.height;
+	if (IS_ISP2401) {
+		/* For CSI2+, the continuous frame will hold the full input frame */
+		ref_info.res.width = pipe->stream->config.input_config.input_res.width;
+		ref_info.res.height = pipe->stream->config.input_config.input_res.height;
 
-	/* Ensure padded width is aligned for 2401 */
-	ref_info.padded_width = CEIL_MUL(ref_info.res.width, 2 * ISP_VEC_NELEMS);
-#endif
+		/* Ensure padded width is aligned for 2401 */
+		ref_info.padded_width = CEIL_MUL(ref_info.res.width, 2 * ISP_VEC_NELEMS);
+	}
 
 	if (pipe->stream->config.pack_raw_pixels) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
@@ -2499,11 +2502,9 @@ load_preview_binaries(struct ia_css_pipe *pipe)
 	int err = 0;
 	bool need_vf_pp = false;
 	bool need_isp_copy_binary = false;
-#ifdef ISP2401
 	bool sensor = false;
-#else
 	bool continuous;
-#endif
+
 	/* preview only have 1 output pin now */
 	struct ia_css_frame_info *pipe_out_info = &pipe->output_info[0];
 	struct ia_css_preview_settings *mycs  = &pipe->pipe_settings.preview;
@@ -2514,11 +2515,11 @@ load_preview_binaries(struct ia_css_pipe *pipe)
 	assert(pipe->mode == IA_CSS_PIPE_ID_PREVIEW);
 
 	online = pipe->stream->config.online;
-#ifdef ISP2401
-	sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
-#else
-	continuous = pipe->stream->config.continuous;
-#endif
+
+	if (IS_ISP2401)
+		sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
+	else
+		continuous = pipe->stream->config.continuous;
 
 	if (mycs->preview_binary.info)
 		return 0;
@@ -2627,24 +2628,26 @@ load_preview_binaries(struct ia_css_pipe *pipe)
 			return err;
 	}
 
-#ifdef ISP2401
-	/*
-	 * When the input system is 2401, only the Direct Sensor Mode
-	 * Offline Preview uses the ISP copy binary.
-	 */
-	need_isp_copy_binary = !online && sensor;
-#else
-	/*
-	 * About pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY:
-	 * This is typical the case with SkyCam (which has no input system) but it also applies to all cases
-	 * where the driver chooses for memory based input frames. In these cases, a copy binary (which typical
-	 * copies sensor data to DDR) does not have much use.
-	 */
-	if (!IS_ISP2401)
-		need_isp_copy_binary = !online && !continuous;
+	if (IS_ISP2401)
+		/*
+		 * When the input system is 2401, only the Direct Sensor Mode
+		 * Offline Preview uses the ISP copy binary.
+		 */
+		need_isp_copy_binary = !online && sensor;
 	else
-		need_isp_copy_binary = !online && !continuous && !(pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY);
-#endif
+		/*
+		 * About pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY:
+		 * This is typical the case with SkyCam (which has no input system) but it also
+		 * applies to all cases where the driver chooses for memory based input frames.
+		 * In these cases, a copy binary (which typical copies sensor data to DDR) does
+		 * not have much use.
+		 */
+		if (!IS_ISP2401)
+			need_isp_copy_binary = !online && !continuous;
+		else
+			need_isp_copy_binary = !online && !continuous &&
+					       !(pipe->stream->config.mode ==
+						 IA_CSS_INPUT_MODE_MEMORY);
 
 	/* Copy */
 	if (need_isp_copy_binary) {
@@ -3125,11 +3128,11 @@ init_in_frameinfo_memory_defaults(struct ia_css_pipe *pipe,
 
 	in_frame->frame_info.format = format;
 
-#ifdef ISP2401
-	if (format == IA_CSS_FRAME_FORMAT_RAW)
-		in_frame->frame_info.format = (pipe->stream->config.pack_raw_pixels) ?
-		IA_CSS_FRAME_FORMAT_RAW_PACKED : IA_CSS_FRAME_FORMAT_RAW;
-#endif
+	if (IS_ISP2401) {
+		if (format == IA_CSS_FRAME_FORMAT_RAW)
+			in_frame->frame_info.format = (pipe->stream->config.pack_raw_pixels) ?
+			IA_CSS_FRAME_FORMAT_RAW_PACKED : IA_CSS_FRAME_FORMAT_RAW;
+	}
 
 	in_frame->frame_info.res.width = pipe->stream->config.input_config.input_res.width;
 	in_frame->frame_info.res.height = pipe->stream->config.input_config.input_res.height;
@@ -3141,9 +3144,12 @@ init_in_frameinfo_memory_defaults(struct ia_css_pipe *pipe,
 	ia_css_query_internal_queue_id(IA_CSS_BUFFER_TYPE_INPUT_FRAME, thread_id, &queue_id);
 	in_frame->dynamic_queue_id = queue_id;
 	in_frame->buf_type = IA_CSS_BUFFER_TYPE_INPUT_FRAME;
+
 #ifdef ISP2401
+
 	ia_css_get_crop_offsets(pipe, &in_frame->frame_info);
 #endif
+
 	err = ia_css_frame_init_planes(in_frame);
 
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE, "%s() bayer_order = %d\n",
@@ -3211,18 +3217,18 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 
 	me->dvs_frame_delay = pipe->dvs_frame_delay;
 
-#ifdef ISP2401
-	/*
-	 * When the input system is 2401, always enable 'in_frameinfo_memory'
-	 * except for the following: online or continuous
-	 */
-	need_in_frameinfo_memory = !(pipe->stream->config.online ||
-				     pipe->stream->config.continuous);
-#else
-	/* Construct in_frame info (only in case we have dynamic input */
-	need_in_frameinfo_memory = pipe->stream->config.mode ==
-				   IA_CSS_INPUT_MODE_MEMORY;
-#endif
+	if (IS_ISP2401) {
+		/*
+		 * When the input system is 2401, always enable 'in_frameinfo_memory'
+		 * except for the following: online or continuous
+		 */
+		need_in_frameinfo_memory = !(pipe->stream->config.online ||
+					     pipe->stream->config.continuous);
+	} else {
+		/* Construct in_frame info (only in case we have dynamic input */
+		need_in_frameinfo_memory = pipe->stream->config.mode ==
+					   IA_CSS_INPUT_MODE_MEMORY;
+	}
 
 	/* Construct in_frame info (only in case we have dynamic input */
 	if (need_in_frameinfo_memory) {
@@ -3268,15 +3274,14 @@ static int create_host_video_pipeline(struct ia_css_pipe *pipe)
 			goto ERR;
 		in_frame = me->stages->args.out_frame[0];
 	} else if (pipe->stream->config.continuous) {
-#ifdef ISP2401
-		/*
-		 * When continuous is enabled, configure in_frame with the
-		 * last pipe, which is the copy pipe.
-		 */
-		in_frame = pipe->stream->last_pipe->continuous_frames[0];
-#else
-		in_frame = pipe->continuous_frames[0];
-#endif
+		if (IS_ISP2401)
+			/*
+			 * When continuous is enabled, configure in_frame with the
+			 * last pipe, which is the copy pipe.
+			 */
+			in_frame = pipe->stream->last_pipe->continuous_frames[0];
+		else
+			in_frame = pipe->continuous_frames[0];
 	}
 
 	ia_css_pipe_util_set_output_frames(out_frames, 0,
@@ -3373,12 +3378,10 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe)
 	struct ia_css_frame *out_frame;
 	struct ia_css_frame *out_frames[IA_CSS_BINARY_MAX_OUTPUT_PORTS];
 	bool need_in_frameinfo_memory = false;
-#ifdef ISP2401
 	bool sensor = false;
 	bool buffered_sensor = false;
 	bool online = false;
 	bool continuous = false;
-#endif
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
 	if ((!pipe) || (!pipe->stream) || (pipe->mode != IA_CSS_PIPE_ID_PREVIEW)) {
@@ -3391,25 +3394,25 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe)
 	me = &pipe->pipeline;
 	ia_css_pipeline_clean(me);
 
-#ifdef ISP2401
-	/*
-	 * When the input system is 2401, always enable 'in_frameinfo_memory'
-	 * except for the following:
-	 * - Direct Sensor Mode Online Preview
-	 * - Buffered Sensor Mode Online Preview
-	 * - Direct Sensor Mode Continuous Preview
-	 * - Buffered Sensor Mode Continuous Preview
-	 */
-	sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
-	buffered_sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
-	online = pipe->stream->config.online;
-	continuous = pipe->stream->config.continuous;
-	need_in_frameinfo_memory =
-	!((sensor && (online || continuous)) || (buffered_sensor && (online || continuous)));
-#else
-	/* Construct in_frame info (only in case we have dynamic input */
-	need_in_frameinfo_memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
-#endif
+	if (IS_ISP2401) {
+		/*
+		 * When the input system is 2401, always enable 'in_frameinfo_memory'
+		 * except for the following:
+		 * - Direct Sensor Mode Online Preview
+		 * - Buffered Sensor Mode Online Preview
+		 * - Direct Sensor Mode Continuous Preview
+		 * - Buffered Sensor Mode Continuous Preview
+		 */
+		sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
+		buffered_sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
+		online = pipe->stream->config.online;
+		continuous = pipe->stream->config.continuous;
+		need_in_frameinfo_memory =
+		!((sensor && (online || continuous)) || (buffered_sensor &&
+							(online || continuous)));
+	} else
+		/* Construct in_frame info (only in case we have dynamic input */
+		need_in_frameinfo_memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
 	if (need_in_frameinfo_memory) {
 		err = init_in_frameinfo_memory_defaults(pipe, &me->in_frame,
 							IA_CSS_FRAME_FORMAT_RAW);
@@ -3417,9 +3420,9 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe)
 			goto ERR;
 
 		in_frame = &me->in_frame;
-	} else {
+	} else
 		in_frame = NULL;
-	}
+
 
 	err = init_out_frameinfo_defaults(pipe, &me->out_frame[0], 0);
 	if (err)
@@ -3441,17 +3444,16 @@ create_host_preview_pipeline(struct ia_css_pipe *pipe)
 			goto ERR;
 		in_frame = me->stages->args.out_frame[0];
 	} else if (pipe->stream->config.continuous) {
-#ifdef ISP2401
-		/*
-		 * When continuous is enabled, configure in_frame with the
-		 * last pipe, which is the copy pipe.
-		 */
-		if (continuous || !online)
-			in_frame = pipe->stream->last_pipe->continuous_frames[0];
-
-#else
-		in_frame = pipe->continuous_frames[0];
-#endif
+		if (IS_ISP2401) {
+			/*
+			 * When continuous is enabled, configure in_frame with the
+			 * last pipe, which is the copy pipe.
+			 */
+			if (continuous || !online)
+				in_frame = pipe->stream->last_pipe->continuous_frames[0];
+		} else {
+			in_frame = pipe->continuous_frames[0];
+		}
 	}
 
 	if (vf_pp_binary) {
@@ -3925,19 +3927,19 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 			case IA_CSS_BUFFER_TYPE_OUTPUT_FRAME:
 			case IA_CSS_BUFFER_TYPE_SEC_OUTPUT_FRAME:
 				if (pipe && pipe->stop_requested) {
-#if !defined(ISP2401)
-					/*
-					 * free mipi frames only for old input
-					 * system for 2401 it is done in
-					 * ia_css_stream_destroy call
-					 */
-					return_err = free_mipi_frames(pipe);
-					if (return_err) {
-						IA_CSS_LOG("free_mipi_frames() failed");
-						IA_CSS_LEAVE_ERR(return_err);
-						return return_err;
+					if (!IS_ISP2401) {
+						/*
+						 * free mipi frames only for old input
+						 * system for 2401 it is done in
+						 * ia_css_stream_destroy call
+						 */
+						return_err = free_mipi_frames(pipe);
+						if (return_err) {
+							IA_CSS_LOG("free_mipi_frames() failed");
+							IA_CSS_LEAVE_ERR(return_err);
+							return return_err;
+						}
 					}
-#endif
 					pipe->stop_requested = false;
 				}
 				fallthrough;
@@ -3959,12 +3961,11 @@ ia_css_pipe_dequeue_buffer(struct ia_css_pipe *pipe,
 					pipe->num_invalid_frames--;
 
 				if (frame->frame_info.format == IA_CSS_FRAME_FORMAT_BINARY_8) {
-#ifdef ISP2401
-					frame->planes.binary.size = frame->data_bytes;
-#else
-					frame->planes.binary.size =
-					    sh_css_sp_get_binary_copy_size();
-#endif
+					if (IS_ISP2401)
+						frame->planes.binary.size = frame->data_bytes;
+					else
+						frame->planes.binary.size =
+						    sh_css_sp_get_binary_copy_size();
 				}
 				if (buf_type == IA_CSS_BUFFER_TYPE_OUTPUT_FRAME) {
 					IA_CSS_LOG("pfp: dequeued OF %d with config id %d thread %d",
@@ -4880,22 +4881,20 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 			    pipe->num_invalid_frames, pipe->dvs_frame_delay);
 
 	/* pqiao TODO: temp hack for PO, should be removed after offline YUVPP is enabled */
-#if !defined(ISP2401)
-	/* Copy */
-	if (!online && !continuous) {
-		/*
-		 * TODO: what exactly needs doing, prepend the copy binary to
-		 *	 video base this only on !online?
-		 */
-		err = load_copy_binary(pipe,
-				       &mycs->copy_binary,
-				       &mycs->video_binary);
-		if (err)
-			return err;
+	if (!IS_ISP2401) {
+		/* Copy */
+		if (!online && !continuous) {
+			/*
+			 * TODO: what exactly needs doing, prepend the copy binary to
+			 *	 video base this only on !online?
+			 */
+			err = load_copy_binary(pipe,
+					       &mycs->copy_binary,
+					       &mycs->video_binary);
+			if (err)
+				return err;
+		}
 	}
-#else
-	(void)continuous;
-#endif
 
 	if (pipe->enable_viewfinder[IA_CSS_PIPE_OUTPUT_STAGE_0] && need_vf_pp) {
 		struct ia_css_binary_descr vf_pp_descr;
@@ -5227,11 +5226,8 @@ static int load_primary_binaries(
 	bool need_pp = false;
 	bool need_isp_copy_binary = false;
 	bool need_ldc = false;
-#ifdef ISP2401
 	bool sensor = false;
-#else
 	bool memory, continuous;
-#endif
 	struct ia_css_frame_info prim_in_info,
 		       prim_out_info,
 		       capt_pp_out_info, vf_info,
@@ -5251,12 +5247,12 @@ static int load_primary_binaries(
 	       pipe->mode == IA_CSS_PIPE_ID_COPY);
 
 	online = pipe->stream->config.online;
-#ifdef ISP2401
-	sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
-#else
-	memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
-	continuous = pipe->stream->config.continuous;
-#endif
+	if (IS_ISP2401) {
+		sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
+	} else {
+		memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
+		continuous = pipe->stream->config.continuous;
+	}
 
 	mycs = &pipe->pipe_settings.capture;
 	pipe_out_info = &pipe->output_info[0];
@@ -5462,15 +5458,14 @@ static int load_primary_binaries(
 	if (err)
 		return err;
 
-#ifdef ISP2401
-	/*
-	 * When the input system is 2401, only the Direct Sensor Mode
-	 * Offline Capture uses the ISP copy binary.
-	 */
-	need_isp_copy_binary = !online && sensor;
-#else
-	need_isp_copy_binary = !online && !continuous && !memory;
-#endif
+	if (IS_ISP2401)
+		/*
+		 * When the input system is 2401, only the Direct Sensor Mode
+		 * Offline Capture uses the ISP copy binary.
+		 */
+		need_isp_copy_binary = !online && sensor;
+	else
+		need_isp_copy_binary = !online && !continuous && !memory;
 
 	/* ISP Copy */
 	if (need_isp_copy_binary) {
@@ -5681,10 +5676,10 @@ static int load_advanced_binaries(struct ia_css_pipe *pipe)
 	}
 
 	/* Copy */
-#ifdef ISP2401
-	/* For CSI2+, only the direct sensor mode/online requires ISP copy */
-	need_isp_copy = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
-#endif
+	if (IS_ISP2401)
+		/* For CSI2+, only the direct sensor mode/online requires ISP copy */
+		need_isp_copy = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
+
 	if (need_isp_copy)
 		load_copy_binary(pipe,
 				 &pipe->pipe_settings.capture.copy_binary,
@@ -5829,10 +5824,10 @@ static int load_low_light_binaries(struct ia_css_pipe *pipe)
 	}
 
 	/* Copy */
-#ifdef ISP2401
-	/* For CSI2+, only the direct sensor mode/online requires ISP copy */
-	need_isp_copy = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
-#endif
+	if (IS_ISP2401)
+		/* For CSI2+, only the direct sensor mode/online requires ISP copy */
+		need_isp_copy = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
+
 	if (need_isp_copy)
 		err = load_copy_binary(pipe,
 				       &pipe->pipe_settings.capture.copy_binary,
@@ -5902,10 +5897,9 @@ static int load_capture_binaries(struct ia_css_pipe *pipe)
 	switch (pipe->config.default_capture_config.mode) {
 	case IA_CSS_CAPTURE_MODE_RAW:
 		err = load_copy_binaries(pipe);
-#if defined(ISP2401)
-		if (!err)
+		if (!err && IS_ISP2401)
 			pipe->pipe_settings.capture.copy_binary.online = pipe->stream->config.online;
-#endif
+
 		break;
 	case IA_CSS_CAPTURE_MODE_BAYER:
 		err = load_bayer_isp_binaries(pipe);
@@ -6409,7 +6403,6 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
 	else
 		next_binary = NULL;
 
-#if defined(ISP2401)
 	/*
 	 * NOTES
 	 * - Why does the "yuvpp" pipe needs "isp_copy_binary" (i.e. ISP Copy) when
@@ -6427,11 +6420,11 @@ load_yuvpp_binaries(struct ia_css_pipe *pipe)
 	 *   pp_defs.h" for the list of input-frame formats that are supported by the
 	 *   "yuv_scale_binary".
 	 */
-	need_isp_copy_binary =
-	    (pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_YUV422_8);
-#else  /* !ISP2401 */
-	need_isp_copy_binary = true;
-#endif /*  ISP2401 */
+	if (IS_ISP2401)
+		need_isp_copy_binary =
+		    (pipe->stream->config.input_config.format == ATOMISP_INPUT_FORMAT_YUV422_8);
+	else
+		need_isp_copy_binary = true;
 
 	if (need_isp_copy_binary) {
 		err = load_copy_binary(pipe,
@@ -6678,12 +6671,10 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
 	struct ia_css_frame *vf_frame[IA_CSS_PIPE_MAX_OUTPUT_STAGE];
 	struct ia_css_pipeline_stage_desc stage_desc;
 	bool need_in_frameinfo_memory = false;
-#ifdef ISP2401
 	bool sensor = false;
 	bool buffered_sensor = false;
 	bool online = false;
 	bool continuous = false;
-#endif
 
 	IA_CSS_ENTER_PRIVATE("pipe = %p", pipe);
 	if ((!pipe) || (!pipe->stream) || (pipe->mode != IA_CSS_PIPE_ID_YUVPP)) {
@@ -6700,24 +6691,23 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
 	num_stage  = pipe->pipe_settings.yuvpp.num_yuv_scaler;
 	num_output_stage   = pipe->pipe_settings.yuvpp.num_output;
 
-#ifdef ISP2401
-	/*
-	 * When the input system is 2401, always enable 'in_frameinfo_memory'
-	 * except for the following:
-	 * - Direct Sensor Mode Online Capture
-	 * - Direct Sensor Mode Continuous Capture
-	 * - Buffered Sensor Mode Continuous Capture
-	 */
-	sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
-	buffered_sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR;
-	online = pipe->stream->config.online;
-	continuous = pipe->stream->config.continuous;
-	need_in_frameinfo_memory =
-	!((sensor && (online || continuous)) || (buffered_sensor && continuous));
-#else
-	/* Construct in_frame info (only in case we have dynamic input */
-	need_in_frameinfo_memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
-#endif
+	if (IS_ISP2401) {
+		/*
+		 * When the input system is 2401, always enable 'in_frameinfo_memory'
+		 * except for the following:
+		 * - Direct Sensor Mode Online Capture
+		 * - Direct Sensor Mode Continuous Capture
+		 * - Buffered Sensor Mode Continuous Capture
+		 */
+		sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR;
+		buffered_sensor = pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR;
+		online = pipe->stream->config.online;
+		continuous = pipe->stream->config.continuous;
+		need_in_frameinfo_memory =
+		!((sensor && (online || continuous)) || (buffered_sensor && continuous));
+	} else
+		/* Construct in_frame info (only in case we have dynamic input */
+		need_in_frameinfo_memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
 	/*
 	 * the input frame can come from:
 	 *
@@ -6808,11 +6798,11 @@ create_host_yuvpp_pipeline(struct ia_css_pipe *pipe)
 	if (pipe->pipe_settings.yuvpp.copy_binary.info) {
 		struct ia_css_frame *in_frame_local = NULL;
 
-#ifdef ISP2401
-		/* After isp copy is enabled in_frame needs to be passed. */
-		if (!online)
-			in_frame_local = in_frame;
-#endif
+		if (IS_ISP2401) {
+			/* After isp copy is enabled in_frame needs to be passed. */
+			if (!online)
+				in_frame_local = in_frame;
+		}
 
 		if (need_scaler) {
 			ia_css_pipe_util_set_output_frames(bin_out_frame,
@@ -7031,12 +7021,10 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 	struct ia_css_frame *vf_frame;
 	struct ia_css_pipeline_stage_desc stage_desc;
 	bool need_in_frameinfo_memory = false;
-#ifdef ISP2401
 	bool sensor = false;
 	bool buffered_sensor = false;
 	bool online = false;
 	bool continuous = false;
-#endif
 	unsigned int i, num_yuv_scaler, num_primary_stage;
 	bool need_yuv_pp = false;
 	bool *is_output_stage = NULL;
@@ -7054,25 +7042,26 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 	ia_css_pipeline_clean(me);
 	ia_css_pipe_util_create_output_frames(out_frames);
 
-#ifdef ISP2401
-	/*
-	 * When the input system is 2401, always enable 'in_frameinfo_memory'
-	 * except for the following:
-	 * - Direct Sensor Mode Online Capture
-	 * - Direct Sensor Mode Online Capture
-	 * - Direct Sensor Mode Continuous Capture
-	 * - Buffered Sensor Mode Continuous Capture
-	 */
-	sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
-	buffered_sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
-	online = pipe->stream->config.online;
-	continuous = pipe->stream->config.continuous;
-	need_in_frameinfo_memory =
-	!((sensor && (online || continuous)) || (buffered_sensor && (online || continuous)));
-#else
-	/* Construct in_frame info (only in case we have dynamic input */
-	need_in_frameinfo_memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
-#endif
+	if (IS_ISP2401) {
+		/*
+		 * When the input system is 2401, always enable 'in_frameinfo_memory'
+		 * except for the following:
+		 * - Direct Sensor Mode Online Capture
+		 * - Direct Sensor Mode Online Capture
+		 * - Direct Sensor Mode Continuous Capture
+		 * - Buffered Sensor Mode Continuous Capture
+		 */
+		sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_SENSOR);
+		buffered_sensor = (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR);
+		online = pipe->stream->config.online;
+		continuous = pipe->stream->config.continuous;
+		need_in_frameinfo_memory =
+		!((sensor && (online || continuous)) || (buffered_sensor &&
+							(online || continuous)));
+	} else
+		/* Construct in_frame info (only in case we have dynamic input */
+		need_in_frameinfo_memory = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
+
 	if (need_in_frameinfo_memory) {
 		err = init_in_frameinfo_memory_defaults(pipe, &me->in_frame,
 							IA_CSS_FRAME_FORMAT_RAW);
@@ -7135,27 +7124,27 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 	if (pipe->pipe_settings.capture.copy_binary.info) {
 		if (raw) {
 			ia_css_pipe_util_set_output_frames(out_frames, 0, out_frame);
-#if defined(ISP2401)
-			if (!continuous) {
-				ia_css_pipe_get_generic_stage_desc(&stage_desc,
-								   copy_binary,
-								   out_frames,
-								   in_frame,
-								   NULL);
+			if (IS_ISP2401) {
+				if (!continuous) {
+					ia_css_pipe_get_generic_stage_desc(&stage_desc,
+									   copy_binary,
+									   out_frames,
+									   in_frame,
+									   NULL);
+				} else {
+					in_frame = pipe->stream->last_pipe->continuous_frames[0];
+					ia_css_pipe_get_generic_stage_desc(&stage_desc,
+									   copy_binary,
+									   out_frames,
+									   in_frame,
+									   NULL);
+				}
 			} else {
-				in_frame = pipe->stream->last_pipe->continuous_frames[0];
 				ia_css_pipe_get_generic_stage_desc(&stage_desc,
 								   copy_binary,
 								   out_frames,
-								   in_frame,
-								   NULL);
+								   NULL, NULL);
 			}
-#else
-			ia_css_pipe_get_generic_stage_desc(&stage_desc,
-							   copy_binary,
-							   out_frames,
-							   NULL, NULL);
-#endif
 		} else {
 			ia_css_pipe_util_set_output_frames(out_frames, 0,
 							   in_frame);
@@ -7185,14 +7174,17 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 				local_in_frame = in_frame;
 			else
 				local_in_frame = NULL;
-#ifndef ISP2401
-			if (!need_pp && (i == num_primary_stage - 1))
-#else
-			if (!need_pp && (i == num_primary_stage - 1) && !need_ldc)
-#endif
-				local_out_frame = out_frame;
-			else
+
+			if (!need_pp && (i == num_primary_stage - 1)) {
+				if (IS_ISP2401) {
+					if (!need_ldc)
+						local_out_frame = out_frame;
+				} else {
+					local_out_frame = out_frame;
+				}
+			} else {
 				local_out_frame = NULL;
+			}
 			ia_css_pipe_util_set_output_frames(out_frames, 0, local_out_frame);
 			/*
 			 * WARNING: The #if def flag has been added below as a
@@ -7401,22 +7393,22 @@ static int capture_start(struct ia_css_pipe *pipe)
 		}
 	}
 
-#if !defined(ISP2401)
-	/* old isys: need to send_mipi_frames() in all pipe modes */
-	err = send_mipi_frames(pipe);
-	if (err) {
-		IA_CSS_LEAVE_ERR_PRIVATE(err);
-		return err;
-	}
-#else
-	if (pipe->config.mode != IA_CSS_PIPE_MODE_COPY) {
+	if (IS_ISP2401) {
+		if (pipe->config.mode != IA_CSS_PIPE_MODE_COPY) {
+			err = send_mipi_frames(pipe);
+			if (err) {
+				IA_CSS_LEAVE_ERR_PRIVATE(err);
+				return err;
+			}
+		}
+	} else {
+		/* old isys: need to send_mipi_frames() in all pipe modes */
 		err = send_mipi_frames(pipe);
 		if (err) {
 			IA_CSS_LEAVE_ERR_PRIVATE(err);
 			return err;
 		}
 	}
-#endif
 
 	ia_css_pipeline_get_sp_thread_id(ia_css_pipe_get_pipe_num(pipe), &thread_id);
 	copy_ovrd = 1 << thread_id;
@@ -8123,24 +8115,22 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 		return err;
 	}
 
-#if !defined(ISP2401)
-	/* We don't support metadata for JPEG stream, since they both use str2mem */
-	if (stream_config->input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8 &&
-	    stream_config->metadata_config.resolution.height > 0) {
-		err = -EINVAL;
-		IA_CSS_LEAVE_ERR(err);
-		return err;
-	}
-#endif
-
-#ifdef ISP2401
-	if (stream_config->online && stream_config->pack_raw_pixels) {
-		IA_CSS_LOG("online and pack raw is invalid on input system 2401");
-		err = -EINVAL;
-		IA_CSS_LEAVE_ERR(err);
-		return err;
+	if (!IS_ISP2401) {
+		/* We don't support metadata for JPEG stream, since they both use str2mem */
+		if (stream_config->input_config.format == ATOMISP_INPUT_FORMAT_BINARY_8 &&
+		    stream_config->metadata_config.resolution.height > 0) {
+			err = -EINVAL;
+			IA_CSS_LEAVE_ERR(err);
+			return err;
+		}
+	} else {
+		if (stream_config->online && stream_config->pack_raw_pixels) {
+			IA_CSS_LOG("online and pack raw is invalid on input system 2401");
+			err = -EINVAL;
+			IA_CSS_LEAVE_ERR(err);
+			return err;
+		}
 	}
-#endif
 
 	ia_css_debug_pipe_graph_dump_stream_config(stream_config);
 
@@ -8223,19 +8213,17 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 	/* take over stream config */
 	curr_stream->config = *stream_config;
 
-#if defined(ISP2401)
-	if (stream_config->mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR &&
-	    stream_config->online)
-		curr_stream->config.online = false;
-#endif
+	if (IS_ISP2401) {
+		if (stream_config->mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR &&
+		    stream_config->online)
+			curr_stream->config.online = false;
 
-#ifdef ISP2401
-	if (curr_stream->config.online) {
-		curr_stream->config.source.port.num_lanes =
-		    stream_config->source.port.num_lanes;
-		curr_stream->config.mode =  IA_CSS_INPUT_MODE_BUFFERED_SENSOR;
+		if (curr_stream->config.online) {
+			curr_stream->config.source.port.num_lanes =
+			    stream_config->source.port.num_lanes;
+			curr_stream->config.mode =  IA_CSS_INPUT_MODE_BUFFERED_SENSOR;
+		}
 	}
-#endif
 	/* in case driver doesn't configure init number of raw buffers, configure it here */
 	if (curr_stream->config.target_num_cont_raw_buf == 0)
 		curr_stream->config.target_num_cont_raw_buf = NUM_CONTINUOUS_FRAMES;
@@ -8665,6 +8653,7 @@ ia_css_stream_start(struct ia_css_stream *stream)
 		for (idx = 0; idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT; idx++) {
 			sh_css_sp_group.config.mipi_sizes_for_check[port][idx] =
 			sh_css_get_mipi_sizes_for_check(port, idx);
+
 		}
 	}
 #endif
@@ -9162,11 +9151,10 @@ void ia_css_pipe_map_queue(struct ia_css_pipe *pipe, bool map)
 
 	ia_css_pipeline_get_sp_thread_id(pipe_num, &thread_id);
 
-#if defined(ISP2401)
-	need_input_queue = true;
-#else
-	need_input_queue = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
-#endif
+	if (IS_ISP2401)
+		need_input_queue = true;
+	else
+		need_input_queue = pipe->stream->config.mode == IA_CSS_INPUT_MODE_MEMORY;
 
 	/* map required buffer queues to resources */
 	/* TODO: to be improved */
-- 
2.39.2

