Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D2536726B
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 20:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245216AbhDUSUv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 14:20:51 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:38752 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245213AbhDUSUu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 14:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619029209; bh=mZnxdG84RRgD3doQgt/M+qgDTr7390pGKjmBDLlLYDs=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=jTO+r3xj7cYu4W2rST0PC7+ytRcoYJ811v7VUFkGlzL3ngJSKYQw/cajdLWzdxmnS
         a2HPswovf1698LtrghzGFSaF6Dyk49xdE0ZaBA9U7agPrXLJpZqYg1pXCX6ugLWJNi
         uWBi+5R1hyWJlPNyhjuDXVwdfoadjKYbnTo5xt74=
Received: by 192.168.90.14 [192.168.90.14] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 21 Apr 2021 20:20:09 +0200 (CEST)
X-EA-Auth: 3cyjx2v04dwYoAi4F17rhRnojjHVoYGP0HjO81rWIP2FYzwecIpm0t/Ke1JUPgHtDp68sXkrVkv9p8tGDHwpfc8avPFclp4p
Date:   Wed, 21 Apr 2021 23:50:04 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com, drv@mailo.com
Subject: [PATCH v3 6/6] staging: media: atomisp: replace raw printk() by
 dev_info()
Message-ID: <091f7989226169722220e95e0e838d2d139eb286.1619022192.git.drv@mailo.com>
References: <cover.1619022192.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619022192.git.drv@mailo.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It is better to use dev_info() instead of raw printk() call. This
addresses the checkpatch complain for not using KERN_<LEVEL> facility in
printk() call.

Suggested-by: Fabio Aiuto <fabioaiuto83@gmail.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes since v2:
   - Tag Fabio Auito for the patch suggestion

Changes in v1:
   - implement following changes suggested by Fabio Aiuto
       a. use dev_info instead of pr_info
       b. update patch log message accordingly


 drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
index b572551f1a0d..7e4e123fdb52 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
@@ -1020,8 +1020,8 @@ static int gc0310_set_fmt(struct v4l2_subdev *sd,
 		return -EINVAL;
 	}
 
-	printk("%s: before gc0310_write_reg_array %s\n", __func__,
-	       gc0310_res[dev->fmt_idx].desc);
+	dev_info(&client->dev, "%s: before gc0310_write_reg_array %s\n",
+		 __func__, gc0310_res[dev->fmt_idx].desc);
 	ret = startup(sd);
 	if (ret) {
 		dev_err(&client->dev, "gc0310 startup err\n");
-- 
2.25.1



