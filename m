Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1509447A9
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 19:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729736AbfFMRBQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 13:01:16 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:32311 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729732AbfFLXqV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 19:46:21 -0400
X-Halon-ID: 414c1777-8d6c-11e9-8ab4-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [89.233.230.99])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 414c1777-8d6c-11e9-8ab4-005056917a89;
        Thu, 13 Jun 2019 01:46:10 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v3 5/8] rcar-vin: Move pm_runtime_{get,put} out of helpers
Date:   Thu, 13 Jun 2019 01:45:44 +0200
Message-Id: <20190612234547.14486-6-niklas.soderlund+renesas@ragnatech.se>
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

The helpers rvin_power_{on,off} deal with both VIN and the parallel
subdevice power. This makes it hard to merge the Gen2 and Gen3
open/release functions. Move the VIN power handling directly to the
open/release functions to prepare for the merge.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 37 ++++++++++++---------
 1 file changed, 22 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 71651c5a69483367..c84962073cf6027f 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -754,8 +754,6 @@ static int rvin_power_on(struct rvin_dev *vin)
 	int ret;
 	struct v4l2_subdev *sd = vin_to_source(vin);
 
-	pm_runtime_get_sync(vin->v4l2_dev.dev);
-
 	ret = v4l2_subdev_call(sd, core, s_power, 1);
 	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
 		return ret;
@@ -768,9 +766,6 @@ static int rvin_power_off(struct rvin_dev *vin)
 	struct v4l2_subdev *sd = vin_to_source(vin);
 
 	ret = v4l2_subdev_call(sd, core, s_power, 0);
-
-	pm_runtime_put(vin->v4l2_dev.dev);
-
 	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV)
 		return ret;
 
@@ -796,26 +791,36 @@ static int rvin_open(struct file *file)
 	struct rvin_dev *vin = video_drvdata(file);
 	int ret;
 
-	ret = mutex_lock_interruptible(&vin->lock);
-	if (ret)
+	ret = pm_runtime_get_sync(vin->dev);
+	if (ret < 0)
 		return ret;
 
+	ret = mutex_lock_interruptible(&vin->lock);
+	if (ret)
+		goto err_pm;
+
 	file->private_data = vin;
 
 	ret = v4l2_fh_open(file);
 	if (ret)
-		goto unlock;
+		goto err_unlock;
 
-	if (!v4l2_fh_is_singular_file(file))
-		goto unlock;
-
-	if (rvin_initialize_device(file)) {
-		v4l2_fh_release(file);
-		ret = -ENODEV;
+	if (v4l2_fh_is_singular_file(file)) {
+		ret = rvin_initialize_device(file);
+		if (ret)
+			goto err_open;
 	}
 
-unlock:
 	mutex_unlock(&vin->lock);
+
+	return 0;
+err_open:
+	v4l2_fh_release(file);
+err_unlock:
+	mutex_unlock(&vin->lock);
+err_pm:
+	pm_runtime_put(vin->dev);
+
 	return ret;
 }
 
@@ -842,6 +847,8 @@ static int rvin_release(struct file *file)
 
 	mutex_unlock(&vin->lock);
 
+	pm_runtime_put(vin->dev);
+
 	return ret;
 }
 
-- 
2.21.0

