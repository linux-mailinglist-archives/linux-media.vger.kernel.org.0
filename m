Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD4DE21EDB8
	for <lists+linux-media@lfdr.de>; Tue, 14 Jul 2020 12:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbgGNKQC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jul 2020 06:16:02 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:45008 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgGNKQC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jul 2020 06:16:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
  s=qcdkim; t=1594721762; x=1626257762;
  h=from:to:cc:subject:date:message-id;
  bh=mJQgl+Wih/Npohxk2QCbcNtLC2MU8snCzsF5it6GMmE=;
  b=bQleqQ6i6GEZalmkPAEAnfEKNPyxRZ7II8ItCgfAKsWYSF0NcXvuvIBU
   nLsIGS7MP4+cRQ2XsDDC0L1jS6S4MMgEBKmWxazNzDq2pqZi+lFhAu6bq
   z5+PktutNzk7PHOul9CCsPLlWGsa3hDaUIpU/JCVC7cU+lGAs1JccxSgL
   c=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 14 Jul 2020 03:16:01 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Jul 2020 03:15:59 -0700
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Jul 2020 15:45:43 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 40C3E411B; Tue, 14 Jul 2020 15:45:42 +0530 (IST)
From:   Dikshita Agarwal <dikshita@qti.qualcomm.com>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v3] venus: move platform specific data to platform file
Date:   Tue, 14 Jul 2020 15:45:40 +0530
Message-Id: <1594721740-17617-1-git-send-email-dikshita@qti.qualcomm.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Move all data specific to platform into a separate file.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/Makefile       |  3 +-
 drivers/media/platform/qcom/venus/core.c         | 20 ++-----
 drivers/media/platform/qcom/venus/core.h         | 12 +----
 drivers/media/platform/qcom/venus/helpers.c      | 31 +----------
 drivers/media/platform/qcom/venus/helpers.h      |  1 -
 drivers/media/platform/qcom/venus/hfi_platform.c | 66 ++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/hfi_platform.h | 28 ++++++++++
 drivers/media/platform/qcom/venus/pm_helpers.c   |  1 +
 drivers/media/platform/qcom/venus/vdec.c         |  3 +-
 drivers/media/platform/qcom/venus/venc.c         |  3 +-
 10 files changed, 107 insertions(+), 61 deletions(-)
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform.c
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform.h

diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
index dfc6368..c8f0e39 100644
--- a/drivers/media/platform/qcom/venus/Makefile
+++ b/drivers/media/platform/qcom/venus/Makefile
@@ -3,7 +3,8 @@
 
 venus-core-objs += core.o helpers.o firmware.o \
 		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
-		   hfi_parser.o pm_helpers.o dbgfs.o
+		   hfi_parser.o pm_helpers.o dbgfs.o \
+		   hfi_platform.o
 
 venus-dec-objs += vdec.o vdec_ctrls.o
 venus-enc-objs += venc.o venc_ctrls.o
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index bbb394c..2245a0e 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -20,6 +20,7 @@
 #include "core.h"
 #include "firmware.h"
 #include "pm_helpers.h"
+#include "hfi_platform.h"
 
 static void venus_event_notify(struct venus_core *core, u32 event)
 {
@@ -222,6 +223,8 @@ static int venus_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	core->hfi_plat = hfi_platform_get(core->res->hfi_version);
+
 	ret = dma_set_mask_and_coherent(dev, core->res->dma_mask);
 	if (ret)
 		return ret;
@@ -461,17 +464,6 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
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
@@ -493,8 +485,6 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	.bw_tbl_enc_size = ARRAY_SIZE(sdm845_bw_table_enc),
 	.bw_tbl_dec = sdm845_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sdm845_bw_table_dec),
-	.codec_freq_data = sdm845_codec_freq_data,
-	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
 	.clks = {"core", "iface", "bus" },
 	.clks_num = 3,
 	.vcodec0_clks = { "core", "bus" },
@@ -516,8 +506,6 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	.bw_tbl_enc_size = ARRAY_SIZE(sdm845_bw_table_enc),
 	.bw_tbl_dec = sdm845_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sdm845_bw_table_dec),
-	.codec_freq_data = sdm845_codec_freq_data,
-	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
 	.clks = {"core", "iface", "bus" },
 	.clks_num = 3,
 	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
@@ -562,8 +550,6 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	.bw_tbl_enc_size = ARRAY_SIZE(sc7180_bw_table_enc),
 	.bw_tbl_dec = sc7180_bw_table_dec,
 	.bw_tbl_dec_size = ARRAY_SIZE(sc7180_bw_table_dec),
