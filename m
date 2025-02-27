Return-Path: <linux-media+bounces-27123-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DE9A4767F
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 08:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51DA1188E84E
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2025 07:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7DAB225403;
	Thu, 27 Feb 2025 07:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jpnq962c"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4088813777E;
	Thu, 27 Feb 2025 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740641238; cv=none; b=S07ckwOby0Abkzf5jSrAKFn6wTv0O74VFVTNMXneIbrCzpyK2RKa3RqvGVkkVlwVfSb6T/PmWrPdNBfCuP3qR6bUBdE1eloXAZKpDmz60Dw2JyG/l0Kzt7WkHPC8J+zoiyxXDN7EMwpB6wHV8yF7Nk9aabbbAUtFFRJtYTa8nLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740641238; c=relaxed/simple;
	bh=mUEnnIBt0E4X0McB7uSdLl/EHQ1pwdGxfllLmAMjVY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y2tM3UADcEK8GmHvnXhe6kLuKZ06L0nAdBChNW6ZIXhkRAvGpvjDvnVQc3nVVeI2v9w6RevwK1EHdrmusQ4Cjwbaxplj8tAk5XsfONZC/HdlS6iUAaMQ4Q8Qr0Pw0yrb9DKLgDkXrBGyR/z58jRP6b8bF9hoe94KQjoFhd4M71I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jpnq962c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2430C4CEE7;
	Thu, 27 Feb 2025 07:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740641237;
	bh=mUEnnIBt0E4X0McB7uSdLl/EHQ1pwdGxfllLmAMjVY8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Jpnq962cNzdx5hRcYYBQB/NR80P87j7p7LtkyMZU/svdij+4TWCnYmg6fz2LMAFmM
	 NHFELxa7LA+KpFEJRTAcn9cFNlB2heablks36DMEC9A/QvPr48JFpeaJZ4a+BgBrPW
	 Rgg+apC9qoTxsngqlsNjaZa10sjaxzjW4G9pTo4m2AWfsVg0GYb4i0za5dNMhIPloe
	 Nqx595lPK9+pW7BbvEHQ8PoK+ZiHw0pBBVrjv8UWcKk98jjzfSL5UP8RzcKM/PXOQN
	 jIKus2yXn2kKuhh2OiROGSon7/jzk2u0MQakjKdknFyKqruQwHlgqOYupmitbdcwXY
	 SnIBUGf5aLMzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DBD5C1B0D9;
	Thu, 27 Feb 2025 07:27:17 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Thu, 27 Feb 2025 15:27:12 +0800
Subject: [PATCH v6 01/10] dt-bindings: media: Add amlogic,c3-mipi-csi2.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-c3isp-v6-1-f72e19084d0d@amlogic.com>
References: <20250227-c3isp-v6-0-f72e19084d0d@amlogic.com>
In-Reply-To: <20250227-c3isp-v6-0-f72e19084d0d@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 jacopo.mondi@ideasonboard.com, Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740641234; l=4416;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=qlW2s7Pbdw+YMgHyq38D0qj4KtoDydNxuyBolXZJNVQ=;
 b=5ScUV5SPcfUazhwr5Dz1PXpiOeElB0e1Ig4ipSC+2O4fb9uFu8K3iH2QHSlumOtQbQqJtgU9K
 rMrTUr1eaMVBz3i+tzhMfOrqhr0O+Zu5f/QAXE2uFRhq2e1IP58DDtT
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

c3-mipi-csi2 is used to receive mipi data from image sensor.

Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 .../bindings/media/amlogic,c3-mipi-csi2.yaml       | 127 +++++++++++++++++++++
 MAINTAINERS                                        |   6 +
 2 files changed, 133 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
new file mode 100644
index 000000000000..b0129beab0c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
@@ -0,0 +1,127 @@
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
index bd15d86a3ad7..d11a15ad5f62 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1252,6 +1252,12 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
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
2.48.1



