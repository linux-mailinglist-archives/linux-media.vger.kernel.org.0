Return-Path: <linux-media+bounces-40070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D45B29870
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01A0718891CC
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 04:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9062A267F57;
	Mon, 18 Aug 2025 04:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="b5njzaBK"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E0526E161
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491899; cv=none; b=sKFXnM8YBBJxkHt8ex+9GjFGW1bB2gw2b68TVVQaWPLxqQO/iRdCVtoSLd5Acmf0pcz+LATypjEK58uutBACTIPSHRvyiUvSHfeG0363AmHM+ZRKKl2pqPi4uAq6XVXCs0DD6LdDHjsm0JMZZKADP/W3HpzQHUWMBtrgYo4W/Ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491899; c=relaxed/simple;
	bh=V9zpYZJ0SOrCrWDrny2E2S4qBUkfnjDs0pcm4qvLXpA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=VlQayA4DkAxkpZeYEyU+QerKFG1ygFIyjnrVfjwUOPuxp0FzaWnjFBwkGcQspSQvN3D99fwzNWUTyuRGJ/KENx3leI3yuimXUs5P/gEM8TiwZMAp/3V1n0XYFFnWlQEXC2mamRNSdFrvAxWNjpnaskqADG8EAWx7Mj9R79ddsAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=b5njzaBK; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250818043814epoutp02ec38f350fa98cb64d325213bf3f5930c~cwpPLpqRz1614616146epoutp02L
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:38:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250818043814epoutp02ec38f350fa98cb64d325213bf3f5930c~cwpPLpqRz1614616146epoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491894;
	bh=m9ZkW8lSJQacYy5k16zUHk1ns7J+VrJdAwnJg3DtuDQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b5njzaBKo0f8gEaYBu5IeAVRAxixLvYwHxLOUDxoijH2cBXj/sDEhaCVCeDHZlSNz
	 ZhI8aPTrkgYHb+N6YtBbj8WO6E3Oxfz7Ub6iqgUM4nHV2wZ16aSiS+0FQLX2RWNwS1
	 U8prQ64lLCUlXggWZhtdzWRU5a9rvcrkj/tRXEGU=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250818043812epcas5p2cedf1f13a8e2571ea1f055a287673855~cwpM3HAJ90138801388epcas5p29;
	Mon, 18 Aug 2025 04:38:12 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c50MR2br0z6B9m8; Mon, 18 Aug
	2025 04:38:11 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250814141046epcas5p3fd09b7e4ab34f521cf5ab548c41fb1d2~bp3_jKkY32367423674epcas5p3o;
	Thu, 14 Aug 2025 14:10:46 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141042epsmtip282557f34e7ca313b2fa072250b331b84~bp36tp36g1818718187epsmtip2Z;
	Thu, 14 Aug 2025 14:10:42 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 09/12] media: imx-mipi-csis: Add support for FSD CSI Rx
Date: Thu, 14 Aug 2025 19:39:40 +0530
Message-ID: <20250814140943.22531-10-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141046epcas5p3fd09b7e4ab34f521cf5ab548c41fb1d2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141046epcas5p3fd09b7e4ab34f521cf5ab548c41fb1d2
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141046epcas5p3fd09b7e4ab34f521cf5ab548c41fb1d2@epcas5p3.samsung.com>

The FSD SoC features a newer version(v4.3) of the CSI-2 receiver IP,
similar to the one found in the i.MX7 and i.MX8MM, with the following
differences.

- Ability to select any one VC for streaming from the four available
VCs.
- Built-in DMA support

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 304 +++++++++++++++++++--
 1 file changed, 276 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index c1653a738854..2ff2693dacf7 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -35,6 +35,8 @@
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mc.h>
 #include <media/v4l2-subdev.h>
+#include <linux/mfd/syscon.h>
+#include <linux/regmap.h>
 
 #define CSIS_DRIVER_NAME			"imx-mipi-csis"
 
@@ -45,6 +47,9 @@
 #define MIPI_CSIS_DEF_PIX_WIDTH			640
 #define MIPI_CSIS_DEF_PIX_HEIGHT		480
 
+/* CSIS V4_3 SYSREG macros */
+#define FSD_NO_CSI_PER_PHY_V4_3			4
+#define FSD_CSIS_RESETEN_DPHY_MASK_V4_3(phy)	BIT_MASK(phy)
 /* Register map definition */
 
 /* CSIS version */
