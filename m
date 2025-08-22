Return-Path: <linux-media+bounces-40696-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1C0B30A55
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6AD71D007C5
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 00:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D0918C332;
	Fri, 22 Aug 2025 00:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GOLLriaP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE497464;
	Fri, 22 Aug 2025 00:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822492; cv=none; b=bc5tE93eYE5q8rzNbBSyuhwIapcV9mTtLac0enAmG6SOdXasryWkwKgJ3tt9l0s/ajR/+TpsdE6h4HS5FhEsgnbtOoBzQ734dzlF0vVAFFwbHF8w3biZMVYXvK67MG4sW1osJ9rRVtoU0Ht5cmxEiWu5IO2oYSHPy4MZzK3Fx4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822492; c=relaxed/simple;
	bh=obRw6ILbVFNGLWqlfWuGaYi5bJxVdKAwGemM4GC4SlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V5WmmekQq7MXNfY2+kqvkOMSrABvwJHSyF16UFnzwkn55DNO21GmTF9X5ECClp1p+kdnTicj9fN7S0jbpwj0mqIlN4aq6faPQGRcnoLC1PBHPfKlQzCOI+5oGikE3wU+klmuGfyMS37mSq1+E9pXUUc+53N1QpkRcAA/UqoW6eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GOLLriaP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 10D0A228;
	Fri, 22 Aug 2025 02:27:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822428;
	bh=obRw6ILbVFNGLWqlfWuGaYi5bJxVdKAwGemM4GC4SlM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GOLLriaP6/jChI6gjQBJ1yeBldYRk2mmx7WoSuOPaZpAN8JaTQVThWNzzJa7AIZNk
	 dD3iAZBZwMOSPXsf5dbF5qQek+HWimRQJZm8SLHAzi98LF1vG29QN0BD0vt5/yE/tp
	 IHPOKn+52oR/Qk5rkDewIluuMe8kICwEx/MOcSRE=
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
Subject: [PATCH v3 06/13] media: imx-mipi-csis: Use GENMASK for all register field masks
Date: Fri, 22 Aug 2025 03:27:26 +0300
Message-ID: <20250822002734.23516-7-laurent.pinchart@ideasonboard.com>
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

Multiple register field mask macros use GENMASK, while other define the
mask value manually. Standardize on GENMASK everywhere, as well as on
the _MASK suffix to name the macros. This improves consistency and helps
with readability.

No functional change is intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index ce889c436cb1..50f6f4468f7b 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -57,7 +57,7 @@
 #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
 #define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT	BIT(10)
 #define MIPI_CSIS_CMN_CTRL_LANE_NUMBER(n)	((n) << 8)
-#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK	(3 << 8)
+#define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK	GENMASK(9, 8)
 #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL	BIT(2)
 #define MIPI_CSIS_CMN_CTRL_SW_RESET		BIT(1)
 #define MIPI_CSIS_CMN_CTRL_CSI_EN		BIT(0)
@@ -68,7 +68,7 @@
 #define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH2(x)	((x) << 24)
 #define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH1(x)	((x) << 20)
 #define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(x)	((x) << 16)
-#define MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK	(0xf << 4)
+#define MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK	GENMASK(7, 4)
 #define MIPI_CSIS_CLK_CTRL_WCLK_SRC		BIT(0)
 
 /* CSIS Interrupt mask */
@@ -173,15 +173,15 @@
 
 /* ISP Configuration register */
 #define MIPI_CSIS_ISP_CONFIG_CH(n)		(0x40 + (n) * 0x10)
-#define MIPI_CSIS_ISPCFG_MEM_FULL_GAP_MSK	(0xff << 24)
+#define MIPI_CSIS_ISPCFG_MEM_FULL_GAP_MASK	GENMASK(31, 24)
 #define MIPI_CSIS_ISPCFG_MEM_FULL_GAP(x)	((x) << 24)
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_SINGLE	(0 << 12)
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL	(1 << 12)
 #define MIPI_CSIS_ISPCFG_PIXEL_MODE_QUAD	(2 << 12)	/* i.MX8M[MNP] only */
-#define MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK	(3 << 12)
+#define MIPI_CSIS_ISPCFG_PIXEL_MODE_MASK	GENMASK(13, 12)
 #define MIPI_CSIS_ISPCFG_PARALLEL		BIT(11)
 #define MIPI_CSIS_ISPCFG_DATAFORMAT(fmt)	((fmt) << 2)
-#define MIPI_CSIS_ISPCFG_DATAFORMAT_MASK	(0x3f << 2)
+#define MIPI_CSIS_ISPCFG_DATAFORMAT_MASK	GENMASK(7, 2)
 
 /* ISP Image Resolution register */
 #define MIPI_CSIS_ISP_RESOL_CH(n)		(0x44 + (n) * 0x10)
@@ -655,7 +655,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
 	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
 	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(15);
-	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MSK;
+	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK;
 	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
 
 	mipi_csis_write(csis, MIPI_CSIS_DPHY_BCTRL_L,
-- 
Regards,

Laurent Pinchart


