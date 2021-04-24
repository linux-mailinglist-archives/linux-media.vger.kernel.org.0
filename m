Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A09369F54
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237321AbhDXGqw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:35790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233048AbhDXGqN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 731FF616E9;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=0+qUTNue9hnyAq3YJfJJPyrh70EsjiwzWG3y47ywjxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iYTceQj2r5AYgEH+uwH1IHT2pGFHqRwDLAb83lnwQyS3Us3nn6mnIQXss/PSwKzox
         QFe7PD8QxysGlQkmBekOkoWJrl9z1bcXglaL1MTBbV5vdBESHFbFQpJKcYzxCKb1DY
         5OfUHWjxre/q+l4jY/Q4b3NgQMMsTIZlduVSK5yaEwG0zsjbWTOk56vocGEHpoE6kw
         fGf7fW0dHdV2ny76xZqiktIcLDwxmwDL1oBct4z2Qn6mI877eHWblLWAJcMIkI5hjA
         nD4GIvLxaPvBcgmsEvoZx+lBRvoCd7XMfPfwTDQHXMCvqCrRWJpfKGhWXWyBUDukoU
         LJmK95gI4jp1A==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004Jf1-LY; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 27/78] media: i2c: dw9768: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:37 +0200
Message-Id: <874a9df13fdcb7e271757f50aa7a65ac55a07423.1619191723.git.mchehab+huawei@kernel.org>
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

