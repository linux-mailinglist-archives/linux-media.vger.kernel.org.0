Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5444925E28D
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 22:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728054AbgIDUSZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Sep 2020 16:18:25 -0400
Received: from gw.c-home.cz ([89.24.150.100]:41821 "EHLO dmz.c-home.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728045AbgIDUSY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Sep 2020 16:18:24 -0400
X-Greylist: delayed 967 seconds by postgrey-1.27 at vger.kernel.org; Fri, 04 Sep 2020 16:18:04 EDT
Received: from ubuntu1804.c-home.cz (unifi.c-home.cz [192.168.1.239])
        by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id 084K1EdA002405;
        Fri, 4 Sep 2020 22:01:27 +0200 (CEST)
From:   Martin Cerveny <m.cerveny@computer.org>
To:     devicetree@vger.kernel.org
Cc:     Martin Cerveny <m.cerveny@computer.org>,
        Chen-Yu Tsai <wens@csie.org>, devel@driverdev.osuosl.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 2/6] dt-bindings: sram: allwinner,sun4i-a10-system-control: Add V3s compatibles
Date:   Fri,  4 Sep 2020 22:01:08 +0200
Message-Id: <20200904200112.5563-3-m.cerveny@computer.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904200112.5563-1-m.cerveny@computer.org>
References: <20200904200112.5563-1-m.cerveny@computer.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner V3s has system control similar to that in H3.
Add compatibles for system control with SRAM C1 region.

Signed-off-by: Martin Cerveny <m.cerveny@computer.org>
---
 .../bindings/sram/allwinner,sun4i-a10-system-control.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index f5825935f..9577d6c14 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -33,6 +33,9 @@ properties:
           - const: allwinner,sun4i-a10-system-control
       - const: allwinner,sun8i-a23-system-control
       - const: allwinner,sun8i-h3-system-control
+      - items:
+          - const: allwinner,sun8i-v3s-system-control
+          - const: allwinner,sun8i-h3-system-control
       - const: allwinner,sun50i-a64-sram-controller
         deprecated: true
       - const: allwinner,sun50i-a64-system-control
@@ -86,6 +89,9 @@ patternProperties:
               - items:
                   - const: allwinner,sun8i-h3-sram-c1
                   - const: allwinner,sun4i-a10-sram-c1
+              - items:
+                  - const: allwinner,sun8i-v3s-sram-c1
+                  - const: allwinner,sun4i-a10-sram-c1
               - items:
                   - const: allwinner,sun50i-a64-sram-c1
                   - const: allwinner,sun4i-a10-sram-c1
-- 
2.17.1

