Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8F719BCB8
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 09:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728612AbgDBHcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 03:32:18 -0400
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:26035 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727012AbgDBHcS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Apr 2020 03:32:18 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Apr 2020 12:59:17 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 02 Apr 2020 12:59:04 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 102323991; Thu,  2 Apr 2020 12:59:03 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org, jdas@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH] media: venus: Add platform specific capabilities
Date:   Thu,  2 Apr 2020 12:58:52 +0530
Message-Id: <1585812532-28866-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add platform specific capabilities and use them
in place of firmware capabilities.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c       | 155 +++++++++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h       |  32 +++++
 drivers/media/platform/qcom/venus/hfi_helper.h |   3 +
 drivers/media/platform/qcom/venus/hfi_parser.c |   3 +
 4 files changed, 193 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index c7525d9..3bffab2 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -16,6 +16,7 @@
 #include <media/videobuf2-v4l2.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-ioctl.h>
+#include <linux/bitops.h>
 
 #include "core.h"
 #include "firmware.h"
@@ -175,6 +176,134 @@ static int venus_enumerate_codecs(struct venus_core *core, u32 type)
 	return ret;
 }
 
+static void init_codecs(struct venus_core *core)
+{
+	struct venus_caps *caps = core->caps, *cap;
+	unsigned long bit;
+
+	for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
+		cap = &caps[core->codecs_count++];
+		cap->codec = BIT(bit);
+		cap->domain = VIDC_SESSION_TYPE_DEC;
+		cap->valid = false;
+	}
+
+	for_each_set_bit(bit, &core->enc_codecs, MAX_CODEC_NUM) {
+		cap = &caps[core->codecs_count++];
+		cap->codec = BIT(bit);
+		cap->domain = VIDC_SESSION_TYPE_ENC;
+		cap->valid = false;
+	}
+}
+
+static void parse_codecs(struct venus_core *core)
+{
+	const struct venus_resources *res = core->res;
+	const struct venus_codecs *codecs = res->venus_codecs;
+	unsigned int i, codecs_size;
+
+	core->enc_codecs = 0;
+	core->dec_codecs = 0;
+	codecs_size = res->venus_codecs_size;
+
+	for (i = 0; i < codecs_size; i++) {
+		if (codecs[i].domain == VIDC_SESSION_TYPE_ENC)
+			core->enc_codecs |= codecs[i].codecs;
+		else
+			core->dec_codecs |= codecs[i].codecs;
+	}
+
+	init_codecs(core);
+}
+
+static int fill_raw_fmt(struct venus_capability *res_caps,
+			struct venus_caps *core_caps)
+{
+	if ((core_caps->num_pl + 1) == HFI_MAX_PROFILE_COUNT)
+		return -EINVAL;
+
+	core_caps->fmts[core_caps->num_fmts].buftype =
+		res_caps->capability_type;
+	core_caps->fmts[core_caps->num_fmts].fmt =
+		res_caps->defaul_value;
+	core_caps->num_fmts += 1;
+
+	return 0;
+}
+
+static int fill_profile(struct venus_capability *res_caps,
+			struct venus_caps *core_caps)
+{
+	if ((core_caps->num_pl + 1) == HFI_MAX_PROFILE_COUNT)
+		return -EINVAL;
+
+	core_caps->pl[core_caps->num_pl].profile = res_caps->capability_type;
+	core_caps->pl[core_caps->num_pl].level = res_caps->defaul_value;
+	core_caps->num_pl += 1;
+
+	return 0;
+}
+
+static int fill_capabilities(struct venus_capability *res_caps,
+			     struct venus_caps *core_caps)
+{
+	if ((core_caps->num_caps + 1) == MAX_CAP_ENTRIES)
+		return -EINVAL;
+
+	core_caps->caps[core_caps->num_caps].capability_type =
+		res_caps->capability_type;
+	core_caps->caps[core_caps->num_caps].min = res_caps->min;
+	core_caps->caps[core_caps->num_caps].max = res_caps->max;
+	core_caps->caps[core_caps->num_caps].step_size =
+		res_caps->step_size;
+	core_caps->num_caps += 1;
+
+	return 0;
+}
+
+static int fill_caps(struct venus_capability *res_caps,
+		     struct venus_caps *core_caps)
+{
+	if (res_caps->entry_type == CAPABILITY_ENTRY)
+		return fill_capabilities(res_caps, core_caps);
+	else if (res_caps->entry_type == PROFILE_ENTRY)
+		return fill_profile(res_caps, core_caps);
+	else
+		return fill_raw_fmt(res_caps, core_caps);
+}
+
+static void parse_capabilities(struct venus_core *core)
+{
+	struct venus_capability *res_caps = core->res->capabilities;
+	const struct venus_resources *res = core->res;
+	unsigned int i, j, ret;
+	unsigned int res_caps_size = res->capabilities_size;
+	const unsigned int codecs_size = res->venus_codecs_size;
+
+	for (i = 0; i < res_caps_size; i++) {
+		for (j = 0; j < codecs_size; j++) {
+			if ((res_caps[i].domain &
+				core->caps[j].domain) &&
+				(res_caps[i].codecs &
+				core->caps[j].codec)) {
+				ret = fill_caps(&res_caps[i],
+						core->caps);
+				if (!ret)
+					break;
+				}
+			}
+		}
+}
+
+static void venus_parse_resources(struct venus_core *core)
+{
+	if (!IS_V4(core))
+		return;
+
+	parse_codecs(core);
+	parse_capabilities(core);
+}
+
 static int venus_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -272,6 +401,8 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_venus_shutdown;
 
