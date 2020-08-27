Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E30254239
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 11:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgH0J0f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 05:26:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728172AbgH0JZC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 05:25:02 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD3DC061264
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:01 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f7so4674039wrw.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3FII5mw0VzWoI7LKwzll1h13k48S3nEFtjYUczgFCSA=;
        b=pcKiuc8dOwRu0SpM8qcAw2KtCrxFBAK1fRScFb6KbHTvqRudWRrAHuRsdsEBnnxCCk
         ur8KU7Muo/SCTRHHGLBPXmo4azw+rn0worU/RW31B8rOXZvyoMoQFSqp060SHXXP7pXp
         JCZd++Yo/eEyZeu3Q1gOU5gaCso7OmOYu+nuVRMFoFlMvEj0MdU0XAdyL1EmfxEjReIY
         szotCkKRr4y+0H9GtrwaGnqUj+JUmXYikC+zdpOARAUGB4F8xnpr08krbBoUNQXgRhnY
         Fih2PJWj162GirbT7oPRfa0zJ3MnXKIOHNm2bDJrUD0Hvj+iFFA06oWALpxYwO373ie5
         +CWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3FII5mw0VzWoI7LKwzll1h13k48S3nEFtjYUczgFCSA=;
        b=BIOMvDpDTrkkHvkqw/1fAsbVvgn2JaTwMOqUESolgJ8ORxVFX1iv4X8awFPgDNE3e7
         TNhBkH3oLhFu/+OBonN/7vV1365XTrjyhhOTVBWAkylPfYa8bvwNs+K0OgGwuBMEwCpt
         dlmQ3I2GlpdX21gcVl1GszyPqKYW4w+PF1/kxsq0HXY3Gp8uys9o28k+wSXtwiXBjTZA
         IGnmaIo3Liu50WAbIvrItRQkfcZ6Rs7R8d3GGnNA3T+kr3mMhn3g5mR5Hu8TOcDc1pHE
         CjeLQneC/DYVnkkqvSq3TIhLURm303WAlsAhTu7MerhhX2yL9WMrWLWePuYBLWCaWKXY
         DzSg==
X-Gm-Message-State: AOAM531nm4Sa/9GhF6zlYGcAFEUYZ/yuiWcBjqTIHznL1tRQzv2WWu2F
        t09wlzXivat56uTpvqcV85qLNg==
X-Google-Smtp-Source: ABdhPJzNOczN2xCEQvMxqq8h+Xpb/PrTjWWsHoEuN4ZuN3tzpoY92LtjIRZtvCJQEC10JFnpE6RIqA==
X-Received: by 2002:a5d:46ce:: with SMTP id g14mr20510892wrs.188.1598520299962;
        Thu, 27 Aug 2020 02:24:59 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z203sm4357330wmc.31.2020.08.27.02.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:24:59 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 03/13] venus: Create hfi platform and move vpp/vsp there
Date:   Thu, 27 Aug 2020 12:24:07 +0300
Message-Id: <20200827092417.16040-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
References: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduce a new hfi platform to cover differences between hfi
versions. As a start move vpp/vsp freq data in that hfi
platform, more platform data will come later.

Co-developed-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/Makefile    |  3 +-
 drivers/media/platform/qcom/venus/core.c      | 17 ------
 drivers/media/platform/qcom/venus/core.h      | 12 +---
 drivers/media/platform/qcom/venus/helpers.c   | 54 ++++++++---------
 drivers/media/platform/qcom/venus/helpers.h   |  2 +-
 .../media/platform/qcom/venus/hfi_platform.c  | 49 +++++++++++++++
 .../media/platform/qcom/venus/hfi_platform.h  | 34 +++++++++++
 .../platform/qcom/venus/hfi_platform_v4.c     | 60 +++++++++++++++++++
 .../media/platform/qcom/venus/pm_helpers.c    |  9 +--
 drivers/media/platform/qcom/venus/vdec.c      |  8 +--
 drivers/media/platform/qcom/venus/venc.c      |  6 +-
 11 files changed, 179 insertions(+), 75 deletions(-)
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform.c
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform.h
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v4.c

diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
index dfc636865709..09ebf4671692 100644
--- a/drivers/media/platform/qcom/venus/Makefile
+++ b/drivers/media/platform/qcom/venus/Makefile
@@ -3,7 +3,8 @@
 
 venus-core-objs += core.o helpers.o firmware.o \
 		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
