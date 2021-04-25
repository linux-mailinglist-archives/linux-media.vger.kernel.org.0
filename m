Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897DB36A5DF
	for <lists+linux-media@lfdr.de>; Sun, 25 Apr 2021 10:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhDYIrf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 25 Apr 2021 04:47:35 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:41638 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229543AbhDYIre (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 25 Apr 2021 04:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619340407; bh=mZnxdG84RRgD3doQgt/M+qgDTr7390pGKjmBDLlLYDs=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=NNu3hYLiUazNWrteify5ZU+ZFRg/D5h7fMAX4Z9L3yztyihEeVGECFfo4a7mjFct3
         qcoAkD7t4v1efxViKz5O53jyhUhohQ9Yd/otoClwjH8VdB9m7UdEUntbeGKu0a4nSA
         TqU77xadwE9vwcro3C3mU3XKFpp/GO5qIIl8vJko=
Received: by 192.168.90.14 [192.168.90.14] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Sun, 25 Apr 2021 10:46:46 +0200 (CEST)
X-EA-Auth: JwDCff709psDa1OyRCwnuUWfrWYhtVen58XGqnBfkOrUcnJkQcbjimtIKLWEP2dIhQIUnfuLuVHhiE43gMb9xWSBsDrEqntK
Date:   Sun, 25 Apr 2021 14:16:42 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, drv@mailo.com
Subject: [PATCH RESEND v3 6/6] staging: media: atomisp: replace raw printk()
 by dev_info()
Message-ID: <091f7989226169722220e95e0e838d2d139eb286.1619199344.git.drv@mailo.com>
References: <cover.1619199344.git.drv@mailo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1619199344.git.drv@mailo.com>
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



