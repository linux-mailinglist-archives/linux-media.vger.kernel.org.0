Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A58CCA151
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 17:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729414AbfJCPss (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 11:48:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:59866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727024AbfJCPss (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 11:48:48 -0400
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3254F20700;
        Thu,  3 Oct 2019 15:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570117727;
        bh=EE5Bkv2KoKRIFlmamCmZbMdsVL5JyAd3sPSGmn2juVw=;
        h=From:To:Cc:Subject:Date:From;
        b=2D6q22KuDwlYJSH/zY34xSvhG1V8aH5Pp5Vv15e0d4oVlTmox4zctkuwpyOIJ2gmp
         Ds65RRu4HgPfQgYb37LQYbBOdkDyIP9lbkH6DB94aYna5/+J+q9K9UTM6jm3Ir5xdu
         leTV3pra1o7uzm6dOrYhYnZ4CPEI0yExBAyx8XZ4=
From:   Maxime Ripard <mripard@kernel.org>
To:     Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 1/2] dt-bindings: media: sun4i-csi: Drop the module clock
Date:   Thu,  3 Oct 2019 17:48:41 +0200
Message-Id: <20191003154842.248763-1-mripard@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It turns out that what was thought to be the module clock was actually the
clock meant to be used by the sensor, and isn't playing any role with the
CSI controller itself. Let's drop that clock from our binding.

Fixes: c5e8f4ccd775 ("media: dt-bindings: media: Add Allwinner A10 CSI binding")
Reported-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
index 5dd1cf490cd9..d3e423fcb6c2 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
@@ -27,14 +27,12 @@ properties:
   clocks:
     items:
       - description: The CSI interface clock
-      - description: The CSI module clock
       - description: The CSI ISP clock
       - description: The CSI DRAM clock
 
   clock-names:
     items:
       - const: bus
-      - const: mod
       - const: isp
       - const: ram
 
@@ -89,9 +87,8 @@ examples:
         compatible = "allwinner,sun7i-a20-csi0";
         reg = <0x01c09000 0x1000>;
         interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
-        clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI0>,
-                 <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
-        clock-names = "bus", "mod", "isp", "ram";
+        clocks = <&ccu CLK_AHB_CSI0>, <&ccu CLK_CSI_SCLK>, <&ccu CLK_DRAM_CSI0>;
+        clock-names = "bus", "isp", "ram";
         resets = <&ccu RST_CSI0>;
 
         port {
-- 
2.23.0

