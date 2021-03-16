Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF4833DE33
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 20:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240721AbhCPTvx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 15:51:53 -0400
Received: from mail-il1-f180.google.com ([209.85.166.180]:40436 "EHLO
        mail-il1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240732AbhCPTvD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 15:51:03 -0400
Received: by mail-il1-f180.google.com with SMTP id e7so13843213ile.7;
        Tue, 16 Mar 2021 12:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9AiEy5w/9EUNU1tOT9J8QNa8layR4FPuZXyDYfrBHDk=;
        b=N8h+m3xEJcO69sO5hXMgyXoWCzM7YF3hOb3dDdIYWyNMfBIOLF/drdt9aZxjsEQ050
         Q+08nl+KjJkzTxYzpAMUseB4blmbUCXqJ40GUpqB41lqCdYdvrENi9aCjuWIywnWzui7
         A8yyrJhPZkulaRLux8zT7esh74rp8QYlDhkSwNk8d1kjtYnr0eQQeYExaS74y5E3pyDj
         gZhefx6ioDEtx3gFYlMDNsqqSfUVVwwVUeSa2n+pIcUrAPJ78Y4uDF2P7+3jAL4wgwN7
         bmB9jflDXdSm5SwbbUqFJNPgjmc7wjgnyzBTdI0IE7ydYYT4FNP/fKXl6cbwnM5jVrjJ
         97pQ==
X-Gm-Message-State: AOAM5332xx3ZMjKz3EYT4yzYq5im+eGTPjb3ZdCchkKriRYXPRakJKgC
        JncJQ6OyQDNC3ub3SUM+3/rJ4AQiig==
X-Google-Smtp-Source: ABdhPJw171iXojJqPTE2PaobkEV+/LqNlC3zAhHyL/UX4MG+43ST95UaTmz220gwGXvJaybV089pWQ==
X-Received: by 2002:a92:cda5:: with SMTP id g5mr4887318ild.247.1615924262235;
        Tue, 16 Mar 2021 12:51:02 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
        by smtp.googlemail.com with ESMTPSA id y20sm8904081ioy.10.2021.03.16.12.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 12:51:01 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] dt-bindings: media: video-interfaces: Use documented bindings in example
Date:   Tue, 16 Mar 2021 13:51:00 -0600
Message-Id: <20210316195100.3531414-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The example in video-interfaces.yaml managed to use a bunch of undocumented
bindings. Update the example to use real bindings (and ones with a schema).

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/video-interfaces.yaml      | 75 ++++++++-----------
 1 file changed, 33 insertions(+), 42 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
index 0a7a73fd59f2..f30b9b91717b 100644
--- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
+++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
@@ -227,17 +227,12 @@ examples:
   # only one of the following data pipelines can be active:
   # ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
   - |
+    #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/r8a7796-sysc.h>
+
     ceu@fe910000 {
-        compatible = "renesas,sh-mobile-ceu";
         reg = <0xfe910000 0xa0>;
-        interrupts = <0x880>;
-
-        mclk: master_clock {
-            compatible = "renesas,ceu-clock";
-            #clock-cells = <1>;
-            clock-frequency = <50000000>;  /* Max clock frequency */
-            clock-output-names = "mclk";
-        };
 
         port {
             #address-cells = <1>;
@@ -271,18 +266,14 @@ examples:
         #size-cells = <0>;
 
         camera@21 {
-            compatible = "ovti,ov772x";
+            compatible = "ovti,ov7720";
             reg = <0x21>;
-            vddio-supply = <&regulator1>;
-            vddcore-supply = <&regulator2>;
-
-            clock-frequency = <20000000>;
             clocks = <&mclk 0>;
-            clock-names = "xclk";
 
             port {
                 /* With 1 endpoint per port no need for addresses. */
                 ov772x_1_1: endpoint {
+                    bus-type = <5>;
                     bus-width = <8>;
                     remote-endpoint = <&ceu0_1>;
                     hsync-active = <1>;
@@ -295,48 +286,48 @@ examples:
         };
 
         camera@1a {
-            compatible = "sony,imx074";
+            compatible = "sony,imx334";
             reg = <0x1a>;
-            vddio-supply = <&regulator1>;
-            vddcore-supply = <&regulator2>;
 
-            clock-frequency = <30000000>;  /* Shared clock with ov772x_1 */
             clocks = <&mclk 0>;
-            clock-names = "sysclk";    /* Assuming this is the
-                       name in the datasheet */
+
             port {
-                imx074_1: endpoint {
+                imx334_1: endpoint {
                     clock-lanes = <0>;
                     data-lanes = <1 2>;
+                    link-frequencies = /bits/ 64 <891000000>;
                     remote-endpoint = <&csi2_1>;
                 };
             };
         };
     };
 
-    csi2: csi2@ffc90000 {
-        compatible = "renesas,sh-mobile-csi2";
-        reg = <0xffc90000 0x1000>;
-        interrupts = <0x17a0>;
-        #address-cells = <1>;
-        #size-cells = <0>;
+    csi2@fea80000 {
+        compatible = "renesas,r8a7796-csi2";
+        reg = <0xfea80000 0x10000>;
+        interrupts = <0 184 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 714>;
+        power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+        resets = <&cpg 714>;
 
-        port@1 {
-            compatible = "renesas,csi2c";  /* One of CSI2I and CSI2C. */
-            reg = <1>;      /* CSI-2 PHY #1 of 2: PHY_S,
-                       PHY_M has port address 0,
-                       is unused. */
-            csi2_1: endpoint {
-                clock-lanes = <0>;
-                data-lanes = <2 1>;
-                remote-endpoint = <&imx074_1>;
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csi2_1: endpoint {
+                    clock-lanes = <0>;
+                    data-lanes = <2 1>;
+                    remote-endpoint = <&imx334_1>;
+                };
             };
-        };
-        port@2 {
-            reg = <2>;      /* port 2: link to the CEU */
+            port@1 {
+                reg = <1>;
 
-            csi2_2: endpoint {
-                remote-endpoint = <&ceu0_0>;
+                csi2_2: endpoint {
+                    remote-endpoint = <&ceu0_0>;
+                };
             };
         };
     };
-- 
2.27.0

