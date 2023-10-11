Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D07FF7C5AA6
	for <lists+linux-media@lfdr.de>; Wed, 11 Oct 2023 19:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234878AbjJKR6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Oct 2023 13:58:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234775AbjJKR63 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Oct 2023 13:58:29 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 760E6B0;
        Wed, 11 Oct 2023 10:58:27 -0700 (PDT)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39BH00s4011155;
        Wed, 11 Oct 2023 19:58:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding:content-type; s=
        selector1; bh=LX9OpoCQ9thr5g7xfLbhihFWoNb1qUlFHdIuWnhZu38=; b=YL
        ma7r0OozQBqIFJiWpmbIfNP8ALAW17uEASDQDi3q3y1TRJVQ+ak0aqY3WZiKUV7U
        8zGXf4dlhfUhJfdHk/RBUb91yDa/+4L4ab8D56PCIzWzGWqjaEqNKmKlmSmyTFhU
        KqhVJ/eeyw03G/u8J2PUS4hzeAOAHW04pgwW+gbU9eJ8zuZ6ATiE3aNTNZtDSvFM
        xraEsDiWsyKABt4C4jz3nPmMLFij4u2fpW5V4TLiTaGIT0edCRwMdH6HJVjYK7Ul
        1KvHLWfQMY+Lq4B8QaVpd/SZLamuzycNZMSBe7eqe8ML0iJHs98W3KmfcRaAb6hs
        D5iL5Eb/MMMfkFtZEkQw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tnp24k56v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Oct 2023 19:58:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 29B34100057;
        Wed, 11 Oct 2023 19:58:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F29E20B620;
        Wed, 11 Oct 2023 19:58:20 +0200 (CEST)
Received: from localhost (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 11 Oct
 2023 19:58:19 +0200
From:   Alain Volmat <alain.volmat@foss.st.com>
To:     Alain Volmat <alain.volmat@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: media: i2c: add galaxycore,gc2145 dt-bindings
Date:   Wed, 11 Oct 2023 19:57:29 +0200
Message-ID: <20231011175735.1824782-3-alain.volmat@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231011175735.1824782-1-alain.volmat@foss.st.com>
References: <20231011175735.1824782-1-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_12,2023-10-11_01,2023-05-22_02
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Introduction of the Galaxy Core GC2145 XVGA CMOS camera sensor.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../bindings/media/i2c/galaxycore,gc2145.yaml | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
new file mode 100644
index 000000000000..94d194cf5452
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/galaxycore,gc2145.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Galaxy Core 1/5'' UXGA CMOS Image Sensor
+
+maintainers:
+  - Alain Volmat <alain.volmat@foss.st.com>
+
+description:
+  The Galaxy Core GC2145 is a high quality 2 Mega CMOS image sensor, for mobile
+  phone camera applications and digital camera products. GC2145 incorporates a
+  1616V x 1232H active pixel array, on-chip 10-bit ADC, and image signal
+  processor. It is programmable through an I2C interface. Image data is sent
+  either through a parallel interface or through MIPI CSI-2.
+
+allOf:
+  - $ref: ../video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: galaxycore,gc2145
+
+  reg:
+    const: 0x3c
+
+  clocks:
+    maxItems: 1
+
+  powerdown-gpios:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  iovdd-supply:
+    description: Power Supply for I/O circuits (1.7 - 3V).
+
+  avdd-supply:
+    description: Power for analog circuit/sensor array (2.7 - 3V).
+
+  dvdd-supply:
+    description: Power for digital core (1.7 - 1.9V).
+
+  orientation: true
+
+  rotation: true
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+    required:
+      - endpoint
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - powerdown-gpios
+  - reset-gpios
+  - iovdd-supply
+  - avdd-supply
+  - dvdd-supply
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
+        camera@3c {
+            compatible = "galaxycore,gc2145";
+            reg = <0x3c>;
+            clocks = <&clk_ext_camera>;
+            iovdd-supply = <&scmi_v3v3_sw>;
+            avdd-supply = <&scmi_v3v3_sw>;
+            dvdd-supply = <&scmi_v3v3_sw>;
+            powerdown-gpios = <&mcp23017 3 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+            reset-gpios = <&mcp23017 4 (GPIO_ACTIVE_LOW | GPIO_PUSH_PULL)>;
+
+            port {
+                endpoint {
+                    remote-endpoint = <&mipid02_0>;
+                    data-lanes = <1 2>;
+                };
+            };
+        };
+    };
+
+...
-- 
2.25.1

