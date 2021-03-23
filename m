Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE78345FE8
	for <lists+linux-media@lfdr.de>; Tue, 23 Mar 2021 14:41:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbhCWNlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Mar 2021 09:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbhCWNk6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Mar 2021 09:40:58 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900CBC061574
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:40:58 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z1so23536172edb.8
        for <linux-media@vger.kernel.org>; Tue, 23 Mar 2021 06:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6G+TQj9/qOTQhvcW+oHW6J6wM8+8za0JtehJLRJFECA=;
        b=Dky9rPoYb77CnmyG0aXh1EVDWiLWidRdbfqAjEfm8APOBYCmOw9DgChSPFp59spZJH
         UYv3cvAqwx2EfO6CuktftNiJIanIAKWeLsyYcFuIDX06qRIKgg0MgXPShuBHDyUSoece
         M/m0sqwTUN6b12Ty6+QtdHJPTZOKbqDoyyEAly9WF2Y6blCK0uLQnoMvqxKy08dl9xYI
         Jx7PfK6IU6GlSKVd3kOkehAZwjljIK5dm6HaHI66XNNKum3jyFFYPpFk/NQO8eOtXbh2
         wz8kHloV4Q5QuiuBu5yf6AoN3ntCPUooJCunATMzN4IE5LHWoWqu5ML6+d2kzaOkCCga
         aa8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6G+TQj9/qOTQhvcW+oHW6J6wM8+8za0JtehJLRJFECA=;
        b=uc8h8kEqcc8JklX84swiI+c/MdDvNw1gPWHDB+ZlhKDCEskBFLAZ05qq/V4CqhO6CN
         PO90IIrDXvG+OJeJLn0S91mIk6eg5/WnSUQE7wWpVOnBWju5osdGVAPrQAkJFgLJ5sPg
         Z9RVL4yKSxSLOTSgli/taAS0XSY/qPHBGa8jwAXYJwKqT5AiTkealtCwjQAdrPgFiYbE
         47Y8ugRxY481bwP9adKObRHk7LFmzEA8RNdr3VQeLTzt9J+McaTYhnorcOT/efJyQKEB
         HzltK+c/XH5EB3xo9+SApMKgag1pH4ffXwTTgXcutb8gfp8WZ8fddMyalAPhQ1grSEIL
         gkFg==
X-Gm-Message-State: AOAM532aRZ0ynUoUlTnTMPFtgrXWgsTzCv8PJ/lsoctzppn1ItER5KqD
        BPGc3ygtWoCw3KZo096N1brZ/+Rb1RbnmBOb
X-Google-Smtp-Source: ABdhPJzR8ZvsSFlx0QAocH8/6188B/3nj1MKxmQwegnTTJgIVruLmBURoDhdVe5vmZozOfOxI2oWSw==
X-Received: by 2002:a05:6402:5113:: with SMTP id m19mr4815636edd.78.1616506857079;
        Tue, 23 Mar 2021 06:40:57 -0700 (PDT)
Received: from localhost.localdomain (hst-221-13.medicom.bg. [84.238.221.13])
        by smtp.gmail.com with ESMTPSA id r10sm11207317eju.66.2021.03.23.06.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 06:40:56 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     hverkuil-cisco@xs4all.nl, ezequiel@collabora.com,
        nicolas.dufresne@collabora.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v6 3/5] v4l: Add HDR10 static metadata controls
Date:   Tue, 23 Mar 2021 15:40:38 +0200
Message-Id: <20210323134040.943757-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323134040.943757-1-stanimir.varbanov@linaro.org>
References: <20210323134040.943757-1-stanimir.varbanov@linaro.org>
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
 drivers/media/v4l2-core/v4l2-ctrls.c | 68 ++++++++++++++++++++++++++++
 include/media/v4l2-ctrls.h           |  4 ++
 include/uapi/linux/v4l2-controls.h   | 31 +++++++++++++
 include/uapi/linux/videodev2.h       |  3 ++
 4 files changed, 106 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 41ded74c6764..4e825569a167 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1208,6 +1208,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	/* Colorimetry controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
 	case V4L2_CID_COLORIMETRY_CLASS:	return "Colorimetry Controls";
+	case V4L2_CID_COLORIMETRY_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
+	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
 	default:
 		return NULL;
 	}
@@ -1497,6 +1499,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
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
@@ -1792,6 +1800,12 @@ static void std_log(const struct v4l2_ctrl *ctrl)
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
@@ -1844,6 +1858,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
+	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_area *area;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
@@ -2139,6 +2154,53 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
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
+		/* The following restriction comes from ITU-T Rec. H.265 spec */
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
@@ -2832,6 +2894,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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
index 038c722ca4d2..8cc8cd27936f 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1665,6 +1665,37 @@ struct v4l2_ctrl_fwht_params {
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

