Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 857FB184582
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2020 12:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgCMLEX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Mar 2020 07:04:23 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:33371 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgCMLEM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Mar 2020 07:04:12 -0400
Received: by mail-wr1-f68.google.com with SMTP id a25so11552931wrd.0
        for <linux-media@vger.kernel.org>; Fri, 13 Mar 2020 04:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ncw+eyWjRsQTeyJkRY9efqnjsTYXp1B+wwJAeTaYAUY=;
        b=o7+OtpJ4HguHvdXj6h/irlmhIyldJOZUxqelnNp1uJAiYtI0Ye/qKEhlAJSp5BT1/B
         g43HgPrOPFnot+78wWNNYRZEc0EuOxsOqVIXa7h4HRTSWvKcE8R7eBsdsW4+CPHqozSn
         hgfOpvGOZfScg4cuaOcJ04DB9E/PQX31nOumHbEprYeJp4rVEpOfrzhINOrQtuMzKC7h
         b/NozewPPpE2p2O43oW055R2XztYhoXJU0QhOilo5YppbcU4o/9brcU91NJlqzUaf/Ew
         XJ5D82lDLYQXm+TFlAYunv2VJwInnlKQTWhNYxINQZ0MgowfBPfTQsO/1ITq/cRmng1X
         JI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ncw+eyWjRsQTeyJkRY9efqnjsTYXp1B+wwJAeTaYAUY=;
        b=OExvEp2lpvhd501VU5SrlAVywoJ34mTtGCqzMQqklSDot5+YMqSBRO55vJbXh+7jRA
         g34/3ULYeS7xW0PdecLq1nYr5QfBsFCprw/qqvByJrPlZAJk9SBRGWUobp2ZmejIzwzs
         DqD+9c1BXNTu36IGU/hdATJZTLaynwKqQ4chhYnH6dUfwcxdTva7QyCdnOWBYlZeqFs4
         3x/6CQoLWnlHIFmoDXaZhjZGmW9tR8eAqy24DxnmMvw7HnYGhjk9KoPEO8fstljJLm2+
         XgwNEwLGYSbMVblCVwjwEB/JAKXBtC72RBV9ptOPQVPDxpB6q0SRZYR9AKZ718u6MU9d
         vRng==
X-Gm-Message-State: ANhLgQ0HAmpkz2ggkmxcXL6rBkRqfDKRDqw7lsJHCK0zZX8lisHDqvc2
        IoMGo+48wM8bWvdHEXZ1lSpRmA==
X-Google-Smtp-Source: ADFU+vv07bRZwHFbQJV+QSjjmMIWLyvDlox4QCBogfbwZ9y18BLQBMA3c1lpCF+57gtUxJY4G2IWVQ==
X-Received: by 2002:adf:9d8d:: with SMTP id p13mr12131719wre.360.1584097449459;
        Fri, 13 Mar 2020 04:04:09 -0700 (PDT)
Received: from xps7590.local ([2a02:2450:102f:13b8:c814:5be4:577e:3bd5])
        by smtp.gmail.com with ESMTPSA id r23sm23578052wrr.93.2020.03.13.04.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 04:04:08 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Fabio Estevam <festevam@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [v2 1/3] media: dt-bindings: ov8856: Document YAML bindings
Date:   Fri, 13 Mar 2020 12:03:48 +0100
Message-Id: <20200313110350.10864-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200313110350.10864-1-robert.foss@linaro.org>
References: <20200313110350.10864-1-robert.foss@linaro.org>
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
---

- Changes since v4:
  * Fabio: Change reset-gpio to GPIO_ACTIVE_LOW, explain in description
  * Add clock-lanes property to example
  * robher: Fix syntax error in devicetree example

- Changes since v3:
  * robher: Fix syntax error
  * robher: Removed maxItems
  * Fixes yaml 'make dt-binding-check' errors

- Changes since v2:
  Fixes comments from from Andy, Tomasz, Sakari, Rob.
  * Convert text documentation to YAML schema.

- Changes since v1:
  Fixes comments from Sakari, Tomasz
  * Add clock-frequency and link-frequencies in DT

 .../devicetree/bindings/media/i2c/ov8856.yaml | 133 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ov8856.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
new file mode 100644
index 000000000000..f5cb9add9277
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ov8856.yaml
@@ -0,0 +1,133 @@
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
+  - Ben Kao <ben.kao@intel.com>
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
+      A node containing input and output port nodes with endpoint definitions
+      as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          clock-lanes:
+            maxItems: 1
+
+          data-lanes:
+            maxItems: 1
+
+          remote-endpoint: true
+
+        required:
+          - clock-lanes
+          - data-lanes
+          - remote-endpoint
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
+    #include <dt-bindings/clock/qcom,camcc-sdm845.h>
+
+    ov8856: camera-sensor@10 {
+        compatible = "ovti,ov8856";
+        reg = <0x10>;
+        reset-gpios = <&pio 111 GPIO_ACTIVE_LOW>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&clk_24m_cam>;
+
+        clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
+        clock-names = "xvclk";
+        clock-frequency = <19200000>;
+
+        avdd-supply = <&mt6358_vcama2_reg>;
+        dvdd-supply = <&mt6358_vcamd_reg>;
+        dovdd-supply = <&mt6358_vcamio_reg>;
+
+        port {
+            wcam_out: endpoint {
+                remote-endpoint = <&mipi_in_wcam>;
+                clock-lanes = <0>;
+                data-lanes = <1 2 3 4>;
+                link-frequencies = /bits/ 64 <360000000 180000000>;
+            };
+        };
+    };
+
+...
\ No newline at end of file
diff --git a/MAINTAINERS b/MAINTAINERS
index a6fbdf354d34..0f99e863978a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12355,6 +12355,7 @@ L:	linux-media@vger.kernel.org
 T:	git git://linuxtv.org/media_tree.git
 S:	Maintained
 F:	drivers/media/i2c/ov8856.c
+F:	Documentation/devicetree/bindings/media/i2c/ov8856.yaml
 
 OMNIVISION OV9650 SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
-- 
2.20.1

