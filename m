Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F27370169B
	for <lists+linux-media@lfdr.de>; Sat, 13 May 2023 14:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238294AbjEMMdi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 May 2023 08:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbjEMMdh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 May 2023 08:33:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B258935A1
        for <linux-media@vger.kernel.org>; Sat, 13 May 2023 05:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683981138;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l6mf5pF3oQ4JtsHXR/E9KEfAQH5lZR7b8yC6r1neAbc=;
        b=IUlCjyKEQQFu77uSnHAbkMj+Vub+0DdR6CzRllGTVbO34tBcpN7Yjm+6zjLxerkH8ItbwS
        T39JJNI7pJsprqFNEmVyW4wycNZm+YFYfbmDNlwI9R7SNMcFZJ0POyRoPv1o9RmQeBC4Qc
        9IoHaaRowMIetJhciiqicrUnKI4M8S4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-_S6M9l-vO7O8GPy5oGn3HQ-1; Sat, 13 May 2023 08:32:13 -0400
X-MC-Unique: _S6M9l-vO7O8GPy5oGn3HQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB14229AA3B0;
        Sat, 13 May 2023 12:32:12 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4770040C2076;
        Sat, 13 May 2023 12:32:11 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Kate Hsuan <hpa@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 06/30] media: atomisp: Register only 1 /dev/video# node
Date:   Sat, 13 May 2023 14:31:35 +0200
Message-Id: <20230513123159.33234-7-hdegoede@redhat.com>
In-Reply-To: <20230513123159.33234-1-hdegoede@redhat.com>
References: <20230513123159.33234-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we no longer support continuous mode and thus no longer support
streaming from 2 /dev/video# nodes at the same time, there is no need
to have a separate /dev/video# node (+ matching v4l2-subdev pads)
for each run-mode.

