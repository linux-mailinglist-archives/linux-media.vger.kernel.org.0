Return-Path: <linux-media+bounces-40702-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30138B30A5E
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D650F1D00812
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 00:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E31A1A256E;
	Fri, 22 Aug 2025 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="liuTxzvz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58FD2BAF4;
	Fri, 22 Aug 2025 00:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822503; cv=none; b=Nv1pXeEB7NothA9GLQl6A005V/OoBqZwtjhRWw5mrbDUHUAJH7YS9TOkkJp0J8lOipPKAcV2nvPMi3l4PZ4kYdfMS1fUPkvGwjTNF83I7qSvji0m+DNQekMy6YkqK3nbjzs33ZdM2f7nXpih+xZ4zpUxdw0ISKeWeSmSiFhQ/NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822503; c=relaxed/simple;
	bh=GcAXScu7lBHj2mCWOezJ5plYP+PodSRG4o1P3aU0Zok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HqOYkYvNwKrAW3Bj15KEKP+dnmGCf6zeTw40B1XSMfylybcxVsAVwgZLZIgF21a+n+H4I5Rz543pyYY1tvV6gsapD67M9aaGGI8HxZt5PRLiggDSWaM5gz8qfTGF4xM2+2vnJD6ntSUEjtRQHIHz5QwEqbxybwNUEpSm2Beg5aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=liuTxzvz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 76D74228;
	Fri, 22 Aug 2025 02:27:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822437;
	bh=GcAXScu7lBHj2mCWOezJ5plYP+PodSRG4o1P3aU0Zok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=liuTxzvzY+nIpMCp4XWwkBX+KRcFwI07bOV189OEpycmSqD85edHJkbcg45D53f5p
	 iQyP2JMv0qcDqvsTLenlQVQyHjUfninHGRA0ENz+MBgPmyV2ErXREYFNRP9A9GTidn
	 Qj1bHy1D8zJBlG2A85qMioffZdwre/CWQhMqOVBs=
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
Subject: [PATCH v3 12/13] media: imx-mipi-csis: Initial support for multiple output channels
Date: Fri, 22 Aug 2025 03:27:32 +0300
Message-ID: <20250822002734.23516-13-laurent.pinchart@ideasonboard.com>
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

Some CSIS instances feature more than one output channel. Update
register macros accordingly, parse the number of channels from the
device tree, and update register dumps and event counters to log
per-channel data.

Support for routing virtual channels and data types to output channels
through the subdev internal routing API will come later.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Update more per-channel registers
- Update commit message
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 239 +++++++++++++--------
 1 file changed, 152 insertions(+), 87 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index e1588990beda..ee8e541dcb1d 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -54,7 +54,7 @@
 
 /* CSIS common control */
 #define MIPI_CSIS_CMN_CTRL			0x04
-#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
+#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(n)	BIT((n) + 16)
 #define MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT	BIT(10)
 #define MIPI_CSIS_CMN_CTRL_LANE_NUMBER(n)	((n) << 8)
 #define MIPI_CSIS_CMN_CTRL_LANE_NUMBER_MASK	GENMASK(9, 8)
@@ -64,12 +64,9 @@
 
 /* CSIS clock control */
 #define MIPI_CSIS_CLK_CTRL			0x08
-#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH3(x)	((x) << 28)
-#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH2(x)	((x) << 24)
-#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH1(x)	((x) << 20)
-#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(x)	((x) << 16)
+#define MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(n, x)	((x) << ((n) * 4 + 16))
 #define MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK	GENMASK(7, 4)
-#define MIPI_CSIS_CLK_CTRL_WCLK_SRC		BIT(0)
+#define MIPI_CSIS_CLK_CTRL_WCLK_SRC(n)		BIT(n)
 
 /* CSIS Interrupt mask */
 #define MIPI_CSIS_INT_MSK			0x10
@@ -97,12 +94,12 @@
 #define MIPI_CSIS_INT_SRC_ODD_AFTER		BIT(28)
 #define MIPI_CSIS_INT_SRC_ODD			(0x3 << 28)
 #define MIPI_CSIS_INT_SRC_NON_IMAGE_DATA	(0xf << 28)
