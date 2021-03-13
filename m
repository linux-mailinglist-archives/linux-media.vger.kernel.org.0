Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1EF2339E9C
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234060AbhCMOnv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:43:51 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:39887 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234027AbhCMOna (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:43:30 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L5UBljyoWC40pL5UHlV5du; Sat, 13 Mar 2021 15:43:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615646609; bh=5lh8UlrGuZur8aSXMkUT5J4qg/w3bG+Jd8ePEczq+jg=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=m8md+8mlZqzE2kZfDLprd0OekA/ue6t9lSRN18Qmvsw46EQoSl3WYXc1YlWIYGSyD
         GuryXtFFV9T6N9tcEKmm71Q2i7gLY+Nig2fsGXc91iBIJIZp6bcfnNl0vrk8j1zgob
         sveI0EkiVuzvfA0jvotKm7H+EljzOwfpb5Kwh2PVVPUv3R7dT337qg0d8pScjjF9Yn
         E20gAC0BUlYtMNVLxZz1WvMJwWaCW+As14Px1CHPwyXzGd36LQBDiBD4s7LWOPro2U
         gukIhX+9Xh6lL0sJxexP5HAEHHMPHCaL7uD3j4h8F32h2M0BQ2Dp4bdOFGEyOuVlAy
         ecuUD/VASQaDw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 07/15] media/pci: rename MPEG to CODEC
Date:   Sat, 13 Mar 2021 15:43:15 +0100
Message-Id: <20210313144323.143600-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
References: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfHB20MmtF5ZcYetgXeMEMm916KOLGm4CPZp4loUBMb4p735IcJ67kybPCw6oLhk36CkLiIbYkSy/XTsGdBZMReFwjEZwC922p9K7bU4wslAFdYlR5M7M
 dSkvAl5oCD5Eps37hYkSc/INvgFdyL4ayp75pW0RWxRN/Z/GeWD0y44I5Z6D3gjTM1DNgK8JVcV1YCXHdjsBOf8B04vYoJ0zC1OJxDZyC37ES+VumK3BGuT/
 ltuj5UhuoVVT+uDCgWcfNEMHd0uyQkpT4M6455DHwYFyIuqnsgELwMnEsa2IXyDbrGlTq7uUo+FzIbApU+9/N4hUTW8pPXf5/TpnS5hxCbmTwr1qpBizIMEK
 jFUhB5vxbxvJ6+r+NOgJr8jCvLWy1g==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Historically all codec-related data structures and defines used the
MPEG prefix. This is confusing. Rename MPEG to CODEC to make it clear
that the MPEG prefix isn't MPEG specific.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/cx18/cx18-controls.c        | 14 ++---
 drivers/media/pci/ivtv/ivtv-controls.c        | 10 ++--
 drivers/media/pci/ivtv/ivtv-driver.c          | 22 ++++----
 drivers/media/pci/ivtv/ivtv-ioctl.c           |  4 +-
 drivers/media/pci/saa7164/saa7164-api.c       | 12 ++---
 drivers/media/pci/saa7164/saa7164-core.c      |  4 +-
 drivers/media/pci/saa7164/saa7164-encoder.c   | 52 +++++++++----------
 drivers/media/pci/saa7164/saa7164.h           |  4 +-
 .../media/pci/solo6x10/solo6x10-v4l2-enc.c    |  8 +--
 drivers/media/pci/tw5864/tw5864-video.c       |  8 +--
 10 files changed, 69 insertions(+), 69 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-controls.c b/drivers/media/pci/cx18/cx18-controls.c
index bb5fc120473c..71d319bd23b4 100644
--- a/drivers/media/pci/cx18/cx18-controls.c
+++ b/drivers/media/pci/cx18/cx18-controls.c
@@ -24,12 +24,12 @@ static int cx18_s_stream_vbi_fmt(struct cx2341x_handler *cxhdl, u32 fmt)
 	if (atomic_read(&cx->ana_capturing) > 0)
 		return -EBUSY;
 
