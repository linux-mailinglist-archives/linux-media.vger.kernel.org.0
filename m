Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58AFE2C634A
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 11:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729311AbgK0KiO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 05:38:14 -0500
Received: from retiisi.eu ([95.216.213.190]:44910 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729246AbgK0KiM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 05:38:12 -0500
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 18604634CC1;
        Fri, 27 Nov 2020 12:37:18 +0200 (EET)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org
Subject: [PATCH v2 26/29] dt-bindings: nokia,smia: Use better active polarity for reset
Date:   Fri, 27 Nov 2020 12:33:22 +0200
Message-Id: <20201127103325.29814-27-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201127103325.29814-1-sakari.ailus@linux.intel.com>
References: <20201127103325.29814-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Generally reset signal is active low on camera sensors. The example had it
high. Make it low, and use GPIO_ACTIVE_LOW in gpio.h for that.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml b/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
index ee552489fa2b..47df08338a42 100644
--- a/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
@@ -80,6 +80,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+
     i2c2 {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -89,7 +91,7 @@ examples:
         camera-sensor@10 {
             compatible = "nokia,smia";
             reg = <0x10>;
-            reset-gpios = <&gpio3 20 0>;
+            reset-gpios = <&gpio3 20 GPIO_ACTIVE_LOW>;
             vana-supply = <&vaux3>;
             clocks = <&omap3_isp 0>;
             clock-frequency = <9600000>;
-- 
2.27.0

