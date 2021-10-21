Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF31435CA0
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 10:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231354AbhJUIKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 04:10:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231239AbhJUIKn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 04:10:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99D9C06161C
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 01:01:11 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdT0g-0004my-1j; Thu, 21 Oct 2021 10:01:10 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdT0d-0007xY-B0; Thu, 21 Oct 2021 10:01:07 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdT0d-0008JH-AC; Thu, 21 Oct 2021 10:01:07 +0200
Date:   Thu, 21 Oct 2021 10:01:05 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel@pengutronix.de, linux-media@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] [media] s5c73m3: Drop empty spi_driver remove callback
Message-ID: <20211021080105.7izlji7tb4uj3zen@pengutronix.de>
References: <20211021062547.51989-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="weqf77w37kb2nqkt"
Content-Disposition: inline
In-Reply-To: <20211021062547.51989-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--weqf77w37kb2nqkt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

FTR: a.hajda@samsung.com doesn't seem to exist[1], so please don't wait for
their feedback :-)

Best regards
Uwe

[1] The MTA on mailin.samsung.com tells: Recipient address rejected: User u=
nknown

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--weqf77w37kb2nqkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFxHj4ACgkQwfwUeK3K
7AlFdQf8DHbHyC2uKbbJOky1k5WM8vY+xHS+ubokjU9Mno4cnWF0ynGfUvSPt8Qt
4sBz0LIFPdL8c1ryTNzSH6RUEq/9tJF/jGN7VNi02e7kHQXrImveC749qNFSo/y1
ZSFOtSniD5llJDjOP1ZZg/hMXpW0hP/OKtMp0GZcziKIzSN1xM3cePy/DObE+1P/
elIRy5kPBn0aLAQl6fMOWN3yba45e17auZW9wPgifYMUgrqfE0J7NsvUvxHjukC4
PehYV5EXqktnJ7XvjaSpSEc+fMde5rKQD1hu/YUrx/zYXBK2geTb5LPX2ZBdX7tK
APA2k26SFivxzDGjRismEZDUHE2/kA==
=qhXd
-----END PGP SIGNATURE-----

--weqf77w37kb2nqkt--
