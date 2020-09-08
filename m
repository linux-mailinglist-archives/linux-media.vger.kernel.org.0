Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6255D261585
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 18:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731977AbgIHQwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 12:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732091AbgIHQwM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 12:52:12 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B09EC061349
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 05:33:32 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id y1so2738145ejq.2
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fz+8NPEyMXT6oRM4AXxnNIphaeEA1r9ivq1K+4WHmCo=;
        b=CqzgBHY9cx94bldkCTvaX9pw1Zw3+BqWRMvl7LhavrcR4Z0A0m6AQTAWzRex5/hafs
         7T0pDh1jTPU3AuBzy9Pvi2g6TJsJtio7AKwCvIhNuqy89wQvqrUA3ViDPuT1LMWRpJdP
         3PWpZoIwvZ15sMDJ4a0iFIce7xh9SCKaBPlmQLnIofWqk8dtp2IvAGVY+BV7Nh5e6kYD
         XtqJ8uQKXaZYHRyZMr5JU8xAbr+rGPP6UTMZxaa0i5wKUeVGfcjE9aywD7+btttC4QtK
         pTxf6IqRbdOl+7j8jpyXMKT+t6/8iENb1DxlPEKNF3FWrtnyay8hd34ZPMGQjwdxNtVl
         oikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fz+8NPEyMXT6oRM4AXxnNIphaeEA1r9ivq1K+4WHmCo=;
        b=CfOSRoRLl50md41m7ZtGagBVKqwd6dba6jWD5Hcqy33CldL3kqLqP7tzaJQg853tpg
         cYJuRYYJyR/ZIm4lXLoU+0NVsnE4/suO1hlzcfrKva/yyO10oOyy3B9NHhF64WC+H2Z2
         vOu4yGXVEKJvRSdXp4ZEhVK4LLBep8MXkuTeadubIyPKPWPdLHLlmwMtmFJGew5gj3DA
         BnooFcLeY4LNOMYVSc9C8IPNj4juHf9B3m1bch3mNvamgnSvw5PAWQob9b1wPROSoe1V
         HCcTRIPF1FIPpTOT9K3/rZ5vKef7Hbfdz5rhJoOSllYNAk5X0uqHQQy0BDFA8om2wWs8
         e9+g==
X-Gm-Message-State: AOAM53158yQjJHdqyQzrDUTBkBqw4LGfQQWXBkcq2rj44v6xseUw5bx4
        w/x4qxeuZCAVDGu8U2E5dzraTQ==
X-Google-Smtp-Source: ABdhPJwqC+56xbo1lHcIq1Y83iS0NSzEeBybGIQ8DCgpb1H12AA7ATTLyAmX/ezihA6v5n9h8KQFUQ==
X-Received: by 2002:a17:906:a293:: with SMTP id i19mr7848334ejz.428.1599568411133;
        Tue, 08 Sep 2020 05:33:31 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id y9sm17499744edo.37.2020.09.08.05.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 05:33:30 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        nicolas.dufresne@collabora.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 3/6] venus: helpers: Add a helper to map v4l2 ids to HFI ids
Date:   Tue,  8 Sep 2020 15:32:18 +0300
Message-Id: <20200908123221.2793-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908123221.2793-1-stanimir.varbanov@linaro.org>
References: <20200908123221.2793-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce a helper to set and get profile and levels which
includes the translation between v4l2 ctrl ids and HFI ids.
The input arguments are always in v4l2 ids space.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 239 ++++++++++++++++++++
 drivers/media/platform/qcom/venus/helpers.h |   2 +
 2 files changed, 241 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 7147871d9dc1..50439eb1ffea 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -6,6 +6,7 @@
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <linux/kernel.h>
 #include <media/videobuf2-dma-sg.h>
 #include <media/v4l2-mem2mem.h>
 #include <asm/div64.h>
@@ -582,6 +583,244 @@ int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
 }
 EXPORT_SYMBOL_GPL(venus_helper_get_bufreq);
 
