Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEE7A4D4831
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 14:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242503AbiCJNiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 08:38:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242538AbiCJNh6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 08:37:58 -0500
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2655214EF73
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 05:36:57 -0800 (PST)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22AARWpi023835
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 14:36:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=6VLmtTrw+3C3sTKuWWOnT4IWrWzAgiOa4MXBgRwTvNI=;
 b=LwGTYxs7S94mGNqqnbPe7po6NtpJXIC/dz209LluJFSnZUxFmx+Lm9bdO3X7x3aBW8cE
 0f8+w/D1aQQ4DYdhKEj36iMsDaq/qnsdPyqW4BWZ7C5IdmNSAcHwMba8IMi5j/88eoZY
 wIh2OSKwJUEp6YWNLejZACeQIgJG7xKJAPKc9L+/x2bHh8vAPsikv4g++UD5AGFAMi3U
 hvuWgdUk+yn7EVKOfxXSX6iGQZEbwUx6mPTM83DaunJvCxCaILCxuw+zAWiIyl5O+qc9
 UyLyrkpgVqrW6H+S36H08pZuZCaVq1zRHrbszpa7hFl4xh8SKOnH2oH+ORIn2Zl0GR0m hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ekymmsb13-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 14:36:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2CD48100034
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 14:36:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 25732209727
        for <linux-media@vger.kernel.org>; Thu, 10 Mar 2022 14:36:55 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 10 Mar 2022 14:36:54
 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH 1/2] media: dt-bindings: media: i2c: Add ST VGXY61 camera sensor binding
Date:   Thu, 10 Mar 2022 14:32:54 +0100
Message-ID: <20220310133255.1946530-2-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310133255.1946530-1-benjamin.mugnier@foss.st.com>
References: <20220310133255.1946530-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add device tree binding for the ST VGXY61 camera sensor, and update
MAINTAINERS file.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 .../bindings/media/i2c/st,st-vgxy61.yaml      | 134 ++++++++++++++++++
 MAINTAINERS                                   |  10 ++
 2 files changed, 144 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
new file mode 100644
index 000000000000..8740ed2623e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
@@ -0,0 +1,134 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2022 STMicroelectronics SA.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/st,st-vgxy61.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics VGxy61 HDR Global Shutter Sensor Family Device Tree Bindings
+
+maintainers:
+  - Benjamin Mugnier <benjamin.mugnier@foss.st.com>
+  - Sylvain Petinot <sylvain.petinot@foss.st.com>
+
+description: |-
+  STMicroelectronics VGxy61 family has a CSI-2 output port. CSI-2 output is a
+  quad lanes 800Mbps per lane.
+  Supported formats are RAW8, RAW10, RAW12, RAW14 and RAW16.
+  Following part number are supported
+  - VG5661 and VG6661 are 1.6 Mpx (1464 x 1104) monochrome and color sensors.
+  Maximum frame rate is 75 fps.
+  - VG5761 and VG6761 are 2.3 Mpx (1944 x 1204) monochrome and color sensors.
+  Maximum frame rate is 60 fps.
+
+properties:
+  compatible:
+    const: st,st-vgxy61
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
+      - const: xclk
+
+  VCORE-supply:
+    description:
+      Sensor digital core supply. Must be 1.2 volts.
+
+  VDDIO-supply:
+    description:
+      Sensor digital IO supply. Must be 1.8 volts.
+
+  VANA-supply:
+    description:
+      Sensor analog supply. Must be 2.8 volts.
+
+  reset-gpios:
+    description:
+      Reference to the GPIO connected to the reset pin, if any.
+      This is an active low signal to the vgxy61.
+
+  invert-gpios-polarity:
+    description:
+      If gpios polarity should be inversed
+    type: boolean
+
+  slave-mode:
+    description:
+      If the sensor operates in slave mode
+    type: boolean
+
+    #TODO check all this or copy from elsewhere
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          clock-lane:
+            description:
+              Clock lane index
+            maxItems: 1
+
+          data-lanes:
+            description:
+              CSI lanes to use
+            items:
+              - const: 1
+              - const: 2
+              - const: 3
+              - const: 4
+
+          remote-endpoint: true
+
+        required:
+          - clock-lane
+          - data-lanes
+          - remote-endpoint
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - VCORE-supply
+  - VDDIO-supply
+  - VANA-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        vgxy61: csi2tx@10 {
+            compatible = "st,st-vgxy61";
+            reg = <0x10>;
+            status = "okay";
+            clocks = <&clk_ext_camera>;
+            clock-names = "xclk";
+            VCORE-supply = <&v1v2>;
+            VDDIO-supply = <&v1v8>;
+            VANA-supply = <&v2v8>;
+            reset-gpios = <&mfxgpio 18 GPIO_ACTIVE_LOW>;
+            port {
+                ep0: endpoint {
+                    clock-lane = <0>;
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&mipi_csi2_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 83d27b57016f..f358d15f68a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18297,6 +18297,16 @@ S:	Maintained
 F:	Documentation/hwmon/stpddc60.rst
 F:	drivers/hwmon/pmbus/stpddc60.c
 
+ST VGXY61 DRIVER
+M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
+M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.txt
+F:	drivers/media/i2c/st-vgxy61.c
+
+
 ST VL53L0X ToF RANGER(I2C) IIO DRIVER
 M:	Song Qiang <songqiang1304521@gmail.com>
 L:	linux-iio@vger.kernel.org
-- 
2.25.1

