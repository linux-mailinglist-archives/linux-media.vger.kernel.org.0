Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41107375693
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235285AbhEFPYv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:38108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235186AbhEFPY3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4171B613BA;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=8oeNDL2f6ftikmJG74aEJuwd7JVkpDOtWW3l23y+D78=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CIzENzWfaB0L+SKXuNxft34UX8O8DNA4M3oCFRiVyqx1Mbqj3SJHBDlryaaFfxzh9
         kemioLf9ziHYYZM3XjT82Wmw1nmpOhiUlHGNeE/LvmyMdqhxROLHxg+pbMWr/dSp4B
         XtxYjt6k+q4/iOtWnoZnobyB5sTIBY8qQ+Qj9JmoBExV7YjGrNhiuqBYl5+vgNDGvO
         gt2Us769gmIIJdFTP0wgAuZnvGouGIZrk9zBEUh/vIhmraSIl076xMMD8Ue+tIJJvX
         u57T9wwOQoaI4JpKr/wbNVZ+A5u3ItjoMi0NLLBFU6GWhfZ6vbNCCK5zrrqyXfpdGY
         +76d/ose27+6g==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000Ruk-3H; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 04/30] media: i2c: dw9807-vcm: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:00 +0200
Message-Id: <351da21914f18f849f4898f948731b08dc1a3693.1620314098.git.mchehab+huawei@kernel.org>
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

