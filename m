Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0C1A18722
	for <lists+linux-media@lfdr.de>; Thu,  9 May 2019 10:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfEII5o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 04:57:44 -0400
Received: from mx2.suse.de ([195.135.220.15]:41960 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725847AbfEII5o (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 May 2019 04:57:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6DCD3AFDA;
        Thu,  9 May 2019 08:57:43 +0000 (UTC)
From:   Oliver Neukum <oneukum@suse.com>
To:     steve.miller@st.com, linux-media@vger.kernel.org
Cc:     Oliver Neukum <oneukum@suse.com>
Subject: [PATCH] cpia2_usb: first wake up, then free in disconnect
Date:   Thu,  9 May 2019 10:57:09 +0200
Message-Id: <20190509085709.8785-1-oneukum@suse.com>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Kasan reported a use after free in cpia2_usb_disconnect()
It first freed everything and then woke up those waiting.
The reverse order is correct.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
Reported-by: syzbot+0c90fc937c84f97d0aa6@syzkaller.appspotmail.com
Fixes: 6c493f8b28c67 ("[media] cpia2: major overhaul to get it in a working state again")
---
 drivers/media/usb/cpia2/cpia2_usb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/cpia2/cpia2_usb.c b/drivers/media/usb/cpia2/cpia2_usb.c
index e5d8dee38fe4..44bd7e5ad3eb 100644
--- a/drivers/media/usb/cpia2/cpia2_usb.c
+++ b/drivers/media/usb/cpia2/cpia2_usb.c
@@ -902,7 +902,6 @@ static void cpia2_usb_disconnect(struct usb_interface *intf)
 	cpia2_unregister_camera(cam);
 	v4l2_device_disconnect(&cam->v4l2_dev);
 	mutex_unlock(&cam->v4l2_lock);
-	v4l2_device_put(&cam->v4l2_dev);
 
 	if(cam->buffers) {
 		DBG("Wakeup waiting processes\n");
@@ -911,6 +910,8 @@ static void cpia2_usb_disconnect(struct usb_interface *intf)
 		wake_up_interruptible(&cam->wq_stream);
 	}
 
+	v4l2_device_put(&cam->v4l2_dev);
+
 	LOG("CPiA2 camera disconnected.\n");
 }
 
-- 
2.16.4

