Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492033DB477
	for <lists+linux-media@lfdr.de>; Fri, 30 Jul 2021 09:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237572AbhG3H0h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 30 Jul 2021 03:26:37 -0400
Received: from ni.piap.pl ([195.187.100.5]:39064 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237403AbhG3H0g (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 30 Jul 2021 03:26:36 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id 850AFC369544;
        Fri, 30 Jul 2021 09:26:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 850AFC369544
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1627629990; bh=7NjeuI9OzODAQTBeTKkoJMXYwc5KJdYM6kfPUEfVli0=;
        h=From:To:Cc:Subject:Date:From;
        b=Jxukr1t6vvkZtPLfn3vHEW0GnO9OiMg+dZWIAk5V1Pu0VS9zIMnDjeTa4ke8pIogN
         CKiIRRFt1VQHM/xoZo2GAyF9aaqBeu9UcGZRDLXEQAdyS3UW9zX0ThGehqTlC7GWSK
         GWT6USN6miYDfVp2vb1wwG4Yiw6wP0k8L4JjcHYc=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     devicetree@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4] dt-binding: media: document ON Semi AR0521 sensor bindings
Sender: khalasa@piap.pl
Date:   Fri, 30 Jul 2021 09:26:30 +0200
Message-ID: <m3lf5o9s9l.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 165318 [Jul 30 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 449 449 5db59deca4a4f5e6ea34a93b13bc730e229092f4, {Tracking_uf_ne_domains}, {Tracking_marketers, three}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;t19.piap.pl:7.1.1;piap.pl:7.1.1;devicetree.org:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/30 06:56:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/07/30 04:15:00 #16998356
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file documents DT bindings for the AR0521 camera sensor driver.

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml b=
/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
new file mode 100644
index 000000000000..b617cc5c6a9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
@@ -0,0 +1,112 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,ar0521.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor AR0521 MIPI CSI-2 sensor
+
+maintainers:
+  - Krzysztof Ha=C5=82asa <khalasa@piap.pl>
+
+description: |-
+  The AR0521 is a raw CMOS image sensor with MIPI CSI-2 and
+  I2C-compatible control interface.
+
+properties:
+  compatible:
+    const: onnn,ar0521
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: extclk
+
+  vaa-supply:
+    description:
+      Definition of the regulator used as analog (2.7 V) voltage supply.
+
+  vdd-supply:
+    description:
+      Definition of the regulator used as digital core (1.2 V) voltage sup=
ply.
+
+  vdd_io-supply:
+    description:
+      Definition of the regulator used as digital I/O (1.8 V) voltage supp=
ly.
+
+  reset-gpios:
+    description: reset GPIO, usually active low
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
+    description: |
+      Video output port.
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          bus-type:
+            const: 4
+          data-lanes:
+            anyOf:
+              - items:
+                  - const: 1
+              - items:
+                  - const: 1
+                  - const: 2
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - vaa-supply
+  - vdd-supply
+  - vdd_io-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+
+    i2c {
+            #address-cells =3D <1>;
+            #size-cells =3D <0>;
+
+            ar0521: camera-sensor@36 {
+                    compatible =3D "onnn,ar0521";
+                    reg =3D <0x36>;
+                    pinctrl-names =3D "default";
+                    pinctrl-0 =3D <&pinctrl_mipi_camera>;
+                    clocks =3D <&clks IMX6QDL_CLK_CKO>;
+                    clock-names =3D "extclk";
+                    reset-gpios =3D <&gpio1 7 GPIO_ACTIVE_LOW>;
+                    vaa-supply =3D <&reg_2p7v>;
+                    vdd-supply =3D <&reg_1p2v>;
+                    vdd_io-supply =3D <&reg_1p8v>;
+
+                    port {
+                           mipi_camera_to_mipi_csi2: endpoint {
+                                    remote-endpoint =3D <&mipi_csi2_in>;
+                                    data-lanes =3D <1 2 3 4>;
+                            };
+                    };
+            };
+    };

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
