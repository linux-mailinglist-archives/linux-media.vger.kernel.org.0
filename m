Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA42A220ECF
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 16:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732075AbgGOOGr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 10:06:47 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:50361 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732042AbgGOOGr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 10:06:47 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 67282FF818;
        Wed, 15 Jul 2020 14:06:43 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 8/8] dt-bindings: media: i2c: Add prefix to yaml bindings
Date:   Wed, 15 Jul 2020 16:09:51 +0200
Message-Id: <20200715140951.90753-9-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
References: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add the vendor prefixes to the DT bindings converted to json-schema
and update the MAINTAINERS file accordingly.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../media/i2c/{ov5640.yaml => ovti,ov5640.yaml}  |  0
 .../media/i2c/{ov5645.yaml => ovti,ov5645.yaml}  |  0
 .../media/i2c/{ov5647.yaml => ovti,ov5647.yaml}  |  0
 .../media/i2c/{ov772x.yaml => ovti,ov772x.yaml}  |  0
 .../media/i2c/{ov8856.yaml => ovti,ov8856.yaml}  |  0
 .../media/i2c/{imx219.yaml => sony,imx219.yaml}  |  0
 .../media/i2c/{imx274.yaml => sony,imx274.yaml}  |  0
 .../media/i2c/{imx290.yaml => sony,imx290.yaml}  |  0
 MAINTAINERS                                      | 16 ++++++++--------
 9 files changed, 8 insertions(+), 8 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{ov5640.yaml => ovti,ov5640.yaml} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov5645.yaml => ovti,ov5645.yaml} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov5647.yaml => ovti,ov5647.yaml} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov772x.yaml => ovti,ov772x.yaml} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{ov8856.yaml => ovti,ov8856.yaml} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{imx219.yaml => sony,imx219.yaml} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{imx274.yaml => sony,imx274.yaml} (100%)
 rename Documentation/devicetree/bindings/media/i2c/{imx290.yaml => sony,imx290.yaml} (100%)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov5640.yaml
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov5645.yaml
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov5647.yaml
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov772x.yaml
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
diff --git a/Documentation/devicetree/bindings/media/i2c/ov8856.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/ov8856.yaml
rename to Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/imx219.yaml
rename to Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/imx274.yaml
rename to Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
diff --git a/Documentation/devicetree/bindings/media/i2c/imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
similarity index 100%
rename from Documentation/devicetree/bindings/media/i2c/imx290.yaml
rename to Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
diff --git a/MAINTAINERS b/MAINTAINERS
index b4670904b014..546f3c8c248e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12605,7 +12605,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov5640.c
-F:	Documentation/devicetree/bindings/media/i2c/ov5640.yaml
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5640.yaml
 
 OMNIVISION OV5645 SENSOR DRIVER
 M:	Jacopo Mondi <jacopo@jmondi.org>
@@ -12613,7 +12613,7 @@ L:	linux-media@vger.kernel.org
 S:	Odd Fixes
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov5645.c
-F:	Documentation/devicetree/bindings/media/i2c/ov5645.yaml
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5645.yaml
 
 OMNIVISION OV5647 SENSOR DRIVER
 M:	Jacopo Mondi <jacopo@jmondi.org>
@@ -12622,7 +12622,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/i2c/ov5647.c
-F:	Documentation/devicetree/bindings/media/i2c/ov5647.yaml
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5647.yaml
 
 OMNIVISION OV5670 SENSOR DRIVER
 M:	Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
@@ -12659,7 +12659,7 @@ M:	Jacopo Mondi <jacopo@jmondi.org>
 L:	linux-media@vger.kernel.org
 S:	Odd fixes
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/ov772x.yaml
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
 F:	drivers/media/i2c/ov772x.c
 F:	include/media/i2c/ov772x.h
 
@@ -12676,7 +12676,7 @@ M:	Dongchun Zhu <dongchun.zhu@mediatek.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/ov8856.yaml
+F:	Documentation/devicetree/bindings/media/i2c/ovti,ov8856.yaml
 F:	drivers/media/i2c/ov8856.c
 
 OMNIVISION OV9640 SENSOR DRIVER
@@ -15907,7 +15907,7 @@ M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/imx219.yaml
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
 F:	drivers/media/i2c/imx219.c
 
 SONY IMX258 SENSOR DRIVER
@@ -15922,7 +15922,7 @@ M:	Leon Luo <leonl@leopardimaging.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/imx274.yaml
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml
 F:	drivers/media/i2c/imx274.c
 
 SONY IMX290 SENSOR DRIVER
@@ -15930,7 +15930,7 @@ M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/imx290.yaml
+F:	Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
 F:	drivers/media/i2c/imx290.c
 
 SONY IMX319 SENSOR DRIVER
-- 
2.27.0