-#define MIPI_CSIS_INT_SRC_FRAME_START		BIT(24)
-#define MIPI_CSIS_INT_SRC_FRAME_END		BIT(20)
+#define MIPI_CSIS_INT_SRC_FRAME_START(n)	BIT((n) + 24)
+#define MIPI_CSIS_INT_SRC_FRAME_END(n)		BIT((n) + 20)
 #define MIPI_CSIS_INT_SRC_ERR_SOT_HS(n)		BIT((n) + 16)
-#define MIPI_CSIS_INT_SRC_ERR_LOST_FS		BIT(12)
-#define MIPI_CSIS_INT_SRC_ERR_LOST_FE		BIT(8)
-#define MIPI_CSIS_INT_SRC_ERR_OVER		BIT(4)
+#define MIPI_CSIS_INT_SRC_ERR_LOST_FS(n)	BIT((n) + 12)
+#define MIPI_CSIS_INT_SRC_ERR_LOST_FE(n)	BIT((n) + 8)
+#define MIPI_CSIS_INT_SRC_ERR_OVER(n)		BIT((n) + 4)
 #define MIPI_CSIS_INT_SRC_ERR_WRONG_CFG		BIT(3)
 #define MIPI_CSIS_INT_SRC_ERR_ECC		BIT(2)
 #define MIPI_CSIS_INT_SRC_ERR_CRC		BIT(1)
@@ -204,23 +201,23 @@
 /* Debug control register */
 #define MIPI_CSIS_DBG_CTRL			0xc0
 #define MIPI_CSIS_DBG_INTR_MSK			0xc4
-#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT	BIT(25)
-#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE	BIT(24)
-#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE	BIT(20)
-#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME	BIT(16)
-#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE		BIT(12)
-#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS		BIT(8)
-#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL	BIT(4)
-#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE	BIT(0)
+#define MIPI_CSIS_DBG_INTR_MSK_DT_NOT_SUPPORT		BIT(25)
+#define MIPI_CSIS_DBG_INTR_MSK_DT_IGNORE		BIT(24)
+#define MIPI_CSIS_DBG_INTR_MSK_ERR_FRAME_SIZE(n)	BIT((n) + 20)
+#define MIPI_CSIS_DBG_INTR_MSK_TRUNCATED_FRAME(n)	BIT((n) + 16)
+#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FE(n)		BIT((n) + 12)
+#define MIPI_CSIS_DBG_INTR_MSK_EARLY_FS(n)		BIT((n) + 8)
+#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_FALL(n)	BIT((n) + 4)
+#define MIPI_CSIS_DBG_INTR_MSK_CAM_VSYNC_RISE(n)	BIT((n) + 0)
 #define MIPI_CSIS_DBG_INTR_SRC			0xc8
-#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT	BIT(25)
-#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE	BIT(24)
-#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE	BIT(20)
-#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME	BIT(16)
-#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE		BIT(12)
-#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS		BIT(8)
-#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL	BIT(4)
-#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE	BIT(0)
+#define MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT		BIT(25)
+#define MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE		BIT(24)
+#define MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(n)	BIT((n) + 20)
+#define MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(n)	BIT((n) + 16)
+#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(n)		BIT((n) + 12)
+#define MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(n)		BIT((n) + 8)
+#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(n)	BIT((n) + 4)
+#define MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(n)	BIT((n) + 0)
 
 #define MIPI_CSIS_FRAME_COUNTER_CH(n)		(0x0100 + (n) * 4)
 
@@ -229,8 +226,11 @@
 #define MIPI_CSIS_PKTDATA_EVEN			0x3000
 #define MIPI_CSIS_PKTDATA_SIZE			SZ_4K
 
