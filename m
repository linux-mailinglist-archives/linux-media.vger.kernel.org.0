Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 348C3339EA0
	for <lists+linux-media@lfdr.de>; Sat, 13 Mar 2021 15:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234067AbhCMOnw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Mar 2021 09:43:52 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:36105 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234033AbhCMOna (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Mar 2021 09:43:30 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id L5UBljyoWC40pL5UHlV5eF; Sat, 13 Mar 2021 15:43:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615646609; bh=aATMYyeNTX6JQmtF9LMH0YzWn52oU5nafLmfwDYuxJw=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=riA5wVi8g+IK+b6K03MqAp3JxNH5O1w5NL+KEqoPPFHaiBJo33Sfk0YefluaIa2GR
         cizMebE1clmTyEM5SXq+IiUAF1/N8Y5WbPcvCu5obxTwC11F0Kdw/sEy4GNp/E7FoL
         DGO7IzplwkdM9pbsJeLbByeqwzFsdTYEA/cqUrrYHF6/8d7uIeJ1PcFuhpZVCO8iUY
         9+kC/s7gxAzfDyEOn1EW0JIzlucbUgsdvZVbDpXFJKenuqMTYI0Xd7y3mKjHn4QnZU
         srUe/gMaqCtwFeGIBLeFcwHHP5J3tEuQ9CE10pdIgBTJv8Y3z8qxALFDIhmZVkRAG0
         xnEG6qu3r2RbA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 08/15] media/usb: rename MPEG to CODEC
Date:   Sat, 13 Mar 2021 15:43:16 +0100
Message-Id: <20210313144323.143600-9-hverkuil-cisco@xs4all.nl>
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
 drivers/media/usb/cx231xx/cx231xx-417.c |  2 +-
 drivers/media/usb/go7007/go7007-v4l2.c  | 22 ++++----
 drivers/media/usb/hdpvr/hdpvr-control.c |  6 +--
 drivers/media/usb/hdpvr/hdpvr-core.c    |  4 +-
 drivers/media/usb/hdpvr/hdpvr-video.c   | 46 ++++++++--------
 drivers/media/usb/hdpvr/hdpvr.h         |  4 +-
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 72 ++++++++++++-------------
 7 files changed, 78 insertions(+), 78 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-417.c b/drivers/media/usb/cx231xx/cx231xx-417.c
