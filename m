Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E457116858
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2019 09:39:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbfLIIjc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Dec 2019 03:39:32 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46849 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727306AbfLIIjY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Dec 2019 03:39:24 -0500
Received: by mail-lf1-f67.google.com with SMTP id f15so9173831lfl.13
        for <linux-media@vger.kernel.org>; Mon, 09 Dec 2019 00:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=E7OL9HCqlq6FTMnIkypwI+Orss8jA9UZv9drDoXCN7g=;
        b=T/Hcz0DHy/jPRqHKJPkvu53lgWdRoJhzWNiW+rwmc/+guJDxpMbmQ+DQs47qW+aNBK
         iw/VnFeS0pgtq2UHwHb/AuZPVzEDe90Fh5k9V3YE5+Azq/3duK9HcXs6EiRiSEBAZdOB
         tTPnO614bWAGhncbEsHNp2Dmupm/bYtCFlSGHlQZRFU6yfnNaCu7qWcXQ8BGSI9vBUT9
         sgh5ndy+i28vfnryE8GOzD894SIJI+pXL0Lf5ngSjOlT9WXgiCtht/0HBtuWVUkZFJMR
         Pm2PkWKs+kc6WJJmY0lbpfF2kn3NNaGr0VBW9Nf4YiwOrpUUO4a9bi/WM24Ab/d7B1fV
         l0Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=E7OL9HCqlq6FTMnIkypwI+Orss8jA9UZv9drDoXCN7g=;
        b=Td2gvfTfDUjdHppzow2uvkKo3SfQmC4/QOLK9Frbr2SaZdr60UiSY8OXPd+itieMjd
         Ha5H3s6riNR2xbZTpDAxSvnMq/agfAI5IiXOXzqMPf5FPlHdQNGYzkU0PNU+fKCihKsA
         8NVOAi8P2it7UYMr9Bg3CDzWHLEZdLEOqOYpQGiZbQ2tkt+J9qapAMguXwSF6D0LCpgQ
         nx+CKMiPAAlroaWoxPJ0AdYr27mDOw7WiOP07QCy7Pdvz1up7pdQoPAv4/VkKKRiqowz
         cZZrPoy8QIBf3mo3qMuAf0OXn/RXdkVc4sQwaPcWWI80Zwf139fp4UCTledWcDuFsoXl
         lc3Q==
X-Gm-Message-State: APjAAAWrwLFkHec20wksfC6MBYltfOtj+CMJAYXR1Ur+3IBTJg7F3PsN
        vhdd+S4UAOu8WKvAa28oevcmpkqRjyg=
X-Google-Smtp-Source: APXvYqz9xkSLnDb+4BqrI+ki6aeRrtCLVeW9AByrjOWC9meOxrhoxNU0ECrfOFl0eR5A7Y0iGbzQ2g==
X-Received: by 2002:a19:5201:: with SMTP id m1mr13047865lfb.114.1575880762176;
        Mon, 09 Dec 2019 00:39:22 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id r26sm10438971lfm.82.2019.12.09.00.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 00:39:21 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Aniket Masule <amasule@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 6/6] media: venus: vdec: handle 10bit bitstreams
Date:   Mon,  9 Dec 2019 10:38:24 +0200
Message-Id: <20191209083824.806-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209083824.806-1-stanimir.varbanov@linaro.org>
References: <20191209083824.806-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Aniket Masule <amasule@codeaurora.org>

Handle 10bit video streams in the decoder by using dithering, i.e
the decoder output buffers will be in 8bit format.

The runtime handling is implemented by sending v4l2 event to
userspace application, then the application should stop the
streaming on capture queue and initiate format negotiation, and
start streaming again.

Signed-off-by: Aniket Masule <amasule@codeaurora.org>
Co-developed-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/helpers.c   | 97 +++++++++++++++++++
 .../media/platform/qcom/venus/hfi_helper.h    |  5 +
 drivers/media/platform/qcom/venus/vdec.c      |  8 +-
 4 files changed, 110 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7efa5669dda3..8f71646df4c8 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -378,6 +378,7 @@ struct venus_inst {
 	u32 session_type;
 	union hfi_get_property hprop;
 	unsigned int core_acquired: 1;
+	unsigned int bit_depth;
 };
 
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 043e0d8705a8..a29662405e3a 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -626,6 +626,76 @@ static u32 get_framesize_raw_nv12_ubwc(u32 width, u32 height)
 		     max(extradata, y_stride * 48), SZ_4K);
 }
 
