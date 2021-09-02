Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C23F3FEC13
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 12:24:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240533AbhIBKZE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 06:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233714AbhIBKZD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Sep 2021 06:25:03 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 029A1C061575;
        Thu,  2 Sep 2021 03:24:04 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id lc21so3127101ejc.7;
        Thu, 02 Sep 2021 03:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a/aNNaQOk2PsxF1uVVYaaDSIyLlSNsiqA+VC8U+Vvxo=;
        b=g711xaJpswgFhuRVvN/yPVH2ddfRcnUqK/4nWVLEEavaJAcabYr1VdxKT2AWQmo0em
         +j5B/SYphqr4acIP69dvOu1GRseMq3ET2DTh+cWpHMqXGoPjZI0r06khrFdTZTWXxyXE
         T43QsIFigkn8Nms6cy5hUqBqdAeVaj7mrfOkA0iRiqROdfpY0MybDJXqXumH54XgtjCL
         0tWh33qAzgUIylJhFFmU+RL4WkGH9Ya1Ew/IdAsGWRndthjg4qSJai5Nvcm2Zs+Nnpgk
         Asuj8OVCKiR7K4vf//hoazpgpKdbKn3Izd+r1zvr2aTh7Zkw76l8Ksg4YT1UlShvPkkn
         chbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a/aNNaQOk2PsxF1uVVYaaDSIyLlSNsiqA+VC8U+Vvxo=;
        b=m990yt+QsBSyAd20aVF7/6CGY3jwMQ6PyB05mbBiCiBWa0D0VegFlXbbaH1xNe5dEz
         41LuM372vI+z1YCZD+AIHgL3b1YB87jPrl2rxqM1dxXngfRAJ7o8W5zOkCJgBc2A02CO
         +Ji9KONKBMbGkOyxv/eVLslSfbZm2y5j8MGbkZxje/8tfNkw44sD9nlSiePvnn9Lfeex
         R8DSpvLQ84X6spZv3ZqM5uQFC2uz3IoiZ+kqpmrfzF6s3WAzaURTu3eL5OuA6NpX+1dH
         ln1ex9CLAEG18/7rQySf5IM0DlqmNyptuutrhqRqB6HdVdHcLu2VPmVl5VQ5yqA8dSCV
         kiJw==
X-Gm-Message-State: AOAM532+TV5y6m3Fsgf/2LyrKYmYtzTECroR9p3zUSU51gskyD9GF6z8
        zVt7UXeoPX691ztCgHogEHiqwynW2xbj9pn9cgE=
X-Google-Smtp-Source: ABdhPJwRHs71jMrEvxz8YkYil1LhNo8fUy/5yR+U6rdh50obism0olwvKC2yoLK8wahx071cc7Onlbg+iCoJce3adOI=
X-Received: by 2002:a17:906:9b1:: with SMTP id q17mr2956095eje.546.1630578243412;
 Thu, 02 Sep 2021 03:24:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210714032340.504836-1-mudongliangabcd@gmail.com> <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
In-Reply-To: <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
From:   Dongliang Mu <mudongliangabcd@gmail.com>
Date:   Thu, 2 Sep 2021 18:23:36 +0800
Message-ID: <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com>
Subject: Re: [PATCH] media: usb: fix memory leak in stk_camera_probe
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 23, 2021 at 6:11 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
>
> On Wed, Jul 14, 2021 at 11:23 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> >
> > stk_camera_probe mistakenly execute usb_get_intf and increase the
> > refcount of interface->dev.
> >
> > Fix this by removing the execution of usb_get_intf.
>
> Any idea about this patch?

+cc Dan Carpenter, gregkh

There is no reply in this thread in one month. Can someone give some
feedback on this patch?

>
> >
> > Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > Fixes: 0aa77f6c2954 ("[media] move the remaining USB drivers to drivers/media/usb")
> > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > ---
> >  drivers/media/usb/stkwebcam/stk-webcam.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
> > index a45d464427c4..5bd8e85b9452 100644
> > --- a/drivers/media/usb/stkwebcam/stk-webcam.c
> > +++ b/drivers/media/usb/stkwebcam/stk-webcam.c
> > @@ -1311,7 +1311,6 @@ static int stk_camera_probe(struct usb_interface *interface,
> >
> >         dev->udev = udev;
> >         dev->interface = interface;
> > -       usb_get_intf(interface);
> >
> >         if (hflip != -1)
> >                 dev->vsettings.hflip = hflip;
> > --
> > 2.25.1
> >
