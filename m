Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 719BA369F8D
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237654AbhDXGsS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:35790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236929AbhDXGqe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0785B61965;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=zHjujpboN+Iu7V2XpqIB+1lLAb+rrUx5c1q69NYA2sw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PVHdHZHKy32AJX6z0RlftLzQfQ9vmX2UAWgH/fiy6vaPsAUZifgwHMcrEHYl0YNEN
         oXVieMZe+1HnZ9swktNOb0CrBxEwDsIxv43UsCXyR7wLXzG65Mv6EI/UbROHWN3nbw
         enwErXQszrqrDbsipA7JJGYVR6WIh6Zt4ZosPzfO5Zbn7WSaEUDIppOEQ4SyL8ZqAp
         FYb4agfu81cseTYxdgAVmP80XJ3fkGehtJzgVmDb2vls/984Kl1z3mgAbzpkfNr9ek
         sQN++4m42Zsgid+Ji5Ov6GKkxkmhWwFkyMT2fcRWGn3nFnrKCmd6GZ5e0zi+f31xUd
         l3wPs3V1jt0Jw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jfk-3A; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 42/78] media: i2c: ov2685: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:52 +0200
Message-Id: <c6e3213be240708e296c6f798ba8055463082530.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov2685.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index 49a2dcedb347..2f3836dd8eed 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -456,11 +456,10 @@ static int ov2685_s_stream(struct v4l2_subdev *sd, int on)
 		goto unlock_and_return;
 
 	if (on) {
-		ret = pm_runtime_get_sync(&ov2685->client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&ov2685->client->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
+
 		ret = __v4l2_ctrl_handler_setup(&ov2685->ctrl_handler);
 		if (ret) {
 			pm_runtime_put(&client->dev);
-- 
2.30.2

