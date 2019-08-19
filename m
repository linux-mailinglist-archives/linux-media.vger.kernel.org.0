Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5FD9234B
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 14:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbfHSMR1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 08:17:27 -0400
Received: from mail-ed1-f49.google.com ([209.85.208.49]:37581 "EHLO
        mail-ed1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfHSMR1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 08:17:27 -0400
Received: by mail-ed1-f49.google.com with SMTP id f22so1465966edt.4;
        Mon, 19 Aug 2019 05:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9HJOjJNc72EsAZqvVA1iMykBVheTMlViqU0Dls5uHTA=;
        b=Hkw8bnvN5/t2PjcLRhvmEftZE2He1Sax3SQmB0eOVUQCNiJPymZdrIlhFJd0xXebgJ
         2vebuvIfH9D6gk52HtZWN1khZr+eOr1saWSG5q746lOgOzwIHl/v2Z1dY3/QCBVgMhen
         rG5dCvHhVmmXP9ghg8S91PnMjY90ba2udICRk0B66x/4dO23kJH7FjDBtS/lUYZchltI
         f0W/ZUYRB7la9TOjee9LgZ7SHKVcZX9JIl4blIjxdp8xO0SBnV9q1XuMxsP+18nhUsiW
         6UjbOFEJJhnzCCc7R1Z1mlnC+en0LfhBTI3VDbMChHY/rYQ/dQ733n2qUZHF/tHG1R55
         rR8A==
X-Gm-Message-State: APjAAAVGjNhNXFuydOP64War11VrK34rSZ7kf0K70R809VCowqAHg+IB
        Ek1bGJGPyoqJcNH6ufWPK6E=
X-Google-Smtp-Source: APXvYqysIg9wn42RUSFN/zCY4ej2oMd+LFZE9Uw3GoqmOE6gMVBiyToZTnB0EaVuo9oAT2zyh55yVA==
X-Received: by 2002:a50:8858:: with SMTP id c24mr24503654edc.253.1566217045039;
        Mon, 19 Aug 2019 05:17:25 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id b31sm2753639edf.33.2019.08.19.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 05:17:24 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH 1/3] media: add pixel_size control
Date:   Mon, 19 Aug 2019 14:17:18 +0200
Message-Id: <20190819121720.31345-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This control returns the pixel size in nanometres. The struct provides
the width and the height in separated fields to take into consideration
asymmetric pixels and/or hardware binning.
This control is required for automatic calibration of the sensor.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 11 +++++++++++
 include/media/v4l2-ctrls.h           |  2 ++
 include/uapi/linux/v4l2-controls.h   |  3 +++
 include/uapi/linux/videodev2.h       | 11 +++++++++++
 4 files changed, 27 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index cd1ae016706f..a3a0086c96ff 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -978,6 +978,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
 	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
 	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
+	case V4L2_CID_PIXEL_SIZE:		return "Pixel Size";
 
 	/* FM Radio Modulator controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1357,6 +1358,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:
 		*type = V4L2_CTRL_TYPE_VP8_FRAME_HEADER;
 		break;
+	case V4L2_CID_PIXEL_SIZE:
+		*type = V4L2_CTRL_TYPE_PIXEL_SIZE;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
@@ -1423,6 +1427,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_RDS_RX_TRAFFIC_ANNOUNCEMENT:
 	case V4L2_CID_RDS_RX_TRAFFIC_PROGRAM:
 	case V4L2_CID_RDS_RX_MUSIC_SPEECH:
+	case V4L2_CID_PIXEL_SIZE:
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		break;
 	case V4L2_CID_RF_TUNER_PLL_LOCK:
@@ -1705,6 +1710,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_FWHT_PARAMS:
 		break;
 
+	case V4L2_CTRL_TYPE_PIXEL_SIZE:
+		break;
+
 	case V4L2_CTRL_TYPE_H264_SPS:
 	case V4L2_CTRL_TYPE_H264_PPS:
 	case V4L2_CTRL_TYPE_H264_SCALING_MATRIX:
@@ -2403,6 +2411,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_VP8_FRAME_HEADER:
 		elem_size = sizeof(struct v4l2_ctrl_vp8_frame_header);
 		break;
+	case V4L2_CTRL_TYPE_PIXEL_SIZE:
+		elem_size = sizeof(struct v4l2_pixel_size);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 570ff4b0205a..63de780398b8 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -50,6 +50,7 @@ struct poll_table_struct;
  * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params.
  * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
  * @p_vp8_frame_header:		Pointer to a VP8 frame header structure.
+ * @p_pixel_size:		Pointer to a pixel_size value.
  * @p:				Pointer to a compound value.
  */
 union v4l2_ctrl_ptr {
@@ -68,6 +69,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
 	struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
 	struct v4l2_ctrl_vp8_frame_header *p_vp8_frame_header;
+	struct v4l2_pixel_size *p_pixel_size;
 	void *p;
 };
 
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index a2669b79b294..13f0410df4c6 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -912,6 +912,9 @@ enum v4l2_auto_focus_range {
 #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
 #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
 
+#define V4L2_CID_PIXEL_SIZE			(V4L2_CID_CAMERA_CLASS_BASE+34)
+
+
 /* FM Modulator class control IDs */
 
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 2427bc4d8eba..21f4846dca0b 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -422,6 +422,11 @@ struct v4l2_fract {
 	__u32   denominator;
 };
 
+struct v4l2_pixel_size {
+	__u32   width;
+	__u32   height;
+};
+
 /**
   * struct v4l2_capability - Describes V4L2 device caps returned by VIDIOC_QUERYCAP
   *
@@ -1718,6 +1723,12 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U8	     = 0x0100,
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
+	/*
+	 * V4L2_CTRL_TYPE_MPEG2_SLICE_PARAMS = 0x0103,
+	 * V4L2_CTRL_TYPE_MPEG2_QUANTIZATION = 0x0104,
+	 * V4L2_CTRL_TYPE_FWHT_PARAMS = 0x0105,
+	 */
+	V4L2_CTRL_TYPE_PIXEL_SIZE    = 0x0106,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
-- 
2.23.0.rc1

