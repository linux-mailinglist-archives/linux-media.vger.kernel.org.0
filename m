Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D859C369F74
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242483AbhDXGri (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:35850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233626AbhDXGqU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA7606193F;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=XV1aFn/9IHvqaI3bNO5mEA5OXRMeQJuzMBPERWbm1lc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YDufxags8Yy2ihXmzrgCGfQA5W3ONdMbGdY2XOLLwAjHtSUCGTDoT+jwb2CbNrQDB
         gARYqH+DSBuMOJ6Eh0UYtXhQUmGnoQpKSzvQkqR4CHYlwYEw26HRaxm/Ofh51nR4gk
         8NeqYiAVkrGib++ooyfu+VwFeXXfnmatNR91eSs2iwRgRb26vhZxQtLvf8vMCIxexU
         tcT6Hxm27Rky05JLCeZ1jz4nGP/xeOPs0b0p11fN5zPuQq2Xv1fIr8t0tiENEA8URi
         6DNVnGhKt4DXF2CZEWgCeTrSzqwHhZ0xmoTgeWyUmOw7gqAoVJymNDz8RuzFMUvdoK
         lZux7sBo7Dy3Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004JfY-Vi; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 38/78] media: i2c: mt9m001: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:48 +0200
Message-Id: <beddb7295807f43a190f2add6c1665b7475cb154.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/mt9m001.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 3b0ba8ed5233..57e15a291ebd 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -217,9 +217,9 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
 		goto done;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0)
-			goto put_unlock;
+			goto unlock;
 
 		ret = mt9m001_apply_selection(sd);
 		if (ret)
@@ -247,6 +247,7 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
 
 put_unlock:
 	pm_runtime_put(&client->dev);
+unlock:
 	mutex_unlock(&mt9m001->mutex);
 
 	return ret;
@@ -834,7 +835,7 @@ static int mt9m001_remove(struct i2c_client *client)
 {
 	struct mt9m001 *mt9m001 = to_mt9m001(client);
 
-	pm_runtime_get_sync(&client->dev);
+	pm_runtime_resume_and_get(&client->dev);
 
 	v4l2_async_unregister_subdev(&mt9m001->subdev);
 	media_entity_cleanup(&mt9m001->subdev.entity);
-- 
2.30.2