index c5e21785fafe..ea9ed9a1fe4d 100644
--- a/drivers/media/usb/cx231xx/cx231xx-417.c
+++ b/drivers/media/usb/cx231xx/cx231xx-417.c
@@ -1674,7 +1674,7 @@ void cx231xx_417_unregister(struct cx231xx *dev)
 static int cx231xx_s_video_encoding(struct cx2341x_handler *cxhdl, u32 val)
 {
 	struct cx231xx *dev = container_of(cxhdl, struct cx231xx, mpeg_ctrl_handler);
-	int is_mpeg1 = val == V4L2_MPEG_VIDEO_ENCODING_MPEG_1;
+	int is_mpeg1 = val == V4L2_CODEC_VIDEO_ENCODING_MPEG_1;
 	struct v4l2_subdev_format format = {
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 	};
diff --git a/drivers/media/usb/go7007/go7007-v4l2.c b/drivers/media/usb/go7007/go7007-v4l2.c
index b2edc4deaca3..fd1c1520ea31 100644
--- a/drivers/media/usb/go7007/go7007-v4l2.c
+++ b/drivers/media/usb/go7007/go7007-v4l2.c
@@ -161,13 +161,13 @@ static void set_formatting(struct go7007 *go)
 
 	switch (v4l2_ctrl_g_ctrl(go->mpeg_video_aspect_ratio)) {
 	default:
-	case V4L2_MPEG_VIDEO_ASPECT_1x1:
+	case V4L2_CODEC_VIDEO_ASPECT_1x1:
 		go->aspect_ratio = GO7007_RATIO_1_1;
 		break;
-	case V4L2_MPEG_VIDEO_ASPECT_4x3:
+	case V4L2_CODEC_VIDEO_ASPECT_4x3:
 		go->aspect_ratio = GO7007_RATIO_4_3;
 		break;
-	case V4L2_MPEG_VIDEO_ASPECT_16x9:
+	case V4L2_CODEC_VIDEO_ASPECT_16x9:
 		go->aspect_ratio = GO7007_RATIO_16_9;
 		break;
 	}
@@ -1020,21 +1020,21 @@ int go7007_v4l2_ctrl_init(struct go7007 *go)
 
 	v4l2_ctrl_handler_init(hdl, 22);
 	go->mpeg_video_gop_size = v4l2_ctrl_new_std(hdl, NULL,
-			V4L2_CID_MPEG_VIDEO_GOP_SIZE, 0, 34, 1, 15);
+			V4L2_CID_CODEC_VIDEO_GOP_SIZE, 0, 34, 1, 15);
 	go->mpeg_video_gop_closure = v4l2_ctrl_new_std(hdl, NULL,
-			V4L2_CID_MPEG_VIDEO_GOP_CLOSURE, 0, 1, 1, 1);
+			V4L2_CID_CODEC_VIDEO_GOP_CLOSURE, 0, 1, 1, 1);
 	go->mpeg_video_bitrate = v4l2_ctrl_new_std(hdl, NULL,
-			V4L2_CID_MPEG_VIDEO_BITRATE,
+			V4L2_CID_CODEC_VIDEO_BITRATE,
 			64000, 10000000, 1, 9800000);
 	go->mpeg_video_b_frames = v4l2_ctrl_new_std(hdl, NULL,
-			V4L2_CID_MPEG_VIDEO_B_FRAMES, 0, 2, 2, 0);
+			V4L2_CID_CODEC_VIDEO_B_FRAMES, 0, 2, 2, 0);
 	go->mpeg_video_rep_seqheader = v4l2_ctrl_new_std(hdl, NULL,
-			V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER, 0, 1, 1, 1);
+			V4L2_CID_CODEC_VIDEO_REPEAT_SEQ_HEADER, 0, 1, 1, 1);
 
 	go->mpeg_video_aspect_ratio = v4l2_ctrl_new_std_menu(hdl, NULL,
-			V4L2_CID_MPEG_VIDEO_ASPECT,
-			V4L2_MPEG_VIDEO_ASPECT_16x9, 0,
-			V4L2_MPEG_VIDEO_ASPECT_1x1);
+			V4L2_CID_CODEC_VIDEO_ASPECT,
+			V4L2_CODEC_VIDEO_ASPECT_16x9, 0,
+			V4L2_CODEC_VIDEO_ASPECT_1x1);
 	ctrl = v4l2_ctrl_new_std(hdl, NULL,
 			V4L2_CID_JPEG_ACTIVE_MARKER, 0,
 			V4L2_JPEG_ACTIVE_MARKER_DQT |
diff --git a/drivers/media/usb/hdpvr/hdpvr-control.c b/drivers/media/usb/hdpvr/hdpvr-control.c
index 37c53ab85b30..0951f4d6bddf 100644
--- a/drivers/media/usb/hdpvr/hdpvr-control.c
+++ b/drivers/media/usb/hdpvr/hdpvr-control.c
@@ -118,7 +118,7 @@ int hdpvr_set_bitrate(struct hdpvr_device *dev)
 }
 
 int hdpvr_set_audio(struct hdpvr_device *dev, u8 input,
-		    enum v4l2_mpeg_audio_encoding codec)
+		    enum v4l2_codec_audio_encoding codec)
 {
 	int ret = 0;
 
@@ -126,9 +126,9 @@ int hdpvr_set_audio(struct hdpvr_device *dev, u8 input,
 		mutex_lock(&dev->usbc_mutex);
 		memset(dev->usbc_buf, 0, 2);
 		dev->usbc_buf[0] = input;
-		if (codec == V4L2_MPEG_AUDIO_ENCODING_AAC)
+		if (codec == V4L2_CODEC_AUDIO_ENCODING_AAC)
 			dev->usbc_buf[1] = 0;
-		else if (codec == V4L2_MPEG_AUDIO_ENCODING_AC3)
+		else if (codec == V4L2_CODEC_AUDIO_ENCODING_AC3)
 			dev->usbc_buf[1] = 1;
 		else {
 			mutex_unlock(&dev->usbc_mutex);
diff --git a/drivers/media/usb/hdpvr/hdpvr-core.c b/drivers/media/usb/hdpvr/hdpvr-core.c
index 52e05a69c46e..e35a27b1b8a4 100644
--- a/drivers/media/usb/hdpvr/hdpvr-core.c
+++ b/drivers/media/usb/hdpvr/hdpvr-core.c
@@ -251,7 +251,7 @@ static const struct hdpvr_options hdpvr_default_options = {
 	.peak_bitrate	= 90, /* 9 mbps */
 	.bitrate_mode	= HDPVR_CONSTANT,
 	.gop_mode	= HDPVR_SIMPLE_IDR_GOP,
-	.audio_codec	= V4L2_MPEG_AUDIO_ENCODING_AAC,
+	.audio_codec	= V4L2_CODEC_AUDIO_ENCODING_AAC,
 	/* original picture controls for firmware version <= 0x15 */
 	/* updated in device_authorization() for newer firmware */
 	.brightness	= 0x86,
@@ -314,7 +314,7 @@ static int hdpvr_probe(struct usb_interface *interface,
 		dev->options.audio_input = default_audio_input;
 		if (default_audio_input == HDPVR_SPDIF)
 			dev->options.audio_codec =
-				V4L2_MPEG_AUDIO_ENCODING_AC3;
+				V4L2_CODEC_AUDIO_ENCODING_AC3;
 	}
 
 	dev->udev = usb_get_dev(interface_to_usbdev(interface));
diff --git a/drivers/media/usb/hdpvr/hdpvr-video.c b/drivers/media/usb/hdpvr/hdpvr-video.c
index 563128d11731..8eb0bdc977e7 100644
--- a/drivers/media/usb/hdpvr/hdpvr-video.c
+++ b/drivers/media/usb/hdpvr/hdpvr-video.c
@@ -881,8 +881,8 @@ static int hdpvr_try_ctrl(struct v4l2_ctrl *ctrl)
 		container_of(ctrl->handler, struct hdpvr_device, hdl);
 
 	switch (ctrl->id) {
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
-		if (ctrl->val == V4L2_MPEG_VIDEO_BITRATE_MODE_VBR &&
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE:
+		if (ctrl->val == V4L2_CODEC_VIDEO_BITRATE_MODE_VBR &&
 		    dev->video_bitrate->val >= dev->video_bitrate_peak->val)
 			dev->video_bitrate_peak->val =
 					dev->video_bitrate->val + 100000;
@@ -929,16 +929,16 @@ static int hdpvr_s_ctrl(struct v4l2_ctrl *ctrl)
 			break;
 		dev->options.sharpness = ctrl->val;
 		return 0;
-	case V4L2_CID_MPEG_AUDIO_ENCODING:
+	case V4L2_CID_CODEC_AUDIO_ENCODING:
 		if (dev->flags & HDPVR_FLAG_AC3_CAP) {
 			opt->audio_codec = ctrl->val;
 			return hdpvr_set_audio(dev, opt->audio_input + 1,
 					      opt->audio_codec);
 		}
 		return 0;
-	case V4L2_CID_MPEG_VIDEO_ENCODING:
+	case V4L2_CID_CODEC_VIDEO_ENCODING:
 		return 0;
-/*	case V4L2_CID_MPEG_VIDEO_B_FRAMES: */
+/*	case V4L2_CID_CODEC_VIDEO_B_FRAMES: */
 /*		if (ctrl->value == 0 && !(opt->gop_mode & 0x2)) { */
 /*			opt->gop_mode |= 0x2; */
 /*			hdpvr_config_call(dev, CTRL_GOP_MODE_VALUE, */
@@ -950,19 +950,19 @@ static int hdpvr_s_ctrl(struct v4l2_ctrl *ctrl)
 /*					  opt->gop_mode); */
 /*		} */
 /*		break; */
-	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE: {
+	case V4L2_CID_CODEC_VIDEO_BITRATE_MODE: {
 		uint peak_bitrate = dev->video_bitrate_peak->val / 100000;
 		uint bitrate = dev->video_bitrate->val / 100000;
 
 		if (ctrl->is_new) {
-			if (ctrl->val == V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
+			if (ctrl->val == V4L2_CODEC_VIDEO_BITRATE_MODE_CBR)
 				opt->bitrate_mode = HDPVR_CONSTANT;
 			else
 				opt->bitrate_mode = HDPVR_VARIABLE_AVERAGE;
 			hdpvr_config_call(dev, CTRL_BITRATE_MODE_VALUE,
 					  opt->bitrate_mode);
 			v4l2_ctrl_activate(dev->video_bitrate_peak,
-				ctrl->val != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
+				ctrl->val != V4L2_CODEC_VIDEO_BITRATE_MODE_CBR);
 		}
 
 		if (dev->video_bitrate_peak->is_new ||
@@ -973,7 +973,7 @@ static int hdpvr_s_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		return 0;
 	}
-	case V4L2_CID_MPEG_STREAM_TYPE:
+	case V4L2_CID_CODEC_STREAM_TYPE:
 		return 0;
 	default:
 		break;
@@ -1195,28 +1195,28 @@ int hdpvr_register_videodev(struct hdpvr_device *dev, struct device *parent,
 	}
 
 	v4l2_ctrl_new_std_menu(hdl, &hdpvr_ctrl_ops,
-		V4L2_CID_MPEG_STREAM_TYPE,
-		V4L2_MPEG_STREAM_TYPE_MPEG2_TS,
-		0x1, V4L2_MPEG_STREAM_TYPE_MPEG2_TS);
+		V4L2_CID_CODEC_STREAM_TYPE,
+		V4L2_CODEC_STREAM_TYPE_MPEG2_TS,
+		0x1, V4L2_CODEC_STREAM_TYPE_MPEG2_TS);
 	v4l2_ctrl_new_std_menu(hdl, &hdpvr_ctrl_ops,
-		V4L2_CID_MPEG_AUDIO_ENCODING,
-		ac3 ? V4L2_MPEG_AUDIO_ENCODING_AC3 : V4L2_MPEG_AUDIO_ENCODING_AAC,
-		0x7, ac3 ? dev->options.audio_codec : V4L2_MPEG_AUDIO_ENCODING_AAC);
+		V4L2_CID_CODEC_AUDIO_ENCODING,
+		ac3 ? V4L2_CODEC_AUDIO_ENCODING_AC3 : V4L2_CODEC_AUDIO_ENCODING_AAC,
+		0x7, ac3 ? dev->options.audio_codec : V4L2_CODEC_AUDIO_ENCODING_AAC);
 	v4l2_ctrl_new_std_menu(hdl, &hdpvr_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_ENCODING,
-		V4L2_MPEG_VIDEO_ENCODING_MPEG_4_AVC, 0x3,
-		V4L2_MPEG_VIDEO_ENCODING_MPEG_4_AVC);
+		V4L2_CID_CODEC_VIDEO_ENCODING,
+		V4L2_CODEC_VIDEO_ENCODING_MPEG_4_AVC, 0x3,
+		V4L2_CODEC_VIDEO_ENCODING_MPEG_4_AVC);
 
 	dev->video_mode = v4l2_ctrl_new_std_menu(hdl, &hdpvr_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
-		V4L2_MPEG_VIDEO_BITRATE_MODE_CBR, 0,
-		V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
+		V4L2_CID_CODEC_VIDEO_BITRATE_MODE,
+		V4L2_CODEC_VIDEO_BITRATE_MODE_CBR, 0,
+		V4L2_CODEC_VIDEO_BITRATE_MODE_CBR);
 
 	dev->video_bitrate = v4l2_ctrl_new_std(hdl, &hdpvr_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_BITRATE,
+		V4L2_CID_CODEC_VIDEO_BITRATE,
 		1000000, 13500000, 100000, 6500000);
 	dev->video_bitrate_peak = v4l2_ctrl_new_std(hdl, &hdpvr_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_BITRATE_PEAK,
+		V4L2_CID_CODEC_VIDEO_BITRATE_PEAK,
 		1100000, 20200000, 100000, 9000000);
 	dev->v4l2_dev.ctrl_handler = hdl;
 	if (hdl->error) {
diff --git a/drivers/media/usb/hdpvr/hdpvr.h b/drivers/media/usb/hdpvr/hdpvr.h
index 84519c962cb4..bc1296cafb5e 100644
--- a/drivers/media/usb/hdpvr/hdpvr.h
+++ b/drivers/media/usb/hdpvr/hdpvr.h
@@ -51,7 +51,7 @@ struct hdpvr_options {
 	u8	peak_bitrate;	/* in 100kbps */
 	u8	bitrate_mode;
 	u8	gop_mode;
-	enum v4l2_mpeg_audio_encoding	audio_codec;
+	enum v4l2_codec_audio_encoding	audio_codec;
 	u8	brightness;
 	u8	contrast;
 	u8	hue;
@@ -293,7 +293,7 @@ int hdpvr_set_options(struct hdpvr_device *dev);
 int hdpvr_set_bitrate(struct hdpvr_device *dev);
 
 int hdpvr_set_audio(struct hdpvr_device *dev, u8 input,
-		    enum v4l2_mpeg_audio_encoding codec);
+		    enum v4l2_codec_audio_encoding codec);
 
 int hdpvr_config_call(struct hdpvr_device *dev, uint value,
 		      unsigned char valbuf);
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index f4a727918e35..ab5f50c737f4 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -149,92 +149,92 @@ struct pvr2_mpeg_ids {
 static const struct pvr2_mpeg_ids mpeg_ids[] = {
 	{
 		.strid = "audio_layer",
-		.id = V4L2_CID_MPEG_AUDIO_ENCODING,
+		.id = V4L2_CID_CODEC_AUDIO_ENCODING,
 	},{
 		.strid = "audio_bitrate",
-		.id = V4L2_CID_MPEG_AUDIO_L2_BITRATE,
+		.id = V4L2_CID_CODEC_AUDIO_L2_BITRATE,
 	},{
 		/* Already using audio_mode elsewhere :-( */
 		.strid = "mpeg_audio_mode",
-		.id = V4L2_CID_MPEG_AUDIO_MODE,
+		.id = V4L2_CID_CODEC_AUDIO_MODE,
 	},{
 		.strid = "mpeg_audio_mode_extension",
-		.id = V4L2_CID_MPEG_AUDIO_MODE_EXTENSION,
+		.id = V4L2_CID_CODEC_AUDIO_MODE_EXTENSION,
 	},{
 		.strid = "audio_emphasis",
-		.id = V4L2_CID_MPEG_AUDIO_EMPHASIS,
+		.id = V4L2_CID_CODEC_AUDIO_EMPHASIS,
 	},{
 		.strid = "audio_crc",
-		.id = V4L2_CID_MPEG_AUDIO_CRC,
+		.id = V4L2_CID_CODEC_AUDIO_CRC,
 	},{
 		.strid = "video_aspect",
-		.id = V4L2_CID_MPEG_VIDEO_ASPECT,
+		.id = V4L2_CID_CODEC_VIDEO_ASPECT,
 	},{
 		.strid = "video_b_frames",
-		.id = V4L2_CID_MPEG_VIDEO_B_FRAMES,
+		.id = V4L2_CID_CODEC_VIDEO_B_FRAMES,
 	},{
 		.strid = "video_gop_size",
-		.id = V4L2_CID_MPEG_VIDEO_GOP_SIZE,
+		.id = V4L2_CID_CODEC_VIDEO_GOP_SIZE,
 	},{
 		.strid = "video_gop_closure",
-		.id = V4L2_CID_MPEG_VIDEO_GOP_CLOSURE,
+		.id = V4L2_CID_CODEC_VIDEO_GOP_CLOSURE,
 	},{
 		.strid = "video_bitrate_mode",
-		.id = V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
+		.id = V4L2_CID_CODEC_VIDEO_BITRATE_MODE,
 	},{
 		.strid = "video_bitrate",
-		.id = V4L2_CID_MPEG_VIDEO_BITRATE,
+		.id = V4L2_CID_CODEC_VIDEO_BITRATE,
 	},{
 		.strid = "video_bitrate_peak",
-		.id = V4L2_CID_MPEG_VIDEO_BITRATE_PEAK,
+		.id = V4L2_CID_CODEC_VIDEO_BITRATE_PEAK,
 	},{
 		.strid = "video_temporal_decimation",
-		.id = V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION,
+		.id = V4L2_CID_CODEC_VIDEO_TEMPORAL_DECIMATION,
 	},{
 		.strid = "stream_type",
-		.id = V4L2_CID_MPEG_STREAM_TYPE,
+		.id = V4L2_CID_CODEC_STREAM_TYPE,
 	},{
 		.strid = "video_spatial_filter_mode",
-		.id = V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE,
+		.id = V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER_MODE,
 	},{
 		.strid = "video_spatial_filter",
-		.id = V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER,
+		.id = V4L2_CID_CODEC_CX2341X_VIDEO_SPATIAL_FILTER,
 	},{
 		.strid = "video_luma_spatial_filter_type",
-		.id = V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE,
+		.id = V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_SPATIAL_FILTER_TYPE,
 	},{
 		.strid = "video_chroma_spatial_filter_type",
-		.id = V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE,
+		.id = V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_SPATIAL_FILTER_TYPE,
 	},{
 		.strid = "video_temporal_filter_mode",
-		.id = V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER_MODE,
+		.id = V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER_MODE,
 	},{
 		.strid = "video_temporal_filter",
-		.id = V4L2_CID_MPEG_CX2341X_VIDEO_TEMPORAL_FILTER,
+		.id = V4L2_CID_CODEC_CX2341X_VIDEO_TEMPORAL_FILTER,
 	},{
 		.strid = "video_median_filter_type",
-		.id = V4L2_CID_MPEG_CX2341X_VIDEO_MEDIAN_FILTER_TYPE,
+		.id = V4L2_CID_CODEC_CX2341X_VIDEO_MEDIAN_FILTER_TYPE,
 	},{
 		.strid = "video_luma_median_filter_top",
-		.id = V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP,
+		.id = V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_TOP,
 	},{
 		.strid = "video_luma_median_filter_bottom",
-		.id = V4L2_CID_MPEG_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM,
+		.id = V4L2_CID_CODEC_CX2341X_VIDEO_LUMA_MEDIAN_FILTER_BOTTOM,
 	},{
 		.strid = "video_chroma_median_filter_top",
-		.id = V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP,
+		.id = V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_TOP,
 	},{
 		.strid = "video_chroma_median_filter_bottom",
-		.id = V4L2_CID_MPEG_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM,
+		.id = V4L2_CID_CODEC_CX2341X_VIDEO_CHROMA_MEDIAN_FILTER_BOTTOM,
 	}
 };
 #define MPEGDEF_COUNT ARRAY_SIZE(mpeg_ids)
 
 
 static const char *control_values_srate[] = {
-	[V4L2_MPEG_AUDIO_SAMPLING_FREQ_44100]   = "44.1 kHz",
-	[V4L2_MPEG_AUDIO_SAMPLING_FREQ_48000]   = "48 kHz",
-	[V4L2_MPEG_AUDIO_SAMPLING_FREQ_32000]   = "32 kHz",
+	[V4L2_CODEC_AUDIO_SAMPLING_FREQ_44100]   = "44.1 kHz",
+	[V4L2_CODEC_AUDIO_SAMPLING_FREQ_48000]   = "48 kHz",
+	[V4L2_CODEC_AUDIO_SAMPLING_FREQ_32000]   = "32 kHz",
 };
 
 
@@ -1152,8 +1152,8 @@ static const struct pvr2_ctl_info control_defs[] = {
 		.get_max_value = ctrl_vres_max_get,
 		.get_min_value = ctrl_vres_min_get,
 	},{
-		.v4l_id = V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ,
-		.default_value = V4L2_MPEG_AUDIO_SAMPLING_FREQ_48000,
+		.v4l_id = V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ,
+		.default_value = V4L2_CODEC_AUDIO_SAMPLING_FREQ_48000,
 		.desc = "Audio Sampling Frequency",
 		.name = "srate",
 		DEFREF(srate),
@@ -2932,13 +2932,13 @@ static void pvr2_subdev_update(struct pvr2_hdw *hdw)
 			   hdw->srate_val);
 		switch (hdw->srate_val) {
 		default:
-		case V4L2_MPEG_AUDIO_SAMPLING_FREQ_48000:
+		case V4L2_CODEC_AUDIO_SAMPLING_FREQ_48000:
 			val = 48000;
 			break;
-		case V4L2_MPEG_AUDIO_SAMPLING_FREQ_44100:
+		case V4L2_CODEC_AUDIO_SAMPLING_FREQ_44100:
 			val = 44100;
 			break;
-		case V4L2_MPEG_AUDIO_SAMPLING_FREQ_32000:
+		case V4L2_CODEC_AUDIO_SAMPLING_FREQ_32000:
 			val = 32000;
 			break;
 		}
@@ -3061,7 +3061,7 @@ static int pvr2_hdw_commit_execute(struct pvr2_hdw *hdw)
 			memset(&c1, 0, sizeof(c1));
 			cs.controls = &c1;
 			cs.count = 1;
-			c1.id = V4L2_CID_MPEG_VIDEO_GOP_SIZE;
+			c1.id = V4L2_CID_CODEC_VIDEO_GOP_SIZE;
 			c1.value = gop_size;
 			cx2341x_ext_ctrls(&hdw->enc_ctl_state, 0, &cs,
 					  VIDIOC_S_EXT_CTRLS);
@@ -3123,7 +3123,7 @@ static int pvr2_hdw_commit_execute(struct pvr2_hdw *hdw)
 		memset(&c1,0,sizeof(c1));
 		cs.controls = &c1;
 		cs.count = 1;
-		c1.id = V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ;
+		c1.id = V4L2_CID_CODEC_AUDIO_SAMPLING_FREQ;
 		c1.value = hdw->srate_val;
 		cx2341x_ext_ctrls(&hdw->enc_ctl_state, 0, &cs,VIDIOC_S_EXT_CTRLS);
 	}
-- 
2.30.1

