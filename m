Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41FE3F6F86
	for <lists+linux-media@lfdr.de>; Wed, 25 Aug 2021 08:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238897AbhHYGeC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Aug 2021 02:34:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:58202 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237102AbhHYGeB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Aug 2021 02:34:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BBBD961245;
        Wed, 25 Aug 2021 06:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629873195;
        bh=8nUxXjK+Nf8pu/MbCW5HdPdSgz67sIv3Sj1bynaf/Tk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=o5vyHmc8ZfxLZN3Tqb+wkLCA7p7rFAC0srKpFlzh1SDdRmlD2QJMnwh8l0NtnwDjG
         RyaRYxI1CaR2Sik5wdjvXRX6WGaBzS/tUo7GxPXGIfRmdssQ0gYc7+Q5KUa7klsGyU
         boutA43YWqM9AP1O/+daTD1AuBLyHgduSBW8UApTcRB/khk/fc2wp0jZQsDEq8n3YP
         3m9tRk8rxKILKjTb+2oIw9QpUqKiZtPEvK5vR4yUwI0kQXLvtXIcSzZZ2EdrGdot7N
         Ox2evOp0buW5C9WIySnO74sNrNgPZHpHu6rpgKeIM+Z0zcTl14OH8kbv79Oe2MXFjW
         HsogwotANZAig==
Date:   Wed, 25 Aug 2021 08:33:05 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Manu Abraham <abraham.manu@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Soeren Moch <smoch@web.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [Regression 5.14] media: dvb userspace api
Message-ID: <20210825083305.562eba48@coco.lan>
In-Reply-To: <CAHFNz9L29LK+L8LjqyTyqq3LsvzeA6iYFHwP9n3uNBbqbbm1bg@mail.gmail.com>
References: <4e3e0d40-df4a-94f8-7c2d-85010b0873c4@web.de>
        <20210819133128.45ef4353@coco.lan>
        <c56ec571-2278-95e9-2028-990e03159c3f@web.de>
        <20210822194709.4b9d33d4@coco.lan>
        <be6ac929-2443-ff55-3e11-6a86d6472e0e@web.de>
        <CAHk-=wjSadWPfzQ_hOqbjq6c_xwJs8GLHTyznhXRvDF5Yrs4FA@mail.gmail.com>
        <CAHFNz9L29LK+L8LjqyTyqq3LsvzeA6iYFHwP9n3uNBbqbbm1bg@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 25 Aug 2021 08:25:57 +0530
Manu Abraham <abraham.manu@gmail.com> escreveu:

> On Mon, Aug 23, 2021 at 10:30 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > I have reverted the header file move. But I would also heartily
> > recommend that whatever user program includes those headers (VDR -
> > anything else?) should take snapshots of these specific kernel
> > headers.
> >
> > I'm not convinced that it makes sense to move the av7110 driver back
> > from staging - it may continue to work, but it _is_ old and there is
> > no maintenance - and I would certainly suggest that any other
> > out-of-tree driver that uses these old interfaces that nothing else
> > implements shouldn't do so, considering that nothing else implements
> > them. =20
>=20
> Sorry for barging in between your discussion, but it seemed like you real=
ly
> missed some perspective and hence.
>=20
> My 2 cents worth:
> * Revert the header changes.
>=20
> * Let someone else with knowledge of it take over the maintenance
> of the av7110 driver.
>=20
>   - This would allow other hardware also to be easily accommodated
> in a similar manner.
>=20
> * Pull the out of tree drivers and allocate maintenance of those, to
> someone who understands them. Don't you want more hardware to be
> supported out of the box ?
>=20
> Should there be no driver for those DVB output hardware, but only for
> V4L2 output devices ?
>=20
> There exists other hardware which As a person who worked on another
> av7110 like driver (saa716x based s2 6400), which I can confirm.
> The API is supposed to simplify life, not make it even more complex.
> These devices would need lot of workarounds to work with the API that
> which Mauro advocates, which might even break those drivers given
> their complexity and size.
>=20
> It would make life a lot easier for the users, Mauro himself and
> this long never ending discussion can be put to rest.

The "full-featured" API that it is implemented on av7110 always had=20
troubles. This is not only my view, but also the view of the
original API authors,as can be seen at the DVBv4 WIP documentation:

	https://www.linuxtv.org/downloads/legacy/linux-dvb-api-v4/linux-dvb-api-v4=
-0-3.pdf

It clearly says that, on chapter 2.2:

	"2.2 Linux DVB API Version 3 problems

	...

	 The Linux DVB API Version 3 has very limited support for
	 modern hardware."

The "modern" there refers to hardware back in 2005!

I worked on a project back 8 years ago that tried to use it for TV
sets. It didn't work, because the API assumed a 1:1 mapping between
tuners and A/V codecs, which works for simpler embedded hardware,
but didn't cover smart TV hardware, where the number of frontends,
demods and A/V codecs were different. You may even have multiple
channels being displayed at the same time (Picture in Picture).

On today's embedded hardware, you need something like the media
controller, in order to dynamically re-configure the hardware=20
pipelines between:

	- multiple tuners (DVB-C, DVB-T/T2, DVB-S/S2);
	- multiple demods[1];
	- multiple A/V decoders;
	- display compositor;
	- audio I/O;
	- CA modules;
	- encrypt/decrypt hardware (required on some Countries in order
          to allow recording programs on storage);=20
	- storage.

[1] There are even some demods that can dynamically change the
    maximum number of PIDs it can filter. Modern hardware can
    have, let's say, a max of 4 input MPEG-TS, and a max of=20
    512 filters, which works like 4 independent demods, where
    the number of filters per demod is adjusted dynamically.
    This is currently problem for DVB subsystem, as it allocates
    statically the PID filters for the max number of PIDs, meaning
    that a large amount of RAM would be wasted if one would reserve
    space for the maximum possible capacity per demod (it would
    require space for 4x512 buffers on such hardware, meaning that
    3/4 of buffer memory would be wasted).

As I always said, I'm open to discuss an API that would properly
address what's needed, but such API should support modern embedded=20
hardware, and should be designed to allow it to be extended to
support to future needs. That's not the case of the DVBv3 "full-feat"
API, which was developed to support a hardware component developed
more than 23 years ago[2].

[2] The Rev 3.1 datasheet of av7110 was written in June, 1998:

    https://pdf1.alldatasheet.com/datasheet-pdf/view/130554/TI/TMS320AV7110=
.html

-

=46rom driver's perspective, it makes no sense to keep support for av7110,=20
as TI stopped production of TMS320AV7110 a very long time ago. They
don't even mention this product number anymore on their website.

Thanks,
Mauro
