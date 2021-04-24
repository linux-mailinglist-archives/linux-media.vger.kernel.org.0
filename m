Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BABDF369F93
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244302AbhDXGs0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:36102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237084AbhDXGqi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DF5A61977;
        Sat, 24 Apr 2021 06:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=kj4qeX96m5mkAS+YAPL7lF2a6B3Iu94jraRym6TAeEU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iTdkyW+iIBhr0tT1A9wGp3W6yPko2GcnPWPlIw+YHkKdxBTXZOOCaqCh933O66sRS
         5F58H78YDMJ53cmdLloV6Xg7k9wTJlF5O+2AjlOa5tzpT5oxzfnYzBYRZcEGLTeVBT
         uIIEHK1+msLh8Jbkx/pOEgdFTiJu/XItj6pA1D+3QAVmOkQZlXM8yu2+HHP4WqWvAi
         CKreol0VUJWp21kI5icqKF4kUjeEyzXPLKYw8VxxhgrZbuksy4TDKgp9ourpTK7zAO
         NFIchOyVjdS4SVZuafLMmG2q/754Fl9LVOIsYuU/02RetdD51VtP0HpG7AAoEjkRjF
         9866qxt28lJLQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jg5-9o; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 49/78] media: i2c: ov7740: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:59 +0200
Message-Id: <ec7514ee656a623807aab03b6b70f473c6c884c8.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov7740.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 47a9003d29d6..849a1ce61cf7 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -624,11 +624,9 @@ static int ov7740_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto err_unlock;
-		}
 
 		ret = ov7740_start_streaming(ov7740);
 		if (ret)
@@ -1165,7 +1163,7 @@ static int ov7740_remove(struct i2c_client *client)
 	v4l2_async_unregister_subdev(sd);
 	ov7740_free_controls(ov7740);
 
-	pm_runtime_get_sync(&client->dev);
+	pm_runtime_resume_and_get(&client->dev);
 	pm_runtime_disable(&client->dev);
 	pm_runtime_set_suspended(&client->dev);
 	pm_runtime_put_noidle(&client->dev);
-- 
2.30.2

