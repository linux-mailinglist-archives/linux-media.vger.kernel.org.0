Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D617D24849F
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 14:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgHRMQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 08:16:45 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:49015 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbgHRMQn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 08:16:43 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 932686000D;
        Tue, 18 Aug 2020 12:16:39 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: media: ov772x: Make bus-type mandatory
Date:   Tue, 18 Aug 2020 14:20:11 +0200
Message-Id: <20200818122012.37956-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
References: <20200818122012.37956-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to establish required properties based on the selected
bus type, make the 'bus-type' property mandatory.

Binary compatibility with existing DTB is kept as the driver does not
enforce the property to be present, and shall fall-back to default
parallel bus configuration, which was the only supported bus type, if
the property is not specified.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ov772x.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
index 2b84fefeb4aa..75dad40f70cc 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov772x.yaml
@@ -47,9 +47,15 @@ properties:
       endpoint:
         type: object
         properties:
+          bus-type:
+            enum: [5, 6]
+
           remote-endpoint:
             description: A phandle to the bus receiver's endpoint node.
 
+        required:
+          - bus-type
+
     additionalProperties: false
 
 required:
@@ -75,6 +81,7 @@ examples:
 
             port {
                 ov772x_0: endpoint {
+                    bus-type = <5>;
                     remote-endpoint = <&vcap1_in0>;
                 };
             };
-- 
2.27.0

