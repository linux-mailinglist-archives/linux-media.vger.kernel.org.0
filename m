Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC919388AC1
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 11:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345413AbhESJim (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 05:38:42 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:51417 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344975AbhESJik (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 05:38:40 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 19 May 2021 02:37:17 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 19 May 2021 02:37:16 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 19 May 2021 15:07:14 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 358DF219DC; Wed, 19 May 2021 15:07:13 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH 1/7] venus: firmware: enable no tz fw loading for sc7280
Date:   Wed, 19 May 2021 15:06:42 +0530
Message-Id: <1621417008-6117-2-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621417008-6117-1-git-send-email-dikshita@codeaurora.org>
References: <1621417008-6117-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Enable no tz FW loading.
- add routine to reset XTSS.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/firmware.c     | 42 ++++++++++++++++++++----
 drivers/media/platform/qcom/venus/hfi_venus_io.h |  2 ++
 2 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 227bd3b..e05e01a 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -42,6 +42,22 @@ static void venus_reset_cpu(struct venus_core *core)
 	writel(0, wrapper_base + WRAPPER_A9SS_SW_RESET);
 }
 
+static void venus_reset_cpu_V6(struct venus_core *core)
+{
+	u32 fw_size = core->fw.mapped_mem_size;
+	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
+
+	writel(0, wrapper_tz_base + WRAPPER_FW_START_ADDR);
+	writel(fw_size, wrapper_tz_base + WRAPPER_FW_END_ADDR);
+	writel(0, wrapper_tz_base + WRAPPER_CPA_START_ADDR);
+	writel(fw_size, wrapper_tz_base + WRAPPER_CPA_END_ADDR);
+	writel(fw_size, wrapper_tz_base + WRAPPER_NONPIX_START_ADDR);
+	writel(fw_size, wrapper_tz_base + WRAPPER_NONPIX_END_ADDR);
+
+	/* Bring XTSS out of reset */
+	writel(0, wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
+}
+
 int venus_set_hw_state(struct venus_core *core, bool resume)
 {
 	int ret;
@@ -54,10 +70,15 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
 	}
 
 	if (resume) {
-		venus_reset_cpu(core);
+		if (IS_V6(core))
+			venus_reset_cpu_V6(core);
+		else
+			venus_reset_cpu(core);
 	} else {
 		if (!IS_V6(core))
 			writel(1, core->wrapper_base + WRAPPER_A9SS_SW_RESET);
+		else
+			writel(1, core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
 	}
 
 	return 0;
@@ -149,7 +170,10 @@ static int venus_boot_no_tz(struct venus_core *core, phys_addr_t mem_phys,
 		return ret;
 	}
 
-	venus_reset_cpu(core);
+	if (IS_V6(core))
+		venus_reset_cpu_V6(core);
+	else
+		venus_reset_cpu(core);
 
 	return 0;
 }
@@ -162,12 +186,18 @@ static int venus_shutdown_no_tz(struct venus_core *core)
 	u32 reg;
 	struct device *dev = core->fw.dev;
 	void __iomem *wrapper_base = core->wrapper_base;
+	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
 
+	if (IS_V6(core)) {
+		reg = readl_relaxed(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
+		reg |= WRAPPER_XTSS_SW_RESET_BIT;
+		writel_relaxed(reg, wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
+	} else {
 	/* Assert the reset to ARM9 */
-	reg = readl_relaxed(wrapper_base + WRAPPER_A9SS_SW_RESET);
-	reg |= WRAPPER_A9SS_SW_RESET_BIT;
-	writel_relaxed(reg, wrapper_base + WRAPPER_A9SS_SW_RESET);
-
+		reg = readl_relaxed(wrapper_base + WRAPPER_A9SS_SW_RESET);
+		reg |= WRAPPER_A9SS_SW_RESET_BIT;
+		writel_relaxed(reg, wrapper_base + WRAPPER_A9SS_SW_RESET);
+	}
 	/* Make sure reset is asserted before the mapping is removed */
 	mb();
 
diff --git a/drivers/media/platform/qcom/venus/hfi_venus_io.h b/drivers/media/platform/qcom/venus/hfi_venus_io.h
index 300c6e47..9735a24 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus_io.h
+++ b/drivers/media/platform/qcom/venus/hfi_venus_io.h
@@ -149,6 +149,8 @@
 /* Wrapper TZ 6xx */
 #define WRAPPER_TZ_BASE_V6			0x000c0000
 #define WRAPPER_TZ_CPU_STATUS_V6		0x10
+#define WRAPPER_TZ_XTSS_SW_RESET		0x1000
+#define WRAPPER_XTSS_SW_RESET_BIT		BIT(0)
 
 /* Venus AON */
 #define AON_BASE_V6				0x000e0000
-- 
2.7.4

