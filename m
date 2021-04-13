Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B898835E4F4
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 19:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbhDMRYB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 13:24:01 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:43141 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347177AbhDMRYA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 13:24:00 -0400
X-Halon-ID: f7b186d2-9c7c-11eb-a9ab-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id f7b186d2-9c7c-11eb-a9ab-0050569116f7;
        Tue, 13 Apr 2021 19:23:38 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] rcar-csi2: Add r8a779a0 support
Date:   Tue, 13 Apr 2021 19:23:14 +0200
Message-Id: <20210413172314.2516631-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for the R-Car V3U (r8a779a0) to the driver. The V3U have the
CSI-2 modules connected to ISPs instead of directly to the R-Car VIN DMA
engines.

The ISP performs channel selection based on CSI-2 VC/DT pairs and routes
the video data. This requires the R-Car CSI-2 media entity to modeled
differently then on other SoCs as it on the V3U only have a single
source pad connected to the ISP.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-csi2.c | 191 +++++++++++++++++++-
 1 file changed, 185 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
index e06cd512aba207a4..47f73f0ab54394ec 100644
--- a/drivers/media/platform/rcar-vin/rcar-csi2.c
+++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
@@ -126,6 +126,12 @@ struct rcar_csi2;
 #define PHTW_CWEN			BIT(8)
 #define PHTW_TESTDIN_CODE(n)		((n & 0xff))
 
