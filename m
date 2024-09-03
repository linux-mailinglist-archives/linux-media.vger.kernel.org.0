Return-Path: <linux-media+bounces-17433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC1596944E
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 08:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 808AA1C214B4
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 06:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9524F1D6DD4;
	Tue,  3 Sep 2024 06:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqbS3iRO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C461D6799;
	Tue,  3 Sep 2024 06:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725346638; cv=none; b=DwiO/bBlHol5fYkfviDM7p6simbwThxMsPX1SXWKwc5/sF8Ymer1kAyhgRzCJHz1t+WQMLtMEXr347H1DFii2AIpRUYE8JPrLIqSKKYagaYXhLXWffhDesCuJASFsApMbnD+WxH/8TFpPaw52Je2cLOqKNRK4Gdp9p/5lUTtlxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725346638; c=relaxed/simple;
	bh=J5GI0hvUhunCdxoFPNJluz175nvgHn46GSqWkTeI1vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dPupxZVKbNmE8kuSCcMhe6BVwhC0jCsgsBemVohGJdReML6obnp1OVxoRRSWKhshG6rUo8D1ahGotMdpMoRo1sJaxKvwKgE+8tKlSU9rk64+WH5+RmmjFPPUDctUXDUtuCumgC6mSmDftyV4Nb45l0JTLqYqNMmMX3mkfIgGi6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqbS3iRO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2AC3C4CECC;
	Tue,  3 Sep 2024 06:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725346637;
	bh=J5GI0hvUhunCdxoFPNJluz175nvgHn46GSqWkTeI1vg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SqbS3iRODQOSfbAiFgclM4nSCVMC5b0kiL6Bsq07JFOeiWfsoghh6Di8KiN1NquX7
	 qt9bg1Q8WiXjhzT/4u+HsxCro1/bwUwHsx3GZQZaQqQorSanFuHbO0QPEKs5rGkzLd
	 aYrvM+2CAG6yVIchUVQ7F40iSLFM44r4fIzRkc8FqpgVjn7U2rYQGjbDjNVu5SflW6
	 dYnpZb3XyaFuE4T1r9qjQJ7wq+t312DalfiGlaPEdoGmxsCMm8xXJfZ1oZNWgAYMPy
	 6WYsGsJCedZkqaUBu/uztyviN0FciDU9UVigvnNXE5rHsbMih5cGryhUq2/hHVtnb7
	 vxez7hcGLcdgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80D6CD3432;
	Tue,  3 Sep 2024 06:57:17 +0000 (UTC)
From: Keke Li via B4 Relay <devnull+keke.li.amlogic.com@kernel.org>
Date: Tue, 03 Sep 2024 14:57:09 +0800
Subject: [PATCH 5/9] dt-bindings: media: Add amlogic,c3-isp.yaml
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-c3isp-v1-5-8af0edcc13c8@amlogic.com>
References: <20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com>
In-Reply-To: <20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com, 
 Keke Li <keke.li@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725346629; l=2763;
 i=keke.li@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=Mgpu7RiivFRUIgYiowX1j2a7y0HeqamRD0/JpSf9BmY=;
 b=IqrExi+3NRN3zCeZVaOmHYUUebP9hfGcrp0l3C69Hkwx5DSUASHPDSv30e6aqVt2gpLfPKd0J
 KbURmgpINhHB3kwamCS9zULCPdxowNE76ZXAyPsdXDukLL3mluoQw+L
X-Developer-Key: i=keke.li@amlogic.com; a=ed25519;
 pk=XxNPTsQ0YqMJLLekV456eoKV5gbSlxnViB1k1DhfRmU=
X-Endpoint-Received: by B4 Relay for keke.li@amlogic.com/20240902 with
 auth_id=204
X-Original-From: Keke Li <keke.li@amlogic.com>
Reply-To: keke.li@amlogic.com

From: Keke Li <keke.li@amlogic.com>

c3-isp is used to process raw image.

Signed-off-by: Keke Li <keke.li@amlogic.com>
---
 .../devicetree/bindings/media/amlogic,c3-isp.yaml  | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml b/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
new file mode 100644
index 000000000000..169a035bcee2
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
@@ -0,0 +1,104 @@
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
+description: |-
+  Amlogic ISP is the RAW image processing module
+  and supports three channels image output.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,c3-isp
+
+  reg:
+    minItems: 1
+
+  reg-names:
+    items:
+      - const: isp
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: vapb
+      - const: isp0
+
+  interrupts:
+    minItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: input port node.
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - power-domains
+  - clocks
+  - clock-names
+  - interrupts
+  - ports
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
+
+            reg = <0x0 0xff000000 0x0 0xf000>;
+
+            reg-names = "isp";
+
+            power-domains = <&pwrc PWRC_C3_ISP_TOP_ID>;
+
+            clocks = <&clkc_periphs CLKID_VAPB>,
+                     <&clkc_periphs CLKID_ISP0>;
+
+            clock-names = "vapb", "isp0";
+
+            interrupts = <GIC_SPI 145 IRQ_TYPE_EDGE_RISING>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    c3_isp_in: endpoint {
+                        remote-endpoint = <&c3_adap_out>;
+                    };
+                };
+            };
+        };
+    };
+...

-- 
2.45.2



