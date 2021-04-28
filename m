Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ACB736DA38
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240643AbhD1OzG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:36366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240325AbhD1Oxi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8166D61920;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=8oeNDL2f6ftikmJG74aEJuwd7JVkpDOtWW3l23y+D78=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SL/X+kqzIpfeFDBxJgBxxD05C+aAhGwZWg3ak8cWERyqsiPl0rffGgvxy3kQ6ALrs
         x5xXGGnX4bkzDhaoMjBuZoJlIhv20QQy+7loSoEhKUwfTux/qHlSkHEfdmKSIkjzFx
         8WnBuuApAF4uvbuPYy5/yKRvMKcF2PSzfz1lt3sqXUAD2Td3322wAvMv3oQ25jcs3b
         t4rZHJKvIlA+1XjUSbhsslzebMhV8gZ3DSZ4sJYTjvpbh6o4NLHBtjFW4TeqMFWcny
         d+aN6S+an61GVMYh7DCI5pACA7SabOG6/LR99Z/n3koSt6LJl8lTAfa1MJue7H4tEd
         nWqnkICuQAO+Q==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001Dr5-Ev; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 31/79] media: i2c: dw9807-vcm: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:51:52 +0200
Message-Id: <44e0536fa85e13952e1872aa242b494f2a32b2dd.1619621413.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/dw9807-vcm.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/i2c/dw9807-vcm.c b/drivers/media/i2c/dw9807-vcm.c
index 438a44b76da8..95e06f13bc9e 100644
--- a/drivers/media/i2c/dw9807-vcm.c
+++ b/drivers/media/i2c/dw9807-vcm.c
@@ -130,15 +130,7 @@ static const struct v4l2_ctrl_ops dw9807_vcm_ctrl_ops = {
 
 static int dw9807_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
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
 
 static int dw9807_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
-- 
2.30.2

