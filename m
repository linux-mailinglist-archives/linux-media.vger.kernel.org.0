Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA913D0A4F
	for <lists+linux-media@lfdr.de>; Wed, 21 Jul 2021 10:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234448AbhGUH1r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Jul 2021 03:27:47 -0400
Received: from ni.piap.pl ([195.187.100.5]:59800 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234280AbhGUH0g (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Jul 2021 03:26:36 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id 6B88DC3F3EE1;
        Wed, 21 Jul 2021 10:06:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 6B88DC3F3EE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1626854794; bh=kAOVbBosXZA2dqheAUUBZ2v3aVMqXiDlCLAVPrva5bQ=;
        h=From:To:Cc:Subject:Date:From;
        b=jZMMYu/MZ6qFn/YxxjjvTmpnCU8IJfQ1+sS0ANxFDReYzEdSHjPTdQGOB/SP65qhZ
         iofrSG4GkceQH3QAIkn3w46HMJUWkWdWOwxCON5UjNUv80hc7xIQoIsNJr1gORGLVw
         SN/c8RYwaRT00K2/Uo7v4v3Srs0TJ4Y+Lx6t/Sik=
From:   Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
To:     devicetree@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC v3] dt-binding: media: document ON Semi AR0521 sensor bindings
Date:   Wed, 21 Jul 2021 10:06:34 +0200
Message-ID: <m37dhkdrat.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 165154 [Jul 21 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 448 448 71fb1b37213ce9a885768d4012c46ac449c77b17, {Tracking_from_exist}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, piap.pl:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;t19.piap.pl:7.1.1;devicetree.org:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/07/21 05:08:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/07/21 00:56:00 #16933345
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file documents DT bindings for the AR0521 camera sensor driver.

Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>
---
Changes from v2:
- changed "xclk" to "extclk"
- power regulator names etc.
- video output port properties
- cosmetics
- UTF-8 experiments :-)

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml b=
/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
new file mode 100644
index 000000000000..785bae61bb5e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
@@ -0,0 +1,108 @@
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
+    $ref: /schemas/graph.yaml#/properties/port
+    description: |
+      Video output port.
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+
+        properties:
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
