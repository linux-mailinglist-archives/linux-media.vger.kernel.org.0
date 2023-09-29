Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B76A7B367B
	for <lists+linux-media@lfdr.de>; Fri, 29 Sep 2023 17:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233538AbjI2PSv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Sep 2023 11:18:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233524AbjI2PSu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Sep 2023 11:18:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B097F9;
        Fri, 29 Sep 2023 08:18:47 -0700 (PDT)
Received: from uno.localdomain (mob-5-90-203-152.net.vodafone.it [5.90.203.152])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 012F51257;
        Fri, 29 Sep 2023 17:17:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696000623;
        bh=BjVknzxC/ZiIEtXYgSVsi4tl5XfVYSUxx4bGa3XroqM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fnjgEHE7DyfaL6Bs1A/4CZhO4vlA5fFMbQtn0VRURMzrre929/GptQiQqhv8KRV32
         Lkwuf/Y/k3MTJQcI25s6qytaZtLeqe6wMfgKDc0vFhfLFgfEQe705paEV6Ioba4JeE
         0Tk/DrK3BW3+7mGvMP7RQ0X2RYOxgB7PazKToTdo=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>, martink@posteo.de
Subject: [PATCH 1/7] media: bindings: hynix,hi846: Add video-interface-device properties
Date:   Fri, 29 Sep 2023 17:18:19 +0200
Message-ID: <20230929151825.6535-2-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929151825.6535-1-jacopo.mondi@ideasonboard.com>
References: <20230929151825.6535-1-jacopo.mondi@ideasonboard.com>
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

