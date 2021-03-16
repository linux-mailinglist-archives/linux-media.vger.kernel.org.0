Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAEA433DAC0
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 18:21:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239173AbhCPRVT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 13:21:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239150AbhCPRUf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 13:20:35 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F0CC0613DB
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:24 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id r17so73460329ejy.13
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 10:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kijv+xSGwVlSjtAeb35/yodwnh4VUxrf0EWsg3VasRg=;
        b=VXLp59dZ85+qsNpmFKR4vuITjm7DRW+KKasyvfZdXdgt0cZnWFRTiB5dluhcJTw+21
         fYK3x/ul8MthF2ppS1ekW2JtmodFzMfFRdQDQ45Rvw4S+0c+t1SR4/ZluW3WlfBht103
         sZLEWB648HoSsmJGpq4NlF/Z9x5rHOfM2YakPTYJgguo61ERLZlIBcvqpyJV1JeHds0k
         bldiTA/KV0MPKiHd5Hl5hhLRsl8pDpQ24xQ5lOZr3Mrpsju0vsexV3g6GMS23M9ZkiYv
         kR3Yuo6Ci9z/phRT75Q25RtgfWhgEtu5Jjz5sh+62kM63qMcVbRcdAjyAzEC/mHwplBV
         B1yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kijv+xSGwVlSjtAeb35/yodwnh4VUxrf0EWsg3VasRg=;
        b=esczO0fk1WPtZKozP61XqL/a5PUXH8G36PmOFj0GV/ZSPidSNdXjTq5xizOO0mpfUz
         OuKEjpmmlZZFRcSQZI7Upp0ExCpkxx+nXyaXIzaUZWmwMYTcj9RFsaT1YEuCIJQryVZT
         fuylWenfoYJaL7ihPhS/QUOvHlccSIdeR1jwc8v+kpc6CRTcgDznUR4oI0JXlDdW1NJz
         MXl2/ZxEibnr5zLfiePwCf8EP4hzz6x5rNBLOia/oVNtOKc2n5Z1A9Anl0aoZUcCHizf
         pHyhE07fYbB2azw/Qs0fu5BdEy7tbEfTTCulw3LYnQsiU3LsD087GptUiQjXCc5VpX+T
         +e1w==
X-Gm-Message-State: AOAM532apGXRIR99bXbaBZ+cydBkomW2W3AmdV61yJSoK9jJf0n5E/PT
        o1S/YoUhFkZHLdOqGqI4DBuX5w==
X-Google-Smtp-Source: ABdhPJzTC6Ejmi75cAFZgjNWF5dYUiNpqsEPMlaSUAiZ7N43nKe6TvUGAo5abkYjnCioJTUaAe3hXw==
X-Received: by 2002:a17:906:1a44:: with SMTP id j4mr31228472ejf.401.1615915223406;
        Tue, 16 Mar 2021 10:20:23 -0700 (PDT)
Received: from localhost.localdomain ([37.120.1.234])
        by smtp.gmail.com with ESMTPSA id u1sm10571584edv.90.2021.03.16.10.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 10:20:22 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v9 11/22] media: camss: Add support for CSIPHY hardware version Titan 170
Date:   Tue, 16 Mar 2021 18:19:20 +0100
Message-Id: <20210316171931.812748-12-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210316171931.812748-1-robert.foss@linaro.org>
References: <20210316171931.812748-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add register definitions for version 170 of the Titan architecture
and implement support for the CSIPHY subdevice.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---


Changes since v3:
 - Sakari: Make variable const

Changes since v4:
 - kernel test robot: Fix warning related to const 

Changes since v5:
 - Andrey: Fix computed register value being overwritten

Changes since v6:
 - Andrey: Add r-b

Changes since v7:
 - Hans: Fix checkpatch.pl --strict warnings

Changes since v8:
 - Hans: Rework csid_testgen_modes array definition



 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 179 ++++++++++++++++--
 .../media/platform/qcom/camss/camss-csiphy.c  |  66 +++++--
 drivers/media/platform/qcom/camss/camss.c     |  74 ++++++++
 3 files changed, 288 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index da7c3d3f9a10..e318c822ab04 100644
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
+	s32 reg_addr;
+	s32 reg_data;
+	s32 delay;
+	u32 csiphy_param_type;
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
@@ -134,25 +233,13 @@ static u8 csiphy_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
 	return settle_cnt;
 }
 
-static void csiphy_lanes_enable(struct csiphy_device *csiphy,
-				struct csiphy_config *cfg,
-				s64 link_freq, u8 lane_mask)
+static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
+				     struct csiphy_config *cfg,
+				     u8 settle_cnt)
 {
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
-	u8 settle_cnt;
-	u8 val, l = 0;
-	int i;
-
-	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
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
@@ -206,6 +293,64 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 
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
+				s64 link_freq, u8 lane_mask)
+{
+	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
+	u8 settle_cnt;
+	u8 val;
+	int i;
+
+	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
+
+	val = BIT(c->clk.pos);
+	for (i = 0; i < c->num_data; i++)
+		val |= BIT(c->data[i].pos * 2);
+
+	writel_relaxed(val, csiphy->base + CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(5));
+
+	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
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
index 40384d7ca78c..6ceb6d7d53d1 100644
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
@@ -253,16 +277,20 @@ static int csiphy_stream_on(struct csiphy_device *csiphy)
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
 
 	csiphy->ops->lanes_enable(csiphy, cfg, link_freq, lane_mask);
 
@@ -553,6 +581,10 @@ int msm_csiphy_subdev_init(struct camss *camss,
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
@@ -566,11 +598,17 @@ int msm_csiphy_subdev_init(struct camss *camss,
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
+						 res->reg[1]);
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
index c244a27a1add..d022aed47e25 100644
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