-		   hfi_parser.o pm_helpers.o dbgfs.o
+		   hfi_parser.o pm_helpers.o dbgfs.o \
+		   hfi_platform.o hfi_platform_v4.o \
 
 venus-dec-objs += vdec.o vdec_ctrls.o
 venus-enc-objs += venc.o venc_ctrls.o
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 6606c6144e03..0f6651597711 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -465,17 +465,6 @@ static const struct freq_tbl sdm845_freq_table[] = {
 	{  244800, 100000000 },	/* 1920x1080@30 */
 };
 
-static const struct codec_freq_data sdm845_codec_freq_data[] =  {
-	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
-	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
-	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
-	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 10 },
-	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 10 },
-	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 10 },
-	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 10 },
-	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10 },
-};
-
 static const struct bw_tbl sdm845_bw_table_enc[] = {
 	{ 1944000, 1612000, 0, 2416000, 0 },	/* 3840x2160@60 */
 	{  972000,  951000, 0, 1434000, 0 },	/* 3840x2160@30 */
@@ -497,8 +486,6 @@ static const struct venus_resources sdm845_res = {
 	.bw_tbl_enc_size = ARRAY_SIZE(sdm845_bw_table_enc),
 	.bw_tbl_dec = sdm845_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sdm845_bw_table_dec),
-	.codec_freq_data = sdm845_codec_freq_data,
-	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
 	.clks = {"core", "iface", "bus" },
 	.clks_num = 3,
 	.vcodec0_clks = { "core", "bus" },
@@ -520,8 +507,6 @@ static const struct venus_resources sdm845_res_v2 = {
 	.bw_tbl_enc_size = ARRAY_SIZE(sdm845_bw_table_enc),
 	.bw_tbl_dec = sdm845_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sdm845_bw_table_dec),
-	.codec_freq_data = sdm845_codec_freq_data,
-	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
 	.clks = {"core", "iface", "bus" },
 	.clks_num = 3,
 	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
@@ -571,8 +556,6 @@ static const struct venus_resources sc7180_res = {
 	.bw_tbl_enc_size = ARRAY_SIZE(sc7180_bw_table_enc),
 	.bw_tbl_dec = sc7180_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sc7180_bw_table_dec),
-	.codec_freq_data = sdm845_codec_freq_data,
-	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
 	.clks = {"core", "iface", "bus" },
 	.clks_num = 3,
 	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 18cf5b329a2b..ac947f1486a6 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -34,13 +34,6 @@ struct reg_val {
 	u32 value;
 };
 
-struct codec_freq_data {
-	u32 pixfmt;
-	u32 session_type;
-	unsigned long vpp_freq;
-	unsigned long vsp_freq;
-};
-
 struct bw_tbl {
 	u32 mbs_per_sec;
 	u32 avg;
@@ -59,8 +52,6 @@ struct venus_resources {
 	unsigned int bw_tbl_dec_size;
 	const struct reg_val *reg_tbl;
 	unsigned int reg_tbl_size;
-	const struct codec_freq_data *codec_freq_data;
-	unsigned int codec_freq_data_size;
 	const char * const clks[VIDC_CLKS_NUM_MAX];
 	unsigned int clks_num;
 	const char * const vcodec0_clks[VIDC_VCODEC_CLKS_NUM_MAX];
@@ -261,7 +252,8 @@ struct venus_buffer {
 struct clock_data {
 	u32 core_id;
 	unsigned long freq;
-	const struct codec_freq_data *codec_freq_data;
+	unsigned long vpp_freq;
+	unsigned long vsp_freq;
 };
 
 #define to_venus_buffer(ptr)	container_of(ptr, struct venus_buffer, vb)
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 7147871d9dc1..15ca59583b02 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -14,6 +14,7 @@
 #include "helpers.h"
 #include "hfi_helper.h"
 #include "pm_helpers.h"
+#include "hfi_platform.h"
 
 struct intbuf {
 	struct list_head list;
@@ -801,36 +802,6 @@ int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode)
 }
 EXPORT_SYMBOL_GPL(venus_helper_set_work_mode);
 
-int venus_helper_init_codec_freq_data(struct venus_inst *inst)
-{
-	const struct codec_freq_data *data;
-	unsigned int i, data_size;
-	u32 pixfmt;
-	int ret = 0;
-
-	if (!IS_V4(inst->core))
-		return 0;
-
-	data = inst->core->res->codec_freq_data;
-	data_size = inst->core->res->codec_freq_data_size;
-	pixfmt = inst->session_type == VIDC_SESSION_TYPE_DEC ?
-			inst->fmt_out->pixfmt : inst->fmt_cap->pixfmt;
-
-	for (i = 0; i < data_size; i++) {
-		if (data[i].pixfmt == pixfmt &&
-		    data[i].session_type == inst->session_type) {
-			inst->clk_data.codec_freq_data = &data[i];
-			break;
-		}
-	}
-
-	if (!inst->clk_data.codec_freq_data)
-		ret = -EINVAL;
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(venus_helper_init_codec_freq_data);
-
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
 			      unsigned int output2_bufs)
@@ -1290,6 +1261,29 @@ void venus_helper_m2m_job_abort(void *priv)
 }
 EXPORT_SYMBOL_GPL(venus_helper_m2m_job_abort);
 
+int venus_helper_session_init(struct venus_inst *inst)
+{
+	enum hfi_version version = inst->core->res->hfi_version;
+	u32 session_type = inst->session_type;
+	u32 codec;
+	int ret;
+
+	codec = inst->session_type == VIDC_SESSION_TYPE_DEC ?
+			inst->fmt_out->pixfmt : inst->fmt_cap->pixfmt;
+
+	ret = hfi_session_init(inst, codec);
+	if (ret)
+		return ret;
+
+	inst->clk_data.vpp_freq = hfi_platform_get_codec_vpp_freq(version, codec,
+								  session_type);
+	inst->clk_data.vsp_freq = hfi_platform_get_codec_vsp_freq(version, codec,
+								  session_type);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(venus_helper_session_init);
+
 void venus_helper_init_instance(struct venus_inst *inst)
 {
 	if (inst->session_type == VIDC_SESSION_TYPE_DEC) {
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 8fbbda12a4fe..470d48662855 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -33,7 +33,6 @@ int venus_helper_set_output_resolution(struct venus_inst *inst,
 				       unsigned int width, unsigned int height,
 				       u32 buftype);
 int venus_helper_set_work_mode(struct venus_inst *inst, u32 mode);
-int venus_helper_init_codec_freq_data(struct venus_inst *inst);
 int venus_helper_set_num_bufs(struct venus_inst *inst, unsigned int input_bufs,
 			      unsigned int output_bufs,
 			      unsigned int output2_bufs);
@@ -48,6 +47,7 @@ unsigned int venus_helper_get_opb_size(struct venus_inst *inst);
 void venus_helper_acquire_buf_ref(struct vb2_v4l2_buffer *vbuf);
 void venus_helper_release_buf_ref(struct venus_inst *inst, unsigned int idx);
 void venus_helper_init_instance(struct venus_inst *inst);
+int venus_helper_session_init(struct venus_inst *inst);
 int venus_helper_get_out_fmts(struct venus_inst *inst, u32 fmt, u32 *out_fmt,
 			      u32 *out2_fmt, bool ubwc);
 int venus_helper_alloc_dpb_bufs(struct venus_inst *inst);
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
new file mode 100644
index 000000000000..65559cae21aa
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/hfi_platform.c
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+#include "hfi_platform.h"
+
+const struct hfi_platform *hfi_platform_get(enum hfi_version version)
+{
+	switch (version) {
+	case HFI_VERSION_4XX:
+		return &hfi_plat_v4;
+	default:
+		break;
+	}
+
+	return NULL;
+}
+
+unsigned long
+hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec, u32 session_type)
+{
+	const struct hfi_platform *plat;
+	unsigned long freq = 0;
+
+	plat = hfi_platform_get(version);
+	if (!plat)
+		return 0;
+
+	if (plat->codec_vpp_freq)
+		freq = plat->codec_vpp_freq(session_type, codec);
+
+	return freq;
+}
+
+unsigned long
+hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session_type)
+{
+	const struct hfi_platform *plat;
+	unsigned long freq = 0;
+
+	plat = hfi_platform_get(version);
+	if (!plat)
+		return 0;
+
+	if (plat->codec_vpp_freq)
+		freq = plat->codec_vsp_freq(session_type, codec);
+
+	return freq;
+}
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
new file mode 100644
index 000000000000..8b07ecbb4c82
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __HFI_PLATFORM_H__
+#define __HFI_PLATFORM_H__
+
+#include <linux/types.h>
+#include <linux/videodev2.h>
+
+#include "hfi.h"
+#include "hfi_helper.h"
+
+struct hfi_platform_codec_freq_data {
+	u32 pixfmt;
+	u32 session_type;
+	unsigned long vpp_freq;
+	unsigned long vsp_freq;
+};
+
+struct hfi_platform {
+	unsigned long (*codec_vpp_freq)(u32 session_type, u32 codec);
+	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec);
+};
+
+extern const struct hfi_platform hfi_plat_v4;
+
+const struct hfi_platform *hfi_platform_get(enum hfi_version version);
+unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
+					      u32 session_type);
+unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec,
+					      u32 session_type);
+#endif
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
new file mode 100644
index 000000000000..4fc2fd04ca9d
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
@@ -0,0 +1,60 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+#include "hfi_platform.h"
+
+static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
+	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
+	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 10 },
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 10 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 10 },
+	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 10 },
+	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10 },
+};
+
+static const struct hfi_platform_codec_freq_data *
+get_codec_freq_data(u32 session_type, u32 pixfmt)
+{
+	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
+	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
+	const struct hfi_platform_codec_freq_data *found = NULL;
+
+	for (i = 0; i < data_size; i++) {
+		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
+			found = &data[i];
+			break;
+		}
+	}
+
+	return found;
+}
+
+static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
+{
+	const struct hfi_platform_codec_freq_data *data;
+
+	data = get_codec_freq_data(session_type, codec);
+	if (data)
+		return data->vpp_freq;
+
+	return 0;
+}
+
+static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
+{
+	const struct hfi_platform_codec_freq_data *data;
+
+	data = get_codec_freq_data(session_type, codec);
+	if (data)
+		return data->vsp_freq;
+
+	return 0;
+}
+
+const struct hfi_platform hfi_plat_v4 = {
+	.codec_vpp_freq = codec_vpp_freq,
+	.codec_vsp_freq = codec_vsp_freq,
+};
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index 57877eacecf0..87df419dd827 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -18,6 +18,7 @@
 #include "hfi_parser.h"
 #include "hfi_venus_io.h"
 #include "pm_helpers.h"
