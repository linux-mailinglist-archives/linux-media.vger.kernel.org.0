Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A54E23C59B1
	for <lists+linux-media@lfdr.de>; Mon, 12 Jul 2021 13:02:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357684AbhGLJHl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Jul 2021 05:07:41 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:45266 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382895AbhGLJC3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Jul 2021 05:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1626080137; x=1628672137;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZeMpxvKbrMlINSKo2k+s/KYwL8a1CODqsKO3gN0aYJY=;
        b=QdlWNd7xbdvjOyMqkpYZ6IrROX4aLQ7ocslel5tLqh9KC+RwvcNzLAr9d+AtKQCL
        Hhf3WQsdkfG4KqdqpVpjxoNN5T0dA51pm95y/6hM5pCw+1MKNwi8GHr/jgt9+d6A
        oCwiwTB6imDZkinrk5GeTaeJPt+fQ16cQ6L0IEoAUfc=;
X-AuditID: c39127d2-1d8f870000001daf-25-60ec0389d5bc
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 4D.8D.07599.9830CE06; Mon, 12 Jul 2021 10:55:37 +0200 (CEST)
Received: from lws-riedmueller.phytec.de ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2021071210553681-1131635 ;
          Mon, 12 Jul 2021 10:55:36 +0200 
From:   Stefan Riedmueller <s.riedmueller@phytec.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stefan Riedmueller <s.riedmueller@phytec.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/6] media: dt-bindings: mt9p031: Convert bindings to yaml
Date:   Mon, 12 Jul 2021 10:55:34 +0200
Message-Id: <20210712085535.11907-6-s.riedmueller@phytec.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712085535.11907-1-s.riedmueller@phytec.de>
References: <20210712085535.11907-1-s.riedmueller@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 12.07.2021 10:55:37,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 12.07.2021 10:55:37
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrFLMWRmVeSWpSXmKPExsWyRoCBS7eT+U2CwYxznBbzj5xjteicuITd
        4vKuOWwWPRu2slos2/SHyaJ17xF2i09bvjE5sHvM7pjJ6rFpVSebx7yTgR6fN8kFsERx2aSk
        5mSWpRbp2yVwZRybv5294KlKxdPdl5kaGO/LdDFycEgImEh0XjTvYuTiEBLYxiix9+ZxJgjn
        OqPEspUvGLsYOTnYBIwkFkxrBEuICLQxSuw40gzmMAtsYZSYfnk5G0iVsICvxJXDD9lBbBYB
        VYkFvS+ZQGxeARuJDx3NYLaEgLzEzEvf2UFWcwrYSuz5YQkSFgIquT5/AwtEuaDEyZlPWEDm
        SwhcAZr/8DYzRK+QxOnFZ8FsZgFtiWULXzNPYBSYhaRnFpLUAkamVYxCuZnJ2alFmdl6BRmV
        JanJeimpmxiB4Xt4ovqlHYx9czwOMTJxMB5ilOBgVhLh/db7KkGINyWxsiq1KD++qDQntfgQ
        ozQHi5I47wbekjAhgfTEktTs1NSC1CKYLBMHp1QDY893mcln1/2a+fbd2o9nfSZ9uVVWtmDb
        8Q+7dzGk3XftnK0XzMS1Y0tHcMujK9Ob+fayrVQyj3E8+a+O9ffrPWu3nmhfs9XwZMjjn2q8
        zGE3Aw9MLY3Tt37I4Rsxh13hjC3XT9O7z0S9eH7MeBbzM/pKvdOK9XIJF3jer19yU2xBduSW
        I3f/KKcrsRRnJBpqMRcVJwIA551A3E0CAAA=
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
index 000000000000..ad9a2db73d86
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9p031.yaml
@@ -0,0 +1,75 @@
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
index a61f4f3b78a9..33dd81237a91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12635,6 +12635,7 @@ M:	Laurent Pinchart <laurent.pinchart@ideasonboard.=
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