-	if (fmt != V4L2_MPEG_STREAM_VBI_FMT_IVTV ||
-	    !(type == V4L2_MPEG_STREAM_TYPE_MPEG2_PS ||
-	      type == V4L2_MPEG_STREAM_TYPE_MPEG2_DVD ||
-	      type == V4L2_MPEG_STREAM_TYPE_MPEG2_SVCD)) {
+	if (fmt != V4L2_CODEC_STREAM_VBI_FMT_IVTV ||
+	    !(type == V4L2_CODEC_STREAM_TYPE_MPEG2_PS ||
+	      type == V4L2_CODEC_STREAM_TYPE_MPEG2_DVD ||
+	      type == V4L2_CODEC_STREAM_TYPE_MPEG2_SVCD)) {
 		/* Only IVTV fmt VBI insertion & only MPEG-2 PS type streams */
-		cx->vbi.insert_mpeg = V4L2_MPEG_STREAM_VBI_FMT_NONE;
+		cx->vbi.insert_mpeg = V4L2_CODEC_STREAM_VBI_FMT_NONE;
 		CX18_DEBUG_INFO("disabled insertion of sliced VBI data into the MPEG stream\n");
 		return 0;
 	}
@@ -47,7 +47,7 @@ static int cx18_s_stream_vbi_fmt(struct cx2341x_handler *cxhdl, u32 fmt)
 					cx->vbi.sliced_mpeg_data[i] = NULL;
 				}
 				cx->vbi.insert_mpeg =
-						  V4L2_MPEG_STREAM_VBI_FMT_NONE;
+						  V4L2_CODEC_STREAM_VBI_FMT_NONE;
 				CX18_WARN("Unable to allocate buffers for sliced VBI data insertion\n");
 				return -ENOMEM;
 			}
