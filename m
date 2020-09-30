Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B67927F33E
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 22:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbgI3UTU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 16:19:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729912AbgI3UTS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 16:19:18 -0400
Received: from hillosipuli.retiisi.eu (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3666C061755;
        Wed, 30 Sep 2020 13:19:18 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id 8B8E2634C8F;
        Wed, 30 Sep 2020 23:19:01 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org
Subject: [RESEND PATCH 024/100] dt-bindings: nokia,smia: Use better active polarity for reset
Date:   Wed, 30 Sep 2020 23:19:12 +0300
Message-Id: <20200930201914.31377-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
References: <20200930201914.31377-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Generally reset signal is active low on camera sensors. The example had it
high. Make it low, and use GPIO_ACTIVE_LOW in gpio.h for that.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml b/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
index 3d6f68b0e559..d7de07e99008 100644
--- a/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/nokia,smia.yaml
@@ -120,6 +120,8 @@ required:
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
+
     i2c2 {
         #address-cells = <1>;
         #size-cells = <0>;
@@ -129,7 +131,7 @@ examples:
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

