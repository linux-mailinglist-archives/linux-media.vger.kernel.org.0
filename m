Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D69632C94FA
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 03:09:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgLACIb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 21:08:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgLACIa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 21:08:30 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00A1C0613CF;
        Mon, 30 Nov 2020 18:07:50 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id k5so219509plt.6;
        Mon, 30 Nov 2020 18:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YzRoQK48hdn26VwNICKcMxppEh6YmVkly2mV0TpEsRM=;
        b=Xsg1VUulHwkQfdILKkBsYjqHAtcrFzXA6wZ05axioxZiTH4XBlkHSJaOmjs74Z5Xd9
         76ccBwPaFGtNxtJwy+Nd651I1jEAJPLZYY2qKUQSLa54aQRpL+YqV8yT0JSPZLqbJP6n
         UiEyhlPNkzyGCBzBI00H3tiHDVlfyg/vTBzObX2lLmjLp5eYaBAESZOAyoxN0qNkElZH
         e3zjD+lSk04DbNrtlwybURtZb+kF4jhr3VRz2EmDI07woZYC+ZlxTyQxrNut10Ts6g6a
         Uvu4zuHEJ1mGgt+OmZv94p/L106k8ahnS+4Nr/HnPN0pWy8Do6yhhqHAwcvRFGIws+QW
         xQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YzRoQK48hdn26VwNICKcMxppEh6YmVkly2mV0TpEsRM=;
        b=KdDsrQXCGKrTW6foxBhiAPTAvyqdOWN9VyFZSdaQotbgcU26gstonyROKU3l+ZezHD
         pd0OUFSIKvKZc/Ru/GVy4pOEylKZeKlDc1TVCFN8ve/o5tkcJxHF+KFqBcm3Lx/SZ1PD
         BrUUJYHXlIXtF0DUHD3vPKV/O8UvQHsGm9xafjo/bk7Po8bDbtZmONWtao5b5AwxWi//
         4ageHPcfiSsyoXsX/x+a5lWjh0ENow263kdRJ9rdFagC5muiLM4GG8NauFBwUygjcJZ7
         euWi/5j3E4I5Jf7NRRKosn4dXmK4vozWgzDBY4tkaIghnI5fxoLXkJrX8/pORP+3q3ls
         6KnA==
X-Gm-Message-State: AOAM53056n0i/1WWsZuoz+6qc9efJ+D66NeqS5McsgIcAvbYtoGUbIVx
        NVyMKlKd5vQuibyacc6nc9iQCNBp/fbKchh4ZR4=
X-Google-Smtp-Source: ABdhPJw8Q293pQSHy+xmCE/WnmtGsJ7v0tqKoGQ0rGQvPsKLVAK+dPRQlbFRB7zuFh9nBcHLbJ5oRo39e/Dr4sI7TGo=
X-Received: by 2002:a17:902:7144:b029:da:7268:d730 with SMTP id
 u4-20020a1709027144b02900da7268d730mr632304plm.20.1606788470247; Mon, 30 Nov
 2020 18:07:50 -0800 (PST)
MIME-Version: 1.0
References: <d0ac1a26ed5943127cb0156148735f5f52a07075.1606459576.git.mchehab+huawei@kernel.org>
 <CA+FuTSenOoVxM6W9viwXQmPHo_MEoQzQ=GPxJi72fYGHHmqmwA@mail.gmail.com>
 <20201130104420.321531ec@coco.lan> <CAA7C2qiOAZR+QwY5Bs-UHQzBEfA15gMG-GjriqNo3Q5biY4+ZQ@mail.gmail.com>
 <20201130180834.07a3116f@coco.lan>
In-Reply-To: <20201130180834.07a3116f@coco.lan>
From:   VDRU VDRU <user.vdr@gmail.com>
Date:   Mon, 30 Nov 2020 18:07:37 -0800
Message-ID: <CAA7C2qgAC8vnxu4xVhdi2CsMXyx85J44yUxGk00JhoQ6j5U3tw@mail.gmail.com>
Subject: Re: [PATCH] media: gp8psk: initialize stats at power control logic
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        syzbot <syzkaller@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

After many attempts ret was always 0. Please let me know if further
testing is needed.

Best regards,
Derek

On Mon, Nov 30, 2020 at 9:09 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Hi Derek,
>
> Em Mon, 30 Nov 2020 08:04:31 -0800
> VDRU VDRU <user.vdr@gmail.com> escreveu:
>
> > I have hardware that uses this driver and can conduct a test if it
> > will help resolve any confusion/assumption. I'd also like to suggest
> > that making changes to drivers with no means of testing those changes
> > is bad. This has happened in the past and resulted in unnecessarily
> > breaking drivers for those who use it. No patch should be merged
> > without testing!
>
> It helps a lot if you could test it.
>
> The current situation is that, if the I2C read fails, the
> driver will randomly power up only partially, which could
> cause issues.
>
> The original proposed approach:
>
>         https://lore.kernel.org/linux-media/20190627222020.45909-1-willemdebruijn.kernel@gmail.com/
>
> Will just give up trying to powering it up, while the
> patch I'm proposing will force the device to power up
> all parts of it. So, it seems safer than the original
> one.
>
> Please test with the enclosed patch. It is basically
> the same as the one I proposed, although this one will
> print a message at dlog, due to this:
>
>         pr_info("ret returned %d\n", ret);
>
> This could happen when the device got plugged and/or if
> you put the machine into suspend mode, when resuming it
> while streaming[1]
>
> Regards,
> Mauro
>
> [1] not sure if dvb-usb supports it. One of the rationales
> behind dvb-usb-v2 were to be able of properly do
> suspend/resumes.
>
>
>
> diff --git a/drivers/media/usb/dvb-usb/gp8psk.c b/drivers/media/usb/dvb-usb/gp8psk.c
> index c07f46f5176e..be55496cc717 100644
> --- a/drivers/media/usb/dvb-usb/gp8psk.c
> +++ b/drivers/media/usb/dvb-usb/gp8psk.c
> @@ -182,11 +182,16 @@ static int gp8psk_load_bcm4500fw(struct dvb_usb_device *d)
>
>  static int gp8psk_power_ctrl(struct dvb_usb_device *d, int onoff)
>  {
> -       u8 status, buf;
> +       u8 status = 0, buf;
> +       int ret;
>         int gp_product_id = le16_to_cpu(d->udev->descriptor.idProduct);
>
>         if (onoff) {
> -               gp8psk_usb_in_op(d, GET_8PSK_CONFIG,0,0,&status,1);
> +               ret = gp8psk_usb_in_op(d, GET_8PSK_CONFIG,0,0,&status,1);
> +               // Just to check if the condition happens in practice
> +               if (ret < 0)
> +                       pr_info("ret returned %d\n", ret);
> +
>                 if (! (status & bm8pskStarted)) {  /* started */
>                         if(gp_product_id == USB_PID_GENPIX_SKYWALKER_CW3K)
>                                 gp8psk_usb_out_op(d, CW3K_INIT, 1, 0, NULL, 0);
>
