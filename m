Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A42F9103855
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 12:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729041AbfKTLOm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 06:14:42 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40060 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbfKTLOk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 06:14:40 -0500
Received: by mail-wm1-f67.google.com with SMTP id y5so1172537wmi.5
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2019 03:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7OQW2DHYgmBIlXG6zmK9XIg6mefmFvu2tJV+rZvlPNo=;
        b=TwqwRr+zepj15txJ0fs0OG/rGXM125OJhoTlBAUsZcKjdlA//X5OCOGSiEn2a3tOYg
         P53qU9y+dIbTQPLV2Ap0RT8L32wV+8BEfV6W6qOAS5rp2TtWCh/IaUK/xSvwwlACBGar
         5MPqyxE+fvHUufnpBOILhvWTphexPXwJloG/Ap9UrAo1mQWE3tzsscqzAN6F67eY8lsl
         WnbsJxx3QEkjFrWEaBRF0ir9+upwfyzX5cpZhIDZHg6bMHz5/FwtzrQezgxG9kEXXfNf
         qZ6At8e0wTQPEFDiIgDL242/fEW6t58C8QAyfy6gvLs2apd3kR7/AfTwZtIPzm/T/Aco
         y0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7OQW2DHYgmBIlXG6zmK9XIg6mefmFvu2tJV+rZvlPNo=;
        b=I/0OZqDArFN0puHVBN5SriWSYL65gTtCtxm2TE5yhsKAn8nGVxkru87dJLUvVkQZ76
         pw6OudixxOHpYGybWCV/+vtjsX1WAFEEkx0fOAR37ywClMOMc+jXQjvimeTCru8uCXRs
         9fe/sgyqFUvihwvVz5jUd7EK42JdwJxMQdvxBIyLVS0bgdQrz23xo/3KjqPpetlPQ3TP
         OKe4evX6pyM0f9yDxGkOB24LpIiqlle0gMD62Ni7d+D1PUUN+OOYw69oKmn7gGSzjKIc
         65TvfwQaoovI0xGV9z+z6G9NIiWWV1dCG4QNsRoCgzUJInNpl1+gMCaOFHCa0v+ZtAjF
         rtjQ==
X-Gm-Message-State: APjAAAUEQKIxiijVQwo2oLbyh3HzAJ0Kuo9PMQgvM4Nw9dadsw3EwJHG
        Kyhds7TX0l2DtYvL1OWKMCAnrw==
X-Google-Smtp-Source: APXvYqwFDyPMhX8v9E0rkiIozBRcvsgT5k1HZL0RhzlHO09Ao7gy4hXMq6JF8MlgV+FBDmeJxrHonA==
X-Received: by 2002:a05:600c:210b:: with SMTP id u11mr2546194wml.170.1574248475131;
        Wed, 20 Nov 2019 03:14:35 -0800 (PST)
Received: from bender.baylibre.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id u1sm6061748wmc.3.2019.11.20.03.14.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 03:14:34 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mjourdan@baylibre.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: media: amlogic,vdec: convert to yaml
Date:   Wed, 20 Nov 2019 12:14:27 +0100
Message-Id: <20191120111430.29552-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191120111430.29552-1-narmstrong@baylibre.com>
References: <20191120111430.29552-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic Video Controller over to YAML schemas.

This yaml bindings will then be extended to support new SoCs.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/media/amlogic,gx-vdec.yaml       | 107 ++++++++++++++++++
 .../bindings/media/amlogic,vdec.txt           |  72 ------------
 2 files changed, 107 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/amlogic,vdec.txt

diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
new file mode 100644
index 000000000000..878944867d6e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/amlogic,gx-vdec.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Video Decoder
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+  - Maxime Jourdan <mjourdan@baylibre.com>
+
+description: |
+  The video decoding IP lies within the DOS memory region,
+  except for the hardware bitstream parser that makes use of an undocumented
+  region.
+
+  It makes use of the following blocks:
+  - ESPARSER is a bitstream parser that outputs to a VIFIFO. Further VDEC blocks
+    then feed from this VIFIFO.
+  - VDEC_1 can decode MPEG-1, MPEG-2, MPEG-4 part 2, MJPEG, H.263, H.264, VC-1.
+  - VDEC_HEVC can decode HEVC and VP9.
+
+  Both VDEC_1 and VDEC_HEVC share the "vdec" IRQ and as such cannot run
+  concurrently.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - amlogic,gxbb-vdec # GXBB (S905)
+        - amlogic,gxl-vdec # GXL (S905X, S905D)
+        - amlogic,gxm-vdec # GXM (S912)
+      - const: amlogic,gx-vdec
+
+  interrupts:
+    minItems: 2
+
+  interrupt-names:
+    items:
+      - const: vdec
+      - const: esparser
+
+  reg:
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: dos
+      - const: esparser
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: esparser
+
+  clocks:
+    minItems: 4
+
+  clock-names:
+    items:
+      - const: dos_parser
+      - const: dos
+      - const: vdec_1
+      - const: vdec_hevc
+
+  amlogic,ao-sysctrl:
+    description: should point to the AOBUS sysctrl node
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+  amlogic,canvas:
+    description: should point to a canvas provider node
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - amlogic,ao-sysctrl
+  - amlogic,canvas
+
+examples:
+  - |
+    vdec: video-decoder@c8820000 {
+          compatible = "amlogic,gxl-vdec", "amlogic,gx-vdec";
+          reg = <0xc8820000 0x10000>, <0xc110a580 0xe4>;
+          reg-names = "dos", "esparser";
+          interrupts = <44>, <32>;
+          interrupt-names = "vdec", "esparser";
+          clocks = <&clk_dos_parser> ,<&clk_dos>, <&clk_vdec_1>, <&clk_vdec_hevc>;
+          clock-names = "dos_parser", "dos", "vdec_1", "vdec_hevc";
+          resets = <&reset_parser>;
+          reset-names = "esparser";
+          amlogic,ao-sysctrl = <&sysctrl_AO>;
+          amlogic,canvas = <&canvas>;
+    };
diff --git a/Documentation/devicetree/bindings/media/amlogic,vdec.txt b/Documentation/devicetree/bindings/media/amlogic,vdec.txt
deleted file mode 100644
index 9b6aace86ca7..000000000000
--- a/Documentation/devicetree/bindings/media/amlogic,vdec.txt
+++ /dev/null
@@ -1,72 +0,0 @@
-Amlogic Video Decoder
-================================
-
-The video decoding IP lies within the DOS memory region,
-except for the hardware bitstream parser that makes use of an undocumented
-region.
-
-It makes use of the following blocks:
-
-- ESPARSER is a bitstream parser that outputs to a VIFIFO. Further VDEC blocks
-then feed from this VIFIFO.
-- VDEC_1 can decode MPEG-1, MPEG-2, MPEG-4 part 2, MJPEG, H.263, H.264, VC-1.
-- VDEC_HEVC can decode HEVC and VP9.
-
-Both VDEC_1 and VDEC_HEVC share the "vdec" IRQ and as such cannot run
-concurrently.
-
-Device Tree Bindings:
----------------------
-
-VDEC: Video Decoder
---------------------------
-
-Required properties:
-- compatible: value should be different for each SoC family as :
-	- GXBB (S905) : "amlogic,gxbb-vdec"
-	- GXL (S905X, S905D) : "amlogic,gxl-vdec"
-	- GXM (S912) : "amlogic,gxm-vdec"
-	followed by the common "amlogic,gx-vdec"
-- reg: base address and size of he following memory-mapped regions :
-	- dos
-	- esparser
-- reg-names: should contain the names of the previous memory regions
-- interrupts: should contain the following IRQs:
-	- vdec
-	- esparser
-- interrupt-names: should contain the names of the previous interrupts
-- amlogic,ao-sysctrl: should point to the AOBUS sysctrl node
-- amlogic,canvas: should point to a canvas provider node
-- clocks: should contain the following clocks :
-	- dos_parser
-	- dos
-	- vdec_1
-	- vdec_hevc
-- clock-names: should contain the names of the previous clocks
-- resets: should contain the parser reset
-- reset-names: should be "esparser"
-
-Example:
-
-vdec: video-codec@c8820000 {
-	compatible = "amlogic,gxbb-vdec", "amlogic,gx-vdec";
-	reg = <0x0 0xc8820000 0x0 0x10000>,
-	      <0x0 0xc110a580 0x0 0xe4>;
-	reg-names = "dos", "esparser";
-
-	interrupts = <GIC_SPI 44 IRQ_TYPE_EDGE_RISING>,
-		     <GIC_SPI 32 IRQ_TYPE_EDGE_RISING>;
-	interrupt-names = "vdec", "esparser";
-
-	amlogic,ao-sysctrl = <&sysctrl_AO>;
-	amlogic,canvas = <&canvas>;
-
-	clocks = <&clkc CLKID_DOS_PARSER>,
-		 <&clkc CLKID_DOS>,
-		 <&clkc CLKID_VDEC_1>,
-		 <&clkc CLKID_VDEC_HEVC>;
-	clock-names = "dos_parser", "dos", "vdec_1", "vdec_hevc";
-
-	resets = <&reset RESET_PARSER>;
-	reset-names = "esparser";
-};
-- 
2.22.0

