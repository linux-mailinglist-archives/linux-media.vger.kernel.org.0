Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F81167F6AA
	for <lists+linux-media@lfdr.de>; Sat, 28 Jan 2023 10:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233397AbjA1JXV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Jan 2023 04:23:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232296AbjA1JXU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Jan 2023 04:23:20 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A421E9E0
        for <linux-media@vger.kernel.org>; Sat, 28 Jan 2023 01:23:19 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLhQa-0003ee-Be; Sat, 28 Jan 2023 10:23:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLhQZ-000yhJ-8W; Sat, 28 Jan 2023 10:23:14 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pLhQX-00GVIG-L6; Sat, 28 Jan 2023 10:23:13 +0100
Date:   Sat, 28 Jan 2023 10:23:10 +0100
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Shunqian Zheng <zhengsq@rock-chips.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel@pengutronix.de, linux-media@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] media: i2c: ov2685: convert to i2c's .probe_new()
Message-ID: <20230128092310.4s3462q3w5ablfmr@pengutronix.de>
References: <20221121102838.16448-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2gnxu2uiyxxnkjb6"
Content-Disposition: inline
In-Reply-To: <20221121102838.16448-1-u.kleine-koenig@pengutronix.de>
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


--2gnxu2uiyxxnkjb6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Nov 21, 2022 at 11:28:38AM +0100, Uwe Kleine-K=F6nig wrote:
> The probe function doesn't make use of the i2c_device_id * parameter so
> it can be trivially converted.

Gentle ping! As of yesterday's next there are only <10 drivers left that
make use of the old .probe function. I'd like to complete the conversion
to .probe_new() after the next merge window. So I ask you to either take
this patch (and the similar ov5695 one) during the next merge window (my
preferred option), or accept that I will send it in a series with the
patch removing .probe() with the id parameter to be merged via the i2c
tree.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2gnxu2uiyxxnkjb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmPU6XsACgkQwfwUeK3K
7AnzvwgAkL4wDoLkrvJ8axTL+rl81mARBB3FT0VUkbjdn8NKuEYXm5rAgorkJlov
0hSti1wxuDqn7cSlTxY02NYFlkA7o78/OPDLH7gSDxrie2mPKTP2hpzjhIAC2fwK
YMXcC+IVIPH2osanHjkW65RH0gKZ8HJGHaZf1BNEIL3xyJr5AvFNZPGJnUPKX+Ku
wS/a+ZktfGv0xcTEwT+9+gDJPDjs+lHp233FZi7Ay1si3NSOZMmmjUza005rUg97
di6EOOzTudmB8CX61XY+kq0kk/HxEpxzi/uM199GIMqe0hi5VS4/GtdFfhQ73JWY
4q5Qj13gJKYh5SM7JLFqN7e0jzDVuQ==
=RUem
-----END PGP SIGNATURE-----

--2gnxu2uiyxxnkjb6--