+struct id_mapping {
+	u32 hfi_id;
+	u32 v4l2_id;
+};
+
+static const struct id_mapping mpeg4_profiles[] = {
+	{ HFI_MPEG4_PROFILE_SIMPLE, V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE },
+	{ HFI_MPEG4_PROFILE_ADVANCEDSIMPLE, V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE },
+};
+
+static const struct id_mapping mpeg4_levels[] = {
+	{ HFI_MPEG4_LEVEL_0, V4L2_MPEG_VIDEO_MPEG4_LEVEL_0 },
+	{ HFI_MPEG4_LEVEL_0b, V4L2_MPEG_VIDEO_MPEG4_LEVEL_0B },
+	{ HFI_MPEG4_LEVEL_1, V4L2_MPEG_VIDEO_MPEG4_LEVEL_1 },
+	{ HFI_MPEG4_LEVEL_2, V4L2_MPEG_VIDEO_MPEG4_LEVEL_2 },
+	{ HFI_MPEG4_LEVEL_3, V4L2_MPEG_VIDEO_MPEG4_LEVEL_3 },
+	{ HFI_MPEG4_LEVEL_4, V4L2_MPEG_VIDEO_MPEG4_LEVEL_4 },
+	{ HFI_MPEG4_LEVEL_5, V4L2_MPEG_VIDEO_MPEG4_LEVEL_5 },
+};
+
+static const struct id_mapping mpeg2_profiles[] = {
+	{ HFI_MPEG2_PROFILE_SIMPLE, V4L2_MPEG_VIDEO_MPEG2_PROFILE_SIMPLE },
+	{ HFI_MPEG2_PROFILE_MAIN, V4L2_MPEG_VIDEO_MPEG2_PROFILE_MAIN },
+	{ HFI_MPEG2_PROFILE_SNR, V4L2_MPEG_VIDEO_MPEG2_PROFILE_SNR_SCALABLE },
+	{ HFI_MPEG2_PROFILE_SPATIAL, V4L2_MPEG_VIDEO_MPEG2_PROFILE_SPATIALLY_SCALABLE },
+	{ HFI_MPEG2_PROFILE_HIGH, V4L2_MPEG_VIDEO_MPEG2_PROFILE_HIGH },
+};
+
+static const struct id_mapping mpeg2_levels[] = {
+	{ HFI_MPEG2_LEVEL_LL, V4L2_MPEG_VIDEO_MPEG2_LEVEL_LOW },
+	{ HFI_MPEG2_LEVEL_ML, V4L2_MPEG_VIDEO_MPEG2_LEVEL_MAIN },
+	{ HFI_MPEG2_LEVEL_H14, V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH_1440 },
+	{ HFI_MPEG2_LEVEL_HL, V4L2_MPEG_VIDEO_MPEG2_LEVEL_HIGH },
+};
+
+static const struct id_mapping h264_profiles[] = {
+	{ HFI_H264_PROFILE_BASELINE, V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE },
+	{ HFI_H264_PROFILE_MAIN, V4L2_MPEG_VIDEO_H264_PROFILE_MAIN },
+	{ HFI_H264_PROFILE_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_HIGH },
+	{ HFI_H264_PROFILE_STEREO_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH },
+	{ HFI_H264_PROFILE_MULTIVIEW_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH },
+	{ HFI_H264_PROFILE_CONSTRAINED_BASE, V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE },
+	{ HFI_H264_PROFILE_CONSTRAINED_HIGH, V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH },
+};
+
+static const struct id_mapping h264_levels[] = {
+	{ HFI_H264_LEVEL_1, V4L2_MPEG_VIDEO_H264_LEVEL_1_0 },
+	{ HFI_H264_LEVEL_1b, V4L2_MPEG_VIDEO_H264_LEVEL_1B },
+	{ HFI_H264_LEVEL_11, V4L2_MPEG_VIDEO_H264_LEVEL_1_1 },
+	{ HFI_H264_LEVEL_12, V4L2_MPEG_VIDEO_H264_LEVEL_1_2 },
+	{ HFI_H264_LEVEL_13, V4L2_MPEG_VIDEO_H264_LEVEL_1_3 },
+	{ HFI_H264_LEVEL_2, V4L2_MPEG_VIDEO_H264_LEVEL_2_0 },
+	{ HFI_H264_LEVEL_21, V4L2_MPEG_VIDEO_H264_LEVEL_2_1 },
+	{ HFI_H264_LEVEL_22, V4L2_MPEG_VIDEO_H264_LEVEL_2_2 },
+	{ HFI_H264_LEVEL_3, V4L2_MPEG_VIDEO_H264_LEVEL_3_0 },
+	{ HFI_H264_LEVEL_31, V4L2_MPEG_VIDEO_H264_LEVEL_3_1 },
+	{ HFI_H264_LEVEL_32, V4L2_MPEG_VIDEO_H264_LEVEL_3_2 },
+	{ HFI_H264_LEVEL_4, V4L2_MPEG_VIDEO_H264_LEVEL_4_0 },
+	{ HFI_H264_LEVEL_41, V4L2_MPEG_VIDEO_H264_LEVEL_4_1 },
+	{ HFI_H264_LEVEL_42, V4L2_MPEG_VIDEO_H264_LEVEL_4_2 },
+	{ HFI_H264_LEVEL_5, V4L2_MPEG_VIDEO_H264_LEVEL_5_0 },
+	{ HFI_H264_LEVEL_51, V4L2_MPEG_VIDEO_H264_LEVEL_5_1 },
+	{ HFI_H264_LEVEL_52, V4L2_MPEG_VIDEO_H264_LEVEL_5_1 },
+};
+
+static const struct id_mapping hevc_profiles[] = {
+	{ HFI_HEVC_PROFILE_MAIN, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN },
+	{ HFI_HEVC_PROFILE_MAIN_STILL_PIC, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE },
+	{ HFI_HEVC_PROFILE_MAIN10, V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10 },
+};
+
+static const struct id_mapping hevc_levels[] = {
+	{ HFI_HEVC_LEVEL_1, V4L2_MPEG_VIDEO_HEVC_LEVEL_1 },
+	{ HFI_HEVC_LEVEL_2, V4L2_MPEG_VIDEO_HEVC_LEVEL_2 },
+	{ HFI_HEVC_LEVEL_21, V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1 },
+	{ HFI_HEVC_LEVEL_3, V4L2_MPEG_VIDEO_HEVC_LEVEL_3 },
+	{ HFI_HEVC_LEVEL_31, V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1 },
+	{ HFI_HEVC_LEVEL_4, V4L2_MPEG_VIDEO_HEVC_LEVEL_4 },
+	{ HFI_HEVC_LEVEL_41, V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1 },
+	{ HFI_HEVC_LEVEL_5, V4L2_MPEG_VIDEO_HEVC_LEVEL_5 },
+	{ HFI_HEVC_LEVEL_51, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1 },
+	{ HFI_HEVC_LEVEL_52, V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2 },
+	{ HFI_HEVC_LEVEL_6, V4L2_MPEG_VIDEO_HEVC_LEVEL_6 },
+	{ HFI_HEVC_LEVEL_61, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1 },
+	{ HFI_HEVC_LEVEL_62, V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2 },
+};
+
+static const struct id_mapping vp8_profiles[] = {
+	{ HFI_VPX_PROFILE_VERSION_0, V4L2_MPEG_VIDEO_VP8_PROFILE_0 },
+	{ HFI_VPX_PROFILE_VERSION_1, V4L2_MPEG_VIDEO_VP8_PROFILE_1 },
+	{ HFI_VPX_PROFILE_VERSION_2, V4L2_MPEG_VIDEO_VP8_PROFILE_2 },
+	{ HFI_VPX_PROFILE_VERSION_3, V4L2_MPEG_VIDEO_VP8_PROFILE_3 },
+};
+
+static const struct id_mapping vp9_profiles[] = {
+	{ HFI_VP9_PROFILE_P0, V4L2_MPEG_VIDEO_VP9_PROFILE_0 },
+	{ HFI_VP9_PROFILE_P2_10B, V4L2_MPEG_VIDEO_VP9_PROFILE_2 },
+};
+
+static const struct id_mapping vp9_levels[] = {
+	{ HFI_VP9_LEVEL_1, V4L2_MPEG_VIDEO_VP9_LEVEL_1_0 },
+	{ HFI_VP9_LEVEL_11, V4L2_MPEG_VIDEO_VP9_LEVEL_1_1 },
+	{ HFI_VP9_LEVEL_2, V4L2_MPEG_VIDEO_VP9_LEVEL_2_0},
+	{ HFI_VP9_LEVEL_21, V4L2_MPEG_VIDEO_VP9_LEVEL_2_1 },
+	{ HFI_VP9_LEVEL_3, V4L2_MPEG_VIDEO_VP9_LEVEL_3_0},
+	{ HFI_VP9_LEVEL_31, V4L2_MPEG_VIDEO_VP9_LEVEL_3_1 },
+	{ HFI_VP9_LEVEL_4, V4L2_MPEG_VIDEO_VP9_LEVEL_4_0 },
+	{ HFI_VP9_LEVEL_41, V4L2_MPEG_VIDEO_VP9_LEVEL_4_1 },
+	{ HFI_VP9_LEVEL_5, V4L2_MPEG_VIDEO_VP9_LEVEL_5_0 },
+	{ HFI_VP9_LEVEL_51, V4L2_MPEG_VIDEO_VP9_LEVEL_5_1 },
+	{ HFI_VP9_LEVEL_6, V4L2_MPEG_VIDEO_VP9_LEVEL_6_0 },
+	{ HFI_VP9_LEVEL_61, V4L2_MPEG_VIDEO_VP9_LEVEL_6_1 },
+};
+
+static u32 find_v4l2_id(u32 hfi_id, const struct id_mapping *array, unsigned int array_sz)
+{
+	unsigned int i;
+
+	if (!array || !array_sz)
+		return 0;
+
+	for (i = 0; i < array_sz; i++)
+		if (hfi_id == array[i].hfi_id)
+			return array[i].v4l2_id;
+
+	return 0;
+}
+
+static u32 find_hfi_id(u32 v4l2_id, const struct id_mapping *array, unsigned int array_sz)
+{
+	unsigned int i;
+
+	if (!array || !array_sz)
+		return 0;
+
+	for (i = 0; i < array_sz; i++)
+		if (v4l2_id == array[i].v4l2_id)
+			return array[i].hfi_id;
+
+	return 0;
+}
+
+static void
+v4l2_id_profile_level(u32 hfi_codec, struct hfi_profile_level *pl, u32 *profile, u32 *level)
+{
+	u32 hfi_pf = pl->profile;
+	u32 hfi_lvl = pl->level;
+
+	switch (hfi_codec) {
+	case HFI_VIDEO_CODEC_H264:
+		*profile = find_v4l2_id(hfi_pf, h264_profiles, ARRAY_SIZE(h264_profiles));
+		*level = find_v4l2_id(hfi_lvl, h264_levels, ARRAY_SIZE(h264_levels));
+		break;
+	case HFI_VIDEO_CODEC_MPEG2:
+		*profile = find_v4l2_id(hfi_pf, mpeg2_profiles, ARRAY_SIZE(mpeg2_profiles));
+		*level = find_v4l2_id(hfi_lvl, mpeg2_levels, ARRAY_SIZE(mpeg2_levels));
+		break;
+	case HFI_VIDEO_CODEC_MPEG4:
+		*profile = find_v4l2_id(hfi_pf, mpeg4_profiles, ARRAY_SIZE(mpeg4_profiles));
+		*level = find_v4l2_id(hfi_lvl, mpeg4_levels, ARRAY_SIZE(mpeg4_levels));
+		break;
+	case HFI_VIDEO_CODEC_VP8:
+		*profile = find_v4l2_id(hfi_pf, vp8_profiles, ARRAY_SIZE(vp8_profiles));
+		*level = 0;
+		break;
+	case HFI_VIDEO_CODEC_VP9:
+		*profile = find_v4l2_id(hfi_pf, vp9_profiles, ARRAY_SIZE(vp9_profiles));
+		*level = find_v4l2_id(hfi_lvl, vp9_levels, ARRAY_SIZE(vp9_levels));
+		break;
+	case HFI_VIDEO_CODEC_HEVC:
+		*profile = find_v4l2_id(hfi_pf, hevc_profiles, ARRAY_SIZE(hevc_profiles));
+		*level = find_v4l2_id(hfi_lvl, hevc_levels, ARRAY_SIZE(hevc_levels));
+		break;
+	default:
+		break;
+	}
+}
+
+static void
+hfi_id_profile_level(u32 hfi_codec, u32 v4l2_pf, u32 v4l2_lvl, struct hfi_profile_level *pl)
+{
+	switch (hfi_codec) {
+	case HFI_VIDEO_CODEC_H264:
+		pl->profile = find_hfi_id(v4l2_pf, h264_profiles, ARRAY_SIZE(h264_profiles));
+		pl->level = find_hfi_id(v4l2_lvl, h264_levels, ARRAY_SIZE(h264_levels));
+		break;
+	case HFI_VIDEO_CODEC_MPEG2:
+		pl->profile = find_hfi_id(v4l2_pf, mpeg2_profiles, ARRAY_SIZE(mpeg2_profiles));
+		pl->level = find_hfi_id(v4l2_lvl, mpeg2_levels, ARRAY_SIZE(mpeg2_levels));
+		break;
+	case HFI_VIDEO_CODEC_MPEG4:
+		pl->profile = find_hfi_id(v4l2_pf, mpeg4_profiles, ARRAY_SIZE(mpeg4_profiles));
+		pl->level = find_hfi_id(v4l2_lvl, mpeg4_levels, ARRAY_SIZE(mpeg4_levels));
+		break;
+	case HFI_VIDEO_CODEC_VP8:
+		pl->profile = find_hfi_id(v4l2_pf, vp8_profiles, ARRAY_SIZE(vp8_profiles));
+		pl->level = 0;
+		break;
+	case HFI_VIDEO_CODEC_VP9:
+		pl->profile = find_hfi_id(v4l2_pf, vp9_profiles, ARRAY_SIZE(vp9_profiles));
+		pl->level = find_hfi_id(v4l2_lvl, vp9_levels, ARRAY_SIZE(vp9_levels));
+		break;
+	case HFI_VIDEO_CODEC_HEVC:
+		pl->profile = find_hfi_id(v4l2_pf, hevc_profiles, ARRAY_SIZE(hevc_profiles));
+		pl->level = find_hfi_id(v4l2_lvl, hevc_levels, ARRAY_SIZE(hevc_levels));
+		break;
+	default:
+		break;
+	}
+}
+
+int venus_helper_get_profile_level(struct venus_inst *inst, u32 *profile, u32 *level)
+{
+	const u32 ptype = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT;
+	union hfi_get_property hprop;
+	int ret;
+
+	ret = hfi_session_get_property(inst, ptype, &hprop);
+	if (ret)
+		return ret;
+
+	v4l2_id_profile_level(inst->hfi_codec, &hprop.profile_level, profile, level);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(venus_helper_get_profile_level);
+
+int venus_helper_set_profile_level(struct venus_inst *inst, u32 profile, u32 level)
+{
+	const u32 ptype = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT;
+	struct hfi_profile_level pl;
+
+	hfi_id_profile_level(inst->hfi_codec, profile, level, &pl);
+
+	return hfi_session_set_property(inst, ptype, &pl);
+}
+EXPORT_SYMBOL_GPL(venus_helper_set_profile_level);
+
 static u32 get_framesize_raw_nv12(u32 width, u32 height)
 {
 	u32 y_stride, uv_stride, y_plane;
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 8fbbda12a4fe..a4a0562bc83f 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -61,4 +61,6 @@ int venus_helper_process_initial_cap_bufs(struct venus_inst *inst);
 int venus_helper_process_initial_out_bufs(struct venus_inst *inst);
 void venus_helper_get_ts_metadata(struct venus_inst *inst, u64 timestamp_us,
 				  struct vb2_v4l2_buffer *vbuf);
+int venus_helper_get_profile_level(struct venus_inst *inst, u32 *profile, u32 *level);
+int venus_helper_set_profile_level(struct venus_inst *inst, u32 profile, u32 level);
 #endif
-- 
2.17.1

