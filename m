Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD4E2C6346
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 11:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729299AbgK0KiN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 05:38:13 -0500
Received: from retiisi.eu ([95.216.213.190]:44942 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729248AbgK0KiN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 05:38:13 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 2FCFF634CCA;
        Fri, 27 Nov 2020 12:37:18 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 27/29] dt-bindings: nokia,smia: Amend SMIA bindings with MIPI CCS support
Date:   Fri, 27 Nov 2020 12:33:23 +0200
Message-Id: <20201127103325.29814-28-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127103325.29814-1-sakari.ailus@linux.intel.com>
References: <20201127103325.29814-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Amend the existing SMIA bindings by adding MIPI CCS support, with separate
compatible strings for CCS 1.0 and CCS 1.1. Rename the old bindings
accordingly as CCS is the current standard.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../i2c/{nokia,smia.yaml => mipi-ccs.yaml}    | 23 ++++++++++++++-----
 MAINTAINERS                                   |  2 +-
 2 files changed, 18 insertions(+), 7 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{nokia,smia.yaml => mipi-ccs.yaml} (81%)

diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
similarity index 81%
rename from Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
rename to Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
index 47df08338a42..a386ee246956 100644
--- a/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
@@ -1,26 +1,37 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 # Copyright (C) 2014--2020 Intel Corporation
 
-$id: http://devicetree.org/schemas/media/i2c/nokia,smia.yaml#
+$id: http://devicetree.org/schemas/media/i2c/mipi-ccs.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: SMIA/SMIA++ sensor
+title: MIPI CCS, SMIA++ and SMIA compliant camera sensors
 
 maintainers:
   - Sakari Ailus <sakari.ailus@linux.intel.com>
 
 description:
 
+  CCS (Camera Command Set) is a raw Bayer camera sensor standard defined by the
+  MIPI Alliance; see
+  <URL:https://www.mipi.org/specifications/camera-command-set>.
+
   SMIA (Standard Mobile Imaging Architecture) is an image sensor standard
   defined jointly by Nokia and ST. SMIA++, defined by Nokia, is an extension of
-  that. These definitions are valid for both types of sensors.
+  that.
 
   More detailed documentation can be found in
   Documentation/devicetree/bindings/media/video-interfaces.txt .
 
 properties:
   compatible:
-    const: nokia,smia
+    oneOf:
+      - items:
+        - const: mipi-ccs-1.1
+        - const: mipi-ccs
+      - items:
+        - const: mipi-ccs-1.0
+        - const: mipi-ccs
+      - const: nokia,smia
 
   reg:
     maxItems: 1
@@ -89,14 +100,14 @@ examples:
         clock-frequency = <400000>;
 
         camera-sensor@10 {
-            compatible = "nokia,smia";
+            compatible = "mipi-ccs-1.0", "mipi-ccs";
             reg = <0x10>;
             reset-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
             vana-supply = <&vaux3>;
             clocks = <&omap3_isp 0>;
             clock-frequency = <9600000>;
             port {
-                smiapp_ep: endpoint {
+                ccs_ep: endpoint {
                     data-lanes = <1 2>;
                     remote-endpoint = <&csi2a_ep>;
                     link-frequencies = /bits/ 64 <199200000 210000000
diff --git a/MAINTAINERS b/MAINTAINERS
index 17be5c0e532e..75db4b32fc8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11666,7 +11666,7 @@ MIPI CCS, SMIA AND SMIA++ IMAGE SENSOR DRIVER
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
+F:	Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml
 F:	Documentation/driver-api/media/drivers/ccs/
 F:	drivers/media/i2c/ccs/
 F:	drivers/media/i2c/smiapp-pll.c
-- 
2.27.0

