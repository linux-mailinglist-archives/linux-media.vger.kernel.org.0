Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 776E866868E
	for <lists+linux-media@lfdr.de>; Thu, 12 Jan 2023 23:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbjALWKY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Jan 2023 17:10:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbjALWJ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Jan 2023 17:09:59 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7005B59F8A
        for <linux-media@vger.kernel.org>; Thu, 12 Jan 2023 14:00:06 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pG5c5-0006BQ-03; Thu, 12 Jan 2023 22:59:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pG5c4-005cr1-1L; Thu, 12 Jan 2023 22:59:56 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pG5c3-00CN3M-5N; Thu, 12 Jan 2023 22:59:55 +0100
Date:   Thu, 12 Jan 2023 22:59:55 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 0/4] media: Drop empty platform remove functions
Message-ID: <20230112215955.qemcxbwxcmdqutnw@pengutronix.de>
References: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pgxjg4pp7whkrivb"
Content-Disposition: inline
In-Reply-To: <20221213153553.648871-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--pgxjg4pp7whkrivb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Dec 13, 2022 at 04:35:49PM +0100, Uwe Kleine-K=F6nig wrote:
> this series removes all platform remove functions that only return zero
> below drivers/media. There is no reason to have these, as the only
> caller is platform core code doing:
>=20
>         if (drv->remove) {
>                 int ret =3D drv->remove(dev);
>=20
>                 if (ret)
>                         dev_warn(...)
>         }
>=20
> (in platform_remove()) and so having no remove function is both
> equivalent and simpler.

I didn't get any feedback in reply to this series yet. Gentle ping!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pgxjg4pp7whkrivb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPAgtcACgkQwfwUeK3K
7AkFNAf4rFmhboSeLMiZErMM91+c+lvjl/2L9vMbv0gLMoUjUQ+3NJ7l5Az40mT/
I0WRWX6xN0YwmSTme774LrrMaOnljhoTvmi7HikfEMclZ3m1VRmpvferCGkgmnOE
Ds/rKkowzCAgdIKdmQQ37bcOx56vxYLm0N1y9t5x+n+oG1erfEtJMQJDhpX31TVx
5LUoChfacUZ/G3ykzpKRPkvQWhtF6nQaS7e2fAngBVkxEudMKRipkVk1MYsZ5f1X
xSISphXO21Oq7/z5MH3XuJK7L3MR5bIQ1oEHJ8hZTmqviaRo5QI4x0o467KlsZag
O1iSR6/y4j2Yy2PQfzFCekapiiq5
=7iYF
-----END PGP SIGNATURE-----

--pgxjg4pp7whkrivb--
