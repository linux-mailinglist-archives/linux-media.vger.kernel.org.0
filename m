Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7BC3369F5A
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237369AbhDXGq4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:35848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233128AbhDXGqO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8359161878;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=yvRexqPmybCXcMQCunEHPJjJgD+ZEwM3R67ntrsgrMc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hNl9sqH178teiiWgrTjfWa5xHG3JfnUN3Dz2hmxFOfkU1/zK+QtXs7LFSU0E9sENA
         tQiRE3XhoRKuDhrBg4ierhr5oElupGaJMwg2EIFO1bfLDHGRoAqlKWTxJl9kGrSRmR
         FguRzdbTFQdrFb/z0Os2ra2QW6qTcDOyMoa5NekaVJGMllXk5aZUG4xvl1BmszD2S3
         hx+GWcuoYBGzSwkMNcdngJs5vwIkLoPce/vZYh6A/RLzF7ZwSCy6x2ln/LV5THMi/P
         zvKSNhKC/w2fSzHGuqkLRDsH7p5tF/tqD1GEXVZkTBrT5XpECQ+zpdkNF6aihEYUV5
         VRQJubbBRWRhg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004Jey-Kd; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 26/78] media: i2c: dw9714: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:36 +0200
Message-Id: <df432c98bdc580aa0ae16a208270f054437ca35a.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/dw9714.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/i2c/dw9714.c b/drivers/media/i2c/dw9714.c
index 3f0b082f863f..c8b4292512dc 100644
--- a/drivers/media/i2c/dw9714.c
+++ b/drivers/media/i2c/dw9714.c
@@ -85,15 +85,7 @@ static const struct v4l2_ctrl_ops dw9714_vcm_ctrl_ops = {
 
 static int dw9714_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	int rval;
-
-	rval = pm_runtime_get_sync(sd->dev);
-	if (rval < 0) {
-		pm_runtime_put_noidle(sd->dev);
-		return rval;
-	}
-
-	return 0;
+	return pm_runtime_resume_and_get(sd->dev);
 }
 
 static int dw9714_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
-- 
2.30.2

