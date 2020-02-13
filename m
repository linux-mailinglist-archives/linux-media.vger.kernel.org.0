Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C69415CBF1
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 21:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728745AbgBMUUP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Feb 2020 15:20:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:34070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728728AbgBMUUO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Feb 2020 15:20:14 -0500
Received: from ziggy.cz (unknown [37.223.145.31])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5BEAB246A8;
        Thu, 13 Feb 2020 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581625213;
        bh=ehStHP3E8G3itjw39Biu5GSOM0CCrrWUDNJnpLV+iXc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pWADn2lh1JUvcFH4fQLwgW4G9zEau5IXUI5fA+HuPWfEv1HUC1bsdqMRuylKH7TqW
         79ysP1oE4wVSbEGedeOEEPA/xly3kDAKqXojIn8QUQrmdkZcn0ROruGqrqYdpkd0sM
         144Bs1UAVeEgjSpyz+Zu2E90g+cBgw/lbavln5hk=
From:   matthias.bgg@kernel.org
To:     robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Cc:     devicetree@vger.kernel.org, drinkcat@chromium.org,
        frank-w@public-files.de, sean.wang@mediatek.com,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        wens@csie.org, linux-mediatek@lists.infradead.org,
        rdunlap@infradead.org, matthias.bgg@kernel.org,
        hsinyi@chromium.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Matthias Brugger <mbrugger@suse.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v7 02/13] dt-bindings: display: mediatek: Add mmsys binding description
Date:   Thu, 13 Feb 2020 21:19:42 +0100
Message-Id: <20200213201953.15268-3-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213201953.15268-1-matthias.bgg@kernel.org>
References: <20200213201953.15268-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Matthias Brugger <mbrugger@suse.com>

The MediaTek DRM has a block called mmsys, which sets
the routing and enables the different blocks.
This patch adds one line for the mmsys bindings description and changes
the mmsys description to use the generic form of referring to a specific
Soc.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>

---

Changes in v7:
- add hint to the mmsys binding document
- make mmsys description generic
- fix typo in commit message

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 .../bindings/display/mediatek/mediatek,disp.txt          | 3 +++
 .../bindings/display/mediatek/mediatek,mmsys.txt         | 9 +--------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index b91e709db7a4..8e453026ef78 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -24,6 +24,7 @@ connected to.
 For a description of the display interface sink function blocks, see
 Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt and
 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt.
+Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt.
 
 Required properties (all function blocks):
 - compatible: "mediatek,<chip>-disp-<function>", one of
@@ -43,7 +44,9 @@ Required properties (all function blocks):
 	"mediatek,<chip>-dpi"        		- DPI controller, see mediatek,dpi.txt
 	"mediatek,<chip>-disp-mutex" 		- display mutex
 	"mediatek,<chip>-disp-od"    		- overdrive
+	"mediatek,<chip>-mmsys", "syscon"	- provide clocks and components management
   the supported chips are mt2701, mt2712 and mt8173.
+
 - reg: Physical base address and length of the function block register space
 - interrupts: The interrupt signal from the function block (required, except for
   merge and split function blocks).
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
index 301eefbe1618..7bbadee820e3 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mmsys.txt
@@ -5,14 +5,7 @@ The Mediatek mmsys controller provides various clocks to the system.
 
 Required Properties:
 
-- compatible: Should be one of:
-	- "mediatek,mt2701-mmsys", "syscon"
-	- "mediatek,mt2712-mmsys", "syscon"
-	- "mediatek,mt6779-mmsys", "syscon"
-	- "mediatek,mt6797-mmsys", "syscon"
-	- "mediatek,mt7623-mmsys", "mediatek,mt2701-mmsys", "syscon"
-	- "mediatek,mt8173-mmsys", "syscon"
-	- "mediatek,mt8183-mmsys", "syscon"
+- compatible: "mediatek,<chip>-mmsys"
 - #clock-cells: Must be 1
 
 The mmsys controller uses the common clk binding from
-- 
2.24.1

