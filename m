Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2604419FA94
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729576AbgDFQm7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:42:59 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:31608 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729416AbgDFQm7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Apr 2020 12:42:59 -0400
X-IronPort-AV: E=Sophos;i="5.72,351,1580742000"; 
   d="scan'208";a="43643794"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 07 Apr 2020 01:42:58 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id F374C40061B6;
        Tue,  7 Apr 2020 01:42:54 +0900 (JST)
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
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 1/5] media: dt-bindings: media: i2c: Deprecate usage of the clock-frequency property
Date:   Mon,  6 Apr 2020 17:42:37 +0100
Message-Id: <1586191361-16598-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

OV5645 sensor supports input clock frequency ranging from 6MHz to 27MHz
but the driver strictly expects this to be 24MHz (with tolerance of 1%)
with this restrictions let the driver enforce the clock frequency
internally to 24MHz rather then being passed as dt-property.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/media/i2c/ov5645.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ov5645.txt b/Documentation/devicetree/bindings/media/i2c/ov5645.txt
index 72ad992f77be..a55bb728ea48 100644
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
@@ -37,7 +36,6 @@ Example:
 
 			clocks = <&clks 200>;
 			clock-names = "xclk";
-			clock-frequency = <24000000>;
 
 			vdddo-supply = <&camera_dovdd_1v8>;
 			vdda-supply = <&camera_avdd_2v8>;
-- 
2.20.1

