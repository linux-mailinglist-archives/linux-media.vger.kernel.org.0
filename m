Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF873B8E93
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 10:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235165AbhGAIIj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 04:08:39 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:49778 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235116AbhGAIIi (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 04:08:38 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 01 Jul 2021 01:06:08 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 01 Jul 2021 01:06:06 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 01 Jul 2021 13:36:05 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 23DF121A68; Thu,  1 Jul 2021 13:36:05 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v2 3/7] media: venus: Add num_vpp_pipes to resource structure
Date:   Thu,  1 Jul 2021 13:35:32 +0530
Message-Id: <1625126736-16266-4-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625126736-16266-1-git-send-email-dikshita@codeaurora.org>
References: <1625126736-16266-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V6 HW can have vpp pipes as 1 or 4, add num_vpp_pipes
to resource struture to differentiate.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c            |  2 ++
 drivers/media/platform/qcom/venus/core.h            |  1 +
 drivers/media/platform/qcom/venus/helpers.c         |  2 +-
 drivers/media/platform/qcom/venus/hfi_platform.c    | 13 -------------
 drivers/media/platform/qcom/venus/hfi_platform.h    |  2 --
 drivers/media/platform/qcom/venus/hfi_platform_v6.c |  6 ------
 6 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 68acfc0..2e75fc7 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -729,6 +729,7 @@ static const struct venus_resources sm8250_res = {
 	.vcodec_num = 1,
 	.max_load = 7833600,
 	.hfi_version = HFI_VERSION_6XX,
+	.num_vpp_pipes = 4,
 	.vmem_id = VIDC_RESOURCE_NONE,
 	.vmem_size = 0,
 	.vmem_addr = 0,
@@ -780,6 +781,7 @@ static const struct venus_resources sc7280_res = {
 	.opp_pmdomain = (const char *[]) { "cx", NULL },
 	.vcodec_num = 1,
 	.hfi_version = HFI_VERSION_6XX,
+	.num_vpp_pipes = 1,
 	.vmem_id = VIDC_RESOURCE_NONE,
 	.vmem_size = 0,
 	.vmem_addr = 0,
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 745f226..1ff20d9 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -68,6 +68,7 @@ struct venus_resources {
 	const char * const resets[VIDC_RESETS_NUM_MAX];
 	unsigned int resets_num;
 	enum hfi_version hfi_version;
+	u8 num_vpp_pipes;
 	u32 max_load;
 	unsigned int vmem_id;
 	u32 vmem_size;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index b813d6dba..2223f55 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -583,7 +583,7 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
 		return -EINVAL;
 
 	params.version = version;
-	params.num_vpp_pipes = hfi_platform_num_vpp_pipes(version);
+	params.num_vpp_pipes = inst->core->res->num_vpp_pipes;
 
 	if (is_dec) {
 		params.width = inst->width;
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
index 8f47804..683ab67 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform.c
@@ -50,16 +50,3 @@ hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec, u32 session
 	return freq;
 }
 
-u8 hfi_platform_num_vpp_pipes(enum hfi_version version)
-{
-	const struct hfi_platform *plat;
-
-	plat = hfi_platform_get(version);
-	if (!plat)
-		return 0;
-
-	if (plat->num_vpp_pipes)
-		return plat->num_vpp_pipes();
-
-	return 0;
-}
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index 3819bb2..ef768bf 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -50,7 +50,6 @@ struct hfi_platform {
 	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec);
 	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count);
 	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries);
-	u8 (*num_vpp_pipes)(void);
 	int (*bufreq)(struct hfi_plat_buffers_params *params, u32 session_type,
 		      u32 buftype, struct hfi_buffer_requirements *bufreq);
 };
@@ -63,5 +62,4 @@ unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 code
 					      u32 session_type);
 unsigned long hfi_platform_get_codec_vsp_freq(enum hfi_version version, u32 codec,
 					      u32 session_type);
-u8 hfi_platform_num_vpp_pipes(enum hfi_version version);
 #endif
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
index dd1a039..c1f00f8 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
@@ -311,16 +311,10 @@ static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
 	return 0;
 }
 
-static u8 num_vpp_pipes(void)
-{
-	return 4;
-}
-
 const struct hfi_platform hfi_plat_v6 = {
 	.codec_vpp_freq = codec_vpp_freq,
 	.codec_vsp_freq = codec_vsp_freq,
 	.codecs = get_codecs,
 	.capabilities = get_capabilities,
-	.num_vpp_pipes = num_vpp_pipes,
 	.bufreq = hfi_plat_bufreq_v6,
 };
-- 
2.7.4