+	venus_parse_resources(core);
+
 	ret = hfi_core_init(core);
 	if (ret)
 		goto err_venus_shutdown;
@@ -371,6 +502,10 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	return hfi_core_resume(core, false);
 }
 
+static struct venus_codecs default_codecs[] = { {DEC, H264}, {DEC, HEVC},
+	{DEC, VP8}, {DEC, MPEG2}, {ENC, H264}, {ENC, HEVC}, {ENC, VP8},
+};
+
 static const struct dev_pm_ops venus_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
@@ -438,6 +573,18 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	.fwname = "qcom/venus-4.2/venus.mdt",
 };
 
+static struct venus_capability sdm845_capabilities[] = {
+/* {cap_type, codecs, domains, min, max, step_size, default} */
+	{ HFI_CAPABILITY_FRAME_WIDTH, CODECS_ALL, DOMAINS_ALL, 96, 5760, 1,
+	96, CAPABILITY_ENTRY },
+	{ HFI_CAPABILITY_FRAME_HEIGHT, CODECS_ALL, DOMAINS_ALL, 96, 5760, 1,
+	96, CAPABILITY_ENTRY },
+	{ HFI_CAPABILITY_FRAMERATE, CODECS_ALL, DOMAINS_ALL, 1, 480, 1, 1,
+	CAPABILITY_ENTRY },
+	{ HFI_CAPABILITY_MAX_VIDEOCORES, CODECS_ALL, DOMAINS_ALL, 1, 2, 1, 1,
+	CAPABILITY_ENTRY },
+};
+
 static const struct freq_tbl sdm845_freq_table[] = {
 	{ 3110400, 533000000 },	/* 4096x2160@90 */
 	{ 2073600, 444000000 },	/* 4096x2160@60 */
@@ -481,6 +628,10 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	.bw_tbl_dec_size = ARRAY_SIZE(sdm845_bw_table_dec),
 	.codec_freq_data = sdm845_codec_freq_data,
 	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
+	.capabilities = sdm845_capabilities,
+	.capabilities_size = ARRAY_SIZE(sdm845_capabilities),
+	.venus_codecs = default_codecs,
+	.venus_codecs_size = ARRAY_SIZE(default_codecs),
 	.clks = {"core", "iface", "bus" },
 	.clks_num = 3,
 	.vcodec0_clks = { "core", "bus" },
@@ -504,6 +655,10 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	.bw_tbl_dec_size = ARRAY_SIZE(sdm845_bw_table_dec),
 	.codec_freq_data = sdm845_codec_freq_data,
 	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
+	.capabilities = sdm845_capabilities,
+	.capabilities_size = ARRAY_SIZE(sdm845_capabilities),
+	.venus_codecs = default_codecs,
+	.venus_codecs_size = ARRAY_SIZE(default_codecs),
 	.clks = {"core", "iface", "bus" },
 	.clks_num = 3,
 	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 55bdeda..e35bbf2 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -17,12 +17,40 @@
 #define VIDC_CLKS_NUM_MAX		4
 #define VIDC_VCODEC_CLKS_NUM_MAX	2
 #define VIDC_PMDOMAINS_NUM_MAX		3
+#define ENC    VIDC_SESSION_TYPE_ENC
+#define DEC    VIDC_SESSION_TYPE_DEC
+#define H264 HFI_VIDEO_CODEC_H264
+#define MPEG2 HFI_VIDEO_CODEC_MPEG2
+#define HEVC HFI_VIDEO_CODEC_HEVC
+#define VP8 HFI_VIDEO_CODEC_VP8
+#define DOMAINS_ALL    (HFI_DOMAIN_BASE_VENC | HFI_DOMAIN_BASE_VDEC)
+#define CODECS_ALL (HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_H264    \
+					| HFI_VIDEO_CODEC_VP8)
+#define CAPABILITY_ENTRY	0
+#define PROFILE_ENTRY	1
+#define FMT_ENTRY	2
 
 struct freq_tbl {
 	unsigned int load;
 	unsigned long freq;
 };
 
+struct venus_codecs {
+	u32 codecs;
+	u32 domain;
+};
+
+struct venus_capability {
+	u32 capability_type;
+	u32 codecs;
+	u32 domain;
+	u32 min;
+	u32 max;
+	u32 step_size;
+	u32 defaul_value;
+	u32 entry_type;
+};
+
 struct reg_val {
 	u32 reg;
 	u32 value;
@@ -63,6 +91,10 @@ struct venus_resources {
 	const char * const vcodec_pmdomains[VIDC_PMDOMAINS_NUM_MAX];
 	unsigned int vcodec_pmdomains_num;
 	unsigned int vcodec_num;
+	struct venus_codecs *venus_codecs;
+	unsigned int venus_codecs_size;
+	struct venus_capability *capabilities;
+	unsigned int capabilities_size;
 	enum hfi_version hfi_version;
 	u32 max_load;
 	unsigned int vmem_id;
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 0b4597c..99fc29e 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -551,6 +551,9 @@ struct hfi_bitrate {
 #define HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS	0x15
 #define HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE		0x16
 #define HFI_CAPABILITY_MAX_VIDEOCORES			0x2b
+#define HFI_CAPABILITY_LCU_SIZE				0x14
+#define HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS	0x15
+#define HFI_CAPABILITY_MBS_PER_SECOND_POWERSAVE		0x16
 
 struct hfi_capability {
 	u32 capability_type;
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 2293d93..c6e1352 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -236,6 +236,9 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
 	if (size % 4)
 		return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
 
+	if (IS_V4(core))
+		return 0;
+
 	parser_init(inst, &codecs, &domain);
 
 	while (words_count) {
-- 
1.9.1

