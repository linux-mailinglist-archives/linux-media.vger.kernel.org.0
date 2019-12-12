Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 380A811D2C9
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 17:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729983AbfLLQwz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 11:52:55 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:52706 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729930AbfLLQwz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 11:52:55 -0500
Received: (qmail 2315 invoked by uid 2102); 12 Dec 2019 11:52:54 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 12 Dec 2019 11:52:54 -0500
Date:   Thu, 12 Dec 2019 11:52:54 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+7fa38a608b1075dfd634@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <hverkuil@xs4all.nl>,
        <jrdr.linux@gmail.com>,
        Kernel development list <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, <mchehab@kernel.org>,
        <rfontana@redhat.com>
Subject: Re: general protection fault in usb_set_interface
In-Reply-To: <Pine.LNX.4.44L0.1912101513580.1647-100000@iolanthe.rowland.org>
Message-ID: <Pine.LNX.4.44L0.1912121146090.1352-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

[CC: list trimmed slightly -- including syzkaller-bugs]

On Thu, 12 Dec 2019, Andrey Konovalov wrote:

> Yes, the patch failed due to msleep() being undefined in that source
> file. I'm not sure why syzbot didn't send a response. Could you try 
> resending the patch as the reply to that other syzbot report?

This isn't literally a reply to the other syzbot report because I no 
longer have any copies of it in my mailbox.  But it uses the same To: 
and Subject: lines, so hopefully it will be okay.

This version of the patch adds #include <linux/delay.h>, so now
msleep() should be declared and there won't be any build errors.

If you want me to send the old version that fails to build, let me 
know.

Alan Stern

#syz test: https://github.com/google/kasan.git 1f22d15c

Index: usb-devel/drivers/media/usb/usbvision/usbvision-video.c
===================================================================
--- usb-devel.orig/drivers/media/usb/usbvision/usbvision-video.c
+++ usb-devel/drivers/media/usb/usbvision/usbvision-video.c
@@ -49,6 +49,7 @@
 #include <media/tuner.h>
 
 #include <linux/workqueue.h>
+#include <linux/delay.h>
 
 #include "usbvision.h"
 #include "usbvision-cards.h"
@@ -1585,6 +1586,7 @@ static void usbvision_disconnect(struct
 		wake_up_interruptible(&usbvision->wait_frame);
 		wake_up_interruptible(&usbvision->wait_stream);
 	} else {
+		msleep(100);
 		usbvision_release(usbvision);
 	}
 
Index: usb-devel/drivers/media/v4l2-core/v4l2-dev.c
===================================================================
--- usb-devel.orig/drivers/media/v4l2-core/v4l2-dev.c
+++ usb-devel/drivers/media/v4l2-core/v4l2-dev.c
@@ -24,6 +24,7 @@
 #include <linux/kmod.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/delay.h>
 
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
@@ -419,9 +420,10 @@ static int v4l2_open(struct inode *inode
 	video_get(vdev);
 	mutex_unlock(&videodev_lock);
 	if (vdev->fops->open) {
-		if (video_is_registered(vdev))
+		if (video_is_registered(vdev)) {
+			msleep(200);
 			ret = vdev->fops->open(filp);
-		else
+		} else
 			ret = -ENODEV;
 	}
 


