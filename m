Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A3136C366
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237564AbhD0K2X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:48136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235531AbhD0K2E (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 085A9613CA;
        Tue, 27 Apr 2021 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=yvRexqPmybCXcMQCunEHPJjJgD+ZEwM3R67ntrsgrMc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rPqcCYU/oaxqCKQiPkMz9uQCMi6R82hm51a3WZCBCpl4RD99A9YdYb8oIlaxbZQ9+
         5ocAMf1OlfwY28x74NNkCyFtMwM7/QTiPcrJ56+HUvD1U/Hb3YIDTv9qkoua6TrKpN
         fZHrDn08rtSVexkYNfc+VGR6o1bRSykUX1NStf3oAwAdU3xqT+NP1s40yf2aamXC9B
         xh103062laPXAPQQv7LROrauvnmIBrrbIePsw1KpHmZCWNuBIAvq98c+Yb7zlTvfoQ
         Bz/5cl0+0sZcOmCzbXoHQSmMva5fLRp6inl0dfvT2+aGqUg6HsIwmqKmNEUHOicFNX
         mYirX3q2BA5SQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvw-000o0f-IZ; Tue, 27 Apr 2021 12:27:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 30/79] media: i2c: dw9714: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:20 +0200
Message-Id: <f92ca5edbb0880c0697d23b221223c4bd86369bb.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
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

