Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E8A3670CB
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 19:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236712AbhDURAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 13:00:38 -0400
Received: from msg-1.mailo.com ([213.182.54.11]:55646 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238561AbhDURAh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 13:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
        t=1619024396; bh=1zpDHmjIzxY49Mt3IYcCEgsoUmmFqjWtOUsQY9ePfv8=;
        h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
         MIME-Version:Content-Type:In-Reply-To;
        b=eUQsrGKjDZLNOVJ75r+Fd/LIYXKWvnx3EestVUIXfz5Sm9Wnao9cm7YzwbOZuj9NK
         nK+bWUm4Lc5sI9m2y2SiBTV2a4aB9HAs/4VjcEMmrPfmDyFIOcV+uOWbyqUDXpwmnG
         GfUeb+MVyMyzZueprgjd8ARYLtPP3t50AXt6OHBs=
Received: by 192.168.90.13 [192.168.90.13] with ESMTP
        via ip-206.mailobj.net [213.182.55.206]
        Wed, 21 Apr 2021 18:59:56 +0200 (CEST)
X-EA-Auth: EV88Yij/Mb8pf/RW+sMJ3xp+I4kYflPok2Y86sYPM3YJ/z6BQ1d3cIsbwwtEbO82eY+5S4+B08vtHAZmclnHgkgerZo8kqmA
Date:   Wed, 21 Apr 2021 22:29:50 +0530
From:   Deepak R Varma <drv@mailo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, mh12gx2825@gmail.com, drv@mailo.com
Subject: [PATCH v1 6/6] staging: media: atomisp: replace raw printk() by
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

Signed-off-by: Deepak R Varma <drv@mailo.com>
---

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



