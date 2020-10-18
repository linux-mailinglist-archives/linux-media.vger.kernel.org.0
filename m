Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC931291785
	for <lists+linux-media@lfdr.de>; Sun, 18 Oct 2020 14:54:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgJRMyO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Oct 2020 08:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726685AbgJRMwo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Oct 2020 08:52:44 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49FFCC0613CE;
        Sun, 18 Oct 2020 05:52:44 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id f21so7686834wml.3;
        Sun, 18 Oct 2020 05:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7C8SiBUaBEB0Pue37zDv/bScOV6s5JvgTGv3JG0sNTs=;
        b=mXv5e28HeG6NbIF9f4SaNnUJPRintgungcBJrY4oBDWnmUKnbaD5krgrGvibfkm7V+
         Bupood2YYnrLVw9rfz8Qg3ojEoOHOfoJ1CxTppeMMDcKw4Ozjzg/Z5b91h4J/ceeTHtv
         dPA+Ll1ySSfXrTG+qh3kEf7cidUwFp+3Mv50JyESuBMngVlZiiPkkqvJMbfl6uraZUYa
         cD/NBs4lhH8fhWKjVL1azo7RnBwyt2dtnxqdjCxrIVAPt1PNKCLPRxcWF80RLpjD0M5C
         UA8ccDNRqTXw2p3h2K06UEPTci2BQzWFd3R282VksM/IBcYOS6YiW4sAI7qzjYQ5tLoB
         6fAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7C8SiBUaBEB0Pue37zDv/bScOV6s5JvgTGv3JG0sNTs=;
        b=QjpTC5vMPVg3SVBZwXiMDR1oRnfaWiMxt6LIRnAWhnkx9OBUX+dkZtGeegt5xFB0fc
         Gfk4KNwT96isfZN+5xWmLxwHWOq8h5Fs02at8gPJeQ+zV0CfTBdKOStCBvX8oSh+oOzL
         abM6sMygwlYvkc/sHcdb84Y315nCumKV+qYHDN2OJx4sEm/0apf1Y1v5mJb1BvkM6vhO
         LWMHgxswH2+YeqhiF9qoH6+IJftR50EHe6KBM7QCIqtL1HtEvanHmvdsfaR4oMXHm+O/
         uoPoFGD/l76Cgaq/5u3K1vzkuYiz7Vuesw2W1sqBu6Z+3uhlQt6qC4jst2A1kEJhmLYv
         QGwg==
X-Gm-Message-State: AOAM533nRKe2v41hnoOX40MdHOYpbRkbfbGu9FJJ/qHqhmkDFERlhsri
        We6L3pSA6Kv50BbZY00Zyw4=
X-Google-Smtp-Source: ABdhPJzUPARLGYStpJTUUH6l/avm8hRmERNyuv8N7k87ehEqj7g9dz+8ec6EASatznb+mxcdVI8MZw==
X-Received: by 2002:a05:600c:20c:: with SMTP id 12mr13531980wmi.144.1603025562892;
        Sun, 18 Oct 2020 05:52:42 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u2sm11940158wme.1.2020.10.18.05.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2020 05:52:42 -0700 (PDT)
From:   kholk11@gmail.com
To:     todor.too@gmail.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        robh+dt@kernel.org, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 2/6] media: camss: ispif: Correctly reset based on the VFE ID
Date:   Sun, 18 Oct 2020 14:52:33 +0200
Message-Id: <20201018125237.16717-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201018125237.16717-1-kholk11@gmail.com>
References: <20201018125237.16717-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Resetting the ISPIF VFE0 context is wrong if we are using the VFE1
for dual-camera or simply because a secondary camera is connected
to it: in this case the reset will always happen on the VFE0 ctx
of the ISPIF, which is .. useless.

Fix this usecase by adding the ISPIF_RST_CMD_1 address and choose
where to do the (or what to) reset based on the VFE line id.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../media/platform/qcom/camss/camss-ispif.c   | 87 ++++++++++++-------
 .../media/platform/qcom/camss/camss-ispif.h   |  2 +-
 2 files changed, 57 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index db94cfd6c508..252db6b33dab 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -26,6 +26,7 @@
 #define MSM_ISPIF_NAME "msm_ispif"
 
 #define ISPIF_RST_CMD_0			0x008
+#define ISPIF_RST_CMD_1			0x00c
 #define ISPIF_RST_CMD_0_STROBED_RST_EN		(1 << 0)
 #define ISPIF_RST_CMD_0_MISC_LOGIC_RST		(1 << 1)
 #define ISPIF_RST_CMD_0_SW_REG_RST		(1 << 2)
@@ -179,7 +180,10 @@ static irqreturn_t ispif_isr_8x96(int irq, void *dev)
 	writel(0x1, ispif->base + ISPIF_IRQ_GLOBAL_CLEAR_CMD);
 
 	if ((value0 >> 27) & 0x1)
-		complete(&ispif->reset_complete);
+		complete(&ispif->reset_complete[0]);
+
+	if ((value3 >> 27) & 0x1)
+		complete(&ispif->reset_complete[1]);
 
 	if (unlikely(value0 & ISPIF_VFE_m_IRQ_STATUS_0_PIX0_OVERFLOW))
 		dev_err_ratelimited(to_device(ispif), "VFE0 pix0 overflow\n");
