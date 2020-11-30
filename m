Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F852C814C
	for <lists+linux-media@lfdr.de>; Mon, 30 Nov 2020 10:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgK3JpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Nov 2020 04:45:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:54648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725972AbgK3JpG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Nov 2020 04:45:06 -0500
Received: from coco.lan (ip5f5ad5b3.dynamic.kabel-deutschland.de [95.90.213.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7925020809;
        Mon, 30 Nov 2020 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606729465;
        bh=yB55frgZs6cTDNzWFHRr6G9akT3+WYu/zA7dYKpAh10=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Itxz+yl5mLeHTBFE9VzNhtyri/edN22LDBjk0eg5SMwzTJZyxGAe3kR9cikLp7Kq6
         WEWq4oQeJbn1xpoWR8sC9TJjPckXdVcX+FDqums+zth4qUvY+2QmA49y113aj5rAQO
         AfSmIT/cgJeDfIPIrMxHuZOPIntpvk0R9uvm7fv4=
Date:   Mon, 30 Nov 2020 10:44:20 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        syzbot <syzkaller@googlegroups.com>
Subject: Re: [PATCH] media: gp8psk: initialize stats at power control logic
Message-ID: <20201130104420.321531ec@coco.lan>
In-Reply-To: <CA+FuTSenOoVxM6W9viwXQmPHo_MEoQzQ=GPxJi72fYGHHmqmwA@mail.gmail.com>
References: <d0ac1a26ed5943127cb0156148735f5f52a07075.1606459576.git.mchehab+huawei@kernel.org>
        <CA+FuTSenOoVxM6W9viwXQmPHo_MEoQzQ=GPxJi72fYGHHmqmwA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 27 Nov 2020 09:20:53 -0500
Willem de Bruijn <willemdebruijn.kernel@gmail.com> escreveu:

> On Fri, Nov 27, 2020 at 1:46 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > As reported on:
> >         https://lore.kernel.org/linux-media/20190627222020.45909-1-willemdebruijn.kernel@gmail.com/
> >
> > if gp8psk_usb_in_op() returns an error, the status var is not
> > initialized. Yet, this var is used later on, in order to
> > identify:
> >         - if the device was already started;
> >         - if firmware has loaded;
> >         - if the LNBf was powered on.
> >
> > Using status = 0 seems to ensure that everything will be
> > properly powered up.
> >
> > So, instead of the proposed solution, let's just set
> > status = 0.
> >
> > Reported-by: syzbot <syzkaller@googlegroups.com>
> > Reported-by: Willem de Bruijn <willemb@google.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/media/usb/dvb-usb/gp8psk.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/usb/dvb-usb/gp8psk.c b/drivers/media/usb/dvb-usb/gp8psk.c
> > index c07f46f5176e..b4f661bb5648 100644
> > --- a/drivers/media/usb/dvb-usb/gp8psk.c
> > +++ b/drivers/media/usb/dvb-usb/gp8psk.c
> > @@ -182,7 +182,7 @@ static int gp8psk_load_bcm4500fw(struct dvb_usb_device *d)
> >
> >  static int gp8psk_power_ctrl(struct dvb_usb_device *d, int onoff)
> >  {
> > -       u8 status, buf;
> > +       u8 status = 0, buf;
> >         int gp_product_id = le16_to_cpu(d->udev->descriptor.idProduct);
> >
> >         if (onoff) {
> > --
> > 2.28.0  
> 
> 
> Is it okay to ignore the return value of gp8psk_usb_in_op here?


Well, I don't have this specific hardware in my hands, but, if you
follow the logic there, it sounds ok to ignore.

It should be noticed that, on some devices, some I2C commands
will only return after having the device powered up and its
firmware loaded. As this code is at the powerup part of the code,
it sound reasonable to assume that the I2C read might fail.

So, this change is less aggressive than just returning, as
the driver may be relying on a fail read already.

---

If you follow the logic of this routine, a fail to read means 
that the hardware is not able to return to this specific
I2C command, either because it was physically (or logically)
removed or because it was not properly powered up.

If it was removed, trying to send I2C commands to
power it up will return errors, so the first attempt of
writing data to it will return an error.

If, on the other hand, the hardware was not properly powered up,
status = 0 will mean that all parts of the chipset should
be powered on. 

As this is the only place at the driver where a read is
not checked for its success, I'm assuming that this is the
original intent of the driver's author.

Thanks,
Mauro
