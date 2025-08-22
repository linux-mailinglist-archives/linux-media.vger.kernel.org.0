Return-Path: <linux-media+bounces-40695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 217B2B30A52
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE9142A4580
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 00:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA9D6DCE1;
	Fri, 22 Aug 2025 00:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kqGVBW9K"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40737464;
	Fri, 22 Aug 2025 00:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822489; cv=none; b=m5Pc+Kt7oj8fNLwVDMCrguvunLh8jxcfILU6CK2swV1eUAbRhi5QCpO86v63k7/tD2VCBK1mwQP10cAatzAC4wozeptYtYb2ENVl3wovlFuQfB/ID3kWrEveqzg70FjgXVU1ykk/gsl80VzAOemW6PRNwRk2FZh4Tj+xdhOq5TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822489; c=relaxed/simple;
	bh=dOaHyCDUDzxUe1iu2eGKkVea8QsgSYUANuutZCzeE7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4IflV/laA9PIQfP/PeiW+OKOJmrxBEIA66YijhhPa/X87rp2wexJzNsC2e7koxqzTskD3ZgWBUHM1m/0j8MO7cBN2Iq6CRjr7Oib4FN+osTHV8MMd1+YuN8OefCZZ9oS8CUAb+sJEy/xtZu36L5EkbpqC9gOO+Wb+iwUaiMhkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kqGVBW9K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 86E7578E;
	Fri, 22 Aug 2025 02:27:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822426;
	bh=dOaHyCDUDzxUe1iu2eGKkVea8QsgSYUANuutZCzeE7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kqGVBW9KmI3Isky6vtR4nl9TznSUUcs49/aAn+fRkK+NY0qPnh3hY1aabPLuspE74
	 J1k4HfYlzoabu9HlAp2l/d50Jy+gcRywJ0HSYJ1laUUEZjWyl4A5CjMC2pldxAxg8r
	 xcCTY+8TreiJjSBY6+f83A7hDBREYIM+2iq8FubQ=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 05/13] media: imx-mipi-csis: Rename register macros to match reference manual
Date: Fri, 22 Aug 2025 03:27:25 +0300
Message-ID: <20250822002734.23516-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The CSIS driver uses register macro names that do not match the
reference manual of the i.MX7[DS] and i.MX8M[MNP] SoCs in which the CSIS
is integrated. Rename them to match the documentation, making the code
easier to read alongside the reference manuals.

One of the misnamed register fields is MIPI_CSIS_INT_SRC_ERR_UNKNOWN,
which led to the corresponding event being logged as "Unknown Error".
The correct register field name is MIPI_CSIS_INT_SRC_ERR_ID, documented
as "Unknown ID error". Update the event description accordingly.

While at it, also replace a few *_OFFSET macros with parametric macros
for consistency, and add the missing MIPI_CSIS_ISP_RESOL_VRESOL and
MIPI_CSIS_ISP_RESOL_HRESOL register field macros.

No functional change intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Drop MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_NONE
- Restore usage of BIT() for MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 68 +++++++++++-----------
 1 file changed, 35 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 894d12fef519..ce889c436cb1 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -55,13 +55,12 @@
 /* CSIS common control */
 #define MIPI_CSIS_CMN_CTRL			0x04
 #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
-#define MIPI_CSIS_CMN_CTRL_INTER_MODE		BIT(10)
+#define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT	BIT(10)
+#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER(n)	((n) << 8)
+#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK	(3 << 8)
 #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL	BIT(2)
-#define MIPI_CSIS_CMN_CTRL_RESET		BIT(1)
-#define MIPI_CSIS_CMN_CTRL_ENABLE		BIT(0)
-
-#define MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET	8
-#define MIPI_CSIS_CMN_CTRL_LANE_NR_MASK		(3 << 8)
+#define MIPI_CSIS_CMN_CTRL_SW_RESET		BIT(1)
+#define MIPI_CSIS_CMN_CTRL_CSI_EN		BIT(0)
 
 /* CSIS clock control */
 #define MIPI_CSIS_CLK_CTRL			0x08
@@ -87,7 +86,7 @@
 #define MIPI_CSIS_INT_MSK_ERR_WRONG_CFG		BIT(3)
 #define MIPI_CSIS_INT_MSK_ERR_ECC		BIT(2)
 #define MIPI_CSIS_INT_MSK_ERR_CRC		BIT(1)
-#define MIPI_CSIS_INT_MSK_ERR_UNKNOWN		BIT(0)
+#define MIPI_CSIS_INT_MSK_ERR_ID		BIT(0)
 
 /* CSIS Interrupt source */
 #define MIPI_CSIS_INT_SRC			0x14
@@ -107,7 +106,7 @@
 #define MIPI_CSIS_INT_SRC_ERR_WRONG_CFG		BIT(3)
 #define MIPI_CSIS_INT_SRC_ERR_ECC		BIT(2)
 #define MIPI_CSIS_INT_SRC_ERR_CRC		BIT(1)
-#define MIPI_CSIS_INT_SRC_ERR_UNKNOWN		BIT(0)
+#define MIPI_CSIS_INT_SRC_ERR_ID		BIT(0)
 #define MIPI_CSIS_INT_SRC_ERRORS		0xfffff
 
 /* D-PHY status control */
@@ -123,8 +122,8 @@
 #define MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE_MASK	GENMASK(31, 24)
 #define MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(n)	((n) << 22)
 #define MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE_MASK	GENMASK(23, 22)
