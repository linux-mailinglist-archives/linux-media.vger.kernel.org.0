Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F34F9AFB0
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 14:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393284AbfHWMhn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:37:43 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41378 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393115AbfHWMhn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:37:43 -0400
Received: by mail-ed1-f68.google.com with SMTP id w5so13243806edl.8;
        Fri, 23 Aug 2019 05:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OWIHsEFxbd6viy1HzbThnjNeOnGIj8nhcWEYFUF/scg=;
        b=KJ2NxrsV/cjaOrJ4xLetP6Fwh2neXBoyeU7qV8I9ZIFDyGfhi/fq01kfKm0aazqlL5
         gGbZqJU1GgyNldIc4M+1FLA2oQltr5YJ3VygWlkduAIVDtmfZkKBDSS8XbgwiIO6gW5G
         oqf0A/NnmJt2shx/FC+syjT4ErFz05QpsORBjVZdxFX+zSEvALVB7IN3rLS8oLEKs+Ik
         fEr+2QHhWDX85mH9xz9DIKGhI3RXjk3FRedOZ03QlEqERiFt4Ei4mTvZ1GxsAfc171Jr
         Q7zyGKdSXEOG1B76AaSyiUmKuo1Ov2/baGMkcegf+x4lE4pLbkDMmdTWCegDOm9r4ujz
         AEvQ==
X-Gm-Message-State: APjAAAWTlhBtuMoDuGTMfyM0yxSp+IJwn5OnfSgmXeuBq7H5uwjRrneV
        fdkf5k25nWRCiz9awA4rzgA=
X-Google-Smtp-Source: APXvYqzChGaBPdJNhLF8XpfCj9Dnucp8Q5qr8sUtSIPTucdjdpLROsF6a/y7uM7lDqJCzi03uxfpSQ==
X-Received: by 2002:a17:906:841a:: with SMTP id n26mr4030872ejx.181.1566563860258;
        Fri, 23 Aug 2019 05:37:40 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 9sm389687ejw.63.2019.08.23.05.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 05:37:39 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v3 1/7] media: add V4L2_CID_UNIT_CELL_SIZE control
Date:   Fri, 23 Aug 2019 14:37:31 +0200
Message-Id: <20190823123737.7774-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This control returns the unit cell size in nanometres. The struct provides
the width and the height in separated fields to take into consideration
asymmetric pixels and/or hardware binning.
This control is required for automatic calibration of sensors/cameras.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
v3:
-Put together all actions on ctrl_fill
-Move the control to IMAGE_SOURCE

 drivers/media/v4l2-core/v4l2-ctrls.c | 11 +++++++++++
 include/media/v4l2-ctrls.h           |  2 ++
 include/uapi/linux/v4l2-controls.h   |  1 +
 include/uapi/linux/videodev2.h       | 11 +++++++++++
 4 files changed, 25 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 1d8f38824631..b3bf458df7f7 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -994,6 +994,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
 	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
 	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
+	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
 
 	/* FM Radio Modulator controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1375,6 +1376,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
 		*type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
 		break;
+	case V4L2_CID_UNIT_CELL_SIZE:
+		*type = V4L2_CTRL_TYPE_AREA;
+		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
@@ -1723,6 +1728,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_FWHT_PARAMS:
 		break;
 
+	case V4L2_CTRL_TYPE_AREA:
+		break;
+
 	case V4L2_CTRL_TYPE_H264_SPS:
 	case V4L2_CTRL_TYPE_H264_PPS:
 	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
@@ -2421,6 +2429,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
 		elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
 		break;
+	case V4L2_CTRL_TYPE_AREA:
+		elem_size = sizeof(struct v4l2_area);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 570ff4b0205a..9a3d11350e67 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -50,6 +50,7 @@ struct poll_table_struct;
  * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params.
  * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
  * @p_vp8_frame_header:		Pointer to a VP8 frame header structure.
+ * @p_area:			Pointer to an area.
  * @p:				Pointer to a compound value.
  */
 union v4l2_ctrl_ptr {
@@ -68,6 +69,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
 	struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
+	struct v4l2_area *p_area;
 	void *p;
 };
 
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index a2669b79b294..5a7bedee2b0e 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1034,6 +1034,7 @@ enum v4l2_jpeg_chroma_subsampling {
 #define V4L2_CID_TEST_PATTERN_GREENR		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 5)
 #define V4L2_CID_TEST_PATTERN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
 #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
+#define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
 
 
 /* Image processing controls */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 530638dffd93..05cfc69d7ed6 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -422,6 +422,11 @@ struct v4l2_fract {
 	__u32   denominator;
 };
 
+struct v4l2_area {
+	__u32   width;
+	__u32   height;
+};
+
 /**
   * struct v4l2_capability - Describes V4L2 device caps returned by VIDIOC_QUERYCAP
   *
@@ -1720,6 +1725,12 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U8	     = 0x0100,
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
+	/*
+	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS = 0x0103,
+	 * V4L2_CTRL_TYPE_MPEG2_QUANTIZATION = 0x0104,
+	 * V4L2_CTRL_TYPE_FWHT_PARAMS = 0x0105,
+	 */
+	V4L2_CTRL_TYPE_AREA    = 0x0106,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.23.0.rc1