-	.codec_freq_data = sdm845_codec_freq_data,
-	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
 	.clks = {"core", "iface", "bus" },
 	.clks_num = 3,
 	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 82438f1..c8f0824 100644
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
@@ -176,6 +167,7 @@ struct venus_core {
 	bool sys_error;
 	const struct hfi_core_ops *core_ops;
 	const struct venus_pm_ops *pm_ops;
+	const struct hfi_platform *hfi_plat;
 	struct mutex pm_lock;
 	unsigned long enc_codecs;
 	unsigned long dec_codecs;
@@ -256,7 +248,7 @@ struct venus_buffer {
 struct clock_data {
 	u32 core_id;
 	unsigned long freq;
-	const struct codec_freq_data *codec_freq_data;
+	const struct hfi_platform_codec_freq_data *codec_freq_data;
 };
 
 #define to_venus_buffer(ptr)	container_of(ptr, struct venus_buffer, vb)
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 115a9a2..712d0ed 100644
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
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index 8fbbda1..9c83c91 100644
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
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
new file mode 100644
index 0000000..5ffadfe
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/hfi_platform.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+#include "hfi_platform.h"
+#include "core.h"
+
+static struct hfi_platform_codec_freq_data hfi_plat_codec_freq_data_v4[] =  {
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
+static const struct hfi_platform hfi_plat_v4 = {
+	.hfi_plat_codec_freq_data = hfi_plat_codec_freq_data_v4,
+	.hfi_plat_codec_freq_data_size =
+		ARRAY_SIZE(hfi_plat_codec_freq_data_v4),
+};
+
+const struct hfi_platform *hfi_platform_get
+	(enum hfi_version version)
+{
+	switch (version) {
+	case HFI_VERSION_4XX:
+		return &hfi_plat_v4;
+	default:
+		return NULL;
+	}
+	return NULL;
+}
+
+int hfi_platform_init_codec_freq_data(struct venus_inst *inst)
+{
+	const struct hfi_platform_codec_freq_data *data;
+	unsigned int i, data_size;
+	u32 pixfmt;
+	int ret = 0;
+
+	if (!IS_V4(inst->core))
+		return 0;
+
+	data = inst->core->hfi_plat->hfi_plat_codec_freq_data;
+	data_size = inst->core->hfi_plat->hfi_plat_codec_freq_data_size;
+
+	pixfmt = inst->session_type == VIDC_SESSION_TYPE_DEC ?
+			inst->fmt_out->pixfmt : inst->fmt_cap->pixfmt;
+
+	for (i = 0; i < data_size; i++) {
+		if (data[i].pixfmt == pixfmt &&
+		    data[i].session_type == inst->session_type) {
+			inst->clk_data.codec_freq_data = &data[i];
+			break;
+		}
+	}
+
+	if (!inst->clk_data.codec_freq_data)
+		ret = -EINVAL;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(hfi_platform_init_codec_freq_data);
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
new file mode 100644
index 0000000..3f869f8
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __HFI_PLATFORM_H__
+#define __HFI_PLATFORM_H__
+
+#include "core.h"
+
+struct hfi_platform_codec_freq_data {
+	u32 pixfmt;
+	u32 session_type;
+	unsigned long vpp_freq;
+	unsigned long vsp_freq;
+};
+
+struct hfi_platform {
+	const struct hfi_platform_codec_freq_data *hfi_plat_codec_freq_data;
+	unsigned int hfi_plat_codec_freq_data_size;
+};
+
+const struct hfi_platform *hfi_platform_get
+	(enum hfi_version version);
+int hfi_platform_init_codec_freq_data(struct venus_inst *inst);
+
+#endif
+
diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index f33fc70..7fae9a4 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -17,6 +17,7 @@
 #include "hfi_parser.h"
 #include "hfi_venus_io.h"
 #include "pm_helpers.h"
+#include "hfi_platform.h"
 
 static bool legacy_binding;
 
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 7959e45..4219ea9 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -21,6 +21,7 @@
 #include "helpers.h"
 #include "vdec.h"
 #include "pm_helpers.h"
+#include "hfi_platform.h"
 
 /*
  * Three resons to keep MPLANE formats (despite that the number of planes
@@ -748,7 +749,7 @@ static int vdec_session_init(struct venus_inst *inst)
 	if (ret)
 		goto deinit;
 
-	ret = venus_helper_init_codec_freq_data(inst);
+	ret = hfi_platform_init_codec_freq_data(inst);
 	if (ret)
 		goto deinit;
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index c591d00..8f9e2a3 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -21,6 +21,7 @@
 #include "helpers.h"
 #include "venc.h"
 #include "pm_helpers.h"
+#include "hfi_platform.h"
 
 #define NUM_B_FRAMES_MAX	4
 
@@ -849,7 +850,7 @@ static int venc_init_session(struct venus_inst *inst)
 	if (ret)
 		goto deinit;
 
-	ret = venus_helper_init_codec_freq_data(inst);
+	ret = hfi_platform_init_codec_freq_data(inst);
 	if (ret)
 		goto deinit;
 
-- 
1.9.1

