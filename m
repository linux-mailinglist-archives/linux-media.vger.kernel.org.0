Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 877023D2079
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 11:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231377AbhGVIb2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 04:31:28 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:47009 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231371AbhGVIbZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 04:31:25 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id B6D30200004;
        Thu, 22 Jul 2021 09:11:57 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/8] dt-bindings: media: max9286: Re-indent example
Date:   Thu, 22 Jul 2021 11:12:32 +0200
Message-Id: <20210722091239.26451-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210722091239.26451-1-jacopo+renesas@jmondi.org>
References: <20210722091239.26451-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The dt-bindings examples are usually indented with 4 spaces.

The maxim,max9286 schema has the example indented with only
2 spaces, re-indent it.

Cosmetic change only.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../bindings/media/i2c/maxim,max9286.yaml     | 214 +++++++++---------
 1 file changed, 107 insertions(+), 107 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
index ee16102fdfe7..0e7162998b77 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
@@ -191,140 +191,140 @@ examples:
     #include <dt-bindings/gpio/gpio.h>
 
     i2c@e66d8000 {
-      #address-cells = <1>;
-      #size-cells = <0>;
+        #address-cells = <1>;
+        #size-cells = <0>;
 
-      reg = <0 0xe66d8000>;
+        reg = <0 0xe66d8000>;
 
-      gmsl-deserializer@2c {
-        compatible = "maxim,max9286";
-        reg = <0x2c>;
-        poc-supply = <&camera_poc_12v>;
-        enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
+        gmsl-deserializer@2c {
+            compatible = "maxim,max9286";
+            reg = <0x2c>;
+            poc-supply = <&camera_poc_12v>;
+            enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
 
-        gpio-controller;
-        #gpio-cells = <2>;
+            gpio-controller;
+            #gpio-cells = <2>;
 
-        maxim,reverse-channel-microvolt = <170000>;
+            maxim,reverse-channel-microvolt = <170000>;
 
-        ports {
-          #address-cells = <1>;
-          #size-cells = <0>;
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
 
-          port@0 {
-            reg = <0>;
+                port@0 {
+                    reg = <0>;
 
-            max9286_in0: endpoint {
-              remote-endpoint = <&rdacm20_out0>;
-            };
-          };
-
-          port@1 {
-            reg = <1>;
-
-            max9286_in1: endpoint {
-              remote-endpoint = <&rdacm20_out1>;
-            };
-          };
-
-          port@2 {
-            reg = <2>;
-
-            max9286_in2: endpoint {
-              remote-endpoint = <&rdacm20_out2>;
-            };
-          };
+                    max9286_in0: endpoint {
+                        remote-endpoint = <&rdacm20_out0>;
+                    };
+                };
 
-          port@3 {
-            reg = <3>;
+                port@1 {
+                    reg = <1>;
 
-            max9286_in3: endpoint {
-              remote-endpoint = <&rdacm20_out3>;
-            };
-          };
+                    max9286_in1: endpoint {
+                        remote-endpoint = <&rdacm20_out1>;
+                    };
+                };
 
-          port@4 {
-            reg = <4>;
+                port@2 {
+                    reg = <2>;
 
-            max9286_out: endpoint {
-              data-lanes = <1 2 3 4>;
-              remote-endpoint = <&csi40_in>;
-            };
-          };
-        };
+                    max9286_in2: endpoint {
+                        remote-endpoint = <&rdacm20_out2>;
+                    };
+                };
 
-        i2c-mux {
-          #address-cells = <1>;
-          #size-cells = <0>;
+                port@3 {
+                    reg = <3>;
 
-          i2c@0 {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            reg = <0>;
+                    max9286_in3: endpoint {
+                        remote-endpoint = <&rdacm20_out3>;
+                    };
+                };
 
-            camera@51 {
-              compatible = "imi,rdacm20";
-              reg = <0x51>, <0x61>;
+                port@4 {
+                    reg = <4>;
 
-              port {
-                rdacm20_out0: endpoint {
-                  remote-endpoint = <&max9286_in0>;
+                    max9286_out: endpoint {
+                        data-lanes = <1 2 3 4>;
+                        remote-endpoint = <&csi40_in>;
+                    };
                 };
-              };
-
             };
-          };
-
-          i2c@1 {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            reg = <1>;
 
-            camera@52 {
-              compatible = "imi,rdacm20";
-              reg = <0x52>, <0x62>;
+            i2c-mux {
+                #address-cells = <1>;
+                #size-cells = <0>;
 
-              port {
-                rdacm20_out1: endpoint {
-                  remote-endpoint = <&max9286_in1>;
-                };
-              };
-            };
-          };
+                i2c@0 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <0>;
 
-          i2c@2 {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            reg = <2>;
+                    camera@51 {
+                        compatible = "imi,rdacm20";
+                        reg = <0x51>, <0x61>;
 
-            camera@53 {
-              compatible = "imi,rdacm20";
-              reg = <0x53>, <0x63>;
+                        port {
+                            rdacm20_out0: endpoint {
+                                remote-endpoint = <&max9286_in0>;
+                            };
+                        };
 
-              port {
-                rdacm20_out2: endpoint {
-                  remote-endpoint = <&max9286_in2>;
+                    };
                 };
-              };
-            };
-          };
 
-          i2c@3 {
-            #address-cells = <1>;
-            #size-cells = <0>;
-            reg = <3>;
+                i2c@1 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <1>;
+
+                    camera@52 {
+                        compatible = "imi,rdacm20";
+                        reg = <0x52>, <0x62>;
+
+                        port {
+                            rdacm20_out1: endpoint {
+                                remote-endpoint = <&max9286_in1>;
+                            };
+                        };
+                    };
+                };
 
-            camera@54 {
-              compatible = "imi,rdacm20";
-              reg = <0x54>, <0x64>;
+                i2c@2 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <2>;
+
+                    camera@53 {
+                        compatible = "imi,rdacm20";
+                        reg = <0x53>, <0x63>;
+
+                        port {
+                            rdacm20_out2: endpoint {
+                                remote-endpoint = <&max9286_in2>;
+                            };
+                        };
+                    };
+                };
 
-              port {
-                rdacm20_out3: endpoint {
-                  remote-endpoint = <&max9286_in3>;
+                i2c@3 {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+                    reg = <3>;
+
+                    camera@54 {
+                        compatible = "imi,rdacm20";
+                        reg = <0x54>, <0x64>;
+
+                        port {
+                            rdacm20_out3: endpoint {
+                                remote-endpoint = <&max9286_in3>;
+                            };
+                        };
+                    };
                 };
-              };
             };
-          };
         };
-      };
     };
-- 
2.32.0

