Return-Path: <linux-media+bounces-40504-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C19B2E94D
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 02:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D7895E12FE
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 00:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29A5188CC9;
	Thu, 21 Aug 2025 00:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EQB1LvcL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BF815ADB4;
	Thu, 21 Aug 2025 00:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755735025; cv=none; b=hbz6e3ZKX444O5pfbuLCqrfqu5mbDSMXVCPCbx7jKDxMDQymNZYIVdxOzSfz8JWV1FqpkWrCeWOXyzM9YzQCL6Am5+3w4HMbNI8HocL9o4PsE5xqDqxPicv/rqrXH7PzG/ovhFA0V+D0Gt0Aok/CdM6NgAK1S5ObUXUdqQvEjPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755735025; c=relaxed/simple;
	bh=cMmL4BmyXfuwwi2s5eTQr9Gf80wg+2w/lffO2C1scVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cX8n4Oao/p7DEptCjKa435yjRBFnFFHO+ewb0RIga+WeGsawFyOEMltukVnQmaEjLtRJ/BoQJ/Jwj2IYES14rvtJvzTLjnASrkOm8lyzzVGGrSPowys9m4JKG45UhsZWp9K3HzUNngRXAZ8KxdBoV/w+DWq3F8bcqJTU+wClKMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EQB1LvcL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 17508300B;
	Thu, 21 Aug 2025 02:09:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734962;
	bh=cMmL4BmyXfuwwi2s5eTQr9Gf80wg+2w/lffO2C1scVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EQB1LvcLnzepVo32jtqJ3SzsmiEf2lfl1XmfAOkmiO6Oj22KDl+cvr+QZEFPeKQVj
	 CRa1LgYzCtMjlqy8fp3NrpCXYjjZasuTi5NBCI+g2T+YidaQHLEByCVY1T9hSkc33z
	 RlKrJ2Toie+HaFl2ecsjrGUaK07dO2B6WW/Wm3Hk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/12] media: imx-mipi-csis: Only set clock rate when specified in DT
Date: Thu, 21 Aug 2025 03:09:40 +0300
Message-ID: <20250821000944.27849-9-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The imx-mipi-csis driver sets the rate of the wrap clock to the value
specified in the device tree's "clock-frequency" property, and defaults
to 166 MHz otherwise. This is a historical mistake, as clock rate
selection should have been left to the assigned-clock-rates property.

Honouring the clock-frequency property can't be removed without breaking
backwards compatibility, and the corresponding code isn't very
intrusive. The 166 MHz default, on the other hand, prevents
configuration of the clock rate through assigned-clock-rates, as the
driver immediately overwrites the rate. This behaviour is confusing and
has cost debugging time.

There is little value in a 166 MHz default. All mainline device tree
sources that enable the CSIS specify a clock-frequency explicitly, and
the default wrap clock configuration on supported platforms is at least
as high as 166 MHz. Drop the default, and only set the clock rate
manually when the clock-frequency property is specified.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 67da8326540b..83ba68a20bd1 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -230,8 +230,6 @@
 #define MIPI_CSIS_PKTDATA_EVEN			0x3000
 #define MIPI_CSIS_PKTDATA_SIZE			SZ_4K
 
-#define DEFAULT_SCLK_CSIS_FREQ			166000000UL
-
 struct mipi_csis_event {
 	bool debug;
 	u32 mask;
@@ -708,12 +706,17 @@ static int mipi_csis_clk_get(struct mipi_csis_device *csis)
 	if (ret < 0)
 		return ret;
 
-	/* Set clock rate */
-	ret = clk_set_rate(csis->clks[MIPI_CSIS_CLK_WRAP].clk,
-			   csis->clk_frequency);
-	if (ret < 0)
-		dev_err(csis->dev, "set rate=%d failed: %d\n",
-			csis->clk_frequency, ret);
+	if (csis->clk_frequency) {
+		/*
+		 * Set the clock rate. This is deprecated, for backward
+		 * compatibility with old device trees.
+		 */
+		ret = clk_set_rate(csis->clks[MIPI_CSIS_CLK_WRAP].clk,
+				   csis->clk_frequency);
+		if (ret < 0)
+			dev_err(csis->dev, "set rate=%d failed: %d\n",
+				csis->clk_frequency, ret);
+	}
 
 	return ret;
 }
@@ -1417,9 +1420,7 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
 {
 	struct device_node *node = csis->dev->of_node;
 
-	if (of_property_read_u32(node, "clock-frequency",
-				 &csis->clk_frequency))
-		csis->clk_frequency = DEFAULT_SCLK_CSIS_FREQ;
+	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart


