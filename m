Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F298333D4CA
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 14:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234818AbhCPNZZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 09:25:25 -0400
Received: from ni.piap.pl ([195.187.100.5]:43902 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230063AbhCPNZF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 09:25:05 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 96B264439A5;
        Tue, 16 Mar 2021 14:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 96B264439A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1615901101; bh=wZdVlT6VbbKipHYc8IYWqAuDe8Y2YOt1tmvRaR9ZA98=;
        h=From:To:Cc:Subject:Date:From;
        b=FdoBLBcfi9PmBYw/IX99zz8CS3ymGSkrLmsuCCaLx2QkWOFchrNbFQKOXDF1AHI/T
         jY/j3Mw20w8mJ7/1llQSfZza6ooo+U7Is5HTzPISEXN+hY49CmW33EY46+7FmuduoX
         NiLLivOu+Tuai+Gih729fNu2zOkXNTmpdBuRo4aE=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     devicetree@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: RFC: dt-binding: media: document ON Semi AR0521 sensor bindings
Sender: khalasa@piap.pl
Date:   Tue, 16 Mar 2021 14:25:01 +0100
Message-ID: <m3o8fjs02a.fsf@t19.piap.pl>
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

Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>

diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml b=
/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
new file mode 100644
index 000000000000..f649d4cbcb37
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/onnn,ar0521.yaml
@@ -0,0 +1,76 @@
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
+    const: on-semi,ar0521
+
+  reg:
+    description: I2C bus address of the sensor device
+    maxItems: 1
+
+  clocks:
+    description: reference to the xclk clock
+    maxItems: 1
+
+  clock-names:
+    const: xclk
+
+  reset-gpios:
+    description: active low reset GPIO
+    maxItems: 1
+
+  port:
+    type: object
+    description: |
+      Output video port: 1, 2 or 4 lanes. See ../video-interfaces.txt.
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
Krzysztof Halasa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