@@ -75,7 +75,7 @@ static int cx18_s_stream_vbi_fmt(struct cx2341x_handler *cxhdl, u32 fmt)
 static int cx18_s_video_encoding(struct cx2341x_handler *cxhdl, u32 val)
 {
 	struct cx18 *cx = container_of(cxhdl, struct cx18, cxhdl);
-	int is_mpeg1 = val == V4L2_MPEG_VIDEO_ENCODING_MPEG_1;
+	int is_mpeg1 = val == V4L2_CODEC_VIDEO_ENCODING_MPEG_1;
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
diff --git a/drivers/media/pci/ivtv/ivtv-controls.c b/drivers/media/pci/ivtv/ivtv-controls.c
index a0b9a5a5c7f1..684afe4f34a4 100644
--- a/drivers/media/pci/ivtv/ivtv-controls.c
+++ b/drivers/media/pci/ivtv/ivtv-controls.c
@@ -51,7 +51,7 @@ static int ivtv_s_stream_vbi_fmt(struct cx2341x_handler *cxhdl, u32 fmt)
 static int ivtv_s_video_encoding(struct cx2341x_handler *cxhdl, u32 val)
 {
 	struct ivtv *itv = container_of(cxhdl, struct ivtv, cxhdl);
-	int is_mpeg1 = val == V4L2_MPEG_VIDEO_ENCODING_MPEG_1;
+	int is_mpeg1 = val == V4L2_CODEC_VIDEO_ENCODING_MPEG_1;
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
@@ -122,9 +122,9 @@ static int ivtv_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 	struct ivtv *itv = container_of(ctrl->handler, struct ivtv, cxhdl.hdl);
 
 	switch (ctrl->id) {
-	/* V4L2_CID_MPEG_VIDEO_DEC_PTS and V4L2_CID_MPEG_VIDEO_DEC_FRAME
+	/* V4L2_CID_CODEC_VIDEO_DEC_PTS and V4L2_CID_CODEC_VIDEO_DEC_FRAME
 	   control cluster */
-	case V4L2_CID_MPEG_VIDEO_DEC_PTS:
+	case V4L2_CID_CODEC_VIDEO_DEC_PTS:
 		return ivtv_g_pts_frame(itv, itv->ctrl_pts->p_new.p_s64,
 					     itv->ctrl_frame->p_new.p_s64);
 	}
@@ -136,9 +136,9 @@ static int ivtv_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct ivtv *itv = container_of(ctrl->handler, struct ivtv, cxhdl.hdl);
 
 	switch (ctrl->id) {
-	/* V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK and MULTILINGUAL_PLAYBACK
+	/* V4L2_CID_CODEC_AUDIO_DEC_PLAYBACK and MULTILINGUAL_PLAYBACK
 	   control cluster */
-	case V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK:
+	case V4L2_CID_CODEC_AUDIO_DEC_PLAYBACK:
 		itv->audio_stereo_mode = itv->ctrl_audio_playback->val - 1;
 		itv->audio_bilingual_mode = itv->ctrl_audio_multilingual_playback->val - 1;
 		ivtv_vapi(itv, CX2341X_DEC_SET_AUDIO_MODE, 2, itv->audio_bilingual_mode, itv->audio_stereo_mode);
diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
index c4a069b3b9d1..fe19e8f28599 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.c
+++ b/drivers/media/pci/ivtv/ivtv-driver.c
@@ -1216,23 +1216,23 @@ static int ivtv_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 		struct v4l2_ctrl_handler *hdl = itv->v4l2_dev.ctrl_handler;
 
 		itv->ctrl_pts = v4l2_ctrl_new_std(hdl, &ivtv_hdl_out_ops,
-				V4L2_CID_MPEG_VIDEO_DEC_PTS, 0, 0, 0, 0);
+				V4L2_CID_CODEC_VIDEO_DEC_PTS, 0, 0, 0, 0);
 		itv->ctrl_frame = v4l2_ctrl_new_std(hdl, &ivtv_hdl_out_ops,
-				V4L2_CID_MPEG_VIDEO_DEC_FRAME, 0, 0, 0, 0);
-		/* Note: V4L2_MPEG_AUDIO_DEC_PLAYBACK_AUTO is not supported,
+				V4L2_CID_CODEC_VIDEO_DEC_FRAME, 0, 0, 0, 0);
+		/* Note: V4L2_CODEC_AUDIO_DEC_PLAYBACK_AUTO is not supported,
 		   mask that menu item. */
 		itv->ctrl_audio_playback =
 			v4l2_ctrl_new_std_menu(hdl, &ivtv_hdl_out_ops,
-				V4L2_CID_MPEG_AUDIO_DEC_PLAYBACK,
-				V4L2_MPEG_AUDIO_DEC_PLAYBACK_SWAPPED_STEREO,
-				1 << V4L2_MPEG_AUDIO_DEC_PLAYBACK_AUTO,
-				V4L2_MPEG_AUDIO_DEC_PLAYBACK_STEREO);
+				V4L2_CID_CODEC_AUDIO_DEC_PLAYBACK,
+				V4L2_CODEC_AUDIO_DEC_PLAYBACK_SWAPPED_STEREO,
+				1 << V4L2_CODEC_AUDIO_DEC_PLAYBACK_AUTO,
+				V4L2_CODEC_AUDIO_DEC_PLAYBACK_STEREO);
 		itv->ctrl_audio_multilingual_playback =
 			v4l2_ctrl_new_std_menu(hdl, &ivtv_hdl_out_ops,
-				V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK,
-				V4L2_MPEG_AUDIO_DEC_PLAYBACK_SWAPPED_STEREO,
-				1 << V4L2_MPEG_AUDIO_DEC_PLAYBACK_AUTO,
-				V4L2_MPEG_AUDIO_DEC_PLAYBACK_LEFT);
+				V4L2_CID_CODEC_AUDIO_DEC_MULTILINGUAL_PLAYBACK,
+				V4L2_CODEC_AUDIO_DEC_PLAYBACK_SWAPPED_STEREO,
+				1 << V4L2_CODEC_AUDIO_DEC_PLAYBACK_AUTO,
+				V4L2_CODEC_AUDIO_DEC_PLAYBACK_LEFT);
 		if (hdl->error) {
 			retval = hdl->error;
 			goto free_i2c;
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index 35dccb31174c..fc815a175be6 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -591,7 +591,7 @@ static int ivtv_s_fmt_vid_cap(struct file *file, void *fh, struct v4l2_format *f
 
 	itv->cxhdl.width = w;
 	itv->cxhdl.height = h;
-	if (v4l2_ctrl_g_ctrl(itv->cxhdl.video_encoding) == V4L2_MPEG_VIDEO_ENCODING_MPEG_1)
+	if (v4l2_ctrl_g_ctrl(itv->cxhdl.video_encoding) == V4L2_CODEC_VIDEO_ENCODING_MPEG_1)
 		fmt->fmt.pix.width /= 2;
 	format.format.width = fmt->fmt.pix.width;
 	format.format.height = h;
@@ -1517,7 +1517,7 @@ static int ivtv_log_status(struct file *file, void *fh)
 	ivtv_get_audio_input(itv, itv->audio_input, &audin);
 	IVTV_INFO("Video Input:  %s\n", vidin.name);
 	IVTV_INFO("Audio Input:  %s%s\n", audin.name,
-		itv->dualwatch_stereo_mode == V4L2_MPEG_AUDIO_MODE_DUAL ?
+		itv->dualwatch_stereo_mode == V4L2_CODEC_AUDIO_MODE_DUAL ?
 			" (Bilingual)" : "");
 	if (has_output) {
 		struct v4l2_output vidout;
diff --git a/drivers/media/pci/saa7164/saa7164-api.c b/drivers/media/pci/saa7164/saa7164-api.c
index 4ddd0f5b50f1..1a60b228c796 100644
--- a/drivers/media/pci/saa7164/saa7164-api.c
+++ b/drivers/media/pci/saa7164/saa7164-api.c
@@ -180,7 +180,7 @@ int saa7164_api_set_encoder(struct saa7164_port *port)
 	dprintk(DBGLVL_ENC, "%s() unitid=0x%x\n", __func__,
 		port->hwcfg.sourceid);
 
-	if (port->encoder_params.stream_type == V4L2_MPEG_STREAM_TYPE_MPEG2_PS)
+	if (port->encoder_params.stream_type == V4L2_CODEC_STREAM_TYPE_MPEG2_PS)
 		port->encoder_profile = EU_PROFILE_PS_DVD;
 	else
 		port->encoder_profile = EU_PROFILE_TS_HQ;
@@ -198,7 +198,7 @@ int saa7164_api_set_encoder(struct saa7164_port *port)
 
 	/* Establish video bitrates */
 	if (port->encoder_params.bitrate_mode ==
-		V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+		V4L2_CODEC_VIDEO_BITRATE_MODE_CBR)
 		vb.ucVideoBitRateMode = EU_VIDEO_BIT_RATE_MODE_CONSTANT;
 	else
 		vb.ucVideoBitRateMode = EU_VIDEO_BIT_RATE_MODE_VARIABLE_PEAK;
@@ -317,19 +317,19 @@ int saa7164_api_set_aspect_ratio(struct saa7164_port *port)
 		port->encoder_params.ctl_aspect);
 
 	switch (port->encoder_params.ctl_aspect) {
-	case V4L2_MPEG_VIDEO_ASPECT_1x1:
+	case V4L2_CODEC_VIDEO_ASPECT_1x1:
 		ar.width = 1;
 		ar.height = 1;
 		break;
-	case V4L2_MPEG_VIDEO_ASPECT_4x3:
+	case V4L2_CODEC_VIDEO_ASPECT_4x3:
 		ar.width = 4;
 		ar.height = 3;
 		break;
-	case V4L2_MPEG_VIDEO_ASPECT_16x9:
+	case V4L2_CODEC_VIDEO_ASPECT_16x9:
 		ar.width = 16;
 		ar.height = 9;
 		break;
-	case V4L2_MPEG_VIDEO_ASPECT_221x100:
+	case V4L2_CODEC_VIDEO_ASPECT_221x100:
 		ar.width = 221;
 		ar.height = 100;
 		break;
diff --git a/drivers/media/pci/saa7164/saa7164-core.c b/drivers/media/pci/saa7164/saa7164-core.c
index 7973ae42873a..29b9276579bd 100644
--- a/drivers/media/pci/saa7164/saa7164-core.c
+++ b/drivers/media/pci/saa7164/saa7164-core.c
@@ -292,9 +292,9 @@ static void saa7164_work_enchandler_helper(struct saa7164_port *port, int bufnr)
 
 			if ((port->nr != SAA7164_PORT_VBI1) && (port->nr != SAA7164_PORT_VBI2)) {
 				/* Validate the incoming buffer content */
-				if (port->encoder_params.stream_type == V4L2_MPEG_STREAM_TYPE_MPEG2_TS)
+				if (port->encoder_params.stream_type == V4L2_CODEC_STREAM_TYPE_MPEG2_TS)
 					saa7164_ts_verifier(buf);
-				else if (port->encoder_params.stream_type == V4L2_MPEG_STREAM_TYPE_MPEG2_PS)
+				else if (port->encoder_params.stream_type == V4L2_CODEC_STREAM_TYPE_MPEG2_PS)
 					saa7164_pack_verifier(buf);
 			}
 
diff --git a/drivers/media/pci/saa7164/saa7164-encoder.c b/drivers/media/pci/saa7164/saa7164-encoder.c
index 11e1eb6a6809..e4fc5a9b539d 100644
--- a/drivers/media/pci/saa7164/saa7164-encoder.c
+++ b/drivers/media/pci/saa7164/saa7164-encoder.c
@@ -106,9 +106,9 @@ static int saa7164_encoder_buffers_alloc(struct saa7164_port *port)
 	dprintk(DBGLVL_ENC, "%s()\n", __func__);
 
 	if (port->encoder_params.stream_type ==
-		V4L2_MPEG_STREAM_TYPE_MPEG2_PS) {
+		V4L2_CODEC_STREAM_TYPE_MPEG2_PS) {
 		dprintk(DBGLVL_ENC,
-			"%s() type=V4L2_MPEG_STREAM_TYPE_MPEG2_PS\n",
+			"%s() type=V4L2_CODEC_STREAM_TYPE_MPEG2_PS\n",
 			__func__);
 		params->samplesperline = 128;
 		params->numberoflines = 256;
@@ -117,9 +117,9 @@ static int saa7164_encoder_buffers_alloc(struct saa7164_port *port)
 			((SAA7164_PS_NUMBER_OF_LINES * 128) / PAGE_SIZE);
 	} else
 	if (port->encoder_params.stream_type ==
-		V4L2_MPEG_STREAM_TYPE_MPEG2_TS) {
+		V4L2_CODEC_STREAM_TYPE_MPEG2_TS) {
 		dprintk(DBGLVL_ENC,
-			"%s() type=V4L2_MPEG_STREAM_TYPE_MPEG2_TS\n",
+			"%s() type=V4L2_CODEC_STREAM_TYPE_MPEG2_TS\n",
 			__func__);
 		params->samplesperline = 188;
 		params->numberoflines = 312;
@@ -437,13 +437,13 @@ static int saa7164_s_ctrl(struct v4l2_ctrl *ctrl)
 		port->ctl_volume = ctrl->val;
 		saa7164_api_set_audio_volume(port, port->ctl_volume);
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE:
 		params->bitrate = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_STREAM_TYPE:
+	case V4L2_CID_CODEC_STREAM_TYPE:
 		params->stream_type = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_AUDIO_MUTE:
+	case V4L2_CID_CODEC_AUDIO_MUTE:
 		params->ctl_mute = ctrl->val;
 		ret = saa7164_api_audio_mute(port, params->ctl_mute);
 		if (ret != SAA_OK) {
@@ -452,7 +452,7 @@ static int saa7164_s_ctrl(struct v4l2_ctrl *ctrl)
 			ret = -EIO;
 		}
 		break;
-	case V4L2_CID_MPEG_VIDEO_ASPECT:
+	case V4L2_CID_CODEC_VIDEO_ASPECT:
 		params->ctl_aspect = ctrl->val;
 		ret = saa7164_api_set_aspect_ratio(port);
 		if (ret != SAA_OK) {
@@ -461,16 +461,16 @@ static int saa7164_s_ctrl(struct v4l2_ctrl *ctrl)
 			ret = -EIO;
 		}
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:
 		params->bitrate_mode = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_B_FRAMES:
+	case V4L2_CID_CODEC_VIDEO_B_FRAMES:
 		params->refdist = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:
+	case V4L2_CID_CODEC_VIDEO_BITRATE_PEAK:
 		params->bitrate_peak = ctrl->val;
 		break;
-	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+	case V4L2_CID_CODEC_VIDEO_GOP_SIZE:
 		params->gop_size = ctrl->val;
 		break;
 	default:
@@ -1033,31 +1033,31 @@ int saa7164_encoder_register(struct saa7164_port *port)
 	v4l2_ctrl_new_std(hdl, &saa7164_ctrl_ops,
 			  V4L2_CID_SHARPNESS, 0x0, 0x0f, 1, 8);
 	v4l2_ctrl_new_std(hdl, &saa7164_ctrl_ops,
-			  V4L2_CID_MPEG_AUDIO_MUTE, 0x0, 0x01, 1, 0);
+			  V4L2_CID_CODEC_AUDIO_MUTE, 0x0, 0x01, 1, 0);
 	v4l2_ctrl_new_std(hdl, &saa7164_ctrl_ops,
 			  V4L2_CID_AUDIO_VOLUME, -83, 24, 1, 20);
 	v4l2_ctrl_new_std(hdl, &saa7164_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_BITRATE,
+			  V4L2_CID_CODEC_VIDEO_BITRATE,
 			  ENCODER_MIN_BITRATE, ENCODER_MAX_BITRATE,
 			  100000, ENCODER_DEF_BITRATE);
 	v4l2_ctrl_new_std_menu(hdl, &saa7164_ctrl_ops,
-			       V4L2_CID_MPEG_STREAM_TYPE,
-			       V4L2_MPEG_STREAM_TYPE_MPEG2_TS, 0,
-			       V4L2_MPEG_STREAM_TYPE_MPEG2_PS);
+			       V4L2_CID_CODEC_STREAM_TYPE,
+			       V4L2_CODEC_STREAM_TYPE_MPEG2_TS, 0,
+			       V4L2_CODEC_STREAM_TYPE_MPEG2_PS);
 	v4l2_ctrl_new_std_menu(hdl, &saa7164_ctrl_ops,
-			       V4L2_CID_MPEG_VIDEO_ASPECT,
-			       V4L2_MPEG_VIDEO_ASPECT_221x100, 0,
-			       V4L2_MPEG_VIDEO_ASPECT_4x3);
+			       V4L2_CID_CODEC_VIDEO_ASPECT,
+			       V4L2_CODEC_VIDEO_ASPECT_221x100, 0,
+			       V4L2_CODEC_VIDEO_ASPECT_4x3);
 	v4l2_ctrl_new_std(hdl, &saa7164_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_GOP_SIZE, 1, 255, 1, 15);
+			  V4L2_CID_CODEC_VIDEO_GOP_SIZE, 1, 255, 1, 15);
 	v4l2_ctrl_new_std_menu(hdl, &saa7164_ctrl_ops,
-			       V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
-			       V4L2_MPEG_VIDEO_BITRATE_MODE_CBR, 0,
-			       V4L2_MPEG_VIDEO_BITRATE_MODE_VBR);
+			       V4L2_CID_CODEC_VIDEO_BITRATE_MODE,
+			       V4L2_CODEC_VIDEO_BITRATE_MODE_CBR, 0,
+			       V4L2_CODEC_VIDEO_BITRATE_MODE_VBR);
 	v4l2_ctrl_new_std(hdl, &saa7164_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_B_FRAMES, 1, 3, 1, 1);
