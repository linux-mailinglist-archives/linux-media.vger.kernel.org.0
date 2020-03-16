Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8D41873FE
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 21:25:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732559AbgCPUZS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 16:25:18 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:56109 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732556AbgCPUZS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 16:25:18 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9EBCEFF804;
        Mon, 16 Mar 2020 20:25:15 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, hyunk@xilinx.com,
        manivannan.sadhasivam@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/5] dt-bindings: media: max9286: Add overlap window
Date:   Mon, 16 Mar 2020 21:27:54 +0100
Message-Id: <20200316202757.529740-3-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
References: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX9286 chip exposes a way to control the 'overlap window'
parameter, most probably used in calculation of the frame
synchronization interval.

When used in conjunction with some serializers, the overlap window has to
be disabled in order to correctly achieve frame sync locking.

As the exact meaning of that control is not documented in the chip's
manual, require all DTS users to specify the value of the window. When,
and if, in future the meaning of control gets clarified and a default
behaviour (window enabled or disabled) can be established, a new boolean
property could supersede this one while being sure that older DTB are
fully specified to avoid confusion.

Provide a few convenience macros for the window disabled and window
default value.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../devicetree/bindings/media/i2c/maxim,max9286.yaml  | 11 +++++++++++
 MAINTAINERS                                           |  1 +
 include/dt-bindings/media/maxim-gmsl.h                |  9 +++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 include/dt-bindings/media/maxim-gmsl.h

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index f9d3e5712c59..ee8e0418b3f0 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -46,6 +46,14 @@ properties:
     description: GPIO connected to the \#PWDN pin with inverted polarity
     maxItems: 1
 
+  # Until the overlap window control gets not clarified, require dts
+  # to set its value explicitly,
+  maxim,overlap-window:
+    description: Overlap window duration, in pixel clock cycles.
+    maxItems: 1
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32
+
   ports:
     type: object
     description: |
@@ -146,6 +154,7 @@ properties:
 required:
   - compatible
   - reg
+  - maxim,overlap-window
   - ports
   - i2c-mux
 
@@ -154,6 +163,7 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/media/maxim-gmsl.h>
 
     i2c@e66d8000 {
       #address-cells = <1>;
@@ -166,6 +176,7 @@ examples:
         reg = <0x2c>;
         poc-supply = <&camera_poc_12v>;
         enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
+        maxim,overlap-window = MAX9286_OVLP_WINDOW_DISABLED;
 
         ports {
           #address-cells = <1>;
diff --git a/MAINTAINERS b/MAINTAINERS
index 21a9ff4fe684..3d2455085c80 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10190,6 +10190,7 @@ M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+F:	include/dt-bindings/media/maxim-gmsl.h
 F:	drivers/media/i2c/max9286.c
 
 MAX9860 MONO AUDIO VOICE CODEC DRIVER
diff --git a/include/dt-bindings/media/maxim-gmsl.h b/include/dt-bindings/media/maxim-gmsl.h
new file mode 100644
index 000000000000..47945ffc3a4d
--- /dev/null
+++ b/include/dt-bindings/media/maxim-gmsl.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _DT_BINDINGS_MEDIA_MAXIM_GMSL_H
+#define _DT_BINDINGS_MEDIA_MAXIM_GMSL_H
+
+/* MAX9286 default overlap values. */
+#define MAX9286_OVLP_WINDOW_DISABLED	<0>
+#define MAX9286_OVLP_WINDOW_DEFAULT	<0x1680>
+
+#endif /* _DT_BINDINGS_MEDIA_MAXIM_GMSL_H */
-- 
2.25.1

