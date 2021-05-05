Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4669A3737EC
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbhEEJnl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:48708 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232504AbhEEJnR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA8CE61581;
        Wed,  5 May 2021 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207739;
        bh=n8BdYNFKHpGuvTsaDKiqExH9RPNm4SzImqrTD24XJEw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=D5T/Giy9UwbacLo5/r243zsPBZ7bkoG9N39UtkebzGibE2JzsvfvECZm6Zbguc6Uu
         GTLD3m8D6+iHXCihxX/T3oEYcyShEYVZ6ZuebL91GQWXu2ErP1Pin4TxjkmC0Z3Mn4
         /Rlz+WQTgF+x/qdH+qzMCxRvzMCOQpnUsbHZsPs2Oi0fV4xStJEi6cNxY96KVK42Ee
         lfbW+cPG8uR0sAT5xyjz37bkVSrTe7am2zPJQAnYECVG0ALKFGx2k9aPchNc6zBr/E
         Ursdkl9WjSgrF4HHILE35g25HfkopYqDbw/2QlF3c7I64raujdA+cbcWmF0ZLGalk4
         daiAuIpELUvOw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2r-00AHx1-Lz; Wed, 05 May 2021 11:42:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 25/25] media: i2c: ccs-core: fix pm_runtime_get_sync() usage count
Date:   Wed,  5 May 2021 11:42:15 +0200
Message-Id: <83ec24acb15f17e2ce589575c2f5eb7bdd1daf28.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.

There is a bug at ccs_pm_get_init(): when this function returns
an error, the stream is not started, and RPM usage_count
should not be incremented. However, if the calls to
v4l2_ctrl_handler_setup() return errors, it will be kept
incremented.

At ccs_suspend() the best is to replace it by the new
pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter automatically,
in the case of errors.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/ccs/ccs-core.c | 39 ++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index b05f409014b2..04c3ab9e37b4 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1880,21 +1880,33 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
+	/*
+	 * It can't use pm_runtime_resume_and_get() here, as the driver
+	 * relies at the returned value to detect if the device was already
+	 * active or not.
+	 */
 	rval = pm_runtime_get_sync(&client->dev);
-	if (rval < 0) {
-		pm_runtime_put_noidle(&client->dev);
+	if (rval < 0)
+		goto error;
 
-		return rval;
-	} else if (!rval) {
-		rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->
-					       ctrl_handler);
-		if (rval)
-			return rval;
+	/* Device was already active, so don't set controls */
+	if (rval == 1)
+		return 0;
 
-		return v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
-	}
+	/* Restore V4L2 controls to the suspended device */
+	rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->ctrl_handler);
+	if (rval)
+		goto error;
 
+	rval = v4l2_ctrl_handler_setup(&sensor->src->ctrl_handler);
+	if (rval)
+		goto error;
+
+	/* Keep PM runtime usage_count incremented on success */
 	return 0;
+error:
+	pm_runtime_put_noidle(&client->dev);
+	return rval;
 }
 
 static int ccs_set_stream(struct v4l2_subdev *subdev, int enable)
@@ -3089,12 +3101,9 @@ static int __maybe_unused ccs_suspend(struct device *dev)
 	bool streaming = sensor->streaming;
 	int rval;
 
-	rval = pm_runtime_get_sync(dev);
-	if (rval < 0) {
-		pm_runtime_put_noidle(dev);
-
+	rval = pm_runtime_resume_and_get(dev);
+	if (rval < 0)
 		return rval;
-	}
 
 	if (sensor->streaming)
 		ccs_stop_streaming(sensor);
-- 
2.30.2

