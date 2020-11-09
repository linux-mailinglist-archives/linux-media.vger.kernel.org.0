Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 529452AC262
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 18:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732159AbgKIRce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 12:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731859AbgKIRcS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 12:32:18 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27504C0613D4
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 09:32:18 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id cq7so9438518edb.4
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 09:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=iNRzHj9PelsG2iSGOVGYTY9mpu2bcEQftZ5GO4rFbCI=;
        b=oPENIUiBBvq53V9e8Lq0nYu3dojSOJm5X6ry31ClZSQP6nK+TAVGGfHYbC2cmjXoQ4
         xSkXup47wSSyU1EfxcdLpbFNs9EjXltundh+EYtIRVx970I00BCCkaHuaO7PqjiMjUEi
         OzW0HAcs5EvdmWgoya0ezxIJt3YLDUe9sVd4TGqKSIufdAM2lkLETluoFNXDZcl24zzj
         Gvu9jikP9vIU1DdTZOEslGnZbdYIhiC8BFf/1yfhz/dWkmnQXxyXfvQjcDS2EfQZDLYn
         4pbT7B3x9du3aFUkg5Ie+eSlcNLRZpyuksvlDaOLC/uuPeHjjCgH++BTM2KTGYNGSeqg
         2dxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=iNRzHj9PelsG2iSGOVGYTY9mpu2bcEQftZ5GO4rFbCI=;
        b=PWSbpOUmQmEeum/iqQszVloIkGGsa7wGqirV4Ci9tg5cqO0NlCXyas0NWDFgzYh5lr
         Vg3B0asMphTHVMqgiA7xLIH2t1o+Lp0Q3hrzYj51enjjgiSdkuMui0jH74a59UyBz8uc
         9drdPLMVSiS2lz/A7mcaijOF9w7TPJboIPC6o3S5/+gzynZhOhIg0B9/yzA1eNj5QBT+
         Nhknay0lS8sd7KABMP7i1alnhe+nG7cN5BLHKGg2tsdzMcws/fePWhjdP8ddAQN5NN2u
         OVJ/0MRZDgeQ9pYiIc5YrDkmQBLEg3rviyiWw0C4+TFM4Eaa6IIXhB/+tmju9rFRvo7o
         L+tQ==
X-Gm-Message-State: AOAM531UZCgDSMGvWbq0ugE1iOUAHf1Ss5Sh4zRzdIChKI2Ip4LWZFsO
        Qo8Ny1cqWLVujyqESJ0GGxI9bYw7tndmoCHv
X-Google-Smtp-Source: ABdhPJxbS+FBEcfhX6EobRt6dQmVd6oMrPtdkzyQVw7or3u0Q6mpiTtIMWzLwCJX6PQJWhublUvyJw==
X-Received: by 2002:aa7:df04:: with SMTP id c4mr16581201edy.25.1604943136543;
        Mon, 09 Nov 2020 09:32:16 -0800 (PST)
Received: from localhost.localdomain (hst-221-32.medicom.bg. [84.238.221.32])
        by smtp.gmail.com with ESMTPSA id w18sm5037005edq.43.2020.11.09.09.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:32:15 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/3] v4l: Add HDR10 HEVC static metadata controls
Date:   Mon,  9 Nov 2020 19:31:51 +0200
Message-Id: <20201109173153.23720-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
References: <20201109173153.23720-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add Content light level and Mastering display colour volume v4l2
compounf controls, relevant payload structures and validation.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 61 ++++++++++++++++++++++++++++
 include/media/hevc-ctrls.h           | 41 +++++++++++++++++++
 include/media/v4l2-ctrls.h           |  2 +
 3 files changed, 104 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index bd7f330c941c..f70eaa6a46df 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1023,6 +1023,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
 	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
