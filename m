Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC1F39CEA3
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 13:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbhFFLCh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Jun 2021 07:02:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:49294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229508AbhFFLCg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 6 Jun 2021 07:02:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B02666136E;
        Sun,  6 Jun 2021 11:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622977247;
        bh=TQvj02q/VXy+P/NegHoD5XxZGMzKI2LFBtIb1U3Smlo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aRrDinCrMzS9bE8DZwEzqQPHjNbEyBnTIdEO3mbeBF/Rlp3ytoPx2AMEh7wPpd0OI
         biPsI+XULb0LPVPKcpJ37uYUw2wel0d3KDyQ3iB9nPpEMrr0nSiLQ4H9vYDiwNDDHQ
         /ZzJ2lrJh0pgJCTUoDITOFyfnPurQuqxRaVYm7KSIIuPqB6eiYsQAGdfF9d9yTHmjm
         zeD/hhakt3XAsIpt7jG9I8l4bmJXCyFTWPlNA6Hm4NPh2J7gVx2yySY8VpaevV/mei
         rXvp9uBVgXJJmLU4dtojTmr9eJnbzmcxOBCQvoTBhIsUoKshEUdJfEcGyTA7ODoNmm
         Na8qCnDbMfYCQ==
Date:   Sun, 6 Jun 2021 13:00:43 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Seongyong Park <euphoriccatface@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: Re: [PATCH 1/2] media: video-i2c: frame delay based on last frame's
 end time
Message-ID: <20210606130043.382d3450@coco.lan>
In-Reply-To: <CAJp=mWRihf_AiLXojoeeY6JTqA=-mD11+aWZToRcw2ozWoB5zw@mail.gmail.com>
References: <20210605115456.14440-1-euphoriccatface@gmail.com>
        <20210605115456.14440-2-euphoriccatface@gmail.com>
        <20210605160028.6ec30b8a@coco.lan>
        <20210605165335.26313de9@coco.lan>
        <CAJp=mWRihf_AiLXojoeeY6JTqA=-mD11+aWZToRcw2ozWoB5zw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sun, 6 Jun 2021 16:20:53 +0900
Seongyong Park <euphoriccatface@gmail.com> escreveu:

> 2021=EB=85=84 6=EC=9B=94 5=EC=9D=BC (=ED=86=A0) =EC=98=A4=ED=9B=84 11:53,=
 Mauro Carvalho Chehab <mchehab@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
> > you would need to use:
> >
> >         usleep_range(min_delay_us, max_delay_us);
> >
> > instead of:
> >
> >         schedule_timeout_interruptible(schedule_delay);
> >
> > in order to tell the realtime clock about a dead line for
> > sleeping.
> >
> > Thanks,
> > Mauro =20
>=20
> Okay, I have tried `usleep_range()` instead, and it indeed shows
> improvement in the frame rate.
> Now it's basically the same as before my patch, except for
> `jiffies_to_usecs()` and then `usleep_range()`.
>=20
> ...
>          int schedule_delay;
> +        uint64_t schedule_delay_us;
>=20
>         try_to_freeze();
> ...
>         if (time_after(jiffies, start_jiffies + delay))
>             schedule_delay =3D delay;
>=20
> -        schedule_timeout_interruptible(schedule_delay);
> +        schedule_delay_us =3D jiffies_to_usecs(schedule_delay);
> +        usleep_range(schedule_delay_us * 3/4, schedule_delay_us);
>      } while (!kthread_should_stop());
>=20
>      return 0;
> ...
>=20
> I decided to keep the `if (...) schedule_delay =3D delay;` part.

Yeah, you would need something like that.

> The concern was that my RPi Zero was having quite a bit of constant
> drift, like showing 3FPS when set to 4FPS, 6FPS when 8FPS, 10FPS when
> 16FPS, and so on.
> Now that I've confirmed the timing's good enough (usually ~0.5 FPS
> faster than the frame rate given), there's no need for me to bother
> anymore.

In other to avoid the drift, the logic needs to calculate the delay based
on something like this (pseudo-C) code:

	start_jiffies =3D jiffies;
	frame_count =3D 0;
	i =3D 0;
	do {
		i++;
		delay =3D jiffies - (start_jiffies * i * <interval>);
...
	}

The actual logic should probably avoid multiplying stuff there, as this
could go sideways easily due to overflows.

Perhaps something like this would work better, keeping a more precise
average fps rate:

	next_jiffies =3D jiffies + delay;
	do {
...
		schedule_delay_us =3D jiffies_to_usecs(next_jiffies - jiffies);
		usleep_range(schedule_delay_us * 3/4, schedule_delay_us);		...
		next_jiffies +=3D delay;
	}

>=20
> I'll send another patchset if it doesn't look too bad.
>=20
> Thank you very much.
> Seongyong Park



Thanks,
Mauro
