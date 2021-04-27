Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E19B36C29E
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235824AbhD0KPM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:34864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235425AbhD0KOg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4FF461433;
        Tue, 27 Apr 2021 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518431;
        bh=0+qUTNue9hnyAq3YJfJJPyrh70EsjiwzWG3y47ywjxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=J4ONUu70heY1RZmS/I3mxnEG/VIJ856b0NmRgjgVlVaABKOTYSy19WX/Rou3RI6TZ
         Dj3rh+h8FahVzN/UQARVcBGNw3g4Lq5zbO/cTaMKT26NtseHWBXT1pwPA3WCI5em2P
         KE+/o1hfqQv9E+VQjl0QLpTefmTm5QtXtOrhYbnhKfXnNWj+oEnwPFY5S7Oq+rq74n
         c/gBxW6lEQfmzXggv+1A36vRjqLF1IhnMKIVh9lvd34fbLz8is/6ojhEf/HAkN37CI
         kH2KXbpplN1X46PtVXtrnAIn+BKvdXTKJhcqBd31j//DeZGqHHrbNszEgN+8xlpXcU
         N2lV3S3IConIA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiz-000j65-KC; Tue, 27 Apr 2021 12:13:49 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 31/79] media: i2c: dw9768: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:12:58 +0200
Message-Id: <951f9765516074475e30e10dd56ab7184873e77a.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
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

