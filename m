Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5FF45DF2E
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 09:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbfGCH4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 03:56:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:35528 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726670AbfGCH4F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jul 2019 03:56:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id BC276AF10;
        Wed,  3 Jul 2019 07:56:03 +0000 (UTC)
Message-ID: <1562139729.5819.28.camel@suse.com>
Subject: Re: KASAN: use-after-free Read in cpia2_usb_disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+0c90fc937c84f97d0aa6@syzkaller.appspotmail.com>,
        keescook@chromium.org, andreyknvl@google.com,
        syzkaller-bugs@googlegroups.com, mchehab@kernel.org,
        tglx@linutronix.de, sakari.ailus@linux.intel.com,
        kstewart@linuxfoundation.org, allison@lohutok.net,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, hverkuil-cisco@xs4all.nl
Date:   Wed, 03 Jul 2019 09:42:09 +0200
In-Reply-To: <0000000000006d7e14058cbc6545@google.com>
References: <0000000000006d7e14058cbc6545@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Dienstag, den 02.07.2019, 18:01 -0700 schrieb syzbot:
> syzbot has found a reproducer for the following crash on:
> 
> HEAD commit:    7829a896 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=11e19043a00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=f6d4561982f71f63
> dashboard link: https://syzkaller.appspot.com/bug?extid=0c90fc937c84f97d0aa6
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=147d42eda00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=104c268ba00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+0c90fc937c84f97d0aa6@syzkaller.appspotmail.com
> 
> cpia2: Message: count = 1, register[0] = 0x0
> cpia2: Unexpected error: -19
> ==================================================================
> BUG: KASAN: use-after-free in cpia2_usb_disconnect+0x1a4/0x1c0  
> drivers/media/usb/cpia2/cpia2_usb.c:898
> Read of size 8 at addr ffff8881cf6c4e50 by task kworker/1:1/22

Please try this:

From a0a73298fc23acb95e7b6487e960be707563eb34 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Wed, 8 May 2019 12:36:40 +0200
Subject: [PATCH] cpia2_usb: first wake up, then free in disconnect

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

