Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD3EF5A79AD
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 11:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbiHaJBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 05:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbiHaJBo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 05:01:44 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88642201B3
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 02:01:43 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27V8ClwY015766;
        Wed, 31 Aug 2022 11:01:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=PF64cdOppt44nSI6zIft+3MxKgSJlPWAuOQqT1bvbkE=;
 b=E5MA5fYYr67guB5OLInOGILG2f85MqKj9c0eNZ/ngrYmRB1Cexf60W3SyR7egTkCWuyh
 H0q1csPm8TWiKZMDmciPw788ro43WLMqRcI7GcXjO2dotiGnJLR5AkJbryUZg5k0owGw
 9FbDJYesIELzLj6wpoRGJCfgE8I2g8WcyfNcTXe/5D9hZDlJEx0PgmMQyqJjslEz7Dz1
 ajhRCNSQJkdbUDUcVxi80BHZgk/NINHJmKIXgLKrT3mQj0FeNiJOHighvxjaG+iTAJDu
 Lt/IR00U1Oiu+gAfoeMyOlC6y8hZU1mECcJYKFmkDkCiZehecyjo4tl1O8p7nsuzMegq /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ja3xe8b2e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 31 Aug 2022 11:01:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 66CC510002A;
        Wed, 31 Aug 2022 11:01:38 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 62AA5216ED0;
        Wed, 31 Aug 2022 11:01:38 +0200 (CEST)
Received: from localhost (10.75.127.50) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Wed, 31 Aug
 2022 11:01:38 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v5 3/4] media: dt-bindings: media: i2c: Add ST VGXY61 camera sensor binding
Date:   Wed, 31 Aug 2022 11:01:17 +0200
Message-ID: <20220831090118.104057-4-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831090118.104057-1-benjamin.mugnier@foss.st.com>
References: <20220831090118.104057-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-31_05,2022-08-31_01,2022-06-22_01
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
 .../bindings/media/i2c/st,st-vgxy61.yaml      | 117 ++++++++++++++++++
 MAINTAINERS                                   |   9 ++
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
new file mode 100644
index 000000000000..4bc9a945b001
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
@@ -0,0 +1,117 @@
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
+  st,strobe-gpios-polarity:
+    description:
+      Invert polarity of strobe GPIOs.
+    type: boolean
+
+  st,slave-mode:
+    description:
+      If the sensor operates in slave mode
+    type: boolean
+
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
+          - data-lanes
+
+required:
+  - compatible
+  - clocks
+  - VCORE-supply
+  - VDDIO-supply
+  - VANA-supply
+  - port
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
+            clocks = <&clk_ext_camera>;
+            VCORE-supply = <&v1v2>;
+            VDDIO-supply = <&v1v8>;
+            VANA-supply = <&v2v8>;
+            reset-gpios = <&mfxgpio 18 GPIO_ACTIVE_LOW>;
+            port {
+                ep0: endpoint {
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&mipi_csi2_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8a5012ba6ff9..14d26b9d89c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19270,6 +19270,15 @@ S:	Maintained
 F:	Documentation/hwmon/stpddc60.rst
 F:	drivers/hwmon/pmbus/stpddc60.c
 
+ST VGXY61 DRIVER
+M:	Benjamin Mugnier <benjamin.mugnier@foss.st.com>
+M:	Sylvain Petinot <sylvain.petinot@foss.st.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media_tree.git
+F:	Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
+F:	drivers/media/i2c/st-vgxy61.c
+
 ST VL53L0X ToF RANGER(I2C) IIO DRIVER
 M:	Song Qiang <songqiang1304521@gmail.com>
 L:	linux-iio@vger.kernel.org
-- 
2.25.1

