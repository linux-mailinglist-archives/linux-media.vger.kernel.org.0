Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16DF318B33D
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 13:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727318AbgCSMUZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Mar 2020 08:20:25 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:18010 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727001AbgCSMUZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Mar 2020 08:20:25 -0400
X-IronPort-AV: E=Sophos;i="5.70,571,1574089200"; 
   d="scan'208";a="42339758"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Mar 2020 21:20:24 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 79A8042BCBB7;
        Thu, 19 Mar 2020 21:20:20 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 1/5] media: dt-bindings: media: i2c: Deprecate usage of the clock-frequency property
Date:   Thu, 19 Mar 2020 12:19:19 +0000
Message-Id: <1584620363-2255-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584620363-2255-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1584620363-2255-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Deprecate usage of the clock-frequency property. The preferred method to
set clock rates is to use assigned-clock-rates.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/i2c/ov5645.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
index 72ad992f77be..1c85c78ec58c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ov5645.txt
+++ b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
@@ -8,7 +8,6 @@ Required Properties:
 - compatible: Value should be "ovti,ov5645".
 - clocks: Reference to the xclk clock.
 - clock-names: Should be "xclk".
-- clock-frequency: Frequency of the xclk clock.
 - enable-gpios: Chip enable GPIO. Polarity is GPIO_ACTIVE_HIGH. This corresponds
   to the hardware pin PWDNB which is physically active low.
 - reset-gpios: Chip reset GPIO. Polarity is GPIO_ACTIVE_LOW. This corresponds to
@@ -37,7 +36,8 @@ Example:
 
 			clocks = <&clks 200>;
 			clock-names = "xclk";
-			clock-frequency = <24000000>;
+			assigned-clocks = <&clks 200>;
+			assigned-clock-rates = <24000000>;
 
 			vdddo-supply = <&camera_dovdd_1v8>;
 			vdda-supply = <&camera_avdd_2v8>;
-- 
2.20.1

