Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F3A7B3E77
	for <lists+linux-media@lfdr.de>; Sat, 30 Sep 2023 07:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233990AbjI3Fvj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Sep 2023 01:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjI3Fvi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Sep 2023 01:51:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF7751AB;
        Fri, 29 Sep 2023 22:51:34 -0700 (PDT)
Received: from uno.lan (unknown [IPv6:2001:861:388f:1650:2f32:b6ff:a885:7d5e])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D508EBA;
        Sat, 30 Sep 2023 07:49:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696052989;
        bh=BjVknzxC/ZiIEtXYgSVsi4tl5XfVYSUxx4bGa3XroqM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=v/goJ6jBsgsxAbZ8tHlS0ZZX+N0AKOKJlbeKs5OGFnMxYFXvR9hmU+w86Gjut+aI0
         Gdp9EqoQ19ZAO3j10RLFYvVo0MulCMuuyHKYj/s3yulAzQ9qZ9PAQXrs6L6T7q9R2c
         H5iPkn2xzwJS3NDe5r5x+GDYjsgzEZjfyDWCXTjA=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>, martink@posteo.de
Subject: [PATCH v2 1/7] media: bindings: hynix,hi846: Add video-interface-device properties
Date:   Sat, 30 Sep 2023 07:51:03 +0200
Message-ID: <20230930055110.1986-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230930055110.1986-1-jacopo.mondi@ideasonboard.com>
References: <20230930055110.1986-1-jacopo.mondi@ideasonboard.com>
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

Allow properties from video-interface-device.yaml for the SK Hynix Hi-846
sensor.

All properties specified in video-interface-device.yaml schema are
valid, so make them accepted by changing "additionalProperties: false"
to "unevaluatedProperties: false" at the schema top-level.

Add two properties from video-interface-device.yaml to the example
to validate the new schema.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
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

