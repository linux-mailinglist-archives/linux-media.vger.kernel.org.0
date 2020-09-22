Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C149F273FFD
	for <lists+linux-media@lfdr.de>; Tue, 22 Sep 2020 12:54:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgIVKyT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Sep 2020 06:54:19 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:36708 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgIVKyT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Sep 2020 06:54:19 -0400
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id D7CA83A1297;
        Tue, 22 Sep 2020 10:54:14 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id B86C1E0004;
        Tue, 22 Sep 2020 10:53:49 +0000 (UTC)
Date:   Tue, 22 Sep 2020 12:57:42 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com,
        sakari.ailus@iki.fi, hverkuil@xs4all.nl, jacopo+renesas@jmondi.org,
        luca@lucaceresoli.net, leonl@leopardimaging.com,
        robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
Message-ID: <20200922105742.jsaf7mypwvx3u6bh@uno.localdomain>
References: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
 <1600724379-7324-4-git-send-email-skomatineni@nvidia.com>
 <20200922075501.GB3994831@ulmo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3vvwpxcd5qgs27cq"
Content-Disposition: inline
In-Reply-To: <20200922075501.GB3994831@ulmo>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--3vvwpxcd5qgs27cq
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Thierry

On Tue, Sep 22, 2020 at 09:55:01AM +0200, Thierry Reding wrote:
> On Mon, Sep 21, 2020 at 02:39:39PM -0700, Sowjanya Komatineni wrote:
> > IMX274 has analog 2.8V supply, digital core 1.8V supply, and vddl digital
> > io 1.2V supply which are optional based on camera module design.
> >
> > IMX274 also need external 24Mhz clock and is optional based on
> > camera module design.
> >
> > This patch adds support for IMX274 power on and off to enable and
> > disable these supplies and external clock.
> >
> > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > ---
> >  drivers/media/i2c/imx274.c | 184 +++++++++++++++++++++++++++++++++------------
> >  1 file changed, 134 insertions(+), 50 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> > index 5e515f0..b3057a5 100644
> > --- a/drivers/media/i2c/imx274.c
> > +++ b/drivers/media/i2c/imx274.c
> > @@ -18,7 +18,9 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/of_gpio.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/regmap.h>
> > +#include <linux/regulator/consumer.h>
> >  #include <linux/slab.h>
> >  #include <linux/v4l2-mediabus.h>
> >  #include <linux/videodev2.h>
> > @@ -131,6 +133,15 @@
> >  #define IMX274_TABLE_WAIT_MS			0
> >  #define IMX274_TABLE_END			1
> >
> > +/* regulator supplies */
> > +static const char * const imx274_supply_names[] = {
> > +	"vddl",  /* IF (1.2V) supply */
> > +	"vdig",  /* Digital Core (1.8V) supply */
> > +	"vana",  /* Analog (2.8V) supply */
>
> According to the device tree bindings these should be uppercase. Did I
> miss a patch that updates the bindings?

Yes! Sorry, there's been some chrun around these bindings
https://patchwork.linuxtv.org/project/linux-media/patch/20200917144416.GN834@valkosipuli.retiisi.org.uk/

It should get in for 5.9 as a late fix

>
> I think the preference is for supply names to be lowercase and given
> that there are no users of this binding yet we could update it without
> breaking any existing device trees.
>
> > +};
> > +
> > +#define IMX274_NUM_SUPPLIES ARRAY_SIZE(imx274_supply_names)
> > +
> >  /*
> >   * imx274 I2C operation related structure
> >   */
> > @@ -501,6 +512,8 @@ struct imx274_ctrls {
> >   * @frame_rate: V4L2 frame rate structure
> >   * @regmap: Pointer to regmap structure
> >   * @reset_gpio: Pointer to reset gpio
> > + * @supplies: List of analog and digital supply regulators
> > + * @inck: Pointer to sensor input clock
> >   * @lock: Mutex structure
> >   * @mode: Parameters for the selected readout mode
> >   */
> > @@ -514,6 +527,8 @@ struct stimx274 {
> >  	struct v4l2_fract frame_interval;
> >  	struct regmap *regmap;
> >  	struct gpio_desc *reset_gpio;
> > +	struct regulator_bulk_data supplies[IMX274_NUM_SUPPLIES];
> > +	struct clk *inck;
> >  	struct mutex lock; /* mutex lock for operations */
> >  	const struct imx274_mode *mode;
> >  };
> > @@ -726,6 +741,12 @@ static int imx274_start_stream(struct stimx274 *priv)
> >  {
> >  	int err = 0;
> >
> > +	err = __v4l2_ctrl_handler_setup(&priv->ctrls.handler);
> > +	if (err) {
> > +		dev_err(&priv->client->dev, "Error %d setup controls\n", err);
> > +		return err;
> > +	}
> > +
> >  	/*
> >  	 * Refer to "Standby Cancel Sequence when using CSI-2" in
> >  	 * imx274 datasheet, it should wait 10ms or more here.
> > @@ -767,6 +788,66 @@ static void imx274_reset(struct stimx274 *priv, int rst)
> >  	usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
> >  }
> >
> > +static int imx274_power_on(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct stimx274 *imx274 = to_imx274(sd);
> > +	int ret;
> > +
> > +	/* keep sensor in reset before power on */
> > +	imx274_reset(imx274, 0);
> > +
> > +	ret = clk_prepare_enable(imx274->inck);
> > +	if (ret) {
> > +		dev_err(&imx274->client->dev,
> > +			"Failed to enable input clock: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	ret = regulator_bulk_enable(IMX274_NUM_SUPPLIES, imx274->supplies);
> > +	if (ret) {
> > +		dev_err(&imx274->client->dev,
> > +			"Failed to enable regulators: %d\n", ret);
> > +		goto fail_reg;
> > +	}
> > +
> > +	udelay(2);
>
> This looks like some sort of extra delay to make sure all the supply
> voltages have settled. Should this perhaps be encoded as part of the
> regulator ramp-up times? Or is this really an IC-specific delay that
> is needed for some internal timing?
>
> > +	imx274_reset(imx274, 1);
> > +
> > +	return 0;
> > +
> > +fail_reg:
> > +	clk_disable_unprepare(imx274->inck);
> > +	return ret;
> > +}
> > +
> > +static int imx274_power_off(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct stimx274 *imx274 = to_imx274(sd);
> > +
> > +	imx274_reset(imx274, 0);
> > +
> > +	regulator_bulk_disable(IMX274_NUM_SUPPLIES, imx274->supplies);
> > +
> > +	clk_disable_unprepare(imx274->inck);
> > +
> > +	return 0;
> > +}
> > +
> > +static int imx274_regulators_get(struct device *dev, struct stimx274 *imx274)
> > +{
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < IMX274_NUM_SUPPLIES; i++)
> > +		imx274->supplies[i].supply = imx274_supply_names[i];
> > +
> > +	return devm_regulator_bulk_get(dev, IMX274_NUM_SUPPLIES,
> > +					imx274->supplies);
> > +}
> > +
> >  /**
> >   * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
> >   * @ctrl: V4L2 control to be set
> > @@ -781,6 +862,9 @@ static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
> >  	struct stimx274 *imx274 = to_imx274(sd);
> >  	int ret = -EINVAL;
> >
> > +	if (!pm_runtime_get_if_in_use(&imx274->client->dev))
> > +		return 0;
>
> I'm not sure I understand this, and sorry if this has been discussed
> earlier. Aren't there any other mechanisms in place to ensure that a
> control can only be configured when in use? If so, then is this even
> necessary?
>
> If not, silently ignoring at this point seems like it could cause subtle
> failures by ignoring some control settings and applying others if the
> timing is right.
>
> > +
> >  	dev_dbg(&imx274->client->dev,
> >  		"%s : s_ctrl: %s, value: %d\n", __func__,
> >  		ctrl->name, ctrl->val);
> > @@ -811,6 +895,8 @@ static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
> >  		break;
> >  	}
> >
> > +	pm_runtime_put(&imx274->client->dev);
> > +
> >  	return ret;
> >  }
> >
> > @@ -1269,10 +1355,8 @@ static int imx274_s_frame_interval(struct v4l2_subdev *sd,
> >   *
> >   * Return: 0 on success, errors otherwise
> >   */
> > -static int imx274_load_default(struct stimx274 *priv)
> > +static void imx274_load_default(struct stimx274 *priv)
> >  {
> > -	int ret;
> > -
> >  	/* load default control values */
> >  	priv->frame_interval.numerator = 1;
> >  	priv->frame_interval.denominator = IMX274_DEF_FRAME_RATE;
> > @@ -1280,29 +1364,6 @@ static int imx274_load_default(struct stimx274 *priv)
> >  	priv->ctrls.gain->val = IMX274_DEF_GAIN;
> >  	priv->ctrls.vflip->val = 0;
> >  	priv->ctrls.test_pattern->val = TEST_PATTERN_DISABLED;
> > -
> > -	/* update frame rate */
> > -	ret = imx274_set_frame_interval(priv,
> > -					priv->frame_interval);
> > -	if (ret)
> > -		return ret;
> > -
> > -	/* update exposure time */
> > -	ret = v4l2_ctrl_s_ctrl(priv->ctrls.exposure, priv->ctrls.exposure->val);
> > -	if (ret)
> > -		return ret;
> > -
> > -	/* update gain */
> > -	ret = v4l2_ctrl_s_ctrl(priv->ctrls.gain, priv->ctrls.gain->val);
> > -	if (ret)
> > -		return ret;
> > -
> > -	/* update vflip */
> > -	ret = v4l2_ctrl_s_ctrl(priv->ctrls.vflip, priv->ctrls.vflip->val);
> > -	if (ret)
> > -		return ret;
>
> This is not moved to somewhere else, so I assume the equivalent will
> happen somewhere higher up in the stack? Might be worth mentioning in
> the commit message why this can be dropped.
>
> Thierry



--3vvwpxcd5qgs27cq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl9p2KYACgkQcjQGjxah
VjxuKA/7BtUBwbUr1r7qMCqjhos0yPrOlR6WuVcozG0soKjjVFHXJjkuLSiM52JF
KfrZD6l3cU1QvQK0SslzRy5Q0grpasnrERNSve5jBg2lU9zwh50BIFDrxPbW+teE
yxeyweNjvScwrCLa0/dPQPpakq+LrdC1MrnEkZobIG7InxPsBv6TRtluZeLcnW4T
49VYzUEcr1NGBpLmmNtdofAtm1SL0s0HqpZCZhCXBNct1DG+zW2EkFzTAQ7dIpky
suIfAw2t5oArfjCAJFbafIQcRmnn1FgyyNancbi4CXuGv4DcGczrvjDqZTMINL4M
7/zKU3/TyT2dxMXZrA0e0dJVS7Bjc8vRJE49UNJ3HnNwoYPk20wKTNbG4JxbTP6y
hXdiTClqXaQQj51d520LTP+RLtpK34NPCS6lRcVuzHMNll65R3QoNHiFced9ugoz
OxPUHEtJCB6ilR4WYpWU0anyzR5MIPZFTaHFxpFbrsiK5LvQp6uEpzYBQkTVk/Go
qBu3nr2nSzEz4jUYuL0UNRY4sDrvazv/JFEKCmXIs+T3q6S+fGhvqGSdR5oKOepT
QcJ4N+s3QtINAJtZxxu54txMLsKlnBI6gutUCibwM6NqZlubzp94gAreAqljqmZk
n9WnlfKZCmpSz3RKyjj1C55QCNDW1ThHyCV65Ah4oiCZq/AIOGM=
=K5vx
-----END PGP SIGNATURE-----

--3vvwpxcd5qgs27cq--
