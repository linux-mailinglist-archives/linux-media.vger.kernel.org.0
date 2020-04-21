Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56EDB1B2233
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 11:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728314AbgDUJAP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Apr 2020 05:00:15 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:33825 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbgDUJAO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Apr 2020 05:00:14 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E8C7AE0015;
        Tue, 21 Apr 2020 09:00:06 +0000 (UTC)
Date:   Tue, 21 Apr 2020 11:00:05 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH] media: cedrus: Implement runtime PM
Message-ID: <20200421090005.GB610776@aptenodytes>
References: <20200408010232.48432-1-samuel@sholland.org>
 <5590139.lOV4Wx5bFT@jernej-laptop>
 <20200420175651.GA610776@aptenodytes>
 <4523224.GXAFRqVoOG@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="hQiwHBbRI9kgIhsi"
Content-Disposition: inline
In-Reply-To: <4523224.GXAFRqVoOG@jernej-laptop>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--hQiwHBbRI9kgIhsi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 20 Apr 20, 20:09, Jernej =C5=A0krabec wrote:
> Hi!
>=20
> Dne ponedeljek, 20. april 2020 ob 19:56:51 CEST je Paul Kocialkowski=20
> napisal(a):
> > Hi Jernej,
> >=20
> > On Mon 20 Apr 20, 18:41, Jernej =C5=A0krabec wrote:
> > > Dne ponedeljek, 20. april 2020 ob 17:10:10 CEST je Paul Kocialkowski
> > >=20
> > > napisal(a):
> > > > Hi,
> > > >=20
> > > > On Sun 19 Apr 20, 15:28, Samuel Holland wrote:
> > > > > On 4/8/20 11:01 AM, Jernej =C5=A0krabec wrote:
> > > > > > Hi Samuel!
> > > > > >=20
> > > > > > Dne sreda, 08. april 2020 ob 03:02:32 CEST je Samuel Holland=20
> napisal(a):
> > > > > >> This allows the VE clocks and PLL_VE to be disabled most of the
> > > > > >> time.
> > > > > >>=20
> > > > > >> Since the device is stateless, each frame gets a separate runt=
ime
> > > > > >> PM
> > > > > >> reference. Enable autosuspend so the PM callbacks are not run
> > > > > >> before
> > > > > >> and
> > > > > >> after every frame.
> > > > > >>=20
> > > > > >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> > > > > >> ---
> > > > > >>=20
> > > > > >> I tested this with v4l2-request-test. I don't have the setup t=
o do
> > > > > >> anything more complicated at the moment.
> > > > > >>=20
> > > > > >> ---
> > > > > >>=20
> > > > > >>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   7 ++
> > > > > >>  .../staging/media/sunxi/cedrus/cedrus_hw.c    | 115
> > > > > >>  ++++++++++++------
> > > > > >>  .../staging/media/sunxi/cedrus/cedrus_hw.h    |   3 +
> > > > > >>  3 files changed, 88 insertions(+), 37 deletions(-)
> > > > >=20
> > > > > [snip]
> > > > >=20
> > > > > > Reset above causes problem. When format is set in
> > > > > > cedrus_s_fmt_vid_cap()
> > > > > > a
> > > > > > function is called, which sets few registers in HW. Of course, =
there
> > > > > > is
> > > > > > no
> > > > > > guarantee that someone will start decoding immediately after ca=
pture
> > > > > > format is set. So, if the driver puts VPU to sleep in the mean =
time,
> > > > > > reset will clear those registers and decoded video will be in
> > > > > > different
> > > > > > format than expected. It could be even argued that registers sh=
ould
> > > > > > not
> > > > > > be set in that function and that this is design issue or bug in
> > > > > > driver.
> > > > >=20
> > > > > You're right. I didn't see that cedrus_dst_format_set() was called
> > > > > outside
> > > > > cedrus_engine_enable/disable().
> > > >=20
> > > > This might indeed be an issue with multiple decoding contexts in
> > > > parallel,
> > > > with potentially different formats. For that reason, it looks like =
the
> > > > right thing to do would be to set the format at each decoding run b=
ased
> > > > on
> > > > the format set in the context by s_fmt.
> > >=20
> > > So you are suggesting that cedrus_dst_format_set() should be moved to
> > > cedrus_device_run(), right? This way all registers are set at each ru=
n,
> > > which is then truly stateless.
> >=20
> > Yes, exactly! But this is outside of the scope of this series though.
>=20
> I'm not sure about being out of scope. It has to be moved anyway, so why =
not=20
> put it in best place?

