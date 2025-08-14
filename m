Return-Path: <linux-media+bounces-40068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9002AB29855
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 06:39:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7416E201985
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 04:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16F6626CE1E;
	Mon, 18 Aug 2025 04:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HidAGXEb"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F48C26C3B3
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491887; cv=none; b=CoVdtJfuZKbjdTFlBpOmWUIPn2RA6a0kXAn+zPXuT/XryZpTq4hsUCvwVD3lP4qDNgVH739kMMBLUo7uzMZR5XucOvqdazVdaSsubYfyCCJFZFdrFkLSeh7I2GjutUbudJsT1qqw3X4X/RCvL/pjW/EfREaFjkPstXnKg8TlMGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491887; c=relaxed/simple;
	bh=l7uFgGS0Xjsm5oD2LLZAJorGEp8FOCVxxpYBwP0sxgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=AeyxDLb7ZWvYF2VgneiiCs4zSKnhZ6FUh8LwlLMFJINAGBdKXYk1Y27cgFAdtxPbNCkWgxp/pvQs+Pqa+YCm/3hguyIOsRAZjaJeKVyzRIVtnA7n0tsg2s9dUFnLOcXWzzW/XzvauLu+conLxIdp8ZhTaHmyrWiTOgEb7sndgsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HidAGXEb; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250818043803epoutp042b8dd5a94ace311aff6be5b5b02f7ad2~cwpFB2wHz2642426424epoutp04E
	for <linux-media@vger.kernel.org>; Mon, 18 Aug 2025 04:38:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250818043803epoutp042b8dd5a94ace311aff6be5b5b02f7ad2~cwpFB2wHz2642426424epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491883;
	bh=43oXxFKfnsTWy5UmLZ+z7pzwjTP2nYXG45oAqT0iINc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HidAGXEb3n8+rtLRb67VjqbdwkW8ShU4IpRJmpCb8tE76nkKUA7L9sBDUF25GKCcA
	 nLH5ASW+dUQKp9I8QJM9wZxt9/y/1FkOhpz6lQKTuod/4oZAH6IfB+kYL43esXXxkM
	 40fKHZsY9MhlEqvrwzwXlCABbw3w2flssTs779So=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250818043802epcas5p3f4f768164a3d19f44e67d63533bea352~cwpEFn6bj2560625606epcas5p3x;
	Mon, 18 Aug 2025 04:38:02 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c50MF6MqPz3hhTC; Mon, 18 Aug
	2025 04:38:01 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250814141036epcas5p1fc02cea3f97534303673eb8453b6a18f~bp305UicQ0355803558epcas5p1I;
	Thu, 14 Aug 2025 14:10:36 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141031epsmtip26b88e96818e2b889c40dbd1ebeaccd62~bp3xEo9mG1850318503epsmtip2N;
	Thu, 14 Aug 2025 14:10:31 +0000 (GMT)
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
Subject: [PATCH v2 07/12] media: imx-mipi-csis: Add support to configure
 specific vc
Date: Thu, 14 Aug 2025 19:39:38 +0530
Message-ID: <20250814140943.22531-8-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141036epcas5p1fc02cea3f97534303673eb8453b6a18f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141036epcas5p1fc02cea3f97534303673eb8453b6a18f
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141036epcas5p1fc02cea3f97534303673eb8453b6a18f@epcas5p1.samsung.com>

MIPI_CSIS_V3_3 and MIPI_CSIS_V3_6_3 support streaming only on VC0. The
MIPI_CSIS_V4_3 present in the FSD SoC supports streaming on any one VC
out of four VCs. To extend support for the FSD SoC, add the ability to
configure a specific VC. The FSD CSI Rx can configure any one VC and
start streaming.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index a3e2c8ae332f..4f6c417fdf58 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -54,7 +54,7 @@
 
 /* CSIS common control */
 #define MIPI_CSIS_CMN_CTRL			0x04
-#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
+#define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(n)	BIT(((n) + 16))
 #define MIPI_CSIS_CMN_CTRL_INTER_MODE		BIT(10)
 #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL	BIT(2)
 #define MIPI_CSIS_CMN_CTRL_RESET		BIT(1)
@@ -319,6 +319,7 @@ struct mipi_csis_device {
 		u32 hs_settle;
 		u32 clk_settle;
 	} debug;
+	unsigned int vc;
 };
 
 /* -----------------------------------------------------------------------------
@@ -544,9 +545,10 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
 				   const struct csis_pix_format *csis_fmt)
 {
 	u32 val;
+	unsigned int vc = csis->vc;
 
 	/* Color format */
-	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(0));
+	val = mipi_csis_read(csis, MIPI_CSIS_ISP_CONFIG_CH(vc));
 	val &= ~(MIPI_CSIS_ISPCFG_ALIGN_32BIT | MIPI_CSIS_ISPCFG_FMT_MASK
 		| MIPI_CSIS_ISPCFG_PIXEL_MASK);
 
@@ -567,11 +569,11 @@ static void __mipi_csis_set_format(struct mipi_csis_device *csis,
 		val |= MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
 
 	val |= MIPI_CSIS_ISPCFG_FMT(csis_fmt->data_type);
-	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(0), val);
+	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(vc), val);
 
 	/* Pixel resolution */
 	val = format->width | (format->height << 16);
-	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(0), val);
+	mipi_csis_write(csis, MIPI_CSIS_ISP_RESOL_CH(vc), val);
 }
 
 static int mipi_csis_calculate_params(struct mipi_csis_device *csis,
@@ -631,6 +633,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 {
 	int lanes = csis->bus.num_data_lanes;
 	u32 val;
+	unsigned int vc = csis->vc;
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
 	val &= ~MIPI_CSIS_CMN_CTRL_LANE_NR_MASK;
@@ -648,7 +651,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 	val = (0 << MIPI_CSIS_ISP_SYNC_HSYNC_LINTV_OFFSET)
 	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_SINTV_OFFSET)
 	    | (0 << MIPI_CSIS_ISP_SYNC_VSYNC_EINTV_OFFSET);
-	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(0), val);
+	mipi_csis_write(csis, MIPI_CSIS_ISP_SYNC_CH(vc), val);
 
 	val = mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
 	val |= MIPI_CSIS_CLK_CTRL_WCLK_SRC;
@@ -669,7 +672,7 @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
 	/* Update the shadow register. */
 	val = mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
 	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
-			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW |
+			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(vc) |
 			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
 }
 
@@ -945,6 +948,8 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 	struct v4l2_subdev_state *state;
 	int ret;
 
+	csis->vc = 0;
+
 	if (!enable) {
 		v4l2_subdev_disable_streams(csis->source.sd,
 					    csis->source.pad->index, BIT(0));
-- 
2.49.0


