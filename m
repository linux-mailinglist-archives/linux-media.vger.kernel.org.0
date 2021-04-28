Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F01FC36DA2F
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240601AbhD1Oy6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:54:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:36802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240311AbhD1Oxe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5908C61444;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=x4LtonqYrT7G4qNBwEeK0f+06mohriAA55Pys8MWWx4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hmShjiN87Y/Jh2GqdC2mesBjAxCWHPKUKTUvJO20O5IwS4pA5nOdRJ8GzxiIMVoV8
         Up1kmFdQvVq4gPuiFBaPtpoVfxKbGnBxaMkWdYfC5yxR0xaB4BfoVDrHeCBDbDSEWF
         R1ntXzZrsgSQIqFTMji9lloSiLKx0pOfjBi389//jDuLre7dfbZcfL4Dv+y4FZI2bU
         QEveYlZDwPrWlDzaW0om0egDC9lcqum/eVTCr0+eGJsdFxw9dzvciuxpMx4VZ19Hr1
         HMNk8rCJX7y+a38+N/Rpda/AaCXOnCmV59U5hMAda0PCtSVEXcTr1pxMLfXDnU4J37
         glfnShwXcwaWA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001Dqt-BI; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 27/79] media: i2c: ak7375: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:51:48 +0200
Message-Id: <1e1d532702a6f708eb48d1e8aa0bc2d6722ac211.1619621413.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ak7375.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/i2c/ak7375.c b/drivers/media/i2c/ak7375.c
index e1f94ee0f48f..40b1a4aa846c 100644
--- a/drivers/media/i2c/ak7375.c
+++ b/drivers/media/i2c/ak7375.c
@@ -87,15 +87,7 @@ static const struct v4l2_ctrl_ops ak7375_vcm_ctrl_ops = {
 
 static int ak7375_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
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
 
 static int ak7375_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
-- 
2.30.2

