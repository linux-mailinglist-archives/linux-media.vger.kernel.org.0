Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00CCB50D8D5
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 07:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241277AbiDYFcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 01:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241268AbiDYFci (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 01:32:38 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EDD410A3
        for <linux-media@vger.kernel.org>; Sun, 24 Apr 2022 22:29:34 -0700 (PDT)
Received: from fsav120.sakura.ne.jp (fsav120.sakura.ne.jp [27.133.134.247])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 23P5TXtW098391;
        Mon, 25 Apr 2022 14:29:33 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav120.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav120.sakura.ne.jp);
 Mon, 25 Apr 2022 14:29:33 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav120.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 23P5TVwx098387
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 25 Apr 2022 14:29:33 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <5a06c7f1-9a29-99e4-c700-fec3f09509d2@I-love.SAKURA.ne.jp>
Date:   Mon, 25 Apr 2022 14:29:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: possible deadlock in display_open
Content-Language: en-US
To:     Jarod Wilson <jarod@redhat.com>, Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <00000000000043b599058faf0145@google.com>
Cc:     syzbot <syzbot+c558267ad910fc494497@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <00000000000043b599058faf0145@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Since usb_register_dev() from imon_init_display() from imon_probe() holds
minor_rwsem while display_open() which holds driver_lock and ictx->lock is
called with minor_rwsem held from usb_open(), holding driver_lock or
ictx->lock when calling usb_register_dev() causes circular locking
dependency problem.

Since usb_deregister_dev() from imon_disconnect() holds minor_rwsem while
display_open() which holds driver_lock is called with minor_rwsem held,
holding driver_lock when calling usb_deregister_dev() also causes circular
locking dependency problem.

But actually do we need to hold these locks?
Could you explain possible race scenario if we do below?

 drivers/media/rc/imon.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 54da6f60079b..e0e893d96cf3 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -439,9 +439,6 @@ static struct usb_driver imon_driver = {
 	.id_table	= imon_usb_id_table,
 };
 
-/* to prevent races between open() and disconnect(), probing, etc */
-static DEFINE_MUTEX(driver_lock);
-
 /* Module bookkeeping bits */
 MODULE_AUTHOR(MOD_AUTHOR);
 MODULE_DESCRIPTION(MOD_DESC);
@@ -499,9 +496,6 @@ static int display_open(struct inode *inode, struct file *file)
 	int subminor;
 	int retval = 0;
 
-	/* prevent races with disconnect */
-	mutex_lock(&driver_lock);
-
 	subminor = iminor(inode);
 	interface = usb_find_interface(&imon_driver, subminor);
 	if (!interface) {
@@ -534,7 +528,6 @@ static int display_open(struct inode *inode, struct file *file)
 	mutex_unlock(&ictx->lock);
 
 exit:
-	mutex_unlock(&driver_lock);
 	return retval;
 }
 
@@ -2416,9 +2409,6 @@ static int imon_probe(struct usb_interface *interface,
 	dev_dbg(dev, "%s: found iMON device (%04x:%04x, intf%d)\n",
 		__func__, vendor, product, ifnum);
 
-	/* prevent races probing devices w/multiple interfaces */
-	mutex_lock(&driver_lock);
-
 	first_if = usb_ifnum_to_if(usbdev, 0);
 	if (!first_if) {
 		ret = -ENODEV;
@@ -2456,8 +2446,6 @@ static int imon_probe(struct usb_interface *interface,
 	usb_set_intfdata(interface, ictx);
 
 	if (ifnum == 0) {
-		mutex_lock(&ictx->lock);
-
 		if (product == 0xffdc && ictx->rf_device) {
 			sysfs_err = sysfs_create_group(&interface->dev.kobj,
 						       &imon_rf_attr_group);
@@ -2468,21 +2456,17 @@ static int imon_probe(struct usb_interface *interface,
 
 		if (ictx->display_supported)
 			imon_init_display(ictx, interface);
-
-		mutex_unlock(&ictx->lock);
 	}
 
 	dev_info(dev, "iMON device (%04x:%04x, intf%d) on usb<%d:%d> initialized\n",
 		 vendor, product, ifnum,
 		 usbdev->bus->busnum, usbdev->devnum);
 
-	mutex_unlock(&driver_lock);
 	usb_put_dev(usbdev);
 
 	return 0;
 
 fail:
-	mutex_unlock(&driver_lock);
 	usb_put_dev(usbdev);
 	dev_err(dev, "unable to register, err %d\n", ret);
 
@@ -2498,9 +2482,6 @@ static void imon_disconnect(struct usb_interface *interface)
 	struct device *dev;
 	int ifnum;
 
-	/* prevent races with multi-interface device probing and display_open */
-	mutex_lock(&driver_lock);
-
 	ictx = usb_get_intfdata(interface);
 	dev = ictx->dev;
 	ifnum = interface->cur_altsetting->desc.bInterfaceNumber;
@@ -2545,8 +2526,6 @@ static void imon_disconnect(struct usb_interface *interface)
 	if (!ictx->dev_present_intf0 && !ictx->dev_present_intf1)
 		free_imon_context(ictx);
 
-	mutex_unlock(&driver_lock);
-
 	dev_dbg(dev, "%s: iMON device (intf%d) disconnected\n",
 		__func__, ifnum);
 }
-- 
2.34.1

On 2019/08/09 22:18, syzbot wrote:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=13b29b26600000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> dashboard link: https://syzkaller.appspot.com/bug?extid=c558267ad910fc494497
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15427002600000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=111cb61c600000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+c558267ad910fc494497@syzkaller.appspotmail.com
