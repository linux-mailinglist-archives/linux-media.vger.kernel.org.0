Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91DBB1FA068
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 21:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729845AbgFOTiU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 15:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728571AbgFOTiT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 15:38:19 -0400
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72B68C061A0E
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 12:38:19 -0700 (PDT)
Received: by mail-qt1-x84a.google.com with SMTP id d2so14895607qtw.4
        for <linux-media@vger.kernel.org>; Mon, 15 Jun 2020 12:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=w56Z+UNbuOBmJ1RcTqJ2eDdjdQzGc/ulxSsah0cff+s=;
        b=N4qtgJnSnNA7STSsDsKbvde1zu8EYix1g9mo9m+u1UfRPo/39eEpj1snls7UFFVpJX
         BlKED8VDbLoC7z+kwP3aP3YGCPELFalSvuGlYB3/pBluPBF4sRFjQvEF/S2DRF8jX3JT
         /PV8FctCBxI2fEE7g1g6OPV/I3XV4p6Grdzi4YtSgSh/1H8rWy6AySHbCpq5sTbdLNvo
         54mX/sH67NFC9+E7Oe+QH0sCmAotkK9GjSIlpJSZs5AyU+PxqorN7rnLRrwhfQXhYmF7
         v9IYMjVKdbsq1GmhaneWcDqlZr6xkN69EH57eMkFxZPFgL/yfo3XEBewm3nQmeX95knI
         RmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=w56Z+UNbuOBmJ1RcTqJ2eDdjdQzGc/ulxSsah0cff+s=;
        b=G4BwITCCQfsGPyn821XLscuriqaO/2sRIwWoHr/nFBtdi6l/Y1cCsYFJldlNtrm/Qp
         +O8PglVXOZTp2Q1mMGE2fshqLXJ8/LQgirlhibrjcKQaptcOINz+EcjUaPNEkD7rrBXw
         ANc+Iye9f/9pLBpQ135uRcdv2pEKJHae4wrwB6D+SmTxk+uzAnrgLk678PZ8QVuVy7S7
         rQp0m2pUdxm/9ykFLfCRDssI9kNnzDzQYJbvA7nZSmywblQQ9ePOgQPLgs5rsIR8+Mdh
         Wc7O7YZTUuWll+ppLucrL3sZNDFPyu5SZ3ath/QActbQ/Tlx2CHkFsfjmEAk8HNbFh5C
         Vb5Q==
X-Gm-Message-State: AOAM532UI7GZ8UqKwj8onD85eZO/F9hbD8w7DICiMvO7suCwbcR7kgYa
        f7qFBoGc9nE9sXJkWECzF4NObMlCgMA58FiuKL1HCiJlBt0fg4/SEsWj8K1m704tGEpUDBhha7q
        uV1aCCOzKpCh5QkYvZTpuFFIiZbliI1vqupG6JMbqZ1ZVCZl3R76IIOeNk03oDotgKZ/Tzjo=
X-Google-Smtp-Source: ABdhPJyst8oM/mYKFRzYUd17Ix0CRXdNObb8ki7ow9vIkyVwwGexIdWBqelu9iXX6/B79hjApSu5wifLcjaG
X-Received: by 2002:ad4:44e9:: with SMTP id p9mr26232664qvt.180.1592249898601;
 Mon, 15 Jun 2020 12:38:18 -0700 (PDT)
Date:   Mon, 15 Jun 2020 15:38:10 -0400
In-Reply-To: <20200615193811.233737-1-jnchase@google.com>
Message-Id: <20200615193811.233737-2-jnchase@google.com>
Mime-Version: 1.0
References: <20200615193811.233737-1-jnchase@google.com>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: [PATCH v5 1/2] dt-bindings: Add ch7322 media i2c device
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
 MAINTAINERS                                   |  7 ++
 2 files changed, 74 insertions(+)
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 68f21d46614c..c1c17ca17830 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4101,6 +4101,13 @@ F:	drivers/power/supply/cros_usbpd-charger.c
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
2.27.0.290.gba653c62da-goog