+	case V4L2_CID_MPEG_VIDEO_HEVC_CLL_INFO:			return "HEVC Content Light Info";
+	case V4L2_CID_MPEG_VIDEO_HEVC_MASTERING_DISPLAY:	return "HEVC Mastering Display";
 
 	/* CAMERA controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1461,6 +1463,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:
 		*type = V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS;
 		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_CLL_INFO:
+		*type = V4L2_CTRL_TYPE_HEVC_CLL_INFO;
+		break;
+	case V4L2_CID_MPEG_VIDEO_HEVC_MASTERING_DISPLAY:
+		*type = V4L2_CTRL_TYPE_HEVC_MASTERING_DISPLAY;
+		break;
 	case V4L2_CID_UNIT_CELL_SIZE:
 		*type = V4L2_CTRL_TYPE_AREA;
 		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
@@ -1775,6 +1783,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
+	struct v4l2_ctrl_hevc_mastering_display *p_hevc_mastering;
 	struct v4l2_area *area;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
@@ -1934,6 +1943,52 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		zero_padding(*p_hevc_slice_params);
 		break;
 
+	case V4L2_CTRL_TYPE_HEVC_CLL_INFO:
+		break;
+
+	case V4L2_CTRL_TYPE_HEVC_MASTERING_DISPLAY:
+		p_hevc_mastering = p;
+
+		for (i = 0; i < 3; ++i) {
+			if (p_hevc_mastering->display_primaries_x[i] <
+				V4L2_HEVC_MASTERING_PRIMARIES_X_LOW ||
+			    p_hevc_mastering->display_primaries_x[i] >
+				V4L2_HEVC_MASTERING_PRIMARIES_X_HIGH ||
+			    p_hevc_mastering->display_primaries_y[i] <
+				V4L2_HEVC_MASTERING_PRIMARIES_Y_LOW ||
+			    p_hevc_mastering->display_primaries_y[i] >
+				V4L2_HEVC_MASTERING_PRIMARIES_Y_HIGH)
+				return -EINVAL;
+		}
+
+		if (p_hevc_mastering->white_point_x <
+			V4L2_HEVC_MASTERING_WHITE_POINT_X_LOW ||
+		    p_hevc_mastering->white_point_x >
+			V4L2_HEVC_MASTERING_WHITE_POINT_X_HIGH ||
+		    p_hevc_mastering->white_point_y <
+			V4L2_HEVC_MASTERING_WHITE_POINT_Y_LOW ||
+		    p_hevc_mastering->white_point_y >
+			V4L2_HEVC_MASTERING_WHITE_POINT_Y_HIGH)
+			return -EINVAL;
+
+		if (p_hevc_mastering->max_luminance <
+			V4L2_HEVC_MASTERING_MAX_LUMA_LOW ||
+		    p_hevc_mastering->max_luminance >
+			V4L2_HEVC_MASTERING_MAX_LUMA_HIGH ||
+		    p_hevc_mastering->min_luminance <
+			V4L2_HEVC_MASTERING_MIN_LUMA_LOW ||
+		    p_hevc_mastering->min_luminance >
+			V4L2_HEVC_MASTERING_MIN_LUMA_HIGH)
+			return -EINVAL;
+
+		if (p_hevc_mastering->max_luminance ==
+			V4L2_HEVC_MASTERING_MAX_LUMA_LOW &&
+		    p_hevc_mastering->min_luminance ==
+			V4L2_HEVC_MASTERING_MIN_LUMA_HIGH)
+			return -EINVAL;
+
+		break;
+
 	case V4L2_CTRL_TYPE_AREA:
 		area = p;
 		if (!area->width || !area->height)
@@ -2626,6 +2681,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
 		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
 		break;
+	case V4L2_CTRL_TYPE_HEVC_CLL_INFO:
+		elem_size = sizeof(struct v4l2_ctrl_hevc_cll_info);
+		break;
+	case V4L2_CTRL_TYPE_HEVC_MASTERING_DISPLAY:
+		elem_size = sizeof(struct v4l2_ctrl_hevc_mastering_display);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
diff --git a/include/media/hevc-ctrls.h b/include/media/hevc-ctrls.h
index 1009cf0891cc..d254457d2846 100644
--- a/include/media/hevc-ctrls.h
+++ b/include/media/hevc-ctrls.h
@@ -209,4 +209,45 @@ struct v4l2_ctrl_hevc_slice_params {
 	__u64	flags;
 };
 
+/*
+ * Content light level information.
+ * Source Rec. ITU-T H.265 v7 (11/2019) HEVC; D.2.35
+ */
+#define V4L2_CID_MPEG_VIDEO_HEVC_CLL_INFO	(V4L2_CID_MPEG_BASE + 1017)
+#define V4L2_CTRL_TYPE_HEVC_CLL_INFO		0x0123
+
+struct v4l2_ctrl_hevc_cll_info {
+	__u16 max_content_light_level;
+	__u16 max_pic_average_light_level;
+};
+
+/*
+ * Mastering display colour volume.
+ * Source Rec. ITU-T H.265 v7 (11/2019) HEVC; D.2.28
+ */
+#define V4L2_CID_MPEG_VIDEO_HEVC_MASTERING_DISPLAY (V4L2_CID_MPEG_BASE + 1018)
+#define V4L2_CTRL_TYPE_HEVC_MASTERING_DISPLAY	0x0124
+
+#define V4L2_HEVC_MASTERING_PRIMARIES_X_LOW	5
+#define V4L2_HEVC_MASTERING_PRIMARIES_X_HIGH	37000
+#define V4L2_HEVC_MASTERING_PRIMARIES_Y_LOW	5
+#define V4L2_HEVC_MASTERING_PRIMARIES_Y_HIGH	42000
+#define V4L2_HEVC_MASTERING_WHITE_POINT_X_LOW	5
+#define V4L2_HEVC_MASTERING_WHITE_POINT_X_HIGH	37000
+#define V4L2_HEVC_MASTERING_WHITE_POINT_Y_LOW	5
+#define V4L2_HEVC_MASTERING_WHITE_POINT_Y_HIGH	42000
+#define V4L2_HEVC_MASTERING_MAX_LUMA_LOW	50000
+#define V4L2_HEVC_MASTERING_MAX_LUMA_HIGH	100000000
+#define V4L2_HEVC_MASTERING_MIN_LUMA_LOW	1
+#define V4L2_HEVC_MASTERING_MIN_LUMA_HIGH	50000
+
+struct v4l2_ctrl_hevc_mastering_display {
+	__u16 display_primaries_x[3];
+	__u16 display_primaries_y[3];
+	__u16 white_point_x;
+	__u16 white_point_y;
+	__u32 max_luminance;
+	__u32 min_luminance;
+};
+
 #endif
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index cb25f345e9ad..6120e29945e1 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -80,6 +80,8 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
+	struct v4l2_ctrl_hevc_cll_info *p_hevc_cll;
+	struct v4l2_ctrl_hevc_mastering_display *p_hevc_mastering;
 	struct v4l2_area *p_area;
 	void *p;
 	const void *p_const;
-- 
2.17.1

