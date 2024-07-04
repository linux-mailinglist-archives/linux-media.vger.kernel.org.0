Return-Path: <linux-media+bounces-14637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B86927742
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 15:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4B63B22CE3
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 13:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E35E1AEFD2;
	Thu,  4 Jul 2024 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1t4Etc+v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A9C1AED30
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 13:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720100206; cv=none; b=XTZaheq4zbARKcligZQUv4JDTMEpZ/nbg4G44487vY8H/JY9sCypHVZQ26FwlXQgi67mWXPSue71qW0cvZ7cG+zy2qKZJMiHVpPG3n8shjUGP4VXzOyt7ZOuwY16CdOf4Y/AQbAygIMKCFE2clemlmtfW5IdCgGob3DjKAP5qXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720100206; c=relaxed/simple;
	bh=/djfZP7VzVIy1lg9gvPfDjYZ9xNxTooU2vMPeUwDGeg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=osFkNJcimJnSKItK+U1QZUvC4hyP2ioS+UyKIaHD1WDa8FOWztVtQlXjDp1wRsN8mjUkACChUoUF9e44ciP8Bqzd/VWeh4G4Y0c6JwLr8GJTTykq2cIzMqzIl3mJwpMxUMt7yGfjfaIAEzWH45+vlpQuTRPhANku/Y80jXghxgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1t4Etc+v; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42562fde108so4415275e9.0
        for <linux-media@vger.kernel.org>; Thu, 04 Jul 2024 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720100203; x=1720705003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AR3dVAeHzt82Jp21c406uw31JbXeeOgVxBmvPqLPqVA=;
        b=1t4Etc+v0V5jtSSET+3AbT9RTASFf8Zv3hAfrGkBhfCuY+BSOjht9RVTPNuURGlVKq
         YNKJ1paEnid8uGPP3bDtrP23U/F6qx22GrUhBZ2eC+izTHyb3GZ/mjylY6p8YGWZcA6Z
         UvgA2vRdYjzMMST+t4Ufsclecl1uK8gyUb13+49XNNmHVVk0ucO4e84aFIXMFyK3sCll
         BFkWUXlB+Scxl7bg7YRzbc/nT089eST2SBB+V5odg2hNpdVgqlhZY0S6jxgoOyjZjAyg
         cKOSoc/jPTmO6ZBzVL1RrWQCVhdbbgXmeyqKZtwx5M54URypMK2exu8xBU3MU2p+gJs5
         KZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720100203; x=1720705003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AR3dVAeHzt82Jp21c406uw31JbXeeOgVxBmvPqLPqVA=;
        b=pQ6SwWQ0LI3Ygi4D/HKg/fXqpuZJJ5Hz0ay9etZHVqe+b7vh8PBbBqWX+HYxCbLUPS
         WxKYe9E3TSQMLoCJENWBCNtkRx9SrPKVGVpztNU4oiVHa8Jonb/EX09B9OrjQvT6JX+F
         g/T2K1HdjEaU6u6vHx2O+pEFDXwDq/kZ8Y6ReqLjdRvgBlgN2gitDj8gH84fO5001Pw3
         fcOXkdihZaccpeVGx3Q2DekLOQj7RmChBnnOfBTiKMT7raaBzy9vP8jbrUHfKfDa3Wgx
         6H46TZBAVpljzqWXV6cGnnsCgyegv8o2A8Xi2K2cyOOjxK56B2NS0dWk/WUOKYFoXzsz
         9BUQ==
X-Gm-Message-State: AOJu0YxoEiG2xrU1n6wwyQTZwGHXEmYz/Nm9LBg4CdixteIgJ3mBjh30
	ETOgoNscQn3jScSUVs0eEAC8CYsm3s0U42LRaUXck7HHUK2G+4JUFnmE9EVnme4=
X-Google-Smtp-Source: AGHT+IFC6qC6Y9eG7CRjeyUac5yLSei0dgFNE5ephIW+IMkQqKEHdUtqpYAXpGg98MFrb443TB9BLw==
X-Received: by 2002:a05:600c:88a:b0:424:a4f1:8c3e with SMTP id 5b1f17b1804b1-4264a46cb5cmr12277055e9.34.1720100202870;
        Thu, 04 Jul 2024 06:36:42 -0700 (PDT)
