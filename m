Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77413204EBF
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 12:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732178AbgFWKFO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 06:05:14 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:36793 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732005AbgFWKFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 06:05:13 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A8BE4C000A;
        Tue, 23 Jun 2020 10:05:08 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mrodin@de.adit-jv.com,
        hugues.fruchet@st.com, mripard@kernel.org, aford173@gmail.com,
        sudipi@jp.adit-jv.com, andrew_gabbasov@mentor.com,
        erosca@de.adit-jv.com, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Subject: [PATCH 01/25] dt-bindings: media: ov5647: Document pwdn-gpios
Date:   Tue, 23 Jun 2020 12:07:51 +0200
Message-Id: <20200623100815.10674-2-jacopo@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623100815.10674-1-jacopo@jmondi.org>
References: <20200623100815.10674-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document in dt-schema bindings for the ov5647 sensor the optional
'pwdn-gpios' property.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 Documentation/devicetree/bindings/media/i2c/ov5647.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
index 067e222e0c7c3..58d64a69e9640 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ov5647.yaml
@@ -25,6 +25,10 @@ properties:
     description: Reference to the xclk clock
     maxItems: 1
 
+  pwdn-gpios:
+    description: Reference to the GPIO connected to the pwdn pin. Active high.
+    maxItems: 1
+
   port:
     type: object
     description: |-
@@ -61,6 +65,7 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
 
     i2c {
         #address-cells = <1>;
@@ -70,6 +75,7 @@ examples:
             compatible = "ovti,ov5647";
             reg = <0x36>;
             clocks = <&camera_clk>;
+            pwdn-gpios = <&pioE 29 GPIO_ACTIVE_HIGH>;
 
             port {
                 camera_out: endpoint {
-- 
2.27.0

