Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2DE136C2A2
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235590AbhD0KPP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:35440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235431AbhD0KOg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 062706144C;
        Tue, 27 Apr 2021 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518432;
        bh=28FtFakpR3rMJfq6Bb1gqJsNDZKdyp2sz2lduteJODo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FPNbE5nvd5YpPeTBT2kyoogDBEOGld3+cFvgZPDqTIwA3lWdLvbhLPA2ZfzamiY6+
         kThoKGuHEXxbZWscVB3AO73vjTt4sQRennk37o5vbn4MJcd+hOTYqT6PT8DPm7gbG8
         ZInVnxt/u+MkYR6AQjHGQjIhOwihuNR3ZLrcdXZKcNJioCHdhjH40sf1nQO0v4GlZT
         hVZs1hGD9YvQ7LRGL+8zwNbbi4W8UxOuNWtsiYp2YBuUyvkp/ATFhlQvfYczRIVa6d
         NUJCHCQAoUDumszlC+hnE5HzQVtlSycTrS9WJK7TZWS9X97izW1y78epDX/EuneUrc
         zGic7iyvVlWDg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiz-000j6B-O6; Tue, 27 Apr 2021 12:13:49 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Tu <shawnx.tu@intel.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v2 33/79] media: i2c: hi556: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:00 +0200
Message-Id: <76930655db6343fd23125747fcb0b6d6a011e3f9.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/hi556.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/hi556.c b/drivers/media/i2c/hi556.c
index 6f05c1138e3b..627ccfa34835 100644
--- a/drivers/media/i2c/hi556.c
+++ b/drivers/media/i2c/hi556.c
@@ -813,9 +813,8 @@ static int hi556_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&hi556->mutex);
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
 			mutex_unlock(&hi556->mutex);
 			return ret;
 		}
-- 
2.30.2

