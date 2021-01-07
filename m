Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7B072ED101
	for <lists+linux-media@lfdr.de>; Thu,  7 Jan 2021 14:43:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbhAGNmB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 08:42:01 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:46701 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbhAGNmA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 08:42:00 -0500
X-Originating-IP: 93.29.109.196
Received: from localhost.localdomain (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AA1DCC0016;
        Thu,  7 Jan 2021 13:41:17 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH 3/5] dt-bindings: media: rockchip-vpu: Add PX30 compatible
Date:   Thu,  7 Jan 2021 14:40:59 +0100
Message-Id: <20210107134101.195426-4-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210107134101.195426-1-paul.kocialkowski@bootlin.com>
References: <20210107134101.195426-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Rockchip PX30 SoC has a Hantro VPU that features a decoder (VDPU2)
and an encoder (VEPU2). It is similar to the RK3399's VPU but takes an
extra clock (SCLK).

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 .../bindings/media/rockchip-vpu.yaml          | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
index c81dbc3e8960..c446b9ead21b 100644
--- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
@@ -15,10 +15,13 @@ description:
 
 properties:
   compatible:
-    enum:
-      - rockchip,rk3288-vpu
-      - rockchip,rk3328-vpu
-      - rockchip,rk3399-vpu
+    oneOf:
+      - const: rockchip,rk3288-vpu
+      - const: rockchip,rk3328-vpu
+      - const: rockchip,rk3399-vpu
+      - items:
+        - const: rockchip,px30-vpu
+        - const: rockchip,rk3399-vpu
 
   reg:
     maxItems: 1
@@ -35,12 +38,18 @@ properties:
           - const: vdpu
 
   clocks:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   clock-names:
-    items:
-      - const: aclk
-      - const: hclk
+    oneOf:
+      - items:
+        - const: aclk
+        - const: hclk
+      - items:
+        - const: aclk
+        - const: hclk
+        - const: sclk
 
   power-domains:
     maxItems: 1
-- 
2.30.0

