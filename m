Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD1151FD6C
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 03:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727443AbfEPBqa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 May 2019 21:46:30 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:41767 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbfEPBPO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 May 2019 21:15:14 -0400
X-Halon-ID: 0c63be46-7778-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 0c63be46-7778-11e9-8ab4-005056917a89;
        Thu, 16 May 2019 03:15:10 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ulrich Hecht <uli@fpond.eu>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 6/8] rcar-vin: Merge helpers dealing with powering the parallel subdevice
Date:   Thu, 16 May 2019 03:14:15 +0200
Message-Id: <20190516011417.10590-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The two power helpers are now only dealing with the parallel subdevice,
merge them into a single rvin_power_parallel() helper to reduce code
duplication.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 5a9658b7d848fc86..7c8ba4b310706ceb 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -749,23 +749,13 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
  * File Operations
  */
 
-static int rvin_power_on(struct rvin_dev *vin)
+static int rvin_power_parallel(struct rvin_dev *vin, bool on)
 {
-	int ret;
 	struct v4l2_subdev *sd = vin_to_source(vin);
-
-	ret = v4l2_subdev_call(sd, core, s_power, 1);
-	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
-		return ret;
-	return 0;
-}
-
-static int rvin_power_off(struct rvin_dev *vin)
-{
+	int power = on ? 1 : 0;
 	int ret;
-	struct v4l2_subdev *sd = vin_to_source(vin);
 
-	ret = v4l2_subdev_call(sd, core, s_power, 0);
+	ret = v4l2_subdev_call(sd, core, s_power, power);
 	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
 		return ret;
 
@@ -777,7 +767,7 @@ static int rvin_initialize_device(struct file *file)
 	struct rvin_dev *vin = video_drvdata(file);
 	int ret;
 
-	ret = rvin_power_on(vin);
+	ret = rvin_power_parallel(vin, true);
 	if (ret < 0)
 		return ret;
 
@@ -844,7 +834,7 @@ static int rvin_release(struct file *file)
 	 * Then de-initialize hw module.
 	 */
 	if (fh_singular)
-		rvin_power_off(vin);
+		rvin_power_parallel(vin, false);
 
 	pm_runtime_put(vin->dev);
 
-- 
2.21.0

