Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A21E18FC11
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 18:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727927AbgCWRxO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 13:53:14 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14758 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727569AbgCWRwl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 13:52:41 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e78f73c0001>; Mon, 23 Mar 2020 10:51:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 23 Mar 2020 10:52:40 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 23 Mar 2020 10:52:40 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Mar
 2020 17:52:40 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 23 Mar 2020 17:52:40 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.160.78]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e78f7670000>; Mon, 23 Mar 2020 10:52:40 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v5 5/9] dt-binding: tegra: Add VI and CSI bindings
Date:   Mon, 23 Mar 2020 10:52:31 -0700
Message-ID: <1584985955-19101-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584985916; bh=x52xXIXK6pPK6/ZlFIxKUYbjv7dRay6339W/L0ntpdo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=GCzLV99+uLAtWSNQpT1zL5Ly59zV2wKX1Sjt4yZIyWtuLQ48VJytAw1cPUu4+D7EE
         NLxz8zOBaa+koB/YJipoOZFVVg4NdXZDY86T0xRWHforh2FvpKJWWBjRh0OAMX5twE
         aWZIpad3+8TSEqeIF36r6LH67hnerVVR1lS0TI1tUJTyigxuqtvQp7GPIRSAxFFNTq
         HWoTPPaWT6WMNunz0X1Jv6jUdYLiL0LYo8UFzqaOQbyC/By5Mgc75bt6WUBoii2yhb
         Rf7o84iYE9igETV125rwfZbUGpYD4hxKrKkccCzn/b6Xu037pORzzNw4dHL7v3fdJP
         enarff3ELwhlQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra contains VI controller which can support up to 6 MIPI CSI
camera sensors.

Each Tegra CSI port from CSI unit can be one-to-one mapper to
VI channel and can capture from an external camera sensor or
from built-in test pattern generator.

This patch adds dt-bindings for Tegra VI and CSI.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../display/tegra/nvidia,tegra20-host1x.txt        | 67 +++++++++++++++++-----
 1 file changed, 54 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 9999255..9421569 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -40,14 +40,25 @@ of the following host1x client modules:
 
   Required properties:
   - compatible: "nvidia,tegra<chip>-vi"
-  - reg: Physical base address and length of the controller's registers.
+  - reg: Physical base address and length of the controller registers.
   - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
+  - clocks: Must contain an entry for the module clock "vi"
     See ../clocks/clock-bindings.txt for details.
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - vi
+  - power-domains: Must include venc powergate node as vi is in VE partition.
+
+  Tegra210 has CSI part of VI sharing same host interface and register
+  space. So, VI device node should have CSI child node.
+
+  - csi: mipi csi interface to vi
+
+    Required properties:
+    - compatible: "nvidia,tegra<chip>-csi"
+    - reg: Physical base address offset to parent and length of the controller
+      registers.
+    - clocks: Must contain entries csi, cilab, cilcd, cile clocks.
+      See ../clocks/clock-bindings.txt for details.
+  - power-domains: Must include sor powergate node as csicil is in
+    SOR partition.
 
 - epp: encoder pre-processor
 
@@ -309,13 +320,43 @@ Example:
 			reset-names = "mpe";
 		};
 
-		vi {
-			compatible = "nvidia,tegra20-vi";
-			reg = <0x54080000 0x00040000>;
-			interrupts = <0 69 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_VI>;
-			resets = <&tegra_car 100>;
-			reset-names = "vi";
+		vi@54080000 {
+			compatible = "nvidia,tegra210-vi";
+			reg = <0x0 0x54080000 0x0 0x700>;
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
+			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
+			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
+
+			clocks = <&tegra_car TEGRA210_CLK_VI>;
+			clock-names = "vi";
+			power-domains = <&pd_venc>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x0 0x54080000 0x2000>;
+
+			csi@838 {
+				compatible = "nvidia,tegra210-csi";
+				reg = <0x838 0x1300>;
+				assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
+						  <&tegra_car TEGRA210_CLK_CILCD>,
+						  <&tegra_car TEGRA210_CLK_CILE>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>,
+						       <102000000>,
+						       <102000000>;
+
+				clocks = <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_CILAB>,
+					 <&tegra_car TEGRA210_CLK_CILCD>,
+					 <&tegra_car TEGRA210_CLK_CILE>;
+				clock-names = "csi", "cilab", "cilcd", "cile";
+				power-domains = <&pd_sor>;
+			};
+
 		};
 
 		epp {
-- 
2.7.4

