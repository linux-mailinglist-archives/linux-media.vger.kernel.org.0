Return-Path: <linux-media+bounces-14638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C16F927746
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 15:37:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FF3F1C22660
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 13:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D251AEFFE;
	Thu,  4 Jul 2024 13:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Qk7rq5LL"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C436F1AEFC2
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 13:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720100208; cv=none; b=WxdefdlyvKRim3Tn5saiZZrYGdsm5YNT0hFfUIcVqioaPakS/ElzoMcplmRMboIqCfgxwm24G2BzV65/4Lo60g9VqUeRl7Cd7w+rUH9IKOuRvqFD/N0Hm+MPQ4aokfoSaS+D6Y7a/RZp+eQ22kotwNbqpo+As6+34qUNudnkPcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720100208; c=relaxed/simple;
	bh=RYYgeCPrB7TpDP5ZOKb8zJx1/s5LUJcmb8/1KsBaWcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2rO5I9eH0ZdTYu6XlCC9yaGqenOwgWzhK5aK961Vvw2QXTXF8ZtedtXJMvc8XFJdQTFOVOA9G2jPWmf5N26d7GSzCh++v4k5yl768diweJteeSYRb4cDB8bvt/fy12OC/PpQYVPEprjDVbp64FV4Cd0U0SyPcBQGXGira5K+M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Qk7rq5LL; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52e99060b41so654911e87.2
        for <linux-media@vger.kernel.org>; Thu, 04 Jul 2024 06:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720100204; x=1720705004; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYPMoH4bkrCa+3pw12nCoA9Tah8I9q1IjZ3LY8Md8Pc=;
        b=Qk7rq5LLaqclLtUxSfffMDzwJ6KVbcut6mB4JPZO4uCaMXvkDV8GVP2pYZMzmmN7B4
         bPEIpxVkhCgCxB3AZ7cNZuec9qREZdJt63tBZUuPblKygD24X/Xf1ZVIVOkWTiYQSy8l
         +DiYWBpZ1K1BI0in1/rtU4Om6dlFc3wIUhj0KZi7uzBxzBECVTUg4TcNpA7u+tvues5q
         UaXVvusVCi+1u0uOgi7RVM97RN6dPq/63Z81xdo1EFEvNJQ32iJ0KCPplu/zYbZxLzv8
         2Ykk4KRPPll4C0DHNrrYHrTEsg9d5ZxmuGNwYijIbp8hr0Oq3/FVGHH/gvCLzJ/XJH4I
         1NsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720100204; x=1720705004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZYPMoH4bkrCa+3pw12nCoA9Tah8I9q1IjZ3LY8Md8Pc=;
        b=KH3paB1F2j3491TbzyuuGWE5aB8Tzihlm7Cp7MUzB1Luf57wQlU8qr3f5/UNrwrq24
         y2zkEUOU9GS7GsFlDLSjWv8f1NoR9h8nY8cCI02jQrMbnzPr2s3fI3iJHigVW91yFkBC
         EmsEMLpK4ZpI3v46KXzG4u2ay+/STZga9srYO6pXjYiLibH7/MVLtX0Uz5iqZVg7jtol
         TMpjP5fU6smKMqoXwmhP/Zlg4xbt0Lt8d89ab76vBiXBPgrFQsOo9twk2MBRdInvYx9V
         fZRL311PhD+Eu53DlZsUmlBUMj1i+MnLnVgW6fYB63ssVa5DCRbk0GqrNktgiLyVyU/4
         UnhQ==
X-Gm-Message-State: AOJu0YwqW5/6n2BOBUwaWE/gG5AmGtGj/bMXz57n5oZZ6/6+W3qKBlX0
	r1QNZuA2yhqjDGraJ2l82dShAALICf8Pi4kuoM5YjXkbTeepidUb9ryafBIFGv8=
X-Google-Smtp-Source: AGHT+IEhWbShkVQDJ7LiqZTQQVwiHASOCjjIiWgwIddLZs/YqTU94+mV1Q1k51ht0YvrQI4O1pNBPA==
X-Received: by 2002:a19:f51a:0:b0:52e:9762:2ba4 with SMTP id 2adb3069b0e04-52ea063a4a8mr1093804e87.25.1720100204178;
        Thu, 04 Jul 2024 06:36:44 -0700 (PDT)
Received: from [192.168.42.0] ([2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2ca5d5sm25382025e9.30.2024.07.04.06.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 06:36:43 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 04 Jul 2024 15:36:41 +0200
Subject: [PATCH v5 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-add-mtk-isp-3-0-support-v5-2-bfccccc5ec21@baylibre.com>
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
 Phi-bang Nguyen <pnguyen@baylibre.com>
X-Mailer: b4 0.13.0

From: Phi-bang Nguyen <pnguyen@baylibre.com>

This adds the bindings, for the ISP3.0 camsv module embedded in
some Mediatek SoC, such as the mt8365

Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
Link: https://lore.kernel.org/r/20230807094940.329165-4-jstephan@baylibre.com
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../bindings/media/mediatek,mt8365-camsv.yaml      | 109 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
new file mode 100644
index 000000000000..850231e8e6c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (c) 2023 MediaTek, BayLibre
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/mediatek,mt8365-camsv.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek CAMSV 3.0
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+  - Julien Stephan <jstephan@baylibre.com>
+  - Andy Hsieh <andy.hsieh@mediatek.com>
+
+description:
+  The CAMSV is a video capture device that includes a DMA engine connected to
+  the SENINF CSI-2 receivers. The number of CAMSVs depend on the SoC model.
+
+properties:
+  compatible:
+    const: mediatek,mt8365-camsv
+
+  reg:
+    items:
+      - description: camsv base
+      - description: img0 base
+      - description: tg base
+
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: cam clock
+      - description: camtg clock
+      - description: camsv clock
+
+  clock-names:
+    items:
+      - const: cam
+      - const: camtg
+      - const: camsv
+
+  iommus:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Connection to the SENINF output
+
+    required:
+      - port@0
+
+required:
+  - compatible
+  - interrupts
+  - clocks
+  - clock-names
+  - power-domains
+  - iommus
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/mediatek,mt8365-clk.h>
+    #include <dt-bindings/memory/mediatek,mt8365-larb-port.h>
+    #include <dt-bindings/power/mediatek,mt8365-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        camsv1: camsv@15050000 {
+            compatible = "mediatek,mt8365-camsv";
+            reg = <0 0x15050000 0 0x0040>,
+                  <0 0x15050208 0 0x0020>,
+                  <0 0x15050400 0 0x0100>;
+            interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_LOW>;
+            clocks = <&camsys CLK_CAM>,
+                     <&camsys CLK_CAMTG>,
+                     <&camsys CLK_CAMSV0>;
+            clock-names = "cam", "camtg", "camsv";
+            iommus = <&iommu M4U_PORT_CAM_IMGO>;
+            power-domains = <&spm MT8365_POWER_DOMAIN_CAM>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    camsv1_endpoint: endpoint {
+                        remote-endpoint = <&seninf_camsv1_endpoint>;
+                    };
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6bd7df1c3e08..9ac8c08ba692 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14163,6 +14163,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 M:	Julien Stephan <jstephan@baylibre.com>
 M:	Andy Hsieh <andy.hsieh@mediatek.com>
 S:	Supported
+F:	Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
 F:	Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
 
 MEDIATEK SMI DRIVER

-- 
2.45.1


