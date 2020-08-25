Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C46A9251E63
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 19:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbgHYRfm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 13:35:42 -0400
Received: from mailoutvs4.siol.net ([185.57.226.195]:60476 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726429AbgHYRfh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 13:35:37 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id E0F475247CD;
        Tue, 25 Aug 2020 19:35:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 5C4F0RfSdqwj; Tue, 25 Aug 2020 19:35:33 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 8D7295247E0;
        Tue, 25 Aug 2020 19:35:33 +0200 (CEST)
Received: from localhost.localdomain (89-212-178-211.dynamic.t-2.net [89.212.178.211])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id 3BC745247D3;
        Tue, 25 Aug 2020 19:35:31 +0200 (CEST)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org, paul.kocialkowski@bootlin.com
Cc:     mchehab@kernel.org, robh+dt@kernel.org, gregkh@linuxfoundation.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-sunxi@googlegroups.com
Subject: [PATCH 1/5] dt-bindings: sram: allwinner,sun4i-a10-system-control: Add R40 compatibles
Date:   Tue, 25 Aug 2020 19:35:19 +0200
Message-Id: <20200825173523.1289379-2-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825173523.1289379-1-jernej.skrabec@siol.net>
References: <20200825173523.1289379-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allwinner R40 has system controller similar to that in A10.

Add compatibles for system controller and sram c1 region.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 .../bindings/sram/allwinner,sun4i-a10-system-control.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-s=
ystem-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun=
4i-a10-system-control.yaml
index f5825935fd22..6ebcbc153691 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-c=
ontrol.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-c=
ontrol.yaml
@@ -33,6 +33,9 @@ properties:
           - const: allwinner,sun4i-a10-system-control
       - const: allwinner,sun8i-a23-system-control
       - const: allwinner,sun8i-h3-system-control
+      - items:
+          - const: allwinner,sun8i-r40-system-control
+          - const: allwinner,sun4i-a10-system-control
       - const: allwinner,sun50i-a64-sram-controller
         deprecated: true
       - const: allwinner,sun50i-a64-system-control
@@ -86,6 +89,9 @@ patternProperties:
               - items:
                   - const: allwinner,sun8i-h3-sram-c1
                   - const: allwinner,sun4i-a10-sram-c1
+              - items:
+                  - const: allwinner,sun8i-r40-sram-c1
+                  - const: allwinner,sun4i-a10-sram-c1
               - items:
                   - const: allwinner,sun50i-a64-sram-c1
                   - const: allwinner,sun4i-a10-sram-c1
--=20
2.28.0

