Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 156F16D5B2C
	for <lists+linux-media@lfdr.de>; Tue,  4 Apr 2023 10:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233988AbjDDIrJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Apr 2023 04:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233886AbjDDIrH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Apr 2023 04:47:07 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14B5A4
        for <linux-media@vger.kernel.org>; Tue,  4 Apr 2023 01:47:04 -0700 (PDT)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id D2E9C40018;
        Tue,  4 Apr 2023 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1680598023;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6bINFhzmdTa6KM0KrBA3I4IJBmsVMvlZkHyY+xaRQxU=;
        b=dChcN4ngozhcMpNR78w+uaWsrIAVm7KxfS+aUBZJCJXVFBM6f/+RfKc3FMcV4GJF1aTzlN
        4i9uym1+1FD9mojS2vCSmI1v6+o0Kvf52vZhYK6n8jxBFl4quiafnvmiKCcVnXQ4tWjl9A
        qqcWcV4NmN6JlArqb9HCpLB7JKhjezRewCdlVzjI4kb2ijzKvsFP/ZXSf1wk9Mjet9tBa/
        cpPmB/2rpC6S/B3TVnsRbE4ywJvrtBzAW5qy46bK4p4mPNRQK5iaJ8PhlDAHiwuurzoQBR
        mdOBgUXHV1vzdd5W7K8hPll8vVAQgfLzOMSWuZj4zstXCfonxgN+qUb0coX54w==
Date:   Tue, 4 Apr 2023 10:47:00 +0200
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@pengutronix.de
Subject: Re: [PATCH 15/24] staging: media: sunxi: cedrus: Convert to platform
 remove callback returning void
Message-ID: <ZCvkBEddzwUDcdu-@aptenodytes>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
 <20230403154014.2564054-16-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gTlsYDrwY4RlCnWi"
Content-Disposition: inline
In-Reply-To: <20230403154014.2564054-16-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--gTlsYDrwY4RlCnWi
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
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index a43d5ff66716..3c62376c3e94 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -543,7 +543,7 @@ static int cedrus_probe(struct platform_device *pdev)
>  	return ret;
>  }
> =20
> -static int cedrus_remove(struct platform_device *pdev)
> +static void cedrus_remove(struct platform_device *pdev)
>  {
>  	struct cedrus_dev *dev =3D platform_get_drvdata(pdev);
> =20
> @@ -558,8 +558,6 @@ static int cedrus_remove(struct platform_device *pdev)
>  	v4l2_device_unregister(&dev->v4l2_dev);
> =20
>  	cedrus_hw_remove(dev);
> -
> -	return 0;
>  }
> =20
>  static const struct cedrus_variant sun4i_a10_cedrus_variant =3D {
> @@ -706,7 +704,7 @@ static const struct dev_pm_ops cedrus_dev_pm_ops =3D {
> =20
>  static struct platform_driver cedrus_driver =3D {
>  	.probe		=3D cedrus_probe,
> -	.remove		=3D cedrus_remove,
> +	.remove_new	=3D cedrus_remove,
>  	.driver		=3D {
>  		.name		=3D CEDRUS_NAME,
>  		.of_match_table	=3D of_match_ptr(cedrus_dt_match),
> --=20
> 2.39.2
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--gTlsYDrwY4RlCnWi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmQr5AQACgkQ3cLmz3+f
v9HVoAf/ZFWVcxlp+nKEAO4U+Wc8jLdyCLr/KHKRR6ahmcD5jYhiFeROgA8zoYFM
PFQveoIR1/Eu6MERX4KvcEOWnQ960Exa+DJZCFi2mC5dXq+0C97drEX8VC0LoFY+
1NjNTmiXA4ztPohliyR6tMw2AfeEsBk58wX3L6Zo7xNxnpV2cCZOlUMYk+BPiGfT
/FIHYsHUmhsdbqWJdx9h95J0B9GzXxK97aOt/NAfjMjVR9fLv4pFeysqfH44uHFa
uggwWp2oAC8aBWd/tKL/EvjWgrlM1pyL0NwvLCUqrZj04/H7B9x39Mv9VRXIRPR2
ql8OOUb/Od90EdIjkP0Xy87lsVGOSw==
=V70N
-----END PGP SIGNATURE-----

--gTlsYDrwY4RlCnWi--