+			  V4L2_CID_CODEC_VIDEO_B_FRAMES, 1, 3, 1, 1);
 	v4l2_ctrl_new_std(hdl, &saa7164_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_BITRATE_PEAK,
+			  V4L2_CID_CODEC_VIDEO_BITRATE_PEAK,
 			  ENCODER_MIN_BITRATE, ENCODER_MAX_BITRATE,
 			  100000, ENCODER_DEF_BITRATE);
 	if (hdl->error) {
diff --git a/drivers/media/pci/saa7164/saa7164.h b/drivers/media/pci/saa7164/saa7164.h
index 4b4eb156e214..87de4b9898a1 100644
--- a/drivers/media/pci/saa7164/saa7164.h
+++ b/drivers/media/pci/saa7164/saa7164.h
@@ -262,7 +262,7 @@ struct saa7164_encoder_params {
 	u32 bitrate; /* bps */
 	u32 bitrate_peak; /* bps */
 	u32 bitrate_mode;
-	u32 stream_type; /* V4L2_MPEG_STREAM_TYPE_MPEG2_TS */
+	u32 stream_type; /* V4L2_CODEC_STREAM_TYPE_MPEG2_TS */
 
 	u32 audio_sampling_freq;
 	u32 ctl_mute;
@@ -279,7 +279,7 @@ struct saa7164_vbi_params {
 	u32 bitrate; /* bps */
 	u32 bitrate_peak; /* bps */
 	u32 bitrate_mode;
-	u32 stream_type; /* V4L2_MPEG_STREAM_TYPE_MPEG2_TS */
+	u32 stream_type; /* V4L2_CODEC_STREAM_TYPE_MPEG2_TS */
 
 	u32 audio_sampling_freq;
 	u32 ctl_mute;
diff --git a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
index 0abcad4e84fa..c931d775a71e 100644
--- a/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
+++ b/drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c
@@ -1069,12 +1069,12 @@ static int solo_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_SHARPNESS:
 		return tw28_set_ctrl_val(solo_dev, ctrl->id, solo_enc->ch,
 					 ctrl->val);
-	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+	case V4L2_CID_CODEC_VIDEO_GOP_SIZE:
 		solo_enc->gop = ctrl->val;
 		solo_reg_write(solo_dev, SOLO_VE_CH_GOP(solo_enc->ch), solo_enc->gop);
 		solo_reg_write(solo_dev, SOLO_VE_CH_GOP_E(solo_enc->ch), solo_enc->gop);
 		return 0;
-	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_MIN_QP:
 		solo_enc->qp = ctrl->val;
 		solo_reg_write(solo_dev, SOLO_VE_CH_QP(solo_enc->ch), solo_enc->qp);
 		solo_reg_write(solo_dev, SOLO_VE_CH_QP_E(solo_enc->ch), solo_enc->qp);
@@ -1231,9 +1231,9 @@ static struct solo_enc_dev *solo_enc_alloc(struct solo_dev *solo_dev,
 		v4l2_ctrl_new_std(hdl, &solo_ctrl_ops,
 			V4L2_CID_SHARPNESS, 0, 15, 1, 0);
 	v4l2_ctrl_new_std(hdl, &solo_ctrl_ops,
-			V4L2_CID_MPEG_VIDEO_GOP_SIZE, 1, 255, 1, solo_dev->fps);
+			V4L2_CID_CODEC_VIDEO_GOP_SIZE, 1, 255, 1, solo_dev->fps);
 	v4l2_ctrl_new_std(hdl, &solo_ctrl_ops,
-			V4L2_CID_MPEG_VIDEO_H264_MIN_QP, 0, 31, 1, SOLO_DEFAULT_QP);
+			V4L2_CID_CODEC_VIDEO_H264_MIN_QP, 0, 31, 1, SOLO_DEFAULT_QP);
 	v4l2_ctrl_new_std_menu(hdl, &solo_ctrl_ops,
 			V4L2_CID_DETECT_MD_MODE,
 			V4L2_DETECT_MD_MODE_THRESHOLD_GRID, 0,
diff --git a/drivers/media/pci/tw5864/tw5864-video.c b/drivers/media/pci/tw5864/tw5864-video.c
index 9131265c2b87..0f0fe4b41a51 100644
--- a/drivers/media/pci/tw5864/tw5864-video.c
+++ b/drivers/media/pci/tw5864/tw5864-video.c
@@ -500,10 +500,10 @@ static int tw5864_s_ctrl(struct v4l2_ctrl *ctrl)
 		tw_indir_writeb(TW5864_INDIR_VIN_C_SAT_V(input->nr),
 				(u8)ctrl->val);
 		break;
-	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
+	case V4L2_CID_CODEC_VIDEO_GOP_SIZE:
 		input->gop = ctrl->val;
 		return 0;
-	case V4L2_CID_MPEG_VIDEO_H264_MIN_QP:
+	case V4L2_CID_CODEC_VIDEO_H264_MIN_QP:
 		spin_lock_irqsave(&input->slock, flags);
 		input->qp = ctrl->val;
 		input->reg_dsp_qp = input->qp;
@@ -1136,10 +1136,10 @@ static int tw5864_video_input_init(struct tw5864_input *input, int video_nr)
 	v4l2_ctrl_new_std(hdl, &tw5864_ctrl_ops,
 			  V4L2_CID_SATURATION, 0, 255, 1, 128);
 	v4l2_ctrl_new_std(hdl, &tw5864_ctrl_ops, V4L2_CID_HUE, -128, 127, 1, 0);
-	v4l2_ctrl_new_std(hdl, &tw5864_ctrl_ops, V4L2_CID_MPEG_VIDEO_GOP_SIZE,
+	v4l2_ctrl_new_std(hdl, &tw5864_ctrl_ops, V4L2_CID_CODEC_VIDEO_GOP_SIZE,
 			  1, MAX_GOP_SIZE, 1, GOP_SIZE);
 	v4l2_ctrl_new_std(hdl, &tw5864_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_MIN_QP, 28, 51, 1, QP_VALUE);
+			  V4L2_CID_CODEC_VIDEO_H264_MIN_QP, 28, 51, 1, QP_VALUE);
 	v4l2_ctrl_new_std_menu(hdl, &tw5864_ctrl_ops,
 			       V4L2_CID_DETECT_MD_MODE,
 			       V4L2_DETECT_MD_MODE_THRESHOLD_GRID, 0,
-- 
2.30.1

