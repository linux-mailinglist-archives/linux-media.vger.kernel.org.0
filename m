Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39895223C74
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 15:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgGQNZo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 09:25:44 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:60637 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbgGQNZn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 09:25:43 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id F1DA71C0012;
        Fri, 17 Jul 2020 13:25:40 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org, bparrot@ti.com
Subject: [PATCH 04/13] dt-bindings: media: ti,cal: Remove sensor from example
Date:   Fri, 17 Jul 2020 15:28:50 +0200
Message-Id: <20200717132859.237120-5-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The newly introduced dt-schema bindings for the ov5640 image
sensor triggered a warning in the ti,cal.yaml bindings file, which
has a camera sensor node marked compatible with the sensor.

As in the example is enough to report a node for the device that
the bindings is about, and maintaining the sensor node up-to-date
is a non-necessary burden, remove the image sensor node from the
ti,cal bindings file.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../devicetree/bindings/media/ti,cal.yaml     | 22 -------------------
 1 file changed, 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/ti,cal.yaml b/Documentation/devicetree/bindings/media/ti,cal.yaml
index 5e066629287d..fe5c74dd246e 100644
--- a/Documentation/devicetree/bindings/media/ti,cal.yaml
+++ b/Documentation/devicetree/bindings/media/ti,cal.yaml
@@ -177,26 +177,4 @@ examples:
         };
     };

-    i2c {
-        clock-frequency = <400000>;
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        camera-sensor@3c {
-               compatible = "ovti,ov5640";
-               reg = <0x3c>;
-
-               clocks = <&clk_ov5640_fixed>;
-               clock-names = "xclk";
-
-               port {
-                    csi2_cam0: endpoint {
-                            remote-endpoint = <&csi2_phy0>;
-                            clock-lanes = <0>;
-                            data-lanes = <1 2>;
-                    };
-               };
-        };
-    };
-
 ...
--
2.27.0

