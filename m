Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDD636DA37
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240639AbhD1OzG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:36988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240326AbhD1Oxi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7751061919;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=0+qUTNue9hnyAq3YJfJJPyrh70EsjiwzWG3y47ywjxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kZYQjvfvhj1aJdZA87Qo2tYzNOlo0crwo9kTyi869bQwn7THlTT407oXgECg7uArJ
         u4PijVWWQ2QHK3c/Reto5ar1v2kOoVQjjNRaPWFbWTKoero8JTobM/POKf6ZfzepHj
         kGN13CMlYYgSnh6fHLVf9o3f/Z44e+xk7voO8SuzW2FZOvb+1fZo77h8Gw4Zmaosje
         5wRaHZ3M8D1nzL9kQ+ZIM27gCl0G/Y/fx0mtjKXi9pTOPZX7PuzlJ9+sp9/SLeKAoZ
         TYiNFHj+5k4EffrgGZcGzzK9RlkWyc6F54g1abo9wMykUjK+LYXTrK1elpAytn28n4
         WmMWAv1ZkHWLg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001Dr2-E0; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 30/79] media: i2c: dw9768: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:51:51 +0200
Message-Id: <40f2a0ec3a7436023e926c0a86bef897678076d0.1619621413.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/dw9768.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
index 8b8cb4b077b5..c086580efac7 100644
--- a/drivers/media/i2c/dw9768.c
+++ b/drivers/media/i2c/dw9768.c
@@ -374,15 +374,7 @@ static const struct v4l2_ctrl_ops dw9768_ctrl_ops = {
 
 static int dw9768_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	int ret;
-
-	ret = pm_runtime_get_sync(sd->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(sd->dev);
-		return ret;
-	}
-
-	return 0;
+	return pm_runtime_resume_and_get(sd->dev);
 }
 
 static int dw9768_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
-- 
2.30.2

