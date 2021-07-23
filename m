Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63D33D354B
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 09:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233270AbhGWGv5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 02:51:57 -0400
Received: from gloria.sntech.de ([185.11.138.130]:43352 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229560AbhGWGv5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 02:51:57 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m6pfW-0003dj-E0; Fri, 23 Jul 2021 09:32:26 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     ezequiel@collabora.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, Laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
        heiko@sntech.de, robh+dt@kernel.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v7 03/10] dt-bindings: media: rkisp1: document different irq possibilities
Date:   Fri, 23 Jul 2021 09:32:14 +0200
Message-Id: <20210723073221.1276358-4-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210723073221.1276358-1-heiko@sntech.de>
References: <20210723073221.1276358-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Some variants have one irq signaling all of MI, MIPI and ISP events
while some rkisp1 variants use separate irqs for each.

Adapt the binding to handle both cases.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/rockchip-isp1.yaml         | 45 +++++++++++++------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index 2f8f0625d22e..14ac5730b377 100644
--- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -21,7 +21,14 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  interrupt-names:
+    items:
+      - const: isp
+      - const: mi
+      - const: mipi
 
   clocks:
     minItems: 3
@@ -90,19 +97,29 @@ required:
   - power-domains
   - ports
 
-if:
-  properties:
-    compatible:
-      contains:
-        const: rockchip,rk3399-cif-isp
-then:
-  properties:
-    clocks:
-      minItems: 3
-      maxItems: 4
-    clock-names:
-      minItems: 3
-      maxItems: 4
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3399-cif-isp
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 4
+        clock-names:
+          minItems: 3
+          maxItems: 4
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,px30-cif-isp
+    then:
+      required:
+        - interrupt-names
 
 additionalProperties: false
 
-- 
2.29.2

