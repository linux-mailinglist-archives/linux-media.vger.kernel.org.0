Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC1176F9C9
	for <lists+linux-media@lfdr.de>; Fri,  4 Aug 2023 08:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbjHDGFV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Aug 2023 02:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjHDGFT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Aug 2023 02:05:19 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77D273C0A
        for <linux-media@vger.kernel.org>; Thu,  3 Aug 2023 23:05:17 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qRnvv-00089Q-MD; Fri, 04 Aug 2023 08:05:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qRnvs-0010gf-Go; Fri, 04 Aug 2023 08:05:04 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qRnvr-00AJkM-8K; Fri, 04 Aug 2023 08:05:03 +0200
Date:   Fri, 4 Aug 2023 08:05:00 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        j.neuschaefer@gmx.net, linux-media@vger.kernel.org
Subject: Re: [PATCH -next 1/3] media: dvb-frontends: drx39xyj: Remove an
 unnecessary ternary operator
Message-ID: <20230804060500.mxnjbvwemucudpd5@pengutronix.de>
References: <20230804031323.2105187-1-ruanjinjie@huawei.com>
 <20230804031323.2105187-2-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="fkcrrvhimzjib7bc"
Content-Disposition: inline
In-Reply-To: <20230804031323.2105187-2-ruanjinjie@huawei.com>
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


--fkcrrvhimzjib7bc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 04, 2023 at 11:13:21AM +0800, Ruan Jinjie wrote:
> There is a ternary operator, the true or false judgement of which
> is unnecessary in C language semantics.
>=20
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/media/dvb-frontends/drx39xyj/drxj.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/=
dvb-frontends/drx39xyj/drxj.c
> index 68f4e8b5a0ab..e54e61c3518a 100644
> --- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
> +++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
> @@ -4779,7 +4779,7 @@ set_frequency(struct drx_demod_instance *demod,
>  	bool image_to_select;
>  	s32 fm_frequency_shift =3D 0;
> =20
> -	rf_mirror =3D (ext_attr->mirror =3D=3D DRX_MIRROR_YES) ? true : false;
> +	rf_mirror =3D ext_attr->mirror =3D=3D DRX_MIRROR_YES;
>  	tuner_mirror =3D demod->my_common_attr->mirror_freq_spect ? false : tru=
e;

Maybe also do:

-	tuner_mirror =3D demod->my_common_attr->mirror_freq_spect ? false : true;
+	tuner_mirror =3D !demod->my_common_attr->mirror_freq_spect;

?

Best regards
Uwe

>  	/*
>  	   Program frequency shifter

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--fkcrrvhimzjib7bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmTMlQsACgkQj4D7WH0S
/k5YEQf9E8bkCeH/Of6lL7tO3ghSVv5/9SKesVyTw+Ju4Wm1Pe/A8BvPztFamKhN
k24UiXp/NwdCtIKt3N6j5dpYEwj2tGrzL2OtH3gLKJ2HGyABPwTqnXHoqHKFCHOR
28LNw/Zeq0+OTNm5q7wjppow6DcUYmIifPVnMOwLwGKmr6+/qyNI1yXJGtZQ5IhG
WFjPYJdFwCwsvkmDBTSyvK2Rsj9274T7YUcHQLvX7BIAJ0F5wGR6daWxbBk/1UtO
7x3JXTQC61qwvUsT2Ci/lPaLs8OrfXOZQ17ZFgMDYYbGeDF9CMUWEKjCq8secKxv
WNUa78DgudDyhO+trtIA3ycIMLEScA==
=dAMb
-----END PGP SIGNATURE-----

--fkcrrvhimzjib7bc--
