Return-Path: <linux-media+bounces-15470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B8A93F89F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 16:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9DF01C21BD0
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 14:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F47156231;
	Mon, 29 Jul 2024 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ABAJxpTy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B7D153812
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 14:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722264495; cv=none; b=dHEDNnlECEWYcCxcSMzcCPhZB+XTc23YZ0YpgHl18fEdPFaLii5Eu4TR0/XXarydwsEcxKqDgyprqg9N7EK9UvURARca8IqMsb+d30Oe6WEbXhzXG5EiC9vQdEfI9omagdJDlxBv8jU8Vw432ILDTpN6lFEY4t38dG6qOrI3ySI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722264495; c=relaxed/simple;
	bh=mvLYEMNbb38v1ffOgbNje3HAbrH31/YguMc4P7yIbaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LirWnjpDctxwkkRIJK7eR4scT+FjOdj3+azqxplvFu0abMydvbdU63R05QO1OPJhOxKEA5TRgBYHVMX5g29VqrDv0HDHxCJJuCT0fAB1nFYcjXqk1SRnZXneeN/kAEbN8/qER3jEpkiwbET4EvTjKuhZeNpoUrRgYAGaM5HLcFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ABAJxpTy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4280c55e488so11475205e9.0
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 07:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722264491; x=1722869291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=El6+JDl0XXF4OJ/yktsnr1UYCyb9C9pq8a3SoWQOeX0=;
        b=ABAJxpTygzvIrRawhXdz11FQFto1yYm+vaMKGAOlA0/dIj1WNeF+RcpKLo/INlx2Bb
         rw/qnZIUODRMSIi6TJG7Ol2fReUB4O2PQeh0ZWHnh+tcBT4tm1lzEs/ohNOWV7KDLASR
         gaRxqtUFSgx8LB8Ot52gfzq3L58lqJltUf7dIRxJxQ13zO3ST2fDTpYC+/aiyunF+tv1
         GXllzbi94OQXAK3TkK/Q31xSnMtYfD0xMOYK7ccILYuVQAoZGw8uLMTgAQlWnIdIAu8u
         gNeXGQY9JoPbkuzVdU3afNrvjoX9w/MDL74tkS/6z9CArMxk6mfEZx39SkbD/qdh44wA
         wRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722264491; x=1722869291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=El6+JDl0XXF4OJ/yktsnr1UYCyb9C9pq8a3SoWQOeX0=;
        b=O9Y58zxsvUev474Y0yYdTESrDtboWcboESYWLt5551egFsfsbtw/iNs1uiKnysZRBg
         8dfbH79q7SXLumbO2trHJawJn2Tj4xlnf2Gjgoh2eXu36Xpgp+k2jVj/Ef8AIBKZvTkk
         gqO8jEhXj9hEkVcz3obNgXD5LDiiM8HZcQTWa5oP4iGwob4YCjUkSaWwWsFglT8OmZWE
         lcNlAUZZ0tcJRjpsW6dRYFOx9oxzkGpWCHwhlqs61dK5aRmRKqm42IYHTvxYMXmcNVLD
         7Y5K+wysKknWyjLRtAKo9v5hZHIl1MH8gW94vXfYeYRe3ZqZx5N4iBlnkN6S09PL4cZd
         op+Q==
X-Gm-Message-State: AOJu0YwaIyoP5MC9QTpjodKPyzsImmvBz6MSu7z40RabF4D2FOYGaukp
	D7oQfmdGo74C6iwScSu/I4/p+F9X2UH5HHEMi8fxeQMyye5xELhFl8qODGnjoHE=
X-Google-Smtp-Source: AGHT+IE8FVDrhc0tNwR4hZ5qn7fS2WRYXbujGagJOFKa+MBwNXzPpEShlqQ/xLV7SOrzYFG6J3nGKg==
X-Received: by 2002:a05:600c:a4b:b0:424:8dbe:817d with SMTP id 5b1f17b1804b1-42811e6ab12mr55428045e9.10.1722264491016;
        Mon, 29 Jul 2024 07:48:11 -0700 (PDT)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428057b645dsm180091705e9.43.2024.07.29.07.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:48:10 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 29 Jul 2024 16:48:01 +0200
Subject: [PATCH v6 2/5] dt-bindings: media: add mediatek ISP3.0 camsv
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-add-mtk-isp-3-0-support-v6-2-c374c9e0c672@baylibre.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
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
Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../bindings/media/mediatek,mt8365-camsv.yaml      | 109 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
new file mode 100644
index 000000000000..fdd076756459
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
+        camsv@15050000 {
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


