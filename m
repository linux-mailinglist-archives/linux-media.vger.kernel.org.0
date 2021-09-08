Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC4340387F
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 13:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349071AbhIHLED (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 07:04:03 -0400
Received: from vps.xff.cz ([195.181.215.36]:38364 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232630AbhIHLEB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 8 Sep 2021 07:04:01 -0400
X-Greylist: delayed 394 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 Sep 2021 07:04:01 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1631098575; bh=YY2yCPD5vLXF6o1p4UODyyT1QmHGm6Y/SxZTq/D9uMg=;
        h=From:To:Cc:Subject:Date:From;
        b=mYaLZngkt2nB4yE41SBYtnk11sdtwCw7txgKGBz2Q/2CJ0HBC+vnJHdMdqkqjJQiM
         gQYiAehdspatbT9xsNwpwxOThXCXQztBA4qx3XaJn7L5n3/C/tXVPC5dbwh2QY+ulA
         kJa/bp4QvEvzzF8d4CSUdarF7Ni73Q03Xmt7Iyio=
From:   Ondrej Jirman <megous@megous.com>
To:     Yong Deng <yong.deng@magewell.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        linux-media@vger.kernel.org (open list:CSI DRIVERS FOR ALLWINNER V3s),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner
        sunXi SoC support),
        linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
        linux-kernel@vger.kernel.org (open list)
Cc:     Ondrej Jirman <megous@megous.com>
Subject: [PATCH] media: sun6i-csi: Allow the video device to be open multiple times
Date:   Wed,  8 Sep 2021 12:56:09 +0200
Message-Id: <20210908105609.1823449-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Previously it was possible, but a recent fix for uninitialized
`ret` variable broke this behavior.

v4l2_fh_is_singular_file() check is there just to determine
whether the power needs to be enabled, and it's not a failure
if it returns false.

Fixes: ba9139116bc0538 ("media: sun6i-csi: add a missing return code")
Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
index 0129dee798b4..da1f8b2852b7 100644
--- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
+++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_video.c
@@ -510,7 +510,7 @@ static const struct v4l2_ioctl_ops sun6i_video_ioctl_ops = {
 static int sun6i_video_open(struct file *file)
 {
 	struct sun6i_video *video = video_drvdata(file);
-	int ret;
+	int ret = 0;
 
 	if (mutex_lock_interruptible(&video->lock))
 		return -ERESTARTSYS;
@@ -524,10 +524,8 @@ static int sun6i_video_open(struct file *file)
 		goto fh_release;
 
 	/* check if already powered */
-	if (!v4l2_fh_is_singular_file(file)) {
-		ret = -EBUSY;
+	if (!v4l2_fh_is_singular_file(file))
 		goto unlock;
-	}
 
 	ret = sun6i_csi_set_power(video->csi, true);
 	if (ret < 0)
-- 
2.33.0

