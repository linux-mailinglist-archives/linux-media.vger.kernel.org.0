Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 161A7DEBAC
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 14:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbfJUMLi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 08:11:38 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39798 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727725AbfJUMLh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 08:11:37 -0400
Received: by mail-wm1-f67.google.com with SMTP id r141so2950449wme.4
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2019 05:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1nWQn9JHkIyWFzO1YTIzRNr08Bu0P25VLya5djrPvZU=;
        b=O0RqyHH9x9W9yuRreDzZfFvFCw2aKlpuUJgDs6q19bDn3KmMxUrSbA9wuy+igBdgoV
         AL4qmZzd5gwAvvAVfKCLwxaTDQLMIuYJvNr/J2a4J1UBvJX1HTwibetWsV7OTv8XIGN5
         tN8U06/qtKqaGeOT3y67gZpufPwEuyYXrq0q3LCD1ipoQRL1gW/QXPjNVNRA8KqgZel5
         nzRVSGGB/aL2tawRPdzwft1pbqsP6ZoRVJsr8fMUqxHsTwoSZBJc6VUkllpWh3XFoVqi
         IdYff/AvvJJrvYMMnLWsHpi3nUo2dzpv0Fx2a4xuxmbItbZZBMX593IO2makCLOpruqZ
         +xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1nWQn9JHkIyWFzO1YTIzRNr08Bu0P25VLya5djrPvZU=;
        b=Eikn/Vie8J3JMWJEtv6RjEOf8hqIdMuLeYmdrhKRlLhfZAj8GRC9eWN6XYyXM96tZm
         hseHtEfgQdOskx5NuyfgHNU11eerh75Y3fKCPZDyom2/t8c3pPtkwvwWF+Iv6SoIY8rt
         +Cte7JRM6w2HA9+E64lgJAMhM7J1PlKsXhJlXvqYM6hWM8cXYfrUVws+v7PFXLWp/wA/
         bK/utLrCQRIIABluxKizMu3r/4xrw3xMSqsp1xozElsCqhPy9NBOMlnVq5aohdSvtMj9
         AsS1LLuY5KBvkpl59s1TnucMIgN43ucOrd8ORUFK9biYq97aMmLijgWAgCE5rYjwTrkA
         BnKw==
X-Gm-Message-State: APjAAAWusB2YsDxt/3SMuTbx2Kz/SeAZG5+W4EFUxtRmyasBM9mXtPCW
        aQRCeI/YTs34+nuJUO8b4MK0hw==
X-Google-Smtp-Source: APXvYqzsTud6HllbIVok9Dz0padLasdwgqohMnlleYLHymDpbxyY63+6giaeoHjz0duHKZWc1tYEvA==
X-Received: by 2002:a7b:c05a:: with SMTP id u26mr18887164wmc.128.1571659894688;
        Mon, 21 Oct 2019 05:11:34 -0700 (PDT)
Received: from localhost.localdomain (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 37sm21660508wrc.96.2019.10.21.05.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2019 05:11:34 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     robh+dt@kernel.org
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: media: meson-ao-cec: convert to yaml
Date:   Mon, 21 Oct 2019 14:11:31 +0200
Message-Id: <20191021121131.25017-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that we have the DT validation in place, let's convert the device tree
bindings for the Amlogic AO-CEC controller over to a YAML schemas.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../media/amlogic,meson-gx-ao-cec.yaml        | 91 +++++++++++++++++++
 .../bindings/media/meson-ao-cec.txt           | 37 --------
 2 files changed, 91 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/meson-ao-cec.txt

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
new file mode 100644
index 000000000000..41197578f19a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/amlogic,meson-gx-ao-cec.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson AO-CEC Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
+  to handle communication between HDMI connected devices over the CEC bus.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-gx-ao-cec # GXBB, GXL, GXM, G12A and SM1 AO_CEC_A module
+      - amlogic,meson-g12a-ao-cec # G12A AO_CEC_B module
+      - amlogic,meson-sm1-ao-cec # SM1 AO_CEC_B module
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  hdmi-phandle:
+    description: phandle to the HDMI controller
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson-gx-ao-cec
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: AO-CEC clock
+
+        clock-names:
+          maxItems: 1
+          items:
+            - const: core
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - amlogic,meson-g12a-ao-cec
+              - amlogic,meson-sm1-ao-cec
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: AO-CEC clock generator source
+
+        clock-names:
+          maxItems: 1
+          items:
+            - const: oscin
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - hdmi-phandle
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    cec_AO: cec@100 {
+        compatible = "amlogic,meson-gx-ao-cec";
+        reg = <0x0 0x00100 0x0 0x14>;
+        interrupts = <199>;
+        clocks = <&clkc_cec>;
+        clock-names = "core";
+        hdmi-phandle = <&hdmi_tx>;
+    };
+
diff --git a/Documentation/devicetree/bindings/media/meson-ao-cec.txt b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
deleted file mode 100644
index ad92ee41c0dd..000000000000
--- a/Documentation/devicetree/bindings/media/meson-ao-cec.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-* Amlogic Meson AO-CEC driver
-
-The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
-to handle communication between HDMI connected devices over the CEC bus.
-
-Required properties:
-  - compatible : value should be following depending on the SoC :
-	For GXBB, GXL, GXM, G12A and SM1 (AO_CEC_A module) :
-	"amlogic,meson-gx-ao-cec"
-	For G12A (AO_CEC_B module) :
-	"amlogic,meson-g12a-ao-cec"
-	For SM1 (AO_CEC_B module) :
-	"amlogic,meson-sm1-ao-cec"
-
-  - reg : Physical base address of the IP registers and length of memory
-	  mapped region.
-
-  - interrupts : AO-CEC interrupt number to the CPU.
-  - clocks : from common clock binding: handle to AO-CEC clock.
-  - clock-names : from common clock binding, must contain :
-		For GXBB, GXL, GXM, G12A and SM1 (AO_CEC_A module) :
-		- "core"
-		For G12A, SM1 (AO_CEC_B module) :
-		- "oscin"
-		corresponding to entry in the clocks property.
-  - hdmi-phandle: phandle to the HDMI controller
-
-Example:
-
-cec_AO: cec@100 {
-	compatible = "amlogic,meson-gx-ao-cec";
-	reg = <0x0 0x00100 0x0 0x14>;
-	interrupts = <GIC_SPI 199 IRQ_TYPE_EDGE_RISING>;
-	clocks = <&clkc_AO CLKID_AO_CEC_32K>;
-	clock-names = "core";
-	hdmi-phandle = <&hdmi_tx>;
-};
-- 
2.22.0

