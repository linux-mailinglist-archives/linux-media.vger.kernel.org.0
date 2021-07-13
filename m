Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46423C6C9F
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 10:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235323AbhGMIwO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 04:52:14 -0400
Received: from gofer.mess.org ([88.97.38.141]:52143 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235419AbhGMIvp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 04:51:45 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id F1864C6373; Tue, 13 Jul 2021 09:48:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1626166134; bh=Kb1db9y9hfywyFC1BjnKSGTEXSZ7oVli5/OFy6vdR0A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V5Y200UZfNleJAybYnHQE40TBpvBCYyFQbgm1M4rgQY4n05DhNSr3c7YP9f9QrLUt
         pPg+KwskE2Mwcr7hUa1YvV1hLsUcofPd4D8PVR7qsubx4L+YWQwMYwRZ1QTxEbVfl2
         sOymUlEqkgVRgKzS4JqJ4ti587agcJgp5tbXL584qZBgquEHTA8P3/5Z9XrXWpX++E
         c0/fpyzMZjsQk+VCHGY3E4U1Qaiar8wYpksTP8c5oPV7Dys8jkzpSwKmd83bNRM2ad
         GpL0CMmJ+fzSVh7e00EgxCFlWlj/+KpxKRcEoM0uONMyaxu/7pUgQmG9tyL9IY7I3P
         2ZTeolazLzoZA==
Date:   Tue, 13 Jul 2021 09:48:53 +0100
From:   Sean Young <sean@mess.org>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] [media] em28xx-input: fix refcount bug in
 em28xx_usb_disconnect
Message-ID: <20210713084853.GA6572@gofer.mess.org>
References: <20210707093409.1445747-1-mudongliangabcd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707093409.1445747-1-mudongliangabcd@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 07, 2021 at 05:34:09PM +0800, Dongliang Mu wrote:
> If em28xx_ir_init fails, it would decrease the refcount of dev. However,
> in the em28xx_ir_fini, when ir is NULL, it goes to ref_put and decrease
> the refcount of dev. This will lead to a refcount bug.
> 
> Fix this bug by removing the kref_put in the error handling code
> of em28xx_ir_init.
> 
> refcount_t: underflow; use-after-free.
> WARNING: CPU: 0 PID: 7 at lib/refcount.c:28 refcount_warn_saturate+0x18e/0x1a0 lib/refcount.c:28
> Modules linked in:
> CPU: 0 PID: 7 Comm: kworker/0:1 Not tainted 5.13.0 #3
> Workqueue: usb_hub_wq hub_event
> RIP: 0010:refcount_warn_saturate+0x18e/0x1a0 lib/refcount.c:28
> Call Trace:
>   kref_put.constprop.0+0x60/0x85 include/linux/kref.h:69
>   em28xx_usb_disconnect.cold+0xd7/0xdc drivers/media/usb/em28xx/em28xx-cards.c:4150
>   usb_unbind_interface+0xbf/0x3a0 drivers/usb/core/driver.c:458
>   __device_release_driver drivers/base/dd.c:1201 [inline]
>   device_release_driver_internal+0x22a/0x230 drivers/base/dd.c:1232
>   bus_remove_device+0x108/0x160 drivers/base/bus.c:529
>   device_del+0x1fe/0x510 drivers/base/core.c:3540
>   usb_disable_device+0xd1/0x1d0 drivers/usb/core/message.c:1419
>   usb_disconnect+0x109/0x330 drivers/usb/core/hub.c:2221
>   hub_port_connect drivers/usb/core/hub.c:5151 [inline]
>   hub_port_connect_change drivers/usb/core/hub.c:5440 [inline]
>   port_event drivers/usb/core/hub.c:5586 [inline]
>   hub_event+0xf81/0x1d40 drivers/usb/core/hub.c:5668
>   process_one_work+0x2c9/0x610 kernel/workqueue.c:2276
>   process_scheduled_works kernel/workqueue.c:2338 [inline]
>   worker_thread+0x333/0x5b0 kernel/workqueue.c:2424
>   kthread+0x188/0x1d0 kernel/kthread.c:319
>   ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
> 
> Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
> Fixes: ac5688637144 ("media: em28xx: Fix possible memory leak of em28xx struct")
> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
> v1->v2: move kref_get to the original position
>  drivers/media/usb/em28xx/em28xx-input.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
> index 59529cbf9cd0..0b6d77c3bec8 100644
> --- a/drivers/media/usb/em28xx/em28xx-input.c
> +++ b/drivers/media/usb/em28xx/em28xx-input.c
> @@ -842,7 +842,6 @@ static int em28xx_ir_init(struct em28xx *dev)
>  	kfree(ir);
>  ref_put:
>  	em28xx_shutdown_buttons(dev);
> -	kref_put(&dev->ref, em28xx_free_device);
>  	return err;
>  }

Ideally we want an init function to not have any side effects if it returns
an error (or to do undo those side effects). With this change, the as long
as is_audio_only is not set, we always do a kref_get(), even in the error
case. As long as is_audio_only is not set, fini always does a kref_put().

Now this works but it's not really very readable code, and it requires that
the fini is called even if init returns an error.

If an init function returns an error, it should undo any side effects like
allocations or reference counts. So the best way to handle this to only
do a kref_get() in the happy path of em28xx_ir_init().


Thanks

Sean
