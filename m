Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0031EC261
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2020 21:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgFBTJ1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jun 2020 15:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgFBTJ1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Jun 2020 15:09:27 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D355CC08C5C1
        for <linux-media@vger.kernel.org>; Tue,  2 Jun 2020 12:09:26 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id f16so6836712ybp.5
        for <linux-media@vger.kernel.org>; Tue, 02 Jun 2020 12:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=xTPMZBuYbSiUPEeoH1NWNT8jwWxp891HtegclL1G6P4=;
        b=GmA6aIRLSBu5QYE97Sf64vPrJm5BxUT3U0OlL6+qFr2S3dh1doD1D4Pnstao6+FXTZ
         X1FJxwjcs8RpYd7jJARoihL18u/cJmXTAU4k8gqSAgAxxMQpAkVd3lH4JpMBCyAxusv1
         VISsDkJwEkv70QLsbWdBsaMmWqv9e4MZc+ZAejtxio+LDmyY+8vZ98MEPIqx2t3i4UIV
         3kNB0L36x8/jlMh8iO6wjVZkjnPMHzxyoJsA3Ms9bzv2KhEtJ7soU/cn6xiyM3TtKyhE
         Ugg4MSLOYnspfX3P3Txrr40o5h+BnFAs5uFEogCcHnoq6n615jiZdUhdQ/eBNuS9TjDT
         aDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=xTPMZBuYbSiUPEeoH1NWNT8jwWxp891HtegclL1G6P4=;
        b=qPjAX+XfO55t7q+SFO7Mi1dkKAMijG6NIhmQnqJrb8DQgQe8fq8A1/2nuYSRcdD9ey
         E3+6K0BTgsxYMukHCndgF7ZkEN74T/jpWG0ZElUbPQMuOCSOr/sqYEDAIc2j3TAF1gCs
         DzzL327IGXXJ6cmoQCCw8HuMa+CxTByqdHRHnq//uFTXaw6zmja98EaQYFKiPntYGLir
         jUWWpDg1Uo8j/D/w/kcGUry1dO8URs83IcVa+zZLaedpIA23HbWGzjanqYktskd/nZl+
         TFY/tOicUpO/v/jYj15LhJFKhWqK9/JeA2nq9rCSMTSUFmBo3FRxmOtes/245J3P5G30
         PU7w==
X-Gm-Message-State: AOAM531Y5aYieJKXZDoQQLskXQx9VIkytgxy0xDc6A6nIOpOnsIvrxq0
        Nw5NHqAD1mmoB8jUKtItCSwgTN22GvV2jgC8wRZsake1QiZ23weP1IXkTEa1Pav3kRESVYfLDh3
        7nHcDPwsQqBsBSvBTGw2n26N2oMi8y3GtkEVhW3oP5KsTcjbBILEEI4312MYh1l36K4MWo2A=
X-Google-Smtp-Source: ABdhPJwvzoFgioxOLvonF9YZlQ1WFlE/dxkBSaenw9IWtPb0ySaHo6jPHSUrMMFWvBU713ncToBTFmGCO1Up
X-Received: by 2002:a25:c4c2:: with SMTP id u185mr44511902ybf.79.1591124965998;
 Tue, 02 Jun 2020 12:09:25 -0700 (PDT)
Date:   Tue,  2 Jun 2020 15:09:13 -0400
In-Reply-To: <20200602190914.218541-1-jnchase@google.com>
Message-Id: <20200602190914.218541-2-jnchase@google.com>
Mime-Version: 1.0
References: <20200602190914.218541-1-jnchase@google.com>
X-Mailer: git-send-email 2.27.0.rc2.251.g90737beb825-goog
Subject: [PATCH v4 1/2] dt-bindings: Add ch7322 media i2c device
From:   Jeff Chase <jnchase@google.com>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, robh+dt@kernel.org,
        devicetree@vger.kernel.org, Jeff Chase <jnchase@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The ch7322 is a Chrontel CEC controller.

Signed-off-by: Jeff Chase <jnchase@google.com>
---
 .../bindings/media/i2c/chrontel,ch7322.yaml   | 67 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  7 ++
 3 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
new file mode 100644
index 000000000000..daa2869377c5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/i2c/chrontel,ch7322.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Chrontel HDMI-CEC Controller
+
+maintainers:
+  - Jeff Chase <jnchase@google.com>
+
+description:
+  The Chrontel CH7322 is a discrete HDMI-CEC controller. It is
+  programmable through I2C and drives a single CEC line.
+
+properties:
+  compatible:
+    const: chrontel,ch7322
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      Reference to the GPIO connected to the RESET pin, if any. This
+      pin is active-low.
+    maxItems: 1
+
+  standby-gpios:
+    description:
+      Reference to the GPIO connected to the OE pin, if any. When low
+      the device will respond to power status requests with "standby"
+      if in auto mode.
+    maxItems: 1
+
+  # see ../cec.txt
+  hdmi-phandle:
+    description: phandle to the HDMI controller
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      ch7322@75 {
+        compatible = "chrontel,ch7322";
+        reg = <0x75>;
+        interrupts = <47 IRQ_TYPE_EDGE_RISING>;
+        standby-gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
+        reset-gpios = <&gpio 15 GPIO_ACTIVE_LOW>;
+        hdmi-phandle = <&hdmi>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d3891386d671..7794ffccd325 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -187,6 +187,8 @@ patternProperties:
     description: ChipOne
   "^chipspark,.*":
     description: ChipSPARK
+  "^chrontel,.*":
+    description: Chrontel, Inc.
   "^chrp,.*":
     description: Common Hardware Reference Platform
   "^chunghwa,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index d633a131dcd7..34c6d30e61e5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4047,6 +4047,13 @@ F:	drivers/power/supply/cros_usbpd-charger.c
 N:	cros_ec
 N:	cros-ec
 
+CHRONTEL CH7322 CEC DRIVER
+M:	Jeff Chase <jnchase@google.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/chontel,ch7322.yaml
+
 CIRRUS LOGIC AUDIO CODEC DRIVERS
 M:	James Schulman <james.schulman@cirrus.com>
 M:	David Rhodes <david.rhodes@cirrus.com>
-- 
2.27.0.rc2.251.g90737beb825-goog