@@ -237,7 +241,7 @@ static irqreturn_t ispif_isr_8x16(int irq, void *dev)
 	writel(0x1, ispif->base + ISPIF_IRQ_GLOBAL_CLEAR_CMD);
 
 	if ((value0 >> 27) & 0x1)
-		complete(&ispif->reset_complete);
+		complete(&ispif->reset_complete[0]);
 
 	if (unlikely(value0 & ISPIF_VFE_m_IRQ_STATUS_0_PIX0_OVERFLOW))
 		dev_err_ratelimited(to_device(ispif), "VFE0 pix0 overflow\n");
@@ -257,33 +261,17 @@ static irqreturn_t ispif_isr_8x16(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-/*
- * ispif_reset - Trigger reset on ISPIF module and wait to complete
- * @ispif: ISPIF device
- *
- * Return 0 on success or a negative error code otherwise
- */
-static int ispif_reset(struct ispif_device *ispif)
+static int ispif_vfe_reset(struct ispif_device *ispif, u8 vfe_id)
 {
-	unsigned long time;
 	u32 val;
-	int ret;
-
-	ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE0);
-	if (ret < 0)
-		return ret;
 
-	ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE1);
-	if (ret < 0)
-		return ret;
-
-	ret = camss_enable_clocks(ispif->nclocks_for_reset,
-				  ispif->clock_for_reset,
-				  to_device(ispif));
-	if (ret < 0)
-		return ret;
+	if (vfe_id > (to_camss(ispif)->vfe_num - 1)) {
+		dev_err(to_device(ispif),
+			"Error: asked reset for invalid VFE%d\n", vfe_id);
+		return -ENOENT;
+	}
 
-	reinit_completion(&ispif->reset_complete);
+	reinit_completion(&ispif->reset_complete[vfe_id]);
 
 	val = ISPIF_RST_CMD_0_STROBED_RST_EN |
 		ISPIF_RST_CMD_0_MISC_LOGIC_RST |
@@ -303,15 +291,51 @@ static int ispif_reset(struct ispif_device *ispif)
 		ISPIF_RST_CMD_0_RDI_OUTPUT_1_MISR_RST |
 		ISPIF_RST_CMD_0_RDI_OUTPUT_2_MISR_RST;
 
-	writel_relaxed(val, ispif->base + ISPIF_RST_CMD_0);
+	if (vfe_id == 1)
+		writel_relaxed(val, ispif->base + ISPIF_RST_CMD_1);
+	else
+		writel_relaxed(val, ispif->base + ISPIF_RST_CMD_0);
 
-	time = wait_for_completion_timeout(&ispif->reset_complete,
+	time = wait_for_completion_timeout(&ispif->reset_complete[vfe_id],
 		msecs_to_jiffies(ISPIF_RESET_TIMEOUT_MS));
 	if (!time) {
-		dev_err(to_device(ispif), "ISPIF reset timeout\n");
-		ret = -EIO;
+		dev_err(to_device(ispif),
+			"ISPIF for VFE%d reset timeout\n", vfe_id);
+		return -EIO;
 	}
 
+	return 0;
+}
+
+/*
+ * ispif_reset - Trigger reset on ISPIF module and wait to complete
+ * @ispif: ISPIF device
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int ispif_reset(struct ispif_device *ispif, u8 vfe_id)
+{
+	unsigned long time;
+	int ret;
+
+	ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE0);
+	if (ret < 0)
+		return ret;
+
+	ret = camss_pm_domain_on(to_camss(ispif), PM_DOMAIN_VFE1);
+	if (ret < 0)
+		return ret;
+
+	ret = camss_enable_clocks(ispif->nclocks_for_reset,
+				  ispif->clock_for_reset,
+				  to_device(ispif));
+	if (ret < 0)
+		return ret;
+
+	ret = ispif_vfe_reset(ispif, vfe_id);
+	if (ret)
+		dev_dbg(to_device(ispif), "ISPIF Reset failed\n");
+
 	camss_disable_clocks(ispif->nclocks_for_reset, ispif->clock_for_reset);
 
 	camss_pm_domain_off(to_camss(ispif), PM_DOMAIN_VFE0);
@@ -355,7 +379,7 @@ static int ispif_set_power(struct v4l2_subdev *sd, int on)
 			goto exit;
 		}
 
-		ret = ispif_reset(ispif);
+		ret = ispif_reset(ispif, line->vfe_id);
 		if (ret < 0) {
 			pm_runtime_put_sync(dev);
 			camss_disable_clocks(ispif->nclocks, ispif->clock);
@@ -1192,7 +1216,8 @@ int msm_ispif_subdev_init(struct ispif_device *ispif,
 
 	mutex_init(&ispif->config_lock);
 
-	init_completion(&ispif->reset_complete);
+	for (i = 0; i < MSM_ISPIF_VFE_NUM; i++)
+		init_completion(&ispif->reset_complete[i]);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.h b/drivers/media/platform/qcom/camss/camss-ispif.h
index 1a5ba2425a42..4132174f7ea1 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.h
+++ b/drivers/media/platform/qcom/camss/camss-ispif.h
@@ -56,7 +56,7 @@ struct ispif_device {
 	int nclocks;
 	struct camss_clock  *clock_for_reset;
 	int nclocks_for_reset;
-	struct completion reset_complete;
+	struct completion reset_complete[MSM_ISPIF_VFE_NUM];
 	int power_count;
 	struct mutex power_lock;
 	struct ispif_intf_cmd_reg intf_cmd[MSM_ISPIF_VFE_NUM];
-- 
2.28.0

