Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB7EABAA73
	for <lists+linux-media@lfdr.de>; Sun, 22 Sep 2019 21:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731569AbfIVT0f (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 22 Sep 2019 15:26:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:49890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406185AbfIVSvq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 22 Sep 2019 14:51:46 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D415C21BE5;
        Sun, 22 Sep 2019 18:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569178305;
        bh=UgYhas+Ne82pUddsBnQzmIKiDCnGAB4Tisqknu33vB4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=noLYj7ie6c+p+EmE10P075hB5XLE7lEotGIqV7+SysfO5iWafAbqizP/SFvvrWK1Y
         A7pnwDTgDH2yV3s/5M8tr3O4R8RSJdFTSpSmRSZ9gHrZswvu6ad4iKKbQZIUthis8V
         H9nKqkRDjOW0Bk/CE8SY+sg7hXPxy2wzlsKqzDAo=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH AUTOSEL 5.2 076/185] media: imx: mipi csi-2: Don't fail if initial state times-out
Date:   Sun, 22 Sep 2019 14:47:34 -0400
Message-Id: <20190922184924.32534-76-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922184924.32534-1-sashal@kernel.org>
References: <20190922184924.32534-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Ezequiel Garcia <ezequiel@collabora.com>

[ Upstream commit 0d5078c7172c46db6c58718d817b9fcf769554b4 ]

Not all sensors will be able to guarantee a proper initial state.
This may be either because the driver is not properly written,
or (probably unlikely) because the hardware won't support it.

While the right solution in the former case is to fix the sensor
driver, the real world not always allows right solutions, due to lack
of available documentation and support on these sensors.

Let's relax this requirement, and allow the driver to support stream start,
even if the sensor initial sequence wasn't the expected.

Also improve the warning message to better explain the problem and provide
a hint that the sensor driver needs to be fixed.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Steve Longerbeam <slongerbeam@gmail.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index f29e28df36ed8..bfa4b254c4e48 100644
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
@@ -254,11 +254,9 @@ static int csi2_dphy_wait_stopstate(struct csi2_dev *csi2)
 	ret = readl_poll_timeout(csi2->base + CSI2_PHY_STATE, reg,
 				 (reg & mask) == mask, 0, 500000);
 	if (ret) {
-		v4l2_err(&csi2->sd, "LP-11 timeout, phy_state = 0x%08x\n", reg);
-		return ret;
+		v4l2_warn(&csi2->sd, "LP-11 wait timeout, likely a sensor driver bug, expect capture failures.\n");
+		v4l2_warn(&csi2->sd, "phy_state = 0x%08x\n", reg);
 	}
-
-	return 0;
 }
 
 /* Wait for active clock on the clock lane. */
@@ -316,9 +314,7 @@ static int csi2_start(struct csi2_dev *csi2)
 	csi2_enable(csi2, true);
 
 	/* Step 5 */
-	ret = csi2_dphy_wait_stopstate(csi2);
-	if (ret)
-		goto err_assert_reset;
+	csi2_dphy_wait_stopstate(csi2);
 
 	/* Step 6 */
 	ret = v4l2_subdev_call(csi2->src_sd, video, s_stream, 1);
-- 
2.20.1