@@ -55,7 +60,11 @@
 /* CSIS common control */
 #define MIPI_CSIS_CMN_CTRL			0x04
 #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(n)	BIT(((n) + 16))
-#define MIPI_CSIS_CMN_CTRL_INTER_MODE		BIT(10)
+#define MIPI_CSIS_CMN_CTRL_DESKEW_ENABLE	BIT(12)
+#define MIPI_CSIS_CMN_CTRL_INTER_MODE(n)	((n) << 10)
+#define MIPI_CSIS_CMN_CTRL_INTER_MODE_MASK	GENMASK(11, 10)
+#define MIPI_CSIS_CMN_CTRL_LANE_NUM(n)		((n) << 8)
+#define MIPI_CSIS_CMN_CTRL_LANE_NUM_MASK	GENMASK(9, 8)
 #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL	BIT(2)
 #define MIPI_CSIS_CMN_CTRL_RESET		BIT(1)
 #define MIPI_CSIS_CMN_CTRL_ENABLE		BIT(0)
@@ -64,13 +73,11 @@
 #define MIPI_CSIS_CMN_CTRL_LANE_NR_MASK		(3 << 8)
 
 /* CSIS clock control */
-#define MIPI_CSIS_CLK_CTRL			0x08
-#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH3(x)	((x) << 28)
-#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH2(x)	((x) << 24)
-#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH1(x)	((x) << 20)
-#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(x)	((x) << 16)
-#define MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK	(0xf << 4)
-#define MIPI_CSIS_CLK_CTRL_WCLK_SRC		BIT(0)
+#define MIPI_CSIS_CLK_CTRL				0x08
+#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH(n, val)	((val) << (16 + ((n) * 4)))
+#define MIPI_CSIS_CLK_CTRL_CLKGATE_EN(n)		(1 << ((n) + 4))
+#define MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK		(0xf << 4)
+#define MIPI_CSIS_CLK_CTRL_WCLK_SRC			BIT(0)
 
 /* CSIS Interrupt mask */
 #define MIPI_CSIS_INT_MSK			0x10
@@ -100,9 +107,9 @@
 #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)
 #define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
 #define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
-#define MIPI_CSIS_INT_SRC_ERR_SOT_HS		BIT(16)
-#define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
-#define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
+#define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)		BIT((16 + (n)))
+#define MIPI_CSIS_INT_SRC_ERR_LOST_FS(n)	BIT((12 + (n)))
+#define MIPI_CSIS_INT_SRC_ERR_LOST_FE(n)	BIT((8 + (n)))
 #define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
 #define MIPI_CSIS_INT_SRC_ERR_WRONG_CFG		BIT(3)
 #define MIPI_CSIS_INT_SRC_ERR_ECC		BIT(2)
@@ -110,6 +117,12 @@
 #define MIPI_CSIS_INT_SRC_ERR_UNKNOWN		BIT(0)
 #define MIPI_CSIS_INT_SRC_ERRORS		0xfffff
 
+/* CSIS Interrupt mask1 */
+#define MIPI_CSIS_INT_MSK1			0x18
+
+/* CSIS Interrupt source1 */
+#define MIPI_CSIS_INT_SRC1			0x1C
+
 /* D-PHY status control */
 #define MIPI_CSIS_DPHY_STATUS			0x20
 #define MIPI_CSIS_DPHY_STATUS_ULPS_DAT		BIT(8)
@@ -123,6 +136,7 @@
 #define MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE_MASK	GENMASK(31, 24)
 #define MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(n)	((n) << 22)
 #define MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE_MASK	GENMASK(23, 22)
+#define MIPI_CSIS_DPHY_CMN_CTRL_S_BYTE_CLK_EN	BIT(21)
 #define MIPI_CSIS_DPHY_CMN_CTRL_DPDN_SWAP_CLK	BIT(6)
 #define MIPI_CSIS_DPHY_CMN_CTRL_DPDN_SWAP_DAT	BIT(5)
 #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE_DAT	BIT(1)
@@ -170,7 +184,10 @@
 /* D-PHY Slave Control register Low */
 #define MIPI_CSIS_DPHY_SCTRL_L			0x38
 /* D-PHY Slave Control register High */
