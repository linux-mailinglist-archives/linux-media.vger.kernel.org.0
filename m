Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2B2369F99
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237438AbhDXGsg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:35726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237190AbhDXGql (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE77661949;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=xpeO+TqQL6lcPMvPb2Bdk8szQoSs+InwQYAk6UJzVbA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EojMO9FXSFHyxT7wcTLwfBO+LP3dFMh71/mr6tVQ86V0IDwOroL/JmtRbx5wF6QY1
         V7DVxtNg9fsZyBvZV3/eNpaM+vNAspnats775oaSl46h0TDRVjAFN9rQzGwntE85rN
         rCo5zwFSM1WSNxBfI7lsauwSHh34jIBG0OEdvMDAKsW8c5o/N71fHoX/ycyXCRrVdC
         RsE1lYSG9Ub8rFzzziU1YnX6j22F8CvjYcFLqyrRYvsqJZJmlPDns5myNl+kEk8tue
         Ho4SXO0gyrjQpF1QRkSLhJ3DRzB9nsgb9TkjvobMZVH84LqavWSOy0Bkblj5rYPkls
         eDST0qplfsVig==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004JgK-Eh; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 54/78] media: i2c: video-i2c: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:04 +0200
Message-Id: <3990190ef127055dc87cbc6b3f9065dd919b8508.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/video-i2c.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index 0465832a4090..5cde7da698bd 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -286,11 +286,9 @@ static int amg88xx_read(struct device *dev, enum hwmon_sensor_types type,
 	__le16 buf;
 	int tmp;
 
-	tmp = pm_runtime_get_sync(regmap_get_device(data->regmap));
-	if (tmp < 0) {
-		pm_runtime_put_noidle(regmap_get_device(data->regmap));
+	tmp = pm_runtime_resume_and_get(regmap_get_device(data->regmap));
+	if (tmp < 0)
 		return tmp;
-	}
 
 	tmp = regmap_bulk_read(data->regmap, AMG88XX_REG_TTHL, &buf, 2);
 	pm_runtime_mark_last_busy(regmap_get_device(data->regmap));
@@ -512,11 +510,9 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (data->kthread_vid_cap)
 		return 0;
 
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
 		goto error_del_list;
-	}
 
 	ret = data->chip->setup(data);
 	if (ret)
@@ -893,7 +889,7 @@ static int video_i2c_remove(struct i2c_client *client)
 {
 	struct video_i2c_data *data = i2c_get_clientdata(client);
 
-	pm_runtime_get_sync(&client->dev);
+	pm_runtime_resume_and_get(&client->dev);
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 	pm_runtime_put_noidle(&client->dev);
-- 
2.30.2

