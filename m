Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDFA31CF4B
	for <lists+linux-media@lfdr.de>; Tue, 16 Feb 2021 18:43:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbhBPRme (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Feb 2021 12:42:34 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:34421 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbhBPRmU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Feb 2021 12:42:20 -0500
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id CDD21200009;
        Tue, 16 Feb 2021 17:41:31 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/16] media: i2c: rdacm20: Replace goto with a loop
Date:   Tue, 16 Feb 2021 18:41:33 +0100
Message-Id: <20210216174146.106639-4-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
References: <20210216174146.106639-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

During the camera module initialization the image sensor PID is read to
verify it can correctly be identified. The current implementation is
rather confused and uses a loop implemented with a label and a goto.

Replace it with a more compact for() loop.

No functional changes intended.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/rdacm20.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/media/i2c/rdacm20.c b/drivers/media/i2c/rdacm20.c
index 4d9bac87cba8..6504ed0bd3bc 100644
--- a/drivers/media/i2c/rdacm20.c
+++ b/drivers/media/i2c/rdacm20.c
@@ -59,6 +59,8 @@
  */
 #define OV10635_PIXEL_RATE		(44000000)
 
+#define OV10635_PID_TIMEOUT		3
+
 static const struct ov10635_reg {
 	u16	reg;
 	u8	val;
@@ -452,7 +454,7 @@ static const struct v4l2_subdev_ops rdacm20_subdev_ops = {
 
 static int rdacm20_initialize(struct rdacm20_device *dev)
 {
-	unsigned int retry = 3;
+	unsigned int i;
 	int ret;
 
 	/* Verify communication with the MAX9271: ping to wakeup. */
@@ -501,23 +503,14 @@ static int rdacm20_initialize(struct rdacm20_device *dev)
 		return ret;
 	usleep_range(10000, 15000);
 
-again:
-	ret = ov10635_read16(dev, OV10635_PID);
-	if (ret < 0) {
-		if (retry--)
-			goto again;
-
-		dev_err(dev->dev, "OV10635 ID read failed (%d)\n",
-			ret);
-		return -ENXIO;
+	for (i = 0; i < OV10635_PID_TIMEOUT; ++i) {
+		ret = ov10635_read16(dev, OV10635_PID);
+		if (ret == OV10635_VERSION)
+			break;
+		usleep_range(1000, 2000);
 	}
-
-	if (ret != OV10635_VERSION) {
-		if (retry--)
-			goto again;
-
-		dev_err(dev->dev, "OV10635 ID mismatch (0x%04x)\n",
-			ret);
+	if (i == OV10635_PID_TIMEOUT) {
+		dev_err(dev->dev, "OV10635 ID read failed (%d)\n", ret);
 		return -ENXIO;
 	}
 
-- 
2.30.0

