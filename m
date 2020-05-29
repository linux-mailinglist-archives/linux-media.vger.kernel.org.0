Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5DE1E732B
	for <lists+linux-media@lfdr.de>; Fri, 29 May 2020 05:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391736AbgE2DAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 23:00:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391737AbgE2DAX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 23:00:23 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C10C08C5C7
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 20:00:23 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id w14so852510qkb.0
        for <linux-media@vger.kernel.org>; Thu, 28 May 2020 20:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=cS4si54+VztcokwIEGGa2QcG5KXJXjA3buAtdrcGL0k=;
        b=N9Z6o0DNi0KO2ImFNYIDngM3aZGY0t9BFs0K9ple8Fxk8OPFvyu2Wnu7BTUIFjxhgk
         ezvHP3FIHxlAD/DRr7r1UfbbQi4qK+qyGSg7VWQuBYK0N2Nget9VVDpNAw3upA0ZX8ID
         D4q5/XZaiepxcQCzOB8eQ0uEChm+YJR1RWrjXBYwC1ljbTgb2QR3w4t/JV6MD2oCOXIA
         Clch8Jvj9ygpkDWcf7culwFYUbohjJmZilW+4KUS3QHRWIHXUPQXH9qGWDpnoGoAUype
         fg6ugdky5GJa3vtTuvgSH3Nb2ju87Zl6xtKzGQaAauGhQDR1Drd8JRE1H9aNtJnak0Fn
         cS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cS4si54+VztcokwIEGGa2QcG5KXJXjA3buAtdrcGL0k=;
        b=sDJjx1GgqvgNmgQciOYLigUiQ9SML1V44UYT1VfOMj7ZyFbREAFWzrzCpk91NyFSpu
         XApo5TH+GmxZN8pyXOzN4XLpR3BQhEgrPLEX8WAv9mt/2Uln5XM9avPDiX0QktScWsw1
         rFhWXnEQ6kyepxls+r9m7Z4YQq1zHQKKuUM/cLM69T/gxdXV++eRS7Mh33cq75cxXvkn
         sj9KjV4tRsKrqB7BApXd53q8jLjN6ZV9iYe5/1yXDopvOzk6c4qkMjMpD1VDaj0aTMLn
         3Q1L+f/nM9FiLjXfjPMqwdjtZyZaol1KYUsbCPuiJ8mXelf7PHANEK+dy9v1239iomO7
         FQoQ==
X-Gm-Message-State: AOAM531nh5xjIFABxdcuQJOqOhbz5Q3bG2XcRkfLRE7QiTG93lQSBF9I
        EOLn0rbk/hbuYDaSbUfUAf21WulpnxRc5am2lJLbkPgEtWA3aOopNACLxly1cWsb8WZ5WSeF5+z
        z1clnKL54ce/qyZnxEWaj5R3UBe0izOJx/jjl26P/xKUje8Kp+JjpK3XWmd9XVuuSlAjx8qI=
X-Google-Smtp-Source: ABdhPJy2Pzre33NU/5sexpjt2hQiFOUb+Roc0/4YAU5G5iP/Qzkklom86i16T7JdL69yZ+E7mHq8kkFsVWlZ
X-Received: by 2002:ad4:43cc:: with SMTP id o12mr6373096qvs.62.1590721222710;
 Thu, 28 May 2020 20:00:22 -0700 (PDT)
Date:   Thu, 28 May 2020 23:00:11 -0400
In-Reply-To: <20200529030012.254592-1-jnchase@google.com>
Message-Id: <20200529030012.254592-2-jnchase@google.com>
Mime-Version: 1.0
References: <20200529030012.254592-1-jnchase@google.com>
X-Mailer: git-send-email 2.27.0.rc0.183.gde8f92d652-goog
Subject: [PATCH v3 1/2] dt-bindings: Add ch7322 media i2c device
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
 .../bindings/media/i2c/chrontel,ch7322.yaml   | 65 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  7 ++
 3 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
new file mode 100644
index 000000000000..d5706e08164c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
@@ -0,0 +1,65 @@
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
+description: |-
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
+    description: |-
+      Reference to the GPIO connected to the RESET pin, if any. This
+      pin is active-low.
+
+  standby-gpios:
+    description: |-
+      Reference to the GPIO connected to the OE pin, if any. When low
+      the device will respond to power status requests with "standby"
+      if in auto mode.
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
2.27.0.rc0.183.gde8f92d652-goog

