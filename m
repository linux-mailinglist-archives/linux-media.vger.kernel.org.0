Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 314E036DA74
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240463AbhD1O4E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:56:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:36992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240327AbhD1Oxi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 89DE461927;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=yvRexqPmybCXcMQCunEHPJjJgD+ZEwM3R67ntrsgrMc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OhZxJh5DenXyx3zs48zfWglB1SL5FLskqeUiXYU4m9xrB64P8ET3oTEM2o1anBKGZ
         Y7OHkdmmZhRjyWL4AGwB7VlZWmI/vAnRXYV49lVWKnehUtl7/JWt/UJo5eR+s1MUgK
         KOlWs5p8dfIEg3trRphAxfYe1HqX/9s5EvTJvpwoRVHnRbMXoKLvaA8lMIPEP6aY8U
         PVjxh/n1Rzsb6VkR2zCTJ9pTWlK+o1Tw30JlC4apZdIGTgeSMLZyDyfW3nB5O4Kd0f
         GYSI6DJE3XWeUg5ecwvaWeXalGFi0DmIxGY02pDZjdvKLjKsVeO8xLveDwkVhLWwtn
         mF4JBQ0Lhnuww==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001Dqz-D7; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 29/79] media: i2c: dw9714: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:51:50 +0200
Message-Id: <e4d32d3af4146268fd082daf920fa70174deb988.1619621413.git.mchehab+huawei@kernel.org>
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

