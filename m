Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0843C1C526C
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 12:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728665AbgEEKCB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 06:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728663AbgEEKB7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 5 May 2020 06:01:59 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A68C1C061A41
        for <linux-media@vger.kernel.org>; Tue,  5 May 2020 03:01:57 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id e16so1987332wra.7
        for <linux-media@vger.kernel.org>; Tue, 05 May 2020 03:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eVMq4biPw2C3OxaFJKI0NCtZj+TI0Go4ArcFXFoxJjI=;
        b=XkUAmWOwNRwPTRloJvF6TTHGAr/zGrmJ4/KQ6rs8i0Xd7ReDVquOd7B6Qx3Dtu4a5g
         /KFFdCzv5BuHX71+b3fOODkN1W1mBnS4VXI+qmm4odA/5Diy+MQwV+2mxRy1PvKpsV9e
         QBGNaWVLpJIlaE+6Ak0vfgzBTMfftVYXrFDLUY7rNOu6yCzgmS3FYkwwXNK1TmAU3PsF
         iKxpIju6/HP9yp5cD6QhS/ExJTZ4iqKr6Tj4lno+wuqh0B85v3cisIUeNmkdJjGWIjey
         YMoyNQuyZWqlffTyhD0EHzWPln2yffDYjfUjhYN5kocRyhgN+3JhJ5v0BRGFSVOoaVYF
         +YZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eVMq4biPw2C3OxaFJKI0NCtZj+TI0Go4ArcFXFoxJjI=;
        b=kLiJcDfLC+Uc21QVha9FhAlJY/oqP1yETTwOTW5rZ5jTvnRV8kzPPd/ez9km5rwgBF
         DqSrnA1LzytjHrDuF1pJfU7N/fSu98ezDVXjY49Vos+plUVxK4fsDL/Uh33ynmFHCqsj
         fKLHT6oixGL67YnOxnuTVndtdHveD/hIYn+NyhXoOp4pHSojk1oOV+4Uy9byLJa/yS5e
         gThTgUEdVo7sY1+EnZon1wC8IJ+nLCQZnesiVjrkL/rgNIuzn8jc3A0NUozP1+pNeIPF
         USwZVdd9h4/2EBWm0onqEeBte3jnlo7HC/0HzeW3BTx84qZ4L2ghq2GgrXxf/KFTZ0S1
         obNQ==
X-Gm-Message-State: AGi0PuaGBIJ87JtdJglWs70a2AnudjY6bXtXf8hjeueZYljOCVU06kUb
        TU6bqzuvupEBP1ZGA+n/4mGENA==
X-Google-Smtp-Source: APiQypLQuT9S9pF1oeQzW0rI5/ILHlkfbTubBTKuNRRmcVZb+RqdRlaZFm9JcCoGB85S/qyQkr1zTQ==
X-Received: by 2002:a5d:494a:: with SMTP id r10mr2632648wrs.136.1588672916269;
        Tue, 05 May 2020 03:01:56 -0700 (PDT)
Received: from localhost.localdomain ([37.120.63.158])
        by smtp.gmail.com with ESMTPSA id n6sm2884258wmc.28.2020.05.05.03.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 03:01:55 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Maxime Ripard <maxime@cerno.tech>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>, Ben Kao <ben.kao@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v10 1/3] media: dt-bindings: ov8856: Document YAML bindings
Date:   Tue,  5 May 2020 12:01:29 +0200
Message-Id: <20200505100129.104673-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200505100129.104673-1-robert.foss@linaro.org>
References: <20200505100129.104673-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

This patch adds documentation of device tree in YAML schema for the
OV8856 CMOS image sensor.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---

- Changes since v9:
  * Remove remote-endpoint property
  * Marco: Make port property required again
  * Sakari: Remove Ben as a maintainer
  * Sakari: Replace data-lanes with const items
  * Sakari: Remove clock-lanes property
  * Sakari & Rob Herring: Change type of link-frequency
    work around dt-schema bug

- Changes since v8:
  * Maxime: Added r-b

