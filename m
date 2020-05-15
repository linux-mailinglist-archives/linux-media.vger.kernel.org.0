Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F192D1D43C6
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 04:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgEOCwK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 22:52:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728209AbgEOCwK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 22:52:10 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18BA2C05BD09
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 19:52:10 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id d7so1000027ybp.12
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 19:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=38bYWhCOkOeEwtzhhWUQTEUNGt2Oi+/5Cl/v2bJWXjM=;
        b=lp4phSdB2YahPDSlqkcwNtOZyLiFe2s5Lqd9USZReqZDQyIerCe1J6nxAqFL+Z660T
         w5m49M0j5QEoCC1W2t7YkACihGmgZy1rZTOq2HzNaukEyXLBChPvRtgkUactTDNy1J6q
         biui8zY8FQNoam5NEXgd2GybH2SD3JOy1640hI9tegxRbfUGSTxKdk7HmF0rSCHq01VB
         XwRn9kvxFuU8B6HyV+OT6H34wr8igvLS+NBNhIYcsRCV0IjSXKP8GYU4g3awem5XxeTW
         AUKI4pTdrpxqjOYrNPcytDqUp152r0WN9abctEkeQw5llu6R4D6kiouNkwtsoPWJSh77
         xikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=38bYWhCOkOeEwtzhhWUQTEUNGt2Oi+/5Cl/v2bJWXjM=;
        b=iTUS1cTjJtEH8Rgj3exVZ+czYVjWqDIrj3vllPnMmKpilCOtpyoKlTaF3NJ7HmdJgs
         iDqKpHyzupWiOVgQfzHPtAQr8rwOcKxF0aiPjDpiVVvA1ZkwH4l6+5lkKwCoovQSQCpz
         mip3ZvPmlRkIHwkjTAkkAvx0hAOTzI3yvchkHgtdCk7Gi401cqagWrQTJjHbBVDoBO03
         uNl+FsPVV4VMWnRxnlKJmT0O3VeZiJQATXgTKl1SrJFll6NmUHfIsYuxnkYiu4pTsbq2
         FTp/0LXb0guI75uWRig7iXBYvYLPX+KcN/7qGvj2huqmc7E32bOEdJHgwdnsznkjhg2b
         iFTQ==
X-Gm-Message-State: AOAM530t+huXJxbhpIIuVdWisCq3PK0LsVOY1mMf3wN/Nbtvb3J/4l3V
        d/OGupq/xaA1u8VmHBd/GaY+/rj7gVK2qOjGOdk06pzVTl8UGVayZTZYb/wEywKkf71rnQoT0E2
        k8/xW9eFwC/vcpSK8SMJDU5dbnmfLO0HTgArehFe0i50zp1Riun4uh1xcpDVytWbOgo+Jy8g=
X-Google-Smtp-Source: ABdhPJwXuEYfmEE9ThCxil84WZ0XokRvQ0srjhgnvikoIqzgArlfp9NJPw1OPMcuYFWiBN2/Mvz29M8kD2Nd
X-Received: by 2002:a25:6b0e:: with SMTP id g14mr1958483ybc.25.1589511129163;
 Thu, 14 May 2020 19:52:09 -0700 (PDT)
Date:   Thu, 14 May 2020 22:51:58 -0400
In-Reply-To: <20200515025159.101081-1-jnchase@google.com>
Message-Id: <20200515025159.101081-2-jnchase@google.com>
Mime-Version: 1.0
References: <20200515025159.101081-1-jnchase@google.com>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
Subject: [PATCH v2 1/2] dt-bindings: Add ch7322 media i2c device
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
index 000000000000..d78e355e411a
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/i2c/ch7322.yaml#"
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
2.26.2.761.g0e0b3e54be-goog