+static u32 get_framesize_raw_p010(u32 width, u32 height)
+{
+	u32 y_plane, uv_plane, y_stride, uv_stride, y_sclines, uv_sclines;
+
+	y_stride = ALIGN(width * 2, 256);
+	uv_stride = ALIGN(width * 2, 256);
+	y_sclines = ALIGN(height, 32);
+	uv_sclines = ALIGN((height + 1) >> 1, 16);
+	y_plane = y_stride * y_sclines;
+	uv_plane = uv_stride * uv_sclines;
+
+	return ALIGN((y_plane + uv_plane), SZ_4K);
+}
+
+static u32 get_framesize_raw_p010_ubwc(u32 width, u32 height)
+{
+	u32 y_stride, uv_stride, y_sclines, uv_sclines;
+	u32 y_ubwc_plane, uv_ubwc_plane;
+	u32 y_meta_stride, y_meta_scanlines;
+	u32 uv_meta_stride, uv_meta_scanlines;
+	u32 y_meta_plane, uv_meta_plane;
+	u32 size;
+
+	y_stride = ALIGN(width * 2, 256);
+	uv_stride = ALIGN(width * 2, 256);
+	y_sclines = ALIGN(height, 16);
+	uv_sclines = ALIGN((height + 1) >> 1, 16);
+
+	y_ubwc_plane = ALIGN(y_stride * y_sclines, SZ_4K);
+	uv_ubwc_plane = ALIGN(uv_stride * uv_sclines, SZ_4K);
+	y_meta_stride = ALIGN(DIV_ROUND_UP(width, 32), 64);
+	y_meta_scanlines = ALIGN(DIV_ROUND_UP(height, 4), 16);
+	y_meta_plane = ALIGN(y_meta_stride * y_meta_scanlines, SZ_4K);
+	uv_meta_stride = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 16), 64);
+	uv_meta_scanlines = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 4), 16);
+	uv_meta_plane = ALIGN(uv_meta_stride * uv_meta_scanlines, SZ_4K);
+
+	size = y_ubwc_plane + uv_ubwc_plane + y_meta_plane + uv_meta_plane;
+
+	return ALIGN(size, SZ_4K);
+}
+
+static u32 get_framesize_raw_yuv420_tp10_ubwc(u32 width, u32 height)
+{
+	u32 y_stride, uv_stride, y_sclines, uv_sclines;
+	u32 y_ubwc_plane, uv_ubwc_plane;
+	u32 y_meta_stride, y_meta_scanlines;
+	u32 uv_meta_stride, uv_meta_scanlines;
+	u32 y_meta_plane, uv_meta_plane;
+	u32 size;
+
+	y_stride = ALIGN(ALIGN(width, 192) * 4 / 3, 256);
+	uv_stride = ALIGN(ALIGN(width, 192) * 4 / 3, 256);
+	y_sclines = ALIGN(height, 16);
+	uv_sclines = ALIGN((height + 1) >> 1, 16);
+
+	y_ubwc_plane = ALIGN(y_stride * y_sclines, SZ_4K);
+	uv_ubwc_plane = ALIGN(uv_stride * uv_sclines, SZ_4K);
+	y_meta_stride = ALIGN(DIV_ROUND_UP(width, 48), 64);
+	y_meta_scanlines = ALIGN(DIV_ROUND_UP(height, 4), 16);
+	y_meta_plane = ALIGN(y_meta_stride * y_meta_scanlines, SZ_4K);
+	uv_meta_stride = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 24), 64);
+	uv_meta_scanlines = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 4), 16);
+	uv_meta_plane = ALIGN(uv_meta_stride * uv_meta_scanlines, SZ_4K);
+
+	size = y_ubwc_plane + uv_ubwc_plane + y_meta_plane + uv_meta_plane;
+
+	return ALIGN(size, SZ_4K);
+}
+
 u32 venus_helper_get_framesz_raw(u32 hfi_fmt, u32 width, u32 height)
 {
 	switch (hfi_fmt) {
@@ -634,6 +704,12 @@ u32 venus_helper_get_framesz_raw(u32 hfi_fmt, u32 width, u32 height)
 		return get_framesize_raw_nv12(width, height);
 	case HFI_COLOR_FORMAT_NV12_UBWC:
 		return get_framesize_raw_nv12_ubwc(width, height);
+	case HFI_COLOR_FORMAT_P010:
+		return get_framesize_raw_p010(width, height);
+	case HFI_COLOR_FORMAT_P010_UBWC:
+		return get_framesize_raw_p010_ubwc(width, height);
+	case HFI_COLOR_FORMAT_YUV420_TP10_UBWC:
+		return get_framesize_raw_yuv420_tp10_ubwc(width, height);
 	default:
 		return 0;
 	}
@@ -1235,6 +1311,27 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 v4l2_fmt,
 	if (!caps)
 		return -EINVAL;
 
+	if (inst->bit_depth == VIDC_BITDEPTH_10 &&
+	    inst->session_type == VIDC_SESSION_TYPE_DEC) {
+		found_ubwc =
+			find_fmt_from_caps(caps, HFI_BUFFER_OUTPUT,
+					   HFI_COLOR_FORMAT_YUV420_TP10_UBWC);
+		found = find_fmt_from_caps(caps, HFI_BUFFER_OUTPUT2,
+					   HFI_COLOR_FORMAT_NV12);
+		if (found_ubwc && found) {
+			/*
+			 * Hard-code DPB buffers to be 10bit UBWC and decoder
+			 * output buffers in 8bit NV12 until V4L2 is able to
+			 * expose compressed/tiled formats to applications.
+			 */
+			*out_fmt = HFI_COLOR_FORMAT_YUV420_TP10_UBWC;
+			*out2_fmt = HFI_COLOR_FORMAT_NV12;
+			return 0;
+		}
+
+		return -EINVAL;
+	}
+
 	if (ubwc) {
 		ubwc_fmt = fmt | HFI_COLOR_FORMAT_UBWC_BASE;
 		found_ubwc = find_fmt_from_caps(caps, HFI_BUFFER_OUTPUT,
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 2a47f6c0a07a..0b4597c73fb5 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -793,6 +793,9 @@ struct hfi_h264_vui_timing_info {
 	u32 time_scale;
 };
 
+#define VIDC_BITDEPTH_8		0
+#define VIDC_BITDEPTH_10	1
+
 struct hfi_bit_depth {
 	u32 buffer_type;
 	u32 bit_depth;
@@ -841,8 +844,10 @@ struct hfi_extradata_input_crop {
 #define HFI_COLOR_FORMAT_10_BIT_BASE		0x4000
 
 #define HFI_COLOR_FORMAT_YUV420_TP10		0x4002
+#define HFI_COLOR_FORMAT_P010			0x4003
 #define HFI_COLOR_FORMAT_NV12_UBWC		0x8002
 #define HFI_COLOR_FORMAT_YUV420_TP10_UBWC	0xc002
+#define HFI_COLOR_FORMAT_P010_UBWC		0xc003
 #define HFI_COLOR_FORMAT_RGBA8888_UBWC		0x8010
 
 struct hfi_uncompressed_format_select {
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 7b7a4f3377cf..eeff0d8e46b2 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1172,7 +1172,7 @@ static void vdec_buf_done(struct venus_inst *inst, unsigned int buf_type,
 static void vdec_event_change(struct venus_inst *inst,
 			      struct hfi_event_data *ev_data, bool sufficient)
 {
-	static const struct v4l2_event ev = {
+	struct v4l2_event ev = {
 		.type = V4L2_EVENT_SOURCE_CHANGE,
 		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION };
 	struct device *dev = inst->core->dev_dec;
@@ -1193,6 +1193,11 @@ static void vdec_event_change(struct venus_inst *inst,
 	inst->out_width = ev_data->width;
 	inst->out_height = ev_data->height;
 
+	if (inst->bit_depth != ev_data->bit_depth) {
+		inst->bit_depth = ev_data->bit_depth;
+		ev.u.src_change.changes |= V4L2_EVENT_SRC_CH_COLOR_DEPTH;
+	}
+
 	dev_dbg(dev, "event %s sufficient resources (%ux%u)\n",
 		sufficient ? "" : "not", ev_data->width, ev_data->height);
 
@@ -1340,6 +1345,7 @@ static int vdec_open(struct file *file)
 	inst->buf_count = 0;
 	inst->clk_data.core_id = VIDC_CORE_ID_DEFAULT;
 	inst->core_acquired = false;
+	inst->bit_depth = VIDC_BITDEPTH_8;
 	init_waitqueue_head(&inst->reconf_wait);
 	venus_helper_init_instance(inst);
 
-- 
2.17.1

