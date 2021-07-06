Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89073BD6E0
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 14:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240736AbhGFMsh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 08:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240513AbhGFMse (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 08:48:34 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCC4C0613B0;
        Tue,  6 Jul 2021 05:35:05 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id nd37so33893081ejc.3;
        Tue, 06 Jul 2021 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OEiRIcOa0itWUqzAw3qeKw5oQ3tEWPoDip0KTs3RlmY=;
        b=AyyFuo3EgkjqhqVbuiE9I4vYSyRf7bF2WqICmUd96kNsLKNow7CcDP8kRuexKtMhiw
         3lRN3GENrjQ3YYtbAfcDRPzUfFYYluX6SCN7fXPX1zPR6P/braBr6k+ooCikwY2LevRY
         Up9pcXND0JQvwrqCaBtt/p+Ku98NkeD9eFrD+CwRwjfyTDAOUyXt9InBbBhBr8BOV7ac
         6k+cFznxievWVMCQp3NZqB4Jud3DVTNmkwY2amFZNWqUSeapDFvkIIDpad95OUT5BUF6
         JjLOCAZcXwGIguKKfXVjMG+Av71+ru1+44Ow4V7KLR7l32em9U24f2wMfYsyyKztY0/V
         Sf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OEiRIcOa0itWUqzAw3qeKw5oQ3tEWPoDip0KTs3RlmY=;
        b=YdBCGMbMn1jTGoJkJ8C0vxW0A9X1GjP9u5/LclmVYtw7Xikm3bxvU8vI1VrT3ygITi
         k1TRmXdaPLuKYrnRNh4q7SxlVYGDHkYVE/hF+/arniTcCUl1rTo1Y/TpWlM4pVMDGq/N
         +9TYMIxoOV/B0MeveMRf/J9nsESMpXeF0qv5QSYTZbKpGRIuxGSQ8IhiZrjaVDbO6YvN
         wvkxizx7bZhrDXClE2ijztWI5RRW8oy4bG3o9XdSoDBQRdfxrhm4Eg4ETLbEfjgDd6wb
         VwmooTAMVSODhgfVHYMvpvLW5l59ULCsJcIPW91K9JeUlLTEqEQMIjk37SwJJmVpawdY
         140Q==
X-Gm-Message-State: AOAM533RUPRtmIX+ePlxCyD0oRWgEgWND9fHTHDQWbi0ToZja3uOOxAy
        OUFP1cebe1Fjj5YyO/m0D57686PGZCw+mJ7rOiE=
X-Google-Smtp-Source: ABdhPJxFZwLjfGEhJQfYMHpB/nh9fsCWcfCXC7NKfMenP/hCD8yrI2BgNZfZaC2r43BhgloCIzfDlrUcDtPd13EGmmA=
X-Received: by 2002:a17:906:4784:: with SMTP id cw4mr2582307ejc.160.1625574904064;
 Tue, 06 Jul 2021 05:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210706121505.641603-1-mudongliangabcd@gmail.com>
In-Reply-To: <20210706121505.641603-1-mudongliangabcd@gmail.com>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Tue, 6 Jul 2021 20:34:37 +0800
Message-ID: <CAD-N9QXDAjpm8A6TxoUeYRJu5YkU8S7hr05HdrvUrXc2SVHp0A@mail.gmail.com>
Subject: Re: [PATCH] [media] em28xx-input: fix refcount bug in em28xx_usb_disconnect
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Frank_Sch=C3=A4fer?= <fschaefer.oss@googlemail.com>
Cc:     linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 6, 2021 at 8:15 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>
> If em28xx_ir_init fails, it would decrease the refcount of dev. However,
> in the em28xx_ir_fini, when ir is NULL, it goes to ref_put and decrease
> the refcount of dev. This will lead to a refcount bug.
>
> Fix this bug by returning 0 when ir is NULL in the em28xx_ir_fini. To
> simplify the refcount issue, move the kref_get after the input
> extension is successfully initialized and remove the kref_put in the
> error handling code.
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
> Fixes: 47677e51e2a4 ("[media] em28xx: Only deallocate struct em28xx after finishing all extensions")

After some more code review, I think the "Fixes" tag should be the fix:

ac5688637144 ("media: em28xx: Fix possible memory leak of em28xx struct")

static struct em28xx_ops rc_ops = {
        .id   = EM28XX_RC,
        .name = "Em28xx Input Extension",
        .init = em28xx_ir_init,
        .fini = em28xx_ir_fini,
}
As init and fini are executed in pair, there is no need to decrease
the refcount in the error handling code.

In this patch, I remove the kref_put to prevent the refcount bug.

> Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> ---
>  drivers/media/usb/em28xx/em28xx-input.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
> index 59529cbf9cd0..f741be9583a8 100644
> --- a/drivers/media/usb/em28xx/em28xx-input.c
> +++ b/drivers/media/usb/em28xx/em28xx-input.c
> @@ -708,7 +708,6 @@ static int em28xx_ir_init(struct em28xx *dev)
>                 return 0;
>         }
>
> -       kref_get(&dev->ref);
>         INIT_DELAYED_WORK(&dev->buttons_query_work, em28xx_query_buttons);
>
>         if (dev->board.buttons)
> @@ -833,6 +832,9 @@ static int em28xx_ir_init(struct em28xx *dev)
>
>         dev_info(&dev->intf->dev, "Input extension successfully initialized\n");
>
> +       /* Only increase refcount when this function is executed successfully */
> +       kref_get(&dev->ref);
> +
>         return 0;
>
>  error:
> @@ -842,7 +844,6 @@ static int em28xx_ir_init(struct em28xx *dev)
>         kfree(ir);
>  ref_put:
>         em28xx_shutdown_buttons(dev);
> -       kref_put(&dev->ref, em28xx_free_device);
>         return err;
>  }
>
> @@ -861,7 +862,7 @@ static int em28xx_ir_fini(struct em28xx *dev)
>
>         /* skip detach on non attached boards */
>         if (!ir)
> -               goto ref_put;
> +               return 0;
>
>         rc_unregister_device(ir->rc);
>
> @@ -871,7 +872,6 @@ static int em28xx_ir_fini(struct em28xx *dev)
>         kfree(ir);
>         dev->ir = NULL;
>
> -ref_put:
>         kref_put(&dev->ref, em28xx_free_device);
>
>         return 0;
> --
> 2.25.1
>
