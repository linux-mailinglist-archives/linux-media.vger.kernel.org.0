Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB0154BA56
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245239AbiFNTPB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236473AbiFNTPA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:15:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1569F11C0F
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:15:00 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 23F449E5;
        Tue, 14 Jun 2022 21:14:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234098;
        bh=baLg4ESdTFTdfXTHb8sK66nWlixJdHENVXjvY+MGTRs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o1lvvf+lHmn5+AGAMBjfEhOQyN669YcK9CznC1BAfAfHs3fsOOR6IgelUSanUvum8
         3J4H3iZ7m2cgwGVvvwKeD0PL9+mRctBGiork6r/Fh+swNxuXKhEx1p8xSwYmFIoFcA
         3fXu7M2DwfcMRbNcJPsX/AGFCEixmHWewR3AdQlw=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Paul Elder <paul.elder@ideasonboard.com>, dafna@fastmail.com,
        heiko@sntech.de, laurent.pinchart@ideasonboard.com,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 47/55] dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
Date:   Wed, 15 Jun 2022 04:11:19 +0900
Message-Id: <20220614191127.3420492-48-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The i.MX8MP ISP is compatbile with the rkisp1 driver. Add it to the list
of compatible strings. While at it, expand on the description of the
clocks to make it clear which clock in the i.MX8MP ISP they map to,
based on the names from the datasheet (which are confusing).

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/rockchip-isp1.yaml | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
index b3661d7d4357..95cf945f7ac5 100644
--- a/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip-isp1.yaml
@@ -16,6 +16,7 @@ description: |
 properties:
   compatible:
     enum:
+      - fsl,imx8mp-isp
       - rockchip,px30-cif-isp
       - rockchip,rk3399-cif-isp
 
@@ -36,9 +37,9 @@ properties:
     minItems: 3
     items:
       # isp0 and isp1
-      - description: ISP clock
-      - description: ISP AXI clock
-      - description: ISP AHB clock
+      - description: ISP clock (for imx8mp, clk)
+      - description: ISP AXI clock (for imx8mp, m_hclk)
+      - description: ISP AHB clock (for imx8mp, hclk)
       # only for isp1
       - description: ISP Pixel clock
 
-- 
2.30.2

