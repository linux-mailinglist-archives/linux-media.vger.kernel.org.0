Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF4993E575D
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 11:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239255AbhHJJsw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 05:48:52 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:28230 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239218AbhHJJss (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 05:48:48 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 10 Aug 2021 02:48:25 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Aug 2021 02:48:24 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Aug 2021 15:18:09 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id D591221CA3; Tue, 10 Aug 2021 15:18:08 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v4 1/7] venus: firmware: enable no tz fw loading for sc7280
Date:   Tue, 10 Aug 2021 15:17:49 +0530
Message-Id: <1628588875-23790-2-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628588875-23790-1-git-send-email-dikshita@codeaurora.org>
References: <1628588875-23790-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Enable no tz FW loading.
- add routine to reset XTSS.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/firmware.c     | 42 +++++++++++++++++-------
 drivers/media/platform/qcom/venus/hfi_venus_io.h |  2 ++
 2 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 227bd3b..14b6f1d 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -27,7 +27,12 @@
 static void venus_reset_cpu(struct venus_core *core)
 {
 	u32 fw_size = core->fw.mapped_mem_size;
-	void __iomem *wrapper_base = core->wrapper_base;
+	void __iomem *wrapper_base;
+
+	if (IS_V6(core))
+		wrapper_base = core->wrapper_tz_base;
+	else
+		wrapper_base = core->wrapper_base;
 
 	writel(0, wrapper_base + WRAPPER_FW_START_ADDR);
 	writel(fw_size, wrapper_base + WRAPPER_FW_END_ADDR);
@@ -35,11 +40,17 @@ static void venus_reset_cpu(struct venus_core *core)
 	writel(fw_size, wrapper_base + WRAPPER_CPA_END_ADDR);
 	writel(fw_size, wrapper_base + WRAPPER_NONPIX_START_ADDR);
 	writel(fw_size, wrapper_base + WRAPPER_NONPIX_END_ADDR);
-	writel(0x0, wrapper_base + WRAPPER_CPU_CGC_DIS);
-	writel(0x0, wrapper_base + WRAPPER_CPU_CLOCK_CONFIG);
 
-	/* Bring ARM9 out of reset */
-	writel(0, wrapper_base + WRAPPER_A9SS_SW_RESET);
+	if (IS_V6(core)) {
+		/* Bring XTSS out of reset */
+		writel(0, wrapper_base + WRAPPER_TZ_XTSS_SW_RESET);
+	} else {
+		writel(0x0, wrapper_base + WRAPPER_CPU_CGC_DIS);
+		writel(0x0, wrapper_base + WRAPPER_CPU_CLOCK_CONFIG);
+
+		/* Bring ARM9 out of reset */
+		writel(0, wrapper_base + WRAPPER_A9SS_SW_RESET);
+	}
 }
 
 int venus_set_hw_state(struct venus_core *core, bool resume)
@@ -56,7 +67,9 @@ int venus_set_hw_state(struct venus_core *core, bool resume)
 	if (resume) {
 		venus_reset_cpu(core);
 	} else {
-		if (!IS_V6(core))
+		if (IS_V6(core))
+			writel(1, core->wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
+		else
 			writel(1, core->wrapper_base + WRAPPER_A9SS_SW_RESET);
 	}
 
@@ -162,12 +175,19 @@ static int venus_shutdown_no_tz(struct venus_core *core)
 	u32 reg;
 	struct device *dev = core->fw.dev;
 	void __iomem *wrapper_base = core->wrapper_base;
+	void __iomem *wrapper_tz_base = core->wrapper_tz_base;
 
-	/* Assert the reset to ARM9 */
-	reg = readl_relaxed(wrapper_base + WRAPPER_A9SS_SW_RESET);
-	reg |= WRAPPER_A9SS_SW_RESET_BIT;
-	writel_relaxed(reg, wrapper_base + WRAPPER_A9SS_SW_RESET);
-
+	if (IS_V6(core)) {
+		/* Assert the reset to XTSS */
+		reg = readl_relaxed(wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
+		reg |= WRAPPER_XTSS_SW_RESET_BIT;
+		writel_relaxed(reg, wrapper_tz_base + WRAPPER_TZ_XTSS_SW_RESET);
+	} else {
+		/* Assert the reset to ARM9 */
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

