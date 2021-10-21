Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A75E6436C63
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 23:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbhJUVD5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 17:03:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhJUVD4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 17:03:56 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F56C061764
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 14:01:40 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdfBr-0004ST-Qn; Thu, 21 Oct 2021 23:01:31 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdfBr-0001Vq-0R; Thu, 21 Oct 2021 23:01:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1mdfBq-000403-Vu; Thu, 21 Oct 2021 23:01:30 +0200
Date:   Thu, 21 Oct 2021 23:01:30 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Andrzej Hajda <andrzej.hajda@intel.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH] [media] s5c73m3: Drop empty spi_driver remove callback
Message-ID: <20211021210130.bkags5flfebia74c@pengutronix.de>
References: <20211021062547.51989-1-u.kleine-koenig@pengutronix.de>
 <163481464506.2663858.16090359620223699606@Monstersaurus>
 <be94762f-4518-6bdc-e280-41dba484f377@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="s7f3xxfc4wgqoiou"
Content-Disposition: inline
In-Reply-To: <be94762f-4518-6bdc-e280-41dba484f377@intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--s7f3xxfc4wgqoiou
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andrzej,

On Thu, Oct 21, 2021 at 04:08:38PM +0200, Andrzej Hajda wrote:
>=20
> On 21.10.2021 13:10, Kieran Bingham wrote:
> > - To: Updated Andrzej's e-mail address
> Thx for update :)
>
> > Quoting Uwe Kleine-K=F6nig (2021-10-21 07:25:47)
> > > A driver with a remove callback that just returns 0 behaves identical=
ly
> > > to a driver with no remove callback at all. So simplify accordingly.
> > Looks fine to me though.
> >=20
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Maybe it would be a sensible thing to fix your entries in MAINTAINERS? I
would suggest a patch, but I don't know if
s/a.hajda@samsung.com/andrzej.hajda@intel.com/=20
or just removing some M:-lines would be the right thing to do. Maybe a
mixture?!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--s7f3xxfc4wgqoiou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFx1ScACgkQwfwUeK3K
7AlCEwf/XOJW7tnnMFo/iVQ3GR3oZ9xxK2rEF7rZNN2f3KPbEvpBaZ1JwEAubtEH
ZxFOVW5V0qgQH7Jd0h2dlo17W+OKt/W5m9CsXnDgBAqL98VYtFODwNaOJ/SrdYHY
dMOMBRBhx+QnLkx43YGhNQBD2AlZP5kugwO1j7HYKOZw88hGfUq2QBmeG2xDwU6N
Q4Mpg+0oV6RJ5k8D4+UYmpTJCuFHoacukQElmEiD7equZP57qte6jEDa7mpgCfdw
+9K9YYhPJbr5Mi/Gc+tGiDJXzm+vAiZgmC4Y492lfeindaACd2OseIHCO0BRA/ds
R4/fBAQwrKm9aQRqRmtiR7lTVPXiHA==
=lAjZ
-----END PGP SIGNATURE-----

--s7f3xxfc4wgqoiou--
