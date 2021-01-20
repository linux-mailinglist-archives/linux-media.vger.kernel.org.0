Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B4D2FCE7E
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733078AbhATKfF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:35:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731323AbhATJ2k (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:28:40 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77727C061798
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 01:26:35 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id b21so16074373edy.6
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 01:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=za1noRgNNhtCmeY9qHAQSodv1zv6L5e1srPXJ+3dmLk=;
        b=FxR0TJ0zkZ7RY98BrkSE0XS9a3+b3ZCdCW2cy8YY1HhGvvpYHE3BaktXRUgQ+AH7/N
         xmydpSWLV82uwYo7VVSO39rb0pQcncQyGsei4cWn/tiS3Hm9GHM6r41+1WR2Mxut05ju
         t3PjSymPhhJYp13uR+OsQDxpMmxHpo4ne0eHOwuDdgSlYLybQz6uEUPXCkYEvtMdvwW3
         4LsAok/KC62n+YFPJiMsEUy0qikFpXmDPsGpWp+zFL6Y1FB6Q2mjZ2pzSc+wxU3b0vKt
         zejoDsPPumMX/yA1SNvND75h0OCSmnpozoHca7FTqhJfKCedbSMhRKjQOaEdIuxzaAps
         jJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=za1noRgNNhtCmeY9qHAQSodv1zv6L5e1srPXJ+3dmLk=;
        b=trI88suN1huGpv2aw0DCvj3AKIVDgFme8Ljma+mCr6o/fPVTYKfhL4pM+0dicpi3kC
         5Jzl3T2XtjPfj7WUt8KZlzmDw1GvSifJuOe2fkzpNHoO4vPSw7MdWov9zA2SPEM+h97l
         AwAItJI1NQxu9RzLV0LGFZGWVQP3Mfs+8uV5KkRbTaWVen81GHNioy9jZ0Konhpvd1vw
         7ceZDko5jvVQ71ffvFh+9UFKg5hSONmILNwTvD6GSVUXmxd72qkPklKogTtvp6nUg+WW
         JVBik+dshOjRqtc9Hl/jBPAyuaD8BzFmigKASW/+akItm+hhW+fiBgdADvdb23xzPEbT
         A9HA==
X-Gm-Message-State: AOAM531yLTVmM/WAOp9BqEsSacZAuNUqNGWosHqyco4Ww0pzUHkXEujM
        0AMWbkluIvY+cBwOeoK+YxZsiByrOEXiNYog
X-Google-Smtp-Source: ABdhPJycyJzToy4sl4jt2g5F7g/OorB6yaUHvYNuSBYzTCBtuq8ZRObH/x2CU8az8GaccvCIMyDlIw==
X-Received: by 2002:a50:fc18:: with SMTP id i24mr6964296edr.308.1611134794061;
        Wed, 20 Jan 2021 01:26:34 -0800 (PST)
Received: from localhost.localdomain (hst-221-66.medicom.bg. [84.238.221.66])
        by smtp.gmail.com with ESMTPSA id k16sm619392ejd.78.2021.01.20.01.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:26:33 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 3/5] v4l: Add HDR10 static metadata controls
