Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0DA2C1809
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 22:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732246AbgKWVxq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 16:53:46 -0500
Received: from netrider.rowland.org ([192.131.102.5]:46783 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730713AbgKWVxq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 16:53:46 -0500
Received: (qmail 724048 invoked by uid 1000); 23 Nov 2020 16:53:45 -0500
Date:   Mon, 23 Nov 2020 16:53:45 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+44e64397bd81d5e84cba@syzkaller.appspotmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
Subject: Re: memory leak in hub_event
Message-ID: <20201123215345.GA721643@rowland.harvard.edu>
References: <20201123203853.GB720000@rowland.harvard.edu>
 <000000000000cc9e3405b4cc4ff8@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000cc9e3405b4cc4ff8@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quick summary: syzbot found a memory leak in the gspca driver, 
apparently caused by a reference being taken but not released in a 
probe failure pathway.

On Mon, Nov 23, 2020 at 12:48:08PM -0800, syzbot wrote:
> Hello,
> 
> syzbot has tested the proposed patch but the reproducer is still triggering an issue:
> memory leak in usb_set_configuration
> 
> BUG: memory leak
> unreferenced object 0xffff8881268a1800 (size 1024):
>   comm "kworker/0:2", pid 3644, jiffies 4294944749 (age 12.820s)
>   hex dump (first 32 bytes):
>     48 f3 6a 26 81 88 ff ff 48 f3 6a 26 81 88 ff ff  H.j&....H.j&....
>     01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace:
>     [<0000000089bfe22c>] kmalloc include/linux/slab.h:552 [inline]
>     [<0000000089bfe22c>] kzalloc include/linux/slab.h:664 [inline]
>     [<0000000089bfe22c>] usb_set_configuration+0x18c/0xb90 drivers/usb/core/message.c:1987
>     [<00000000207f81de>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
>     [<000000007aa490e0>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293

Okay, this does seem to pinpoint the problem.  gspca_dev_probe2() calls 
v4l2_device_register() at the start, but doesn't call 
v4l2_device_disconnect() upon failure.

I'm not at all familiar with the design of the v4l2 subsystem.  Mauro or 
Hans: Is this the right solution?

Alan Stern

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4d02da97

Index: usb-devel/drivers/media/usb/gspca/gspca.c
===================================================================
--- usb-devel.orig/drivers/media/usb/gspca/gspca.c
+++ usb-devel/drivers/media/usb/gspca/gspca.c
@@ -1575,6 +1575,7 @@ out:
 		input_unregister_device(gspca_dev->input_dev);
 #endif
 	v4l2_ctrl_handler_free(gspca_dev->vdev.ctrl_handler);
+	v4l2_device_disconnect(&gspca_dev->v4l2_dev);
 	kfree(gspca_dev->usb_buf);
 	kfree(gspca_dev);
 	return ret;

