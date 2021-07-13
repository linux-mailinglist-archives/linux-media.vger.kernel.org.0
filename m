Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82FE13C7114
	for <lists+linux-media@lfdr.de>; Tue, 13 Jul 2021 15:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236459AbhGMNRn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 09:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236283AbhGMNRn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 09:17:43 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA1EC0613DD;
        Tue, 13 Jul 2021 06:14:53 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id w14so21429062edc.8;
        Tue, 13 Jul 2021 06:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K84vgru1YIqVtNmeFuEhqRqnsJNSVO73ZMY5BYsBJ8U=;
        b=kaflIbri9YV77jJ7dkdgxVFy+Uu7erp9W0KkRnMQBqPkk58voh2fi+dHwrZWhU3xvj
         bfNGXuMhhKg4xLXqEtmNnplXarLUnWHw5wwUno5CUu7uNIZXT+FNddnHK2dggRqx6YP0
         WqnB49FyWc6d+f4zi183s/mEvLuo/2wWcZAern7LUuiwkGdCYtVEtH99IqR8WwKN6GKE
         nAGfeFBvElklRsi1YlrexRKMszgLYanvtezoinlH/LkJLR8FxDhweBFpNMFnGgbLa4hU
         bY2WZetmWlPLbQJp3UnYVP/DNf2vG9xMUQEhXHMM9b4dMJzDxEJBx3pJmznNTWvZWUf0
         9mug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K84vgru1YIqVtNmeFuEhqRqnsJNSVO73ZMY5BYsBJ8U=;
        b=kgQqcLpxALBgtpeeTALSegXU2bwEOx36RNoWbIr68go0EpCurTMZkXvVBQJJ5R1PBX
         bQPuYKUaj6GgL5nfsziG456ULwwXlCVpufBvNWrLEMd+8miwvUBZSIA4rvZq7IW8pA8/
         zW8nkfFD3FPwTwuPtA9ZTbt213teY1NaP0vQDaVnMSz651ZkT/hOrlrJRaYDrllqaN98
         tIKk8yz2H3CmqD7HllqPMMWTqug0/FH0yb8BUYOiQlaXqWsXwj+F848JrrIA2WKR9SZ6
         I+F4/Gm02bAOzWjf1klFRC4Msy3AX2WxJOg7S/GeUYZCJEsc4HSfeJY/GW2sFf5YPjKW
         odaQ==
X-Gm-Message-State: AOAM530JW8fb6Pk4iseg0hJUA4WnnAwLPtsbnVwXI4BaUr8GQrupLa/p
        CUEL9hrs95wlJzJuikgPHcSgsP17WoyhX7F7nss=
X-Google-Smtp-Source: ABdhPJw1v6V6QaHDDXSsAhYUkms0Aifs9/xHMK8EzitM8X8EbF5RT8NSiPvjmOlt1tnR2GBNvJjmHlyQgpoMtWRs+io=
X-Received: by 2002:a05:6402:180e:: with SMTP id g14mr5710331edy.241.1626182091917;
 Tue, 13 Jul 2021 06:14:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210621113959.53320-1-mudongliangabcd@gmail.com> <20210713085259.GB6572@gofer.mess.org>
In-Reply-To: <20210713085259.GB6572@gofer.mess.org>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Tue, 13 Jul 2021 21:14:25 +0800
Message-ID: <CAD-N9QWdpXicp4S8-JLWv60PW0FaFGXDEAFSLhhP2sOzgiCFmA@mail.gmail.com>
Subject: Re: [PATCH 1/3 v2] media: dvb-usb: break long strings in dvb_usb_device_init
To:     Sean Young <sean@mess.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 13, 2021 at 4:53 PM Sean Young <sean@mess.org> wrote:
>
> On Mon, Jun 21, 2021 at 07:39:59PM +0800, Dongliang Mu wrote:
> > Break long strings into multiple lines.
> >
> > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > ---
> >  drivers/media/usb/dvb-usb/dvb-usb-init.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> > index 28e1fd64dd3c..edc477cedaa9 100644
> > --- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
> > +++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
> > @@ -286,13 +286,15 @@ int dvb_usb_device_init(struct usb_interface *intf,
> >
> >       desc = dvb_usb_find_device(udev, &d->props, &cold);
> >       if (!desc) {
> > -             deb_err("something went very wrong, device was not found in current device list - let's see what comes next.\n");
> > +             deb_err("something went very wrong, "
> > +                     "device was not found in current device list.\n");
>
> Long lines are acceptable unto 100 columns or more if they are string
> constants.  Breaking them up does not increase readability.

I see. Thanks for your comments. They are valuable to me.

>
> >               ret = -ENODEV;
> >               goto error;
> >       }
> >
> >       if (cold) {
> > -             info("found a '%s' in cold state, will try to load a firmware", desc->name);
> > +             info("found a %s in cold state, will try to load a firmware",
> > +                  desc->name);
>
> No reason for removing the quotes, I think.
>
> >               ret = dvb_usb_download_firmware(udev, props);
> >               if (!props->no_reconnect || ret != 0)
> >                       goto error;
> > @@ -314,7 +316,7 @@ int dvb_usb_device_init(struct usb_interface *intf,
> >       if (du)
> >               *du = d;
> >
> > -     info("%s successfully initialized and connected.", desc->name);
> > +     info("%s is successfully initialized and connected.", desc->name);
>
> "is" doesn't really add anything here, and the message is fine without it.
>
> >       return 0;
> >
> >   error:
> > --
> > 2.25.1
