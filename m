Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3669F72B3DD
	for <lists+linux-media@lfdr.de>; Sun, 11 Jun 2023 21:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjFKT7D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Jun 2023 15:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229455AbjFKT7C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Jun 2023 15:59:02 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAAAC1A4
        for <linux-media@vger.kernel.org>; Sun, 11 Jun 2023 12:59:00 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8RCi-00057a-Lp; Sun, 11 Jun 2023 21:58:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8RCa-006is8-0H; Sun, 11 Jun 2023 21:58:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q8RCZ-00DHff-4U; Sun, 11 Jun 2023 21:58:15 +0200
Date:   Sun, 11 Jun 2023 21:58:11 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Corey Minyard <cminyard@mvista.com>,
        linux-staging@lists.linux.dev, Haowen Bai <baihaowen@meizu.com>,
        kernel@pengutronix.de,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tom Rix <trix@redhat.com>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Adrien Grassein <adrien.grassein@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/5] media: atomisp: Switch i2c drivers back to use
 .probe()
Message-ID: <20230611195811.ten5wrmc43r4lpol@pengutronix.de>
References: <20230524151646.486847-1-u.kleine-koenig@pengutronix.de>
 <20230524151646.486847-3-u.kleine-koenig@pengutronix.de>
 <20230611110749.jujuc2j6qx2nlihy@pengutronix.de>
 <d2d2bc9b-9d75-d96b-d6fe-8a4bfa532a27@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ibuaq5xhgjc47433"
Content-Disposition: inline
In-Reply-To: <d2d2bc9b-9d75-d96b-d6fe-8a4bfa532a27@redhat.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--ibuaq5xhgjc47433
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Hans,

On Sun, Jun 11, 2023 at 09:16:41PM +0200, Hans de Goede wrote:
> On 6/11/23 13:07, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > On Wed, May 24, 2023 at 05:16:43PM +0200, Uwe Kleine-K=F6nig wrote:
> >> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> >> call-back type"), all drivers being converted to .probe_new() and then
> >> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") conv=
ert
> >> back to (the new) .probe() to be able to eventually drop .probe_new() =
=66rom
> >> struct i2c_driver.
> >>
> >> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > the four other patches from this series are already in next, this one
> > wasn't picked up yet though. There is another change for staging: media:
> > atomisp in next via Mauro's media-next (branch: fixes).
> >=20
> > Who wants/should pick up this change?
>=20
> This patch is already in media-staging:
>=20
> https://git.linuxtv.org/media_stage.git/log/?ofs=3D50
> https://git.linuxtv.org/media_stage.git/commit/?id=3D625ac9af384481e8644e=
0653a4aa472aa95f0395
>=20
> So this is on its way to -next already.

I admit I missed your mail from May 24 where you announced your PR
around -rc5/-rc6 time. Otherwise I wouldn't have bothered you and the
others. Sorry and thanks

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ibuaq5xhgjc47433
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSGJ1IACgkQj4D7WH0S
/k7r+gf9GegmoW3LidzSIuKFg0vU+Zwhz1zU+CkOo0zD2O/qIThQSzQ6ODdor5Vd
w85hMMnqlFWVlKCLwncBqJXwmHqmIXeNKdb3VlWahH3MMcEleBPOdFhCWV+7S90e
jpiOhGjzPTMo0a2EdumtWRSGWpp8Wil9oVSux02UPLCZidH/5dgSHbPHyEAh0KNY
urHvwgUg3wXJcHmFWmZKRS8R9lONrEfrn2v4XqKtumkVlWRqaTM/cgvM/fjKLekX
Ead/Qz8TTyAtqw5inGdwp8MNulNoVJrKGsGqB1aaQ8VJIYEXE2eU4MZ6vat3j91d
x+zd7pk+xUh2C94STJN51+IvnAwhsg==
=73IT
-----END PGP SIGNATURE-----

--ibuaq5xhgjc47433--
