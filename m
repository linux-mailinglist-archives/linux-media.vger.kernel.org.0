Return-Path: <linux-media+bounces-28004-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB35A5BBB7
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 10:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7465E1894C95
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 09:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EBB22E41D;
	Tue, 11 Mar 2025 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jzxBuLZN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C6D223710;
	Tue, 11 Mar 2025 09:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741684279; cv=none; b=NEiPCLZ0hBOcpOG7u+TmdDHASyjROJCqdKMS+6WE7syjvqCG+o8VGW41YsbJz1MwBDxbFO8PiNSZ5w4/6b4Vn9S1ISsAaR7Sr1eM8VbAYmOY+OFY4XDtTsk1G82Fn7BjSs1Gtnne3JHFQ/mGRKXEPmjjSOhFXrzTxKjkiG0i0wU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741684279; c=relaxed/simple;
	bh=DfKBF5LOK9Cd6jLE0lPvbpIr4/KUjT1d/0iGCuqsdU8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wl1oGQ4bcJ2rXFIasEaQ2jUQCuETNFHRYzTnrdXW7xxsDyflIHo5zzVn2fJhWC9PXnxxHeyUudU6XTItEWQL+Six3sSZviKF7oZ4rZFBvlyOsDvNXxYdc0lX2xsBZ53ct6YVT2mKoFNfv3ScQqAQ5NcpwMwYceOfqcVmrM0v8gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jzxBuLZN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A268C4CEF1;
	Tue, 11 Mar 2025 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741684279;
	bh=DfKBF5LOK9Cd6jLE0lPvbpIr4/KUjT1d/0iGCuqsdU8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jzxBuLZNMbw0G96Czm9ysI4HvZ6mMnYz7leIr6YofQbwl7uFERn6NnkdoKqXerftP
	 hWkPuPlT5DCc7lSG+bunM9feiK6zGmAqjAg76CghaHER5OcdSjxG7vsrIafCKzylh5
	 4NfvSr5MgubiVd2a+HLx+rAfdOHouUV4gaES/KsAuYtaZW0gHwf3h0agQnMhQaiomz
	 y7/vo5fFCVDUqwLLqy8tAKVZ2P/u+qh19m37Cyy/0kxjGl/bkqhrqccooOY+wljn3m
	 na98QXh5fxsCxeZlJ6PjNy9Yb7ye66j7dzUE8+SNk2tBHgxtmQMyB4H4sT+cWH5O5y
	 lmjb1WB6khW6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB19C28B2E;
	Tue, 11 Mar 2025 09:11:19 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Tue, 11 Mar 2025 17:11:13 +0800
Subject: [PATCH v7 03/10] dt-bindings: media: Add
 amlogic,c3-mipi-adapter.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-c3isp-v7-3-c3551bed9005@amlogic.com>
References: <20250311-c3isp-v7-0-c3551bed9005@amlogic.com>
In-Reply-To: <20250311-c3isp-v7-0-c3551bed9005@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 jacopo.mondi@ideasonboard.com, Keke Li <keke.li@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741684276; l=4007;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=z53N8bdoy3Z0I3AZVlLIxe0C9PcEyB1N7NGZxesTgAE=;
 b=IF7Kf3BVgZ5XUKjv6Mpb6099ScEOr/+4HDGK8/3/PGE0Ouz3RDEJhiEM2TR0m6zzjzSE2SPIr
 EJ+MzP2JN85DX4ipXQKqJVvQ4DyKEsFJjuJbVQrCV+svBLx3AOp9n68
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

c3-mipi-adapter is used to organize mipi data and
send raw data to ISP module.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 .../bindings/media/amlogic,c3-mipi-adapter.yaml    | 111 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
new file mode 100644
index 000000000000..ba43bc6709a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,c3-mipi-adapter.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic C3 MIPI adapter receiver
+
+maintainers:
+  - Keke Li <keke.li@amlogic.com>
+
+description:
+  MIPI adapter is used to convert the MIPI CSI-2 data
+  into an ISP supported data format.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,c3-mipi-adapter
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: top
+      - const: fd
+      - const: rd
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: vapb
+      - const: isp0
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: input port node.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: output port node.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - clock-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/amlogic,c3-peripherals-clkc.h>
+    #include <dt-bindings/power/amlogic,c3-pwrc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        adap: adap@ff010000 {
+            compatible = "amlogic,c3-mipi-adapter";
+            reg = <0x0 0xff010000 0x0 0x100>,
+                  <0x0 0xff01b000 0x0 0x100>,
+                  <0x0 0xff01d000 0x0 0x200>;
+            reg-names = "top", "fd", "rd";
+            power-domains = <&pwrc PWRC_C3_ISP_TOP_ID>;
+            clocks = <&clkc_periphs CLKID_VAPB>,
+                     <&clkc_periphs CLKID_ISP0>;
+            clock-names = "vapb", "isp0";
+            assigned-clocks = <&clkc_periphs CLKID_VAPB>,
+                              <&clkc_periphs CLKID_ISP0>;
+            assigned-clock-rates = <0>, <400000000>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    c3_adap_in: endpoint {
+                        remote-endpoint = <&c3_mipi_csi_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    c3_adap_out: endpoint {
+                        remote-endpoint = <&c3_isp_in>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index a87b4a942fe0..4af503c88956 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1252,6 +1252,12 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC MIPI ADAPTER DRIVER
+M:	Keke Li <keke.li@amlogic.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/amlogic,c3-mipi-adapter.yaml
+
 AMLOGIC MIPI CSI2 DRIVER
 M:	Keke Li <keke.li@amlogic.com>
 L:	linux-media@vger.kernel.org

-- 
2.48.1



