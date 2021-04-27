Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66E1B36C374
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237883AbhD0K2a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:48246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235582AbhD0K2E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 18BF7613D9;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=5KztMjooOddzA79l4hTCyOZrgNAAq7qVnwZ9IgWgZxo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o2IjPw+O3RDCDfvINsuAAjUbKtlFB8bHYrOcfddQjtwJeT39uZy5fD2m805/5P1op
         FvdgScUKEFYEBlkmmx9YoEgofu5QilzgXndyzVIhRKz90jWXJ4mu8yVSNpx8ASgtRP
         mNebCgq9nAJzZCdl7Gp5XNb02G4yM2BKVJ7rR1eL13jvNNIzQokrltPUCXAu5Qnyf0
         jQ9NkDAR4Nk+BbZJXTw3w1OO5wnVIf9FrhnyrqiCxHr+tTcQC7MjU3Q8iEP2SmcAM2
         +2XqC2uhbCo8cRvQpfBYGaFTWjG0tM4HHjCiFt4w6zwKzBlQOGProuXqmNUEk0Q1pq
         btHrLtKKARIiw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o1X-KW; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 48/79] media: i2c: ov5647: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:38 +0200
Message-Id: <b26111c4979805011ccc7796b2a71c620ca6bf90.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
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

Acked-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/ov5647.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 1cefa15729ce..38faa74755e3 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -882,20 +882,20 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0)
 			goto error_unlock;
 
 		ret = ov5647_stream_on(sd);
 		if (ret < 0) {
 			dev_err(&client->dev, "stream start failed: %d\n", ret);
-			goto error_unlock;
+			goto error_pm;
 		}
 	} else {
 		ret = ov5647_stream_off(sd);
 		if (ret < 0) {
 			dev_err(&client->dev, "stream stop failed: %d\n", ret);
-			goto error_unlock;
+			goto error_pm;
 		}
 		pm_runtime_put(&client->dev);
 	}
@@ -905,8 +905,9 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 
 	return 0;
 
+error_pm:
+	pm_runtime_put(&client->dev);
 error_unlock:
-	pm_runtime_put(&client->dev);
 	mutex_unlock(&sensor->lock);
 
 	return ret;
-- 
2.30.2

