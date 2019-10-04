Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE36ACBCCE
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 16:16:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388780AbfJDOQQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 10:16:16 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56956 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388625AbfJDOQQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 10:16:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=K76rJjsu5T7wRFe+vxEucJGUKWukcF9Mf7Z+aHg/kGY=; b=Znj5r4fbqgACzD42wqy8FZid8
        uKoOt2+rsNU8KbfIVn6n3B6XEunKgI2VaurTbovQmtDzMI/gKLhEL22etJ/mJJdZVbrvGFX8y+ir+
        6a23ww7Vds3AwyGlMx2DskKBj4RuIwE7egCSQavobzgA/zOn7MkG7BxFn1/cYuZBIzrOH4AibkSy+
        UIDWxARxyA/EP5c1jGCDQSv7vKY81zDbRxutdTb1lOEwv88X66AW1ucb1Qpf20os389gTxTfr6Auk
        ssJm6kpWBA9ng+PlxFWWx/BB3Q7jSXyfrt8Ue/k9r/tPJdOkks6TEC/EFFMghApjuPD+hSFogq/86
        QP4LOCpcw==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iGONQ-0008T8-Pb; Fri, 04 Oct 2019 14:16:13 +0000
Date:   Fri, 4 Oct 2019 11:16:08 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     JP <jp@jpvw.nl>
Cc:     Gonsolo <gonsolo@gmail.com>, crope@iki.fi,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] si2157: Add support for Logilink VG0022A.
Message-ID: <20191004111608.74fdf94a@coco.lan>
In-Reply-To: <4c7ed533-55dc-534d-7fc0-0acc766daa27@jpvw.nl>
References: <29ab2e43-4374-a3ea-6ae1-a4267867eaa4@jpvw.nl>
        <20191002154922.7f1cfc76@coco.lan>
        <CANL0fFRJZBfEDWK_c2w1TomvB5-i4g09LopyJUbO5NtOwKdDTg@mail.gmail.com>
        <20191003080539.2b13c03b@coco.lan>
        <CANL0fFSmvEEJhnA=qjTuEPr4N8q8eWLeYC5du+OoTMxe1Gnh5Q@mail.gmail.com>
        <20191003120238.75811da6@coco.lan>
        <20191003160336.GA5125@Limone>
        <20191003130909.01d29b77@coco.lan>
        <20191003162326.GA2727@Limone>
        <20191003144225.0137bf6c@coco.lan>
        <20191003183200.GA2631@Limone>
        <e468b867-1b45-8220-a5d2-ac40fdb4e0e6@jpvw.nl>
        <CANL0fFQms9oyec_1UevbJ7aLp+KNJ3h6UhGEbqrnCNO286rbGg@mail.gmail.com>
        <20191003163914.7c384d36@coco.lan>
        <20191003164426.6da8538f@coco.lan>
        <CANL0fFRSNbUhcik7rnhjZ0qUe-tZyzcjY+M1J_iGzUa5jNc9_A@mail.gmail.com>
        <20191003170329.3624f7f2@coco.lan>
        <23d9856c-cc12-7212-9126-90d80f67abfb@jpvw.nl>
        <20191004090855.14e418ed@coco.lan>
        <4c7ed533-55dc-534d-7fc0-0acc766daa27@jpvw.nl>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Fri, 4 Oct 2019 15:50:18 +0200
JP <jp@jpvw.nl> escreveu:

