Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C882F273CB5
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 09:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgIVHzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 03:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726749AbgIVHzF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 03:55:05 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21179C061755;
        Tue, 22 Sep 2020 00:55:05 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id n13so15205715edo.10;
        Tue, 22 Sep 2020 00:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8Y0eoAAVvTlQTtClTNZT8dMBuCeS4tXBS0lHaKFesUQ=;
        b=LR8zaOyduG95uWj2psOzVGyWOgCXlDpA3baG2ZYrARU/YpfY6JkeMDDFNftujghYGF
         1Ob37cdTndqaOFVofy5VF8day8zQhcbErMRfLe0b383OyBzt3RrCUL/r+IpueIf0h17s
         XZM2v3FApPRMtdbImsi+ktYZTnooftBgq2dAdiYKdEAGLb9ZVgdlfpdVH88LJlo1klh0
         z3OkQLwQKS4fI1/S9/VboDnth8XraOxVupgUUq0q6Sogfr6K+8oJ6KdLeiqssOqx9otH
         /oWS0/sC/+P7CBLwbR6x4+THZCP0oBfvdcXVgJ+Odvu/o4+UNfpRjAlrzyHecom0FBN2
         5sdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8Y0eoAAVvTlQTtClTNZT8dMBuCeS4tXBS0lHaKFesUQ=;
        b=Z2hYYAG9/BqEkYofLZ49VeeS17WAgmVAnsDthNjExM4dFlM2YByUAzwJr83HW3Ou4g
         pXDZc17hHtYyy4OFx60bPybcjeEz/E1grxT9ltqe9CqQ+dtNj9VsZtOqZmdT1wlBcTOi
         iLvPdcg39NPR+XqwESALiZ91ILZm73fnP3UnQhHG6ryTfZMwXY+DoOG4n1dcFa+5oL18
         SHJC9SjKZgO9NjAF4bK3fU4ctjMSaZzHLk/Aw2FrAM8y5a+VrqUMGDuREzNpNeerQkTg
         NFLIkFmRqwn68hWIMrjBtxy2HkL961J1ptUGoS4Oh/F7GHANsJB8Jlo5eW9R102AeDJt
         Osuw==
X-Gm-Message-State: AOAM533IJoFp507pMwJ9Q+DJAkcf/+2kk03svjcFvTAJp3sCxFTsqTp7
        nUcAb58vMwss4GxNRxJDEK3H/k9wRfY=
X-Google-Smtp-Source: ABdhPJw+QZf3tnq9ZsQ1WGTaT/9K/AGje73UG18a9x2AoWbh5ArRYnmD0zVTBbOF7/uBFAKNDGZ++g==
X-Received: by 2002:a50:fb99:: with SMTP id e25mr2614476edq.281.1600761303593;
        Tue, 22 Sep 2020 00:55:03 -0700 (PDT)
Received: from localhost (pd9e51aa4.dip0.t-ipconnect.de. [217.229.26.164])
        by smtp.gmail.com with ESMTPSA id gh21sm10693086ejb.32.2020.09.22.00.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 00:55:02 -0700 (PDT)
Date:   Tue, 22 Sep 2020 09:55:01 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     jonathanh@nvidia.com, sakari.ailus@iki.fi, hverkuil@xs4all.nl,
        jacopo+renesas@jmondi.org, luca@lucaceresoli.net,
        leonl@leopardimaging.com, robh+dt@kernel.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
Message-ID: <20200922075501.GB3994831@ulmo>
References: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
 <1600724379-7324-4-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline
