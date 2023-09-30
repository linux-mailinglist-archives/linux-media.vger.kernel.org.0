Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C0A7B3E80
	for <lists+linux-media@lfdr.de>; Sat, 30 Sep 2023 07:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234018AbjI3Fvq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Sep 2023 01:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233996AbjI3Fvp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Sep 2023 01:51:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B7F81B0;
        Fri, 29 Sep 2023 22:51:43 -0700 (PDT)
Received: from uno.lan (unknown [IPv6:2001:861:388f:1650:2f32:b6ff:a885:7d5e])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA62034B5;
        Sat, 30 Sep 2023 07:49:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696052992;
        bh=yDNG9lescimiVCdDa3Yo4ag2EPpuBl4frfIL53tgkIs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LGdsQXmpyUATGraqc1ONXvpIhFg7B2ws6fztl8u99KdFb4JAW1YOrII1WvtVMVzO4
         xCXpc/UOFQJMIxtQTadzcW6blU+/BTrzyCYuAmQzJ8RmXrEMF/n5RXfmowAYwjAuMQ
         rHi4pfSXFml6wz/Yt5h7Y40mJTABWW0NUDE8eTC4=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>, martink@posteo.de,
        Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v2 7/7] media: bindings: sony,imx415: Fix handling of video-interface-device
Date:   Sat, 30 Sep 2023 07:51:09 +0200
Message-ID: <20230930055110.1986-8-jacopo.mondi@ideasonboard.com>
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

Fix handling of properties from video-interface-device.yaml for
Sony IMX415.

All the properties described by video-interface-device.yaml are
allowed for the image sensor, make them accepted by changing
"additionalProperties: false" to "unevaluatedProperties: false" at the
schema top-level.

Because all properties are now accepted, there is no need to explicitly
allow them in the schema.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../devicetree/bindings/media/i2c/sony,imx415.yaml     | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
index ffccf5f3c9e3..8ea3ddd251f6 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
@@ -44,14 +44,6 @@ properties:
     description: Sensor reset (XCLR) GPIO
     maxItems: 1

-  flash-leds: true
-
-  lens-focus: true
-
-  orientation: true
-
-  rotation: true
-
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base

@@ -88,7 +80,7 @@ required:
   - ovdd-supply
   - port

-additionalProperties: false
+unevaluatedProperties: false

 examples:
   - |
--
2.42.0

