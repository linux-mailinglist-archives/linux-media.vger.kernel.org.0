Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCAA3737DA
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232791AbhEEJn1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:48606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232479AbhEEJnR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7741D61446;
        Wed,  5 May 2021 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207739;
        bh=ZvB0kCnsWXmqDZUIE7RhcVC4zNhkwQXSnjsZuZbrwzk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ttN15YcDg/8LjwKPSaQXPIB7se9k3TEAQLs1TFeJzEoPUkKhE7zNBl40yIoQIzapp
         PF50lMwXs1VeD8D0YRPfnQnnI4iVcCYVnLuLw6ZKzmePdNwIkHNztSWQKvksOXeg3I
         QZWuOsuCczpPQCtdh/bbs2CQEDYn79FkUVw0kSeCe5R60J/pdDBeaQfQLgPh2zCZDw
         Q76PFBDtJc3i22trRB42YzJUvIxMnb+AiuGk6LU0jKUjrC9TR5k6zeZu7K/RCD5Qvc
         oBp8t4q6ixb47deDMFLbX8zT3exft96GZHmyGJHyxT+cNO6Ab5UrhZoVqAB30IQm7q
         8406fJdSSP3ig==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2r-00AHwm-Ew; Wed, 05 May 2021 11:42:17 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 20/25] media: sti/delta: use pm_runtime_resume_and_get()
Date:   Wed,  5 May 2021 11:42:10 +0200
Message-Id: <a2056fdad3cd3d87b5e9653dc18deca83bb554c2.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/sti/delta/delta-v4l2.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/sti/delta/delta-v4l2.c b/drivers/media/platform/sti/delta/delta-v4l2.c
index c691b3d81549..064a00a3084a 100644
--- a/drivers/media/platform/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/sti/delta/delta-v4l2.c
@@ -954,10 +954,8 @@ static void delta_run_work(struct work_struct *work)
 	/* enable the hardware */
 	if (!dec->pm) {
 		ret = delta_get_sync(ctx);
-		if (ret) {
-			delta_put_autosuspend(ctx);
+		if (ret)
 			goto err;
-		}
 	}
 
 	/* decode this access unit */
@@ -1277,9 +1275,9 @@ int delta_get_sync(struct delta_ctx *ctx)
 	int ret = 0;
 
 	/* enable the hardware */
-	ret = pm_runtime_get_sync(delta->dev);
+	ret = pm_runtime_resume_and_get(delta->dev);
 	if (ret < 0) {
-		dev_err(delta->dev, "%s pm_runtime_get_sync failed (%d)\n",
+		dev_err(delta->dev, "%s pm_runtime_resume_and_get failed (%d)\n",
 			__func__, ret);
 		return ret;
 	}
-- 
2.30.2

