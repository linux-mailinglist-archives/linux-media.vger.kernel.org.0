Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61D5A42DA72
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 15:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbhJNNd6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Oct 2021 09:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhJNNd5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Oct 2021 09:33:57 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A352CC061753
        for <linux-media@vger.kernel.org>; Thu, 14 Oct 2021 06:31:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mb0pq-0002ur-O8; Thu, 14 Oct 2021 15:31:50 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mb0pq-0006tz-2u; Thu, 14 Oct 2021 15:31:50 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mb0pq-001X0c-1q; Thu, 14 Oct 2021 15:31:50 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Marek Vasut <marex@denx.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de, Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v6 1/3] media: imx6-mipi-csi2: use pre_streamon callback to set sensor into LP11
Date:   Thu, 14 Oct 2021 15:31:48 +0200
Message-Id: <20211014133150.365169-2-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211014133150.365169-1-m.tretter@pengutronix.de>
References: <20211014133150.365169-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Step 5 expects that the sensor is in LP11 mode. Use the new
pre_streamon callback to signal the sensor that it should switch into
LP11.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changelog:

v6: none

v5:

- ignore -ENOIOCTLCMD of pre_streamon for backwards compatibility

v4:

- new patch
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index a0941fc2907b..558b256ac935 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -382,13 +382,17 @@ static int csi2_start(struct csi2_dev *csi2)
 	csi2_enable(csi2, true);
 
 	/* Step 5 */
+	ret = v4l2_subdev_call(csi2->src_sd, video, pre_streamon,
+			       V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP);
+	if (ret && ret != -ENOIOCTLCMD)
+		goto err_assert_reset;
 	csi2_dphy_wait_stopstate(csi2, lanes);
 
 	/* Step 6 */
 	ret = v4l2_subdev_call(csi2->src_sd, video, s_stream, 1);
 	ret = (ret && ret != -ENOIOCTLCMD) ? ret : 0;
 	if (ret)
-		goto err_assert_reset;
+		goto err_stop_lp11;
 
 	/* Step 7 */
 	ret = csi2_dphy_wait_clock_lane(csi2);
@@ -399,6 +403,8 @@ static int csi2_start(struct csi2_dev *csi2)
 
 err_stop_upstream:
 	v4l2_subdev_call(csi2->src_sd, video, s_stream, 0);
+err_stop_lp11:
+	v4l2_subdev_call(csi2->src_sd, video, post_streamoff);
 err_assert_reset:
 	csi2_enable(csi2, false);
 err_disable_clk:
@@ -410,6 +416,7 @@ static void csi2_stop(struct csi2_dev *csi2)
 {
 	/* stop upstream */
 	v4l2_subdev_call(csi2->src_sd, video, s_stream, 0);
+	v4l2_subdev_call(csi2->src_sd, video, post_streamoff);
 
 	csi2_enable(csi2, false);
 	clk_disable_unprepare(csi2->pix_clk);
-- 
2.30.2

