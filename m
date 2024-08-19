Return-Path: <linux-media+bounces-16460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D984E9566C7
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 11:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91A15283B63
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 09:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B5E15E5DC;
	Mon, 19 Aug 2024 09:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2qqFBuu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6374115DBD5;
	Mon, 19 Aug 2024 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724059247; cv=none; b=cTSgH6OLeMmwFinPd3N9KozZD30xAcpApfw2JCXCsgYuJOZxAx7KnUOkdn2Y24jBVAl67n2WXTChFZS4WGCClldO05G3J0tmT1iTJF6s9hbGb42wmHlKt4XgXKOTcKxWwqNGt2gXM3qdVYn0GGr/BWlB03svz0x/aZyStlwp3X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724059247; c=relaxed/simple;
	bh=8H1odeU3V6stUGGcmwjpw85rUn8LLkVpZd9LVGlJwCg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UJMHnvOwbifXiTEUkUaRI8fVYhHtVgv1LGoeHaqTNzd4ukM7CQfhi9mCx6o5tASdUB6Pa+YRDAIAexdul1GxqJjECtFb5A8pxh5+gFXUiJRvZspjuskjYX1IIheCBXaWXQCeWHfgIM/FwUTUkh6J4RpC7T91I6dlHJ6fLgwYN8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2qqFBuu; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7a263f6439eso2611152a12.3;
        Mon, 19 Aug 2024 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724059245; x=1724664045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaBJp5+G6SXtcyzXFl/UAnZKiPS+vvZQ0BE0rakJE8I=;
        b=S2qqFBuuXGpd0N7CphiQLJZVO9uYJ7AzjcqIi8EGeN6p7+6m8kzhus2GbFLikTFMMo
         DyAgDz1+Na45LzKlARvMVbtbO5LMvn8sTHQS6GzhCAcTemetO666SCegJyOOAyNnGX8g
         P01Jjug/QTvgJaNu8e/RMq10+xAVo3Do5OKKzhAtl09LMO/JRNTnyrqhJF9BmnhFxRfN
         Ern+U9oDX4bIc1+K+VB+c4l9kMn+ltseVJEmN4avXOyAcfdtt8qzXB8Md6JJQzbnxdbs
         ENOpwc8R/fWhCxnzaBFxyhGuutj06IzM95V5UoTMM+V5kjhasOvim4uRv7medqSfltC3
         6e5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724059245; x=1724664045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaBJp5+G6SXtcyzXFl/UAnZKiPS+vvZQ0BE0rakJE8I=;
        b=MNieQLPuSjrEo1QuSkWDzStGfyCXaQz3xiwT2feaI02UyE1fwunoTlMH26MiRoBBLK
         zhJ06gD1UwGawIOWHY5A/qMKoM8mtuORJd9dkY7LE2ip3NAGtrgpAX8jPmbelkcRMgO2
         2tb618/GY6DaR2Fx8I9px/HD0UsFrhlO1sVH5JFFyWxSq6seTW9Vr/pbtKrPX/onyLmE
         2jp5yr/s5EaV4JhnnxtHGQ3PIvZxHu4uUf+WMw9Lu3IajK2csB5k+ff/O35usyRqXRn1
         jTkA0VfhMdifvd9xzWlfkSkvWur6kGDsQFDx5pOw7EUkmeVqZeXSCb2D7taa7smwCjrt
         4Lrg==
X-Forwarded-Encrypted: i=1; AJvYcCU2xLCvzDvdtult72x0kWO7ONFDcp7A642vhIEnDNUTymKS1wpIN1y3htWlym7jiYMXn99c1gK50SewOt7ixlVhrIBZmxISP1NNYMSMKFE52CZwtFZwYHcpOxiOaUksZG4IFCXdQnxnOrC16JbhQQnm9Ke33adtkpxFoCiqmqYwpNCr6VvS
X-Gm-Message-State: AOJu0YxWkneshVbqGJVC+CT4eWmais/dzfsVDD0oBbZonic2C8qiwpHW
	blgc5c63dG81BIfrysFbLrVTOifYSxHPD9jHmTAI4sv3alFNI3fm
X-Google-Smtp-Source: AGHT+IHESEJRgz5RoQr1+r21WRfRS+k4DQCryYbOXrq0aw27QQIg2rn+BwxFAbdSNek3DCdLjPOUiQ==
X-Received: by 2002:a17:90a:9a92:b0:2c9:3370:56e3 with SMTP id 98e67ed59e1d1-2d3e00f10dcmr9119583a91.34.1724059245460;
        Mon, 19 Aug 2024 02:20:45 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e3d97f2asm6750538a91.53.2024.08.19.02.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 02:20:45 -0700 (PDT)
From: Hui-Ping Chen <hpchen0nvt@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Hui-Ping Chen <hpchen0nvt@gmail.com>
Subject: [PATCH v2 1/2] dt-bindings: mtd: nuvoton,ma35d1-nand: add new bindings
Date: Mon, 19 Aug 2024 09:20:36 +0000
Message-Id: <20240819092037.110260-2-hpchen0nvt@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819092037.110260-1-hpchen0nvt@gmail.com>
References: <20240819092037.110260-1-hpchen0nvt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dt-bindings for the Nuvoton MA35 SoC NAND Controller.

Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
---
 .../bindings/mtd/nuvoton,ma35d1-nand.yaml     | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
new file mode 100644
index 000000000000..152784e73263
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nuvoton,ma35d1-nand.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nuvoton,ma35d1-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 NAND Flash Interface (NFI) Controller
+
+maintainers:
+  - Hui-Ping Chen <hpchen0nvt@gmail.com>
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+properties:
+  compatible:
+    enum:
+      - nuvoton,ma35d1-nand
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+patternProperties:
+  "^nand@[a-f0-9]$":
+    type: object
+    $ref: raw-nand-chip.yaml
+    properties:
+      nand-ecc-step-size:
+        enum: [512, 1024]
+
+      nand-ecc-strength:
+        enum: [8, 12, 24]
+
+    required:
+      - nand-ecc-step-size
+      - nand-ecc-strength
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        nand-controller@401A0000 {
+            compatible = "nuvoton,ma35d1-nand";
+            reg = <0x0 0x401A0000 0x0 0x1000>;
+            interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk NAND_GATE>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            nand@0 {
+                reg = <0>;
+
+                nand-on-flash-bbt;
+                nand-ecc-step-size = <512>;
+                nand-ecc-strength = <8>;
+
+                partitions {
+                    compatible = "fixed-partitions";
+                    #address-cells = <1>;
+                    #size-cells = <1>;
+
+                    uboot@0 {
+                        label = "nand-uboot";
+                        read-only;
+                        reg = <0x0 0x300000>;
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1


