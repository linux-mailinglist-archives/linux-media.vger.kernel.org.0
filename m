Return-Path: <linux-media+bounces-24109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CFA9FD0C8
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 08:10:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18CB1188255A
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 07:10:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B9D8146D57;
	Fri, 27 Dec 2024 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXnamMr2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550D613D244;
	Fri, 27 Dec 2024 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735283377; cv=none; b=E4s2lHvmyndqf55P+og5h6iiigLvnDCUmr+knfgQzOiuPtGufmnBRGDazmWub+xu2nmGVLa7llJfTmZh3N2G1L6GGMfGQMN0iVt+T0XWPrgbT1MVtl/uWj5R2awq6j1kS2H6EMjobAgUqY0+zc0b8XN6vd948oC9Q5vCB/Km7fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735283377; c=relaxed/simple;
	bh=dB+v4vZ77CITUInmv0lV+wncrB3byu1tfpTr95BjbGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uft0LfagHeA28cWAyXqUC+Y0HKNLrhuKKQ14EWhLN1AaatzCLjLNnXPjBkNH5dC1XckUljwYiHnXZG7/WKNfGKEKmUCjRGVt/ce2OOeHKfDPRABuI3qzw6d+W2kmnfRbNsdwQ8TkPRpift1Fb6+bjp0ns+PcxE8C2cEcByLoxtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXnamMr2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8E29C4CED6;
	Fri, 27 Dec 2024 07:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735283376;
	bh=dB+v4vZ77CITUInmv0lV+wncrB3byu1tfpTr95BjbGk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QXnamMr2XtKWSp7RRN77i9xpcy8XSowqgUBiHlf8l9JXz6ffnaSdXK+ahnMwclce/
	 HmiDDbFyDc8zlxhDKdWmYH2wiQgt8T5OuKa2T8AK+kKnJoQphsbWAsflGZeMOAvDKY
	 5a3VXQqcwfdJ209iLwTPFtiIzCt38QJ0rtwg4FVUGJLLgDhfkQqxZQirzmuNJ6H9JY
	 M3zBB4oBxQng5sVfFaJwSWWZCtg+zV+l/hUlnkpIxD5VyFaJOUBC+jC9ITeztK8JFH
	 u7iRQPiDz0RJ01Bx3R6RcWDJRv5Y/IwMSrDeF86UYT9FMYm+zi8/mEnsCtqajuYvw8
	 UjUcCBVWcmnyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4774E7718F;
	Fri, 27 Dec 2024 07:09:36 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Fri, 27 Dec 2024 15:09:10 +0800
Subject: [PATCH v5 01/10] dt-bindings: media: Add amlogic,c3-mipi-csi2.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-c3isp-v5-1-c7124e762ff6@amlogic.com>
References: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
In-Reply-To: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 jacopo.mondi@ideasonboard.com, Keke Li <keke.li@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735283374; l=4546;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=UR+F4DAIF45sMVWIQ9QMPW/rSAXK8QvBGZOSXJAHlgQ=;
 b=k1PCDLEiKFcfeVE4XytUwNcjRST8aX6Gt5ffLfVSlkVJnBav31xbrELEdb1vBxbHLGpsS49Ae
 AD7c4+ET1HpCpi4wgX4a7bQF3l0ziSmWEaAF95sle1YT6dLYf8qkWuz
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

c3-mipi-csi2 is used to receive mipi data from image sensor.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 .../bindings/media/amlogic,c3-mipi-csi2.yaml       | 131 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 137 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
new file mode 100644
index 000000000000..76b68d1e7316
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,c3-mipi-csi2.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic C3 MIPI CSI-2 receiver
+
+maintainers:
+  - Keke Li <keke.li@amlogic.com>
+
+description:
+  MIPI CSI-2 receiver contains CSI-2 RX PHY and host controller.
+  It receives the MIPI data from the image sensor and sends MIPI data
+  to MIPI adapter.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,c3-mipi-csi2
+
+  reg:
+    maxItems: 3
+
+  reg-names:
+    items:
+      - const: aphy
+      - const: dphy
+      - const: host
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
+      - const: phy0
+
+  assigned-clocks: true
+
+  assigned-clock-rates: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: input port node, connected to sensor.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: output port node
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
+        csi: csi@ff018000 {
+            compatible = "amlogic,c3-mipi-csi2";
+            reg = <0x0 0xff018000 0x0 0x400>,
+                  <0x0 0xff019000 0x0 0x300>,
+                  <0x0 0xff01a000 0x0 0x100>;
+            reg-names = "aphy", "dphy", "host";
+            power-domains = <&pwrc PWRC_C3_MIPI_ISP_WRAP_ID>;
+            clocks =  <&clkc_periphs CLKID_VAPB>,
+                      <&clkc_periphs CLKID_CSI_PHY0>;
+            clock-names = "vapb", "phy0";
+            assigned-clocks = <&clkc_periphs CLKID_VAPB>,
+                              <&clkc_periphs CLKID_CSI_PHY0>;
+            assigned-clock-rates = <0>, <200000000>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    c3_mipi_csi_in: endpoint {
+                        remote-endpoint = <&imx290_out>;
+                        data-lanes = <1 2 3 4>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    c3_mipi_csi_out: endpoint {
+                        remote-endpoint = <&c3_adap_in>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index d2ab799a0659..2b06962db506 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1243,6 +1243,12 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC MIPI CSI2 DRIVER
+M:	Keke Li <keke.li@amlogic.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
+
 AMLOGIC RTC DRIVER
 M:	Yiting Deng <yiting.deng@amlogic.com>
 M:	Xianwei Zhao <xianwei.zhao@amlogic.com>

-- 
2.47.1



