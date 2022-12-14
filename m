Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC2264D387
	for <lists+linux-media@lfdr.de>; Thu, 15 Dec 2022 00:38:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiLNXih (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 18:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLNXie (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 18:38:34 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CC930F73;
        Wed, 14 Dec 2022 15:38:32 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8A4B51E;
        Thu, 15 Dec 2022 00:38:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671061111;
        bh=pPYSsDu8ad2QO7G1nzlXnyTcCysun4nQAY2L8tZB7yk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gzZOqOcNsZFSixRaOcq1N0ZhVz0LxVqE/DMOZ45LokU5OrvdOUwRsdYmmRGuYgIGD
         GF0KnnjLwbhtRgn/2Xw9cLXFco1AJ2dksLfm+jluUoJoL5mbijsQCMGzM12z+8bu3x
         E5U1iFE8xJ6NxxmEwT+Uwi52ho4vHJXeOvpTdqGY=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v3 01/12] dt-bindings: media: i2c: max9286: Add support for per-port supplies
Date:   Thu, 15 Dec 2022 01:38:14 +0200
Message-Id: <20221214233825.13050-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20221214233825.13050-1-laurent.pinchart+renesas@ideasonboard.com>
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

Power supplies for the ports can be controlled per port depending on the
hardware design. Support per-port supplies in the DT bindings, mutually
exclusive with the global supply.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v2:

- Make maxim,gpio-poc and port[0-3]-poc-supply mutually exclusive

Changes since v1:

- Simplify mutual exclusion condition
---
 .../bindings/media/i2c/maxim,max9286.yaml     | 35 +++++++++++++------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 90315e217003..4f28690eabcd 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -39,7 +39,7 @@ properties:
     maxItems: 1
 
   poc-supply:
-    description: Regulator providing Power over Coax to the cameras
+    description: Regulator providing Power over Coax to all the ports
 
   enable-gpios:
     description: GPIO connected to the \#PWDN pin with inverted polarity
@@ -182,21 +182,36 @@ properties:
 
             additionalProperties: false
 
+patternProperties:
+  "^port[0-3]-poc-supply$":
+    description: Regulator providing Power over Coax for a particular port
+
 required:
   - compatible
   - reg
   - ports
   - i2c-mux
 
-# If 'maxim,gpio-poc' is present, then 'poc-supply' and 'gpio-controller'
-# are not allowed.
-if:
-  required:
-    - maxim,gpio-poc
-then:
-  properties:
-    poc-supply: false
-    gpio-controller: false
+allOf:
+  # Only one way of specifying power supplies is allowed: 'maxim,gpio-poc',
+  # 'poc-supply' or per-port poc-supply. Additionally, if 'maxim,gpio-poc' is
+  # present, then 'gpio-controller' isn't allowed.
+  - if:
+      required:
+        - maxim,gpio-poc
+    then:
+      properties:
+        poc-supply: false
+        gpio-controller: false
+      patternProperties:
+        "^port[0-3]-poc-supply$": false
+
+  - if:
+      required:
+        - poc-supply
+    then:
+      patternProperties:
+        "^port[0-3]-poc-supply$": false
 
 additionalProperties: false
 
-- 
Regards,

Laurent Pinchart

