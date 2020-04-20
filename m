Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D23621B0F55
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 17:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbgDTPKP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 11:10:15 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:56321 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726905AbgDTPKP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 11:10:15 -0400
X-Originating-IP: 93.29.109.196
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 94D031C0006;
        Mon, 20 Apr 2020 15:10:10 +0000 (UTC)
Date:   Mon, 20 Apr 2020 17:10:10 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH] media: cedrus: Implement runtime PM
Message-ID: <20200420151010.GL125838@aptenodytes>
References: <20200408010232.48432-1-samuel@sholland.org>
 <9673642.nUPlyArG6x@jernej-laptop>
 <244922ec-ed3a-eca7-6640-49de7ad9c605@sholland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="1hKfHPzOXWu1rh0v"
Content-Disposition: inline
In-Reply-To: <244922ec-ed3a-eca7-6640-49de7ad9c605@sholland.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--1hKfHPzOXWu1rh0v
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun 19 Apr 20, 15:28, Samuel Holland wrote:
> On 4/8/20 11:01 AM, Jernej =C5=A0krabec wrote:
> > Hi Samuel!
> >=20
> > Dne sreda, 08. april 2020 ob 03:02:32 CEST je Samuel Holland napisal(a):
> >> This allows the VE clocks and PLL_VE to be disabled most of the time.
> >>
> >> Since the device is stateless, each frame gets a separate runtime PM
> >> reference. Enable autosuspend so the PM callbacks are not run before a=
nd
> >> after every frame.
> >>
> >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> >> ---
> >>
> >> I tested this with v4l2-request-test. I don't have the setup to do
> >> anything more complicated at the moment.
> >>
> >> ---
> >>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   7 ++
> >>  .../staging/media/sunxi/cedrus/cedrus_hw.c    | 115 ++++++++++++------
> >>  .../staging/media/sunxi/cedrus/cedrus_hw.h    |   3 +
> >>  3 files changed, 88 insertions(+), 37 deletions(-)
>=20
> [snip]
>=20
> > Reset above causes problem. When format is set in cedrus_s_fmt_vid_cap(=
) a=20
> > function is called, which sets few registers in HW. Of course, there is=
 no=20
> > guarantee that someone will start decoding immediately after capture fo=
rmat is=20
> > set. So, if the driver puts VPU to sleep in the mean time, reset will c=
lear=20
> > those registers and decoded video will be in different format than expe=
cted. It=20
> > could be even argued that registers should not be set in that function =
and=20
> > that this is design issue or bug in driver.
>=20
> You're right. I didn't see that cedrus_dst_format_set() was called outside
> cedrus_engine_enable/disable().

This might indeed be an issue with multiple decoding contexts in parallel, =
with
potentially different formats. For that reason, it looks like the right thi=
ng to
do would be to set the format at each decoding run based on the format set =
in
the context by s_fmt.

> > Anyway, I made a runtime PM support long time ago, but never do anythin=
g=20
> > besides running few tests:
> > https://github.com/jernejsk/linux-1/commit/
> > d245b7fa2a26e519ff675a255c45230575a4a848
> >=20
> > It takes a bit different approach. Power is enabled in start streaming =
and=20
> > disabled in stop streaming. This is simpler approach and doesn't need=
=20
> > autosuspend functionality. I also moved call to a function which sets f=
ormat=20
> > in HW registers to start streaming handler, so it's guaranteed to be se=
t at=20
> > the beginning.
>=20
> Assuming cedrus_device_run() only gets called between streamon and stream=
off
> (which appears to be the case), this looks like a better design.

Yes, this is defintiely ensured by the V4L2 framework. I agree that streamo=
n/off
are the correct sync points.

> > Note that some registers are only set in start streaming handler. With =
your=20
> > approach, if first frame is submitted too late, asserting and de-assert=
ing=20
> > reset line could reset those registers.
>=20
> I only see registers being set in cedrus_start_streaming() after your pat=
ch,
> where you add a call to cedrus_dst_format_set(). I can't find any registe=
rs
> being written in any of the ->start() callbacks.
>=20
> I'll send a v2 which combines the two patches: yours which handles the ru=
ntime
> part better, and mine which handles the probe/remove part better with !CO=
NFIG_PM.

Thanks, that should do it!

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--1hKfHPzOXWu1rh0v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6du1IACgkQ3cLmz3+f
v9FYIAf/RIkE0bJg+MZKJgy+uiwj7BSER1drSDwD9c70d1EXUoq1TFT0eBqtU81H
wwM8uhND1u3KDdcNFcGy6OG7Q6CYPR9ne2E0ETFdyP0sJDsxjsTixZ3mLPtImLam
tTC4jsUz2fTIH/LXI9tPR2XAEB6CFPX9KL2R+pC7T03g2Hje0WygVxRh+dPy2V/y
w7rpGym9y8A9hZtaGMOREuuqkqsBHd3SpuB6xs/7yTIL9eXtcw4cpffi8GiQQ0s/
SB/QdcOp3MeT87yg5QpbkpykqwrRkM9/dbP8aU0yRbqvVyvjKMbM+qKxb8CdH3b2
H1+DLey3Po/R46r4AHmGMA2flB7c9Q==
=VY9i
-----END PGP SIGNATURE-----

--1hKfHPzOXWu1rh0v--
