Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24CFB50F337
	for <lists+linux-media@lfdr.de>; Tue, 26 Apr 2022 09:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344348AbiDZIAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Apr 2022 04:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235958AbiDZIAj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Apr 2022 04:00:39 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F11631A39C;
        Tue, 26 Apr 2022 00:57:29 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 38CD71002D8; Tue, 26 Apr 2022 08:57:25 +0100 (BST)
Date:   Tue, 26 Apr 2022 08:57:25 +0100
From:   Sean Young <sean@mess.org>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Jarod Wilson <jarod@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzbot <syzbot+c558267ad910fc494497@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: imon: remove redundant serialization
Message-ID: <Ymel5XtWC7rwpiXF@gofer.mess.org>
References: <00000000000043b599058faf0145@google.com>
 <5a06c7f1-9a29-99e4-c700-fec3f09509d2@I-love.SAKURA.ne.jp>
 <YmZny7mzugFe0t+X@gofer.mess.org>
 <62dddbb9-3053-f284-f9db-3beda5e8e951@I-love.SAKURA.ne.jp>
 <YmaMY/XKBmEfl8i6@gofer.mess.org>
 <YmbF071fSKUff6R2@rowland.harvard.edu>
 <YmbKiPna01aMQhJw@gofer.mess.org>
 <349f3e34-41ed-f832-3b22-ae10c50e3868@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <349f3e34-41ed-f832-3b22-ae10c50e3868@I-love.SAKURA.ne.jp>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 26, 2022 at 09:54:18AM +0900, Tetsuo Handa wrote:
> Since usb_register_dev() from imon_init_display() from imon_probe() holds
> minor_rwsem while display_open() which holds driver_lock and ictx->lock is
> called with minor_rwsem held from usb_open(), holding driver_lock or
> ictx->lock when calling usb_register_dev() causes circular locking
> dependency problem.
> 
> Since usb_deregister_dev() from imon_disconnect() holds minor_rwsem while
> display_open() which holds driver_lock is called with minor_rwsem held,
> holding driver_lock when calling usb_deregister_dev() also causes circular
> locking dependency problem.
> 
> Sean Young explained that the problem is there are imon devices which have
> two usb interfaces, even though it is one device. The probe and disconnect
> function of both usb interfaces can run concurrently.
> 
> Alan Stern responded that the driver and USB cores guarantee that when an
> interface is probed, both the interface and its USB device are locked.
> Ditto for when the disconnect callback gets run. So concurrent probing/
> disconnection of multiple interfaces on the same device is not possible.
> 
> Therefore, simply remove redundant serialization.
> 
> Link: https://syzkaller.appspot.com/bug?extid=c558267ad910fc494497
> Reported-by: syzbot <syzbot+c558267ad910fc494497@syzkaller.appspotmail.com>
> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> Cc: Sean Young <sean@mess.org>
> Cc: Alan Stern <stern@rowland.harvard.edu>

Thanks, looks good!

> ---
> This patch might be OK for solving circular locking dependency problem.
> But https://syzkaller.appspot.com/text?tag=CrashReport&x=1632f89f700000 says
> free_imon_context() from imon_disconnect() can call kfree(ictx) before
> display_close() is called, resulting in use-after-free problem. I guess that
> we need to defer free_imon_context() using refcount till display_close() is
> called. Fix as a separate patch or include into this patch?

That is a separate issue, so that needs a separate patch.

Sean

> 
>  drivers/media/rc/imon.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> index 54da6f60079b..e0e893d96cf3 100644
> --- a/drivers/media/rc/imon.c
> +++ b/drivers/media/rc/imon.c
> @@ -439,9 +439,6 @@ static struct usb_driver imon_driver = {
>  	.id_table	= imon_usb_id_table,
>  };
>  
> -/* to prevent races between open() and disconnect(), probing, etc */
> -static DEFINE_MUTEX(driver_lock);
> -
>  /* Module bookkeeping bits */
>  MODULE_AUTHOR(MOD_AUTHOR);
>  MODULE_DESCRIPTION(MOD_DESC);
> @@ -499,9 +496,6 @@ static int display_open(struct inode *inode, struct file *file)
>  	int subminor;
>  	int retval = 0;
>  
> -	/* prevent races with disconnect */
> -	mutex_lock(&driver_lock);
> -
>  	subminor = iminor(inode);
>  	interface = usb_find_interface(&imon_driver, subminor);
>  	if (!interface) {
> @@ -534,7 +528,6 @@ static int display_open(struct inode *inode, struct file *file)
>  	mutex_unlock(&ictx->lock);
>  
>  exit:
> -	mutex_unlock(&driver_lock);
>  	return retval;
>  }
>  
> @@ -2416,9 +2409,6 @@ static int imon_probe(struct usb_interface *interface,
>  	dev_dbg(dev, "%s: found iMON device (%04x:%04x, intf%d)\n",
>  		__func__, vendor, product, ifnum);
>  
> -	/* prevent races probing devices w/multiple interfaces */
> -	mutex_lock(&driver_lock);
> -
>  	first_if = usb_ifnum_to_if(usbdev, 0);
>  	if (!first_if) {
>  		ret = -ENODEV;
> @@ -2456,8 +2446,6 @@ static int imon_probe(struct usb_interface *interface,
>  	usb_set_intfdata(interface, ictx);
>  
>  	if (ifnum == 0) {
> -		mutex_lock(&ictx->lock);
> -
>  		if (product == 0xffdc && ictx->rf_device) {
>  			sysfs_err = sysfs_create_group(&interface->dev.kobj,
>  						       &imon_rf_attr_group);
> @@ -2468,21 +2456,17 @@ static int imon_probe(struct usb_interface *interface,
>  
>  		if (ictx->display_supported)
>  			imon_init_display(ictx, interface);
> -
> -		mutex_unlock(&ictx->lock);
>  	}
>  
>  	dev_info(dev, "iMON device (%04x:%04x, intf%d) on usb<%d:%d> initialized\n",
>  		 vendor, product, ifnum,
>  		 usbdev->bus->busnum, usbdev->devnum);
>  
> -	mutex_unlock(&driver_lock);
>  	usb_put_dev(usbdev);
>  
>  	return 0;
>  
>  fail:
> -	mutex_unlock(&driver_lock);
>  	usb_put_dev(usbdev);
>  	dev_err(dev, "unable to register, err %d\n", ret);
>  
> @@ -2498,9 +2482,6 @@ static void imon_disconnect(struct usb_interface *interface)
>  	struct device *dev;
>  	int ifnum;
>  
> -	/* prevent races with multi-interface device probing and display_open */
> -	mutex_lock(&driver_lock);
> -
>  	ictx = usb_get_intfdata(interface);
>  	dev = ictx->dev;
>  	ifnum = interface->cur_altsetting->desc.bInterfaceNumber;
> @@ -2545,8 +2526,6 @@ static void imon_disconnect(struct usb_interface *interface)
>  	if (!ictx->dev_present_intf0 && !ictx->dev_present_intf1)
>  		free_imon_context(ictx);
>  
> -	mutex_unlock(&driver_lock);
> -
>  	dev_dbg(dev, "%s: iMON device (intf%d) disconnected\n",
>  		__func__, ifnum);
>  }
> -- 
> 2.34.1
> 