+#define PHYFRX_REG			0x64
+#define PHYFRX_FORCERX_MODE_3		BIT(3)
+#define PHYFRX_FORCERX_MODE_2		BIT(2)
+#define PHYFRX_FORCERX_MODE_1		BIT(1)
+#define PHYFRX_FORCERX_MODE_0		BIT(0)
+
 struct phtw_value {
 	u16 data;
 	u16 code;
@@ -136,6 +142,31 @@ struct rcsi2_mbps_reg {
 	u16 reg;
 };
 
+static const struct rcsi2_mbps_reg phtw_mbps_v3u[] = {
+	{ .mbps = 1500, .reg = 0xcc },
+	{ .mbps = 1550, .reg = 0x1d },
+	{ .mbps = 1600, .reg = 0x27 },
+	{ .mbps = 1650, .reg = 0x30 },
+	{ .mbps = 1700, .reg = 0x39 },
+	{ .mbps = 1750, .reg = 0x42 },
+	{ .mbps = 1800, .reg = 0x4b },
+	{ .mbps = 1850, .reg = 0x55 },
+	{ .mbps = 1900, .reg = 0x5e },
+	{ .mbps = 1950, .reg = 0x67 },
+	{ .mbps = 2000, .reg = 0x71 },
+	{ .mbps = 2050, .reg = 0x79 },
+	{ .mbps = 2100, .reg = 0x83 },
+	{ .mbps = 2150, .reg = 0x8c },
+	{ .mbps = 2200, .reg = 0x95 },
+	{ .mbps = 2250, .reg = 0x9e },
+	{ .mbps = 2300, .reg = 0xa7 },
+	{ .mbps = 2350, .reg = 0xb0 },
+	{ .mbps = 2400, .reg = 0xba },
+	{ .mbps = 2450, .reg = 0xc3 },
+	{ .mbps = 2500, .reg = 0xcc },
+	{ /* sentinel */ },
+};
+
 static const struct rcsi2_mbps_reg phtw_mbps_h3_v3h_m3n[] = {
 	{ .mbps =   80, .reg = 0x86 },
 	{ .mbps =   90, .reg = 0x86 },
@@ -200,6 +231,72 @@ static const struct rcsi2_mbps_reg phtw_mbps_v3m_e3[] = {
 #define PHYPLL_REG			0x68
 #define PHYPLL_HSFREQRANGE(n)		((n) << 16)
 
+static const struct rcsi2_mbps_reg hsfreqrange_v3u[] = {
+	{ .mbps =   80, .reg = 0x00 },
+	{ .mbps =   90, .reg = 0x10 },
+	{ .mbps =  100, .reg = 0x20 },
+	{ .mbps =  110, .reg = 0x30 },
+	{ .mbps =  120, .reg = 0x01 },
+	{ .mbps =  130, .reg = 0x11 },
+	{ .mbps =  140, .reg = 0x21 },
+	{ .mbps =  150, .reg = 0x31 },
+	{ .mbps =  160, .reg = 0x02 },
+	{ .mbps =  170, .reg = 0x12 },
+	{ .mbps =  180, .reg = 0x22 },
+	{ .mbps =  190, .reg = 0x32 },
+	{ .mbps =  205, .reg = 0x03 },
+	{ .mbps =  220, .reg = 0x13 },
+	{ .mbps =  235, .reg = 0x23 },
+	{ .mbps =  250, .reg = 0x33 },
+	{ .mbps =  275, .reg = 0x04 },
+	{ .mbps =  300, .reg = 0x14 },
+	{ .mbps =  325, .reg = 0x25 },
+	{ .mbps =  350, .reg = 0x35 },
+	{ .mbps =  400, .reg = 0x05 },
+	{ .mbps =  450, .reg = 0x16 },
+	{ .mbps =  500, .reg = 0x26 },
+	{ .mbps =  550, .reg = 0x37 },
+	{ .mbps =  600, .reg = 0x07 },
+	{ .mbps =  650, .reg = 0x18 },
+	{ .mbps =  700, .reg = 0x28 },
+	{ .mbps =  750, .reg = 0x39 },
+	{ .mbps =  800, .reg = 0x09 },
+	{ .mbps =  850, .reg = 0x19 },
+	{ .mbps =  900, .reg = 0x29 },
+	{ .mbps =  950, .reg = 0x3a },
+	{ .mbps = 1000, .reg = 0x0a },
+	{ .mbps = 1050, .reg = 0x1a },
+	{ .mbps = 1100, .reg = 0x2a },
+	{ .mbps = 1150, .reg = 0x3b },
+	{ .mbps = 1200, .reg = 0x0b },
+	{ .mbps = 1250, .reg = 0x1b },
+	{ .mbps = 1300, .reg = 0x2b },
+	{ .mbps = 1350, .reg = 0x3c },
+	{ .mbps = 1400, .reg = 0x0c },
+	{ .mbps = 1450, .reg = 0x1c },
+	{ .mbps = 1500, .reg = 0x2c },
+	{ .mbps = 1550, .reg = 0x3d },
+	{ .mbps = 1600, .reg = 0x0d },
+	{ .mbps = 1650, .reg = 0x1d },
+	{ .mbps = 1700, .reg = 0x2e },
+	{ .mbps = 1750, .reg = 0x3e },
+	{ .mbps = 1800, .reg = 0x0e },
+	{ .mbps = 1850, .reg = 0x1e },
+	{ .mbps = 1900, .reg = 0x2f },
+	{ .mbps = 1950, .reg = 0x3f },
+	{ .mbps = 2000, .reg = 0x0f },
+	{ .mbps = 2050, .reg = 0x40 },
+	{ .mbps = 2100, .reg = 0x41 },
+	{ .mbps = 2150, .reg = 0x42 },
+	{ .mbps = 2200, .reg = 0x43 },
+	{ .mbps = 2300, .reg = 0x45 },
+	{ .mbps = 2350, .reg = 0x46 },
+	{ .mbps = 2400, .reg = 0x47 },
+	{ .mbps = 2450, .reg = 0x48 },
+	{ .mbps = 2500, .reg = 0x49 },
+	{ /* sentinel */ },
+};
+
 static const struct rcsi2_mbps_reg hsfreqrange_h3_v3h_m3n[] = {
 	{ .mbps =   80, .reg = 0x00 },
 	{ .mbps =   90, .reg = 0x10 },
@@ -353,6 +450,7 @@ struct rcar_csi2_info {
 	unsigned int csi0clkfreqrange;
 	unsigned int num_channels;
 	bool clear_ulps;
+	bool use_isp;
 };
 
 struct rcar_csi2 {
@@ -600,9 +698,12 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 	rcsi2_write(priv, PHTC_REG, 0);
 
 	/* Configure */
-	rcsi2_write(priv, VCDT_REG, vcdt);
-	if (vcdt2)
-		rcsi2_write(priv, VCDT2_REG, vcdt2);
+	if (!priv->info->use_isp) {
+		rcsi2_write(priv, VCDT_REG, vcdt);
+		if (vcdt2)
+			rcsi2_write(priv, VCDT2_REG, vcdt2);
+	}
+
 	/* Lanes are zero indexed. */
 	rcsi2_write(priv, LSWAP_REG,
 		    LSWAP_L0SEL(priv->lane_swap[0] - 1) |
@@ -627,6 +728,11 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 		rcsi2_write(priv, CSI0CLKFCPR_REG,
 			    CSI0CLKFREQRANGE(priv->info->csi0clkfreqrange));
 
+	if (priv->info->use_isp)
+		rcsi2_write(priv, PHYFRX_REG,
+			    PHYFRX_FORCERX_MODE_3 | PHYFRX_FORCERX_MODE_2 |
+			    PHYFRX_FORCERX_MODE_1 | PHYFRX_FORCERX_MODE_0);
+
 	rcsi2_write(priv, PHYCNT_REG, phycnt);
 	rcsi2_write(priv, LINKCNT_REG, LINKCNT_MONITOR_EN |
 		    LINKCNT_REG_MONI_PACT_EN | LINKCNT_ICLK_NONSTOP);
@@ -638,6 +744,9 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
 	if (ret)
 		return ret;
 
+	if (priv->info->use_isp)
+		rcsi2_write(priv, PHYFRX_REG, 0);
+
 	/* Run post PHY start initialization, if needed. */
 	if (priv->info->phy_post_init) {
 		ret = priv->info->phy_post_init(priv);
@@ -1052,6 +1161,62 @@ static int rcsi2_phy_post_init_v3m_e3(struct rcar_csi2 *priv)
 	return rcsi2_phtw_write_array(priv, step1);
 }
 
+static int rcsi2_init_phtw_v3u(struct rcar_csi2 *priv,
+			       unsigned int mbps)
+{
+	/* In case of 1500Mbps or less */
+	static const struct phtw_value step1[] = {
+		{ .data = 0xcc, .code = 0xe2 },
+		{ /* sentinel */ },
+	};
+
+	static const struct phtw_value step2[] = {
+		{ .data = 0x01, .code = 0xe3 },
+		{ .data = 0x11, .code = 0xe4 },
+		{ .data = 0x01, .code = 0xe5 },
+		{ /* sentinel */ },
+	};
+
+	/* In case of 1500Mbps or less */
+	static const struct phtw_value step3[] = {
+		{ .data = 0x38, .code = 0x08 },
+		{ /* sentinel */ },
+	};
+
+	static const struct phtw_value step4[] = {
+		{ .data = 0x01, .code = 0x00 },
+		{ .data = 0x4b, .code = 0xac },
+		{ .data = 0x03, .code = 0x00 },
+		{ .data = 0x80, .code = 0x07 },
+		{ /* sentinel */ },
+	};
+
+	int ret;
+
+	if (mbps != 0 && mbps <= 1500)
+		ret = rcsi2_phtw_write_array(priv, step1);
+	else
+		ret = rcsi2_phtw_write_mbps(priv, mbps, phtw_mbps_v3u, 0xe2);
+	if (ret)
+		return ret;
+
+	ret = rcsi2_phtw_write_array(priv, step2);
+	if (ret)
+		return ret;
+
+	if (mbps != 0 && mbps <= 1500) {
+		ret = rcsi2_phtw_write_array(priv, step3);
+		if (ret)
+			return ret;
+	}
+
+	ret = rcsi2_phtw_write_array(priv, step4);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
 /* -----------------------------------------------------------------------------
  * Platform Device Driver.
  */
@@ -1139,6 +1304,14 @@ static const struct rcar_csi2_info rcar_csi2_info_r8a77990 = {
 	.num_channels = 2,
 };
 
+static const struct rcar_csi2_info rcar_csi2_info_r8a779a0 = {
+	.init_phtw = rcsi2_init_phtw_v3u,
+	.hsfreqrange = hsfreqrange_v3u,
+	.csi0clkfreqrange = 0x20,
+	.clear_ulps = true,
+	.use_isp = true,
+};
+
 static const struct of_device_id rcar_csi2_of_table[] = {
 	{
 		.compatible = "renesas,r8a774a1-csi2",
@@ -1180,6 +1353,10 @@ static const struct of_device_id rcar_csi2_of_table[] = {
 		.compatible = "renesas,r8a77990-csi2",
 		.data = &rcar_csi2_info_r8a77990,
 	},
+	{
+		.compatible = "renesas,r8a779a0-csi2",
+		.data = &rcar_csi2_info_r8a779a0,
+	},
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, rcar_csi2_of_table);
@@ -1200,7 +1377,7 @@ static int rcsi2_probe(struct platform_device *pdev)
 {
 	const struct soc_device_attribute *attr;
 	struct rcar_csi2 *priv;
-	unsigned int i;
+	unsigned int i, num_pads;
 	int ret;
 
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -1245,11 +1422,13 @@ static int rcsi2_probe(struct platform_device *pdev)
 	priv->subdev.entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	priv->subdev.entity.ops = &rcar_csi2_entity_ops;
 
+	num_pads = priv->info->use_isp ? 2 : NR_OF_RCAR_CSI2_PAD;
+
 	priv->pads[RCAR_CSI2_SINK].flags = MEDIA_PAD_FL_SINK;
-	for (i = RCAR_CSI2_SOURCE_VC0; i < NR_OF_RCAR_CSI2_PAD; i++)
+	for (i = RCAR_CSI2_SOURCE_VC0; i < num_pads; i++)
 		priv->pads[i].flags = MEDIA_PAD_FL_SOURCE;
 
-	ret = media_entity_pads_init(&priv->subdev.entity, NR_OF_RCAR_CSI2_PAD,
+	ret = media_entity_pads_init(&priv->subdev.entity, num_pads,
 				     priv->pads);
 	if (ret)
 		goto error;
-- 
2.31.1