-#define MIPI_CSIS_DPHY_SCTRL_H			0x3c
+#define MIPI_CSIS_DPHY_SCTRL_H					0x3c
+#define MIPI_CSIS_DPHY_SCTRL_H_SKEW_CAL_MAX_SKEW_CODE_CTRL	(0x24 << 2)
+#define MIPI_CSIS_DPHY_SCTRL_H_SKEW_CAL_MAX_SKEW_CODE_CTRL_MASK GENMASK(7, 2)
+#define MIPI_CSIS_DPHY_SCTRL_H_SKEW_CAL_EN			BIT(1)
 
 /* ISP Configuration register */
 #define MIPI_CSIS_ISP_CONFIG_CH(n)		(0x40 + (n) * 0x10)
@@ -223,6 +240,12 @@
 
 #define MIPI_CSIS_FRAME_COUNTER_CH(n)		(0x0100 + (n) * 4)
 
+/* VC Passing register */
+#define MIPI_CSIS_VC_PASSING_REG	0x120
+#define MIPI_CSIS_VC_PASSING(n)		((n) << 8)
+#define MIPI_CSIS_VC_PASSING_MASK	GENMASK(9, 8)
+#define MIPI_CSIS_VC_PASSING_EN		BIT(7)
+
 /* Non-image packet data buffers */
 #define MIPI_CSIS_PKTDATA_ODD			0x2000
 #define MIPI_CSIS_PKTDATA_EVEN			0x3000
@@ -239,9 +262,18 @@ struct mipi_csis_event {
 
 static const struct mipi_csis_event mipi_csis_events[] = {
 	/* Errors */
-	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),	"SOT Lane0 Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),       "SOT Lane1 Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),       "SOT Lane2 Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),       "SOT Lane3 Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS(0),	"Lost Frame Start Error vc0" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS(1),      "Lost Frame Start Error vc1" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS(2),      "Lost Frame Start Error vc2" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS(3),      "Lost Frame Start Error vc3" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE(0),	"Lost Frame End Error vc0" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE(1),      "Lost Frame End Error vc1" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE(2),      "Lost Frame End Error vc2" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE(3),      "Lost Frame End Error vc3" },
 	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
 	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
 	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
@@ -266,6 +298,7 @@ static const struct mipi_csis_event mipi_csis_events[] = {
 };
 
 #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
+#define MIPI_CSIS_INT_SRC_NUM_EVENTS_V4_3	17
 
 #define MIPI_CSIS_MAX_CLOCKS	4
 
@@ -279,6 +312,7 @@ enum mipi_csis_clk {
 enum mipi_csis_version {
 	MIPI_CSIS_V3_3,
 	MIPI_CSIS_V3_6_3,
+	MIPI_CSIS_V4_3,
 };
 
 struct mipi_csis_info {
@@ -292,6 +326,8 @@ struct mipi_csis_info {
 struct mipi_csis_device {
 	struct device *dev;
 	void __iomem *regs;
+	struct regmap *sysreg_map;
+	unsigned int phy_rst_off;
 	struct clk_bulk_data *clks;
 	struct reset_control *mrst;
 	struct regulator *mipi_phy_regulator;
@@ -352,6 +388,11 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 		.output = MEDIA_BUS_FMT_RGB888_1X24,
 		.data_type = MIPI_CSI2_DT_RGB888,
 		.width = 24,
+	}, {
+		.code = MEDIA_BUS_FMT_RGB888_1X24,
+		.output = MEDIA_BUS_FMT_RGB888_1X24,
+		.data_type = MIPI_CSI2_DT_RGB888,
+		.width = 24,
 	},
 	/* RAW (Bayer and greyscale) formats. */
 	{
@@ -508,7 +549,11 @@ static inline void mipi_csis_write(struct mipi_csis_device *csis, u32 reg,
 static void mipi_csis_enable_interrupts(struct mipi_csis_device *csis, bool on)
 {
 	mipi_csis_write(csis, MIPI_CSIS_INT_MSK, on ? 0xffffffff : 0);
-	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_MSK, on ? 0xffffffff : 0);
+
+	if (csis->info->version == MIPI_CSIS_V4_3)
+		mipi_csis_write(csis, MIPI_CSIS_INT_MSK1, on ? 0xffffffff : 0);
+	else
+		mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_MSK, on ? 0xffffffff : 0);
 }
 
 static void mipi_csis_sw_reset(struct mipi_csis_device *csis)
@@ -537,6 +582,8 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
 		mask = (1 << (csis->bus.num_data_lanes + 1)) - 1;
 		val |= (mask & MIPI_CSIS_DPHY_CMN_CTRL_ENABLE);
 	}
+	if (csis->info->version == MIPI_CSIS_V4_3)
+		val |= MIPI_CSIS_DPHY_CMN_CTRL_S_BYTE_CLK_EN;
 	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL, val);
 }
 
