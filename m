Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD75375690
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235279AbhEFPYt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:38112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235191AbhEFPY3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57B6B613CE;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=yvRexqPmybCXcMQCunEHPJjJgD+ZEwM3R67ntrsgrMc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gEbsIt1wQsi7H8MVCLEl6Tvz8epkvLKbkcuDKyNixCXJh1CHOf2cWHwHOCzkMfQrz
         d2KL14L6A8k4HrkMe9sW/thHPAgHPffd+gbGhZ+qtsNB/PWo9qZP0PITShDRY6DTl9
         T/gx227C/4EulHRvYWc1bRxoB7ChBueWYeUgkPILaLJXlzXIL31KmzJy+WgFhX4Vb+
         6TDLo7JgOac7Cw1KJpmVA1Zc3x2TwqCg+bQqW9EqmHN9tqFb/csNJJFBsx/dNykCUd
         kVz04Z9tYkgumWDTIXNg3MNvKmht0bhxxCnentVyP4ujCWsQSReEHKazCYStYAQPcv
         O4/QBRa/CsftA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000Rub-1O; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 02/30] media: i2c: dw9714: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:22:58 +0200
Message-Id: <b9b131be6307938b34fcdb125a8326f39494b418.1620314098.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314098.git.mchehab+huawei@kernel.org>
References: <cover.1620314098.git.mchehab+huawei@kernel.org>
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

