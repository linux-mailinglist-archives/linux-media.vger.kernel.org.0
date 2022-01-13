Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCD5448D598
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 11:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbiAMKRn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 05:17:43 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:39039 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbiAMKRn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 05:17:43 -0500
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 880C640004;
        Thu, 13 Jan 2022 10:17:41 +0000 (UTC)
Date:   Thu, 13 Jan 2022 11:17:40 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] ov5648: Don't pack controls struct
Message-ID: <Yd/8REO5HSL8tKSj@aptenodytes>
References: <20220110224831.266749-1-sakari.ailus@linux.intel.com>
 <Yd0/nL7iQityle6P@aptenodytes>
 <Yd1sOmFjJfsFHrT2@paasikivi.fi.intel.com>
 <Yd62+tGrH+ep7bAS@aptenodytes>
 <Yd65rCQpHFyh8nXt@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="g0mlFLZPaRjKOqiz"
Content-Disposition: inline
In-Reply-To: <Yd65rCQpHFyh8nXt@paasikivi.fi.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--g0mlFLZPaRjKOqiz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Wed 12 Jan 22, 13:21, Sakari Ailus wrote:
> Hi Paul,
>=20
> On Wed, Jan 12, 2022 at 12:09:46PM +0100, Paul Kocialkowski wrote:
> > Hi Sakari,
> >=20
> > On Tue 11 Jan 22, 13:38, Sakari Ailus wrote:
> > > Hi Paul,
> > >=20
> > > On Tue, Jan 11, 2022 at 09:28:12AM +0100, Paul Kocialkowski wrote:
> > > > Hi Sakari,
> > > >=20
> > > > On Tue 11 Jan 22, 00:48, Sakari Ailus wrote:
> > > > > Don't pack the driver specific struct containing control pointers=
=2E This
> > > > > lead to potential alignment issues when working with the pointers.
> > > >=20
> > > > Thanks for looking into the report and making this fix.
> > > >=20
> > > > Honestly I was a bit puzzled because I explicitly added the __packed
> > > > to avoid possible holes in the structures that could be problematic
> > > > when using v4l2_ctrl_auto_cluster and I think the problem still sta=
nds.
> > > >=20
> > > > I feel like solving both issues at once would require having the co=
ntrols
> > > > that belong in the same cluster declared as an array and not indivi=
dual
> > > > members of the struct.
> > > >=20
> > > > What do you think?
> > >=20
> > > No architecture used in Linux requires adding padding between two poi=
nters
> > > to my knowledge --- generally the alignment is at most the size of the
> > > data: otherwise arrays would not work either. Therefore packing isn't
> > > required.
> >=20
> > I was under the impression that padding may happen in structures genera=
lly
> > speaking. Are you saying that because it's pointers, there will most li=
kely
> > be no padding required?
>=20
> Not really just pointers; the same goes for any data type.
>=20
> >=20
> > Also there's a struct v4l2_ctrl_handler at the end of the struct
> > (not a pointer), maybe that can somehow play a role too and introduce p=
adding?
>=20
> There could be padding added at the end of the struct. (But that depends =
on
> what comes after the struct.)
>=20
> >=20
> > My feeling was that there's no strong guarantee here, so packing the st=
ruct
> > would be the safe thing to do. I also don't see how unaligned access ca=
n occur
> > in the packed struct in that case (pointers should always offset to som=
ething
> > properly aligned, shouldn't they?).
>=20
> My understanding is this is a false positive warning from clang. Gcc does
> not complain but I'm not sure it's capable of doing that either.
>=20
> Of course it would be the best to fix clang but until that happens or we
> change the code, we'll be permanent targets of these e-mails.
>=20
> Still __packed isn't needed here.

Okay understood, thanks!

So all in all I was under the impression that padding can be added by the
compiler "as it likes" but it seems that it will only happen for alignment
reasons. However here no padding should be required between pointers to mai=
ntain
alignment, so we're good. Is that correct?

If that's right then feel free to add:
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Thanks,

Paul


--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--g0mlFLZPaRjKOqiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmHf/EQACgkQ3cLmz3+f
v9EiVAf/XLJ0r5y6SUn7DQmb/ELL2uY3iqOap1SZcS7WWSq9avhxSicBaztuUbvS
pYfRyNyQgigzWVEF4EnbGAicANxUV8iAFvHhZdSjPh47YNdqBvHIn6Y5zFKdQqsS
NAJB4qCySd/j7R7D9uXHtaWAfZ/AnSa+7EfXtdwOztYA/Os1xBk/XXp4RVrcYIFD
N4/IeDqJ3Giw92pWol0x8F34FtxFjg6E157+aZluPZSLjfafv1gH1BpaGOMDoQqc
cuhKhMFZzO4HfKrMMVhKCNVGCVa5aw2UUXryAyQjlBbw98WmBvI65PpBo13lPv4w
kqtPGv/aWhtCJ6gGvOOpvwwOYoRIlw==
=iv/o
-----END PGP SIGNATURE-----

--g0mlFLZPaRjKOqiz--