@@ -549,7 +596,10 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
 
 	/* Color format */
 	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(vc));
-	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK
+	if (csis->info->version == MIPI_CSIS_V4_3)
+		val &= ~(MIPI_CSIS_ISPCFG_FMT_MASK | MIPI_CSIS_ISPCFG_PIXEL_MASK);
+	else
+		val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK
 		| MIPI_CSIS_ISPCFG_PIXEL_MASK);
 
 	/*
@@ -595,7 +645,7 @@ static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
 
 	lane_rate = link_freq * 2;
 
-	if (lane_rate < 80000000 || lane_rate > 1500000000) {
+	if (lane_rate < 80000000 || lane_rate > 1600000000) {
 		dev_dbg(csis->dev, "Out-of-bound lane rate %u\n", lane_rate);
 		return -EINVAL;
 	}
@@ -639,7 +689,11 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
 	val |= (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
 	if (csis->info->version == MIPI_CSIS_V3_3)
-		val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
+		val |= MIPI_CSIS_CMN_CTRL_INTER_MODE(1);
+	else if (csis->info->version == MIPI_CSIS_V4_3) {
+		val |= MIPI_CSIS_CMN_CTRL_INTER_MODE(3);
+		val |= MIPI_CSIS_CMN_CTRL_DESKEW_ENABLE;
+	}
 	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
 
 	__mipi_csis_set_format(csis, format, csis_fmt);
@@ -648,15 +702,23 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 			MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(csis->hs_settle) |
 			MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(csis->clk_settle));
 
-	val = (0 << MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET)
-	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET)
-	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET);
+	if (csis->info->version == MIPI_CSIS_V4_3)
+		val = 0x20 << MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET;
+	else
+		val = (0 << MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET)
+			| (0 << MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET)
+			| (0 << MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET);
 	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(vc), val);
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
-	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
-	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(15);
-	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
+	if (csis->info->version == MIPI_CSIS_V4_3) {
+		val |= MIPI_CSIS_CLK_CTRL_CLKGATE_EN(vc);
+		val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH(vc, 0x07);
+	} else {
+		val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
+		val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH(vc, 15);
+		val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
+	}
 	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
 
 	mipi_csis_write(csis, MIPI_CSIS_DPHY_BCTRL_L,
@@ -676,6 +738,24 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
 }
 
+static int mipi_csis_get_sysreg(struct mipi_csis_device *csis)
+{
+	unsigned int args;
+
+	if (csis->info->version != MIPI_CSIS_V4_3)
+		return 0;
+
+	csis->sysreg_map = syscon_regmap_lookup_by_phandle_args(
+			csis->dev->of_node, "samsung,syscon-csis", 1, &args);
+
+	if (IS_ERR(csis->sysreg_map))
+		return PTR_ERR(csis->sysreg_map);
+
+	csis->phy_rst_off = args;
+
+	return 0;
+}
+
 static int mipi_csis_clk_enable(struct mipi_csis_device *csis)
 {
 	return clk_bulk_prepare_enable(csis->info->num_clocks, csis->clks);
@@ -715,11 +795,71 @@ static int mipi_csis_clk_get(struct mipi_csis_device *csis)
 	return ret;
 }
 
+static void mipi_csis_dphy_reset_release_v4_3(struct mipi_csis_device *csis)
+{
+	unsigned int idx = 0, val = 0x0;
+
+	/* There are 4 CSIs per each D-PHY i/f */
+	idx = csis->vc;
+
+	regmap_read(csis->sysreg_map, csis->phy_rst_off, &val);
+
+	val &= ~FSD_CSIS_RESETEN_DPHY_MASK_V4_3(idx);
+	regmap_write(csis->sysreg_map, csis->phy_rst_off, val);
+
+	usleep_range(500, 1000);
+
+	val |= FSD_CSIS_RESETEN_DPHY_MASK_V4_3(idx);
+	regmap_write(csis->sysreg_map, csis->phy_rst_off, val);
+}
+
+static void mipi_csis_dphy_init_v4_3(struct mipi_csis_device *csis)
+{
+	u32 val = 0;
+
+	mipi_csis_dphy_reset_release_v4_3(csis);
+
+	val = readl(csis->regs + MIPI_CSIS_DPHY_SCTRL_H);
+
+	val |= MIPI_CSIS_DPHY_SCTRL_H_SKEW_CAL_EN;
+	val |= MIPI_CSIS_DPHY_SCTRL_H_SKEW_CAL_MAX_SKEW_CODE_CTRL;
+	writel(val, csis->regs + MIPI_CSIS_DPHY_SCTRL_H);
+}
+
+static void mipi_csis_set_vc_passing(struct mipi_csis_device *csis)
+{
+	u32 val;
+	unsigned int vc = csis->vc;
+
+	val = readl(csis->regs + MIPI_CSIS_VC_PASSING_REG);
+
+	val &= ~MIPI_CSIS_VC_PASSING_MASK;
+	val |= MIPI_CSIS_VC_PASSING(vc);
+	val |= MIPI_CSIS_VC_PASSING_EN;
+	writel(val, csis->regs + MIPI_CSIS_VC_PASSING_REG);
+}
+
+static void mipi_csis_get_irq_status(struct mipi_csis_device *csis,
+		unsigned int *sts)
+{
+	*sts = readl(csis->regs + MIPI_CSIS_INT_SRC1);
+}
+
+static void mipi_csis_clear_irq_status(struct mipi_csis_device *csis,
+		unsigned int *sts)
+{
+	writel(*sts, csis->regs + MIPI_CSIS_INT_SRC1);
+}
+
 static void mipi_csis_start_stream(struct mipi_csis_device *csis,
 				   const struct v4l2_mbus_framefmt *format,
 				   const struct csis_pix_format *csis_fmt)
 {
 	mipi_csis_sw_reset(csis);
+	if (csis->info->version == MIPI_CSIS_V4_3) {
+		mipi_csis_dphy_init_v4_3(csis);
+		mipi_csis_set_vc_passing(csis);
+	}
 	mipi_csis_set_params(csis, format, csis_fmt);
 	mipi_csis_system_enable(csis, true);
 	mipi_csis_enable_interrupts(csis, true);
@@ -743,6 +883,31 @@ static void mipi_csis_queue_event_sof(struct mipi_csis_device *csis)
 	v4l2_event_queue(csis->sd.devnode, &event);
 }
 
