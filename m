Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C7727F342
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 22:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730470AbgI3UTT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 16:19:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730453AbgI3UTT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 16:19:19 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B556DC0613D0;
        Wed, 30 Sep 2020 13:19:18 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 9D1DB634C90;
        Wed, 30 Sep 2020 23:19:01 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [RESEND PATCH 025/100] dt-bindings: nokia,smia: Amend SMIA bindings with MIPI CCS support
Date:   Wed, 30 Sep 2020 23:19:13 +0300
Message-Id: <20200930201914.31377-7-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
References: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Amend the existing SMIA bindings by adding MIPI CCS support. Besides the
compatible string, two new regulator supplies are added. Rename the old
bindings accordingly as CCS is the current standard.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 .../i2c/{nokia,smia.yaml => mipi,ccs.yaml}     | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/media/i2c/{nokia,smia.yaml => mipi,ccs.yaml} (89%)

diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml b/Documentation/devicetree/bindings/media/i2c/mipi,ccs.yaml
similarity index 89%
rename from Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
rename to Documentation/devicetree/bindings/media/i2c/mipi,ccs.yaml
index d7de07e99008..6ac01ec8610c 100644
--- a/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/mipi,ccs.yaml
@@ -1,26 +1,32 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 # Copyright (C) 2014--2020 Intel Corporation
 
-$id: http://devicetree.org/schemas/media/i2c/nokia,smia.yaml#
+$id: http://devicetree.org/schemas/media/i2c/mipi,ccs.yaml#
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
+      - const: mipi,ccs
+      - const: nokia,smia
 
   reg:
     maxItems: 1
@@ -129,7 +135,7 @@ examples:
         clock-frequency = <400000>;
 
         camera-sensor@10 {
-            compatible = "nokia,smia";
+            compatible = "mipi,ccs";
             reg = <0x10>;
             reset-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
             vana-supply = <&vaux3>;
@@ -137,7 +143,7 @@ examples:
             clock-frequency = <9600000>;
             nokia,nvm-size = <512>; /* 8 * 64 */
             port {
-                smiapp_ep: endpoint {
+                ccs_ep: endpoint {
                     data-lanes = <1 2>;
                     remote-endpoint = <&csi2a_ep>;
                     link-frequencies = /bits/ 64 <199200000 210000000
-- 
2.27.0

