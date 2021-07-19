Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3CAF3CD158
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 12:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236011AbhGSJRI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 05:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235976AbhGSJRH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 05:17:07 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE5AC061574;
        Mon, 19 Jul 2021 02:01:30 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id ee25so23121753edb.5;
        Mon, 19 Jul 2021 02:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HdF1IGrepbpbXkB6goOKIeEiWTBGRqEN4WUlOYeDmXg=;
        b=VVqVvb/5juZtwbzkAbWA2/xYJ/jmwlUZ4HiIxDQ9IFXBWClcPzgUWPTE6wJZjut6jr
         Dpwk59uuktgLZ0FVRDMbf4xUGWqNusdJLUl/MlvMTHVcHuQSJsPzNQTk58gfpKe58YzO
         6yTMF6m3cWps4eF5Dg4n4iMK/fMyocqYEv5kZ/DshMTmLXk1+i9fRPkY3114xMLHWVoH
         dHjOdv837LU5GTKFyxYjbMnhBHKiBa43BQtCV58Cv1pSH0YktU+pCXfblDY5pyuNLtp9
         Xumr21nLrZQg/pEc/sBiHSfQQOl0ScswgjWfwkDXihYvsk7/BbOy7PVPTy1lZSAzTkmI
         dxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HdF1IGrepbpbXkB6goOKIeEiWTBGRqEN4WUlOYeDmXg=;
        b=gdz3W8Z6PwoWwAYnuOOliDyu4i0OE/+5p/kZE5Mar8iF1LuknIq8MFTSOv2eNsW9eq
         FrcsHAa0PxhuYrOlCWPfnkAK1u91kUJy0PjpBuSJKBNoHEARiRF3g/m77PMGX/r5DWWX
         5HI2WjKcA3M2WjYhUCa+543+dGXA8SmXwEfdhuk2fscR7AINXGphz/d8L7y3On9Bff8v
         cHw9YuNY0iDa8itEG49jyuOtBek9iOpPHevU9WeQCt+xYpTXChgLbsucNcRKzZjy1OFy
         Tg1IzlK5jNqwvzwKNZrxITYnuZK4UehQSqHEOoEqBqE1J+k44bbU2y4cFYRKPap/dD9N
         zQfQ==
X-Gm-Message-State: AOAM531smhS0IahLav74tBYdt3mgC/BRzoMi1/+CNGVsT9P8scOu/wjm
        wM0RXqRuSDdz5UR1Fo1vMW8eJdFaQZOt0uxy4a4=
X-Google-Smtp-Source: ABdhPJzHSAodPxDo2KolXme/Kve5r34JFRvxTw04wFE1zzdOx5nJjiGcwSWH9gAXLi7ZRM2KU+FVzpP2GM0UjPcUA1k=
X-Received: by 2002:a05:6402:4c5:: with SMTP id n5mr33078183edw.322.1626688664982;
 Mon, 19 Jul 2021 02:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210707093409.1445747-1-mudongliangabcd@gmail.com>
 <20210713084853.GA6572@gofer.mess.org> <CAD-N9QVao4jFEPNrFm5=_qS6brXQuJYfXkSo6YqECgUZtVhW3w@mail.gmail.com>
In-Reply-To: <CAD-N9QVao4jFEPNrFm5=_qS6brXQuJYfXkSo6YqECgUZtVhW3w@mail.gmail.com>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Mon, 19 Jul 2021 17:57:18 +0800
Message-ID: <CAD-N9QUVDPeJqZPA7WEYHS5rKojTP1ae_vDJ1bK0=-+Aqppebg@mail.gmail.com>
Subject: Re: [PATCH v2] [media] em28xx-input: fix refcount bug in em28xx_usb_disconnect
To:     Sean Young <sean@mess.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This can also fix another crash report - KASAN: use-after-free Read in
em28xx_close_extension [1]. It should be duplicated bug reports with
the memory leak.

[1] https://syzkaller.appspot.com/bug?id=a09553fd4df4c4a3824dc37a4040bf80d2600a50


