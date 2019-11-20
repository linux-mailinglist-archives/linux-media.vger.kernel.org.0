Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 679B810379E
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2019 11:33:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728480AbfKTKcz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Nov 2019 05:32:55 -0500
Received: from mx2.suse.de ([195.135.220.15]:50302 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727934AbfKTKcy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Nov 2019 05:32:54 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B94ECB24A;
        Wed, 20 Nov 2019 10:32:52 +0000 (UTC)
Message-ID: <1574245969.14298.29.camel@suse.com>
Subject: Re: KASAN: use-after-free Read in si470x_int_in_callback (2)
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com>,
        andreyknvl@google.com, hverkuil@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Date:   Wed, 20 Nov 2019 11:32:49 +0100
In-Reply-To: <000000000000f47f0b0595307ddc@google.com>
References: <000000000000f47f0b0595307ddc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am Freitag, den 18.10.2019, 07:53 -0700 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    22be26f7 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=102b65cf600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=387eccb7ac68ec5
> dashboard link: https://syzkaller.appspot.com/bug?extid=9ca7a12fd736d93e0232
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=143b9060e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15d3b94b600000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+9ca7a12fd736d93e0232@syzkaller.appspotmail.com

#syz test: https://github.com/google/kasan.git 22be26f7

From c322de1808b3f43b2248457281634c9d22500840 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Mon, 18 Nov 2019 14:41:51 +0100
Subject: [PATCH] si470x: prevent resubmission

Starting IO to a device is not necessarily a NOP in every error
case. So we need to terminate all IO in every case of probe
failure with absolute certainty.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/media/radio/si470x/radio-si470x-usb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/radio/si470x/radio-si470x-usb.c b/drivers/media/radio/si470x/radio-si470x-usb.c
index fedff68d8c49..07e9ddbb5937 100644
--- a/drivers/media/radio/si470x/radio-si470x-usb.c
+++ b/drivers/media/radio/si470x/radio-si470x-usb.c
@@ -734,7 +734,8 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 	/* start radio */
 	retval = si470x_start_usb(radio);
 	if (retval < 0)
-		goto err_buf;
+		/* the urb may be running even after an error */
+		goto err_all;
 
 	/* set initial frequency */
 	si470x_set_freq(radio, 87.5 * FREQ_MUL); /* available in all regions */
@@ -749,7 +750,7 @@ static int si470x_usb_driver_probe(struct usb_interface *intf,
 
 	return 0;
 err_all:
-	usb_kill_urb(radio->int_in_urb);
+	usb_poison_urb(radio->int_in_urb);
 err_buf:
 	kfree(radio->buffer);
 err_ctrl:
-- 
2.16.4

