Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8C461A5FCE
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2020 20:30:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727580AbgDLSaJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Apr 2020 14:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:43936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727566AbgDLSaI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Apr 2020 14:30:08 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54314C0086C2;
        Sun, 12 Apr 2020 11:20:27 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id r17so4995808lff.2;
        Sun, 12 Apr 2020 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s7PyP7wM+hSmqY+Nl4dhHB6/+lR7BTTva1Z1R03Oe1A=;
        b=O3gdcKnk6nH6vW/0o9T/tib9LsIjIxtq7DG8LrEag2qjwgCdtswUsLnNipTw+jT4mP
         e6cbPPRL2CNlRKZQh2uOMyQo8DyoWKT/QaNU20nlUtHfdcRUNBK4L6HBlspqSom+34R3
         j5TopCMaCD4NhkoQu4G+WM7fTFuXOdCPJ4KUsfEo9ysytuqSgn7sMNY/2udkVmdpe+Sq
         E6lHiaVugK/D0cp8oht8TJynVaMa1uDkGVpjyHYgwvMMhfaYM0BhWCdi9naledajb1/J
         HXbSROWbXH982peXfJctgLkwg1M88T2iLbE70T8ApVkffnPJ8+xumdNgXwejrBbJmrne
         2Cog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=s7PyP7wM+hSmqY+Nl4dhHB6/+lR7BTTva1Z1R03Oe1A=;
        b=WuCqlVAHLVb9xjw+AnScpKBk8gbwKqUIWZjww3Jxc1tHtd1K/zvkjkBsrQAXnDRRih
         KTaFTv1XTFGWsmLP+QHoKMJA7o/67L38DaNpOY4ILyBUfcdcJb00msU4XEKJHkM7kwju
         46lzJ78RuaRCd9w9nUAqHSU996/ZETHuqFW4yUSE9lbUXl9xiVnT0WkBbDEO5LhxKPrv
         x6OXPI2bDpzWe4V0/ov+eyMlN7Qew9G28eNQVlk3TMeRpjd1JSCWJL/lvZ1w0c+xSV2u
         TfBjM/9LpcT/dNQ0bpPkdgpl06SQTdazPIqClA1WT/E0fHT1AffEPJONamJuRt0jzcoQ
         tWhw==
X-Gm-Message-State: AGi0PuZqDZ2qWonX5J66+PFTgCxjX22Op4WDX+r5ueFqZOolByu2e7hz
        UtDRqDRnVsLPN/Sti1WJ1Ji2sdznhN8=
X-Google-Smtp-Source: APiQypJSXZxot3B6tsVUM4YKg3cHraXKHQBplcVR54rLr6Cr3IwsfjmqDogPJQNAHRKGcEqAoTxaPg==
X-Received: by 2002:a05:6512:10c9:: with SMTP id k9mr8379271lfg.183.1586715625482;
        Sun, 12 Apr 2020 11:20:25 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
        by smtp.gmail.com with ESMTPSA id m13sm6434394lfk.12.2020.04.12.11.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2020 11:20:25 -0700 (PDT)
From:   Sam Ravnborg <sam@ravnborg.org>
To:     devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        dri-devel@lists.freedesktop.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 4/4] dt-bindings: display: add port support to atmel lcdc
Date:   Sun, 12 Apr 2020 20:20:12 +0200
Message-Id: <20200412182012.27515-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200412182012.27515-1-sam@ravnborg.org>
References: <20200412182012.27515-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update the Atmel LCDC binding to include:
- pwm. Used for backlight
- endpoints using port node
  Used for handle to panel
- Added wiring property that is used to describe
  the wiring between the LCDC and the panel

Existing properties that should not be used in new
bindings are deprecated.

Updated example to include the updated way to specify panel etc.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 .../bindings/display/atmel/lcdc.yaml          | 94 ++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/atmel/lcdc.yaml b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
index 7dcb9a4d5902..b5c2628f7805 100644
--- a/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
+++ b/Documentation/devicetree/bindings/display/atmel/lcdc.yaml
@@ -28,6 +28,7 @@ properties:
 
   "#address-cells":
     const: 1
+
   "#size-cells":
     const: 0
 
@@ -43,13 +44,84 @@ properties:
   lcd-supply:
     description: Regulator for LCD supply voltage.
 
+  "#pwm-cells":
+    description:
+      This PWM chip use the default 3 cells bindings
+      defined in ../../pwm/pwm.yaml.
+    const: 3
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    maxItems: 2
+    items:
+      - const: lcdc_clk
+      - const: hclk
+
+  port@0:
+    type: object
+    description: Endpoints of the display controller
+
+    properties:
+
+      reg:
+        const: 0
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+      endpoint@0:
+        type: object
+        description: endpoint node that include phandle to panel
+
+        properties:
+
+          reg:
+            const: 0
+
+          wiring:
+            enum:
+              - straight
+              - red-blue-reversed
+            description: |
+              The LCDC is based on a blue-green-red configuration but to adapt
+              to SW only supporting red-green-blue the data lines for red and blue
+              may be reversed.
+              See details in: http://ww1.microchip.com/downloads/en/AppNotes/doc6300.pdf
+              "straight" - default value. Data lines are not reversed, uses BGR
+              "red-blue-reversed" - red and green are reversed, uses RGB
+
+          remote-endpoint:
+            $ref: /schemas/types.yaml#/definitions/phandle
+            description:
+              phandle to the panel node
+
+        required:
+          - reg
+          - remote-endpoint
+
+        additionalProperties: false
+
+    required:
+      - "#address-cells"
+      - "#size-cells"
+      - reg
+
+    additionalProperties: false
+
   display:
     $ref: /schemas/types.yaml#/definitions/phandle
+    deprecated: true
     description: phandle to display node
 
 patternProperties:
   "^display[0-9]$":
     type: object
+    deprecated: true
     description: |
       Display node is required to initialize the lcd panel.
       This should be in the board dts
@@ -107,12 +179,32 @@ required:
 
 examples:
   - |
+    #include <dt-bindings/clock/at91.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
     fb {
         compatible = "atmel,at91sam9263-lcdc";
         reg = <0x00700000 0x1000>;
-        interrupts = <23 3 0>;
+        interrupts = <26 IRQ_TYPE_LEVEL_HIGH 3>;
+        clocks = <&pmc PMC_TYPE_PERIPHERAL 26>, <&pmc PMC_TYPE_PERIPHERAL 26>;
+        clock-names = "lcdc_clk", "hclk";
+
+        /* pwm for backlight */
+        #pwm-cells = <3>;
+
         #address-cells = <1>;
         #size-cells = <0>;
+
+        port@0 {
+            reg = <0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+            endpoint@0 {
+                reg = <0>;
+                wiring = "red-blue-reversed";
+                remote-endpoint = <&panel_input>;
+            };
+        };
     };
 
   - |
-- 
2.20.1