+#define MIPI_CSIS_MAX_CHANNELS			4
+
 struct mipi_csis_event {
 	bool debug;
+	unsigned int channel;
 	u32 mask;
 	const char * const name;
 	unsigned int counter;
@@ -238,36 +238,70 @@ struct mipi_csis_event {
 
 static const struct mipi_csis_event mipi_csis_events[] = {
 	/* Errors */
-	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),	"SOT 0 Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),	"SOT 1 Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),	"SOT 2 Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),	"SOT 3 Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_ID,		"Unknown ID Error" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early Frame End" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early Frame Start" },
+	{ false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(0),		"SOT 0 Error" },
+	{ false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(1),		"SOT 1 Error" },
+	{ false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(2),		"SOT 2 Error" },
+	{ false, 0, MIPI_CSIS_INT_SRC_ERR_SOT_HS(3),		"SOT 3 Error" },
+	{ false, 0, MIPI_CSIS_INT_SRC_ERR_LOST_FS(0),		"Lost Frame Start Error 0" },
+	{ false, 1, MIPI_CSIS_INT_SRC_ERR_LOST_FS(1),		"Lost Frame Start Error 1" },
+	{ false, 2, MIPI_CSIS_INT_SRC_ERR_LOST_FS(2),		"Lost Frame Start Error 2" },
+	{ false, 3, MIPI_CSIS_INT_SRC_ERR_LOST_FS(3),		"Lost Frame Start Error 3" },
+	{ false, 0, MIPI_CSIS_INT_SRC_ERR_LOST_FE(0),		"Lost Frame End Error 0" },
+	{ false, 1, MIPI_CSIS_INT_SRC_ERR_LOST_FE(1),		"Lost Frame End Error 1" },
+	{ false, 2, MIPI_CSIS_INT_SRC_ERR_LOST_FE(2),		"Lost Frame End Error 2" },
+	{ false, 3, MIPI_CSIS_INT_SRC_ERR_LOST_FE(3),		"Lost Frame End Error 3" },
+	{ false, 0, MIPI_CSIS_INT_SRC_ERR_OVER(0),		"FIFO Overflow Error 0" },
+	{ false, 1, MIPI_CSIS_INT_SRC_ERR_OVER(1),		"FIFO Overflow Error 1" },
+	{ false, 2, MIPI_CSIS_INT_SRC_ERR_OVER(2),		"FIFO Overflow Error 2" },
+	{ false, 3, MIPI_CSIS_INT_SRC_ERR_OVER(3),		"FIFO Overflow Error 3" },
+	{ false, 0, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,		"Wrong Configuration Error" },
+	{ false, 0, MIPI_CSIS_INT_SRC_ERR_ECC,			"ECC Error" },
+	{ false, 0, MIPI_CSIS_INT_SRC_ERR_CRC,			"CRC Error" },
+	{ false, 0, MIPI_CSIS_INT_SRC_ERR_ID,			"Unknown ID Error" },
+	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
+	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,		"Data Type Ignored" },
+	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(0),	"Frame Size Error 0" },
+	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(1),	"Frame Size Error 1" },
+	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(2),	"Frame Size Error 2" },
+	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE(3),	"Frame Size Error 3" },
+	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(0),	"Truncated Frame 0" },
+	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(1),	"Truncated Frame 1" },
+	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(2),	"Truncated Frame 2" },
+	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME(3),	"Truncated Frame 3" },
+	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(0),		"Early Frame End 0" },
+	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(1),		"Early Frame End 1" },
+	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(2),		"Early Frame End 2" },
+	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE(3),		"Early Frame End 3" },
+	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(0),		"Early Frame Start 0" },
+	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(1),		"Early Frame Start 1" },
+	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(2),		"Early Frame Start 2" },
+	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS(3),		"Early Frame Start 3" },
 	/* Non-image data receive events */
