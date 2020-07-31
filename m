Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC988234D16
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 23:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729661AbgGaVce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 17:32:34 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14836 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728055AbgGaVcb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 17:32:31 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f248d900000>; Fri, 31 Jul 2020 14:30:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 14:32:30 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 31 Jul 2020 14:32:30 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 21:32:30 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 31 Jul 2020 21:32:30 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.167.221]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f248ded0001>; Fri, 31 Jul 2020 14:32:30 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <gregkh@linuxfoundation.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 04/10] dt-bindings: tegra: Update VI and CSI bindings with port info
Date:   Fri, 31 Jul 2020 14:32:18 -0700
Message-ID: <1596231144-12554-5-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596231144-12554-1-git-send-email-skomatineni@nvidia.com>
References: <1596231144-12554-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596231056; bh=BnlKr3cpHbqR2/ypGaWrf+nRHayXIJrs4Q9+28+PHhQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=WP5guGvlm0DJ4COIn/0NZxV/06p/3DiyOHHwMBMXfrRBaTndUF3uAX0lk+F4O1n5x
         1KHNRfqLRyUX4/AtWz2T62HWvD6Alh/GXKi13y+P/1SqTXAsx88ZI5VUYCCjP1NX6V
         N4+yDidzdBL+JYAUezuwOiXCrSGzymX2KcbFYn/Wv/D2Wc0xg+yvGA3o+i27Uwgqzt
         R1jVGNrr3z8DW+z2chrZvoXXe8zZvYA+HDdkbCE1pJ6cRfjXtMr7wZthDh4H04dGTR
         7MxIX3N/w3g3KFu2OJUIxUiBKTk8hnSAXZCZ+HTqUjIUvddLEL+D/g8iBngKP0t62j
         0svkE9hL+csBA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update VI and CSI bindings to add port and endpoint nodes as per
media video-interfaces DT binding document.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../display/tegra/nvidia,tegra20-host1x.txt        | 92 +++++++++++++++++++++-
 1 file changed, 90 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
index 4731921..ac63ae4a 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
@@ -51,8 +51,16 @@ of the following host1x client modules:
       - vi
   - Tegra210:
     - power-domains: Must include venc powergate node as vi is in VE partition.
-  - Tegra210 has CSI part of VI sharing same host interface and register space.
-    So, VI device node should have CSI child node.
+
+  ports (optional node)
+  vi can have optional ports node and max 6 ports are supported. Each port
+  should have single 'endpoint' child node. All port nodes are grouped under
+  ports node. Please refer to the bindings defined in
+  Documentation/devicetree/bindings/media/video-interfaces.txt
+
+  csi (required node)
+  Tegra210 has CSI part of VI sharing same host interface and register space.
+  So, VI device node should have CSI child node.
 
     - csi: mipi csi interface to vi
 
@@ -65,6 +73,46 @@ of the following host1x client modules:
       - power-domains: Must include sor powergate node as csicil is in
         SOR partition.
 
+      channel (optional nodes)
+      Maximum 6 channels are supported with each csi brick as either x4 or x2
+      based on hw connectivity to sensor.
+
+      Required properties:
+      - reg: csi port number. Valid port numbers are 0 through 5.
+      - nvidia,mipi-calibrate: Should contain a phandle and a specifier
+        specifying which pads are used by this CSI port and need to be
+	calibrated. See also ../display/tegra/nvidia,tegra114-mipi.txt.
+
+      Each channel node must contain 2 port nodes which can be grouped
+      under 'ports' node and each port should have a single child 'endpoint'
+      node.
+
+        ports node
+        Please refer to the bindings defined in
+        Documentation/devicetree/bindings/media/video-interfaces.txt
+
+        ports node must contain below 2 port nodes.
+        port@0 with single child 'endpoint' node always a sink.
+        port@1 with single child 'endpoint' node always a source.
+
+        port@0 (required node)
+        Required properties:
+        - reg: 0
+
+	  endpoint (required node)
+	  Required properties:
+	  - data-lanes: an array of data lane from 1 to 4. Valid array
+	    lengths are 1/2/4.
+	  - remote-endpoint: phandle to sensor 'endpoint' node.
+
+        port@1 (required node)
+        Required properties:
+        - reg: 1
+
+	  endpoint (required node)
+	  Required properties:
+	  - remote-endpoint: phandle to vi port 'endpoint' node.
+
 - epp: encoder pre-processor
 
   Required properties:
@@ -340,6 +388,18 @@ Example:
 
 			ranges = <0x0 0x0 0x54080000 0x2000>;
 
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					imx219_vi_in0: endpoint {
+						remote-endpoint = <&imx219_csi_out0>;
+					};
+				};
+			};
+
 			csi@838 {
 				compatible = "nvidia,tegra210-csi";
 				reg = <0x838 0x1300>;
@@ -362,6 +422,34 @@ Example:
 					 <&tegra_car TEGRA210_CLK_CSI_TPG>;
 				clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
 				power-domains = <&pd_sor>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				channel@0 {
+					reg = <0>;
+					nvidia,mipi-calibrate = <&mipi 0x001>;
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							imx219_csi_in0: endpoint {
+								data-lanes = <1 2>;
+								remote-endpoint = <&imx219_out0>;
+							};
+						};
+
+						port@1 {
+							reg = <1>;
+							imx219_csi_out0: endpoint {
+								remote-endpoint = <&imx219_vi_in0>;
+							};
+						};
+					};
+				};
 			};
 		};
 
-- 
2.7.4

