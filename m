Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5416B5626B4
	for <lists+linux-media@lfdr.de>; Fri,  1 Jul 2022 01:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbiF3XLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 19:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232085AbiF3XL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 19:11:29 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B5358FEB;
        Thu, 30 Jun 2022 16:11:19 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BED202A4E;
        Fri,  1 Jul 2022 01:08:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1656630488;
        bh=jX2xREptjTcdw3Dt0HLdq+66A0eTeJEwSsBRZlLZKZg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EvZC8Tay6ZZf3hId1Peivl/WpYQTPS4d9QT7MRg6/icHhbW10EV+CpIekr63gLCrh
         QoJ2BhBaE/1MKPMZWFz5L/NQdU3Rs9NDfYePknZ9Y2xZ5zMHNQ99j2ktcXg+saxpnX
         JLAIE1sosJJ3XhzRmScxbMeE+Wj5L3i6ouCSqYSw=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v2 47/55] dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
Date:   Fri,  1 Jul 2022 02:07:05 +0300
Message-Id: <20220630230713.10580-48-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
References: <20220630230713.10580-1-laurent.pinchart@ideasonboard.com>
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

From: Paul Elder <paul.elder@ideasonboard.com>

The i.MX8MP ISP is compatbile with the rkisp1 driver. Add it to the list
of compatible strings. While at it, expand on the description of the
clocks to make it clear which clock in the i.MX8MP ISP they map to,
based on the names from the datasheet (which are confusing).

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Regards,

Laurent Pinchart

