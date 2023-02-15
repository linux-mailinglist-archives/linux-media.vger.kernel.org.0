Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17CB46987D5
	for <lists+linux-media@lfdr.de>; Wed, 15 Feb 2023 23:30:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbjBOWaM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Feb 2023 17:30:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbjBOWaK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Feb 2023 17:30:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC0530295;
        Wed, 15 Feb 2023 14:30:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1C286465;
        Wed, 15 Feb 2023 23:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676500207;
        bh=l+clC6WIppIJdkCBIFOcnTMxtLFtXa5ptPUjSCQRiZ4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U/cZOqn09RWcTPw8LO0MZWS56McRlW+Zyts/7YX5FTOYiq5D29bM4k9OJJ9JKROLy
         bn0b65T4wnwUutMQN9DmotSA9WVucuyTdpQSU/IMyrQm68trIiVar+0zrixFC91AIE
         D7aeVYxumT4p3tmtoCNNKbE+EWF9vOoJoC/vseAI=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 01/15] media: dt-bindings: media: i2c: Add mono version to IMX290 bindings
Date:   Thu, 16 Feb 2023 00:29:49 +0200
Message-Id: <20230215223003.30170-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
References: <20230215223003.30170-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The IMX290 module is available as either monochrome or colour and
the variant is not detectable at runtime.

Add a new compatible string for the monochrome version, based on the
full device name IMX290LLR. For consistency, add a new compatible string
for the colour version based on the IMX290LQR full device name, and
deprecate the current ambiguous compatible string.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v2:

- Deprecate the sony,imx290 compatible
- Update the example to use the new sony,imx290lqr compatible.
---
 .../bindings/media/i2c/sony,imx290.yaml       | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
index 21377daae026..cafb6e1a7150 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -12,15 +12,25 @@ maintainers:
 
 description: |-
   The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with Square
-  Pixel for Color Cameras. It is programmable through I2C and 4-wire
-  interfaces. The sensor output is available via CMOS logic parallel SDR
-  output, Low voltage LVDS DDR output and CSI-2 serial data output. The CSI-2
-  bus is the default. No bindings have been defined for the other busses.
+  Pixel, available in either mono or colour variants. It is programmable
+  through I2C and 4-wire interfaces.
+
+  The sensor output is available via CMOS logic parallel SDR output, Low voltage
+  LVDS DDR output and CSI-2 serial data output. The CSI-2 bus is the default.
+  No bindings have been defined for the other busses.
+
+  imx290lqr is the full model identifier for the colour variant. "sony,imx290"
+  is treated the same as this as it was the original compatible string.
+  imx290llr is the mono version of the sensor.
 
 properties:
   compatible:
-    enum:
-      - sony,imx290
+    oneOf:
+      - enum:
+          - sony,imx290lqr # Colour
+          - sony,imx290llr # Monochrome
+      - const: sony,imx290
+        deprecated: true
 
   reg:
     maxItems: 1
@@ -101,7 +111,7 @@ examples:
         #size-cells = <0>;
 
         imx290: camera-sensor@1a {
-            compatible = "sony,imx290";
+            compatible = "sony,imx290lqr";
             reg = <0x1a>;
 
             pinctrl-names = "default";
-- 
Regards,

Laurent Pinchart

