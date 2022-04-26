Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE15A50FB27
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 12:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349129AbiDZKnE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 06:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349240AbiDZKl7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 06:41:59 -0400
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C707C45AFA
        for <linux-media@vger.kernel.org>; Tue, 26 Apr 2022 03:32:16 -0700 (PDT)
Received: from fsav411.sakura.ne.jp (fsav411.sakura.ne.jp [133.242.250.110])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 23QAWD5s053374;
        Tue, 26 Apr 2022 19:32:13 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav411.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp);
 Tue, 26 Apr 2022 19:32:13 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 23QAWCt3053371
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 26 Apr 2022 19:32:13 +0900 (JST)
        (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <e17d6647-2c65-638b-1469-f546da7d0ba8@I-love.SAKURA.ne.jp>
Date:   Tue, 26 Apr 2022 19:32:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: [PATCH v2] media: imon: reorganize serialization
Content-Language: en-US
To:     Sean Young <sean@mess.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Jarod Wilson <jarod@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzbot <syzbot+c558267ad910fc494497@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <00000000000043b599058faf0145@google.com>
 <5a06c7f1-9a29-99e4-c700-fec3f09509d2@I-love.SAKURA.ne.jp>
 <YmZny7mzugFe0t+X@gofer.mess.org>
 <62dddbb9-3053-f284-f9db-3beda5e8e951@I-love.SAKURA.ne.jp>
 <YmaMY/XKBmEfl8i6@gofer.mess.org> <YmbF071fSKUff6R2@rowland.harvard.edu>
 <YmbKiPna01aMQhJw@gofer.mess.org>
 <349f3e34-41ed-f832-3b22-ae10c50e3868@I-love.SAKURA.ne.jp>
 <Ymel5XtWC7rwpiXF@gofer.mess.org>
From:   Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <Ymel5XtWC7rwpiXF@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2022/04/26 16:57, Sean Young wrote:
>> This patch might be OK for solving circular locking dependency problem.
>> But https://syzkaller.appspot.com/text?tag=CrashReport&x=1632f89f700000 says
>> free_imon_context() from imon_disconnect() can call kfree(ictx) before
>> display_close() is called, resulting in use-after-free problem. I guess that
>> we need to defer free_imon_context() using refcount till display_close() is
>> called. Fix as a separate patch or include into this patch?
> 
> That is a separate issue, so that needs a separate patch.
> 

I think this should be addressed in this fix, for this patch needs to keep
"prevent races between open() and disconnect()" role of driver_lock.

It seems to me that "struct imon_context" is shared between intf0 and intf1.
Is imon_disconnect() called on the same "struct imon_context" for two times
if ictx->dev_present_intf0 = true and ictx->dev_present_intf1 = true ? Below
patch assumes that imon_disconnect() is called on the same "struct imon_context"
for two times if ictx->dev_present_intf0 = true and ictx->dev_present_intf1 = true.
Is this assumption correct?

From 73df086af9b4786cfcee81a7e82ee8e71be82290 Mon Sep 17 00:00:00 2001
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date: Tue, 26 Apr 2022 10:15:24 +0000
Subject: [PATCH v2] media: imon: reorganize serialization

Since usb_register_dev() from imon_init_display() from imon_probe() holds
minor_rwsem while display_open() which holds driver_lock and ictx->lock is
called with minor_rwsem held from usb_open(), holding driver_lock or
ictx->lock when calling usb_register_dev() causes circular locking
dependency problem.

Since usb_deregister_dev() from imon_disconnect() holds minor_rwsem while
display_open() which holds driver_lock is called with minor_rwsem held,
holding driver_lock when calling usb_deregister_dev() also causes circular
locking dependency problem.

Sean Young explained that the problem is there are imon devices which have
two usb interfaces, even though it is one device. The probe and disconnect
function of both usb interfaces can run concurrently.

Alan Stern responded that the driver and USB cores guarantee that when an
interface is probed, both the interface and its USB device are locked.
Ditto for when the disconnect callback gets run. So concurrent probing/
disconnection of multiple interfaces on the same device is not possible.

Therefore, we don't need locks for handling race between imon_probe() and
imon_disconnect(). But we still need to handle race between display_open()
/vfd_write()/lcd_write()/display_close() and imon_disconnect(), for
disconnect event can happen while file descriptors are in use.

Since "struct file"->private_data is set by display_open(), vfd_write()/
lcd_write()/display_close() can assume that "struct file"->private_data
is not NULL even after usb_set_intfdata(interface, NULL) was called.

Replace insufficiently held driver_lock with refcount_t based management.
Add a boolean flag for recording whether imon_disconnect() was already
called. Use RCU for accessing this boolean flag and refcount_t.

Link: https://syzkaller.appspot.com/bug?extid=c558267ad910fc494497
Reported-by: syzbot <syzbot+c558267ad910fc494497@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Sean Young <sean@mess.org>
Cc: Alan Stern <stern@rowland.harvard.edu>
---
 drivers/media/rc/imon.c | 99 +++++++++++++++++++----------------------
 1 file changed, 47 insertions(+), 52 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 54da6f60079b..9a4f24e294bc 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -153,6 +153,24 @@ struct imon_context {
 	const struct imon_usb_dev_descr *dev_descr;
 					/* device description with key */
 					/* table for front panels */
+	/*
+	 * Fields for deferring free_imon_context().
+	 *
+	 * Since reference to "struct imon_context" is stored into
+	 * "struct file_operations"->private_data, we need to remember
+	 * how many file descriptors might access this "struct imon_context".
+	 */
+	refcount_t users;
+	/*
+	 * Use a flag for telling display_open()/vfd_write()/lcd_write() that
+	 * imon_disconnect() was already called.
+	 */
+	bool disconnected;
+	/*
+	 * We need to wait for RCU grace period in order to allow
+	 * display_open() to safely check ->disconnected and increment ->users.
+	 */
+	struct rcu_head rcu;
 };
 
 #define TOUCH_TIMEOUT	(HZ/30)
@@ -160,18 +178,18 @@ struct imon_context {
 /* vfd character device file operations */
 static const struct file_operations vfd_fops = {
 	.owner		= THIS_MODULE,
-	.open		= &display_open,
-	.write		= &vfd_write,
-	.release	= &display_close,
+	.open		= display_open,
+	.write		= vfd_write,
+	.release	= display_close,
 	.llseek		= noop_llseek,
 };
 
 /* lcd character device file operations */
 static const struct file_operations lcd_fops = {
 	.owner		= THIS_MODULE,
-	.open		= &display_open,
-	.write		= &lcd_write,
-	.release	= &display_close,
+	.open		= display_open,
+	.write		= lcd_write,
+	.release	= display_close,
 	.llseek		= noop_llseek,
 };
 
@@ -439,9 +457,6 @@ static struct usb_driver imon_driver = {
 	.id_table	= imon_usb_id_table,
 };
 
-/* to prevent races between open() and disconnect(), probing, etc */
-static DEFINE_MUTEX(driver_lock);
-
 /* Module bookkeeping bits */
 MODULE_AUTHOR(MOD_AUTHOR);
 MODULE_DESCRIPTION(MOD_DESC);
@@ -481,9 +496,11 @@ static void free_imon_context(struct imon_context *ictx)
 	struct device *dev = ictx->dev;
 
 	usb_free_urb(ictx->tx_urb);
+	WARN_ON(ictx->dev_present_intf0);
 	usb_free_urb(ictx->rx_urb_intf0);
+	WARN_ON(ictx->dev_present_intf1);
 	usb_free_urb(ictx->rx_urb_intf1);
-	kfree(ictx);
+	kfree_rcu(ictx, rcu);
 
 	dev_dbg(dev, "%s: iMON context freed\n", __func__);
 }
@@ -499,9 +516,6 @@ static int display_open(struct inode *inode, struct file *file)
 	int subminor;
 	int retval = 0;
 
-	/* prevent races with disconnect */
-	mutex_lock(&driver_lock);
-
 	subminor = iminor(inode);
 	interface = usb_find_interface(&imon_driver, subminor);
 	if (!interface) {
@@ -509,13 +523,16 @@ static int display_open(struct inode *inode, struct file *file)
 		retval = -ENODEV;
 		goto exit;
 	}
-	ictx = usb_get_intfdata(interface);
 
-	if (!ictx) {
+	rcu_read_lock();
+	ictx = usb_get_intfdata(interface);
+	if (!ictx || ictx->disconnected || !refcount_inc_not_zero(&ictx->users)) {
+		rcu_read_unlock();
 		pr_err("no context found for minor %d\n", subminor);
 		retval = -ENODEV;
 		goto exit;
 	}
+	rcu_read_unlock();
 
 	mutex_lock(&ictx->lock);
 
@@ -533,8 +550,10 @@ static int display_open(struct inode *inode, struct file *file)
 
 	mutex_unlock(&ictx->lock);
 
+	if (retval && refcount_dec_and_test(&ictx->users))
+		free_imon_context(ictx);
+
 exit:
-	mutex_unlock(&driver_lock);
 	return retval;
 }
 
@@ -544,16 +563,9 @@ static int display_open(struct inode *inode, struct file *file)
  */
 static int display_close(struct inode *inode, struct file *file)
 {
-	struct imon_context *ictx = NULL;
+	struct imon_context *ictx = file->private_data;
 	int retval = 0;
 
-	ictx = file->private_data;
-
-	if (!ictx) {
-		pr_err("no context for device\n");
-		return -ENODEV;
-	}
-
 	mutex_lock(&ictx->lock);
 
 	if (!ictx->display_supported) {
@@ -568,6 +580,8 @@ static int display_close(struct inode *inode, struct file *file)
 	}
 
 	mutex_unlock(&ictx->lock);
+	if (refcount_dec_and_test(&ictx->users))
+		free_imon_context(ictx);
 	return retval;
 }
 
@@ -934,15 +948,12 @@ static ssize_t vfd_write(struct file *file, const char __user *buf,
 	int offset;
 	int seq;
 	int retval = 0;
-	struct imon_context *ictx;
+	struct imon_context *ictx = file->private_data;
 	static const unsigned char vfd_packet6[] = {
 		0x01, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF };
 
-	ictx = file->private_data;
-	if (!ictx) {
-		pr_err_ratelimited("no context for device\n");
+	if (ictx->disconnected)
 		return -ENODEV;
-	}
 
 	mutex_lock(&ictx->lock);
 
@@ -1018,13 +1029,10 @@ static ssize_t lcd_write(struct file *file, const char __user *buf,
 			 size_t n_bytes, loff_t *pos)
 {
 	int retval = 0;
-	struct imon_context *ictx;
+	struct imon_context *ictx = file->private_data;
 
-	ictx = file->private_data;
-	if (!ictx) {
-		pr_err_ratelimited("no context for device\n");
+	if (ictx->disconnected)
 		return -ENODEV;
-	}
 
 	mutex_lock(&ictx->lock);
 
@@ -2404,7 +2412,6 @@ static int imon_probe(struct usb_interface *interface,
 	int ifnum, sysfs_err;
 	int ret = 0;
 	struct imon_context *ictx = NULL;
-	struct imon_context *first_if_ctx = NULL;
 	u16 vendor, product;
 
 	usbdev     = usb_get_dev(interface_to_usbdev(interface));
@@ -2416,17 +2423,12 @@ static int imon_probe(struct usb_interface *interface,
 	dev_dbg(dev, "%s: found iMON device (%04x:%04x, intf%d)\n",
 		__func__, vendor, product, ifnum);
 
-	/* prevent races probing devices w/multiple interfaces */
-	mutex_lock(&driver_lock);
-
 	first_if = usb_ifnum_to_if(usbdev, 0);
 	if (!first_if) {
 		ret = -ENODEV;
 		goto fail;
 	}
 
-	first_if_ctx = usb_get_intfdata(first_if);
-
 	if (ifnum == 0) {
 		ictx = imon_init_intf0(interface, id);
 		if (!ictx) {
@@ -2434,9 +2436,11 @@ static int imon_probe(struct usb_interface *interface,
 			ret = -ENODEV;
 			goto fail;
 		}
+		refcount_set(&ictx->users, 1);
 
 	} else {
 		/* this is the secondary interface on the device */
+		struct imon_context *first_if_ctx = usb_get_intfdata(first_if);
 
 		/* fail early if first intf failed to register */
 		if (!first_if_ctx) {
@@ -2450,14 +2454,13 @@ static int imon_probe(struct usb_interface *interface,
 			ret = -ENODEV;
 			goto fail;
 		}
+		refcount_inc(&ictx->users);
 
 	}
 
 	usb_set_intfdata(interface, ictx);
 
 	if (ifnum == 0) {
-		mutex_lock(&ictx->lock);
-
 		if (product == 0xffdc && ictx->rf_device) {
 			sysfs_err = sysfs_create_group(&interface->dev.kobj,
 						       &imon_rf_attr_group);
@@ -2468,21 +2471,17 @@ static int imon_probe(struct usb_interface *interface,
 
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
 
@@ -2498,10 +2497,8 @@ static void imon_disconnect(struct usb_interface *interface)
 	struct device *dev;
 	int ifnum;
 
-	/* prevent races with multi-interface device probing and display_open */
-	mutex_lock(&driver_lock);
-
 	ictx = usb_get_intfdata(interface);
+	ictx->disconnected = true;
 	dev = ictx->dev;
 	ifnum = interface->cur_altsetting->desc.bInterfaceNumber;
 
@@ -2542,11 +2539,9 @@ static void imon_disconnect(struct usb_interface *interface)
 		}
 	}
 
-	if (!ictx->dev_present_intf0 && !ictx->dev_present_intf1)
+	if (refcount_dec_and_test(&ictx->users))
 		free_imon_context(ictx);
 
-	mutex_unlock(&driver_lock);
-
 	dev_dbg(dev, "%s: iMON device (intf%d) disconnected\n",
 		__func__, ifnum);
 }
-- 
2.34.1