In-Reply-To: <1600724379-7324-4-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2020 at 02:39:39PM -0700, Sowjanya Komatineni wrote:
> IMX274 has analog 2.8V supply, digital core 1.8V supply, and vddl digital
> io 1.2V supply which are optional based on camera module design.
>=20
> IMX274 also need external 24Mhz clock and is optional based on
> camera module design.
>=20
> This patch adds support for IMX274 power on and off to enable and
> disable these supplies and external clock.
>=20
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/media/i2c/imx274.c | 184 +++++++++++++++++++++++++++++++++------=
------
>  1 file changed, 134 insertions(+), 50 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index 5e515f0..b3057a5 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -18,7 +18,9 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/of_gpio.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/v4l2-mediabus.h>
>  #include <linux/videodev2.h>
> @@ -131,6 +133,15 @@
>  #define IMX274_TABLE_WAIT_MS			0
>  #define IMX274_TABLE_END			1
> =20
> +/* regulator supplies */
> +static const char * const imx274_supply_names[] =3D {
> +	"vddl",  /* IF (1.2V) supply */
> +	"vdig",  /* Digital Core (1.8V) supply */
> +	"vana",  /* Analog (2.8V) supply */

According to the device tree bindings these should be uppercase. Did I
miss a patch that updates the bindings?

I think the preference is for supply names to be lowercase and given
that there are no users of this binding yet we could update it without
breaking any existing device trees.

> +};
> +
> +#define IMX274_NUM_SUPPLIES ARRAY_SIZE(imx274_supply_names)
> +
>  /*
>   * imx274 I2C operation related structure
>   */
> @@ -501,6 +512,8 @@ struct imx274_ctrls {
>   * @frame_rate: V4L2 frame rate structure
>   * @regmap: Pointer to regmap structure
>   * @reset_gpio: Pointer to reset gpio
> + * @supplies: List of analog and digital supply regulators
> + * @inck: Pointer to sensor input clock
>   * @lock: Mutex structure
>   * @mode: Parameters for the selected readout mode
>   */
> @@ -514,6 +527,8 @@ struct stimx274 {
>  	struct v4l2_fract frame_interval;
>  	struct regmap *regmap;
>  	struct gpio_desc *reset_gpio;
> +	struct regulator_bulk_data supplies[IMX274_NUM_SUPPLIES];
> +	struct clk *inck;
>  	struct mutex lock; /* mutex lock for operations */
>  	const struct imx274_mode *mode;
>  };
> @@ -726,6 +741,12 @@ static int imx274_start_stream(struct stimx274 *priv)
>  {
>  	int err =3D 0;
> =20
> +	err =3D __v4l2_ctrl_handler_setup(&priv->ctrls.handler);
> +	if (err) {
> +		dev_err(&priv->client->dev, "Error %d setup controls\n", err);
> +		return err;
> +	}
> +
>  	/*
>  	 * Refer to "Standby Cancel Sequence when using CSI-2" in
>  	 * imx274 datasheet, it should wait 10ms or more here.
> @@ -767,6 +788,66 @@ static void imx274_reset(struct stimx274 *priv, int =
rst)
>  	usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
>  }
> =20
> +static int imx274_power_on(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct stimx274 *imx274 =3D to_imx274(sd);
> +	int ret;
> +
> +	/* keep sensor in reset before power on */
> +	imx274_reset(imx274, 0);
> +
> +	ret =3D clk_prepare_enable(imx274->inck);
> +	if (ret) {
> +		dev_err(&imx274->client->dev,
> +			"Failed to enable input clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D regulator_bulk_enable(IMX274_NUM_SUPPLIES, imx274->supplies);
> +	if (ret) {
> +		dev_err(&imx274->client->dev,
> +			"Failed to enable regulators: %d\n", ret);
> +		goto fail_reg;
> +	}
> +
> +	udelay(2);

This looks like some sort of extra delay to make sure all the supply
voltages have settled. Should this perhaps be encoded as part of the
regulator ramp-up times? Or is this really an IC-specific delay that
is needed for some internal timing?

> +	imx274_reset(imx274, 1);
> +
> +	return 0;
> +
> +fail_reg:
> +	clk_disable_unprepare(imx274->inck);
> +	return ret;
> +}
> +
> +static int imx274_power_off(struct device *dev)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> +	struct stimx274 *imx274 =3D to_imx274(sd);
> +
> +	imx274_reset(imx274, 0);
> +
> +	regulator_bulk_disable(IMX274_NUM_SUPPLIES, imx274->supplies);
> +
> +	clk_disable_unprepare(imx274->inck);
> +
> +	return 0;
> +}
> +
> +static int imx274_regulators_get(struct device *dev, struct stimx274 *im=
x274)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < IMX274_NUM_SUPPLIES; i++)
> +		imx274->supplies[i].supply =3D imx274_supply_names[i];
> +
> +	return devm_regulator_bulk_get(dev, IMX274_NUM_SUPPLIES,
> +					imx274->supplies);
> +}
> +
>  /**
>   * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
>   * @ctrl: V4L2 control to be set
> @@ -781,6 +862,9 @@ static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
>  	struct stimx274 *imx274 =3D to_imx274(sd);
>  	int ret =3D -EINVAL;
> =20
> +	if (!pm_runtime_get_if_in_use(&imx274->client->dev))
> +		return 0;

I'm not sure I understand this, and sorry if this has been discussed
earlier. Aren't there any other mechanisms in place to ensure that a
control can only be configured when in use? If so, then is this even
necessary?

If not, silently ignoring at this point seems like it could cause subtle
failures by ignoring some control settings and applying others if the
timing is right.

> +
>  	dev_dbg(&imx274->client->dev,
>  		"%s : s_ctrl: %s, value: %d\n", __func__,
>  		ctrl->name, ctrl->val);
> @@ -811,6 +895,8 @@ static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
> =20
> +	pm_runtime_put(&imx274->client->dev);
> +
>  	return ret;
>  }
> =20
> @@ -1269,10 +1355,8 @@ static int imx274_s_frame_interval(struct v4l2_sub=
dev *sd,
>   *
>   * Return: 0 on success, errors otherwise
>   */
> -static int imx274_load_default(struct stimx274 *priv)
> +static void imx274_load_default(struct stimx274 *priv)
>  {
> -	int ret;
> -
>  	/* load default control values */
>  	priv->frame_interval.numerator =3D 1;
>  	priv->frame_interval.denominator =3D IMX274_DEF_FRAME_RATE;
> @@ -1280,29 +1364,6 @@ static int imx274_load_default(struct stimx274 *pr=
iv)
>  	priv->ctrls.gain->val =3D IMX274_DEF_GAIN;
>  	priv->ctrls.vflip->val =3D 0;
>  	priv->ctrls.test_pattern->val =3D TEST_PATTERN_DISABLED;
> -
> -	/* update frame rate */
> -	ret =3D imx274_set_frame_interval(priv,
> -					priv->frame_interval);
> -	if (ret)
> -		return ret;
> -
> -	/* update exposure time */
> -	ret =3D v4l2_ctrl_s_ctrl(priv->ctrls.exposure, priv->ctrls.exposure->va=
l);
> -	if (ret)
> -		return ret;
> -
> -	/* update gain */
> -	ret =3D v4l2_ctrl_s_ctrl(priv->ctrls.gain, priv->ctrls.gain->val);
> -	if (ret)
> -		return ret;
> -
> -	/* update vflip */
> -	ret =3D v4l2_ctrl_s_ctrl(priv->ctrls.vflip, priv->ctrls.vflip->val);
> -	if (ret)
> -		return ret;

This is not moved to somewhere else, so I assume the equivalent will
happen somewhere higher up in the stack? Might be worth mentioning in
the commit message why this can be dropped.

Thierry

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9prdIACgkQ3SOs138+
s6Go5RAAsl5nrRCHjpW/doOtwSxgurImfXBAlaiTHZa+XbQWVDe4M8GOUZCT3jTF
ToWTmnqNRcsNdy5x6yWftMz4ZpAt2eV9L3o1YFAFlGD93oXSB+Eb+C4U97oJXbln
foamDXzIrNJdDANMj+BombChMNuFoWrTfGoOPsn2sH9TUjjMIgf3HGLJNMR3SasI
0vSkH7qc/fdeNzEQ9Zs6J6cX5mW/D2j73nd90RhOF8XDT+ke68epWJbnbcWwkfR+
DKoE5XHE9dHUzdqZpzJxY0XzSL2O1inBHwB10NuGcvYi/im+EDjf7Fi0ej/LANPl
My+rjipeQYPauIJdnsxMgVcmgmn3fgLya9WlPW9T0gMBG2Ky3eHWR0OOiTIjuwMU
NenxOdQ2JAU+qTNnxL/OPzItGK14lZekQNHgKbcVTk8N2YPKHzw9Ki2AhvE3d0nf
PFum/eFsmd6HUAgyvpGuH2J9lcDMIrrKA1jJvKEycDrFTzx5Iv8DkuV3l+OEbN2L
H5/uCl6WGafy9VbNIMDp3E7MPb4KHTQ4Em3wy4g0MPpb18lk+oCx8T98dBz9I8aV
HDhJ/s2I5XiRgLTlPsDOUX2JPcu2UrCfUG90s8VN+AzpUWzXU5n9c1OrbtaacLe1
9Fr56ytJr5L3gvW30CYMaaWyeGtolv4gZruXBsQA1ifqOGzpAQQ=
=3iqU
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
