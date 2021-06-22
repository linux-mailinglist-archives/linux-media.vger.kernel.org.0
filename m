Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D91423B029B
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 13:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhFVLUz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 07:20:55 -0400
Received: from ni.piap.pl ([195.187.100.5]:52796 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229668AbhFVLUz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 07:20:55 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 68C0C4A0049;
        Tue, 22 Jun 2021 13:18:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 68C0C4A0049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1624360715; bh=sZjIwY1MUZOdG4VMiblwq5+l7pMZ4eFjBDVTy0ETrYI=;
        h=From:To:Cc:Subject:Date:From;
        b=k4mb0FdX7fhvz3U3RGqrvC7EhPBZY4czSygN6NmlbHDSr7eckxtvXRFATndcSOoUH
         JckG1XFBOD07G/wDUKpkv1MuUyY24MNBZpcR9mFtdjZFy/MQtnqXhaolMXoTx3ZBh5
         MDLE3XMZBoVYcTGsAgDIALTkAsSTCzum0ZK3ffdE=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     devicetree@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [RFC v2] dt-binding: media: document ON Semi AR0521 sensor bindings
Sender: khalasa@piap.pl
Date:   Tue, 22 Jun 2021 13:18:35 +0200
Message-ID: <m3y2b25er8.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 4
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, not scanned, whitelist
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file documents DT bindings for the AR0521 camera sensor driver.
Changes from v1:
- added power management (power supplies).
- small fixes

The question still stands: is there a way to reliably put national
unicode characters into:
- commit messages for patches submitted via email,
- C and other source files (comments and stuff like MODULE_AUTHOR).

Yes, I know I can commit it myself correctly, but then propagating it
upstream is problematic. Perhaps a pullable tree would be better?
I guess I need to renew my old kernel.org account.

Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml b=
/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
new file mode 100644
index 000000000000..29421daacc87
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/onnn,ar0521.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ON Semiconductor AR0521 MIPI CSI-2 sensor
+
+maintainers:
+  - Krzysztof Halasa <khalasa@piap.pl>
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
+    description: reference to the xclk clock
+    maxItems: 1
+
+  clock-names:
+    const: xclk
+
+  vdd_io-supply:
+    description:
+      Definition of the regulator used as digital I/O (1.8 V) voltage supp=
ly.
+
+  vdd_core-supply:
+    description:
+      Definition of the regulator used as digital core (1.2 V) voltage sup=
ply.
+
+  vcc_analog-supply:
+    description:
+      Definition of the regulator used as analog (2.7 V) voltage supply.
+
+  reset-gpios:
+    description: reset GPIO, usually active low
+    maxItems: 1
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description: |
+      Output video port: 1, 2 or 4 lanes.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
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
+
+                    clocks =3D <&clks IMX6QDL_CLK_CKO>;
+                    clock-names =3D "xclk";
+
+                    reset-gpios =3D <&gpio1 7 GPIO_ACTIVE_LOW>;
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
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
