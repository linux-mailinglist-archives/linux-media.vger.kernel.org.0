Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14DED1143A0
	for <lists+linux-media@lfdr.de>; Thu,  5 Dec 2019 16:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729743AbfLEPeQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Dec 2019 10:34:16 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52492 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729698AbfLEPeQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Dec 2019 10:34:16 -0500
Received: by mail-wm1-f65.google.com with SMTP id p9so4332670wmc.2
        for <linux-media@vger.kernel.org>; Thu, 05 Dec 2019 07:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9UAzxsWf4W83oyvFQkH2hZ4vYVx6AktY/uiCE2SmLc4=;
        b=kK5tYBPengXlEp3cXfE31aL8ioJ/Jeb3OtQZRhtxXwubJE9Nd2KtnBcbF/Zk2nmSgN
         nCFQhFu+ptx1ASM6Tncq2RZ0Wf7Li76CdM3/4Aw1dQNwP3w/XBai54MKJfKTN04mor1y
         BoUpLTZFh/stv9NxxbEVM8zVadVW4sM1hMQ4JytGPWU6L1blZFORKQtY+ghZzFH/DzJd
         EDHZjbwYYiH/QSuFJyZky3Sc4YcMTPqR7a6hmUk1tY3jiIm1e0zerfmNPGhD4qAUtbtG
         RxPMxZEIUm/rkkYxZc1eESPgRziIPE3/BuKYCDROguRrpEd/o5+/ZCqqXp8dsFEtaGz+
         Cv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9UAzxsWf4W83oyvFQkH2hZ4vYVx6AktY/uiCE2SmLc4=;
        b=QEGDwcuiqL+zxeTVBVKzikMgupO+J/S5ifW17ZsC1UmocG1zCh2FFNPzXYNNrslhaJ
         iFdU3m6vOO78nyJe64vCxHko8sAvzPMgHB600BIuOXejnRKVACA5u4W2tIp0Q5sUg43d
         QBF4tMtsn0fNJjfD7Nlc0t19EgRE3QDBvupIC5d+0YIaLAJ0nlKNzF73QY0B/LCNhgjc
         LN7eSFCcNjeTuXdjIA8kKk5pkRj/JBr5DP1wAlrAsOVCWTGtOHwysyWDk4Bf+FqOZJ1A
         kaaCI6ncjZEdQKJuXZywq8QDEsA/jfRFOzeJV9kV4AeqbopY6CwkOsb+NgVdgWn/A/Mm
         FzmA==
X-Gm-Message-State: APjAAAWQDBd0LNdCLMCpXDxm8kicCdu+RNR95JAThuRZz2v3SuTsj/EC
        Z83K1K36n/Tq4o1GNb8PLVnx/A==
X-Google-Smtp-Source: APXvYqytDDgpTYAFLUeWNzloXYLz3bfneqtytMmrNgelFHFkE8a3YG2PQkv47tfqpbhGNV2Q/AK2xg==
X-Received: by 2002:a1c:4f:: with SMTP id 76mr3234343wma.69.1575560053556;
        Thu, 05 Dec 2019 07:34:13 -0800 (PST)
Received: from bender.baylibre.local (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
        by smtp.gmail.com with ESMTPSA id u26sm191894wmj.9.2019.12.05.07.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 07:34:13 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     mjourdan@baylibre.com, devicetree@vger.kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: media: amlogic,vdec: convert to yaml
Date:   Thu,  5 Dec 2019 16:34:05 +0100
Message-Id: <20191205153408.26500-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191205153408.26500-1-narmstrong@baylibre.com>
References: <20191205153408.26500-1-narmstrong@baylibre.com>
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
Reviewed-by: Rob Herring <robh@kernel.org>
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

