Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CED632D26C
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 13:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240019AbhCDMGv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Mar 2021 07:06:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239947AbhCDMGe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Mar 2021 07:06:34 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29E07C0617A7
        for <linux-media@vger.kernel.org>; Thu,  4 Mar 2021 04:05:52 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id w9so877872edc.11
        for <linux-media@vger.kernel.org>; Thu, 04 Mar 2021 04:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3KgzaXgmhrp3mv+UzWb1dQfOfC9aT/ZQo2xat0EWUJk=;
        b=MAy58UoLtB60fzN/6VQSRWfTC7NbYRK2gjdx8vqk0rS4L4JXQbKf6r6lDxD51McKjI
         9Pdy7Mc+T/4BOMSKAs0IZTYtGfXxnKQdMYp1tQc/52u2ipGJelETljgtgt6EVJflO1Je
         II4aBjA3Myisn7ucRYep1pAPcu92S6l9KRYfBlWVy70kH7xoPX7ZtWdWCxKeoe0rWxR2
         pJLA5mWp0I7bYe4uat5+6D834CGo0+6ZuF7CM9WRJGFHTBQTKfTzyn1B9cUmZSZWkv+t
         W0GziAdiG1DOSRPUEJ5wGH+K1mmw8p3ZWOZpHhGuK45xey0I0FAV5HsVMxOQj8ZeFME7
         2vTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3KgzaXgmhrp3mv+UzWb1dQfOfC9aT/ZQo2xat0EWUJk=;
        b=b5Qsy1wwzAoVFGTfYJhU5oqsQTpVr8xyORrMIPCzpkSxhJ7S9Ew7tubjcl96RqICCN
         ooUZAQP6G1Av+UCu/Sh8nnWu8zUnfGy8UMwE5/XFFUOFPzn33Be2+9yc3MN3oJZunXmc
         PA7BSCoe4maAGabReqrNUGIZOsEe2IY31gAR9ZozNQ2HhI1fojZtbNoGm+4/abvY9xCt
         j1wyOIwzVket+QYgSCaNTwktLbeoVkmfLnbRlcLoQmFO1tCCs08YMjlP8soSLlBWyDZk
         2CJEgS56nzY4LbZ6cswBCG/63sOhsIVVXs4ZCvoNHtO6ZjkIvAcuQNVHXfUJ+oSb6C1C
         imew==
X-Gm-Message-State: AOAM533t1m/Xc0+oCb1SsgqmB9j7YoKJIus9m9eRwCp/j0TU+qsD8xqI
        SDQ8AaGRvAtSLcoe5aAKFnR1gg==
X-Google-Smtp-Source: ABdhPJy9E8c+HnznXUvB8pdvZbIWKPBXedZ0J70L2uN6v6Lp1mH1ZFhrxMxMeP9WExS4X+yoqI6/EQ==
X-Received: by 2002:aa7:d7da:: with SMTP id e26mr3959477eds.269.1614859550813;
        Thu, 04 Mar 2021 04:05:50 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:470a:340b:1b:29dd])
        by smtp.gmail.com with ESMTPSA id cf6sm20464447edb.92.2021.03.04.04.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 04:05:50 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v6 11/22] media: camss: Add support for CSIPHY hardware version Titan 170
Date:   Thu,  4 Mar 2021 13:03:17 +0100
Message-Id: <20210304120326.153966-12-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210304120326.153966-1-robert.foss@linaro.org>
References: <20210304120326.153966-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add register definitions for version 170 of the Titan architecture
and implement support for the CSIPHY subdevice.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---

Changes since v3
 - Sakari: Make variable const

Changes since v4
 - kernel test robot: Fix warning related to const 

Changes since v5:
 - Andrey: Fix computed register value being overwritten


 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 181 ++++++++++++++++--
 .../media/platform/qcom/camss/camss-csiphy.c  |  66 +++++--
 drivers/media/platform/qcom/camss/camss.c     |  74 +++++++
 3 files changed, 289 insertions(+), 32 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 97cb9de85031..791d1eca2ea2 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -47,6 +47,105 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
 #define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(n)	(0x8b0 + 0x4 * (n))
 
