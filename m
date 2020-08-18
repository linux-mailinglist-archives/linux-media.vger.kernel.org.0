Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377A32484A1
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 14:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgHRMQs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 08:16:48 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:55021 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726682AbgHRMQq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 08:16:46 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 45BF76000C;
        Tue, 18 Aug 2020 12:16:42 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/3] dt-bindings: media: ov772x: Document endpoint props
Date:   Tue, 18 Aug 2020 14:20:12 +0200
Message-Id: <20200818122012.37956-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
References: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
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

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../devicetree/bindings/media/i2c/ov772x.yaml | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
index 75dad40f70cc..3fad5dffd19a 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
@@ -50,9 +50,47 @@ properties:
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
           remote-endpoint:
             description: A phandle to the bus receiver's endpoint node.

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
         required:
           - bus-type

@@ -82,6 +120,11 @@ examples:
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
2.27.0

