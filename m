Return-Path: <linux-media+bounces-31107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0956CA9DF78
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 08:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B8EC1A81371
	for <lists+linux-media@lfdr.de>; Sun, 27 Apr 2025 06:28:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C9C242D9A;
	Sun, 27 Apr 2025 06:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTkEuwO1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0FC2405F5;
	Sun, 27 Apr 2025 06:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745735245; cv=none; b=BIupG1p1eMk9VfQypWtoVsb/ugd1PNqJFpTja6PnxFuEvJWBs/ss8QKQIBM5UmOUkPb4qJSSDqQ1W8+f3DEliDeoWqONkzFyfe0gNAqJ1LsK0oPybcwj5dx9yx4oi2eIkamXvSxTABqQ44BDYbPzYjXDOMeOXfaz5YQVrrQ2C3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745735245; c=relaxed/simple;
	bh=jWtCk7OJxJQP4aFGkbiIAjpWZekDiU1uBW1a10F2xG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TF7A9qNIepItADE62V0z+X+6vTTcPbUegujmecs2HKZxWyjjMX2gogfvWLbSsTMLdaosFJIeSRAx6blN49nUGzvLgxuWFuZYmICJDzXkaa5YkOVAFCjYFwqc1FNnwa5kBKSrOlz35jF5wFzB7sy4zFpXsX1k2YYkoAs0nRXqswk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTkEuwO1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69F56C4CEF6;
	Sun, 27 Apr 2025 06:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745735244;
	bh=jWtCk7OJxJQP4aFGkbiIAjpWZekDiU1uBW1a10F2xG8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bTkEuwO15ymYuQl68J5FUjpvWt7g80+BavxY1iIGfMg3yvoMy8WVXgCWnrRcvx6YP
	 HL3nm2lEKTW9MU76RjViPfRQR0czj1NzXB6LDhSKesvb9IhU5zzPjjUKMISAKE6UKJ
	 aXashXNiPN1reKrqivhbmnT2Xfebaar4ystNFTO/g+g8Zl0CAdKkZADeYwAK/JXz69
	 rRKGwmBUK7I70nYP2rZTvDa3DC3M0gLagutZ/x1/a3+kSCONBSwA1uZPoqI953mXbW
	 ozDc+dZy+mN8adUnGsUH+yMwg3NqANT97n9IUwg61SUaXD4ZRWfomJkNJ5AFnlzo6r
	 apSXGyTnRq0gQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FBACC3ABA0;
	Sun, 27 Apr 2025 06:27:24 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Sun, 27 Apr 2025 14:27:13 +0800
Subject: [PATCH v9 05/10] dt-bindings: media: Add amlogic,c3-isp.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250427-c3isp-v9-5-e0fe09433d94@amlogic.com>
References: <20250427-c3isp-v9-0-e0fe09433d94@amlogic.com>
In-Reply-To: <20250427-c3isp-v9-0-e0fe09433d94@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 jacopo.mondi@ideasonboard.com, Keke Li <keke.li@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745735242; l=3274;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=DHW5YzMz2Tg8z/3eAjFGTJeeaROJ1MXnWBp20XrExEs=;
 b=rfY8efsUhL+HuYDu99Ct3r36WBbdofhFJainG4C3SBRUyEEh0Eawekcg0yOcgN4UiJHL+u3Mk
 tyz4urr2t3HBbC3QmbPe0yZSPYpMOnU3RCjoz5jsb/At+FHDBA88VV+
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

c3-isp is used to process raw image.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 .../devicetree/bindings/media/amlogic,c3-isp.yaml  | 88 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 ++
 2 files changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
new file mode 100644
index 000000000000..123bf462f098
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/amlogic,c3-isp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic C3 Image Signal Processing Unit
+
+maintainers:
+  - Keke Li <keke.li@amlogic.com>
+
+description:
+  Amlogic ISP is the RAW image processing module
+  and supports three channels image output.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,c3-isp
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: isp
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
+  interrupts:
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: input port node.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - clock-names
+  - interrupts
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/amlogic,c3-peripherals-clkc.h>
+    #include <dt-bindings/power/amlogic,c3-pwrc.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp: isp@ff000000 {
+            compatible = "amlogic,c3-isp";
+            reg = <0x0 0xff000000 0x0 0xf000>;
+            reg-names = "isp";
+            power-domains = <&pwrc PWRC_C3_ISP_TOP_ID>;
+            clocks = <&clkc_periphs CLKID_VAPB>,
+                     <&clkc_periphs CLKID_ISP0>;
+            clock-names = "vapb", "isp0";
+            assigned-clocks = <&clkc_periphs CLKID_VAPB>,
+                              <&clkc_periphs CLKID_ISP0>;
+            assigned-clock-rates = <0>, <400000000>;
+            interrupts = <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>;
+
+            port {
+                c3_isp_in: endpoint {
+                    remote-endpoint = <&c3_adap_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6f1326bc60fa..a2fed5b24c9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1258,6 +1258,12 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC ISP DRIVER
+M:	Keke Li <keke.li@amlogic.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
+
 AMLOGIC MIPI ADAPTER DRIVER
 M:	Keke Li <keke.li@amlogic.com>
 L:	linux-media@vger.kernel.org

-- 
2.49.0



