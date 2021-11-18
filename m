Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7970455BC9
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 13:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344844AbhKRMvt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 07:51:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344827AbhKRMv0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 07:51:26 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E39C061204
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 04:48:25 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id r8so11311276wra.7
        for <linux-media@vger.kernel.org>; Thu, 18 Nov 2021 04:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gMYLE7J7LVl7QS6DrFMU1QSMUJ4cnRJy0GXYbQPzrx8=;
        b=wwWUVhFVK7pVQLUIw3RRlbr/hOKNKvqiczHBqQTpHnURSf23wktS4IbwcHDkG5VRJe
         tBwXdTVO7HxB0p0v2LXbx80htZbIctVFNEfadD0t5b000o/ca7HO6Gvun/ZBuTunLgi6
         0Jc8jUTQ436/9YlKD8T4vp5eWNPf6OUSDone0ivLhevzMQqkn+oL01INmDNU0uLFHtyr
         hNXOmpDLpFOgN5FlEt1WDqx5OyY+Q1VK7pOvGkphK8Xer8XImycR6HRwoxx9Uo78HRpI
         gBFdL1U+B89F6hDd95ezpGJeSBjpVcBuHVGIDbBl0QbXL44b4DkOAV7F4DmEhgBTz9ST
         E50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gMYLE7J7LVl7QS6DrFMU1QSMUJ4cnRJy0GXYbQPzrx8=;
        b=5ryL7XJJBReiAwyAfTi5FuTTVjIpPTN9yBKtJtCkQsGIpOeMPB03LOQBXIl1fxMDl3
         fn43CVGVBpbr0h9CuI04+rv/pL3LLJAvXUvVsuCT/xOnCrySARHHnIxtNN8WNTLIqSPy
         da2JQfQiMycbPVgKOg7Ii0wgZDXkgRSWboQSP7IJ3ZODFZzYquNhcqUqv6mymwoUp89n
         IDXLo+aaf11KWPHpTba6qTtyvq+penOZbTdNmGOSDCfZ9XcmAanxE8yXBebi/lNaOLlB
         qIqKsX4aBlZoQ2jgHf8WjXiFkVI7DUwZnoPGK9xwpfuQRRHJS0E7+mJ8GbfDmBrDHkhN
         lAjw==
X-Gm-Message-State: AOAM5324/2NTaOrfM4qzNHjbVteGs8uuaf96vZWayZTLnN/HaOlPSCDF
        6CbfPhSwwOJQGSqa4bVMfrkXpw==
X-Google-Smtp-Source: ABdhPJz6bavwxOvi2JVP0JxfC7JS+MV0CPPpAZKltOFeVrw073MB4/DGU0pBn8v3Pynt5YzuEgQ1BQ==
X-Received: by 2002:a05:6000:15c8:: with SMTP id y8mr30557000wry.55.1637239704385;
        Thu, 18 Nov 2021 04:48:24 -0800 (PST)
Received: from xps7590.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id h2sm2955635wrz.23.2021.11.18.04.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 04:48:23 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v3 1/4] media: camss: csiphy: Move to hardcode CSI Clock Lane number
Date:   Thu, 18 Nov 2021 13:48:16 +0100
Message-Id: <20211118124819.1902427-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211118124819.1902427-1-robert.foss@linaro.org>
References: <20211118124819.1902427-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QCOM ISPs do not support having a programmable CSI Clock Lane number.

In order to accurately reflect this, the different CSIPHY HW versions
need to have their own register layer for computing lane masks.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../qcom/camss/camss-csiphy-2ph-1-0.c         | 19 +++++++++++++++--
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 17 ++++++++++++++-
 .../media/platform/qcom/camss/camss-csiphy.c  | 21 +------------------
 .../media/platform/qcom/camss/camss-csiphy.h  |  7 +++++++
 4 files changed, 41 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
index 30b454c369ab..cd4a8c369234 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-2ph-1-0.c
@@ -16,6 +16,7 @@
 
 #define CAMSS_CSI_PHY_LNn_CFG2(n)		(0x004 + 0x40 * (n))
 #define CAMSS_CSI_PHY_LNn_CFG3(n)		(0x008 + 0x40 * (n))
+#define		CAMSS_CSI_PHY_LN_CLK		1
 #define CAMSS_CSI_PHY_GLBL_RESET		0x140
 #define CAMSS_CSI_PHY_GLBL_PWR_CFG		0x144
 #define CAMSS_CSI_PHY_GLBL_IRQ_CMD		0x164
@@ -26,6 +27,19 @@
 #define CAMSS_CSI_PHY_GLBL_T_INIT_CFG0		0x1ec
 #define CAMSS_CSI_PHY_T_WAKEUP_CFG0		0x1f4
 
