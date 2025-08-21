Return-Path: <linux-media+bounces-40505-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 269F7B2E95B
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 02:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B62CD1C8847D
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 00:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB285FEE6;
	Thu, 21 Aug 2025 00:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lcd8Q8tD"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3F51B040D;
	Thu, 21 Aug 2025 00:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755735027; cv=none; b=MffIGmOE6JEAfT86Ulu3SEbvAN/jMvkOZQiCZ6WXVQFrDJ1IuKOPQedhQwizkU4JElS/p75+C5n1/6jUlmw/+QTygaaWMFYsHuMMEptrfTPB9FioSGhcDDbYGcUMpwSWQAX8BRre81naXLL6VgT/Z8W2tDrqXh7rb2UerNqRe3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755735027; c=relaxed/simple;
	bh=eKEUI54IDPaYYjYBrflIcSGc/aI6u58J52rbZqG2dDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aoA4XQDU4KiStG7e6sHEUE9mq0ZsWzATlnQyMkzieAw9GSJzmrke5qvqHL9Wyaad+he+lubuISknK4Ag/VOzCi+CjcnH3dROFGlNcSWaDKWp/gHTZErSTKnUs2xSLQl4o8Gq1v+Z3MNPddN5g32/dqgoSmzxt1hx776TCaS0nG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lcd8Q8tD; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9210316D7;
	Thu, 21 Aug 2025 02:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734963;
	bh=eKEUI54IDPaYYjYBrflIcSGc/aI6u58J52rbZqG2dDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lcd8Q8tDmghg/w5V9kyxxcl7tMwV+lPY84gNStOoW8jOR5KCmwRSb4omUJ5k9ak5d
	 qlRo3IJKMRxsXjsZ5ll6Kq4AxY98HQbGDWhXnr6Xtxkp359TgS+LQtiuBCOZ9vB3BZ
	 nct5w3WM1b3v0FVBzZ7rg5umkR2l757QM6w5s5ag=
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
Subject: [PATCH v2 09/12] dt-bindings: media: nxp,imx-mipi-csi2: Mark clock-frequency as deprecated
Date: Thu, 21 Aug 2025 03:09:41 +0300
Message-ID: <20250821000944.27849-10-laurent.pinchart@ideasonboard.com>
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

Usage of the clock-frequency property, which is already optional, is
discouraged in favour of using assigned-clock-rates (and
assigned-clock-parents where needed). Mark the property as deprecated,
and update the examples accordingly.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/media/nxp,imx-mipi-csi2.yaml  | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
index 03a23a26c4f3..db4889bf881e 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
@@ -66,6 +66,7 @@ properties:
   clock-frequency:
     description: The desired external clock ("wrap") frequency, in Hz
     default: 166000000
+    deprecated: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -147,7 +148,9 @@ examples:
                  <&clks IMX7D_MIPI_CSI_ROOT_CLK>,
                  <&clks IMX7D_MIPI_DPHY_ROOT_CLK>;
         clock-names = "pclk", "wrap", "phy";
-        clock-frequency = <166000000>;
+
+        assigned-clocks = <&clks IMX7D_MIPI_CSI_ROOT_CLK>;
+        assigned-clock-rates = <166000000>;
 
         power-domains = <&pgc_mipi_phy>;
         phy-supply = <&reg_1p0d>;
@@ -185,12 +188,16 @@ examples:
         compatible = "fsl,imx8mm-mipi-csi2";
         reg = <0x32e30000 0x1000>;
         interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
-        clock-frequency = <333000000>;
+
         clocks = <&clk IMX8MM_CLK_DISP_APB_ROOT>,
                  <&clk IMX8MM_CLK_CSI1_ROOT>,
                  <&clk IMX8MM_CLK_CSI1_PHY_REF>,
                  <&clk IMX8MM_CLK_DISP_AXI_ROOT>;
         clock-names = "pclk", "wrap", "phy", "axi";
+
+        assigned-clocks = <&clk IMX8MM_CLK_CSI1_ROOT>;
+        assigned-clock-rates = <250000000>;
+
         power-domains = <&mipi_pd>;
 
         ports {
-- 
Regards,

Laurent Pinchart


