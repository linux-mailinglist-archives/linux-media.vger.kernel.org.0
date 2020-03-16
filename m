Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 674E9187402
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 21:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732566AbgCPUZW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 16:25:22 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:54871 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732556AbgCPUZW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 16:25:22 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 5729EFF803;
        Mon, 16 Mar 2020 20:25:19 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, hyunk@xilinx.com,
        manivannan.sadhasivam@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: media: max9286: Add reverse channel amplitude
Date:   Mon, 16 Mar 2020 21:27:56 +0100
Message-Id: <20200316202757.529740-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
References: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX9286 chip exposes registers to control the reverse channel
amplitude signal. The channel amplitude has to be configured according
to the connected remote serializer settings, in order to guarantee
reliable communications.

Serializer might be pre-programmed and initialize with their reverse
channel noise threshold level increased. While this is intended to
increase the signal/noise immunity ratio on the channel, the
deserializer should be initialized accordingly, with its channel
amplitude increased to 170mV.

Add to the bindings documentation a required property to allow DTS users
to specify the initial setting of the deserializer reverse channel and
accommodate different serializer models.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/maxim,max9286.yaml     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index ee8e0418b3f0..a1c56734a727 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -54,6 +54,25 @@ properties:
     allOf:
       - $ref: /schemas/types.yaml#/definitions/uint32
 
+  maxim,reverse-channel-amplitude:
+    description: |
+      The reverse channel amplitude initial value, in milliVolts. If the remote
+      serializer is pre-programmed with an high reverse channel noise threshold,
+      the deserializer channel amplitude shall initially be increased to 170mV
+      to allow the two to communicate reliably. Likewise, if the remote
+      serializer probes without an increased reverse channel noise threshold,
+      the deserializer initial reverse channel amplitude should be set to 100mV
+      to be later increased to 170mV after serializers have increased their
+      reverse channel noise threshold.
+    maxItems: 1
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+    # The property can be easily expanded to support more values if needed,
+    # but that's what's supported today by the driver.
+    oneOf:
+      - const: 100
+      - const: 170
+
   ports:
     type: object
     description: |
@@ -155,6 +174,7 @@ required:
   - compatible
   - reg
   - maxim,overlap-window
+  - maxim,reverse-channel-amplitude
   - ports
   - i2c-mux
 
@@ -177,6 +197,7 @@ examples:
         poc-supply = <&camera_poc_12v>;
         enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
         maxim,overlap-window = MAX9286_OVLP_WINDOW_DISABLED;
+        maxim,reverse-channel-amplitude = <170>;
 
         ports {
           #address-cells = <1>;
-- 
2.25.1