Keep the video_out_preview /dev/video0 device and remove
the video_out_video_capture / video_out_video_vf / video_out_capture
video-devices (atomisp_pipe-s) and also remove the matching
ATOMISP_SUBDEV_PAD_SOURCE_VIDEO / ATOMISP_SUBDEV_PAD_SOURCE_VF /
ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE source-pads.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../staging/media/atomisp/pci/atomisp_cmd.c   |  44 ++------
 .../media/atomisp/pci/atomisp_compat_css20.c  |   3 -
 .../staging/media/atomisp/pci/atomisp_fops.c  |  92 +++-------------
 .../staging/media/atomisp/pci/atomisp_ioctl.c |   5 +-
 .../media/atomisp/pci/atomisp_subdev.c        | 102 +-----------------
 .../media/atomisp/pci/atomisp_subdev.h        |  15 +--
 6 files changed, 30 insertions(+), 231 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 710e97a492c6..faaa4f1c5c7c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -643,10 +643,7 @@ void atomisp_flush_video_pipe(struct atomisp_video_pipe *pipe, enum vb2_buffer_s
 /* Returns queued buffers back to video-core */
 void atomisp_flush_bufs_and_wakeup(struct atomisp_sub_device *asd)
 {
-	atomisp_flush_video_pipe(&asd->video_out_capture, VB2_BUF_STATE_ERROR, false);
-	atomisp_flush_video_pipe(&asd->video_out_vf, VB2_BUF_STATE_ERROR, false);
 	atomisp_flush_video_pipe(&asd->video_out_preview, VB2_BUF_STATE_ERROR, false);
-	atomisp_flush_video_pipe(&asd->video_out_video_capture, VB2_BUF_STATE_ERROR, false);
 }
 
 /* clean out the parameters that did not apply */
@@ -1035,9 +1032,7 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 		atomisp_flush_bufs_and_wakeup(&isp->asd);
 
 		/* Requeue unprocessed per-frame parameters. */
-		atomisp_recover_params_queue(&isp->asd.video_out_capture);
 		atomisp_recover_params_queue(&isp->asd.video_out_preview);
-		atomisp_recover_params_queue(&isp->asd.video_out_video_capture);
 
 		ret = v4l2_subdev_call(
 			  isp->inputs[isp->asd.input_curr].camera, video,
@@ -1298,7 +1293,7 @@ static void atomisp_update_capture_mode(struct atomisp_sub_device *asd)
 		atomisp_css_capture_set_mode(asd, IA_CSS_CAPTURE_MODE_ADVANCED);
 	else if (asd->params.low_light)
 		atomisp_css_capture_set_mode(asd, IA_CSS_CAPTURE_MODE_LOW_LIGHT);
-	else if (asd->video_out_capture.sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
+	else if (asd->video_out_preview.sh_fmt == IA_CSS_FRAME_FORMAT_RAW)
 		atomisp_css_capture_set_mode(asd, IA_CSS_CAPTURE_MODE_RAW);
 	else
 		atomisp_css_capture_set_mode(asd, IA_CSS_CAPTURE_MODE_PRIMARY);
@@ -4191,40 +4186,24 @@ static int atomisp_set_fmt_to_isp(struct video_device *vdev,
 	 * CSS still requires viewfinder configuration.
 	 */
 	{
-		struct v4l2_rect vf_size = {0};
-		struct v4l2_mbus_framefmt vf_ffmt = {0};
+		u32 width, height;
 
 		if (pix->width < 640 || pix->height < 480) {
-			vf_size.width = pix->width;
-			vf_size.height = pix->height;
+			width = pix->width;
+			height = pix->height;
 		} else {
-			vf_size.width = 640;
-			vf_size.height = 480;
+			width = 640;
+			height = 480;
 		}
 
-		/* FIXME: proper format name for this one. See
-		   atomisp_output_fmts[] in atomisp_v4l2.c */
-		vf_ffmt.code = V4L2_MBUS_FMT_CUSTOM_YUV420;
-
-		atomisp_subdev_set_selection(&asd->subdev, fh.state,
-					     V4L2_SUBDEV_FORMAT_ACTIVE,
-					     ATOMISP_SUBDEV_PAD_SOURCE_VF,
-					     V4L2_SEL_TGT_COMPOSE, 0, &vf_size);
-		atomisp_subdev_set_ffmt(&asd->subdev, fh.state,
-					V4L2_SUBDEV_FORMAT_ACTIVE,
-					ATOMISP_SUBDEV_PAD_SOURCE_VF, &vf_ffmt);
-		asd->video_out_vf.sh_fmt = IA_CSS_FRAME_FORMAT_NV12;
-
 		if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO ||
 		    asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER) {
-			atomisp_css_video_configure_viewfinder(asd,
-							       vf_size.width, vf_size.height, 0,
-							       asd->video_out_vf.sh_fmt);
+			atomisp_css_video_configure_viewfinder(asd, width, height, 0,
+							       IA_CSS_FRAME_FORMAT_NV12);
 		} else if (asd->run_mode->val == ATOMISP_RUN_MODE_STILL_CAPTURE ||
 			   asd->vfpp->val == ATOMISP_VFPP_DISABLE_LOWLAT) {
-			atomisp_css_capture_configure_viewfinder(asd,
-				vf_size.width, vf_size.height, 0,
-				asd->video_out_vf.sh_fmt);
+			atomisp_css_capture_configure_viewfinder(asd, width, height, 0,
+								 IA_CSS_FRAME_FORMAT_NV12);
 		}
 	}
 
@@ -4811,9 +4790,6 @@ bool atomisp_is_vf_pipe(struct atomisp_video_pipe *pipe)
 		return false;
 	}
 
-	if (pipe == &asd->video_out_vf)
-		return true;
-
 	if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO &&
 	    pipe == &asd->video_out_preview)
 		return true;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index dfed7f1fbf6b..8e8caa99ce72 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1958,10 +1958,7 @@ void atomisp_css_stop(struct atomisp_sub_device *asd,
 		list_splice_init(&asd->metadata_ready[i], &asd->metadata[i]);
 	}
 
-	atomisp_flush_params_queue(&asd->video_out_capture);
-	atomisp_flush_params_queue(&asd->video_out_vf);
 	atomisp_flush_params_queue(&asd->video_out_preview);
-	atomisp_flush_params_queue(&asd->video_out_video_capture);
 	atomisp_free_css_parameters(&asd->params.css_param);
 	memset(&asd->params.css_param, 0, sizeof(asd->params.css_param));
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 143ab78b003b..3adeeb97e570 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -345,89 +345,26 @@ static int atomisp_q_video_buffers_to_css(struct atomisp_sub_device *asd,
 /* queue all available buffers to css */
 int atomisp_qbuffers_to_css(struct atomisp_sub_device *asd)
 {
-	const enum ia_css_buffer_type buf_type = IA_CSS_BUFFER_TYPE_OUTPUT_FRAME;
-	enum ia_css_pipe_id css_capture_pipe_id = IA_CSS_PIPE_ID_NUM;
-	enum ia_css_pipe_id css_preview_pipe_id = IA_CSS_PIPE_ID_NUM;
-	enum ia_css_pipe_id css_video_pipe_id = IA_CSS_PIPE_ID_NUM;
-	enum atomisp_input_stream_id input_stream_id;
-	struct atomisp_video_pipe *capture_pipe = NULL;
-	struct atomisp_video_pipe *vf_pipe = NULL;
-	struct atomisp_video_pipe *preview_pipe = NULL;
-	struct atomisp_video_pipe *video_pipe = NULL;
-	bool raw_mode = atomisp_is_mbuscode_raw(
-			    asd->fmt[asd->capture_pad].fmt.code);
+	enum ia_css_pipe_id pipe_id;
 
-	if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER) {
-		video_pipe = &asd->video_out_video_capture;
-		css_video_pipe_id = IA_CSS_PIPE_ID_VIDEO;
+	if (asd->copy_mode) {
+		pipe_id = IA_CSS_PIPE_ID_COPY;
+	} else if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_SCALER) {
+		pipe_id = IA_CSS_PIPE_ID_VIDEO;
 	} else if (asd->vfpp->val == ATOMISP_VFPP_DISABLE_LOWLAT) {
-		preview_pipe = &asd->video_out_capture;
-		css_preview_pipe_id = IA_CSS_PIPE_ID_CAPTURE;
+		pipe_id = IA_CSS_PIPE_ID_CAPTURE;
 	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_VIDEO) {
-		video_pipe = &asd->video_out_video_capture;
-		preview_pipe = &asd->video_out_preview;
-		css_video_pipe_id = IA_CSS_PIPE_ID_VIDEO;
-		css_preview_pipe_id = IA_CSS_PIPE_ID_VIDEO;
+		pipe_id = IA_CSS_PIPE_ID_VIDEO;
 	} else if (asd->run_mode->val == ATOMISP_RUN_MODE_PREVIEW) {
-		preview_pipe = &asd->video_out_preview;
-		css_preview_pipe_id = IA_CSS_PIPE_ID_PREVIEW;
+		pipe_id = IA_CSS_PIPE_ID_PREVIEW;
 	} else {
 		/* ATOMISP_RUN_MODE_STILL_CAPTURE */
-		capture_pipe = &asd->video_out_capture;
-		if (!raw_mode)
-			vf_pipe = &asd->video_out_vf;
-		css_capture_pipe_id = IA_CSS_PIPE_ID_CAPTURE;
-	}
-
-	if (IS_ISP2401 && asd->copy_mode) {
-		css_capture_pipe_id = IA_CSS_PIPE_ID_COPY;
-		css_preview_pipe_id = IA_CSS_PIPE_ID_COPY;
-		css_video_pipe_id = IA_CSS_PIPE_ID_COPY;
-	}
-
-	if (capture_pipe) {
-		input_stream_id = ATOMISP_INPUT_STREAM_GENERAL;
-
-		atomisp_q_video_buffers_to_css(asd, capture_pipe,
-					       input_stream_id,
-					       buf_type, css_capture_pipe_id);
-	}
-
-	if (vf_pipe) {
-		if (asd->stream_env[ATOMISP_INPUT_STREAM_POSTVIEW].stream)
-			input_stream_id = ATOMISP_INPUT_STREAM_POSTVIEW;
-		else
-			input_stream_id = ATOMISP_INPUT_STREAM_GENERAL;
-
-		atomisp_q_video_buffers_to_css(asd, vf_pipe,
-					       input_stream_id,
-					       buf_type, css_capture_pipe_id);
-	}
-
-	if (preview_pipe) {
-		if (css_preview_pipe_id == IA_CSS_PIPE_ID_YUVPP)
-			input_stream_id = ATOMISP_INPUT_STREAM_VIDEO;
-		else if (asd->stream_env[ATOMISP_INPUT_STREAM_PREVIEW].stream)
-			input_stream_id = ATOMISP_INPUT_STREAM_PREVIEW;
-		else
-			input_stream_id = ATOMISP_INPUT_STREAM_GENERAL;
-
-		atomisp_q_video_buffers_to_css(asd, preview_pipe,
-					       input_stream_id,
-					       buf_type, css_preview_pipe_id);
-	}
-
-	if (video_pipe) {
-		if (asd->stream_env[ATOMISP_INPUT_STREAM_VIDEO].stream)
-			input_stream_id = ATOMISP_INPUT_STREAM_VIDEO;
-		else
-			input_stream_id = ATOMISP_INPUT_STREAM_GENERAL;
-
-		atomisp_q_video_buffers_to_css(asd, video_pipe,
-					       input_stream_id,
-					       buf_type, css_video_pipe_id);
+		pipe_id = IA_CSS_PIPE_ID_CAPTURE;
 	}
 
+	atomisp_q_video_buffers_to_css(asd, &asd->video_out_preview,
+				       ATOMISP_INPUT_STREAM_GENERAL,
+				       IA_CSS_BUFFER_TYPE_OUTPUT_FRAME, pipe_id);
 	return 0;
 }
 
@@ -558,10 +495,7 @@ static void atomisp_subdev_init_struct(struct atomisp_sub_device *asd)
  */
 static unsigned int atomisp_subdev_users(struct atomisp_sub_device *asd)
 {
-	return asd->video_out_preview.users +
-	       asd->video_out_vf.users +
-	       asd->video_out_capture.users +
-	       asd->video_out_video_capture.users;
+	return asd->video_out_preview.users;
 }
 
 unsigned int atomisp_dev_users(struct atomisp_device *isp)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 7f031db28476..392c0ed56fb4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -618,10 +618,7 @@ static int atomisp_enum_input(struct file *file, void *fh,
 static unsigned int
 atomisp_subdev_streaming_count(struct atomisp_sub_device *asd)
 {
-	return vb2_start_streaming_called(&asd->video_out_preview.vb_queue) +
-	       vb2_start_streaming_called(&asd->video_out_capture.vb_queue) +
-	       vb2_start_streaming_called(&asd->video_out_video_capture.vb_queue) +
-	       vb2_start_streaming_called(&asd->video_out_vf.vb_queue);
+	return vb2_start_streaming_called(&asd->video_out_preview.vb_queue);
 }
 
 unsigned int atomisp_streaming_count(struct atomisp_device *isp)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index ae57aef377b4..d510fdd8389c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -355,10 +355,7 @@ static const char *atomisp_pad_str(unsigned int pad)
 {
 	static const char *const pad_str[] = {
 		"ATOMISP_SUBDEV_PAD_SINK",
-		"ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE",
-		"ATOMISP_SUBDEV_PAD_SOURCE_VF",
 		"ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW",
-		"ATOMISP_SUBDEV_PAD_SOURCE_VIDEO",
 	};
 
 	if (pad >= ARRAY_SIZE(pad_str))
@@ -376,7 +373,6 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *ffmt[ATOMISP_SUBDEV_PADS_NUM];
 	struct v4l2_rect *crop[ATOMISP_SUBDEV_PADS_NUM],
 		       *comp[ATOMISP_SUBDEV_PADS_NUM];
-	unsigned int i;
 	unsigned int padding_w = pad_w;
 	unsigned int padding_h = pad_h;
 
@@ -432,15 +428,11 @@ int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 		crop[pad]->height = min(crop[pad]->height, r->height);
 
 		if (!(flags & V4L2_SEL_FLAG_KEEP_CONFIG)) {
-			for (i = ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE;
-			     i < ATOMISP_SUBDEV_PADS_NUM; i++) {
-				struct v4l2_rect tmp = *crop[pad];
+			struct v4l2_rect tmp = *crop[pad];
 
-				atomisp_subdev_set_selection(
-				    sd, sd_state, which, i,
-				    V4L2_SEL_TGT_COMPOSE,
-				    flags, &tmp);
-			}
+			atomisp_subdev_set_selection(sd, sd_state, which,
+						     ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW,
+						     V4L2_SEL_TGT_COMPOSE, flags, &tmp);
 		}
 
 		if (which == V4L2_SUBDEV_FORMAT_TRY)
@@ -601,10 +593,7 @@ void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 
 		break;
 	}
-	case ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE:
 	case ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW:
-	case ATOMISP_SUBDEV_PAD_SOURCE_VF:
-	case ATOMISP_SUBDEV_PAD_SOURCE_VIDEO:
 		__ffmt->code = ffmt->code;
 		break;
 	}
@@ -912,20 +901,11 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 
 	pads[ATOMISP_SUBDEV_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 	pads[ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW].flags = MEDIA_PAD_FL_SOURCE;
-	pads[ATOMISP_SUBDEV_PAD_SOURCE_VF].flags = MEDIA_PAD_FL_SOURCE;
-	pads[ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE].flags = MEDIA_PAD_FL_SOURCE;
-	pads[ATOMISP_SUBDEV_PAD_SOURCE_VIDEO].flags = MEDIA_PAD_FL_SOURCE;
 
 	asd->fmt[ATOMISP_SUBDEV_PAD_SINK].fmt.code =
 	    MEDIA_BUS_FMT_SBGGR10_1X10;
 	asd->fmt[ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW].fmt.code =
 	    MEDIA_BUS_FMT_SBGGR10_1X10;
-	asd->fmt[ATOMISP_SUBDEV_PAD_SOURCE_VF].fmt.code =
-	    MEDIA_BUS_FMT_SBGGR10_1X10;
-	asd->fmt[ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE].fmt.code =
-	    MEDIA_BUS_FMT_SBGGR10_1X10;
-	asd->fmt[ATOMISP_SUBDEV_PAD_SOURCE_VIDEO].fmt.code =
-	    MEDIA_BUS_FMT_SBGGR10_1X10;
 
 	me->ops = &isp_subdev_media_ops;
 	me->function = MEDIA_ENT_F_PROC_VIDEO_ISP;
@@ -938,41 +918,11 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	if (ret)
 		return ret;
 
-	ret = atomisp_init_subdev_pipe(asd, &asd->video_out_vf,
-				       V4L2_BUF_TYPE_VIDEO_CAPTURE);
-	if (ret)
-		return ret;
-
-	ret = atomisp_init_subdev_pipe(asd, &asd->video_out_capture,
-				       V4L2_BUF_TYPE_VIDEO_CAPTURE);
-	if (ret)
-		return ret;
-
-	ret = atomisp_init_subdev_pipe(asd, &asd->video_out_video_capture,
-				       V4L2_BUF_TYPE_VIDEO_CAPTURE);
-	if (ret)
-		return ret;
-
-	ret = atomisp_video_init(&asd->video_out_capture, "CAPTURE",
-				 ATOMISP_RUN_MODE_STILL_CAPTURE);
-	if (ret < 0)
-		return ret;
-
-	ret = atomisp_video_init(&asd->video_out_vf, "VIEWFINDER",
-				 ATOMISP_RUN_MODE_STILL_CAPTURE);
-	if (ret < 0)
-		return ret;
-
 	ret = atomisp_video_init(&asd->video_out_preview, "PREVIEW",
 				 ATOMISP_RUN_MODE_PREVIEW);
 	if (ret < 0)
 		return ret;
 
-	ret = atomisp_video_init(&asd->video_out_video_capture, "VIDEO",
-				 ATOMISP_RUN_MODE_VIDEO);
-	if (ret < 0)
-		return ret;
-
 	ret = v4l2_ctrl_handler_init(&asd->ctrl_handler, 1);
 	if (ret)
 		return ret;
@@ -1036,21 +986,6 @@ int atomisp_create_pads_links(struct atomisp_device *isp)
 				    &isp->asd.video_out_preview.vdev.entity, 0, 0);
 	if (ret < 0)
 		return ret;
-	ret = media_create_pad_link(&isp->asd.subdev.entity,
-				    ATOMISP_SUBDEV_PAD_SOURCE_VF,
-				    &isp->asd.video_out_vf.vdev.entity, 0, 0);
-	if (ret < 0)
-		return ret;
-	ret = media_create_pad_link(&isp->asd.subdev.entity,
-				    ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE,
-				    &isp->asd.video_out_capture.vdev.entity, 0, 0);
-	if (ret < 0)
-		return ret;
-	ret = media_create_pad_link(&isp->asd.subdev.entity,
-				    ATOMISP_SUBDEV_PAD_SOURCE_VIDEO,
-				    &isp->asd.video_out_video_capture.vdev.entity, 0, 0);
-	if (ret < 0)
-		return ret;
 
 	return 0;
 }
