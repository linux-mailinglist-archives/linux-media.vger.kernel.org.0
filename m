Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD5892472C9
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 20:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403799AbgHQSr3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 14:47:29 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:53375 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388031AbgHQPzl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 11:55:41 -0400
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9049F24000F;
        Mon, 17 Aug 2020 15:55:37 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: media: ov772x: Make bus-type mandatory
Date:   Mon, 17 Aug 2020 17:59:09 +0200
Message-Id: <20200817155910.255883-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200817155910.255883-1-jacopo+renesas@jmondi.org>
References: <20200817155910.255883-1-jacopo+renesas@jmondi.org>
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