On Tue, Jul 13, 2021 at 5:49 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>
> On Tue, Jul 13, 2021 at 4:48 PM Sean Young <sean@mess.org> wrote:
> >
> > On Wed, Jul 07, 2021 at 05:34:09PM +0800, Dongliang Mu wrote:
> > > If em28xx_ir_init fails, it would decrease the refcount of dev. However,
> > > in the em28xx_ir_fini, when ir is NULL, it goes to ref_put and decrease
> > > the refcount of dev. This will lead to a refcount bug.
> > >
> > > Fix this bug by removing the kref_put in the error handling code
> > > of em28xx_ir_init.
> > >
> > > refcount_t: underflow; use-after-free.
> > > WARNING: CPU: 0 PID: 7 at lib/refcount.c:28 refcount_warn_saturate+0x18e/0x1a0 lib/refcount.c:28
> > > Modules linked in:
> > > CPU: 0 PID: 7 Comm: kworker/0:1 Not tainted 5.13.0 #3
> > > Workqueue: usb_hub_wq hub_event
> > > RIP: 0010:refcount_warn_saturate+0x18e/0x1a0 lib/refcount.c:28
> > > Call Trace:
> > >   kref_put.constprop.0+0x60/0x85 include/linux/kref.h:69
> > >   em28xx_usb_disconnect.cold+0xd7/0xdc drivers/media/usb/em28xx/em28xx-cards.c:4150
> > >   usb_unbind_interface+0xbf/0x3a0 drivers/usb/core/driver.c:458
> > >   __device_release_driver drivers/base/dd.c:1201 [inline]
> > >   device_release_driver_internal+0x22a/0x230 drivers/base/dd.c:1232
> > >   bus_remove_device+0x108/0x160 drivers/base/bus.c:529
> > >   device_del+0x1fe/0x510 drivers/base/core.c:3540
> > >   usb_disable_device+0xd1/0x1d0 drivers/usb/core/message.c:1419
> > >   usb_disconnect+0x109/0x330 drivers/usb/core/hub.c:2221
> > >   hub_port_connect drivers/usb/core/hub.c:5151 [inline]
> > >   hub_port_connect_change drivers/usb/core/hub.c:5440 [inline]
> > >   port_event drivers/usb/core/hub.c:5586 [inline]
> > >   hub_event+0xf81/0x1d40 drivers/usb/core/hub.c:5668
> > >   process_one_work+0x2c9/0x610 kernel/workqueue.c:2276
> > >   process_scheduled_works kernel/workqueue.c:2338 [inline]
> > >   worker_thread+0x333/0x5b0 kernel/workqueue.c:2424
> > >   kthread+0x188/0x1d0 kernel/kthread.c:319
> > >   ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
> > >
> > > Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > Fixes: ac5688637144 ("media: em28xx: Fix possible memory leak of em28xx struct")
> > > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > ---
> > > v1->v2: move kref_get to the original position
> > >  drivers/media/usb/em28xx/em28xx-input.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
> > > index 59529cbf9cd0..0b6d77c3bec8 100644
> > > --- a/drivers/media/usb/em28xx/em28xx-input.c
> > > +++ b/drivers/media/usb/em28xx/em28xx-input.c
> > > @@ -842,7 +842,6 @@ static int em28xx_ir_init(struct em28xx *dev)
> > >       kfree(ir);
> > >  ref_put:
> > >       em28xx_shutdown_buttons(dev);
> > > -     kref_put(&dev->ref, em28xx_free_device);
> > >       return err;
> > >  }
> >
> > Ideally we want an init function to not have any side effects if it returns
> > an error (or to do undo those side effects). With this change, the as long
> > as is_audio_only is not set, we always do a kref_get(), even in the error
> > case. As long as is_audio_only is not set, fini always does a kref_put().
> >
> > Now this works but it's not really very readable code, and it requires that
> > the fini is called even if init returns an error.
> >
> > If an init function returns an error, it should undo any side effects like
> > allocations or reference counts. So the best way to handle this to only
> > do a kref_get() in the happy path of em28xx_ir_init().
>
> Hi Sean,
>
> In the v1 version, I moved kref_get from the beginning to the ending.
> Do you mean this change?
>
> @@ -708,7 +708,6 @@ static int em28xx_ir_init(struct em28xx *dev)
>   return 0;
>   }
>
> - kref_get(&dev->ref);
>   INIT_DELAYED_WORK(&dev->buttons_query_work, em28xx_query_buttons);
>
>   if (dev->board.buttons)
> @@ -833,6 +832,9 @@ static int em28xx_ir_init(struct em28xx *dev)
>
>   dev_info(&dev->intf->dev, "Input extension successfully initialized\n");
>
> + /* Only increase refcount when this function is executed successfully */
> + kref_get(&dev->ref);
> +
>   return 0;
>
> Another reason not to move kref_get is that Paval comments on my patch:
>
> > kref_get() should be before this call to not trigger UAF in em28xx_query_buttons()
>
> So I think it's safe to call kref_get at the beginning.
>
> >
> >
> > Thanks
> >
> > Sean
