Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D088477FE0
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 23:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241340AbhLPWJ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Dec 2021 17:09:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241200AbhLPWJ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Dec 2021 17:09:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC746C061574;
        Thu, 16 Dec 2021 14:09:56 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04913E81;
        Thu, 16 Dec 2021 23:09:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639692594;
        bh=cYghdh4AN8QY6h+Eugs5hQv7HOr+gZQ9M/R9C4ey45s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oelm3eT+6pKyPe3YiVRSllPWUfXp7TuNwqQ/9P0mI67aDuuKHVPwKpVaWVGZx0grH
         9UH1VsuUa1wHr12QVU7S3DS67juFQHsCKu+NjoFbD4YWMOz9d4UFK66AlOkJvGPF8j
         rfmb/0uydDAeEK3E4DRO1RD9xGapv3MwWRzWQpc4=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/3] dt-bindings: media: i2c: max9286: Add support for per-port supplies
Date:   Fri, 17 Dec 2021 00:09:44 +0200
Message-Id: <20211216220946.20771-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216220946.20771-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20211216220946.20771-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Power supplies for the ports can be controlled per port depending on the
hardware design. Support per-port supplies in the DT bindings, mutually
exclusive with the global supply.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/media/i2c/maxim,max9286.yaml     | 25 ++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index 02f656e78700..33aa307e8ee5 100644
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
@@ -167,6 +171,25 @@ required:
   - i2c-mux
   - gpio-controller
 
+allOf:
+  - if:
+      required:
+        - poc-supply
+    then:
+      allOf:
+        - not:
+            required:
+              - port0-poc-supply
+        - not:
+            required:
+              - port1-poc-supply
+        - not:
+            required:
+              - port2-poc-supply
+        - not:
+            required:
+              - port3-poc-supply
+
 additionalProperties: false
 
 examples:
-- 
Regards,

Laurent Pinchart