Received: from [192.168.42.0] ([2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2ca5d5sm25382025e9.30.2024.07.04.06.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 06:36:41 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 04 Jul 2024 15:36:40 +0200
Subject: [PATCH v5 1/5] dt-bindings: media: add mediatek ISP3.0 sensor
 interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-add-mtk-isp-3-0-support-v5-1-bfccccc5ec21@baylibre.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andy Hsieh <andy.hsieh@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Julien Stephan <jstephan@baylibre.com>, 
 Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>
X-Mailer: b4 0.13.0

From: Louis Kuo <louis.kuo@mediatek.com>

This adds the bindings, for the mediatek ISP3.0 SENINF module embedded in
some Mediatek SoC, such as the mt8365

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
Signed-off-by: Phi-Bang Nguyen <pnguyen@baylibre.com>
Link: https://lore.kernel.org/r/20230807094940.329165-2-jstephan@baylibre.com
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../bindings/media/mediatek,mt8365-seninf.yaml     | 275 +++++++++++++++++++++
 MAINTAINERS                                        |   7 +
 2 files changed, 282 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
new file mode 100644
index 000000000000..aeabea9f956a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
@@ -0,0 +1,275 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek, BayLibre
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8365-seninf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Sensor Interface 3.0
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Julien Stephan <jstephan@baylibre.com>
+  - Andy Hsieh <andy.hsieh@mediatek.com>
+
+description:
+  The ISP3.0 SENINF is the CSI-2 and parallel camera sensor interface found in
+  multiple MediaTek SoCs. It can support up to three physical CSI-2 input ports,
+  configured in DPHY (2 or 4 data lanes) or CPHY depending on the SoC.
+  On the output side, SENINF can be connected either to CAMSV instance or
+  to the internal ISP. CAMSV is used to bypass the internal ISP processing
+  in order to connect either an external ISP, or a sensor (RAW, YUV).
+
+properties:
+  compatible:
+    const: mediatek,mt8365-seninf
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Seninf camsys clock
+      - description: Seninf top mux clock
+
+  clock-names:
+    items:
+      - const: camsys
+      - const: top_mux
+
+  phys: true
+
+  phy-names: true
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI0 or CSI0A port
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI1 port
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI2 port
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+      port@3:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: CSI0B port
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              clock-lanes:
+                maxItems: 1
+              data-lanes:
+                minItems: 1
+                maxItems: 2
+
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: connection point for cam0
+
+      port@5:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: connection point for cam1
+
+      port@6:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: connection point for camsv0
+
+      port@7:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: connection point for camsv1
+
+      port@8:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: connection point for camsv2
+
+      port@9:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: connection point for camsv3
+
+    required:
+      - port@0
+      - port@1
+      - port@2
+      - port@3
+      - port@4
+      - port@5
+      - port@6
+      - port@7
+      - port@8
+      - port@9
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: mediatek,mt8365-seninf
+then:
+  properties:
+    phys:
+      minItems: 2
+      maxItems: 2
+      description:
+        phandle to the PHYs connected to CSI0/A, CSI1, CSI0B
+
+    phy-names:
+      description:
+        list of PHYs names
+      minItems: 2
+      maxItems: 2
+      items:
+        type: string
+        enum:
+          - csi0
+          - csi1
+          - csi0b
+      uniqueItems: true
+
+examples:
+  - |
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy.h>
+    #include <dt-bindings/power/mediatek,mt8365-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        csi: csi@15040000 {
+            compatible = "mediatek,mt8365-seninf";
+            reg = <0 0x15040000 0 0x6000>;
+            interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&camsys CLK_CAM_SENIF>,
+                     <&topckgen CLK_TOP_SENIF_SEL>;
+            clock-names = "camsys", "top_mux";
+
+            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+
+            phys = <&mipi_csi0 PHY_TYPE_DPHY>, <&mipi_csi1>;
+            phy-names = "csi0", "csi1";
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    seninf_in1: endpoint {
+                        clock-lanes = <2>;
+                        data-lanes = <1 3 0 4>;
+                        remote-endpoint = <&isp1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                };
+
+                port@2 {
+                    reg = <2>;
+                };
+
+                port@3 {
+                    reg = <3>;
+                };
+
+                port@4 {
+                    reg = <4>;
+                    seninf_camsv1_endpoint: endpoint {
+                        remote-endpoint = <&camsv1_endpoint>;
+                    };
+                };
+
+                port@5 {
+                    reg = <5>;
+                    seninf_camsv2_endpoint: endpoint {
+                        remote-endpoint = <&camsv2_endpoint>;
+                    };
+                };
+
+                port@6 {
+                    reg = <6>;
+                };
+
+                port@7 {
+                    reg = <7>;
+                };
+
+                port@8 {
+                    reg = <8>;
+                };
+
+                port@9 {
+                    reg = <9>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..6bd7df1c3e08 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14158,6 +14158,13 @@ M:	Sean Wang <sean.wang@mediatek.com>
 S:	Maintained
 F:	drivers/char/hw_random/mtk-rng.c
 
+MEDIATEK ISP3.0 DRIVER
+M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+M:	Julien Stephan <jstephan@baylibre.com>
+M:	Andy Hsieh <andy.hsieh@mediatek.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
+
 MEDIATEK SMI DRIVER
 M:	Yong Wu <yong.wu@mediatek.com>
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)

-- 
2.45.1


