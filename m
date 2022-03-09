Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E70E44D30F8
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 15:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233534AbiCIOZT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 09:25:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230237AbiCIOZS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 09:25:18 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D63810DA68
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 06:24:17 -0800 (PST)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id CD519C0008;
        Wed,  9 Mar 2022 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1646835856;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0ZN9jSly+fcddySCvwE3oSSJN64nh0yp/bM9JTXe8Wg=;
        b=Cneo+92nSgq8xOg7aVFI16YypJcPL7OWdQoAPq9NHES3APLpO0pRwJsO8tud1BfOfpohe8
        voTsfopaepZKXEzn2jtrpC+326DxRX0pEmDUSkM7oP1q+/hmsugiaXeGloQv11uz3Qw4I9
        AmyLmsXvHCGNswhYB1idgoTz+qJpxdyDiRiJbTnjQ8EM1NlUSa+NNGEJyG4bu/K0kxvyg4
        dTaldZSW12iHMyXTYfh9Q4PZSfHA1ezSrVTAoI72oX2d7psekcL6tAVuk6qj3LL8qNFeZ/
        v01JA+3mFGEIz0rKjnufTeIJmrXsuJwBchVw6A8j+6Ewa+wkI/B7tM5Ci/Ah+w==
Date:   Wed, 9 Mar 2022 15:24:15 +0100
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Paul Elder <paul.elder@ideasonboard.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ov5640: Use runtime PM
Message-ID: <Yii4jxm8MLxlC0Lb@aptenodytes>
References: <20220309113232.1182362-1-paul.elder@ideasonboard.com>
 <20220309134757.43uoopt5qbgonuup@uno.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FrNrtn8KNAR6uPk2"
Content-Disposition: inline
In-Reply-To: <20220309134757.43uoopt5qbgonuup@uno.localdomain>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--FrNrtn8KNAR6uPk2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jacopo,

On Wed 09 Mar 22, 14:47, Jacopo Mondi wrote:
> Hi Paul,
>=20
> On Wed, Mar 09, 2022 at 08:32:32PM +0900, Paul Elder wrote:
> > Switch to using runtime PM for power management.
>=20
> What happens if CONFIG_PM is not selected ? Two of the existing
> sensor drivers in mainline depends on PM but not the ov5640, and I'm
> not sure we should depend on PM to be able to compile the module.

I think the direction for the media subsystem is to use runtime pm
everywhere possible, which is not opional (like traditional PM) so
I really thinks it makes sense to have the sensor driver depend on it.

The alternative would probably be to keep the s_power implementation
when !CONFIG_PM which is certinaly not something we want.

> Also I see very few #ifdef CONFIG_PM in drivers/media/i2c so either
> the CONFIG_PM dependency is not an issue or most sensor drivers don't
> care.

This seems like an overlook, I think drivers that rely on runtime pm
do need to depend on PM in Kconfig.

Cheers,

Paul


