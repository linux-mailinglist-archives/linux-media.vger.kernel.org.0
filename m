Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 392C4A520F
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 10:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730326AbfIBIoF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 04:44:05 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34326 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729874AbfIBIoE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 04:44:04 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7944F25B784;
        Mon,  2 Sep 2019 18:44:02 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6297E9401E6; Mon,  2 Sep 2019 10:44:00 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] dt-bindings: sh-mobile-ceu: Remove now unimplemented bindings documentation
Date:   Mon,  2 Sep 2019 10:43:52 +0200
Message-Id: <20190902084352.7974-1-horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Remove the SH Mobile CEU bindings documentation as the corresponding driver
was removed v5.1 by the following commit:

43a445f188e1 ("media: sh_mobile_ceu_camera: remove obsolete soc_camera driver")

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 .../devicetree/bindings/media/sh_mobile_ceu.txt         | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/sh_mobile_ceu.txt

diff --git a/Documentation/devicetree/bindings/media/sh_mobile_ceu.txt b/Documentation/devicetree/bindings/media/sh_mobile_ceu.txt
deleted file mode 100644
index cfa4ffada8ae..000000000000
--- a/Documentation/devicetree/bindings/media/sh_mobile_ceu.txt
+++ /dev/null
@@ -1,17 +0,0 @@
-Bindings, specific for the sh_mobile_ceu_camera.c driver:
- - compatible: Should be "renesas,sh-mobile-ceu"
- - reg: register base and size
- - interrupts: the interrupt number
- - renesas,max-width: maximum image width, supported on this SoC
- - renesas,max-height: maximum image height, supported on this SoC
-
-Example:
-
-ceu0: ceu@fe910000 {
-	compatible = "renesas,sh-mobile-ceu";
-	reg = <0xfe910000 0xa0>;
-	interrupt-parent = <&intcs>;
-	interrupts = <0x880>;
-	renesas,max-width = <8188>;
-	renesas,max-height = <8188>;
-};
-- 
2.11.0

