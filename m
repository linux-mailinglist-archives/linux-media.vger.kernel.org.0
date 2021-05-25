Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F06A38FB22
	for <lists+linux-media@lfdr.de>; Tue, 25 May 2021 08:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbhEYGr6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 May 2021 02:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbhEYGr5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 May 2021 02:47:57 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51502C061574;
        Mon, 24 May 2021 23:46:27 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id y7so17264085eda.2;
        Mon, 24 May 2021 23:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MtotgoFTvDfN8LrSlpxInob2bAxV6I9xstIAOzQNFEA=;
        b=gVMO3OeOd5jORoY3jAig0E/p5N5NpWIaJuwYWhbXQzzsbG+Zp1gJLjVvvCDenjqgzc
         yIwvOMgaNlzlhxdibX5qrgYgNdiy7PgSh8A/1gh7FUC0t6/vel7JBGgKJG5qTyBBvGT4
         BEPR8wGwuuIJ7afYQFLgzJMW9q4RpYJo8JRR2c+E/SiTB1v127r8e5pzbG1zE5T9YuJJ
         EVBZpanKFMJ4yVAHRTqz+l4i0xQgGiYjQr0bWuVPaIGbvI4qvXQVNsekpZSo+unRxP8/
         V7s/oxv2dneGbWwsqzUNKy9aYphxoInetSsLdwFDt5dE8xiqlJot9KUGId2vNibVR4ET
         XDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MtotgoFTvDfN8LrSlpxInob2bAxV6I9xstIAOzQNFEA=;
        b=r7E84Pl2tpgpgCUiXwlHfV6bUXMG4A7d1iBcjxGzfaGe3SVDanRl4ZQy9xCOpIewj9
         IPHb4MamYkubuuJvQKMChWBVWr4yMHhiDtex9SKjdVYlOF3YX2NOyMhw6FJkROXbttbq
         /To20pubnfzNe3owS4fq2n6aA6iijQmYEMhlinaHWfmhw7zhGM2xKPm3t2GE4yzUH6M/
         V4ilRvj4OmJmLZcEsAYVH3wKeprhAg7dJ5KlGv4x07MYIWAXBIowTF/pHx184GGeuMVW
         UDmjhbOdkd5BGdiLMMwpRUoL9/kiCntG7ZUoZ7iRzeXMOOLGMhxnej/ExYD4J0Jbs7mg
         twMg==
X-Gm-Message-State: AOAM531+WrbKa29cmPwnsaA6zWRz3togoKaRIdK2A+3V/P2xmMw8lcdw
        hiyWo9wyIpPUAnPalTyXv3L/jiiJ6lIYJmC2wlaSXjQB81RuaorJzBo2uQ==
X-Google-Smtp-Source: ABdhPJwvyd445NmT3ekuVzvWBD2yw5FCEomPJViNObLfsXON4VQDNT4tHHuELeGc+mu/rTZ6+/bsTbCPPSp+yObzJos=
X-Received: by 2002:a05:6402:1767:: with SMTP id da7mr12755923edb.174.1621925185880;
 Mon, 24 May 2021 23:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210525053359.1147899-1-mudongliangabcd@gmail.com> <20210525081958.22f1e2b6@coco.lan>