-	{ false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame" },
-	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
-	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
-	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
+	{ false, 0, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame" },
+	{ false, 0, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
+	{ false, 0, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
+	{ false, 0, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
 	/* Frame start/end */
-	{ false, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
-	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge" },
+	{ false, 0, MIPI_CSIS_INT_SRC_FRAME_START(0),		"Frame Start 0" },
+	{ false, 1, MIPI_CSIS_INT_SRC_FRAME_START(1),		"Frame Start 1" },
+	{ false, 2, MIPI_CSIS_INT_SRC_FRAME_START(2),		"Frame Start 2" },
+	{ false, 3, MIPI_CSIS_INT_SRC_FRAME_START(3),		"Frame Start 3" },
+	{ false, 0, MIPI_CSIS_INT_SRC_FRAME_END(0),		"Frame End 0" },
+	{ false, 1, MIPI_CSIS_INT_SRC_FRAME_END(1),		"Frame End 1" },
+	{ false, 2, MIPI_CSIS_INT_SRC_FRAME_END(2),		"Frame End 2" },
+	{ false, 3, MIPI_CSIS_INT_SRC_FRAME_END(3),		"Frame End 3" },
+	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(0),	"VSYNC Falling Edge 0" },
+	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(1),	"VSYNC Falling Edge 1" },
+	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(2),	"VSYNC Falling Edge 2" },
+	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL(3),	"VSYNC Falling Edge 3" },
+	{ true, 0, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(0),	"VSYNC Rising Edge 0" },
+	{ true, 1, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(1),	"VSYNC Rising Edge 1" },
+	{ true, 2, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(2),	"VSYNC Rising Edge 2" },
+	{ true, 3, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE(3),	"VSYNC Rising Edge 3" },
 };
 
-#define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
+#define MIPI_CSIS_NUM_EVENTS		ARRAY_SIZE(mipi_csis_events)
+#define MIPI_CSIS_NUM_ERROR_EVENTS	(MIPI_CSIS_NUM_EVENTS - 20)
 
 enum mipi_csis_clk {
 	MIPI_CSIS_CLK_PCLK,
@@ -299,7 +333,9 @@ struct mipi_csis_device {
 	struct clk_bulk_data *clks;
 	struct reset_control *mrst;
 	struct regulator *mipi_phy_regulator;
+
 	const struct mipi_csis_info *info;
+	unsigned int num_channels;
 
 	struct v4l2_subdev sd;
 	struct media_pad pads[CSIS_PADS_NUM];
@@ -654,8 +690,8 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 			MIPI_CSIS_ISP_SYNC_VSYNC_EINTV(0));
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
-	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
-	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL_CH0(15);
+	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC(0);
+	val |= MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(0, 15);
 	val &= ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK;
 	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
 
@@ -672,7 +708,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 	/* Update the shadow register. */
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
 	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
-			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW |
+			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(0) |
 			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
 }
 
@@ -763,16 +799,19 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 
 	/* Update the event/error counters */
 	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
-		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
+		for (i = 0; i < ARRAY_SIZE(csis->events); i++) {
 			struct mipi_csis_event *event = &csis->events[i];
 
+			if (event->channel >= csis->num_channels)
+				continue;
+
 			if ((!event->debug && (status & event->mask)) ||
 			    (event->debug && (dbg_status & event->mask)))
 				event->counter++;
 		}
 	}
 
-	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
+	if (status & MIPI_CSIS_INT_SRC_FRAME_START(0))
 		mipi_csis_queue_event_sof(csis);
 
 	spin_unlock_irqrestore(&csis->slock, flags);
@@ -849,7 +888,7 @@ static void mipi_csis_clear_counters(struct mipi_csis_device *csis)
 static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_errors)
 {
 	unsigned int num_events = non_errors ? MIPI_CSIS_NUM_EVENTS
-				: MIPI_CSIS_NUM_EVENTS - 8;
+				: MIPI_CSIS_NUM_ERROR_EVENTS;
 	unsigned int counters[MIPI_CSIS_NUM_EVENTS];
 	unsigned long flags;
 	unsigned int i;
@@ -860,45 +899,67 @@ static void mipi_csis_log_counters(struct mipi_csis_device *csis, bool non_error
 	spin_unlock_irqrestore(&csis->slock, flags);
 
 	for (i = 0; i < num_events; ++i) {
+		const struct mipi_csis_event *event = &csis->events[i];
+
+		if (event->channel >= csis->num_channels)
+			continue;
+
 		if (counters[i] > 0 || csis->debug.enable)
 			dev_info(csis->dev, "%s events: %d\n",
-				 csis->events[i].name,
-				 counters[i]);
+				 event->name, counters[i]);
 	}
 }
 
