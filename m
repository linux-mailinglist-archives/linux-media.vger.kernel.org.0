Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 691392E7C99
	for <lists+linux-media@lfdr.de>; Wed, 30 Dec 2020 22:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgL3VVK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Dec 2020 16:21:10 -0500
Received: from mga14.intel.com ([192.55.52.115]:49725 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726197AbgL3VVK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 16:21:10 -0500
IronPort-SDR: 2Bdnn53VdhywFtcq85D6llMVnZ0qS3o4Or/8lSBkxk4IXsuSko4VbCY9EcAyrDtKe4nUNh1zAt
 XGuOV9Jx8ZDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9850"; a="175865009"
X-IronPort-AV: E=Sophos;i="5.78,462,1599548400"; 
   d="scan'208";a="175865009"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2020 13:19:22 -0800
IronPort-SDR: XfwVTHI3K3p6FkpXHUcg3SRmTV2YXjmKahhbfNIml3vifI/BjVCAnoA6v7JyjXELzEoksi39FD
 4Ki4keUCiUdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,462,1599548400"; 
   d="scan'208";a="495034277"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 30 Dec 2020 13:19:20 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 981B2DE; Wed, 30 Dec 2020 23:19:19 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        royale@zerezo.com, USB <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com
Subject: [RFT][PATCH v1] media: zr364xx: Fix memory leak in ->probe()
Date:   Wed, 30 Dec 2020 23:19:18 +0200
Message-Id: <20201230211918.63508-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When ->probe() fails in some cases it may not free resources.
Replace few separated calls by v4l2_device_put() to clean up
everything.

Reported-by: syzbot+b4d54814b339b5c6bbd4@syzkaller.appspotmail.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
I have no hardware and hadn't done any test of this.

 drivers/media/usb/zr364xx/zr364xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/usb/zr364xx/zr364xx.c b/drivers/media/usb/zr364xx/zr364xx.c
index 1e1c6b4d1874..5b9e31af57cf 100644
--- a/drivers/media/usb/zr364xx/zr364xx.c
+++ b/drivers/media/usb/zr364xx/zr364xx.c
@@ -1533,9 +1533,7 @@ static int zr364xx_probe(struct usb_interface *intf,
 	return 0;
 
 fail:
-	v4l2_ctrl_handler_free(hdl);
-	v4l2_device_unregister(&cam->v4l2_dev);
-	kfree(cam);
+	v4l2_device_put(&cam->v4l2_dev);
 	return err;
 }
 
-- 
2.29.2