+static irqreturn_t mipi_csis_irq_handler_v4_3(int irq, void *dev_id)
+{
+	struct mipi_csis_device *csis = dev_id;
+	unsigned long flags;
+	u32 status;
+	unsigned int i;
+
+	status = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
+
+	spin_lock_irqsave(&csis->slock, flags);
+	if ((status & MIPI_CSIS_INT_SRC_ERRORS)) {
+		for (i = 0; i < MIPI_CSIS_INT_SRC_NUM_EVENTS_V4_3; i++) {
+			struct mipi_csis_event *event = &csis->events[i];
+
+			if (status & event->mask)
+				event->counter++;
+		}
+	}
+	spin_unlock_irqrestore(&csis->slock, flags);
+
+	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status);
+
+	return IRQ_NONE;
+}
+
 static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 {
 	struct mipi_csis_device *csis = dev_id;
@@ -950,6 +1115,34 @@ static void mipi_csis_debugfs_exit(struct mipi_csis_device *csis)
  * V4L2 subdev operations
  */
 
+static int mipi_csis_get_vc(struct mipi_csis_device *csis)
+{
+	struct v4l2_mbus_frame_desc fd = { };
+	int ret;
+
+	ret = v4l2_subdev_call(csis->source.sd, pad, get_frame_desc, csis->source.pad->index, &fd);
+	if (ret < 0 && ret != -ENOIOCTLCMD) {
+		dev_err(csis->dev, "get_frame_desc failed on source subdev\n");
+		return ret;
+	}
+
+	/* If remote subdev does not implement ..get_frame_desc default to VC0 */
+	if (ret == -ENOIOCTLCMD)
+		return 0;
+
+	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_err(csis->dev, "get_frame_desc returned invalid bus type %d\n", fd.type);
+		return -EINVAL;
+	}
+
+	if (!fd.num_entries) {
+		dev_err(csis->dev, "get_frame_desc returned zero enteries\n");
+		return -EINVAL;
+	}
+
+	return fd.entry[0].bus.csi2.vc;
+}
+
 static struct mipi_csis_device *sd_to_mipi_csis_device(struct v4l2_subdev *sdev)
 {
 	return container_of(sdev, struct mipi_csis_device, sd);
@@ -963,8 +1156,6 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	struct v4l2_subdev_state *state;
 	int ret;
 
-	csis->vc = 0;
-
 	if (!enable) {
 		v4l2_subdev_disable_streams(csis->source.sd,
 					    csis->source.pad->index, BIT(0));
@@ -1015,6 +1206,39 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+static void mipi_csis_read_vc_frame_counter(struct mipi_csis_device *csis,
+		u32 *current_frame_counter)
+{
+	unsigned int vc = csis->vc;
+	*current_frame_counter = readl(csis->regs + MIPI_CSIS_FRAME_COUNTER_CH(vc));
+}
+
+static long mipi_csis_command(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
+{
+	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
+	long ret = 0;
+
+	switch (cmd) {
+	case 1:
+		mipi_csis_system_enable(csis, true);
+		break;
+	case 2:
+		mipi_csis_get_irq_status(csis, arg);
+		break;
+	case 3:
+		mipi_csis_clear_irq_status(csis, arg);
+		break;
+	case 5:
+		mipi_csis_read_vc_frame_counter(csis, arg);
+		break;
+	default:
+		dev_err(csis->dev, "Invalid command\n");
+		ret = -1;
+	}
+
+	return ret;
+}
+
 static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 				    struct v4l2_subdev_state *sd_state,
 				    struct v4l2_subdev_mbus_code_enum *code)
@@ -1122,6 +1346,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 				    struct v4l2_mbus_frame_desc *fd)
 {
+	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
 	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
 	const struct csis_pix_format *csis_fmt;
 	const struct v4l2_mbus_framefmt *fmt;
@@ -1143,7 +1368,7 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 
 	entry->flags = 0;
 	entry->pixelcode = csis_fmt->code;
-	entry->bus.csi2.vc = 0;
+	entry->bus.csi2.vc = csis->vc;
 	entry->bus.csi2.dt = csis_fmt->data_type;
 
 	return 0;
@@ -1198,6 +1423,7 @@ static const struct v4l2_subdev_core_ops mipi_csis_core_ops = {
 	.log_status	= mipi_csis_log_status,
 	.subscribe_event =  mipi_csis_subscribe_event,
 	.unsubscribe_event = v4l2_event_subdev_unsubscribe,
+	.command = mipi_csis_command,
 };
 
 static const struct v4l2_subdev_video_ops mipi_csis_video_ops = {
@@ -1232,6 +1458,7 @@ static int mipi_csis_link_setup(struct media_entity *entity,
 	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
 	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
 	struct v4l2_subdev *remote_sd;
+	int ret;
 
 	dev_dbg(csis->dev, "link setup %s -> %s", remote_pad->entity->name,
 		local_pad->entity->name);
@@ -1248,6 +1475,14 @@ static int mipi_csis_link_setup(struct media_entity *entity,
 
 		csis->source.sd = remote_sd;
 		csis->source.pad = remote_pad;
+
+		ret = mipi_csis_get_vc(csis);
+
+		if (ret < 0)
+			return -EBUSY;
+
+		csis->vc = ret;
+
 	} else {
 		csis->source.sd = NULL;
 		csis->source.pad = NULL;
@@ -1472,6 +1707,10 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	ret = mipi_csis_get_sysreg(csis);
+	if (ret < 0)
+		return ret;
+
 	ret = mipi_csis_phy_init(csis);
 	if (ret < 0)
 		return ret;
@@ -1570,6 +1809,15 @@ static const struct of_device_id mipi_csis_of_match[] = {
 			.irq_flag = 0,
 			.irq_handler = mipi_csis_irq_handler,
 		},
+	}, {
+		.compatible = "tesla,fsd-mipi-csi2",
+		.data = &(const struct mipi_csis_info){
+			.version = MIPI_CSIS_V4_3,
+			.num_clocks = 2,
+			.clk_names = { "aclk", "pclk"},
+			.irq_flag = IRQF_SHARED,
+			.irq_handler = mipi_csis_irq_handler_v4_3,
+		},
 	},
 	{ /* sentinel */ },
 };
-- 
2.49.0