+static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
+{
+	u8 lane_mask;
+	int i;
+
+	lane_mask = 1 << CAMSS_CSI_PHY_LN_CLK;
+
+	for (i = 0; i < lane_cfg->num_data; i++)
+		lane_mask |= 1 << lane_cfg->data[i].pos;
+
+	return lane_mask;
+}
+
 static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 				   struct device *dev)
 {
@@ -105,7 +119,7 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 
 	for (i = 0; i <= c->num_data; i++) {
 		if (i == c->num_data)
-			l = c->clk.pos;
+			l = CAMSS_CSI_PHY_LN_CLK;
 		else
 			l = c->data[i].pos;
 
@@ -129,7 +143,7 @@ static void csiphy_lanes_disable(struct csiphy_device *csiphy,
 
 	for (i = 0; i <= c->num_data; i++) {
 		if (i == c->num_data)
-			l = c->clk.pos;
+			l = CAMSS_CSI_PHY_LN_CLK;
 		else
 			l = c->data[i].pos;
 
@@ -167,6 +181,7 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
 }
 
 const struct csiphy_hw_ops csiphy_ops_2ph_1_0 = {
+	.get_lane_mask = csiphy_get_lane_mask,
 	.hw_version_read = csiphy_hw_version_read,
 	.reset = csiphy_reset,
 	.lanes_enable = csiphy_lanes_enable,
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index e318c822ab04..cde6b3a10b9e 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -43,6 +43,7 @@
 #define CSIPHY_3PH_LNn_CSI_LANE_CTRL15_SWI_SOT_SYMBOL	0xb8
 
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(n)	(0x800 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(n)	(0x8b0 + 0x4 * (n))
@@ -320,6 +321,19 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 	}
 }
 
+static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
+{
+	u8 lane_mask;
+	int i;
+
+	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
+
+	for (i = 0; i < lane_cfg->num_data; i++)
+		lane_mask |= 1 << lane_cfg->data[i].pos;
+
+	return lane_mask;
+}
+
 static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 				struct csiphy_config *cfg,
 				s64 link_freq, u8 lane_mask)
@@ -331,7 +345,7 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 
 	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
 
-	val = BIT(c->clk.pos);
+	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
 	for (i = 0; i < c->num_data; i++)
 		val |= BIT(c->data[i].pos * 2);
 
@@ -397,6 +411,7 @@ static void csiphy_lanes_disable(struct csiphy_device *csiphy,
 }
 
 const struct csiphy_hw_ops csiphy_ops_3ph_1_0 = {
+	.get_lane_mask = csiphy_get_lane_mask,
 	.hw_version_read = csiphy_hw_version_read,
 	.reset = csiphy_reset,
 	.lanes_enable = csiphy_lanes_enable,
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 24eec16197e7..ac7e96e6b7cd 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -229,25 +229,6 @@ static int csiphy_set_power(struct v4l2_subdev *sd, int on)
 	return 0;
 }
 
-/*
- * csiphy_get_lane_mask - Calculate CSI2 lane mask configuration parameter
- * @lane_cfg - CSI2 lane configuration
- *
- * Return lane mask
- */
-static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
-{
-	u8 lane_mask;
-	int i;
-
-	lane_mask = 1 << lane_cfg->clk.pos;
-
-	for (i = 0; i < lane_cfg->num_data; i++)
-		lane_mask |= 1 << lane_cfg->data[i].pos;
-
-	return lane_mask;
-}
-
 /*
  * csiphy_stream_on - Enable streaming on CSIPHY module
  * @csiphy: CSIPHY device
@@ -261,7 +242,7 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 {
 	struct csiphy_config *cfg = &csiphy->cfg;
 	s64 link_freq;
-	u8 lane_mask = csiphy_get_lane_mask(&cfg->csi2->lane_cfg);
+	u8 lane_mask = csiphy->ops->get_lane_mask(&cfg->csi2->lane_cfg);
 	u8 bpp = csiphy_get_bpp(csiphy->formats, csiphy->nformats,
 				csiphy->fmt[MSM_CSIPHY_PAD_SINK].code);
 	u8 num_lanes = csiphy->cfg.csi2->lane_cfg.num_data;
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index d71b8bc6ec00..1c14947f92d3 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -45,6 +45,13 @@ struct csiphy_config {
 struct csiphy_device;
 
 struct csiphy_hw_ops {
+	/*
+	 * csiphy_get_lane_mask - Calculate CSI2 lane mask configuration parameter
+	 * @lane_cfg - CSI2 lane configuration
+	 *
+	 * Return lane mask
+	 */
+	u8 (*get_lane_mask)(struct csiphy_lanes_cfg *lane_cfg);
 	void (*hw_version_read)(struct csiphy_device *csiphy,
 				struct device *dev);
 	void (*reset)(struct csiphy_device *csiphy);
-- 
2.32.0

