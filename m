Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF4E264AFE
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 19:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgIJRTz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 13:19:55 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:35013 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726761AbgIJQRm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 12:17:42 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 10637C0019;
        Thu, 10 Sep 2020 16:17:29 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 3/3] dt-bindings: media: ov772x: Document endpoint props
Date:   Thu, 10 Sep 2020 18:20:55 +0200
Message-Id: <20200910162055.614089-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910162055.614089-1-jacopo+renesas@jmondi.org>
References: <20200910162055.614089-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document endpoint properties for the parallel bus type and
add them to the example.

Specify a few constraints:
- If the bus type is BT.656 no hsync or vsync polarities can be
  specified.
- If the bus width is 10 bits, not data-shift can be applied.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/ovti,ov772x.yaml       | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
index b034953b92e9..63b3779d7289 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
@@ -49,6 +49,45 @@ properties:
           bus-type:
             enum: [5, 6]
 
+          bus-width:
+            enum: [8, 10]
+            default: 10
+
+          data-shift:
+            enum: [0, 2]
+            default: 0
+
+          hsync-active:
+            enum: [0, 1]
+            default: 1
+
+          vsync-active:
+            enum: [0, 1]
+            default: 1
+
+          pclk-sample:
+            enum: [0, 1]
+            default: 1
+
+        allOf:
+          - if:
+              properties:
+                bus-type:
+                  const: 6
+            then:
+                properties:
+                  hsync-active: false
+                  vsync-active: false
+
+          - if:
+              properties:
+                bus-width:
+                  const: 10
+            then:
+                properties:
+                  data-shift:
+                    const: 0
+
         required:
           - bus-type
 
@@ -81,6 +120,11 @@ examples:
             port {
                 ov772x_0: endpoint {
                     bus-type = <5>;
+                    vsync-active = <0>;
+                    hsync-active = <0>;
+                    pclk-sample = <0>;
+                    bus-width = <8>;
+                    data-shift = <0>;
                     remote-endpoint = <&vcap1_in0>;
                 };
             };
-- 
2.28.0

