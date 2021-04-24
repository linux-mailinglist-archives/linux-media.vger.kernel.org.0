Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 265FA369F8C
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232724AbhDXGsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:35972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236878AbhDXGqe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C5566196A;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=k96A/wu5csXQdkebmEvDXUWzQhtBwXxGUFyh7/8ot0s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n3vh4XOgYA9/FT+HzWCpjNDHsyfGRv0q/MiJzFJwbWkOec3/LKr8JGRqvhZn2g9z6
         BL0GDvAU0qZfds2lv+bfxaxIgxYz+BOHHoKKjx9PtyZH+4UKlDVByQ51ztNSEwXGit
         nsUKDWW36Fy/flsbHdRk49vIKdFpmQtybXt502UYwrnIxY33GvsEuz0IVK9jTl3QOL
         hrHTE9PwjVf2Bn9GHdBSZkyQ2e69joIGvqPjsokYMpvDkRaDwLgvy6Y8DuOtQ07ZxC
         6wwatWnpgnHilBl5/30n0tbUdo+2HRYvYCvDbHsA3XqEqnM++WEKNSh8IAmDN33Xc5
         HUKZhrIR/OSGA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jfw-77; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 46/78] media: i2c: ov5670: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:56 +0200
Message-Id: <6c8a7094e85bb0b93ccd6b9afead783fff6cb12c.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov5670.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
index dee7df8dd100..182f271f118f 100644
--- a/drivers/media/i2c/ov5670.c
+++ b/drivers/media/i2c/ov5670.c
@@ -2347,11 +2347,9 @@ static int ov5670_set_stream(struct v4l2_subdev *sd, int enable)
 		goto unlock_and_return;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
 
 		ret = ov5670_start_streaming(ov5670);
 		if (ret)
-- 
2.30.2

