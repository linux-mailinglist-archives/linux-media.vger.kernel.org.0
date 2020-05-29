Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B9D21E767D
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 09:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725993AbgE2HS5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 03:18:57 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:21985 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725833AbgE2HS4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 03:18:56 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 May 2020 12:48:52 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 29 May 2020 12:48:52 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 8F46C3B73; Fri, 29 May 2020 12:48:51 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, majja@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH] venus: Add platform specific capabilities
Date:   Fri, 29 May 2020 12:48:29 +0530
Message-Id: <1590736709-508-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add platform specific capabilities and use them
in place of firmware capabilities.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c           |   3 +
 drivers/media/platform/qcom/venus/hfi_helper.h     |   3 +-
 drivers/media/platform/qcom/venus/hfi_parser.c     |  21 +--
 .../media/platform/qcom/venus/hfi_platform_data.c  | 153 ++++++++++++++++++++-
 .../media/platform/qcom/venus/hfi_platform_data.h  |  37 ++++-
 5 files changed, 193 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 4fde4aa..8221e5c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -273,6 +273,9 @@ static int venus_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_venus_shutdown;
 
+	if (core->hfi_data && core->hfi_data->venus_parse_resources)
+		venus_parse_resources(core);
+
 	ret = hfi_core_init(core);
 	if (ret)
 		goto err_venus_shutdown;
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index f6613df..1671012 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -520,7 +520,8 @@
 enum hfi_version {
 	HFI_VERSION_1XX,
 	HFI_VERSION_3XX,
-	HFI_VERSION_4XX
+	HFI_VERSION_4XX,
+	HFI_VERSION_6XX
 };
 
 struct hfi_buffer_info {
diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index 7f515a4..b4b60e1 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -10,30 +10,11 @@
 #include "core.h"
 #include "hfi_helper.h"
 #include "hfi_parser.h"
+#include "hfi_platform_data.h"
 
 typedef void (*func)(struct venus_caps *cap, const void *data,
 		     unsigned int size);
 
-static void init_codecs(struct venus_core *core)
-{
-	struct venus_caps *caps = core->caps, *cap;
-	unsigned long bit;
-
-	for_each_set_bit(bit, &core->dec_codecs, MAX_CODEC_NUM) {
-		cap = &caps[core->codecs_count++];
-		cap->codec = BIT(bit);
-		cap->domain = VIDC_SESSION_TYPE_DEC;
-		cap->valid = false;
-	}
-
-	for_each_set_bit(bit, &core->enc_codecs, MAX_CODEC_NUM) {
-		cap = &caps[core->codecs_count++];
-		cap->codec = BIT(bit);
-		cap->domain = VIDC_SESSION_TYPE_ENC;
-		cap->valid = false;
-	}
-}
-
 static void for_each_codec(struct venus_caps *caps, unsigned int caps_num,
 			   u32 codecs, u32 domain, func cb, void *data,
 			   unsigned int size)
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_data.c b/drivers/media/platform/qcom/venus/hfi_platform_data.c
index 9d9035f..fc838f5 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_data.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_data.c
@@ -5,8 +5,132 @@
 #include "hfi_platform_data.h"
 #include "core.h"
 
+void init_codecs(struct venus_core *core)
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
+	const struct venus_hfi_platform_data *hfi_data = core->hfi_data;
+	const struct venus_codecs *codecs = hfi_data->venus_codecs;
+	unsigned int i, codecs_size;
+
+	core->enc_codecs = 0;
+	core->dec_codecs = 0;
+	codecs_size = hfi_data->venus_codecs_size;
+
+	for (i = 0; i < codecs_size; i++) {
+		if (codecs[i].domain == VIDC_SESSION_TYPE_ENC)
+			core->enc_codecs |= codecs[i].codecs;
+		else
+			core->dec_codecs |= codecs[i].codecs;
+	}
+	init_codecs(core);
+}
+
+static int fill_raw_fmt(struct venus_capability *hfi_data_caps,
+			struct venus_caps *core_caps)
+{
+	if ((core_caps->num_pl + 1) == HFI_MAX_PROFILE_COUNT)
+		return -EINVAL;
+
+	core_caps->fmts[core_caps->num_fmts].buftype =
+		hfi_data_caps->capability_type;
+	core_caps->fmts[core_caps->num_fmts].fmt =
+		hfi_data_caps->defaul_value;
+	core_caps->num_fmts += 1;
+
+	return 0;
+}
+
+static int fill_profile(struct venus_capability *hfi_data_caps,
+			struct venus_caps *core_caps)
+{
+	if ((core_caps->num_pl + 1) == HFI_MAX_PROFILE_COUNT)
+		return -EINVAL;
+
+	core_caps->pl[core_caps->num_pl].profile =
+		hfi_data_caps->capability_type;
+	core_caps->pl[core_caps->num_pl].level = hfi_data_caps->defaul_value;
+	core_caps->num_pl += 1;
+
+	return 0;
+}
+
+static int fill_capabilities(struct venus_capability *hfi_data_caps,
+			     struct venus_caps *core_caps)
+{
+	if ((core_caps->num_caps + 1) == MAX_CAP_ENTRIES)
+		return -EINVAL;
+
+	core_caps->caps[core_caps->num_caps].capability_type =
+		hfi_data_caps->capability_type;
+	core_caps->caps[core_caps->num_caps].min = hfi_data_caps->min;
+	core_caps->caps[core_caps->num_caps].max = hfi_data_caps->max;
+	core_caps->caps[core_caps->num_caps].step_size =
+		hfi_data_caps->step_size;
+	core_caps->num_caps += 1;
+	return 0;
+}
+
+static int fill_caps(struct venus_capability *hfi_data_caps,
+		     struct venus_caps *core_caps)
+{
+	if (hfi_data_caps->entry_type == CAPABILITY_ENTRY)
+		return fill_capabilities(hfi_data_caps, core_caps);
+	else if (hfi_data_caps->entry_type == PROFILE_ENTRY)
+		return fill_profile(hfi_data_caps, core_caps);
+	else
+		return fill_raw_fmt(hfi_data_caps, core_caps);
+}
+
+static void parse_capabilities(struct venus_core *core)
+{
+	unsigned int i, j, ret;
+	const struct venus_hfi_platform_data *hfi_data = core->hfi_data;
+	struct venus_capability *hfi_data_caps = hfi_data->capabilities;
+	unsigned int hfi_data_caps_size = hfi_data->capabilities_size;
+	const unsigned int codecs_size = hfi_data->venus_codecs_size;
+
+	for (i = 0; i < hfi_data_caps_size; i++) {
+		for (j = 0; j < codecs_size; j++) {
+			if ((hfi_data_caps[i].domain &
+				core->caps[j].domain) &&
+				(hfi_data_caps[i].codecs &
+				core->caps[j].codec)) {
+				ret = fill_caps(&hfi_data_caps[i],
+						core->caps);
+				if (!ret)
+					break;
+			}
+		}
+	}
+}
+
+void venus_parse_resources(struct venus_core *core)
+{
+	parse_codecs(core);
+	parse_capabilities(core);
+}
+
 static struct codec_freq_data hfi4_codec_freq_data[] =  {
-{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
 	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
 	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 10 },
 	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 10 },
