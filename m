Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA7625C1A8
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 15:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbgICNNO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 09:13:14 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:65055 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728984AbgICNJc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 09:09:32 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id C6F9C40026;
        Thu,  3 Sep 2020 13:07:03 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 3/3] dt-bindings: media: ov772x: Document endpoint props
Date:   Thu,  3 Sep 2020 15:10:29 +0200
Message-Id: <20200903131029.18334-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903131029.18334-1-jacopo+renesas@jmondi.org>
References: <20200903131029.18334-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document endpoint properties for the parallel bus type and
add them to the example.

Specify a few constraints:
- If the bus type is BT.656 no hsync or vsycn polarities can be
  specified.
- If the bus width is 10 bits, not data-shift can be applied.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/ovti,ov772x.yaml       | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
index 406e9cd463a2..c596cbd1e92d 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
@@ -52,6 +52,45 @@ properties:
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
           - remote-endpoint
           - bus-type
@@ -85,6 +124,11 @@ examples:
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

