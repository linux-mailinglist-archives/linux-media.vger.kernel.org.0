Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE767BB7EC
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 14:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232051AbjJFMld (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 08:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbjJFMlc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 08:41:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B75A7C2;
        Fri,  6 Oct 2023 05:41:30 -0700 (PDT)
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 318544DB;
        Fri,  6 Oct 2023 14:39:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696595982;
        bh=Z2E+lLxkhJ/LGAEk/ZGbWDkgolYmGM9D65b2ycGe46c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nd7Jfr+ymvily2SeLz7yKcUTO8IE7F2HocOgnAxTppA1jya5nNnGme4EQOLCgFZ+w
         2lrYyCymq9m1yYrJqYUqFlhFTVRdik6krLbIjZo25Zg5ydRYRN9oAXbEu7OhVaUOYK
         MMC90eHeTIZblfALmbIcSOi515EtmMs2LncHLA3Y=
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabio Estevam <festevam@gmail.com>, martink@posteo.de,
        Mikhail Rudenko <mike.rudenko@gmail.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 3/6] media: dt-bindings: ovti,ov4689: Allow props from video-interface-devices
Date:   Fri,  6 Oct 2023 14:40:58 +0200
Message-ID: <20231006124101.181555-4-jacopo.mondi@ideasonboard.com>
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

All the properties described by video-interface-devices.yaml are
allowed for the image sensor, make them accepted by changing
"additionalProperties: false" to "unevaluatedProperties: false" at the
schema top-level.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/i2c/ovti,ov4689.yaml          | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
index 50579c947f3c..d96199031b66 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov4689.yaml
@@ -52,10 +52,6 @@ properties:
     description:
       GPIO connected to the reset pin (active low)

-  orientation: true
-
-  rotation: true
-
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     additionalProperties: false
@@ -95,7 +91,7 @@ required:
   - dvdd-supply
   - port

-additionalProperties: false
+unevaluatedProperties: false

 examples:
   - |
--
2.42.0