@@ -16,20 +140,45 @@
 	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 10 },
 };
 
+static struct venus_codecs default_codecs[] = { {DEC, H264}, {DEC, HEVC},
+	{DEC, VP8}, {DEC, MPEG2}, {ENC, H264}, {ENC, HEVC}, {ENC, VP8},
+};
+
+static struct venus_capability hfi6_capabilities[] = {
+	/* {cap_type, codecs, domains, min, max, step_size, default} */
+	{ HFI_CAPABILITY_FRAME_WIDTH, CODECS_ALL, DOMAINS_ALL, 96, 5760, 1,
+		96, CAPABILITY_ENTRY },
+	{ HFI_CAPABILITY_FRAME_HEIGHT, CODECS_ALL, DOMAINS_ALL, 96, 5760, 1,
+		96, CAPABILITY_ENTRY },
+	{ HFI_CAPABILITY_FRAMERATE, CODECS_ALL, DOMAINS_ALL, 1, 480, 1,
+		1, CAPABILITY_ENTRY },
+	{ HFI_CAPABILITY_MAX_VIDEOCORES, CODECS_ALL, DOMAINS_ALL, 1, 2, 1,
+		1, CAPABILITY_ENTRY },
+};
+
 static const struct venus_hfi_platform_data hfi4_data = {
 	.codec_freq_data = hfi4_codec_freq_data,
 	.codec_freq_data_size = ARRAY_SIZE(hfi4_codec_freq_data),
 };
 
+static const struct venus_hfi_platform_data hfi6_data = {
+	.venus_codecs = default_codecs,
+	.venus_codecs_size = ARRAY_SIZE(default_codecs),
+	.capabilities = hfi6_capabilities,
+	.capabilities_size = ARRAY_SIZE(hfi6_capabilities),
+	.venus_parse_resources = venus_parse_resources,
+};
+
 const struct venus_hfi_platform_data *venus_get_hfi_platform
 	(enum hfi_version version)
 {
 	switch (version) {
 	case HFI_VERSION_4XX:
 		return &hfi4_data;
+	case HFI_VERSION_6XX:
+		return &hfi6_data;
 	default:
 		return NULL;
 	}
 	return NULL;
 }
-
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_data.h b/drivers/media/platform/qcom/venus/hfi_platform_data.h
index 1b4bfb6..55de59b 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_data.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform_data.h
@@ -8,6 +8,19 @@
 
 #include "core.h"
 
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
+
 struct codec_freq_data {
 	u32 pixfmt;
 	u32 session_type;
@@ -15,13 +28,35 @@ struct codec_freq_data {
 	unsigned long vsp_freq;
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
 struct venus_hfi_platform_data {
 	const struct codec_freq_data *codec_freq_data;
 	unsigned int codec_freq_data_size;
+	struct venus_codecs *venus_codecs;
+	unsigned int venus_codecs_size;
+	struct venus_capability *capabilities;
+	unsigned int capabilities_size;
+	void (*venus_parse_resources)(struct venus_core *core);
 };
 
 const struct venus_hfi_platform_data *venus_get_hfi_platform
 	(enum hfi_version version);
+void venus_parse_resources(struct venus_core *core);
+void init_codecs(struct venus_core *core);
 
 #endif
-
-- 
1.9.1

