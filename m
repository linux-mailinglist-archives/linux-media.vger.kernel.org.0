Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1DD3153A2F
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 22:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727566AbgBEVYL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Feb 2020 16:24:11 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:4129 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727104AbgBEVXx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Feb 2020 16:23:53 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e3b325a0000>; Wed, 05 Feb 2020 13:23:38 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 05 Feb 2020 13:23:52 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 05 Feb 2020 13:23:52 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Feb
 2020 21:23:52 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Feb 2020 21:23:52 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.216]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e3b32670003>; Wed, 05 Feb 2020 13:23:52 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v2 3/6] dt-binding: tegra: Add VI and CSI bindings
Date:   Wed, 5 Feb 2020 13:23:23 -0800
Message-ID: <1580937806-17376-4-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580937806-17376-1-git-send-email-skomatineni@nvidia.com>
References: <1580937806-17376-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1580937818; bh=MSsQ+Z+BNBSm6iU3zX3Gv/RJj8a3RXCx4kiCgfv4sH4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=TAqn9WYS7KJUsnKbU6Qa93I9taHbbG6+cTG1FkS/m8MByF4Wz8BkPWyIRKHk5kv+O
         DSa7hwRIPb3M5nAcCsaVH0IELIFj9ESDvpZL4pKPRojhjGgbUSzlQBb7XeNRcOLHkJ
         RGmM2pTevQINvtF+gb7QLTVh9KIeXMHeD39Yoc2L6q2/byiSBMMTX+j6OABmqDl3EG
         /Hz2X9hRL1oREAD/05++enqJb+4kqJ1zvvCY+ZMPXim3AVBgflJsSDZnzmwunB7bGN
         d8Yzo5IqNdy4NkZA8hY1ocy5utB7iDw1xLP8jnwFx+25FXbY+Io8ssTuhR4dBHL28C
         IuGfjSUsadySw==
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
 .../display/tegra/nvidia,tegra20-host1x.txt        | 55 ++++++++++++++++++----
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 9999255ac5b6..3d0ed540a646 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -40,14 +40,24 @@ of the following host1x client modules:
 
   Required properties:
   - compatible: "nvidia,tegra<chip>-vi"
-  - reg: Physical base address and length of the controller's registers.
+  - reg: Physical base address and length of the controller registers.
   - interrupts: The interrupt outputs from the controller.
-  - clocks: Must contain one entry, for the module clock.
+  - clocks: Must contain an entry for the module clock "vi"
     See ../clocks/clock-bindings.txt for details.
   - resets: Must contain an entry for each entry in reset-names.
     See ../reset/reset.txt for details.
-  - reset-names: Must include the following entries:
-    - vi
+  - reset-names: Must include the entry "vi"
+
+  Tegra210 has CSI part of VI sharing same host interface and register
+  space. So, VI device node should have CSI child node.
+
+  - csi: mipi csi interface to vi
+
+    Required properties:
+    - compatible: "nvidia,tegra<chip>-csi"
+    - reg: Physical base address and length of the controller registers.
+    - clocks: Must contain entries csi, cilab, cilcd, cile clocks.
+      See ../clocks/clock-bindings.txt for details.
 
 - epp: encoder pre-processor
 
@@ -310,12 +320,41 @@ Example:
 		};
 
 		vi {
-			compatible = "nvidia,tegra20-vi";
-			reg = <0x54080000 0x00040000>;
+			compatible = "nvidia,tegra210-vi";
+			reg = <0x0 0x54080000 0x0 0x700>;
 			interrupts = <0 69 0x04>;
-			clocks = <&tegra_car TEGRA20_CLK_VI>;
-			resets = <&tegra_car 100>;
+			assigned-clocks = <&tegra_car TEGRA210_CLK_VI>;
+			assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_C4_OUT0>;
+			clocks = <&tegra_car TEGRA210_CLK_VI>;
+			clock-names = "vi";
+			resets = <&tegra_car 20>;
 			reset-names = "vi";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+
+			ranges = <0x0 0x54080808 0x0 0x54080808 0x0 0x2000>;
+
+			csi@0x54080838 {
+				compatible = "nvidia,tegra210-csi";
+				reg = <0x0 0x54080838 0x0 0x2000>;
+				status = "disabled";
+				assigned-clocks = <&tegra_car TEGRA210_CLK_CILAB>,
+						  <&tegra_car TEGRA210_CLK_CILCD>,
+						  <&tegra_car TEGRA210_CLK_CILE>;
+				assigned-clock-parents = <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>,
+							 <&tegra_car TEGRA210_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>,
+						       <102000000>,
+						       <102000000>;
+				clocks = <&tegra_car TEGRA210_CLK_CSI>,
+					 <&tegra_car TEGRA210_CLK_CILAB>,
+					 <&tegra_car TEGRA210_CLK_CILCD>,
+					 <&tegra_car TEGRA210_CLK_CILE>;
+				clock-names = "csi", "cilab", "cilcd", "cile";
+			};
+
 		};
 
 		epp {
-- 
2.7.4

