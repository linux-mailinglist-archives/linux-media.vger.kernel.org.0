Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7427E267AEC
	for <lists+linux-media@lfdr.de>; Sat, 12 Sep 2020 16:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgILOdB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Sep 2020 10:33:01 -0400
Received: from gw.c-home.cz ([89.24.150.100]:33045 "EHLO dmz.c-home.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbgILObe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Sep 2020 10:31:34 -0400
Received: from ubuntu1804.c-home.cz (unifi.c-home.cz [192.168.1.239])
        by dmz.c-home.cz (8.14.4+Sun/8.14.4) with ESMTP id 08CEUtN1007223;
        Sat, 12 Sep 2020 16:31:01 +0200 (CEST)
From:   Martin Cerveny <m.cerveny@computer.org>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Martin Cerveny <m.cerveny@computer.org>,
        Chen-Yu Tsai <wens@csie.org>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 2/6] dt-bindings: sram: allwinner,sun4i-a10-system-control: Add V3s compatibles
Date:   Sat, 12 Sep 2020 16:30:48 +0200
Message-Id: <20200912143052.30952-3-m.cerveny@computer.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200912143052.30952-1-m.cerveny@computer.org>
References: <20200912143052.30952-1-m.cerveny@computer.org>
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
index f5825935fd22..9577d6c1494a 100644
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

