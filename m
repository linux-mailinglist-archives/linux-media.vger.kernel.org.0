Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADF63BF776
	for <lists+linux-media@lfdr.de>; Thu,  8 Jul 2021 11:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbhGHJWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jul 2021 05:22:16 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:46322 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbhGHJWJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jul 2021 05:22:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1625735963; x=1628327963;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=2EHiQmCcA0T0yPEzsDj0RGZ8t5/2LRX/tTS/cd+0OAs=;
        b=mfJHB0yuGKxB1E99hujbzfz7WMBfGs6VP3EgpA/kGFSbtb6X7+3ixJRXOZ6kPEMf
        Z5JT6tXPDsAFaSmmdGi0j8tX4OW9mnX09/adKrkqE1SafrlkXuaIEhi6qjz5s/Kt
        uCzUhBj5EszqfwtQFHB65A8mNpmLiDRefCEHhFQRtyM=;
X-AuditID: c39127d2-1e4f970000001daf-88-60e6c31bc5b2
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 0A.B7.07599.B13C6E06; Thu,  8 Jul 2021 11:19:23 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021070811192327-1113445 ;
          Thu, 8 Jul 2021 11:19:23 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/6] media: dt-bindings: mt9p031: Convert bindings to yaml
Date:   Thu, 8 Jul 2021 11:19:21 +0200
Message-Id: <20210708091922.5508-6-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210708091922.5508-1-s.riedmueller@phytec.de>
References: <20210708091922.5508-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 08.07.2021 11:19:23,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 08.07.2021 11:19:23
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNLMWRmVeSWpSXmKPExsWyRoCBS1f68LMEg5v7tSzmHznHatE5cQm7
        xeVdc9gsejZsZbVYtukPk0Xr3iPsFp+2fGNyYPeY3TGT1WPTqk42j3knAz0+b5ILYInisklJ
        zcksSy3St0vgyphy+QdzwVOlipfN05kbGDukuxg5OSQETCQe3t/B3MXIxSEksI1R4uXC3WwQ
        zjVGiU1bPrCBVLEJGEksmNbIBJIQEWhjlNhxpBnMYRbYwigx/fJysCphAV+J83teMYPYLAIq
        Er++nGQBsXkFrCVW3r3IBLFPXmLmpe/sXYwcHJwCNhJd/SkgYSGgkmOzbrFClAtKnJz5hAVk
        voTAFUaJ+b+WsUH0CkmcXnwWbD6zgLbEsoWvmScwCsxC0jMLSWoBI9MqRqHczOTs1KLMbL2C
        jMqS1GS9lNRNjMAAPjxR/dIOxr45HocYmTgYDzFKcDArifAazXiWIMSbklhZlVqUH19UmpNa
        fIhRmoNFSZx3A29JmJBAemJJanZqakFqEUyWiYNTqoExxpf1KFfFwphPLzVy3NYcbrzaUd29
        T8vh6fewtn+3vIorowIWeavXujjaTfnoaOea/Mtg0jumqDeF0pXXVvpHa6f1nfq06IN7V4Xz
        /s/+/mtFXFapOIpM47n8SH+R/xqN7RJ8EsevL4hQurSWIZK9cOI+PomtN+375yocNDxhkyOh
        1X+FQ0OJpTgj0VCLuag4EQD1v87PTgIAAA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert mt9p031 sensor bindings to yaml schema. Also update the
MAINTAINERS entry.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 .../bindings/media/i2c/aptina,mt9p031.yaml    | 75 +++++++++++++++++++
 .../devicetree/bindings/media/i2c/mt9p031.txt | 40 ----------
 MAINTAINERS                                   |  1 +
 3 files changed, 76 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/aptina,mt9p=
031.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/mt9p031.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yam=
l b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
new file mode 100644
index 000000000000..7de62e339895
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/mt9p031.yaml#
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
+    $ref: /schemas/graph.yaml#/properties/port
+    addittionalProeprties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          input-clock-frequency: true
+          pixel-clock-frequency: true
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
+        }:
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
index c7456776ace5..f2123226baae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12610,6 +12610,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.=
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