+#include "hfi_platform.h"
 
 static bool legacy_binding;
 
@@ -500,7 +501,7 @@ min_loaded_core(struct venus_inst *inst, u32 *min_coreid, u32 *min_load)
 		if (inst_pos->state != INST_START)
 			continue;
 
-		vpp_freq = inst_pos->clk_data.codec_freq_data->vpp_freq;
+		vpp_freq = inst_pos->clk_data.vpp_freq;
 		coreid = inst_pos->clk_data.core_id;
 
 		mbs_per_sec = load_per_instance(inst_pos);
@@ -549,7 +550,7 @@ static int decide_core(struct venus_inst *inst)
 		return 0;
 
 	inst_load = load_per_instance(inst);
-	inst_load *= inst->clk_data.codec_freq_data->vpp_freq;
+	inst_load *= inst->clk_data.vpp_freq;
 	max_freq = core->res->freq_tbl[0].freq;
 
 	min_loaded_core(inst, &min_coreid, &min_load);
@@ -930,10 +931,10 @@ static unsigned long calculate_inst_freq(struct venus_inst *inst,
 
 	mbs_per_sec = load_per_instance(inst) / fps;
 
-	vpp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vpp_freq;
+	vpp_freq = mbs_per_sec * inst->clk_data.vpp_freq;
 	/* 21 / 20 is overhead factor */
 	vpp_freq += vpp_freq / 20;
-	vsp_freq = mbs_per_sec * inst->clk_data.codec_freq_data->vsp_freq;
+	vsp_freq = mbs_per_sec * inst->clk_data.vsp_freq;
 
 	/* 10 / 7 is overhead factor */
 	if (inst->session_type == VIDC_SESSION_TYPE_ENC)
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 3cd24ca37ad9..be3bcba2643b 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -737,21 +737,15 @@ static int vdec_session_init(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = hfi_session_init(inst, inst->fmt_out->pixfmt);
+	ret = venus_helper_session_init(inst);
 	if (ret == -EINVAL)
 		return 0;
-	else if (ret)
-		return ret;
 
 	ret = venus_helper_set_input_resolution(inst, frame_width_min(inst),
 						frame_height_min(inst));
 	if (ret)
 		goto deinit;
 
-	ret = venus_helper_init_codec_freq_data(inst);
-	if (ret)
-		goto deinit;
-
 	return 0;
 deinit:
 	hfi_session_deinit(inst);
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index ed00d0f5e813..0137a2978a1d 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -850,7 +850,7 @@ static int venc_init_session(struct venus_inst *inst)
 {
 	int ret;
 
-	ret = hfi_session_init(inst, inst->fmt_cap->pixfmt);
+	ret = venus_helper_session_init(inst);
 	if (ret)
 		return ret;
 
@@ -869,10 +869,6 @@ static int venc_init_session(struct venus_inst *inst)
 	if (ret)
 		goto deinit;
 
-	ret = venus_helper_init_codec_freq_data(inst);
-	if (ret)
-		goto deinit;
-
 	ret = venc_set_properties(inst);
 	if (ret)
 		goto deinit;
-- 
2.17.1