+#define CSIPHY_DEFAULT_PARAMS            0
+#define CSIPHY_LANE_ENABLE               1
+#define CSIPHY_SETTLE_CNT_LOWER_BYTE     2
+#define CSIPHY_SETTLE_CNT_HIGHER_BYTE    3
+#define CSIPHY_DNP_PARAMS                4
+#define CSIPHY_2PH_REGS                  5
+#define CSIPHY_3PH_REGS                  6
+
+struct csiphy_reg_t {
+	int32_t  reg_addr;
+	int32_t  reg_data;
+	int32_t  delay;
+	uint32_t csiphy_param_type;
+};
+
+static const struct
+csiphy_reg_t lane_regs_sdm845[5][14] = {
+	{
+		{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0000, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0008, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x000c, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0060, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0064, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	},
+	{
+		{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0708, 0x14, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x070C, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0760, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0764, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	},
+	{
+		{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0228, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0200, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0208, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x020C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0260, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0264, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	},
+	{
+		{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0428, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0400, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0408, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x040C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0460, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	},
+	{
+		{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0628, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0600, 0x91, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0608, 0x00, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+		{0x060C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+		{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+		{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	},
+};
+
 static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 				   struct device *dev)
 {
@@ -135,26 +234,13 @@ static u8 csiphy_settle_cnt_calc(u32 pixel_clock, u8 bpp, u8 num_lanes,
 	return settle_cnt;
 }
 
-static void csiphy_lanes_enable(struct csiphy_device *csiphy,
-				struct csiphy_config *cfg,
-				u32 pixel_clock, u8 bpp, u8 lane_mask)
+static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
+				     struct csiphy_config *cfg,
+				     u8 settle_cnt)
 {
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
-	u8 settle_cnt;
-	u8 val, l = 0;
-	int i;
-
-	settle_cnt = csiphy_settle_cnt_calc(pixel_clock, bpp, c->num_data,
-					    csiphy->timer_clk_rate);
-
-	val = BIT(c->clk.pos);
-	for (i = 0; i < c->num_data; i++)
-		val |= BIT(c->data[i].pos * 2);
-
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(5));
-
-	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
-	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(6));
+	int i, l = 0;
+	u8 val;
 
 	for (i = 0; i <= c->num_data; i++) {
 		if (i == c->num_data)
@@ -208,6 +294,65 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 
 	val = CSIPHY_3PH_LNn_MISC1_IS_CLKLANE;
 	writel_relaxed(val, csiphy->base + CSIPHY_3PH_LNn_MISC1(l));
+}
+
+static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
+				     u8 settle_cnt)
+{
+	int i, l;
+	u32 val;
+
+	for (l = 0; l < 5; l++) {
+		for (i = 0; i < 14; i++) {
+			const struct csiphy_reg_t *r = &lane_regs_sdm845[l][i];
+
+			switch (r->csiphy_param_type) {
+			case CSIPHY_SETTLE_CNT_LOWER_BYTE:
+				val = settle_cnt & 0xff;
+				break;
+			case CSIPHY_DNP_PARAMS:
+				continue;
+			default:
+				val = r->reg_data;
+				break;
+			}
+			writel_relaxed(val, csiphy->base + r->reg_addr);
+		}
+	}
+}
+
+static void csiphy_lanes_enable(struct csiphy_device *csiphy,
+				struct csiphy_config *cfg,
+				u32 pixel_clock, u8 bpp, u8 lane_mask)
+{
+	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
+	u8 settle_cnt;
+	u8 val;
+	int i;
+
+	settle_cnt = csiphy_settle_cnt_calc(pixel_clock, bpp, c->num_data,
+					    csiphy->timer_clk_rate);
+
+	val = BIT(c->clk.pos);
+	for (i = 0; i < c->num_data; i++)
+		val |= BIT(c->data[i].pos * 2);
+
+	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(5));
+
+	val = 1;
+	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(6));
+
+	val = 0x02;
+	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(7));
+
+	val = 0x00;
+	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(0));
+
+	if (csiphy->camss->version == CAMSS_8x16 ||
+	    csiphy->camss->version == CAMSS_8x96)
+		csiphy_gen1_config_lanes(csiphy, cfg, settle_cnt);
+	else if (csiphy->camss->version == CAMSS_845)
+		csiphy_gen2_config_lanes(csiphy, settle_cnt);
 
 	val = 0xff;
 	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(11));
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 509c9a59c09c..e3fdc268050c 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -73,6 +73,30 @@ static const struct csiphy_format csiphy_formats_8x96[] = {
 	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
 };
 
+static const struct csiphy_format csiphy_formats_sdm845[] = {
+	{ MEDIA_BUS_FMT_UYVY8_2X8, 8 },
+	{ MEDIA_BUS_FMT_VYUY8_2X8, 8 },
+	{ MEDIA_BUS_FMT_YUYV8_2X8, 8 },
+	{ MEDIA_BUS_FMT_YVYU8_2X8, 8 },
+	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8 },
+	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8 },
+	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8 },
+	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8 },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10 },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12 },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12 },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12 },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12 },
+	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14 },
+	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14 },
+	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14 },
+	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14 },
+	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
+};
+
 /*
  * csiphy_get_bpp - map media bus format to bits per pixel
  * @formats: supported media bus formats array
@@ -257,16 +281,20 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
 		return -EINVAL;
 	}
 
-	val = readl_relaxed(csiphy->base_clk_mux);
-	if (cfg->combo_mode && (lane_mask & 0x18) == 0x18) {
-		val &= ~0xf0;
-		val |= cfg->csid_id << 4;
-	} else {
-		val &= ~0xf;
-		val |= cfg->csid_id;
+	if (csiphy->base_clk_mux) {
+		val = readl_relaxed(csiphy->base_clk_mux);
+		if (cfg->combo_mode && (lane_mask & 0x18) == 0x18) {
+			val &= ~0xf0;
+			val |= cfg->csid_id << 4;
+		} else {
+			val &= ~0xf;
+			val |= cfg->csid_id;
+		}
+		writel_relaxed(val, csiphy->base_clk_mux);
+
+		/* Enforce reg write ordering between clk mux & lane enabling */
+		wmb();
 	}
