Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D6897129E4
	for <lists+linux-media@lfdr.de>; Fri, 26 May 2023 17:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244186AbjEZPqJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 May 2023 11:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244184AbjEZPqD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 May 2023 11:46:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10840F7
        for <linux-media@vger.kernel.org>; Fri, 26 May 2023 08:45:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2ZdZ-0005Ur-6A; Fri, 26 May 2023 17:45:53 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2ZdY-002zFT-FB; Fri, 26 May 2023 17:45:52 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2ZdX-008Cbt-QT; Fri, 26 May 2023 17:45:51 +0200
Date:   Fri, 26 May 2023 17:45:51 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: Switch i2c drivers back to use .probe()
Message-ID: <20230526154551.eqm4r5p4qhphkgm7@pengutronix.de>
References: <20230513175931.159764-1-u.kleine-koenig@pengutronix.de>
 <20230513193626.48ed9a28@sal.lan>
 <20230514120407.34j4r5u5laasldrg@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="stlnuobl57az6zog"
Content-Disposition: inline
In-Reply-To: <20230514120407.34j4r5u5laasldrg@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--stlnuobl57az6zog
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Mauro,

On Sun, May 14, 2023 at 02:04:07PM +0200, Uwe Kleine-K=F6nig wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
> back to (the new) .probe() to be able to eventually drop .probe_new() from
> struct i2c_driver.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> On Sat, May 13, 2023 at 07:36:26PM +0100, Mauro Carvalho Chehab wrote:
> > Em Sat, 13 May 2023 19:59:31 +0200
> > Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de> escreveu:
> > > this patch was generated using coccinelle, but I aligned the result to
> > > the per-file indention.
> > >=20
> > > If you don't like the cleanups that are orthogonal to this patch, just
> > > tell me, then I can drop this change from the patch. Also if you want=
 it
> > > split per driver or directory for improved patch count numbers, please
> > > tell me.
> > >=20
> > > Also I didn't Cc: all the individual maintainers to not exceed the
> > > allowed length of To: and Cc:. If this patch will be split I can exte=
nd
> > > the audience accordingly.
> >=20
> > Sounds good to me.=20
> >=20
> > > diff --git a/drivers/media/i2c/ov5648.c b/drivers/media/i2c/ov5648.c
> > > index 17465fcf28e3..7b26ba72ff2a 100644
> > > --- a/drivers/media/i2c/ov5648.c
> > > +++ b/drivers/media/i2c/ov5648.c
> > > @@ -2616,7 +2616,7 @@ static struct i2c_driver ov5648_driver =3D {
> > >  		.of_match_table =3D ov5648_of_match,
> > >  		.pm =3D &ov5648_pm_ops,
> > >  	},
> > > -	.probe_new =3D ov5648_probe,
> > > +	.probe =3D ov5648_probe,
> > >  	.remove	 =3D ov5648_remove,
> > >  };
> >=20
> > Nit: you should probably remove the extra spaces from .remove
> > or align .probe here.
>=20
> Fixed here. This is the only change in v2.
>=20
> (There are a few more instances I'd call a bit strange, but I didn't fix
> these. E.g. drivers/media/dvb-frontends/au8522_decoder.c where the =3D for
> all members of au8522_driver are aligned but the .driver one. Then
> however .driver.name's =3D is aligned again. *shrug*)
>=20
>=20
> > Are you planning to merge this via I2C tree?
> > If so:
> >=20
> > Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>=20
> No, please take it via your tree. There are still a few more subsystems
> that must be converted before struct i2c_driver can be changed. There is
> no urge and I prefer to make it slow over coordinating all drivers
> changing via the i2c tree.

I don't find this change in next. After you initial feedback I thought
this would go in quickly. Did I miss something? Did this patch fell
through the cracks?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--stlnuobl57az6zog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRw1C4ACgkQj4D7WH0S
/k57XggAuBgfgj4KCAoPDvHDQ4nNnUKBvLwAVO/mhNtSSdd5oaDM4MwezBd53JDY
K0MxaZofIu6pcU5NcyZsIuqhPPZ60+xC8uQWDjO/koWQbRfxTJCMtZloHlO8O0wA
Wz3JmUOtOXfUKZklw+H7ANDWr46TG0xfrNZq8ZKtbs0OhEaPPHD864OkmzQ2pDSD
M0g0cBb+be0BIXi5m+45nDfEbZpIUS94ygtWqbKgwqP74xYGCYkOZz+SKFaCUosL
mSEiJ+WG+oZQVam6+GHHFql26GOPQdyJtj2DhCOYxkzuvf2mlcZFJUaFbcz6ryiU
jpEzrreb7f7WRvRXRKeghdIdipegxQ==
=VATV
-----END PGP SIGNATURE-----

--stlnuobl57az6zog--
