Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53068368177
	for <lists+linux-media@lfdr.de>; Thu, 22 Apr 2021 15:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236226AbhDVNbg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Apr 2021 09:31:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:53662 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230005AbhDVNbg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Apr 2021 09:31:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1619098260; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=dWM9Hsh1mloRToT60j1IdotWj6QBEDt3x8FllFwWD8k=;
        b=IB0dQ082XXjMaBaadeYBasBomE9vk7L6hqI8ltWdiiKDphucY/K1N8kc33YXkWq/oe0I0l
        Tsv62/K1olflzUICTGawY/xlz8mzRwKUn0jFTka+j1MweN7VC2JubOjuV9PoXtsiBxcbhm
        xs84r/jA5fUTSp8wFHcYEk8iDwO3E0c=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id C82AEB151;
        Thu, 22 Apr 2021 13:31:00 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     mchehab@kernel.org, linux-media@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>,
        syzbot+d1e69c888f0d3866ead4@syzkaller.appspotmail.com
Subject: [PATCH] cpia2: unregister device on probe error
Date:   Thu, 22 Apr 2021 15:30:36 +0200
Message-Id: <20210422133036.4647-1-oneukum@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2 device must be unregistered in case probe() fails,
lest we get a leak.

Reported-and-tested-by: syzbot+d1e69c888f0d3866ead4@syzkaller.appspotmail.com
Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/usb/cpia2/cpia2_usb.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/cpia2/cpia2_usb.c b/drivers/media/usb/cpia2/cpia2_usb.c
index 3ab80a7b4498..db3b5d6d2d9a 100644
--- a/drivers/media/usb/cpia2/cpia2_usb.c
+++ b/drivers/media/usb/cpia2/cpia2_usb.c
@@ -844,15 +844,13 @@ static int cpia2_usb_probe(struct usb_interface *intf,
 	ret = set_alternate(cam, USBIF_CMDONLY);
 	if (ret < 0) {
 		ERR("%s: usb_set_interface error (ret = %d)\n", __func__, ret);
-		kfree(cam);
-		return ret;
+		goto error;
 	}
 
 
 	if((ret = cpia2_init_camera(cam)) < 0) {
 		ERR("%s: failed to initialize cpia2 camera (ret = %d)\n", __func__, ret);
-		kfree(cam);
-		return ret;
+		goto error;
 	}
 	LOG("  CPiA Version: %d.%02d (%d.%d)\n",
 	       cam->params.version.firmware_revision_hi,
@@ -872,11 +870,14 @@ static int cpia2_usb_probe(struct usb_interface *intf,
 	ret = cpia2_register_camera(cam);
 	if (ret < 0) {
 		ERR("%s: Failed to register cpia2 camera (ret = %d)\n", __func__, ret);
-		kfree(cam);
-		return ret;
+		goto error;
 	}
 
 	return 0;
+error:
+	v4l2_device_unregister(&cam->v4l2_dev);
+	kfree(cam);
+	return ret;
 }
 
 /******************************************************************************
-- 
2.26.2

