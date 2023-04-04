Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3786A6D5B2D
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 10:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233913AbjDDIr1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Apr 2023 04:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233594AbjDDIr0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Apr 2023 04:47:26 -0400
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3810419BC
        for <linux-media@vger.kernel.org>; Tue,  4 Apr 2023 01:47:25 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 2366A100003;
        Tue,  4 Apr 2023 08:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1680598044;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dH6w27boEORBTwMCoLxB1gUos3o1R90xxs+JTsuFLxQ=;
        b=gV21vv0W//P0xSy+YY4G1pVOMC0d0Gg9RXEMk5w7hB43jsfYJb4Bq9KjcSP6VU59oYZoOH
        audBsNsUI7qxODPHkLaVzk4cTUy0q8gBCrC82NkklKbxeH0N94XBjV3nvm9X88TezfuMt6
        4fUuxYZX56JtGSREql+c2wo4+G9XVgElMQeKPQ+5vhG0+SfKMO/Kfq3+LdfTsHpwmp5BHB
        V6lobiqWW1VuRpmx4Qjvl+P4h/wCJ+Ek+H2eDC/rxc8MWBMzR8jn+H5GTEsves3xzrL2XV
        E/4vzH1rowSBFxXmj4PGX0kMoUqS62pnePqOE6j73B82mAuXAu9UgskdO6rqKg==
Date:   Tue, 4 Apr 2023 10:47:18 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@pengutronix.de
Subject: Re: [PATCH 16/24] staging: media: sun6i-isp: Convert to platform
 remove callback returning void
Message-ID: <ZCvkFk7GcT_0M4xy@aptenodytes>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
 <20230403154014.2564054-17-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="X1F0QsZWr8t/LkMj"
Content-Disposition: inline
In-Reply-To: <20230403154014.2564054-17-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--X1F0QsZWr8t/LkMj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 03 Apr 23, 17:40, Uwe Kleine-K=C3=B6nig wrote:
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
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Thanks,

Paul

> ---
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/=
staging/media/sunxi/sun6i-isp/sun6i_isp.c
> index 7b7947509b69..0dc75adbd9d8 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> @@ -493,7 +493,7 @@ static int sun6i_isp_probe(struct platform_device *pl=
atform_dev)
>  	return ret;
>  }
> =20
> -static int sun6i_isp_remove(struct platform_device *platform_dev)
> +static void sun6i_isp_remove(struct platform_device *platform_dev)
>  {
>  	struct sun6i_isp_device *isp_dev =3D platform_get_drvdata(platform_dev);
> =20
> @@ -503,8 +503,6 @@ static int sun6i_isp_remove(struct platform_device *p=
latform_dev)
>  	sun6i_isp_v4l2_cleanup(isp_dev);
>  	sun6i_isp_tables_cleanup(isp_dev);
>  	sun6i_isp_resources_cleanup(isp_dev);
> -
> -	return 0;
>  }
> =20
>  /*
> @@ -540,7 +538,7 @@ MODULE_DEVICE_TABLE(of, sun6i_isp_of_match);
> =20
>  static struct platform_driver sun6i_isp_platform_driver =3D {
>  	.probe	=3D sun6i_isp_probe,
> -	.remove	=3D sun6i_isp_remove,
> +	.remove_new =3D sun6i_isp_remove,
>  	.driver	=3D {
>  		.name		=3D SUN6I_ISP_NAME,
>  		.of_match_table	=3D of_match_ptr(sun6i_isp_of_match),
> --=20
> 2.39.2
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--X1F0QsZWr8t/LkMj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmQr5BYACgkQ3cLmz3+f
v9FUkAf/R1t1XvAegO7HIBrmxQsZrSgULNDLSWmKvPECq0DbT+oxpevBoT71lnN4
fU0/ybdlg2KX4Aol1ZIQOyMP90odNb8yUhBvc54P/kITS4xvka+S20Hp4Oq4FLcN
UfIGZlhICogfVopP5byBvA8JRjYnHjoY+sv6PqnoVgXW/z7fTKpFHH1JbJECxOBp
IMJznULWN8srIPUh2bAQSlCGcLdHvDvkUZ2YHxuQ25/Cx8YiK0f+ZcSEZ4d6bOdN
eEDx933CG1Fv7bYy802D8SgM9J2uwEbLzBXABAjIshg9RQhH4SbPwke2tO95LNBe
TYCj73BkqNYEKX2kdlE766aYTzG1Qw==
=Qrwu
-----END PGP SIGNATURE-----

--X1F0QsZWr8t/LkMj--
