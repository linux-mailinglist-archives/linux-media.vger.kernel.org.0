Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2EC52C88ED
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 17:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgK3QFa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 11:05:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgK3QFa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 11:05:30 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B450C0613CF;
        Mon, 30 Nov 2020 08:04:44 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id q3so2602183pgr.3;
        Mon, 30 Nov 2020 08:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UQsjhaNGvYEpQK+gKKtNDCsa3f0WL2bayeZnJZyvfhs=;
        b=gxV1d0QnJ9Ci04Ez4KIVs3V7rncnhcNMT+nFA7VdsYgRvPQMtE2Qlo1J38sVnqW3Ox
         hB4DG9OR1Ejq2nAwLYMFBhBUbrJ9maxAAtlMaOktMRDU/zw8BYKsKeVnzF2SiUDvVDkO
         TK03oky1j48u4c3CFscMlue6zY6gj4Lc7um2AwlYK/PP1CZzUw9zuiiuCO/0ahxRTO8v
         N2LUKE6MKyYUSUhuMaRdFlNfBY0uoRwoez/7smOg6fbJoI8tFp0LJxWon8spmjFh/sEZ
         3khTUdhKCo2VXrdmjUm5tAId2TnGHTe0zKnkgWlbGAYFjy5p7bQPbzGwedVUFJMpnuRE
         +PGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UQsjhaNGvYEpQK+gKKtNDCsa3f0WL2bayeZnJZyvfhs=;
        b=NSvhVUi6MyTcz3r2PxditDzVrpwzVuUz6TthFIXv7yUGi2HWRsRWwHnkSU/Qakj3uU
         +nvK3QI3aNTJRxgBySSq79BzuIJYTuOfYOYe2hER0ASzIiMligF8IX2d/2MYfY/Bljdp
         H9VyTCprfYMtXa0hQNmvphtnvEhA2J+aXDUG/cP6khuHgY1Nhk8jED2fmqJG5wrpGlxd
         KmUSbRQNAOjGPOM4wqGgIXBsDBvd/GLet8IPmQgbU0xgvrZFZk+52RHQdFX6TbiDjAiI
         2oHhO13KspgxpCMY7HwliwDZdy5S+GQ7LphcgcdTntAPY93NJ4iTzxHfr35bauxZsdfk
         Zdnw==
X-Gm-Message-State: AOAM531uGW9OlAvEhCDSWIESYLlJaRYJQZsT5XmRf7JI8/ZOqzr9iuRh
        4I+1Q5UKaNrVZAGTix+D1GfM6fhn2Ur8hKQM8qs=
X-Google-Smtp-Source: ABdhPJwYhaL2yjYJcKeXMFOmsdvo8I6OnXQUjuW5FZ8DN+ZvlxIAEnCk9uL2C4ihHqMvoQPWm8RpjcthH9S/bWimgLk=
X-Received: by 2002:a63:784:: with SMTP id 126mr18565452pgh.215.1606752283819;
 Mon, 30 Nov 2020 08:04:43 -0800 (PST)
MIME-Version: 1.0
References: <d0ac1a26ed5943127cb0156148735f5f52a07075.1606459576.git.mchehab+huawei@kernel.org>
 <CA+FuTSenOoVxM6W9viwXQmPHo_MEoQzQ=GPxJi72fYGHHmqmwA@mail.gmail.com> <20201130104420.321531ec@coco.lan>
In-Reply-To: <20201130104420.321531ec@coco.lan>
From:   VDRU VDRU <user.vdr@gmail.com>
Date:   Mon, 30 Nov 2020 08:04:31 -0800
Message-ID: <CAA7C2qiOAZR+QwY5Bs-UHQzBEfA15gMG-GjriqNo3Q5biY4+ZQ@mail.gmail.com>
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

I have hardware that uses this driver and can conduct a test if it
will help resolve any confusion/assumption. I'd also like to suggest
that making changes to drivers with no means of testing those changes
is bad. This has happened in the past and resulted in unnecessarily
breaking drivers for those who use it. No patch should be merged
without testing!

Best regards,
Derek

On Mon, Nov 30, 2020 at 1:48 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Fri, 27 Nov 2020 09:20:53 -0500
> Willem de Bruijn <willemdebruijn.kernel@gmail.com> escreveu:
>
> > On Fri, Nov 27, 2020 at 1:46 AM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > As reported on:
> > >         https://lore.kernel.org/linux-media/20190627222020.45909-1-willemdebruijn.kernel@gmail.com/
> > >
> > > if gp8psk_usb_in_op() returns an error, the status var is not
> > > initialized. Yet, this var is used later on, in order to
> > > identify:
> > >         - if the device was already started;
> > >         - if firmware has loaded;
> > >         - if the LNBf was powered on.
> > >
> > > Using status = 0 seems to ensure that everything will be
> > > properly powered up.
> > >
> > > So, instead of the proposed solution, let's just set
> > > status = 0.
> > >
> > > Reported-by: syzbot <syzkaller@googlegroups.com>
> > > Reported-by: Willem de Bruijn <willemb@google.com>
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  drivers/media/usb/dvb-usb/gp8psk.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/dvb-usb/gp8psk.c b/drivers/media/usb/dvb-usb/gp8psk.c
> > > index c07f46f5176e..b4f661bb5648 100644
> > > --- a/drivers/media/usb/dvb-usb/gp8psk.c
> > > +++ b/drivers/media/usb/dvb-usb/gp8psk.c
> > > @@ -182,7 +182,7 @@ static int gp8psk_load_bcm4500fw(struct dvb_usb_device *d)
> > >
> > >  static int gp8psk_power_ctrl(struct dvb_usb_device *d, int onoff)
> > >  {
> > > -       u8 status, buf;
> > > +       u8 status = 0, buf;
> > >         int gp_product_id = le16_to_cpu(d->udev->descriptor.idProduct);
> > >
> > >         if (onoff) {
> > > --
> > > 2.28.0
> >
> >
> > Is it okay to ignore the return value of gp8psk_usb_in_op here?
>
>
> Well, I don't have this specific hardware in my hands, but, if you
> follow the logic there, it sounds ok to ignore.
>
> It should be noticed that, on some devices, some I2C commands
> will only return after having the device powered up and its
> firmware loaded. As this code is at the powerup part of the code,
> it sound reasonable to assume that the I2C read might fail.
>
> So, this change is less aggressive than just returning, as
> the driver may be relying on a fail read already.
>
> ---
>
> If you follow the logic of this routine, a fail to read means
> that the hardware is not able to return to this specific
> I2C command, either because it was physically (or logically)
> removed or because it was not properly powered up.
>
> If it was removed, trying to send I2C commands to
> power it up will return errors, so the first attempt of
> writing data to it will return an error.
>
> If, on the other hand, the hardware was not properly powered up,
> status = 0 will mean that all parts of the chipset should
> be powered on.
>
> As this is the only place at the driver where a read is
> not checked for its success, I'm assuming that this is the
> original intent of the driver's author.
>
> Thanks,
> Mauro
