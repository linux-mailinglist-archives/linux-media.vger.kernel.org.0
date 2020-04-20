Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF3A81B13AA
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 19:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726838AbgDTR44 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 13:56:56 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:35099 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbgDTR4z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 13:56:55 -0400
Received: from aptenodytes (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 65F65100006;
        Mon, 20 Apr 2020 17:56:51 +0000 (UTC)
Date:   Mon, 20 Apr 2020 19:56:51 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     Samuel Holland <samuel@sholland.org>, linux-sunxi@googlegroups.com,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [linux-sunxi] [PATCH] media: cedrus: Implement runtime PM
Message-ID: <20200420175651.GA610776@aptenodytes>
References: <20200408010232.48432-1-samuel@sholland.org>
 <244922ec-ed3a-eca7-6640-49de7ad9c605@sholland.org>
 <20200420151010.GL125838@aptenodytes>
 <5590139.lOV4Wx5bFT@jernej-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
In-Reply-To: <5590139.lOV4Wx5bFT@jernej-laptop>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jernej,

On Mon 20 Apr 20, 18:41, Jernej =C5=A0krabec wrote:
> Dne ponedeljek, 20. april 2020 ob 17:10:10 CEST je Paul Kocialkowski=20
> napisal(a):
> > Hi,
> >=20
> > On Sun 19 Apr 20, 15:28, Samuel Holland wrote:
> > > On 4/8/20 11:01 AM, Jernej =C5=A0krabec wrote:
> > > > Hi Samuel!
> > > >=20
> > > > Dne sreda, 08. april 2020 ob 03:02:32 CEST je Samuel Holland napisa=
l(a):
> > > >> This allows the VE clocks and PLL_VE to be disabled most of the ti=
me.
> > > >>=20
> > > >> Since the device is stateless, each frame gets a separate runtime =
PM
> > > >> reference. Enable autosuspend so the PM callbacks are not run befo=
re
> > > >> and
> > > >> after every frame.
> > > >>=20
> > > >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> > > >> ---
> > > >>=20
> > > >> I tested this with v4l2-request-test. I don't have the setup to do
> > > >> anything more complicated at the moment.
> > > >>=20
> > > >> ---
> > > >>=20
> > > >>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   7 ++
> > > >>  .../staging/media/sunxi/cedrus/cedrus_hw.c    | 115 ++++++++++++-=
-----
> > > >>  .../staging/media/sunxi/cedrus/cedrus_hw.h    |   3 +
> > > >>  3 files changed, 88 insertions(+), 37 deletions(-)
> > >=20
> > > [snip]
> > >=20
> > > > Reset above causes problem. When format is set in cedrus_s_fmt_vid_=
cap()
> > > > a
> > > > function is called, which sets few registers in HW. Of course, ther=
e is
> > > > no
> > > > guarantee that someone will start decoding immediately after capture
> > > > format is set. So, if the driver puts VPU to sleep in the mean time,
> > > > reset will clear those registers and decoded video will be in diffe=
rent
> > > > format than expected. It could be even argued that registers should=
 not
> > > > be set in that function and that this is design issue or bug in dri=
ver.
> > >=20
> > > You're right. I didn't see that cedrus_dst_format_set() was called ou=
tside
> > > cedrus_engine_enable/disable().
> >=20
> > This might indeed be an issue with multiple decoding contexts in parall=
el,
> > with potentially different formats. For that reason, it looks like the
> > right thing to do would be to set the format at each decoding run based=
 on
> > the format set in the context by s_fmt.
>=20
> So you are suggesting that cedrus_dst_format_set() should be moved to=20
> cedrus_device_run(), right? This way all registers are set at each run, w=
hich=20
> is then truly stateless.

Yes, exactly! But this is outside of the scope of this series though.

Cheers,

Paul

> Best regards,
> Jernej
>=20
> >=20
> > > > Anyway, I made a runtime PM support long time ago, but never do any=
thing
> > > > besides running few tests:
> > > > https://github.com/jernejsk/linux-1/commit/
> > > > d245b7fa2a26e519ff675a255c45230575a4a848
> > > >=20
> > > > It takes a bit different approach. Power is enabled in start stream=
ing
> > > > and
> > > > disabled in stop streaming. This is simpler approach and doesn't ne=
ed
> > > > autosuspend functionality. I also moved call to a function which se=
ts
> > > > format in HW registers to start streaming handler, so it's guarante=
ed
> > > > to be set at the beginning.
> > >=20
> > > Assuming cedrus_device_run() only gets called between streamon and
> > > streamoff (which appears to be the case), this looks like a better
> > > design.
> >=20
> > Yes, this is defintiely ensured by the V4L2 framework. I agree that
> > streamon/off are the correct sync points.
> >=20
> > > > Note that some registers are only set in start streaming handler. W=
ith
> > > > your
> > > > approach, if first frame is submitted too late, asserting and
> > > > de-asserting
> > > > reset line could reset those registers.
> > >=20
> > > I only see registers being set in cedrus_start_streaming() after your
> > > patch, where you add a call to cedrus_dst_format_set(). I can't find =
any
> > > registers being written in any of the ->start() callbacks.
> > >=20
> > > I'll send a v2 which combines the two patches: yours which handles the
> > > runtime part better, and mine which handles the probe/remove part bet=
ter
> > > with !CONFIG_PM.
> > Thanks, that should do it!
> >=20
> > Cheers,
> >=20
> > Paul
>=20
>=20
>=20
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAl6d4mIACgkQ3cLmz3+f
v9EzUwf/fWYkOXQ7aCfBor+vnOz95eIXeb6WY3jGTqlLKcK+4HY9KlRVwHAt4Eiw
9vxNX+qb3CUvMu1WsvE+t7Zn2Xvd6PSLuYyTHsW+DCuY9qlbwT8iQHCzwWLelCui
4g+RaZU555V7GxVNk2lHtWMtfn9lD0cHnsAJLUHSEJDMWSGJW7O5cZ0Zb639iDxf
GEGaw6YVbheeiOCHHQbMkPjzCkEu99R9Rzp1GT4tszc3RiUBgxxpYYgnCr+mhZ01
Kt1mRfGlTXFdmzHPYAj83sbcKXJtlp3aS/dya99bAM91Z2Tbeeg0hHs4Lkfgn3ZQ
NA4GEvITmUZyyxDEeTCw48xHR1mgrA==
=x5mQ
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
