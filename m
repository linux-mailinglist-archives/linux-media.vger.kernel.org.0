Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA4DF19FA9A
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729719AbgDFQnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:43:10 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:30273 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729534AbgDFQnK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 Apr 2020 12:43:10 -0400
X-IronPort-AV: E=Sophos;i="5.72,351,1580742000"; 
   d="scan'208";a="43857558"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Apr 2020 01:43:07 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C2C8C40061B6;
        Tue,  7 Apr 2020 01:43:03 +0900 (JST)
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
Subject: [PATCH v5 3/5] media: i2c: ov5645: Turn probe error into warning for xvclk frequency mismatch
Date:   Mon,  6 Apr 2020 17:42:39 +0100
Message-Id: <1586191361-16598-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1586191361-16598-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PLL's on platforms might not be so accurate enough to generate the
required clock frequency, so instead of erroring out on xvlck frequency
mismatch just warn the user and continue ahead in probe.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/media/i2c/ov5645.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
index 52848fff8a08..314760349adf 100644
--- a/drivers/media/i2c/ov5645.c
+++ b/drivers/media/i2c/ov5645.c
@@ -1103,11 +1103,8 @@ static int ov5645_probe(struct i2c_client *client)
 	}
 	/* external clock must be 24MHz, allow 1% tolerance */
 	xclk_freq = clk_get_rate(ov5645->xclk);
-	if (xclk_freq < 23760000 || xclk_freq > 24240000) {
-		dev_err(dev, "external clock frequency %u is not supported\n",
-			xclk_freq);
-		return -EINVAL;
-	}
+	if (xclk_freq < 23760000 || xclk_freq > 24240000)
+		dev_warn(dev, "xvclk mismatched, modes are based on 24MHz\n");
 
 	for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
 		ov5645->supplies[i].supply = ov5645_supply_name[i];
-- 
2.20.1

