Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 911EC36DA5A
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240609AbhD1Oza (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:36784 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240407AbhD1Oxt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD4AB6195E;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=5KztMjooOddzA79l4hTCyOZrgNAAq7qVnwZ9IgWgZxo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ahmwxtg3NgVw85eqHO+0GHvc/GzU9SQ14ckCypEmh++q1GjZT6DB16z2v+Jy9HoFJ
         out4E2H4ma4+Th2HSG68e87BgrAA5tdjR4wOfenzvbd0pcvW6ZYrKHtk53h5INJQZl
         OExON+UxCqsVDYy7l6zzRItwuS3QM+IlMCHWRq8QClKKCSY+J+JSpxT82ErIvxhsOh
         YNt6SULpTdpcyZqXwBkf/mqlTQHTz/3AaxEySXV3d/T7e1PMIb47R9Odg5mUXGOL+a
         mZ3Vj7qCJFidnT5yUGXD89b9IrqsdiFrmkltc6MhlkmtpJg24tJdQRysVmaSEb8px+
         sjXeYKcSC1yjA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001Dro-T1; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 46/79] media: i2c: ov5647: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:07 +0200
Message-Id: <94e1540b6263c3ad4a95495a19cfeebe45c3295b.1619621413.git.mchehab+huawei@kernel.org>
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

