Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E90B37BB7E9
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 14:41:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbjJFMla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 08:41:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbjJFMl2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 08:41:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE21C2;
        Fri,  6 Oct 2023 05:41:27 -0700 (PDT)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 287FA735;
        Fri,  6 Oct 2023 14:39:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696595979;
        bh=xggG4fvPbSUvd8gh/vUITkMiDMzHK6EMQ2xapkp76wA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pGsqzCCk2fjIPThkC3Hr0Cv/R1VsM1RijmkIVBipg13cH/br2nattBF+1W3JD0OgB
         cEXIbcMojds6UPcq71stAQ0WbvoDPMBr2E/ZnGDrHgQe2Y+kdwP7wqHzZAK7O5kPQl
         1HOiYlHCn6run+IN4y3d8ujWY04K3J0qMZ2JxBP8=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>, martink@posteo.de,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/6] media: dt-bindings: hynix,hi846: Add video-interface-devices properties
Date:   Fri,  6 Oct 2023 14:40:56 +0200
Message-ID: <20231006124101.181555-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006124101.181555-1-jacopo.mondi@ideasonboard.com>
References: <20231006124101.181555-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allow properties from video-interface-devices.yaml for the SK Hynix Hi-846
sensor.

All properties specified in video-interface-devices.yaml schema are
valid, so make them accepted by changing "additionalProperties: false"
to "unevaluatedProperties: false" at the schema top-level.

Add two properties from video-interface-devices.yaml to the example
to validate the new schema.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/hynix,hi846.yaml         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
index 1e2df8cf2937..60f19e1152b3 100644
--- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
@@ -14,6 +14,9 @@ description: |-
   interface and CCI (I2C compatible) control bus. The output format
   is raw Bayer.
 
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     const: hynix,hi846
@@ -86,7 +89,7 @@ required:
   - vddd-supply
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
@@ -109,6 +112,8 @@ examples:
             vddio-supply = <&reg_camera_vddio>;
             reset-gpios = <&gpio1 25 GPIO_ACTIVE_LOW>;
             shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_LOW>;
+            orientation = <0>;
+            rotation = <0>;
 
             port {
                 camera_out: endpoint {
-- 
2.42.0

