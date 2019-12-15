Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29D7D11F96F
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 18:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbfLOQ7a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 11:59:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:54860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbfLOQ7a (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 11:59:30 -0500
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 61D1822B48;
        Sun, 15 Dec 2019 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576429169;
        bh=AggvsG1/GZy0NVHIzr7eHUOA85RmCqX0dOr608p8zzA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kjb8SO0ljbi+aEGO76d4lW2vkCTjPXBcJEiB5YmicJ5tnekR7Bo8nxXTjwOGFKgl0
         4FTvCWTEShVqVAs4AIZqM7d7S6IEHs3SOTtLitqhccgYJ4nBWYIy4HwGXcKtZ/x8Vt
         ZgX9Dv1i4h3TNz0hi9zQMc5zRZ9TZPSWlvMtriio=
Received: by wens.tw (Postfix, from userid 1000)
        id 271EE5FD21; Mon, 16 Dec 2019 00:59:26 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 02/14] dt-bindings: media: sun4i-csi: Add compatible for CSI0 on R40
Date:   Mon, 16 Dec 2019 00:59:12 +0800
Message-Id: <20191215165924.28314-3-wens@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191215165924.28314-1-wens@kernel.org>
References: <20191215165924.28314-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

The CSI0 block in the Allwinner R40 SoC looks to be the same as the one
in the A20. The register maps line up, and they support the same
features. The R40 appears to support BT.1120 based on the feature
overview, but it is not mentioned anywhere else. Also like the A20, the
ISP is not mentioned, but the CSI special clock needs to be enabled for
the hardware to function. The manual does state that the CSI special
clock is the TOP clock for all CSI hardware, but currently no hardware
exists for us to test if CSI1 also depends on it or not.

Add a compatible string for the CSI0 block in the R40, with the A20
compatible string as a fallback.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
index 221fe630c7d5..d486321b13f5 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
@@ -22,6 +22,9 @@ properties:
       - items:
         - const: allwinner,sun7i-a20-csi1
         - const: allwinner,sun4i-a10-csi1
+      - items:
+        - const: allwinner,sun8i-r40-csi0
+        - const: allwinner,sun7i-a20-csi0
 
   reg:
     maxItems: 1
-- 
2.24.0

