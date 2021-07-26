Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10C2A3D5460
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 09:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbhGZGy5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 02:54:57 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:56440 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232521AbhGZGyy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 02:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1627284920; x=1629876920;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kXrwkaTGPwrwsu+XCLaOWV09jawGzyQOoi9ZJfBVkCw=;
        b=iIZo2jPjI7wmegLQdXzhzfhphOz7wdbAe0/YtyvZOAAQE0YtjXiqBJPWFBvUUiO6
        ZfK1+LEVUO5Erg8YNMMHI+ek5FEr137zWmdXZ1Qkmv9YvzPUFAs8GppaLfAuo+l+
        G4ZfXLGOq9hLozy3QIEjKmM6RXIl6NtZPEVeeDQGLaQ=;
X-AuditID: c39127d2-1d8f870000001daf-ac-60fe65b7c510
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 66.82.07599.7B56EF06; Mon, 26 Jul 2021 09:35:19 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.0.56])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021072609351952-1233318 ;
          Mon, 26 Jul 2021 09:35:19 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/6] media: dt-bindings: mt9p031: Convert bindings to yaml
Date:   Mon, 26 Jul 2021 09:35:17 +0200
Message-Id: <20210726073518.2167398-6-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210726073518.2167398-1-s.riedmueller@phytec.de>
References: <20210726073518.2167398-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.07.2021 09:35:19,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 26.07.2021 09:35:19
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsWyRoCBS3d76r8Eg44PNhbzj5xjteicuITd
        4vKuOWwWPRu2slos2/SHyaJ17xF2i09bvjE5sHvM7pjJ6rFpVSebx7yTgR6fN8kFsERx2aSk
        5mSWpRbp2yVwZfw/0cxecEm9YuKq9awNjAfluhg5OSQETCSmfnvL1sXIxSEksI1R4tm8zywQ
        zgVGiYc/trKCVLEJGEksmNbIBJIQEWhjlNhxpBnMYRbYwigx/fJyNpAqYQFfiS+XPrB3MXJw
        sAioStyYYAoS5hWwk9jYuJEVYp28xMxL39lBbE4Be4lbT9+D2UJANa2dG9kh6gUlTs58AnaF
        hMAVRokDRzcyQTQLSZxefJYZxGYW0JZYtvA18wRGgVlIemYhSS1gZFrFKJSbmZydWpSZrVeQ
        UVmSmqyXkrqJERjAhyeqX9rB2DfH4xAjEwfjIUYJDmYlEV6HFb8ThHhTEiurUovy44tKc1KL
        DzFKc7AoifNu4C0JExJITyxJzU5NLUgtgskycXBKNTDadk4+tvjDPDO2GnODHVX7b09VPK29
        cYXSJ7mDj75rrvpu8sC392f3m2ede3itVCxUGuMnv1lsYxOx1uwAk8KF9SfNvcP6FMXYLYyu
        lO6pW7x+y9o11w7F/FFJag5YccDs3zn+w7oyEpPLLaPurKyZ0VgppP/zYLygvG2I+M2Ot7uy
        d3btfrtdiaU4I9FQi7moOBEAcxBwCU4CAAA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert mt9p031 sensor bindings to yaml schema. Also update the
MAINTAINERS entry.

Although input-clock-frequency and pixel-clock-frequency have not been
definded as endpoint propierties in the textual bindings, the sensor
does parse them from the endpoint. Thus move these properties to the
endpoint in the new yaml bindings.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 .../bindings/media/i2c/aptina,mt9p031.yaml    | 86 +++++++++++++++++++
 .../devicetree/bindings/media/i2c/mt9p031.txt | 40 ---------
 MAINTAINERS                                   |  1 +
 3 files changed, 87 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9p=
031.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/mt9p031.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yam=
l b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
new file mode 100644
index 000000000000..bc0e8e5194e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/aptina,mt9p031.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Aptina 1/2.5-Inch 5Mp CMOS Digital Image Sensor
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+
+description: |
+  The Aptina MT9P031 is a 1/2.5-inch CMOS active pixel digital image sensor
+  with an active array size of 2592H x 1944V. It is programmable through a
+  simple two-wire serial interface.
+
+properties:
+  compatible:
+    enum:
+      - aptina,mt9p031
+      - aptina,mt9p031m
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: Chip reset GPIO
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
+          input-clock-frequency:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            minimum: 6000000
+            maximum: 96000000
+            description: Input clock frequency
+
+          pixel-clock-frequency:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            maximum: 96000000
+            description: Target pixel clock frequency
+
+          pclk-sample:
+            default: 0
+
+        required:
+          - input-clock-frequency
+          - pixel-clock-frequency
+
+required:
+  - compatible
+  - reg
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        mt9p031@5d {
+            compatible =3D "aptina,mt9p031";
+            reg =3D <0x5d>;
+            reset-gpios =3D <&gpio=5Fsensor 0 0>;
+
+            port {
+                mt9p031=5F1: endpoint {
+                    input-clock-frequency =3D <6000000>;
+                    pixel-clock-frequency =3D <96000000>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/media/i2c/mt9p031.txt b/Docu=
mentation/devicetree/bindings/media/i2c/mt9p031.txt
deleted file mode 100644
index cb60443ff78f..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/mt9p031.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-* Aptina 1/2.5-Inch 5Mp CMOS Digital Image Sensor
-
-The Aptina MT9P031 is a 1/2.5-inch CMOS active pixel digital image sensor =
with
-an active array size of 2592H x 1944V. It is programmable through a simple
-two-wire serial interface.
-
-Required Properties:
-- compatible: value should be either one among the following
-	(a) "aptina,mt9p031" for mt9p031 sensor
-	(b) "aptina,mt9p031m" for mt9p031m sensor
-
-- input-clock-frequency: Input clock frequency.
-
-- pixel-clock-frequency: Pixel clock frequency.
-
-Optional Properties:
-- reset-gpios: Chip reset GPIO
-
-For further reading on port node refer to
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example:
-
-	i2c0@1c22000 {
-		...
-		...
-		mt9p031@5d {
-			compatible =3D "aptina,mt9p031";
-			reg =3D <0x5d>;
-			reset-gpios =3D <&gpio3 30 0>;
-
-			port {
-				mt9p031=5F1: endpoint {
-					input-clock-frequency =3D <6000000>;
-					pixel-clock-frequency =3D <96000000>;
-				};
-			};
-		};
-		...
-	};
diff --git a/MAINTAINERS b/MAINTAINERS
index 19135a9d778e..e050790c846a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12637,6 +12637,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.=
com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media=5Ftree.git
+F:	Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
 F:	drivers/media/i2c/mt9p031.c
 F:	include/media/i2c/mt9p031.h
=20
--=20
2.25.1

