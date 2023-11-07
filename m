Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCA97E4998
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 21:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235130AbjKGUId (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 15:08:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234007AbjKGUIc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 15:08:32 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 802C2102
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 12:08:30 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4AF9240005;
        Tue,  7 Nov 2023 20:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1699387709;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Zo/OAfJl4dL4RprfAPR8Lg6nZAvWB1IUMqUxVQegRQU=;
        b=ATE/1ojaiBI7risOnKk5uEUlQ0tqDU/216By8pNqt3m2hcLuxvREqlkr47NLVlUtKGjQz/
        aImBfNFFawDbpk2kVavp5YOPiLbXk41PM+wn7F+NzccVu3HMoCnZ5NZsjy9/nRvzIiKOdh
        bofh2BZQkFOZaCVR1kJUz5PKpxNaXGBJe+cFKZ4uhk/UZmhv77BSKLlTDelaRcRay/pM8s
        iuFF8L8YQDSDJeQ/U2XaH5fW1f4B57RjtCcv8s0p5uB/yT3BYMcBkqJA8NZEgQ1Sbru7M3
        qlLb3twnn/Goob89m9DHQ0u7zzhK1/+elnYxfKjvGQeTlWpCz85emPtQ9BMbrQ==
Date:   Tue, 7 Nov 2023 21:08:28 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Maxime Ripard <mripard@kernel.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: RFC: cedrus: time to more to mainline?
Message-ID: <ZUqZPJW9JNuZPpLX@aptenodytes>
References: <c7accc1c-57a8-4722-a4f7-2278eb035429@xs4all.nl>
 <ZUpI151wvt455TcF@aptenodytes>
 <5c93488e-3949-4bb3-bdff-0a60b4586183@xs4all.nl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fVzCnlyLPzmxmh4W"
Content-Disposition: inline
In-Reply-To: <5c93488e-3949-4bb3-bdff-0a60b4586183@xs4all.nl>
X-GND-Sasl: paul.kocialkowski@bootlin.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--fVzCnlyLPzmxmh4W
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hans,

On Tue 07 Nov 23, 16:00, Hans Verkuil wrote:
> On 07/11/2023 15:25, Paul Kocialkowski wrote:
> > Hi Hans,
> >=20
> > On Tue 07 Nov 23, 14:54, Hans Verkuil wrote:
> >> Looking at the cedrus TODO:
> >>
> >> Before this stateless decoder driver can leave the staging area:
> >> * The Request API needs to be stabilized;
> >> * The codec-specific controls need to be thoroughly reviewed to ensure=
 they
> >>   cover all intended uses cases;
> >> * Userspace support for the Request API needs to be reviewed;
> >> * Another stateless decoder driver should be submitted;
> >> * At least one stateless encoder driver should be submitted.
> >>
> >> I would say that all items are done, except for the last item.
> >>
> >> But this is a decoder driver, so I'm not sure why the TODO would menti=
on
> >> something about encoders.
> >=20
> > I agree. This didn't prevent the hantro driver form being unstaged anyw=
ay.
> >=20
> >> Anything else that needs to be done before it can be moved out of stag=
ing?
> >=20
> > I'm actually working on a big rework of the driver, because its archite=
cture
> > is vastly sub-optimal and overall very messy. This is in particular nee=
ded for
> > the work to support H.264 encoding.
> >=20
> > The plan for now is to publish this work in a downstream repository (at=
 Bootlin)
> > since we don't yet have a uAPI for encoding. The rework is also not spl=
it into
> > nice transition commits but it's instead a big all-in-one commit for th=
e moment.
> >=20
> > However I would like to see this rework hit mainline after the publicat=
ion of
> > the encoding work, because it's a much needed cleanup for the decode si=
de too.
> > I will of course split it into nice commits at that point.
> >=20
> > So I'm not sure whether this conflicts with unstaging or not. It could =
make
> > sense to wait until the rework is achieved to unstage, but I would also=
 be fine
> > with unstaging first. It would just make me slightly happier to bring b=
ig
> > changes to a staging driver instead of a fully-merged one.
> >=20
> > What do you think?
>=20
> Fine with me, but I would appreciate it if you can post a patch updating =
the TODO
> file. That's really out of date, and you can mention the rework you are d=
oing.

Great, I've just sent out a patch which replaces the current TODO with a
description of the rework.

Thanks,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--fVzCnlyLPzmxmh4W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmVKmTsACgkQ3cLmz3+f
v9GDeQf/VgujjQryuSSOIqpZXLT8iKoQAlkK1juOZCnudYaA1yb6wWkl6v5c5OLp
QDBfoAuGTNXOVJPXHJPliw6tS6U1/ruLYU6kiGxpWACgjL9ziWA6jJFrViJdrbad
OqjI23vah6C7gfYd3xWXjXrj+6j8qbKtmI0PIlmNCv8kNxMnVCuqdL8SutwBh2ch
QyZtXgd4qc1vf7hio2SH/j3H4AHwBrhNTzwg09pQlOoMqFunsHgGd47xQStaVHDd
gIsracjf7SIg22aISE72dUmwV7p685Y+LwKodFr0KUzvcKBIOO6ijFlJMxGpT5OZ
vB3qGTt0oJTV19FrPjBLHG/UZtTVZQ==
=59Xb
-----END PGP SIGNATURE-----

--fVzCnlyLPzmxmh4W--
