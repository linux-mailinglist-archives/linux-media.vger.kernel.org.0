Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 632F839D0F0
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 21:18:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbhFFTUp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Jun 2021 15:20:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:38294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229573AbhFFTUn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 6 Jun 2021 15:20:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F15E60232;
        Sun,  6 Jun 2021 19:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623007133;
        bh=/D+IR47IrSMSXdl86CkyyMPfc5npK6C8DBwM065jIn0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=f1IdmscIpVDTe9suFoxriGC+pN+Z66CyKUJPloYl3sXfff9Di5PVav8+zJqOemqnS
         ExjtLeor6tWmdLK2Gex9yxUmjXfs7zwHHtQMCFNr9K4sWE+7MjH/uXXZbjoHw8Vp9K
         0ouZk7VBVsn66Rac1XxUEa5AvSeZF2veGkCvBD/SQeDUyO4BP7byAepH8Ydwc40SKH
         EFys2NF26SYXLWGerJrpmZVmHCKU/l62PLhZhADqN+FVEk65VARKmtcAWfJ1jMcY8F
         cv+4VrvnJZM/ZLzrriSdoJUjzt86anuzkEV5xQ50PUfKGuUSTHFF7p066O+xT1UUN6
         OaAYLJ7QIi2NQ==
Date:   Sun, 6 Jun 2021 21:18:49 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Seongyong Park <euphoriccatface@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: Re: [PATCH 1/2] media: video-i2c: frame delay based on last frame's
 end time
Message-ID: <20210606211849.70366d0d@coco.lan>
In-Reply-To: <CAJp=mWTwRePsk6ACr7Jc1uDOwNe60hVAyneh3VFU_LYii6M=Bw@mail.gmail.com>
References: <20210605115456.14440-1-euphoriccatface@gmail.com>
        <20210605115456.14440-2-euphoriccatface@gmail.com>
        <20210605160028.6ec30b8a@coco.lan>
        <20210605165335.26313de9@coco.lan>
        <CAJp=mWRihf_AiLXojoeeY6JTqA=-mD11+aWZToRcw2ozWoB5zw@mail.gmail.com>
        <20210606130043.382d3450@coco.lan>
        <CAJp=mWTwRePsk6ACr7Jc1uDOwNe60hVAyneh3VFU_LYii6M=Bw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 7 Jun 2021 00:06:36 +0900
Seongyong Park <euphoriccatface@gmail.com> escreveu:

> `2021=EB=85=84 6=EC=9B=94 6=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 8:00,=
 Mauro Carvalho Chehab <mchehab@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> >
> >
> > Perhaps something like this would work better, keeping a more precise
> > average fps rate:
> >
> >         next_jiffies =3D jiffies + delay;
> >         do {
> > ...
> >                 schedule_delay_us =3D jiffies_to_usecs(next_jiffies - j=
iffies);
> >                 usleep_range(schedule_delay_us * 3/4, schedule_delay_us=
);               ...
> >                 next_jiffies +=3D delay;
> >         }
> > =20
> > >
> > > I'll send another patchset if it doesn't look too bad.
> > >
> > > Thank you very much.
> > > Seongyong Park =20
> >
> >
> >
> > Thanks,
> > Mauro =20
>=20
> For a few hours, I couldn't get the module to make precise timing.
> It would always be a few tenths of FPS higher than I set, regardless
> of how I construct the calculation.
> And then it hit me, maybe jiffies is not granular enough - and of
> course, resolution of jiffies turns out to be 100Hz :P

It is actually worse than that, as it depends on CONFIG_HZ, which is
set by the one who built the Kernel. So, on other machines, it could
be higher (like 1200) or lower (24 is one of the options on mips) ;-)

> e.g. If you set it 16FPS, the count of jiffies to sleep results 100 / 16 =
=3D 6
> The sleep interval ends up being 60ms, resulting in 16.666... FPS.

That's basically why I suggested you to count the time from the start
of streaming, instead of just waiting for a fixed delay every time.

> This discrepancy gets quite big if you set it to 64 FPS, resulting in
> a single jiffies count, i.e. 100Hz.
> (Though you will need to either skip some data, or set I2C baud rate
> beyond the sensor's spec
> in order to realistically even achieve 64 FPS, at least on an RPi Zero
> it seems.)

The issue is probably not RPi zero, but the low speeds of I2C bus,
and the speed of the sensor.=20

> So, I basically changed the time source from `jiffies` to
> `ktime_to_us(ktime_get())`.
> The timing is definitely better now :)

This helps but it probably use a lot more CPU cycles than reading
jiffies.

> One last question please, before creating another patchset.
> >                 usleep_range(schedule_delay_us * 3/4, schedule_delay_us=
); =20
> Is it okay to make it essentially 0 microseconds sleep here, by
> setting `schedule_delay_us` to 0?
> It's going to be like,
> ```
> if (current_us > end_us) {
>     end_us =3D current_us;
> }
> schedule_delay_us =3D end_us - current_us;
> ```

Not sure, but you could instead revert the logic, like:

if (current_us <=3D end_us)
	usleep_range();

Thanks,
Mauro
