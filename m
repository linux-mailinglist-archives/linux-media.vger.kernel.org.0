Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D77E65BCD0
	for <lists+linux-media@lfdr.de>; Tue,  3 Jan 2023 10:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbjACJJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Jan 2023 04:09:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233041AbjACJJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Jan 2023 04:09:11 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5886E00A
        for <linux-media@vger.kernel.org>; Tue,  3 Jan 2023 01:09:10 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so30528332pjd.0
        for <linux-media@vger.kernel.org>; Tue, 03 Jan 2023 01:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jcCeUe8dp3S0aIMiyCkv1Dk6gs4kz2Rph2Ssgj/ekI0=;
        b=TL/1ao89hsBreVnGN22u5zp0DHtCX9c2AzLxijusP3QSP4QTbywfw/7EuRB7yIKcEP
         C1Biq5+4JdbSQkFIWKTTxni2MzrTs5iiw4GKfsZMSOJBXYR4V+A70HpG6WAspLdoUy8Y
         XQaiRE7546GF9oWek9s0lvW/LoB6l84hC02Lg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcCeUe8dp3S0aIMiyCkv1Dk6gs4kz2Rph2Ssgj/ekI0=;
        b=lW7D42v6PdmBTrtDgo6uEfQdUtoIyoUHZC+cKMelx6Q29gPeGKjXXz3dYgmrJO1+EZ
         zrPSol/J8uua5t9VjSvA9TN8jZoyLtIKeZWIGOF20Y9atVfdgXBjlHJ0D7+HR4sO/yXb
         lgY3ftTmro5QH0wpPzfsSI8BKv5ETpygxX/fE+bjgFCPrCeL3hjptjzLEFA2ZX2WAj25
         SUmBOuPCkUULxLCOlG63nlGS4q6DyUOKHfgND2Wmn3xGXcd/hc5qJbct1THaeOzbUXCs
         +dpyWnoN9E+NkSigSInVrwfcIwd8Ri+S9/oXmlbBIsuB0sBbCd3YjsWrQXCLT3BMZSJ4
         mLiA==
X-Gm-Message-State: AFqh2kouCEEtxA/0rw19i3hNCM7S2MxZIjvs4z7O0NBcM5rflRG0vYP8
        6GDp5VQrHxcv3BGwia6z4tlLFIw2mdCSVyDxVZQ=
X-Google-Smtp-Source: AMrXdXsxjlkU7GsIN9QNshlSLo4IztxnBACSVhIr3BiE+ar4Rc9rquQpWv3HxSTuMsZiEObXJTyKlA==
X-Received: by 2002:a17:90b:1e05:b0:226:8ad:28f0 with SMTP id pg5-20020a17090b1e0500b0022608ad28f0mr26635994pjb.31.1672736949952;
        Tue, 03 Jan 2023 01:09:09 -0800 (PST)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id s4-20020a17090a13c400b002261ea8ac4fsm9728052pjf.13.2023.01.03.01.09.08
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 01:09:08 -0800 (PST)
Received: by mail-pg1-f181.google.com with SMTP id b12so19706828pgj.6
        for <linux-media@vger.kernel.org>; Tue, 03 Jan 2023 01:09:08 -0800 (PST)
X-Received: by 2002:a65:5b88:0:b0:495:fb5f:4395 with SMTP id
 i8-20020a655b88000000b00495fb5f4395mr1743111pgr.63.1672736947897; Tue, 03 Jan
 2023 01:09:07 -0800 (PST)
MIME-Version: 1.0
References: <20221212-uvc-race-v6-0-2a662f8de011@chromium.org> <20230103022540.3667-1-hdanton@sina.com>
In-Reply-To: <20230103022540.3667-1-hdanton@sina.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 3 Jan 2023 10:08:56 +0100
X-Gmail-Original-Message-ID: <CANiDSCuTZ17ohj=G3c_36NmnCTtwt0aBZ1Fkh-+rzwEgufK5kw@mail.gmail.com>
Message-ID: <CANiDSCuTZ17ohj=G3c_36NmnCTtwt0aBZ1Fkh-+rzwEgufK5kw@mail.gmail.com>
Subject: Re: [PATCH v6] media: uvcvideo: Fix race condition with usb_kill_urb
To:     Hillf Danton <hdanton@sina.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Max Staudt <mstaudt@google.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Yunke Cao <yunkec@chromium.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hillf

