Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D58E42E7C01
	for <lists+linux-media@lfdr.de>; Wed, 30 Dec 2020 20:10:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgL3TKF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Dec 2020 14:10:05 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:59446 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgL3TKF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Dec 2020 14:10:05 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 594AD1C0B79; Wed, 30 Dec 2020 20:09:07 +0100 (CET)
Date:   Wed, 30 Dec 2020 20:09:07 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>, newbytee@protonmail.com,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-media@vger.kernel.org, phone-devel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH 2/2 v7] leds: rt8515: Add Richtek RT8515 LED driver
Message-ID: <20201230190907.GE25903@duo.ucw.cz>
References: <20201201101350.1401956-1-linus.walleij@linaro.org>
 <20201201101350.1401956-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Ns7jmDPpOpCD+GE/"
Content-Disposition: inline
In-Reply-To: <20201201101350.1401956-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--Ns7jmDPpOpCD+GE/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> We do not have a proper datasheet for the RT8515 but
> it turns out that RT9387A has a public datasheet and
> is essentially the same chip. We designed the driver
> in accordance with this datasheet. The day someone
> needs to drive a RT9387A this driver can probably
> easily be augmented to handle that chip too.

Please move this to the comment in the sources... perhaps with url for
the documenation.

> +/* This is setting the torch light level */
> +static int rt8515_led_brightness_set(struct led_classdev *led,
> +				     enum led_brightness brightness)
> +{
> +	struct led_classdev_flash *fled =3D lcdev_to_flcdev(led);
> +	struct rt8515 *rt =3D to_rt8515(fled);
> +
> +	mutex_lock(&rt->lock);
> +
> +	if (brightness =3D=3D LED_OFF) {
> +		/* Off */
> +		gpiod_set_value(rt->enable_flash, 0);
> +		gpiod_set_value(rt->enable_torch, 0);
> +	} else if (brightness < RT8515_TORCH_MAX) {
> +		/* Step it up to movie mode brightness using the flash pin */
> +		rt8515_gpio_brightness_commit(rt->enable_torch, brightness);
> +	} else {
> +		/* Max torch brightness requested */
> +		gpiod_set_value(rt->enable_torch, 1);
> +	}
> +
> +	mutex_unlock(&rt->lock);

Do you need to somehow reset the LED to lowest brightness before
rt8515_gpio_brightness_commit()?

> +	ret1 =3D fwnode_property_read_u32(rt->dev->fwnode, resistance, &res);
> +	ret2 =3D fwnode_property_read_u32(led, max_ua_prop, &ua);
> +
> +	/* No info in DT, OK go with hardware maxima */
> +	if (ret1 && ret2) {
> +		max_ma =3D RT8515_MAX_IOUT_MA;
> +		max_intensity =3D hw_max;
> +		goto out_assign_max;
> +	}
> +
> +	if (ret1 || ret2) {
> +		dev_err(rt->dev,
> +			"either %s or %s missing from DT, using HW max\n",
> +			resistance, max_ua_prop);
> +		max_ma =3D RT8515_MAX_IOUT_MA;
> +		max_intensity =3D hw_max;
> +		goto out_assign_max;
> +	}

I'd go with some minimum values if we don't have complete information
=66rom devicetree.

> +	/* Create a V4L2 Flash device if V4L2 flash is enabled */
> +	rt->v4l2_flash =3D v4l2_flash_init(dev, child, fled, NULL, &v4l2_sd_cfg=
);
> +	if (IS_ERR(rt->v4l2_flash)) {
> +		ret =3D PTR_ERR(rt->v4l2_flash);
> +		dev_err(dev, "failed to register V4L2 flash device (%d)\n",
> +			ret);
> +		/*
> +		 * Continue without the V4L2 flash
> +		 * (we still have the classdev)
> +		 */
> +	}
> +
> +	return 0;
> +}
> +
> +static int rt8515_remove(struct platform_device *pdev)
> +{
> +	struct rt8515 *rt =3D platform_get_drvdata(pdev);
> +
> +	v4l2_flash_release(rt->v4l2_flash);

Is it cool to call v4l2_flash_release() with error pointer?

> +MODULE_LICENSE("GPL v2");

v2+, iirc?

Driver looks good, thanks!
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--Ns7jmDPpOpCD+GE/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX+zQUwAKCRAw5/Bqldv6
8pDYAJ9oFNF11x4gDzsv2TAwdLw2H1mdMQCeO/jI7kivtQ5bOnt3g4TeqySJv5I=
=T3Cx
-----END PGP SIGNATURE-----

--Ns7jmDPpOpCD+GE/--
