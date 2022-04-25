Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F39A450DF79
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 13:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232380AbiDYL7g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 07:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236204AbiDYL7a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 07:59:30 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFCAB2AC5;
        Mon, 25 Apr 2022 04:56:22 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id BDAF01002D8; Mon, 25 Apr 2022 12:56:19 +0100 (BST)
Date:   Mon, 25 Apr 2022 12:56:19 +0100
From:   Sean Young <sean@mess.org>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     Jarod Wilson <jarod@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzbot <syzbot+c558267ad910fc494497@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: possible deadlock in display_open
Message-ID: <YmaMY/XKBmEfl8i6@gofer.mess.org>
References: <00000000000043b599058faf0145@google.com>
 <5a06c7f1-9a29-99e4-c700-fec3f09509d2@I-love.SAKURA.ne.jp>
 <YmZny7mzugFe0t+X@gofer.mess.org>
 <62dddbb9-3053-f284-f9db-3beda5e8e951@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62dddbb9-3053-f284-f9db-3beda5e8e951@I-love.SAKURA.ne.jp>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 25, 2022 at 08:14:12PM +0900, Tetsuo Handa wrote:
> On 2022/04/25 18:20, Sean Young wrote:
> > The problem is there are imon devices which have two usb interfaces, even
> > though it is one device. The probe and disconnect function of both usb
> > interfaces can run concurrently.
> > 
> > Of course, this depends on probe/disconnect functions being allowed to run
> > concurrently on different interfaces of the same usb device.
> 
> I don't have real hardware to confirm. If you have an imon device which has
> two usb interfaces, please try below debug printk() patch in order to see
> whether the caller is already holding locks for serialization.

I am afraid calling debug_show_held_locks() is not really going to tell us
this information. This should be figured out from understanding the usb
stack, not from seeing if the probe happens to be concurrent.

Just because the locks were not held, does not mean that the usb interface
initialization is not concurrent.

Thanks
Sean


