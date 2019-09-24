Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8183ABC72B
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 13:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440843AbfIXLuM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 07:50:12 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59921 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438941AbfIXLuM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 07:50:12 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iCjKc-0002f6-FS; Tue, 24 Sep 2019 13:50:10 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mats Randgaard <matrandg@cisco.com>,
        Steve Longerbeam <slongerbeam@gmail.com>, kernel@pengutronix.de
Subject: [PATCH v4 3/3] media: imx: ask source subdevice for number of active data lanes
Date:   Tue, 24 Sep 2019 13:49:55 +0200
Message-Id: <20190924114955.13132-4-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924114955.13132-1-p.zabel@pengutronix.de>
References: <20190924114955.13132-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the newly added g_csi_active_lanes() video op to determine the
number of active data lanes used by the transmitter. If this subdev
call is not supported or does not return the number of active lanes,
default to using all connected data lanes as before.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v3:
 - Use g_csi_active_lanes instead of g_mbus_config.
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index bfa4b254c4e4..aa4bf2f89695 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -131,10 +131,8 @@ static void csi2_enable(struct csi2_dev *csi2, bool enable)
 	}
 }
 
-static void csi2_set_lanes(struct csi2_dev *csi2)
+static void csi2_set_lanes(struct csi2_dev *csi2, int lanes)
 {
-	int lanes = csi2->bus.num_data_lanes;
-
 	writel(lanes - 1, csi2->base + CSI2_N_LANES);
 }
 
@@ -295,6 +293,7 @@ static void csi2ipu_gasket_init(struct csi2_dev *csi2)
 
 static int csi2_start(struct csi2_dev *csi2)
 {
+	u32 lanes = 0;
 	int ret;
 
 	ret = clk_prepare_enable(csi2->pix_clk);
@@ -310,7 +309,8 @@ static int csi2_start(struct csi2_dev *csi2)
 		goto err_disable_clk;
 
 	/* Step 4 */
-	csi2_set_lanes(csi2);
+	v4l2_subdev_call(csi2->src_sd, video, g_csi_active_lanes, &lanes);
+	csi2_set_lanes(csi2, lanes ?: csi2->bus.num_data_lanes);
 	csi2_enable(csi2, true);
 
 	/* Step 5 */
-- 
2.20.1