> On 10/4/19 2:08 PM, Mauro Carvalho Chehab wrote:
> > Em Fri, 4 Oct 2019 13:50:43 +0200
> > JP <jp@jpvw.nl> escreveu:
> > =20
> >> On 10/3/19 10:03 PM, Mauro Carvalho Chehab wrote: =20
> >>> Em Thu, 3 Oct 2019 21:51:35 +0200
> >>> Gonsolo <gonsolo@gmail.com> escreveu:
> >>>    =20
> >>>>> 1) The firmware file is likely at the Windows driver for this device
> >>>>> (probably using a different format). It should be possible to get
> >>>>> it from there. =20
> >>>> If you tell me how I'm willing to do this. :) =20
> >>> I don't know. I was not the one that extracted the firmware. I guess
> >>> Antti did it.
> >>>
> >>> I suspect that there are some comments about that in the past at the
> >>> ML. seek at lore.kernel.org.
> >>>    =20
> >>>>> 2) Another possibility would be to add a way to tell the si2168 dri=
ver
> >>>>> to not try to load a firmware, using the original one. That would
> >>>>> require adding a field at si2168_config to allow signalizing to it
> >>>>> that it should not try to load a firmware file, and add a quirk at
> >>>>> the af9035 that would set such flag for Logilink VG0022A. =20
> >>>> I don't get this. Which firmware, si2168 or si2157? =20
> >>> The one that it is causing the problem. If I understood well, the
> >>> culprit was the si2168 firmware.
> >>>    =20
> >>>> I'm still for option 3: If there is a bogus chip revision number it's
> >>>> likely the VG0022A and we can safely set fw to NULL, in which case
> >>>> everything works.
> >>>> All already working devices will continue to work as before.
> >>>> With a low probability there are other devices that will return 0xff=
ff
> >>>> but a) they didn't work until now and b) they receive a clear message
> >>>> that they return bogus numbers and this works just for the VG0022A, =
in
> >>>> which case this hardware can be tested.
> >>>> At last, *my* VG0022A will work without a custom kernel which I'm a
> >>>> big fan of. :))
> >>>>
> >>>> Are there any counterarguments except that it is not the cleanest
> >>>> solution in the universe? ;) =20
> >>> That's a really bad solution. Returning 0xff is what happens when
> >>> things go wrong during I2C transfers. Several problems can cause it,
> >>> including device misfunction. Every time someone comes with a patch
> >>> trying to ignore it, things go sideways for other devices (existing
> >>> or future ones).
> >>>
> >>> Ignoring errors is always a bad idea. =20
> >> add module param say 'gonso_hack_vg0022a'
> >> if true, act on error by setting a flag
> >> if this flag is set don't load firmware =20
> > Adding a module param should be the last resort, only when there's
> > no way for the driver to autodetect. =20
> Remember the guy reported the hw fix? Could be that
> only some receiver units are affected. Therefore=C2=A0 the
> module param.
>=20
> The hw fix was original 4k7 and 10k added. That looks
> like 3k3 total and all 3 chips on the bus work. 10k per
> chip. Now Gon reported that said bus works with 2 chips
> active on a faulty device with 4k7 resistor, which is 2
> times 10k. It looks same hw error to me.

I'm not so sure. From the reports from Gonsolo, in the case of=20
this specific issue with VG0022A, the device is not unstable. It is=20
just that it works fine with the vendor-provided firmware, while it=20
breaks with the new one.

We don't know that the same thing would happen with the original
reported bug. The only way to be sure would be to obtain the same
hardware from the original post and test it to check if the device
has issues without replacing the resistor.

Even the original reporter can't help, as his device was modified,
and the issue won't be there anymore.

Btw, if we end by noticing this bug happening on other it931x
device models, we could simply disable firmware load for all of them,
but we need more tests and reports before changing the behavior for
other models, as older firmwares may have other problems.

> > Making af9035 to detect vg0022a is quite simple.
> >
> > Considering this device's entry:
> >
> > 	{ DVB_USB_DEVICE(USB_VID_DEXATEK, 0x0100,
> > 		&it930x_props, "Logilink VG0022A", NULL) },
> >
> > the check, at af9035 would be:
> >
> > 	if (le16_to_cpu(d->udev->descriptor.idVendor) =3D=3D USB_VID_DEXATEK &&
> > 	    le16_to_cpu(d->udev->descriptor.idProduct) =3D=3D 0x0100)
> > 		/* do something to disable firmware load */
> >
> > So, no need to add any load time parameter.
> >
> > It should be noticed that a change just at af9035 won't work, as the
> > firmware is updated by si2168 driver. So, the caller code needs to
> > pass a config parameter to si2168 driver. =20

> If it is a failing pull-up resistor on only some individual receiver
> units, this seems overkill to me. In my proposal I did not realized
> this change in the demod driver was needed.

Agreed, but we have no means to know that until someone buys other
units of the VG0022A and do tests with and without the patch.

Thanks,
Mauro