> 
> ------------------------------------------------------------
>  drivers/media/rc/imon.c | 25 +++++--------------------
>  1 file changed, 5 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
> index 54da6f60079b..a309c28e63d8 100644
> --- a/drivers/media/rc/imon.c
> +++ b/drivers/media/rc/imon.c
> @@ -30,6 +30,7 @@
>  #include <media/rc-core.h>
>  
>  #include <linux/timer.h>
> +#include <linux/sched/debug.h>
>  
>  #define MOD_AUTHOR	"Jarod Wilson <jarod@wilsonet.com>"
>  #define MOD_DESC	"Driver for SoundGraph iMON MultiMedia IR/Display"
> @@ -439,9 +440,6 @@ static struct usb_driver imon_driver = {
>  	.id_table	= imon_usb_id_table,
>  };
>  
> -/* to prevent races between open() and disconnect(), probing, etc */
> -static DEFINE_MUTEX(driver_lock);
> -
>  /* Module bookkeeping bits */
>  MODULE_AUTHOR(MOD_AUTHOR);
>  MODULE_DESCRIPTION(MOD_DESC);
> @@ -499,9 +497,6 @@ static int display_open(struct inode *inode, struct file *file)
>  	int subminor;
>  	int retval = 0;
>  
> -	/* prevent races with disconnect */
> -	mutex_lock(&driver_lock);
> -
>  	subminor = iminor(inode);
>  	interface = usb_find_interface(&imon_driver, subminor);
>  	if (!interface) {
> @@ -534,7 +529,6 @@ static int display_open(struct inode *inode, struct file *file)
>  	mutex_unlock(&ictx->lock);
>  
>  exit:
> -	mutex_unlock(&driver_lock);
>  	return retval;
>  }
>  
> @@ -2407,6 +2401,8 @@ static int imon_probe(struct usb_interface *interface,
>  	struct imon_context *first_if_ctx = NULL;
>  	u16 vendor, product;
>  
> +	dump_stack();
> +	debug_show_held_locks(current);
>  	usbdev     = usb_get_dev(interface_to_usbdev(interface));
>  	iface_desc = interface->cur_altsetting;
>  	ifnum      = iface_desc->desc.bInterfaceNumber;
> @@ -2416,9 +2412,6 @@ static int imon_probe(struct usb_interface *interface,
>  	dev_dbg(dev, "%s: found iMON device (%04x:%04x, intf%d)\n",
>  		__func__, vendor, product, ifnum);
>  
> -	/* prevent races probing devices w/multiple interfaces */
> -	mutex_lock(&driver_lock);
> -
>  	first_if = usb_ifnum_to_if(usbdev, 0);
>  	if (!first_if) {
>  		ret = -ENODEV;
> @@ -2456,8 +2449,6 @@ static int imon_probe(struct usb_interface *interface,
>  	usb_set_intfdata(interface, ictx);
>  
>  	if (ifnum == 0) {
> -		mutex_lock(&ictx->lock);
> -
>  		if (product == 0xffdc && ictx->rf_device) {
>  			sysfs_err = sysfs_create_group(&interface->dev.kobj,
>  						       &imon_rf_attr_group);
> @@ -2468,21 +2459,17 @@ static int imon_probe(struct usb_interface *interface,
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
> @@ -2498,8 +2485,8 @@ static void imon_disconnect(struct usb_interface *interface)
>  	struct device *dev;
>  	int ifnum;
>  
> -	/* prevent races with multi-interface device probing and display_open */
> -	mutex_lock(&driver_lock);
> +	dump_stack();
> +	debug_show_held_locks(current);
>  
>  	ictx = usb_get_intfdata(interface);
>  	dev = ictx->dev;
> @@ -2545,8 +2532,6 @@ static void imon_disconnect(struct usb_interface *interface)
>  	if (!ictx->dev_present_intf0 && !ictx->dev_present_intf1)
>  		free_imon_context(ictx);
>  
> -	mutex_unlock(&driver_lock);
> -
>  	dev_dbg(dev, "%s: iMON device (intf%d) disconnected\n",
>  		__func__, ifnum);
>  }
> ------------------------------------------------------------
> 
> Below is a result with syzkaller-generated reproducer. If an imon device
> which has two usb interfaces shares locks held, "prevent races with
> multi-interface device probing" part can be removed.
> 
> ------------------------------------------------------------
> [  193.854446][ T4177] usb 2-1: new high-speed USB device number 2 using dummy_hcd
> [  194.381949][ T4177] usb 2-1: config 0 interface 0 altsetting 0 endpoint 0x84 has an invalid bInterval 0, changing to 7
> [  194.389192][ T4177] usb 2-1: New USB device found, idVendor=15c2, idProduct=0039, bcdDevice=d2.65
> [  194.394772][ T4177] usb 2-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [  194.415288][ T4177] usb 2-1: config 0 descriptor??
> [  194.458149][ T4177] CPU: 0 PID: 4177 Comm: kworker/0:3 Not tainted 5.18.0-rc4-dirty #772
> [  194.460825][ T4177] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
> [  194.463534][ T4177] Workqueue: usb_hub_wq hub_event
> [  194.465133][ T4177] Call Trace:
> [  194.466158][ T4177]  <TASK>
> [  194.467087][ T4177]  dump_stack_lvl+0xcd/0x134
> [  194.468655][ T4177]  imon_probe+0x26/0x10da
> [  194.470109][ T4177]  ? _raw_spin_unlock_irqrestore+0x3d/0x70
> [  194.471973][ T4177]  ? __pm_runtime_set_status+0x29c/0x5d0
> [  194.473543][ T4177]  ? _raw_spin_unlock_irqrestore+0x3d/0x70
> [  194.475219][ T4177]  usb_probe_interface+0x19b/0x3e0
> [  194.476806][ T4177]  ? usb_match_dynamic_id+0xe0/0xe0
> [  194.478282][ T4177]  really_probe+0x138/0x4c0
> [  194.479511][ T4177]  __driver_probe_device+0x191/0x220
> [  194.481069][ T4177]  driver_probe_device+0x2a/0x120
> [  194.482622][ T4177]  __device_attach_driver+0x105/0x1a0
> [  194.484609][ T4177]  ? driver_allows_async_probing+0x90/0x90
> [  194.486344][ T4177]  bus_for_each_drv+0xba/0x100
> [  194.487985][ T4177]  __device_attach+0x130/0x290
> [  194.489305][ T4177]  bus_probe_device+0xdb/0xf0
> [  194.490604][ T4177]  device_add+0x635/0xdf0
> [  194.492076][ T4177]  ? __mutex_unlock_slowpath+0x37/0x280
> [  194.493649][ T4177]  usb_set_configuration+0x936/0xc20
> [  194.495389][ T4177]  usb_generic_driver_probe+0x8c/0xc0
> [  194.496883][ T4177]  usb_probe_device+0x6c/0x180
> [  194.498207][ T4177]  ? usb_driver_release_interface+0xc0/0xc0
> [  194.500193][ T4177]  really_probe+0x138/0x4c0
> [  194.501561][ T4177]  __driver_probe_device+0x191/0x220
> [  194.503154][ T4177]  driver_probe_device+0x2a/0x120
> [  194.504596][ T4177]  __device_attach_driver+0x105/0x1a0
> [  194.506200][ T4177]  ? driver_allows_async_probing+0x90/0x90
> [  194.507925][ T4177]  bus_for_each_drv+0xba/0x100
> [  194.509331][ T4177]  __device_attach+0x130/0x290
> [  194.510671][ T4177]  bus_probe_device+0xdb/0xf0
> [  194.512115][ T4177]  device_add+0x635/0xdf0
> [  194.513392][ T4177]  usb_new_device.cold+0x10f/0x58e
> [  194.514905][ T4177]  hub_event+0x15f9/0x2650
> [  194.516333][ T4177]  process_one_work+0x381/0x940
> [  194.517826][ T4177]  worker_thread+0x5b/0x5d0
> [  194.519247][ T4177]  ? process_one_work+0x940/0x940
> [  194.527532][ T4177]  kthread+0x135/0x170
> [  194.535432][ T4177]  ? kthread_complete_and_exit+0x30/0x30
> [  194.543576][ T4177]  ret_from_fork+0x1f/0x30
> [  194.551127][ T4177]  </TASK>
> [  194.558820][ T4177] 5 locks held by kworker/0:3/4177:
> [  194.566387][ T4177]  #0: ffff88800a0fed38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x2b5/0x940
> [  194.575897][ T4177]  #1: ffffc90002fe3e70 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x2b5/0x940
> [  194.585166][ T4177]  #2: ffff888105129220 (&dev->mutex){....}-{3:3}, at: hub_event+0xc4/0x2650
> [  194.593581][ T4177]  #3: ffff88810cc40220 (&dev->mutex){....}-{3:3}, at: __device_attach+0x41/0x290
> [  194.603139][ T4177]  #4: ffff88810cc409a8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x41/0x290
> [  194.618658][ T4177] input: iMON Panel, Knob and Mouse(15c2:0039) as /devices/platform/dummy_hcd.0/usb2/2-1/2-1:0.0/input/input6
> [  194.781071][ T4177] rc_core: IR keymap rc-imon-pad not found
> [  194.789123][ T4177] Registered IR keymap rc-empty
> [  194.796624][ T4177] imon 2-1:0.0: Looks like you're trying to use an IR protocol this device does not support
> [  194.806014][ T4177] imon 2-1:0.0: Unsupported IR protocol specified, overriding to iMON IR protocol
> [  194.965830][ T4177] rc rc0: iMON Remote (15c2:0039) as /devices/platform/dummy_hcd.0/usb2/2-1/2-1:0.0/rc/rc0
> [  194.998797][ T4177] input: iMON Remote (15c2:0039) as /devices/platform/dummy_hcd.0/usb2/2-1/2-1:0.0/rc/rc0/input7
> [  195.033215][ T4177] imon 2-1:0.0: iMON device (15c2:0039, intf0) on usb<2:2> initialized
> [  195.119182][ T3553] usb 2-1: USB disconnect, device number 2
> [  195.131624][    C0] imon 2-1:0.0: imon usb_rx_callback_intf0: status(-71): ignored
> [  195.157933][ T3553] CPU: 2 PID: 3553 Comm: kworker/2:3 Not tainted 5.18.0-rc4-dirty #772
> [  195.171455][ T3553] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
> [  195.184454][ T3553] Workqueue: usb_hub_wq hub_event
> [  195.198577][ T3553] Call Trace:
> [  195.208174][ T3553]  <TASK>
> [  195.216716][ T3553]  dump_stack_lvl+0xcd/0x134
> [  195.225712][ T3553]  imon_disconnect+0x1c/0x271
> [  195.234653][ T3553]  usb_unbind_interface+0xe2/0x3e0
> [  195.243813][ T3553]  ? usb_unbind_device+0xc0/0xc0
> [  195.253236][ T3553]  device_remove+0x6d/0x80
> [  195.262130][ T3553]  device_release_driver_internal+0x275/0x300
> [  195.271507][ T3553]  bus_remove_device+0x12f/0x1d0
> [  195.281785][ T3553]  device_del+0x1e5/0x4e0
> [  195.290748][ T3553]  usb_disable_device+0x15f/0x310
> [  195.300276][ T3553]  usb_disconnect.cold+0xd8/0x2fd
> [  195.309417][ T3553]  ? __mutex_unlock_slowpath+0x37/0x280
> [  195.318605][ T3553]  hub_event+0x190b/0x2650
> [  195.327623][ T3553]  process_one_work+0x381/0x940
> [  195.336256][ T3553]  worker_thread+0x5b/0x5d0
> [  195.345289][ T3553]  ? process_one_work+0x940/0x940
> [  195.354733][ T3553]  kthread+0x135/0x170
> [  195.363529][ T3553]  ? kthread_complete_and_exit+0x30/0x30
> [  195.373531][ T3553]  ret_from_fork+0x1f/0x30
> [  195.382434][ T3553]  </TASK>
> [  195.397291][ T3553] 5 locks held by kworker/2:3/3553:
> [  195.408408][ T3553]  #0: ffff88800a0fed38 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x2b5/0x940
> [  195.417251][ T3553]  #1: ffffc90002963e70 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x2b5/0x940
> [  195.429307][ T3553]  #2: ffff888105129220 (&dev->mutex){....}-{3:3}, at: hub_event+0xc4/0x2650
> [  195.439282][ T3553]  #3: ffff88810cc40220 (&dev->mutex){....}-{3:3}, at: usb_disconnect+0x8e/0xa0
> [  195.450701][ T3553]  #4: ffff88810cc409a8 (&dev->mutex){....}-{3:3}, at: device_release_driver_internal+0x55/0x300
> ------------------------------------------------------------
