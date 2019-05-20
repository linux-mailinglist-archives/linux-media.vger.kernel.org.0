Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1491523BA5
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 17:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388184AbfETPGy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 11:06:54 -0400
Received: from vps.xff.cz ([195.181.215.36]:54754 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731505AbfETPGm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 11:06:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1558364799; bh=HQyTkbRM9bhoZj4Sp9Ox98haCitSP4jarvcwo1lDf4I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Im7RwqhiYPretVmpQGn28pGv0yh1N3EJTpT2Ghl4ceHMFeYhOThZz3uMVLsOlvBpY
         UoCNdXt8hmczl1J0B38T/9lWKPzRv8e0uJLiNlFhpjcop2ld+MoLR2i4hgC6Qd+Hgt
         WIzYn+070FkKEXIrVV+A+MKJVRixhlqWcBRRNNHA=
From:   megous@megous.com
To:     Chen-Yu Tsai <wens@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/3] dt-bindings: media: sun6i-csi: Add compatible string for A83T variant
Date:   Mon, 20 May 2019 17:06:35 +0200
Message-Id: <20190520150637.23557-2-megous@megous.com>
In-Reply-To: <20190520150637.23557-1-megous@megous.com>
References: <20190520150637.23557-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The A83T SoC has a camera sensor interface (known as CSI in Allwinner
lingo), which is similar to the one found on the A64 and H3. The only
difference seems to be that support of MIPI CSI through a connected
MIPI CSI-2 bridge.

Add a compatible string for this variant.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/sun6i-csi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/sun6i-csi.txt b/Documentation/devicetree/bindings/media/sun6i-csi.txt
index 0dd540bb03db..a2e3e56f0257 100644
--- a/Documentation/devicetree/bindings/media/sun6i-csi.txt
+++ b/Documentation/devicetree/bindings/media/sun6i-csi.txt
@@ -6,6 +6,7 @@ Allwinner V3s SoC features a CSI module(CSI1) with parallel interface.
 Required properties:
   - compatible: value must be one of:
     * "allwinner,sun6i-a31-csi"
+    * "allwinner,sun8i-a83t-csi"
     * "allwinner,sun8i-h3-csi"
     * "allwinner,sun8i-v3s-csi"
     * "allwinner,sun50i-a64-csi"
-- 
2.21.0