-	writel_relaxed(val, csiphy->base_clk_mux);
-	wmb();
 
 	csiphy->ops->lanes_enable(csiphy, cfg, pixel_clock, bpp, lane_mask);
 
@@ -557,6 +585,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		csiphy->ops = &csiphy_ops_3ph_1_0;
 		csiphy->formats = csiphy_formats_8x96;
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_8x96);
+	} else if (camss->version == CAMSS_845) {
+		csiphy->ops = &csiphy_ops_3ph_1_0;
+		csiphy->formats = csiphy_formats_sdm845;
+		csiphy->nformats = ARRAY_SIZE(csiphy_formats_sdm845);
 	} else {
 		return -EINVAL;
 	}
@@ -570,11 +602,17 @@ int msm_csiphy_subdev_init(struct camss *camss,
 		return PTR_ERR(csiphy->base);
 	}
 
-	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, res->reg[1]);
-	csiphy->base_clk_mux = devm_ioremap_resource(dev, r);
-	if (IS_ERR(csiphy->base_clk_mux)) {
-		dev_err(dev, "could not map memory\n");
-		return PTR_ERR(csiphy->base_clk_mux);
+	if (camss->version == CAMSS_8x16 ||
+	    camss->version == CAMSS_8x96) {
+		r = platform_get_resource_byname(pdev, IORESOURCE_MEM,
+			res->reg[1]);
+		csiphy->base_clk_mux = devm_ioremap_resource(dev, r);
+		if (IS_ERR(csiphy->base_clk_mux)) {
+			dev_err(dev, "could not map memory\n");
+			return PTR_ERR(csiphy->base_clk_mux);
+		}
+	} else {
+		csiphy->base_clk_mux = NULL;
 	}
 
 	/* Interrupt */
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 0b1693c34fbc..5d0479b5589c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -465,6 +465,80 @@ static const struct resources vfe_res_660[] = {
 	}
 };
 
+static const struct resources csiphy_res_845[] = {
+	/* CSIPHY0 */
+	{
+		.regulator = { NULL },
+		.clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
+				"cpas_ahb", "cphy_rx_src", "csiphy0",
+				"csiphy0_timer_src", "csiphy0_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 240000000, 269333333 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" }
+	},
+
+	/* CSIPHY1 */
+	{
+		.regulator = { NULL },
+		.clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
+				"cpas_ahb", "cphy_rx_src", "csiphy1",
+				"csiphy1_timer_src", "csiphy1_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 240000000, 269333333 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" }
+	},
+
+	/* CSIPHY2 */
+	{
+		.regulator = { NULL },
+		.clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
+				"cpas_ahb", "cphy_rx_src", "csiphy2",
+				"csiphy2_timer_src", "csiphy2_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 240000000, 269333333 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" }
+	},
+
+	/* CSIPHY3 */
+	{
+		.regulator = { NULL },
+		.clock = { "camnoc_axi", "soc_ahb", "slow_ahb_src",
+				"cpas_ahb", "cphy_rx_src", "csiphy3",
+				"csiphy3_timer_src", "csiphy3_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 240000000, 269333333 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" }
+	}
+};
+
 static const struct resources csid_res_845[] = {
 	/* CSID0 */
 	{
-- 
2.27.0