Date:   Wed, 20 Jan 2021 11:26:04 +0200
Message-Id: <20210120092606.3987207-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120092606.3987207-1-stanimir.varbanov@linaro.org>
References: <20210120092606.3987207-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce Content light level and Mastering display colour
volume Colorimetry compound controls with relevant payload
structures and validation.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 67 ++++++++++++++++++++++++++++
 include/media/v4l2-ctrls.h           |  4 ++
 include/uapi/linux/v4l2-controls.h   | 31 +++++++++++++
 include/uapi/linux/videodev2.h       |  3 ++
 4 files changed, 105 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index a5137a867411..089f5e215940 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1205,6 +1205,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	/* Colorimetry controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
 	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
+	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
+	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
 	default:
 		return NULL;
 	}
@@ -1491,6 +1493,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*type = V4L2_CTRL_TYPE_AREA;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
 		break;
+	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:
+		*type = V4L2_CTRL_TYPE_HDR10_CLL_INFO;
+		break;
+	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
+		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
+		break;
 	default:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
@@ -1786,6 +1794,12 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_FWHT_PARAMS:
 		pr_cont("FWHT_PARAMS");
 		break;
+	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
+		pr_cont("HDR10_CLL_INFO");
+		break;
+	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
+		pr_cont("HDR10_MASTERING_DISPLAY");
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
@@ -1838,6 +1852,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
+	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_area *area;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
@@ -2133,6 +2148,52 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		zero_padding(*p_hevc_slice_params);
 		break;
 
+	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
+		break;
+
+	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
+		p_hdr10_mastering = p;
+
+		for (i = 0; i < 3; ++i) {
+			if (p_hdr10_mastering->display_primaries_x[i] <
+				V4L2_HDR10_MASTERING_PRIMARIES_X_LOW ||
+			    p_hdr10_mastering->display_primaries_x[i] >
+				V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH ||
+			    p_hdr10_mastering->display_primaries_y[i] <
+				V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW ||
+			    p_hdr10_mastering->display_primaries_y[i] >
+				V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH)
+				return -EINVAL;
+		}
+
+		if (p_hdr10_mastering->white_point_x <
+			V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW ||
+		    p_hdr10_mastering->white_point_x >
+			V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH ||
+		    p_hdr10_mastering->white_point_y <
+			V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW ||
+		    p_hdr10_mastering->white_point_y >
+			V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH)
+			return -EINVAL;
+
+		if (p_hdr10_mastering->max_display_mastering_luminance <
+			V4L2_HDR10_MASTERING_MAX_LUMA_LOW ||
+		    p_hdr10_mastering->max_display_mastering_luminance >
+			V4L2_HDR10_MASTERING_MAX_LUMA_HIGH ||
+		    p_hdr10_mastering->min_display_mastering_luminance <
+			V4L2_HDR10_MASTERING_MIN_LUMA_LOW ||
+		    p_hdr10_mastering->min_display_mastering_luminance >
+			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
+			return -EINVAL;
+
+		if (p_hdr10_mastering->max_display_mastering_luminance ==
+			V4L2_HDR10_MASTERING_MAX_LUMA_LOW &&
+		    p_hdr10_mastering->min_display_mastering_luminance ==
+			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
+			return -EINVAL;
+
+		break;
+
 	case V4L2_CTRL_TYPE_AREA:
 		area = p;
 		if (!area->width || !area->height)
@@ -2825,6 +2886,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
 		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
 		break;
+	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
+		elem_size = sizeof(struct v4l2_ctrl_hdr10_cll_info);
+		break;
+	case V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY:
+		elem_size = sizeof(struct v4l2_ctrl_hdr10_mastering_display);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 167ca8c8424f..9c3ddbf3d099 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -54,6 +54,8 @@ struct video_device;
  * @p_hevc_sps:			Pointer to an HEVC sequence parameter set structure.
  * @p_hevc_pps:			Pointer to an HEVC picture parameter set structure.
  * @p_hevc_slice_params:	Pointer to an HEVC slice parameters structure.
+ * @p_hdr10_cll:		Pointer to an HDR10 Content Light Level structure.
+ * @p_hdr10_mastering:		Pointer to an HDR10 Mastering Display structure.
  * @p_area:			Pointer to an area.
  * @p:				Pointer to a compound value.
  * @p_const:			Pointer to a constant compound value.
@@ -78,6 +80,8 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
+	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
+	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_area *p_area;
 	void *p;
 	const void *p_const;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index a41039559193..349e86b18af7 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1661,6 +1661,37 @@ struct v4l2_ctrl_fwht_params {
 #define V4L2_CID_COLORIMETRY_CLASS_BASE	(V4L2_CTRL_CLASS_COLORIMETRY | 0x900)
 #define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
 
+#define V4L2_CID_COLORIMETRY_HDR10_CLL_INFO	(V4L2_CID_COLORIMETRY_CLASS_BASE + 0)
+
+struct v4l2_ctrl_hdr10_cll_info {
+	__u16 max_content_light_level;
+	__u16 max_pic_average_light_level;
+};
+
+#define V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY	(V4L2_CID_COLORIMETRY_CLASS_BASE + 1)
+
+#define V4L2_HDR10_MASTERING_PRIMARIES_X_LOW	5
+#define V4L2_HDR10_MASTERING_PRIMARIES_X_HIGH	37000
+#define V4L2_HDR10_MASTERING_PRIMARIES_Y_LOW	5
+#define V4L2_HDR10_MASTERING_PRIMARIES_Y_HIGH	42000
+#define V4L2_HDR10_MASTERING_WHITE_POINT_X_LOW	5
+#define V4L2_HDR10_MASTERING_WHITE_POINT_X_HIGH	37000
+#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_LOW	5
+#define V4L2_HDR10_MASTERING_WHITE_POINT_Y_HIGH	42000
+#define V4L2_HDR10_MASTERING_MAX_LUMA_LOW	50000
+#define V4L2_HDR10_MASTERING_MAX_LUMA_HIGH	100000000
+#define V4L2_HDR10_MASTERING_MIN_LUMA_LOW	1
+#define V4L2_HDR10_MASTERING_MIN_LUMA_HIGH	50000
+
+struct v4l2_ctrl_hdr10_mastering_display {
+	__u16 display_primaries_x[3];
+	__u16 display_primaries_y[3];
+	__u16 white_point_x;
+	__u16 white_point_y;
+	__u32 max_display_mastering_luminance;
+	__u32 min_display_mastering_luminance;
+};
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #ifndef __KERNEL__
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 79dbde3bcf8d..f5f971407b66 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1784,6 +1784,9 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
 
+	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
+	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
+
 	V4L2_CTRL_TYPE_H264_SPS             = 0x0200,
 	V4L2_CTRL_TYPE_H264_PPS		    = 0x0201,
 	V4L2_CTRL_TYPE_H264_SCALING_MATRIX  = 0x0202,
-- 
2.25.1

