Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE36452472D
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 09:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351110AbiELHmi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 03:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351108AbiELHmg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 03:42:36 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 421461A15D4
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 00:42:34 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24C2ikl2028998;
        Thu, 12 May 2022 09:42:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=LhOFa8BIpRYyJ0slEBq/ckdYIiACZ4xz7MC5KcVFan8=;
 b=70Ou8jOQaGYWZZe/60ZSNn1E1I+F4FxGteEPCLGYz2ImojNpyvdkTO7FYVcFlJEJcMSv
 ITrI7Tb5/m0t63rPe2mCyWlaq7e367c+wlL7F3iOyPSIaKY7hFdTLUTtNMQPo2ya/sac
 v99MbRiqvudou0GBGu6kBDkucLqcuKUaXA7cKDo50TW1tUwYmk0sOqeY1IpqwpcKFPQk
 G8y8PIdn5/DSDk9nsXW1OPYTNhybW2dMNZfNsn5CNeay2ANXRs/dk3hRRn4I2EOPYOSK
 VrhgroDbf1Bj/1KBbovI+4saQ8gw8hAG888XhLcToT+7QWmn+jLtfo2tLB5kb5wH35m1 3w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwdw9g4ke-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 May 2022 09:42:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 722C110002A;
        Thu, 12 May 2022 09:42:29 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A0E8216840;
        Thu, 12 May 2022 09:42:29 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 12 May 2022 09:42:29
 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v3 4/5] media: dt-bindings: media: i2c: Add ST VGXY61 camera sensor binding
Date:   Thu, 12 May 2022 09:40:36 +0200
Message-ID: <20220512074037.3829926-5-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512074037.3829926-1-benjamin.mugnier@foss.st.com>
References: <20220512074037.3829926-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-12_01,2022-02-23_01
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
index 40fa1955ca3f..f46f26863388 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18662,6 +18662,15 @@ S:	Maintained
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
 ST VL53L0X ToF RANGER(I2C) IIO DRIVER
 M:	Song Qiang <songqiang1304521@gmail.com>
 L:	linux-iio@vger.kernel.org
-- 
2.25.1

