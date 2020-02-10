Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58683157D2B
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 15:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728646AbgBJONd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 09:13:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:39664 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727481AbgBJONc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 09:13:32 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C6A6DAE2A;
        Mon, 10 Feb 2020 14:13:30 +0000 (UTC)
Message-ID: <1581344006.26936.7.camel@suse.de>
Subject: Re: KASAN: use-after-free Read in uvc_probe
From:   Oliver Neukum <oneukum@suse.de>
To:     syzbot <syzbot+9a48339b077c5a80b869@syzkaller.appspotmail.com>,
        andreyknvl@google.com, laurent.pinchart@ideasonboard.com,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Date:   Mon, 10 Feb 2020 15:13:26 +0100
In-Reply-To: <000000000000780999059c048dfc@google.com>
References: <000000000000780999059c048dfc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Montag, den 13.01.2020, 04:24 -0800 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    ae179410 usb: gadget: add raw-gadget interface
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=132223fee00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ad1d751a3a72ae57
> dashboard link: https://syzkaller.appspot.com/bug?extid=9a48339b077c5a80b869
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16857325e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=142e069ee00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+9a48339b077c5a80b869@syzkaller.appspotmail.com
> 
> usb 1-1: New USB device found, idVendor=0bd3, idProduct=0555,  
> bcdDevice=69.6a
> usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> usb 1-1: config 0 descriptor??
> usb 1-1: string descriptor 0 read error: -71
> uvcvideo: Found UVC 0.00 device <unnamed> (0bd3:0555)
> ==================================================================
> BUG: KASAN: use-after-free in uvc_register_terms  
> drivers/media/usb/uvc/uvc_driver.c:2038 [inline]
> BUG: KASAN: use-after-free in uvc_register_chains  
> drivers/media/usb/uvc/uvc_driver.c:2070 [inline]
> BUG: KASAN: use-after-free in uvc_probe.cold+0x2193/0x29de  
> drivers/media/usb/uvc/uvc_driver.c:2201
> Read of size 2 at addr ffff8881d4f1bc2e by task kworker/1:2/94

#syz test: https://github.com/google/kasan.git ae179410

From db844641a5e30f3cfc0ce9cde156b3cc356b6c0c Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Mon, 10 Feb 2020 15:10:36 +0100
Subject: [PATCH] UVC: deal with unnamed streams

The pointer can be NULL

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 99883550375e..26558a89f2fe 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2069,7 +2069,8 @@ static int uvc_register_terms(struct uvc_device *dev,
 		stream = uvc_stream_by_id(dev, term->id);
 		if (stream == NULL) {
 			uvc_printk(KERN_INFO, "No streaming interface found "
-				   "for terminal %u.", term->id);
+				   "for terminal %u.",
+				   term->id ? term->id : "(Unnamed)");
 			continue;
 		}
 
-- 
2.16.4

