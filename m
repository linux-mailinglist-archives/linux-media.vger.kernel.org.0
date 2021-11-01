Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A63E441D0D
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 16:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbhKAPEr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 11:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbhKAPEq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 11:04:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F40C061714
        for <linux-media@vger.kernel.org>; Mon,  1 Nov 2021 08:02:13 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mhYp8-0005oy-TM; Mon, 01 Nov 2021 16:02:10 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mhYp7-0006P0-VO; Mon, 01 Nov 2021 16:02:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mhYp7-0001RP-UO; Mon, 01 Nov 2021 16:02:09 +0100
Date:   Mon, 1 Nov 2021 16:02:09 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH] [media] tua9001: Improve messages in .remove's error path
Message-ID: <20211101150209.an56wy32ttjzoquj@pengutronix.de>
References: <20211026194010.109029-1-u.kleine-koenig@pengutronix.de>
 <163577655353.275423.6737046445297486684@Monstersaurus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g2oryxtnumy4by3n"
Content-Disposition: inline
In-Reply-To: <163577655353.275423.6737046445297486684@Monstersaurus>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--g2oryxtnumy4by3n
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 01, 2021 at 02:22:33PM +0000, Kieran Bingham wrote:
> Quoting Uwe Kleine-K=F6nig (2021-10-26 20:40:10)
> > If disabling the hardware fails the driver propagates the error code to
> > the i2c core. However this only results in a generic error message; the
> > device still disappears.
> >=20
> > So instead emit a message that better describes the actual problem than
> > the i2c core's "remove failed (ESOMETHING), will be ignored" and return
> > 0 to suppress the generic message.
>=20
> You almost caught me out. I was going to say, this changes the
> behaviour of the return code. But It's intentional ;-)
>=20
> It's still a bit concerning, /not/ returning an error on an error - but
> as it's not going to prevent removal, and it won't add further (helpful)
> diagnosticts), maybe it makes sense.
>=20
> My only concern would be if it might be better to keep the return code,
> so that the core frameworks know about the issue at least.

The long term goal is to make the remove callback return void. For that
change I want all implementations to remove 0 to make the change easy to
review.

Best regards and thanks for your thoughts,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--g2oryxtnumy4by3n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmGAAW4ACgkQwfwUeK3K
7AlYLwf9Ffg7FrOZ3gmptZQ0YTT9xKILULGVPeGfqhMXLnbN6pRRFXQJfhHbPJK0
O9USznxJX7E6CNKrXx2ukYWqsyBvA9JLf1tKct3tDBWBNXt3vzU4mm8Rv4a7RVU1
zPiSVfCv+SH5lwP8tDm+lVPeUaeLh3U4+zrKe8u0gQdNA6CCBGv4Bk1Hs5dYf29+
WpiQqe70sUt1p95SBYKCkHWbD86yHPUOsilZlm7EVBl3Eb/+OvhhtkmWHha0/wTF
YE3eJWGdJpOdY6XEMchiM2la+C1mtUR7l5jWi65Rk/8+LJKT3X/IfxYL+sRWkUyQ
oaTTR/ZFscarBQH9Gycn5rtMW+O2RA==
=vctD
-----END PGP SIGNATURE-----

--g2oryxtnumy4by3n--
