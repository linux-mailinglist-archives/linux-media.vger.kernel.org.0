Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D44375682
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235189AbhEFPY3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:37940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235063AbhEFPY2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 29E83610C8;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=88Q2GGxTdA6m8Rsuuzf1i/TAz4J4CJAtybbFo3TSOco=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rX8XPqzS9ObsqJaPbrNX5iV1hxAmS8nPVdCIboWyo3eogd4cfA81zk3BXQgMrjXTF
         3J9I11YIasoRCkSG8+KWP4nNwFloVjGG0O2L+bxIbnR1A1Ocyd0y/8+X60XvXOJQWM
         McZQi9Znj+zRMmqgLlwoH+Wt5C2/a/xd1HjwI2xwwUz0zqMtvlPnokW8+gWXfxwIey
         pa4RUxdiZfhBCWY5LCRF2IxRRrw3xAzPXsk9Bcous9WNTxDhgzo7Xsw2h4Xsvrggg+
         5mdEjvFdK1oYTOLyVM7dY6ZbU6EeYslc7AFKQhci2TKgBs8FJfkeYaKpPmucUkQXS7
         ALHa0G33iY4Pw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000RuY-0J; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH v5 01/30] media: i2c: ak7375: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:22:57 +0200
Message-Id: <a9262e8cbd4f21ff729d8436dd662b4f8085d1d2.1620314098.git.mchehab+huawei@kernel.org>
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

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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

