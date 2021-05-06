Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B400375694
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235290AbhEFPYw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:38140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235194AbhEFPYa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5259B613D6;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=/7W/4D4Cg4pCxHEZGuCJQ5dkGl7p2HK4IsN3mgaNluw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tQ4R55NhcEmhgwPD+YxHuSRhF87CqsZWODJTKE1snxuW1bRlxU7H49POkm++QU6WN
         IFBlP/FSQi6VgncF9xPgGngjKqeaeEEaSr+JrF4u+YDS2SDBUrsuv27Du3GV3er1ol
         qBPaMSEYDf0yTGHEAy9wZ7PF0xtJ+n+4EnrhuXJGQuePGrtXkT/1IVy7Z+2sUosHX1
         8FVnzJl9/0exitPZF642OS6JtjoJ+03dee6SUM/IKE78U7RcAx/QOh1pvI41qt2Wun
         RY+EXU4GVsbi26ncgNjyLaL+74j33xoMQB0hGO5eC05roQYn7/oWEO7Sdu+TBI9lqm
         XR9vvCiWOdHpw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000RvO-Cv; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 13/30] media: i2c: mt9m001: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:09 +0200
Message-Id: <45d7459c994ea66c0a4745ca5a105e7cf1129575.1620314098.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314098.git.mchehab+huawei@kernel.org>
References: <cover.1620314098.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/mt9m001.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index 3b0ba8ed5233..58c85a3bccf6 100644
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
@@ -834,6 +835,10 @@ static int mt9m001_remove(struct i2c_client *client)
 {
 	struct mt9m001 *mt9m001 = to_mt9m001(client);
 
+	/*
+	 * As it increments RPM usage_count even on errors, we don't need to
+	 * check the returned code here.
+	 */
 	pm_runtime_get_sync(&client->dev);
 
 	v4l2_async_unregister_subdev(&mt9m001->subdev);
-- 
2.30.2

