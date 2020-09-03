Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080E725C199
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 15:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728843AbgICNNe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 09:13:34 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:63503 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728973AbgICNIu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 09:08:50 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 284DE4000C;
        Thu,  3 Sep 2020 13:06:59 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/3] dt-bindings: media: ov772x: Make bus-type mandatory
Date:   Thu,  3 Sep 2020 15:10:28 +0200
Message-Id: <20200903131029.18334-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903131029.18334-1-jacopo+renesas@jmondi.org>
References: <20200903131029.18334-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to establish required properties based on the selected
bus type, make the 'bus-type' property mandatory. As this change
documents an endpoint property, also document the 'remote-endpoint'
one now that the 'endpoint' schema has been expanded.

Binary compatibility with existing DTB is kept as the driver does not
enforce the property to be present, and shall fall-back to default
parallel bus configuration, which was the only supported bus type, if
the property is not specified.

Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/ovti,ov772x.yaml       | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
index e7e2d31fcc23..406e9cd463a2 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
@@ -41,6 +41,25 @@ properties:
     description: |
       Video output port. See ../video-interfaces.txt.
 
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          remote-endpoint:
+            description: See ../video-interfaces.txt
+
+          bus-type:
+            enum: [5, 6]
+
+        required:
+          - remote-endpoint
+          - bus-type
+
+        additionalProperties: false
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -65,6 +84,7 @@ examples:
 
             port {
                 ov772x_0: endpoint {
+                    bus-type = <5>;
                     remote-endpoint = <&vcap1_in0>;
                 };
             };
-- 
2.28.0

