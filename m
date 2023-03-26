Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D89966C95D2
	for <lists+linux-media@lfdr.de>; Sun, 26 Mar 2023 16:50:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbjCZOus (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Mar 2023 10:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbjCZOur (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Mar 2023 10:50:47 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDA144AD
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 07:50:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRh2-0001PC-9q; Sun, 26 Mar 2023 16:50:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRh1-006rmD-Ge; Sun, 26 Mar 2023 16:49:59 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pgRh0-0088dR-Qj; Sun, 26 Mar 2023 16:49:58 +0200
Date:   Sun, 26 Mar 2023 16:49:59 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel@pengutronix.de, linux-media@vger.kernel.org
Subject: Re: [PATCH 002/117] media: cec-gpio: Convert to platform remove
 callback returning void
Message-ID: <20230326144959.woxa5rca7a6umiyz@pengutronix.de>
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="in2s4xjzno4abusf"
Content-Disposition: inline
In-Reply-To: <20230326143224.572654-4-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--in2s4xjzno4abusf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, Mar 26, 2023 at 04:30:28PM +0200, Uwe Kleine-K=F6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.

I fatfingered sending out this series and this patch is a duplicate,
please ignore this patch, 001/117 with the otherwise same subject is the
right one. (They only differ in the number, this patch is advertised as
001 in the cover letter.)

Sorry,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--in2s4xjzno4abusf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQgW5YACgkQj4D7WH0S
/k6wAggAnbHaobfhg7pxujqPYx9braRs9FY/FJ7UitIrIF9wScqOJG0Zel2LcUFg
XIGZZZ2AQEju81mADhwnDNSYx6F2kY945tIbfeneD+W17dASEkjuR4ZWMDDAa9AB
zFT9v74eElAOpEhmKH89tAG/m+QgVgCrixgu5SLxZzrs9ywIRWyfwPvvDzycaw1Q
jjElk8LknTIt0Q9XnHlz2qdPicLwaYSV9nZGMBMZKPVnY8XzWU2PXAb415fuZXnF
8wbD2DZ91SGiDymarpk6ti6ZqabDdMlLe+xrvdjR7/+cn5Aa0V+Eauc/ZdtEMv3D
h3dckSsLom//py/sdOAff8LiGRJJ/Q==
=UFky
-----END PGP SIGNATURE-----

--in2s4xjzno4abusf--
