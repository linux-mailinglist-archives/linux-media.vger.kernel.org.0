Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66C09447AA
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 19:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729737AbfFMRBQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 13:01:16 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:17092 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729733AbfFLXqV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 19:46:21 -0400
X-Halon-ID: 41a26adf-8d6c-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 41a26adf-8d6c-11e9-8ab4-005056917a89;
        Thu, 13 Jun 2019 01:46:11 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 6/8] rcar-vin: Merge helpers dealing with powering the parallel subdevice
Date:   Thu, 13 Jun 2019 01:45:45 +0200
Message-Id: <20190612234547.14486-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612234547.14486-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190612234547.14486-1-niklas.soderlund+renesas@ragnatech.se>
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
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index c84962073cf6027f..5a01b617c87dccf1 100644
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
 
@@ -843,7 +833,7 @@ static int rvin_release(struct file *file)
 	 * Then de-initialize hw module.
 	 */
 	if (fh_singular)
-		rvin_power_off(vin);
+		rvin_power_parallel(vin, false);
 
 	mutex_unlock(&vin->lock);
 
-- 
2.21.0

