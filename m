Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA80E192F37
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 18:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgCYRbn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 13:31:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37082 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727129AbgCYRbn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 13:31:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 10A462969FA
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
        p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
        sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
        laurent.pinchart@ideasonboard.com
Cc:     linux-mediatek@lists.infradead.org,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        rdunlap@infradead.org, frank-w@public-files.de, wens@csie.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Collabora Kernel ML <kernel@collabora.com>,
        devicetree@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Richard Fontana <rfontana@redhat.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        matthias.bgg@kernel.org, Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, hsinyi@chromium.org,
        Seiya Wang <seiya.wang@mediatek.com>,
        linux-clk@vger.kernel.org, mtk01761 <wendell.lin@mediatek.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Matthias Brugger <mbrugger@suse.com>, sean.wang@mediatek.com,
        Weiyi Lu <weiyi.lu@mediatek.com>,
        linux-arm-kernel@lists.infradead.org,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: [RESEND PATCH v12 2/5] dt-bindings: mediatek: Update mmsys binding to reflect it is a system controller
Date:   Wed, 25 Mar 2020 18:31:20 +0100
Message-Id: <20200325173123.3569606-3-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200325173123.3569606-1-enric.balletbo@collabora.com>
References: <20200325173123.3569606-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mmsys system controller is not only a pure clock controller, so
update the binding documentation to reflect that apart from providing
clocks, it also provides routing and miscellaneous control registers.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---

Changes in v12: None
Changes in v10:
- Update the binding documentation for the mmsys system controller.

Changes in v9: None
Changes in v8: None
Changes in v7: None

 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt    | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
index 301eefbe1618..8d6a9d98e7a6 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
@@ -1,7 +1,8 @@
 Mediatek mmsys controller
 ============================
 
-The Mediatek mmsys controller provides various clocks to the system.
+The Mediatek mmsys system controller provides clock control, routing control,
+and miscellaneous control in mmsys partition.
 
 Required Properties:
 
@@ -15,13 +16,13 @@ Required Properties:
 	- "mediatek,mt8183-mmsys", "syscon"
 - #clock-cells: Must be 1
 
-The mmsys controller uses the common clk binding from
+For the clock control, the mmsys controller uses the common clk binding from
 Documentation/devicetree/bindings/clock/clock-bindings.txt
 The available clocks are defined in dt-bindings/clock/mt*-clk.h.
 
 Example:
 
-mmsys: clock-controller@14000000 {
+mmsys: syscon@14000000 {
 	compatible = "mediatek,mt8173-mmsys", "syscon";
 	reg = <0 0x14000000 0 0x1000>;
 	#clock-cells = <1>;
-- 
2.25.1