-#define MIPI_CSIS_DPHY_CMN_CTRL_DPDN_SWAP_CLK	BIT(6)
-#define MIPI_CSIS_DPHY_CMN_CTRL_DPDN_SWAP_DAT	BIT(5)
+#define MIPI_CSIS_DPHY_CMN_CTRL_S_DPDN_SWAP_CLK	BIT(6)
+#define MIPI_CSIS_DPHY_CMN_CTRL_S_DPDN_SWAP_DAT	BIT(5)
 #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE_DAT	BIT(1)
 #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE_CLK	BIT(0)
 #define MIPI_CSIS_DPHY_CMN_CTRL_ENABLE		(0x1f << 0)
@@ -179,21 +178,23 @@
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_SINGLE	(0 << 12)
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL	(1 << 12)
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD	(2 << 12)	/* i.MX8M[MNP] only */
-#define MIPI_CSIS_ISPCFG_PIXEL_MASK		(3 << 12)
-#define MIPI_CSIS_ISPCFG_ALIGN_32BIT		BIT(11)
-#define MIPI_CSIS_ISPCFG_FMT(fmt)		((fmt) << 2)
-#define MIPI_CSIS_ISPCFG_FMT_MASK		(0x3f << 2)
+#define MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK	(3 << 12)
+#define MIPI_CSIS_ISPCFG_PARALLEL		BIT(11)
+#define MIPI_CSIS_ISPCFG_DATAFORMAT(fmt)	((fmt) << 2)
+#define MIPI_CSIS_ISPCFG_DATAFORMAT_MASK	(0x3f << 2)
 
 /* ISP Image Resolution register */
 #define MIPI_CSIS_ISP_RESOL_CH(n)		(0x44 + (n) * 0x10)
+#define MIPI_CSIS_ISP_RESOL_VRESOL(n)		((n) << 16)
+#define MIPI_CSIS_ISP_RESOL_HRESOL(n)		((n) << 0)
 #define CSIS_MAX_PIX_WIDTH			0xffff
 #define CSIS_MAX_PIX_HEIGHT			0xffff
 
 /* ISP SYNC register */
 #define MIPI_CSIS_ISP_SYNC_CH(n)		(0x48 + (n) * 0x10)
-#define MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET	18
-#define MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET	12
-#define MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET	0
+#define MIPI_CSIS_ISP_SYNC_HSYNC_LINTV(n)	((n) << 18)
+#define MIPI_CSIS_ISP_SYNC_VSYNC_SINTV(n)	((n) << 12)
+#define MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(n)	((n) << 0)
 
 /* ISP shadow registers */
 #define MIPI_CSIS_SDW_CONFIG_CH(n)		(0x80 + (n) * 0x10)
@@ -246,7 +247,7 @@ static const struct mipi_csis_event mipi_csis_events[] = {
 	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
 	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
 	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
+	{ false, MIPI_CSIS_INT_SRC_ERR_ID,		"Unknown ID Error" },
 	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
 	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
 	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
@@ -517,7 +518,7 @@ static void mipi_csis_sw_reset(struct mipi_csis_device *csis)
 	u32 val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
 
 	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
-			val | MIPI_CSIS_CMN_CTRL_RESET);
+			val | MIPI_CSIS_CMN_CTRL_SW_RESET);
 	usleep_range(10, 20);
 }
 
@@ -527,9 +528,9 @@ static void mipi_csis_system_enable(struct mipi_csis_device *csis, int on)
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
 	if (on)
-		val |= MIPI_CSIS_CMN_CTRL_ENABLE;
+		val |= MIPI_CSIS_CMN_CTRL_CSI_EN;
 	else
-		val &= ~MIPI_CSIS_CMN_CTRL_ENABLE;
+		val &= ~MIPI_CSIS_CMN_CTRL_CSI_EN;
 	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
 
 	val = mipi_csis_read(csis, MIPI_CSIS_DPHY_CMN_CTRL);
@@ -549,8 +550,8 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
 
 	/* Color format */
 	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(0));
-	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK
-		| MIPI_CSIS_ISPCFG_PIXEL_MASK);
+	val &= ~(MIPI_CSIS_ISPCFG_PARALLEL | MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK |
+		 MIPI_CSIS_ISPCFG_DATAFORMAT_MASK);
 
 	/*
 	 * YUV 4:2:2 can be transferred with 8 or 16 bits per clock sample
@@ -568,12 +569,13 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
 	if (csis_fmt->data_type == MIPI_CSI2_DT_YUV422_8B)
 		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
 
-	val |= MIPI_CSIS_ISPCFG_FMT(csis_fmt->data_type);
+	val |= MIPI_CSIS_ISPCFG_DATAFORMAT(csis_fmt->data_type);
 	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(0), val);
 
 	/* Pixel resolution */
-	val = format->width | (format->height << 16);
-	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(0), val);
+	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(0),
+			MIPI_CSIS_ISP_RESOL_VRESOL(format->height) |
+			MIPI_CSIS_ISP_RESOL_HRESOL(format->width));
 }
 
 static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
@@ -633,10 +635,10 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 	u32 val;
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
-	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
-	val |= (lanes - 1) << MIPI_CSIS_CMN_CTRL_LANE_NR_OFFSET;
+	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK;
+	val |= MIPI_CSIS_CMN_CTRL_LANE_NUMBER(lanes - 1);
 	if (csis->info->version == MIPI_CSIS_V3_3)
-		val |= MIPI_CSIS_CMN_CTRL_INTER_MODE;
+		val |= MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT;
 	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
 
 	__mipi_csis_set_format(csis, format, csis_fmt);
@@ -645,10 +647,10 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 			MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(csis->hs_settle) |
 			MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(csis->clk_settle));
 
-	val = (0 << MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET)
-	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET)
-	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET);
-	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(0), val);
+	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(0),
+			MIPI_CSIS_ISP_SYNC_HSYNC_LINTV(0) |
+			MIPI_CSIS_ISP_SYNC_VSYNC_SINTV(0) |
+			MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(0));
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
 	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
-- 
Regards,

Laurent Pinchart


