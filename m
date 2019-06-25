Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4765590A
	for <lists+linux-media@lfdr.de>; Tue, 25 Jun 2019 22:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727662AbfFYUjz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jun 2019 16:39:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59402 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbfFYUjz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jun 2019 16:39:55 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 22532287141
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH] media: imx: mipi csi-2: Don't fail if initial state times-out
Date:   Tue, 25 Jun 2019 17:39:45 -0300
Message-Id: <20190625203945.28081-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Not all sensors will be able to guarantee a proper initial state.
This may be either because the driver is not properly written,
or (probably unlikely) because the hardware won't support it.

While the right solution in the former case is to fix the sensor
driver, the real world not always allows right solutions, due to lack
of available documentation and support on these sensors.

Let's relax this requirement, and allow the driver to support stream start,
even if the sensor initial sequence wasn't the expected.
A warning is still emitted, so users should be hinted that something is off.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 33 ++++++----------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index f29e28df36ed..10342434e797 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -243,7 +243,7 @@ static int __maybe_unused csi2_dphy_wait_ulp(struct csi2_dev *csi2)
 }
 
 /* Waits for low-power LP-11 state on data and clock lanes. */
-static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
+static void csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
 {
 	u32 mask, reg;
 	int ret;
@@ -253,29 +253,21 @@ static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
 
 	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
 				 (reg & mask) == mask, 0, 500000);
-	if (ret) {
-		v4l2_err(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
-		return ret;
-	}
-
-	return 0;
+	if (ret)
+		v4l2_warn(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
 }
 
 /* Wait for active clock on the clock lane. */
-static int csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
+static void csi2_dphy_wait_clock_lane(struct csi2_dev *csi2)
 {
 	u32 reg;
 	int ret;
 
 	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
 				 (reg & PHY_RXCLKACTIVEHS), 0, 500000);
-	if (ret) {
-		v4l2_err(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",
-			 reg);
-		return ret;
-	}
-
-	return 0;
+	if (ret)
+		v4l2_warn(&csi2->sd, "clock lane timeout, phy_state = 0x%08x\n",
+			  reg);
 }
 
 /* Setup the i.MX CSI2IPU Gasket */
@@ -316,9 +308,7 @@ static int csi2_start(struct csi2_dev *csi2)
 	csi2_enable(csi2, true);
 
 	/* Step 5 */
-	ret = csi2_dphy_wait_stopstate(csi2);
-	if (ret)
-		goto err_assert_reset;
+	csi2_dphy_wait_stopstate(csi2);
 
 	/* Step 6 */
 	ret = v4l2_subdev_call(csi2->src_sd, video, s_stream, 1);
@@ -327,14 +317,9 @@ static int csi2_start(struct csi2_dev *csi2)
 		goto err_assert_reset;
 
 	/* Step 7 */
-	ret = csi2_dphy_wait_clock_lane(csi2);
-	if (ret)
-		goto err_stop_upstream;
-
+	csi2_dphy_wait_clock_lane(csi2);
 	return 0;
 
-err_stop_upstream:
-	v4l2_subdev_call(csi2->src_sd, video, s_stream, 0);
 err_assert_reset:
 	csi2_enable(csi2, false);
 err_disable_clk:
-- 
2.20.1

