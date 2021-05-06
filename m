Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26DC537569B
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235320AbhEFPYz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:38228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235205AbhEFPYd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 771F7613F1;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=5KztMjooOddzA79l4hTCyOZrgNAAq7qVnwZ9IgWgZxo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AO1K+ztJy0oV30u1iC4G7m4X8l+MgPWqY2fFg9YCKesRQgzoTTol8SMCbMhZfsURh
         AWfTXx7dLckj+KX647RhVkO3YeWNaek1NYfTVhLG53FiSuuKgZCmIHKHQZ0PdIcgud
         cBiJf45DCpFYjkG49aKiZv3UiMEjaNmYXUvrlbkFbqiKdxpnyl4tjLi0Y5xyZXwDGT
         Z9jyd6+CbHDlvVzCwUD6PD9igTy+ECIKoipy1APajZ5CYUCzDelC/aYvmGOFPcUymb
         Vxjwhjf5MG0nLaAs5Z8J+ksWgrpSD/uaX7yre16wtldola1rwVYSsqPfw/ymzSJmHf
         kS6q0MPiixGCQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000Rvm-Kq; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 19/30] media: i2c: ov5647: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:15 +0200
Message-Id: <dd155df40ad4f2004ce4eb40a226d49107121a65.1620314098.git.mchehab+huawei@kernel.org>
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

