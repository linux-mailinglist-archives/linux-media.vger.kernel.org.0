Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CCADD48281E
	for <lists+linux-media@lfdr.de>; Sat,  1 Jan 2022 19:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232632AbiAAS2Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jan 2022 13:28:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230259AbiAAS2Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jan 2022 13:28:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8145C06173E;
        Sat,  1 Jan 2022 10:28:15 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03632DA1;
        Sat,  1 Jan 2022 19:28:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641061693;
        bh=8HNqwyQBZrSAUREx3ZKUMsJ6GEjIA4WkM1zBeIzYArs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sP0ZDeUQJtjhrMnlIhh1VEW/XVwVhRbk8gZSYGdp9lFiLwuLDQXq1QErd+YRwp/Vf
         XIIGY4rudBIqZy/+akbsoThOtr0BPFiOSaz/dQKleErg/99uWckFSpWjpI5s1R+wTE
         KWTJmny6+MbZbpdCAjbH2D61jmmRmATeqrWAFKrY=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v2 01/11] dt-bindings: media: i2c: max9286: Add support for per-port supplies
Date:   Sat,  1 Jan 2022 20:27:56 +0200
Message-Id: <20220101182806.19311-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Power supplies for the ports can be controlled per port depending on the
hardware design. Support per-port supplies in the DT bindings, mutually
exclusive with the global supply.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Simplify mutual exclusion condition
---
 .../bindings/media/i2c/maxim,max9286.yaml          | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 02f656e78700..c20557b52e45 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -39,7 +39,7 @@ properties:
     maxItems: 1
 
   poc-supply:
-    description: Regulator providing Power over Coax to the cameras
+    description: Regulator providing Power over Coax to all the ports
 
   enable-gpios:
     description: GPIO connected to the \#PWDN pin with inverted polarity
@@ -160,6 +160,10 @@ properties:
 
             additionalProperties: false
 
+patternProperties:
+  "^port[0-3]-poc-supply$":
+    description: Regulator providing Power over Coax for a particular port
+
 required:
   - compatible
   - reg
@@ -167,6 +171,14 @@ required:
   - i2c-mux
   - gpio-controller
 
+allOf:
+  - if:
+      required:
+        - poc-supply
+    then:
+      patternProperties:
+        "^port[0-3]-poc-supply$": false
+
 additionalProperties: false
 
 examples:
-- 
Regards,

Laurent Pinchart