In-Reply-To: <20210525081958.22f1e2b6@coco.lan>
From:   =?UTF-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
Date:   Tue, 25 May 2021 14:46:00 +0800
Message-ID: <CAD-N9QU+f1+CegprF-YOC85jrsOCTm1+W9c3cgebrG3J2psibg@mail.gmail.com>
Subject: Re: [PATCH] media: dvd_usb: memory leak in cinergyt2_fe_attach
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        syzbot <syzbot+e1de8986786b3722050e@syzkaller.appspotmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 25, 2021 at 2:20 PM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> Em Tue, 25 May 2021 13:33:59 +0800
> Dongliang Mu <mudongliangabcd@gmail.com> escreveu:
>
> > When cinergyt2_frontend_attach returns a negative value, the allocation
> > is already successful, but in the error handling, there is no any clean
> > corresponding operation, which leads to memory leak.
> >
> > Fix it by freeing struct cinergyt2_fe_state when the return value is
> > nonzero.
> >
> > backtrace:
> >   [<0000000056e17b1a>] kmalloc include/linux/slab.h:552 [inline]
> >   [<0000000056e17b1a>] kzalloc include/linux/slab.h:682 [inline]
> >   [<0000000056e17b1a>] cinergyt2_fe_attach+0x21/0x80 drivers/media/usb/dvb-usb/cinergyT2-fe.c:271
> >   [<00000000ae0b1711>] cinergyt2_frontend_attach+0x21/0x70 drivers/media/usb/dvb-usb/cinergyT2-core.c:74
> >   [<00000000d0254861>] dvb_usb_adapter_frontend_init+0x11b/0x1b0 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:290
> >   [<0000000002e08ac6>] dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:84 [inline]
> >   [<0000000002e08ac6>] dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:173 [inline]
> >   [<0000000002e08ac6>] dvb_usb_device_init.cold+0x4d0/0x6ae drivers/media/usb/dvb-usb/dvb-usb-init.c:287
> >
> > Reported-by: syzbot+e1de8986786b3722050e@syzkaller.appspotmail.com
> > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > ---
> >  drivers/media/usb/dvb-usb/dvb-usb-dvb.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
> > index 0a7f8ba90992..f9f004fb0a92 100644
> > --- a/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
> > +++ b/drivers/media/usb/dvb-usb/dvb-usb-dvb.c
> > @@ -288,7 +288,7 @@ int dvb_usb_adapter_frontend_init(struct dvb_usb_adapter *adap)
> >               }
> >
> >               ret = adap->props.fe[i].frontend_attach(adap);
> > -             if (ret || adap->fe_adap[i].fe == NULL) {
> > +             if (adap->fe_adap[i].fe == NULL) {
> >                       /* only print error when there is no FE at all */
> >                       if (i == 0)
> >                               err("no frontend was attached by '%s'",
> > @@ -297,6 +297,12 @@ int dvb_usb_adapter_frontend_init(struct dvb_usb_adapter *adap)
> >                       return 0;
> >               }
> >
> > +             if (ret) {
> > +                     struct dvb_frontend *fe = adap->fe_adap[i].fe;
> > +
> > +                     fe->ops.release(fe);
> > +                     return 0;
> > +             }
> > +
>
> Touching dvb-usb core doesn't seem the right fix here, as it will
> affect all other drivers that depend on it.
>
> Basically, when a driver returns an error, it has to cleanup
> whatever it did, as the core has no way to know where the
> error happened inside the driver logic.
>
> The problem seems to be at cinergyt2_frontend_attach() instead:
>
>         adap->fe_adap[0].fe = cinergyt2_fe_attach(adap->dev);
>
>         mutex_lock(&d->data_mutex);
>         st->data[0] = CINERGYT2_EP1_GET_FIRMWARE_VERSION;
>
>         ret = dvb_usb_generic_rw(d, st->data, 1, st->data, 3, 0);
>         if (ret < 0) {
>                 deb_rc("cinergyt2_power_ctrl() Failed to retrieve sleep state info\n");
>         }
>         mutex_unlock(&d->data_mutex);
>
>         /* Copy this pointer as we are gonna need it in the release phase */
>         cinergyt2_usb_device = adap->dev;
>
>         return ret;
>
> See, this driver returns an error if it fails to talk with the hardware
> when it calls dvb_usb_generic_rw(). Yet, it doesn't cleanup its own mess,
> as it keeps the frontend attached. The right fix would be to call
> cinergyt2_fe_release() if ret < 0.
>
> E. g., the above code should be, instead:
>
>         if (ret < 0) {
>                 fe->ops.release(adap->fe_adap[0].fe);
>                 deb_rc("cinergyt2_power_ctrl() Failed to retrieve sleep state info\n");
>         }

You're right. This is a good idea to handle the error inside the logic
of device driver.

I will test this proposed patch and send patch v2.

BTW, Mauro, did you see another mail thread [1] I sent? I doubt there
is an error between dvb_usb_adapter_frontend_init and
cinergyt2_frontend_attach

[1] https://www.spinics.net/lists/linux-media/msg193227.html

>
> Thanks,
> Mauro
