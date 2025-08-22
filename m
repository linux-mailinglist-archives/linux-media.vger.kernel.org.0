Return-Path: <linux-media+bounces-40700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 85510B30A61
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B0EDB6297D
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 00:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E41819C54B;
	Fri, 22 Aug 2025 00:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cbqIJrye"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAE42747B;
	Fri, 22 Aug 2025 00:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822499; cv=none; b=WzgZKlTpqzU1v7udH26b9ZBoodSp5ahd0wUP5bBQgdB0Znh2HpEAa0MYciL8LzMsrQ2h0XVasRHiYDLsxaOaoekq6ePgGOpHhgRHJUN4rPE+fsZyXpYNCb81sgAM8I4fkcxc68PidHf2JitGL5OveDluY8llX1+r/ALWdSnmtZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822499; c=relaxed/simple;
	bh=eKEUI54IDPaYYjYBrflIcSGc/aI6u58J52rbZqG2dDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYAisxTcEWQvzxhcSS8ZTMPZzUNHIZNbpf3rovu/GWNOdlBs5hCyfmQYeVvbZixjKimfnbdqn+6b8CGwv5uOoJRW8IuK2/piFXObfWYEvYIoyZKkbIpAFi1IdEk+yjZhaMUZ3U8rPcu73BCZv9Y+8kFrPjxa7cf7/szbACT0cW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cbqIJrye; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 65857101F;
	Fri, 22 Aug 2025 02:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822434;
	bh=eKEUI54IDPaYYjYBrflIcSGc/aI6u58J52rbZqG2dDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cbqIJryegNBmaheECCfawWgJh3m0zjQkzT6KpV5GViNXgtjb1vkW6mNSUogkCKvL1
	 CRQ03Y8aHyQ/Bl6Jlm6+5ce12uJ3FtN7K9RlLbwNqjh5HuFUsv2vF3NAzoABJVc002
	 1/3WIADcxnQhGt9B4EklOBCx1ltwzYG8TnItWfU8=
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
Subject: [PATCH v3 10/13] dt-bindings: media: nxp,imx-mipi-csi2: Mark clock-frequency as deprecated
Date: Fri, 22 Aug 2025 03:27:30 +0300
Message-ID: <20250822002734.23516-11-laurent.pinchart@ideasonboard.com>
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