+struct mipi_csis_reg_info {
+	u32 addr;
+	unsigned int offset;
+	const char * const name;
+};
+
+static void mipi_csis_dump_channel_reg(struct mipi_csis_device *csis,
+				       const struct mipi_csis_reg_info *reg,
+				       unsigned int channel)
+{
+	dev_info(csis->dev, "%16s%u: 0x%08x\n", reg->name, channel,
+		 mipi_csis_read(csis, reg->addr + channel * reg->offset));
+}
+
 static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
 {
-	static const struct {
-		u32 offset;
-		const char * const name;
-	} registers[] = {
-		{ MIPI_CSIS_CMN_CTRL, "CMN_CTRL" },
-		{ MIPI_CSIS_CLK_CTRL, "CLK_CTRL" },
-		{ MIPI_CSIS_INT_MSK, "INT_MSK" },
-		{ MIPI_CSIS_DPHY_STATUS, "DPHY_STATUS" },
-		{ MIPI_CSIS_DPHY_CMN_CTRL, "DPHY_CMN_CTRL" },
-		{ MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
-		{ MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
-		{ MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
-		{ MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
-		{ MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
-		{ MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
-		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
-		{ MIPI_CSIS_FRAME_COUNTER_CH(0), "FRAME_COUNTER_CH0" },
+	static const struct mipi_csis_reg_info common_registers[] = {
+		{ MIPI_CSIS_CMN_CTRL, 0, "CMN_CTRL" },
+		{ MIPI_CSIS_CLK_CTRL, 0, "CLK_CTRL" },
+		{ MIPI_CSIS_INT_MSK, 0, "INT_MSK" },
+		{ MIPI_CSIS_DPHY_STATUS, 0, "DPHY_STATUS" },
+		{ MIPI_CSIS_DPHY_CMN_CTRL, 0, "DPHY_CMN_CTRL" },
+		{ MIPI_CSIS_DPHY_SCTRL_L, 0, "DPHY_SCTRL_L" },
+		{ MIPI_CSIS_DPHY_SCTRL_H, 0, "DPHY_SCTRL_H" },
+		{ MIPI_CSIS_DBG_CTRL, 0, "DBG_CTRL" },
+	};
+	static const struct mipi_csis_reg_info channel_registers[] = {
+		{ MIPI_CSIS_ISP_CONFIG_CH(0), 0x10, "ISP_CONFIG_CH" },
+		{ MIPI_CSIS_ISP_RESOL_CH(0), 0x10, "ISP_RESOL_CH" },
+		{ MIPI_CSIS_SDW_CONFIG_CH(0), 0x10, "SDW_CONFIG_CH" },
+		{ MIPI_CSIS_SDW_RESOL_CH(0), 0x10, "SDW_RESOL_CH" },
+		{ MIPI_CSIS_FRAME_COUNTER_CH(0), 4, "FRAME_COUNTER_CH" },
 	};
-
-	unsigned int i;
-	u32 cfg;
 
 	if (!pm_runtime_get_if_in_use(csis->dev))
 		return 0;
 
 	dev_info(csis->dev, "--- REGISTERS ---\n");
 
-	for (i = 0; i < ARRAY_SIZE(registers); i++) {
-		cfg = mipi_csis_read(csis, registers[i].offset);
-		dev_info(csis->dev, "%17s: 0x%08x\n", registers[i].name, cfg);
+	for (unsigned int i = 0; i < ARRAY_SIZE(common_registers); i++) {
+		const struct mipi_csis_reg_info *reg = &common_registers[i];
+
+		dev_info(csis->dev, "%17s: 0x%08x\n", reg->name,
+			 mipi_csis_read(csis, reg->addr));
+	}
+
+	for (unsigned int chan = 0; chan < csis->num_channels; chan++) {
+		for (unsigned int i = 0; i < ARRAY_SIZE(channel_registers); ++i)
+			mipi_csis_dump_channel_reg(csis, &channel_registers[i],
+						   chan);
 	}
 
 	pm_runtime_put(csis->dev);
@@ -1421,6 +1482,12 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
 
 	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
 
+	csis->num_channels = 1;
+	of_property_read_u32(node, "fsl,num-channels", &csis->num_channels);
+	if (csis->num_channels < 1 || csis->num_channels > MIPI_CSIS_MAX_CHANNELS)
+		return dev_err_probe(csis->dev, -EINVAL,
+				     "Invalid fsl,num-channels value\n");
+
 	return 0;
 }
 
@@ -1444,10 +1511,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
 
 	/* Parse DT properties. */
 	ret = mipi_csis_parse_dt(csis);
-	if (ret < 0) {
-		dev_err(dev, "Failed to parse device tree: %d\n", ret);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* Acquire resources. */
 	csis->regs = devm_platform_ioremap_resource(pdev, 0);
-- 
Regards,

Laurent Pinchart