> Also, could you base this patch on sakari's tree master branc which
> contains my ov5640 patches that will land in v5.18 to avoid future
> rebases ?
> https://git.linuxtv.org/sailus/media_tree.git
>=20
> >
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > ---
> >  drivers/media/i2c/ov5640.c | 108 ++++++++++++++++++++++---------------
> >  1 file changed, 64 insertions(+), 44 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > index ddbd71394db3..8e95096ba67b 100644
> > --- a/drivers/media/i2c/ov5640.c
> > +++ b/drivers/media/i2c/ov5640.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/init.h>
> >  #include <linux/module.h>
> >  #include <linux/of_device.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> > @@ -240,7 +241,7 @@ struct ov5640_dev {
> >  	/* lock to protect all members below */
> >  	struct mutex lock;
> >
> > -	int power_count;
> > +	bool powered;
>=20
> 'powered' is never reset to false when the chip is powered off.
>=20
> I would avoid tracking the power state manually but rely instead
> on the value returned from pm_runtime_get_if_in_use().
>=20
> >
> >  	struct v4l2_mbus_framefmt fmt;
> >  	bool pending_fmt_change;
> > @@ -2148,6 +2149,8 @@ static int ov5640_set_power(struct ov5640_dev *se=
nsor, bool on)
> >  	if (!on)
> >  		ov5640_set_power_off(sensor);
> >
> > +	sensor->powered =3D on;
> > +
> >  	return 0;
> >
> >  power_off:
> > @@ -2157,37 +2160,6 @@ static int ov5640_set_power(struct ov5640_dev *s=
ensor, bool on)
> >
> >  /* --------------- Subdev Operations --------------- */
> >
> > -static int ov5640_s_power(struct v4l2_subdev *sd, int on)
> > -{
> > -	struct ov5640_dev *sensor =3D to_ov5640_dev(sd);
> > -	int ret =3D 0;
> > -
> > -	mutex_lock(&sensor->lock);
> > -
> > -	/*
> > -	 * If the power count is modified from 0 to !=3D 0 or from !=3D 0 to =
0,
> > -	 * update the power state.
> > -	 */
> > -	if (sensor->power_count =3D=3D !on) {
> > -		ret =3D ov5640_set_power(sensor, !!on);
> > -		if (ret)
> > -			goto out;
> > -	}
> > -
> > -	/* Update the power count. */
> > -	sensor->power_count +=3D on ? 1 : -1;
> > -	WARN_ON(sensor->power_count < 0);
> > -out:
> > -	mutex_unlock(&sensor->lock);
> > -
> > -	if (on && !ret && sensor->power_count =3D=3D 1) {
> > -		/* restore controls */
> > -		ret =3D v4l2_ctrl_handler_setup(&sensor->ctrls.handler);
> > -	}
> > -
> > -	return ret;
> > -}
> > -
> >  static int ov5640_try_frame_interval(struct ov5640_dev *sensor,
> >  				     struct v4l2_fract *fi,
> >  				     u32 width, u32 height)
> > @@ -2663,6 +2635,9 @@ static int ov5640_g_volatile_ctrl(struct v4l2_ctr=
l *ctrl)
> >
> >  	/* v4l2_ctrl_lock() locks our own mutex */
> >
> > +	if (!sensor->powered)
> > +		return 0;
> > +
> >  	switch (ctrl->id) {
> >  	case V4L2_CID_AUTOGAIN:
> >  		val =3D ov5640_get_gain(sensor);
> > @@ -2694,7 +2669,7 @@ static int ov5640_s_ctrl(struct v4l2_ctrl *ctrl)
> >  	 * not apply any controls to H/W at this time. Instead
> >  	 * the controls will be restored right after power-up.
> >  	 */
> > -	if (sensor->power_count =3D=3D 0)
> > +	if (!sensor->powered)
> >  		return 0;
> >
> >  	switch (ctrl->id) {
> > @@ -2945,6 +2920,12 @@ static int ov5640_s_stream(struct v4l2_subdev *s=
d, int enable)
> >  	struct ov5640_dev *sensor =3D to_ov5640_dev(sd);
> >  	int ret =3D 0;
> >
> > +	if (enable) {
> > +		ret =3D pm_runtime_resume_and_get(&sensor->i2c_client->dev);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> >  	mutex_lock(&sensor->lock);
> >
> >  	if (sensor->streaming =3D=3D !enable) {
> > @@ -2969,13 +2950,17 @@ static int ov5640_s_stream(struct v4l2_subdev *=
sd, int enable)
> >  		if (!ret)
> >  			sensor->streaming =3D enable;
> >  	}
> > +
> >  out:
> >  	mutex_unlock(&sensor->lock);
> > +
> > +	if (!enable || ret)
> > +		pm_runtime_put(&sensor->i2c_client->dev);
> > +
> >  	return ret;
> >  }
> >
> >  static const struct v4l2_subdev_core_ops ov5640_core_ops =3D {
> > -	.s_power =3D ov5640_s_power,
> >  	.log_status =3D v4l2_ctrl_subdev_log_status,
> >  	.subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> >  	.unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
> > @@ -3019,15 +3004,11 @@ static int ov5640_check_chip_id(struct ov5640_d=
ev *sensor)
> >  	int ret =3D 0;
> >  	u16 chip_id;
> >
> > -	ret =3D ov5640_set_power_on(sensor);
> > -	if (ret)
> > -		return ret;
> > -
> >  	ret =3D ov5640_read_reg16(sensor, OV5640_REG_CHIP_ID, &chip_id);
> >  	if (ret) {
> >  		dev_err(&client->dev, "%s: failed to read chip identifier\n",
> >  			__func__);
> > -		goto power_off;
> > +		return ret;
> >  	}
> >
> >  	if (chip_id !=3D 0x5640) {
> > @@ -3036,8 +3017,6 @@ static int ov5640_check_chip_id(struct ov5640_dev=
 *sensor)
> >  		ret =3D -ENXIO;
> >  	}
> >
> > -power_off:
> > -	ov5640_set_power_off(sensor);
> >  	return ret;
> >  }
> >
> > @@ -3158,20 +3137,35 @@ static int ov5640_probe(struct i2c_client *clie=
nt)
> >
> >  	mutex_init(&sensor->lock);
> >
> > -	ret =3D ov5640_check_chip_id(sensor);
> > +	ret =3D ov5640_init_controls(sensor);
> >  	if (ret)
> >  		goto entity_cleanup;
> >
> > -	ret =3D ov5640_init_controls(sensor);
> > +	ret =3D ov5640_set_power(sensor, true);
> > +	if (ret)
> > +		goto free_ctrls;
> > +
> > +	ret =3D ov5640_check_chip_id(sensor);
> >  	if (ret)
> >  		goto entity_cleanup;
>=20
> Should you power_off if identifying the chip fails ?
>=20
> On the other hand, enabling runtime_pm before identifying the chip
> might help having a simpler error handling path ?
>=20
> Something like:
>=20
> ...
> 	pm_runtime_set_active(dev);
> 	pm_runtime_enable(dev);
> 	pm_runtime_get(dev);
>=20
> 	ret =3D ov5640_check_chip_id(sensor);
> 	if (ret)
> 		goto err_pm_runtime;
>=20
> 	ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
> 	if (ret)
> 		goto err_pm_runtime;
>=20
> 	pm_runtime_set_autosuspend_delay(dev, 1000);
> 	pm_runtime_use_autosuspend(dev);
> 	pm_runtime_put_autosuspend(dev);
>=20
> 	return 0;
>=20
> err_pm_runtime:
> 	pm_runtime_put(dev);
> 	pm_runtime_disable(dev);
> 	pm_runtime_put_noidle(dev);
> ...
>=20
> Tested by forcing an early return from ov5640_check_chip_id() and I
> get no warnings about unbalanced runtime_pm counters.
>=20
> >
> > +	pm_runtime_set_active(dev);
> > +	pm_runtime_get_noresume(dev);
> > +	pm_runtime_enable(dev);
> > +
> >  	ret =3D v4l2_async_register_subdev_sensor(&sensor->sd);
> >  	if (ret)
> > -		goto free_ctrls;
> > +		goto err_pm_runtime;
> > +
> > +	pm_runtime_set_autosuspend_delay(dev, 1000);
>=20
> Is this dealy required, where does it come from ?
>=20
> Thanks
>   j
>=20
>=20
> > +	pm_runtime_use_autosuspend(dev);
> > +	pm_runtime_put_autosuspend(dev);
> >
> >  	return 0;
> >
> > +err_pm_runtime:
> > +	pm_runtime_disable(dev);
> > +	pm_runtime_put_noidle(dev);
> >  free_ctrls:
> >  	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
> >  entity_cleanup:
> > @@ -3193,6 +3187,31 @@ static int ov5640_remove(struct i2c_client *clie=
nt)
> >  	return 0;
> >  }
> >
> > +static int __maybe_unused ov5640_sensor_suspend(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +	struct ov5640_dev *ov5640 =3D to_ov5640_dev(sd);
> > +
> > +	return ov5640_set_power(ov5640, false);
> > +}
> > +
> > +static int __maybe_unused ov5640_sensor_resume(struct device *dev)
> > +{
> > +	struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> > +	struct ov5640_dev *ov5640 =3D to_ov5640_dev(sd);
> > +	int ret;
> > +
> > +	ret =3D ov5640_set_power(ov5640, true);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return v4l2_ctrl_handler_setup(&ov5640->ctrls.handler);
> > +}
> > +
> > +static const struct dev_pm_ops ov5640_pm_ops =3D {
> > +	SET_RUNTIME_PM_OPS(ov5640_sensor_suspend, ov5640_sensor_resume, NULL)
> > +};
> > +
> >  static const struct i2c_device_id ov5640_id[] =3D {
> >  	{"ov5640", 0},
> >  	{},
> > @@ -3209,6 +3228,7 @@ static struct i2c_driver ov5640_i2c_driver =3D {
> >  	.driver =3D {
> >  		.name  =3D "ov5640",
> >  		.of_match_table	=3D ov5640_dt_ids,
> > +		.pm =3D &ov5640_pm_ops,
> >  	},
> >  	.id_table =3D ov5640_id,
> >  	.probe_new =3D ov5640_probe,
> > --
> > 2.30.2
> >

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--FrNrtn8KNAR6uPk2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmIouI4ACgkQ3cLmz3+f
v9EEPQf/RZHa9nYGVRrhuKwALpMn0XES/6foTaYA5kXmTs1chGwdchqMVXZeSUNM
4JeY89w8E1XehhMdjz4a6BqLoYE3DfvN9nkZQGfUdldKfKWcpkkgLOBamMMK+F7R
Y7UXuzItybi3I/AMqSlRxDIcQSNpuv9egfV/6QeLzdZXxFIn8q3amWuWKQ3Bpwyv
/1H5Yxr9mi4BA9QqicHMTolJeXmu24X4yR802xRZMZjnzc8NUhEix2TycGNswrZD
hypsw3rw5CO9EkAW2yYVQ4Y17O0pMr8ZJgPDM1NoRBwmhuWQnFcPMx5FwzdkZq18
Sy0lTDFnvgzdkiX0D0dImRLWHh1liw==
=/6t/
-----END PGP SIGNATURE-----

--FrNrtn8KNAR6uPk2--
