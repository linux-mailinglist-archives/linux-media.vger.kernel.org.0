Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40BA3223C7C
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 15:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbgGQNZw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 09:25:52 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:50569 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbgGQNZv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 09:25:51 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id A7B031C0012;
        Fri, 17 Jul 2020 13:25:48 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 06/13] dt-bindings: media: ov5640: Require ep properties
Date:   Fri, 17 Jul 2020 15:28:52 +0200
Message-Id: <20200717132859.237120-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now that the bus-type property has been made mandatory for
the ov5640 bindings, use the property value to mark endpoint
properties as required depending on the data interface in use.

Mark as 'required' all the properties that were defined as required
in the original bindings in textual form. Adjust the example to
comply with validation requirement but do not update the existing
users as most of the required properties will be demoted in the
next patches.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../devicetree/bindings/media/i2c/ov5640.yaml | 41 +++++++++++++++++--
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
index 16e6c2dc629a..8fd54575a1db 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
@@ -110,9 +110,40 @@ properties:
           pclk-sample:
             enum: [0, 1]
 
-        required:
-          - remote-endpoint
-          - bus-type
+        allOf:
+          - if:
+              properties:
+                bus-type:
+                  const: 4
+            then:
+                properties:
+                  bus-width: false
+                  data-shift: false
+                  hsync-active: false
+                  vsync-active: false
+                  pclk-sample: false
+                required:
+                  - remote-endpoint
+                  - bus-type
+                  - clock-lanes
+                  - data-lanes
+
+          - if:
+              properties:
+                bus-type:
+                  const: 5
+            then:
+              properties:
+                clock-lanes: false
+                data-lanes: false
+              required:
+                - remote-endpoint
+                - bus-type
+                - bus-width
+                - data-shift
+                - hsync-active
+                - vsync-active
+                - pclk-sample
 
     additionalProperties: false
 
@@ -179,6 +210,10 @@ examples:
                     remote-endpoint = <&parallel_from_ov5640>;
                     bus-type = <5>;
                     bus-width = <10>;
+                    data-shift = <0>;
+                    hsync-active = <1>;
+                    vsync-active = <1>;
+                    pclk-sample = <1>;
                 };
             };
         };
-- 
2.27.0