I agree it should be moved to cedrus_device_run, for sure!

What I meant is that Samuel doesn't have to make that change with the runti=
me PM
patch series because it's a different issue. But reading the discussion aga=
in,
it's true that there is a chance of the VPU going to sleep between set fmt =
and
start streaming, so we should probably take care of it before merging runti=
me
PM.

Samuel, do you feel like making that change with your series?
I can do it otherwise.

Cheers,

Paul

> Best
>=20
> >=20
> > Cheers,
> >=20
> > Paul
> >=20
> > > Best regards,
> > > Jernej
> > >=20
> > > > > > Anyway, I made a runtime PM support long time ago, but never do
> > > > > > anything
> > > > > > besides running few tests:
> > > > > > https://github.com/jernejsk/linux-1/commit/
> > > > > > d245b7fa2a26e519ff675a255c45230575a4a848
> > > > > >=20
> > > > > > It takes a bit different approach. Power is enabled in start
> > > > > > streaming
> > > > > > and
> > > > > > disabled in stop streaming. This is simpler approach and doesn't
> > > > > > need
> > > > > > autosuspend functionality. I also moved call to a function which
> > > > > > sets
> > > > > > format in HW registers to start streaming handler, so it's
> > > > > > guaranteed
> > > > > > to be set at the beginning.
> > > > >=20
> > > > > Assuming cedrus_device_run() only gets called between streamon and
> > > > > streamoff (which appears to be the case), this looks like a better
> > > > > design.
> > > >=20
> > > > Yes, this is defintiely ensured by the V4L2 framework. I agree that
> > > > streamon/off are the correct sync points.
> > > >=20
> > > > > > Note that some registers are only set in start streaming handle=
r.
> > > > > > With
> > > > > > your
> > > > > > approach, if first frame is submitted too late, asserting and
> > > > > > de-asserting
> > > > > > reset line could reset those registers.
> > > > >=20
> > > > > I only see registers being set in cedrus_start_streaming() after =
your
> > > > > patch, where you add a call to cedrus_dst_format_set(). I can't f=
ind
> > > > > any
> > > > > registers being written in any of the ->start() callbacks.
> > > > >=20
> > > > > I'll send a v2 which combines the two patches: yours which handle=
s the
> > > > > runtime part better, and mine which handles the probe/remove part
> > > > > better
> > > > > with !CONFIG_PM.
> > > >=20
> > > > Thanks, that should do it!
> > > >=20
> > > > Cheers,
> > > >=20
> > > > Paul
>=20
>=20
>=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--hQiwHBbRI9kgIhsi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6ethUACgkQ3cLmz3+f
v9Ew4Qf+OsCirGHO5U3TqjH7KcY4Rjw8LUvEvxIHIlRK4ldsZb2K+JpgUM3n7e91
zMbRienlmbtTkUWbjvx+JyRauUUacyYGnVqsW1qfuvW4IDrS8gCmTEfeT3h7DZ8W
FNIadZRwiaoEH/ckVRtKV6t+1Y7xSZC0f4prZlwPy8GbZa1x7/3W8TGKEk4fAOSc
h3lsykDREA4zvlxUhyjM7sc0DHpzp91ItV+lJaeXNRCOos9li6nz0fYgQbpjS7Gf
4epH0um6o6UCctggxXX0ElrrnOL3Jk0pdJija+vjEzXwmh+jVk6eX4DrIy8ZT1aP
sPKnIi1gseYx3NaZpo0K1gI5MX1Glg==
=Wg0J
-----END PGP SIGNATURE-----

--hQiwHBbRI9kgIhsi--