Thanks for the heads up

On Tue, 3 Jan 2023 at 03:25, Hillf Danton <hdanton@sina.com> wrote:
>
> On 02 Jan 2023 15:48:01 +0100 Ricardo Ribalda <ribalda@chromium.org>
> > --- a/drivers/media/usb/uvc/uvc_ctrl.c
> > +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> > @@ -1442,6 +1442,9 @@ static void uvc_ctrl_status_event_work(struct work_struct *work)
> >
> >       uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
> >
> > +     if (dev->flush_status)
> > +             return;
> > +
> >       /* Resubmit the URB. */
> >       w->urb->interval = dev->int_ep->desc.bInterval;
> >       ret = usb_submit_urb(w->urb, GFP_KERNEL);
> > diff --git a/drivers/media/usb/uvc/uvc_status.c b/drivers/media/usb/uvc/uvc_status.c
> > index 7518ffce22ed..e457889345a3 100644
> > --- a/drivers/media/usb/uvc/uvc_status.c
> > +++ b/drivers/media/usb/uvc/uvc_status.c
> > @@ -6,6 +6,7 @@
> >   *          Laurent Pinchart (laurent.pinchart@ideasonboard.com)
> >   */
> >
> > +#include <asm/barrier.h>
> >  #include <linux/kernel.h>
> >  #include <linux/input.h>
> >  #include <linux/slab.h>
> > @@ -309,5 +310,44 @@ int uvc_status_start(struct uvc_device *dev, gfp_t flags)
> >
> >  void uvc_status_stop(struct uvc_device *dev)
> >  {
> > +     struct uvc_ctrl_work *w = &dev->async_ctrl;
> > +
> > +     /* Prevent the asynchronous control handler from requeing the URB */
> > +     dev->flush_status = true;
> > +
> > +     /*
> > +      * The barrier is needed so the flush_status change is visible to other
> > +      * CPUs running the asynchronous handler before usb_kill_urb() is
> > +      * called below.
> > +      */
> > +     smp_mb();
>
> Given unpaired mb, take a look at the release/acquire memory barrier pairing
> in c5b2cbdbdac5 ("ipc/mqueue.c: update/document memory barriers")

Would it work? to replace:

dev->flush_status = true;
smp_mb();

with:
smp_store_release(&dev->flush_status, 1);

and then read it always with:

smp_load_acquire(&dev->flush_status);

Thanks!

>
> > +
> > +     /* If there is any status event on the queue, process it. */
> > +     if (cancel_work_sync(&w->work))
> > +             uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
> > +
> > +     /* Kill the urb. */
> >       usb_kill_urb(dev->int_urb);
> > +
> > +     /*
> > +      * The URB completion handler may have queued asynchronous work. This
> > +      * won't resubmit the URB as flush_status is set, but it needs to be
> > +      * cancelled before returning or it could then race with a future
> > +      * uvc_status_start() call.
> > +      */
> > +     if (cancel_work_sync(&w->work))
> > +             uvc_ctrl_status_event(w->chain, w->ctrl, w->data);
> > +
> > +     /*
> > +      * From this point, there are no events on the queue and the status URB
> > +      * is dead, this is, no events will be queued until uvc_status_start()
> > +      * is called.
> > +      */
> > +     dev->flush_status = false;
> > +
> > +     /*
> > +      * Write to memory the value of flush_status before uvc_status_start()
> > +      * is called again.
> > +      */
> > +     smp_mb();
> >  }



-- 
Ricardo Ribalda
