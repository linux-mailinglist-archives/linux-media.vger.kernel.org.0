Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A543264B15
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 19:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725820AbgIJRVN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 13:21:13 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:41143 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgIJQRm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 12:17:42 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id BAF0BC0009;
        Thu, 10 Sep 2020 16:17:27 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 2/3] dt-bindings: media: ov772x: Make bus-type mandatory
Date:   Thu, 10 Sep 2020 18:20:54 +0200
Message-Id: <20200910162055.614089-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910162055.614089-1-jacopo+renesas@jmondi.org>
References: <20200910162055.614089-1-jacopo+renesas@jmondi.org>
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
 .../bindings/media/i2c/ovti,ov772x.yaml          | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
index e7e2d31fcc23..b034953b92e9 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
@@ -41,6 +41,21 @@ properties:
     description: |
       Video output port. See ../video-interfaces.txt.
 
+    properties:
+      endpoint:
+        type: object
+
+        properties:
+          bus-type:
+            enum: [5, 6]
+
+        required:
+          - bus-type
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -65,6 +80,7 @@ examples:
 
             port {
                 ov772x_0: endpoint {
+                    bus-type = <5>;
                     remote-endpoint = <&vcap1_in0>;
                 };
             };
-- 
2.28.0

