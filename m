Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8954D2C1926
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 00:15:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388153AbgKWXDY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 18:03:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733244AbgKWXDX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 18:03:23 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019FCC061A4E
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 15:03:20 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id h21so1076216wmb.2
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 15:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=B8tFpClQae7S/QF6hyKYnJwDqktAypaLM7qcZTYY+Ko=;
        b=K5VTPWU2nZ6WkSVaJgD8uOTRzCuIXJb9C8E6uKmsjlXITdRNnm+AsYkthh+ZJfXuD6
         gq38WWzv0DP5lvBTmFe5oy1hLzfhwyGws1MLBQB2cTOVVPQv+7ux9EBO767jhF0yImuD
         Tsv9SjFXWqPhK2iF04IjyzWXcE2cSGwheFwpiyzZUxtH+R593C+rPtfL3sP2E9/YQUbZ
         HZQVly4smLGgDYKoLNs7ApHTUXkUfuuyeRkIXpR/je3lMOsxWyx661vv1XTPIU8VRNmC
         MDEv8j1AqBdN/rw143NxPcUpEm8SuO9Ov0cX/1poeIpfuzB4rAkS2ZPbR3kSLrL3yp5v
         457g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=B8tFpClQae7S/QF6hyKYnJwDqktAypaLM7qcZTYY+Ko=;
        b=nAMjcw8se0MGUJA51OF9WszEdaJYGVqiMU3ufaIlZr9TZPfbDPSf1GG0lAo0AaMC9L
         kV6+F3XKk9YySGPcjAFy9YSbv6SyAzKbsLdS3w2Kf+p54uZQr5y77ct4x2VMaVGcyEgu
         4ZDL28f1NgXTVHhvyNO/NH4ca/E3nQDq98JylcqDaTDAXf90FAlrv3bkMM4+a+H6+7QI
         X43InW4wn5QxWX/5Tldns9jGhJkAmyljomFU22XVUQ5v4N2KFc19FuEdqc+AOZB2PAAm
         PUuxytte/8anR4etYcrZbVa5+wN/dz+dSvYk0ie/5ADCcjI/Xe3M5ZFp1yTYpZCjOUOR
         I0TQ==
X-Gm-Message-State: AOAM5314cx/FK64oCP2LacJlXS1qlHXMgfHSUtN7N+fBslWS4R8IM4OX
        DB6YIme+6E7ri6dWHmgJBdIE87xwK4g/jo2e
X-Google-Smtp-Source: ABdhPJxW8rLZ5frMnhpEXswnoKRMFK9KXwSTCbsfCI6PWj56BHQMpi3lWlqgA3HgH6XpXhSHDg9VwA==
X-Received: by 2002:a1c:ddd7:: with SMTP id u206mr1160056wmg.27.1606172599393;
        Mon, 23 Nov 2020 15:03:19 -0800 (PST)
Received: from localhost.localdomain (hst-221-74.medicom.bg. [84.238.221.74])
        by smtp.gmail.com with ESMTPSA id q66sm1501463wme.6.2020.11.23.15.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 15:03:18 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 1/3] v4l: Add HDR10 static metadata controls
Date:   Tue, 24 Nov 2020 01:02:55 +0200
Message-Id: <20201123230257.31690-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201123230257.31690-1-stanimir.varbanov@linaro.org>
References: <20201123230257.31690-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add Content light level and Mastering display colour volume v4l2
compounf controls, relevant payload structures and validation.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 62 ++++++++++++++++++++++++++++
 include/media/hdr10-ctrls.h          | 55 ++++++++++++++++++++++++
 include/media/v4l2-ctrls.h           |  3 ++
 3 files changed, 120 insertions(+)
 create mode 100644 include/media/hdr10-ctrls.h

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index ad47d00e28d6..028630576401 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1024,6 +1024,9 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
 	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
 
