Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B831369F6B
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237617AbhDXGr0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:35964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233250AbhDXGqQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 943FE6191E;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=28FtFakpR3rMJfq6Bb1gqJsNDZKdyp2sz2lduteJODo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sWbmqn5j/5JIA4+Fm5etPzE7WnxsjngfShl2ocEdvYvJY8llac/yYyTiKveHH7kKX
         KPLIbrCLgwLVaCWMSeUOIaFHIiBhopK+7XokkMDRMZgfZhygbC8jCYijSBfLnA3b9Z
         yU4ekrTDjUPYP9H/JdcX/vEASDmMwKV3YDnu4R49QNXW/GH4YIGE+yQp0o3kESFdk0
         kBCEhgi5wbtCknR3fvO/gOqZ0veENhVI0O3KAfCqZFwZH2+rqe6brAV0KMhfxNzOKA
         Z76q4vILlb1KP1AdwGs7QDYDKzagIJ5KB6ZOnN32r2sSgVFbMYIu7sfZDfnHjOj8DL
         AXiUyi2szbOsQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004Jf7-NN; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Tu <shawnx.tu@intel.com>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 29/78] media: i2c: hi556: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:39 +0200
Message-Id: <345769edeafd0166a19f60a95c1ea2427d8d8596.1619191723.git.mchehab+huawei@kernel.org>
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