- Changes since v7:
  * Marco: Make 'port' property optional
  * Maxime & Sakari: Add 'link-frequencies' property to dt binding
  * robher: Improve description for 'port' property

- Changes since v6:
  * Marco: remove qcom specifics from DT example
   
- Changes since v5:
  * Add assigned-clocks and assigned-clock-rates
  * robher: dt-schema errors

- Changes since v4:
  * Fabio: Change reset-gpio to GPIO_ACTIVE_LOW, explain in description
  * Add clock-lanes property to example
  * robher: Fix syntax error in devicetree example

- Changes since v3:
  * robher: Fix syntax error
  * robher: Removed maxItems
  * Fixes yaml 'make dt-binding-check' errors

- Changes since v2:

- Changes since v1:
  Fixes comments from Sakari, Tomasz
  * Add clock-frequency and link-frequencies in DT

 .../devicetree/bindings/media/i2c/ov8856.yaml | 142 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 143 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
new file mode 100644
index 000000000000..d6af685ad3ca
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
@@ -0,0 +1,142 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2019 MediaTek Inc.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Omnivision OV8856 CMOS Sensor Device Tree Bindings
+
+maintainers:
+  - Dongchun Zhu <dongchun.zhu@mediatek.com>
+
+description: |-
+  The Omnivision OV8856 is a high performance, 1/4-inch, 8 megapixel, CMOS
+  image sensor that delivers 3264x2448 at 30fps. It provides full-frame,
+  sub-sampled, and windowed 10-bit MIPI images in various formats via the
+  Serial Camera Control Bus (SCCB) interface. This chip is programmable
+  through I2C and two-wire SCCB. The sensor output is available via CSI-2
+  serial data output (up to 4-lane).
+
+properties:
+  compatible:
+    const: ovti,ov8856
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    description:
+      Input clock for the sensor.
+    items:
+      - const: xvclk
+
+  clock-frequency:
+    description:
+      Frequency of the xvclk clock in Hertz.
+
+  dovdd-supply:
+    description:
+      Definition of the regulator used as interface power supply.
+
+  avdd-supply:
+    description:
+      Definition of the regulator used as analog power supply.
+
+  dvdd-supply:
+    description:
+      Definition of the regulator used as digital power supply.
+
+  reset-gpios:
+    description:
+      The phandle and specifier for the GPIO that controls sensor reset.
+      This corresponds to the hardware pin XSHUTDOWN which is physically
+      active low.
+
+  port:
+    type: object
+    additionalProperties: false
+    description:
+      A node containing an output port node with an endpoint definition
+      as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          data-lanes:
+            description: |-
+              The driver only supports four-lane operation.
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+          link-frequencies:
+            allOf:
+              - $ref: /schemas/types.yaml#/definitions/uint64-array
+            description:
+              Allowed data bus frequencies. 360000000, 180000000 Hz or both
+              are supported by the driver.
+
+
+        required:
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-frequency
+  - dovdd-supply
+  - avdd-supply
+  - dvdd-supply
+  - reset-gpios
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        ov8856: camera@10 {
+            compatible = "ovti,ov8856";
+            reg = <0x10>;
+
+            reset-gpios = <&pio 111 GPIO_ACTIVE_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&clk_24m_cam>;
+
+            clocks = <&cam_osc>;
+            clock-names = "xvclk";
+            clock-frequency = <19200000>;
+
+            avdd-supply = <&mt6358_vcama2_reg>;
+            dvdd-supply = <&mt6358_vcamd_reg>;
+            dovdd-supply = <&mt6358_vcamio_reg>;
+
+            port {
+                wcam_out: endpoint {
+                    remote-endpoint = <&mipi_in_wcam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <360000000>;
+                };
+            };
+        };
+    };
+...
\ No newline at end of file
diff --git a/MAINTAINERS b/MAINTAINERS
index 26f281d9f32a..84b262afd13d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12489,6 +12489,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov8856.c
+F:	Documentation/devicetree/bindings/media/i2c/ov8856.yaml
 
 OMNIVISION OV9640 SENSOR DRIVER
 M:	Petr Cvek <petrcvekcz@gmail.com>
-- 
2.25.1