+	case V4L2_CID_MPEG_VIDEO_HDR10_CLL_INFO:		return "HDR10 Content Light Info";
+	case V4L2_CID_MPEG_VIDEO_HDR10_MASTERING_DISPLAY:	return "HDR10 Mastering Display";
+
 	/* CAMERA controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
 	case V4L2_CID_CAMERA_CLASS:		return "Camera Controls";
@@ -1461,6 +1464,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
 		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
 		break;
+	case V4L2_CID_MPEG_VIDEO_HDR10_CLL_INFO:
+		*type = V4L2_CTRL_TYPE_HDR10_CLL_INFO;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HDR10_MASTERING_DISPLAY:
+		*type = V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY;
+		break;
 	case V4L2_CID_UNIT_CELL_SIZE:
 		*type = V4L2_CTRL_TYPE_AREA;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
@@ -1775,6 +1784,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
+	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_area *area;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
@@ -1934,6 +1944,52 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
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
+		if (p_hdr10_mastering->max_luminance <
+			V4L2_HDR10_MASTERING_MAX_LUMA_LOW ||
+		    p_hdr10_mastering->max_luminance >
+			V4L2_HDR10_MASTERING_MAX_LUMA_HIGH ||
+		    p_hdr10_mastering->min_luminance <
+			V4L2_HDR10_MASTERING_MIN_LUMA_LOW ||
+		    p_hdr10_mastering->min_luminance >
+			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
+			return -EINVAL;
+
+		if (p_hdr10_mastering->max_luminance ==
+			V4L2_HDR10_MASTERING_MAX_LUMA_LOW &&
+		    p_hdr10_mastering->min_luminance ==
+			V4L2_HDR10_MASTERING_MIN_LUMA_HIGH)
+			return -EINVAL;
+
+		break;
+
 	case V4L2_CTRL_TYPE_AREA:
 		area = p;
 		if (!area->width || !area->height)
@@ -2626,6 +2682,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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
diff --git a/include/media/hdr10-ctrls.h b/include/media/hdr10-ctrls.h
new file mode 100644
index 000000000000..f6f77edc0b60
--- /dev/null
+++ b/include/media/hdr10-ctrls.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * These are the HEVC state controls for use with stateless HEVC
+ * codec drivers.
+ *
+ * It turns out that these structs are not stable yet and will undergo
+ * more changes. So keep them private until they are stable and ready to
+ * become part of the official public API.
+ */
+
+#ifndef _HDR10_CTRLS_H_
+#define _HDR10_CTRLS_H_
+
+/*
+ * Content light level information.
+ * Source Rec. ITU-T H.265 v7 (11/2019) HEVC; D.2.35
+ */
+#define V4L2_CID_MPEG_VIDEO_HDR10_CLL_INFO	(V4L2_CID_MPEG_BASE + 1017)
+#define V4L2_CTRL_TYPE_HDR10_CLL_INFO		0x0123
+
+struct v4l2_ctrl_hdr10_cll_info {
+	__u16 max_content_light_level;
+	__u16 max_pic_average_light_level;
+};
+
+/*
+ * Mastering display colour volume.
+ * Source Rec. ITU-T H.265 v7 (11/2019) HEVC; D.2.28
+ */
+#define V4L2_CID_MPEG_VIDEO_HDR10_MASTERING_DISPLAY (V4L2_CID_MPEG_BASE + 1018)
+#define V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	0x0124
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
+	__u32 max_luminance;
+	__u32 min_luminance;
+};
+
+#endif
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 4fbace0fc7e5..81bd026fc1ea 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -19,6 +19,7 @@
  */
 #include <media/mpeg2-ctrls.h>
 #include <media/fwht-ctrls.h>
+#include <media/hdr10-ctrls.h>
 #include <media/h264-ctrls.h>
 #include <media/vp8-ctrls.h>
 #include <media/hevc-ctrls.h>
@@ -80,6 +81,8 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
+	struct v4l2_ctrl_hdr10_cll_info *p_hdr10_cll;
+	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_area *p_area;
 	void *p;
 	const void *p_const;
-- 
2.17.1

