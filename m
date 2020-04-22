Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4213B1B3773
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 08:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgDVGTj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 02:19:39 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:7536 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbgDVGTF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 02:19:05 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9fe1cc0000>; Tue, 21 Apr 2020 23:18:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 21 Apr 2020 23:19:05 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 21 Apr 2020 23:19:05 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 22 Apr
 2020 06:19:05 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 22 Apr 2020 06:19:05 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.49]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e9fe1d80003>; Tue, 21 Apr 2020 23:19:05 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v9 5/9] dt-binding: tegra: Add VI and CSI bindings
Date:   Tue, 21 Apr 2020 23:18:55 -0700
Message-ID: <1587536339-4030-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
References: <1587536339-4030-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587536332; bh=c1+1RY3DNymVc+W/nvOMO+FEXi1aSIH/IA3CL9uJZY0=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=hyi8JEW4G2C1jYw0up/p8UiyaNPfteiZnPmwh+9kekCp4K1xJqEAA0jzrr1V9RASf
         yPto3tS8F8SDiLV3Z/aL88pW+Yt7NxDBw+tSCFPzg0Y1H+/+FIRTaM6Pf0ekY1hrBf
         Y7iQjcHfFZo3wglI+CwzwOKmYp+17LigBFa+pOEovXdtcjpJ1nZo6kUgVO8DWonMJJ
         SHHISROFbge4SO1vRaYZKinTJlNV1co0IPrxtEUPRYdBVbHIEXUETTEYI8hutcDPYN
         S5k+WIV8CAOXWrqt8PqJXfWic7B2zXbvYH0DEl7I/oND+jy20hkbbSQT7JFKeFLGxL
         lAtWhbHRaIOAg==
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

Acked-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../display/tegra/nvidia,tegra20-host1x.txt        | 73 ++++++++++++++++++----
 1 file changed, 60 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 9999255..4731921 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -40,14 +40,30 @@ of the following host1x client modules:
 
   Required properties:
   - compatible: "nvidia,tegra<chip>-vi"
-  - reg: Physical base address and length of the controller's registers.
+  - reg: Physical base address and length of the controller registers.
   - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
+  - clocks: clocks: Must contain one entry, for the module clock.
     See ../clocks/clock-bindings.txt for details.
-  - resets: Must contain an entry for each entry in reset-names.
-    See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - vi
+  - Tegra20/Tegra30/Tegra114/Tegra124:
+    - resets: Must contain an entry for each entry in reset-names.
+      See ../reset/reset.txt for details.
+    - reset-names: Must include the following entries:
+      - vi
+  - Tegra210:
+    - power-domains: Must include venc powergate node as vi is in VE partition.
+  - Tegra210 has CSI part of VI sharing same host interface and register space.
+    So, VI device node should have CSI child node.
+
+    - csi: mipi csi interface to vi
+
+      Required properties:
+      - compatible: "nvidia,tegra210-csi"
+      - reg: Physical base address offset to parent and length of the controller
+        registers.
+      - clocks: Must contain entries csi, cilab, cilcd, cile, csi_tpg clocks.
+        See ../clocks/clock-bindings.txt for details.
+      - power-domains: Must include sor powergate node as csicil is in
+        SOR partition.
 
 - epp: encoder pre-processor
 
@@ -309,13 +325,44 @@ Example:
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
+						  <&tegra_car TEGRA210_CLK_CILE>,
+						  <&tegra_car TEGRA210_CLK_CSI_TPG>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>,
+						       <102000000>,
+						       <102000000>,
+						       <972000000>;
+
+				clocks = <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_CILAB>,
+					 <&tegra_car TEGRA210_CLK_CILCD>,
+					 <&tegra_car TEGRA210_CLK_CILE>,
+					 <&tegra_car TEGRA210_CLK_CSI_TPG>;
+				clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
+				power-domains = <&pd_sor>;
+			};
 		};
 
 		epp {
-- 
2.7.4