@@ -1081,9 +1016,6 @@ void atomisp_subdev_unregister_entities(struct atomisp_sub_device *asd)
 	atomisp_subdev_cleanup_entities(asd);
 	v4l2_device_unregister_subdev(&asd->subdev);
 	atomisp_video_unregister(&asd->video_out_preview);
-	atomisp_video_unregister(&asd->video_out_vf);
-	atomisp_video_unregister(&asd->video_out_capture);
-	atomisp_video_unregister(&asd->video_out_video_capture);
 }
 
 int atomisp_subdev_register_subdev(struct atomisp_sub_device *asd,
@@ -1097,11 +1029,6 @@ int atomisp_subdev_register_video_nodes(struct atomisp_sub_device *asd,
 {
 	int ret;
 
-	/*
-	 * FIXME: check if all device caps are properly initialized.
-	 * Should any of those use V4L2_CAP_META_CAPTURE? Probably yes.
-	 */
-
 	asd->video_out_preview.vdev.v4l2_dev = vdev;
 	asd->video_out_preview.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
 	ret = video_register_device(&asd->video_out_preview.vdev,
@@ -1109,27 +1036,6 @@ int atomisp_subdev_register_video_nodes(struct atomisp_sub_device *asd,
 	if (ret < 0)
 		goto error;
 
-	asd->video_out_capture.vdev.v4l2_dev = vdev;
-	asd->video_out_capture.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-	ret = video_register_device(&asd->video_out_capture.vdev,
-				    VFL_TYPE_VIDEO, -1);
-	if (ret < 0)
-		goto error;
-
-	asd->video_out_vf.vdev.v4l2_dev = vdev;
-	asd->video_out_vf.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-	ret = video_register_device(&asd->video_out_vf.vdev,
-				    VFL_TYPE_VIDEO, -1);
-	if (ret < 0)
-		goto error;
-
-	asd->video_out_video_capture.vdev.v4l2_dev = vdev;
-	asd->video_out_video_capture.vdev.device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING;
-	ret = video_register_device(&asd->video_out_video_capture.vdev,
-				    VFL_TYPE_VIDEO, -1);
-	if (ret < 0)
-		goto error;
-
 	return 0;
 
 error:
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index fee663bc415a..2be594a8e733 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -32,15 +32,8 @@
 #define ATOMISP_MAX_EXP_ID     (250)
 
 #define ATOMISP_SUBDEV_PAD_SINK			0
-/* capture output for still frames */
-#define ATOMISP_SUBDEV_PAD_SOURCE_CAPTURE	1
-/* viewfinder output for downscaled capture output */
-#define ATOMISP_SUBDEV_PAD_SOURCE_VF		2
-/* preview output for display */
-#define ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW	3
-/* main output for video pipeline */
-#define ATOMISP_SUBDEV_PAD_SOURCE_VIDEO	4
-#define ATOMISP_SUBDEV_PADS_NUM			5
+#define ATOMISP_SUBDEV_PAD_SOURCE_PREVIEW	1
+#define ATOMISP_SUBDEV_PADS_NUM			2
 
 struct atomisp_in_fmt_conv {
 	u32     code;
@@ -251,11 +244,7 @@ struct atomisp_sub_device {
 	u16 capture_pad; /* main capture pad; defines much of isp config */
 
 	unsigned int output;
-	struct atomisp_video_pipe video_out_capture; /* capture output */
-	struct atomisp_video_pipe video_out_vf;      /* viewfinder output */
 	struct atomisp_video_pipe video_out_preview; /* preview output */
-	/* video pipe main output */
-	struct atomisp_video_pipe video_out_video_capture;
 	/* struct isp_subdev_params params; */
 	struct atomisp_device *isp;
 	struct v4l2_ctrl_handler ctrl_handler;
-- 
2.40.1

