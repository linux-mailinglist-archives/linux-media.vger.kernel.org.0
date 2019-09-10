Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4B6AF246
	for <lists+linux-media@lfdr.de>; Tue, 10 Sep 2019 22:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbfIJU3Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Sep 2019 16:29:25 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60740 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725263AbfIJU3Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Sep 2019 16:29:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=NJbl3FJllBdIDq+vIy+cbt6Hdl0MScmT5nDNzaSIo/g=; b=fQoqImEeu0vGD1CZLJYPS8r5B
        D/6pggcSg5Nbe84HLHTmElLZ7el/Fcyqgl6XiXCGEMSHvra4oacq0qZNSO7Q/6+2+i9m2NkLLPK2x
        Ef1myPU7lRRHm69mwXl6d196hL5gkl2uiSExC1bzHeLhAT30ewI0YuVkhMmwh84QyW0pQhHBUfke/
        KcX7KX9UXnIzm/ddJFU7Ofl3JFHA/+ca6FMF0mMR2cy7fckig+WrJ7vrUWehvz4nUIfBmKj11Kx/9
        +k/4S6OhX3FHgiqHqIPraESMpNtXbrZn9PrNEtJJUI15BD0CBvViiL6e5D0tgkCEBSViY4SOhsQyy
        s4Tt7Bbgw==;
Received: from [179.95.10.161] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i7mlP-0001bR-J2; Tue, 10 Sep 2019 20:29:23 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.2)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i7mlM-0005mB-0g; Tue, 10 Sep 2019 17:29:20 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Colin Ian King <colin.king@canonical.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] media: cx231xx: fix unregister logic
Date:   Tue, 10 Sep 2019 17:29:19 -0300
Message-Id: <485f1467cc94907c8fd20188d673104b2b92ced7.1568147356.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Right now, dev->users is not been decremented for VBI nodes,
causing unregister to fail. Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/usb/cx231xx/cx231xx-video.c | 25 +++++++++++++----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-video.c b/drivers/media/usb/cx231xx/cx231xx-video.c
index 6d2f4da3a3fa..69abafaebbf3 100644
--- a/drivers/media/usb/cx231xx/cx231xx-video.c
+++ b/drivers/media/usb/cx231xx/cx231xx-video.c
@@ -1557,6 +1557,18 @@ static int cx231xx_close(struct file *filp)
 
 	_vb2_fop_release(filp, NULL);
 
+	if (--dev->users == 0) {
+		/* Save some power by putting tuner to sleep */
+		call_all(dev, tuner, standby);
+
+		/* do this before setting alternate! */
+		if (dev->USE_ISO)
+			cx231xx_uninit_isoc(dev);
+		else
+			cx231xx_uninit_bulk(dev);
+		cx231xx_set_mode(dev, CX231XX_SUSPEND);
+	}
+
 	/*
 	 * To workaround error number=-71 on EP0 for VideoGrabber,
 	 *	 need exclude following.
@@ -1577,20 +1589,11 @@ static int cx231xx_close(struct file *filp)
 		return 0;
 	}
 
-	if (--dev->users == 0) {
-		/* Save some power by putting tuner to sleep */
-		call_all(dev, tuner, standby);
-
-		/* do this before setting alternate! */
-		if (dev->USE_ISO)
-			cx231xx_uninit_isoc(dev);
-		else
-			cx231xx_uninit_bulk(dev);
-		cx231xx_set_mode(dev, CX231XX_SUSPEND);
-
+	if (dev->users == 0) {
 		/* set alternate 0 */
 		cx231xx_set_alt_setting(dev, INDEX_VIDEO, 0);
 	}
+
 	wake_up_interruptible(&dev->open);
 	return 0;
 }
-- 
2.21.0

