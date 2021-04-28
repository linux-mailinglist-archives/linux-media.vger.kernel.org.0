Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB20D36DA31
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240606AbhD1OzD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:36930 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240317AbhD1Oxh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 685F261879;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=Brp5bgVOD7UqAef4tVuj+33Q8jgTwnd/UQoPNRzNrhM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bBel0c458xVTNXhFMhDP6jMZrIeVEIFcHPmpZBewo0yKSKpZgVxenB94QrDPwbt+E
         Q0gCQL5cWgZ5+Ih5ryyiIkdmCzAHUvoEFkftM4wSEuzQjShSdR3SRfv3TJH52oW2Zl
         QFdY1A7OptnBrWuhNv2t7BM2Pz86DMhgpsUZbv8Zz6jqA1/fRsYk6AzVvPdy3McFsn
         DBhUquXwc5Pm9qExlzl7gHhEFvAwx9cMSDKT19bodHvKdm9YEVDW8MJvjn2WVf3125
         rK06SbnCovYSolKlHHhkGlMxKf5Uo5P1pGttFZOnqm4oiiqT3+3+HXwCyY444G6w2o
         a4LYOFE/PDa3w==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001Dqw-CD; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 28/79] media: i2c: ccs-core: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:51:49 +0200
Message-Id: <d77d1dc187fbe1b91bdd1d6ef5a4485a7f7fe0ea.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/ccs/ccs-core.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index b05f409014b2..8cce80557128 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -1880,12 +1880,11 @@ static int ccs_pm_get_init(struct ccs_sensor *sensor)
 	struct i2c_client *client = v4l2_get_subdevdata(&sensor->src->sd);
 	int rval;
 
-	rval = pm_runtime_get_sync(&client->dev);
-	if (rval < 0) {
-		pm_runtime_put_noidle(&client->dev);
-
+	rval = pm_runtime_resume_and_get(&client->dev);
+	if (rval < 0)
 		return rval;
-	} else if (!rval) {
+
+	if (!rval) {
 		rval = v4l2_ctrl_handler_setup(&sensor->pixel_array->
 					       ctrl_handler);
 		if (rval)
@@ -3089,12 +3088,9 @@ static int __maybe_unused ccs_suspend(struct device *dev)
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

