Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834AE2752EF
	for <lists+linux-media@lfdr.de>; Wed, 23 Sep 2020 10:07:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgIWIHL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 04:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgIWIHL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 04:07:11 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6290C061755;
        Wed, 23 Sep 2020 01:07:10 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id z9so6050697wmk.1;
        Wed, 23 Sep 2020 01:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N8cChDI6BoIwfM3shBxMQgVKudKH0N5us7hcvSiIHqA=;
        b=oSLXxfEgqbUHx6bqxOqNSp//LT2HAOl+tbAXxn4ZqIci98TL19DLTfnKOT8KRubzcQ
         4SGHCFU7VVIi7b34yI+Eew3V74TXqHOdTePzpa5gCf12hbZ4lcChRq981IWfxKOwVgqW
         Zg4U/olhz7ShW1ZrZ2gAk/ceu6PDBOz2SHeiExNgHmYx2MJlcpEMibc52qte++omuP4b
         oc1keIeYsai5uXDIRdiN8ZCc9sKiTKrr7H6c27gqaD1cZcOSUZQhMpHAagVgxtI+xP4R
         NikTfDRkdAesYGxoOMAiYjRPBbDdneqwOg95qj98Q1zdbSKre/M1+esAv995fndjDL5O
         Z1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N8cChDI6BoIwfM3shBxMQgVKudKH0N5us7hcvSiIHqA=;
        b=p5fcCZpiH5ySIorN29slXyZOLwlazNmAywEaVU8KRz6W1uBhIy4Cdvj83vrc3rtCNq
         Rwt/ddw76Jf6cQ5qz5o7nGhx7JSi5UnL0vhtUBr24weqh2Zwx3wrggNS2+zqMhb4zy1S
         ZBI297MXogjOm3eW0n8saYI4imI05nK6d337/E8ZM7UwDkRdqG5qrgGLJNaw7FN02orQ
         8XbQB97QOBJC+zdUgP+8K5gt2MexdR9U4Bk/djAYFiPbDZtWYLZK10+k2rRtFHJ+/AKP
         4MsjNGhf0jan8tEfgFs0ZWMQnmwzefHv4KfDvPtRLiPWn7Y77IsSam2Mt9N7PlFxu1r+
         x2bw==
X-Gm-Message-State: AOAM53221ClrSxwfc7GUZR1+jVJIPVbM8R8Fx7toji6bWAPudxjj39c7
        IR0XoMV/+VWGLgnMyMecfVg=
X-Google-Smtp-Source: ABdhPJybg3UZISofYgRYkr+y3WZQmLNqy2V8cPLn+45YsegnKrkO0nmKiQcapf9h/FIKp8XewK47uw==
X-Received: by 2002:a7b:c090:: with SMTP id r16mr5167426wmh.56.1600848429273;
        Wed, 23 Sep 2020 01:07:09 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id d13sm28907111wrp.44.2020.09.23.01.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 01:07:08 -0700 (PDT)
Date:   Wed, 23 Sep 2020 10:07:05 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com,
        hverkuil@xs4all.nl, jacopo+renesas@jmondi.org,
        luca@lucaceresoli.net, leonl@leopardimaging.com,
        robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] media: i2c: imx274: Add IMX274 power on and off
 sequence
Message-ID: <20200923080705.GA1110498@ulmo>
References: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
 <1600724379-7324-4-git-send-email-skomatineni@nvidia.com>
 <20200922075501.GB3994831@ulmo>
 <c79b6253-8476-c51b-ba32-10d464cfa4cb@nvidia.com>
 <20200922162025.GB8644@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline
In-Reply-To: <20200922162025.GB8644@valkosipuli.retiisi.org.uk>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2020 at 07:20:25PM +0300, Sakari Ailus wrote:
> Hi Sowjanya,
>=20
> On Tue, Sep 22, 2020 at 09:13:57AM -0700, Sowjanya Komatineni wrote:
> >=20
> > On 9/22/20 12:55 AM, Thierry Reding wrote:
> > > On Mon, Sep 21, 2020 at 02:39:39PM -0700, Sowjanya Komatineni wrote:
> > > > IMX274 has analog 2.8V supply, digital core 1.8V supply, and vddl d=
igital
> > > > io 1.2V supply which are optional based on camera module design.
> > > >=20
> > > > IMX274 also need external 24Mhz clock and is optional based on
> > > > camera module design.
> > > >=20
> > > > This patch adds support for IMX274 power on and off to enable and
> > > > disable these supplies and external clock.
> > > >=20
> > > > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> > > > Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> > > > ---
> > > >   drivers/media/i2c/imx274.c | 184 ++++++++++++++++++++++++++++++++=
+------------
> > > >   1 file changed, 134 insertions(+), 50 deletions(-)
> > > >=20
> > > > diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> > > > index 5e515f0..b3057a5 100644
> > > > --- a/drivers/media/i2c/imx274.c
> > > > +++ b/drivers/media/i2c/imx274.c
> > > > @@ -18,7 +18,9 @@
> > > >   #include <linux/kernel.h>
> > > >   #include <linux/module.h>
> > > >   #include <linux/of_gpio.h>
> > > > +#include <linux/pm_runtime.h>
> > > >   #include <linux/regmap.h>
> > > > +#include <linux/regulator/consumer.h>
> > > >   #include <linux/slab.h>
> > > >   #include <linux/v4l2-mediabus.h>
> > > >   #include <linux/videodev2.h>
> > > > @@ -131,6 +133,15 @@
> > > >   #define IMX274_TABLE_WAIT_MS			0
> > > >   #define IMX274_TABLE_END			1
> > > > +/* regulator supplies */
> > > > +static const char * const imx274_supply_names[] =3D {
> > > > +	"vddl",  /* IF (1.2V) supply */
> > > > +	"vdig",  /* Digital Core (1.8V) supply */
> > > > +	"vana",  /* Analog (2.8V) supply */
> > > According to the device tree bindings these should be uppercase. Did I
> > > miss a patch that updates the bindings?
> > >=20
> > > I think the preference is for supply names to be lowercase and given
> > > that there are no users of this binding yet we could update it without
> > > breaking any existing device trees.
> > >=20
> > > > +};
> > > > +
> > > > +#define IMX274_NUM_SUPPLIES ARRAY_SIZE(imx274_supply_names)
> > > > +
> > > >   /*
> > > >    * imx274 I2C operation related structure
> > > >    */
> > > > @@ -501,6 +512,8 @@ struct imx274_ctrls {
> > > >    * @frame_rate: V4L2 frame rate structure
> > > >    * @regmap: Pointer to regmap structure
> > > >    * @reset_gpio: Pointer to reset gpio
> > > > + * @supplies: List of analog and digital supply regulators
> > > > + * @inck: Pointer to sensor input clock
> > > >    * @lock: Mutex structure
> > > >    * @mode: Parameters for the selected readout mode
> > > >    */
> > > > @@ -514,6 +527,8 @@ struct stimx274 {
> > > >   	struct v4l2_fract frame_interval;
> > > >   	struct regmap *regmap;
> > > >   	struct gpio_desc *reset_gpio;
> > > > +	struct regulator_bulk_data supplies[IMX274_NUM_SUPPLIES];
> > > > +	struct clk *inck;
> > > >   	struct mutex lock; /* mutex lock for operations */
> > > >   	const struct imx274_mode *mode;
> > > >   };
> > > > @@ -726,6 +741,12 @@ static int imx274_start_stream(struct stimx274=
 *priv)
> > > >   {
> > > >   	int err =3D 0;
> > > > +	err =3D __v4l2_ctrl_handler_setup(&priv->ctrls.handler);
> > > > +	if (err) {
> > > > +		dev_err(&priv->client->dev, "Error %d setup controls\n", err);
> > > > +		return err;
> > > > +	}
> > > > +
> > > >   	/*
> > > >   	 * Refer to "Standby Cancel Sequence when using CSI-2" in
> > > >   	 * imx274 datasheet, it should wait 10ms or more here.
> > > > @@ -767,6 +788,66 @@ static void imx274_reset(struct stimx274 *priv=
, int rst)
> > > >   	usleep_range(IMX274_RESET_DELAY1, IMX274_RESET_DELAY2);
> > > >   }
> > > > +static int imx274_power_on(struct device *dev)
> > > > +{
> > > > +	struct i2c_client *client =3D to_i2c_client(dev);
> > > > +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > > > +	struct stimx274 *imx274 =3D to_imx274(sd);
> > > > +	int ret;
> > > > +
> > > > +	/* keep sensor in reset before power on */
> > > > +	imx274_reset(imx274, 0);
> > > > +
> > > > +	ret =3D clk_prepare_enable(imx274->inck);
> > > > +	if (ret) {
> > > > +		dev_err(&imx274->client->dev,
> > > > +			"Failed to enable input clock: %d\n", ret);
> > > > +		return ret;
> > > > +	}
> > > > +
> > > > +	ret =3D regulator_bulk_enable(IMX274_NUM_SUPPLIES, imx274->suppli=
es);
> > > > +	if (ret) {
> > > > +		dev_err(&imx274->client->dev,
> > > > +			"Failed to enable regulators: %d\n", ret);
> > > > +		goto fail_reg;
> > > > +	}
> > > > +
> > > > +	udelay(2);
> > > This looks like some sort of extra delay to make sure all the supply
> > > voltages have settled. Should this perhaps be encoded as part of the
> > > regulator ramp-up times? Or is this really an IC-specific delay that
> > > is needed for some internal timing?
> > This is IC-specific delay after power on regulators before releasing re=
set.
> > >=20
> > > > +	imx274_reset(imx274, 1);
> > > > +
> > > > +	return 0;
> > > > +
> > > > +fail_reg:
> > > > +	clk_disable_unprepare(imx274->inck);
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static int imx274_power_off(struct device *dev)
> > > > +{
> > > > +	struct i2c_client *client =3D to_i2c_client(dev);
> > > > +	struct v4l2_subdev *sd =3D i2c_get_clientdata(client);
> > > > +	struct stimx274 *imx274 =3D to_imx274(sd);
> > > > +
> > > > +	imx274_reset(imx274, 0);
> > > > +
> > > > +	regulator_bulk_disable(IMX274_NUM_SUPPLIES, imx274->supplies);
> > > > +
> > > > +	clk_disable_unprepare(imx274->inck);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > > +static int imx274_regulators_get(struct device *dev, struct stimx2=
74 *imx274)
> > > > +{
> > > > +	unsigned int i;
> > > > +
> > > > +	for (i =3D 0; i < IMX274_NUM_SUPPLIES; i++)
> > > > +		imx274->supplies[i].supply =3D imx274_supply_names[i];
> > > > +
> > > > +	return devm_regulator_bulk_get(dev, IMX274_NUM_SUPPLIES,
> > > > +					imx274->supplies);
> > > > +}
> > > > +
> > > >   /**
> > > >    * imx274_s_ctrl - This is used to set the imx274 V4L2 controls
> > > >    * @ctrl: V4L2 control to be set
> > > > @@ -781,6 +862,9 @@ static int imx274_s_ctrl(struct v4l2_ctrl *ctrl)
> > > >   	struct stimx274 *imx274 =3D to_imx274(sd);
> > > >   	int ret =3D -EINVAL;
> > > > +	if (!pm_runtime_get_if_in_use(&imx274->client->dev))
> > > > +		return 0;
> > > I'm not sure I understand this, and sorry if this has been discussed
> > > earlier. Aren't there any other mechanisms in place to ensure that a
> > > control can only be configured when in use? If so, then is this even
> > > necessary?
> > >=20
> > > If not, silently ignoring at this point seems like it could cause sub=
tle
> > > failures by ignoring some control settings and applying others if the
> > > timing is right.
> >=20
> > With this patch, v4l2_ctrl setup is moved to start stream so all the co=
ntrol
> > values selected gets programmed during stream start. So s_ctrl callback
> > execution happens during that time after sensor rpm resume and I don't =
think
> > we need here either but I see all sensor drivers with RPM enabled check=
ing
> > for this. So added just to make sure sensor programming don't happen wh=
en
> > power is off.
> >=20
> > Sakari/Jacob,
> >=20
> > Can you please clarify if we can remove check pm_runtime_get_if_in_use(=
) in
> > s_ctrl callback as v4l2_ctrl handler setup happens during stream start =
where
> > power is already on by then?
>=20
> The controls are accessible also when streaming is disabled. So you may e=
nd
> up here without the device being powered on. Therefore the check is neede=
d.

In that case shouldn't this return an error rather than silently
ignoring the request? From my reading of the code this current
implementation would allow someone to configure a control while
streaming is disabled, and that configuration will then succeed
without doing anything.

Or am I missing something and all controls will be reapplied when
streaming resumes and this is actually safe to ignore?

Thierry

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9rAiUACgkQ3SOs138+
s6H8vg//d+ebC3bvijaQ2eqq3xHA4S16uG16VA8NgrLZHxKsn8bMNW1FJKee03Uk
UMbhe7tZuVuj8wBHtzjgCofBada66Bc41a6xgiktQMZkEqSTu8iSUlUujWmubvPF
uYQUzndREtrta5PdmBOOxJNMVZRNPhJFqAeDNYxB78dpB5JYoLG+jlizLj+LW2UB
2RhTuboYUfeMM74+N3CkpszEzN1UQY4h+qcQw7JA8x5Z2C28yk8TIPcjTPesSvLl
4NqWa2sw1jPVW1TDn2F4+4MeMeGIRg6yKeLiB6nI2Mosb3+taZ1M31WKS1F3tr4v
CEyTId+8ABP0vQ7tbsV5CkBTA2v+DTySUMWyVbrdglGeZJw0h6qvvjJTYIPV3AHM
4DdY7eL4KzNSIJlbLIYluRVjPB0Vx1ahYN2HZ9ryXjAbIZPoIvjJo8OneeKm41ge
dmCIwymoascJ+BbV3VsCbPc8uGNNhjtw6dVjXv2qNDOtTf3xjGi/wvqn9KLA06ZZ
G0tHAfF7p7hr/i7oHimXlY46qEVnzZvAY7BlbQlbMM58+6dBDUEja5X8H0Vogybr
mQTyVN2CIGYOWezEwa84QOKDeyXrCKd71AzpHIWmUCu6ccYJJ5nKnv7+hmHZrW+1
JZWv+4jbUK0QrocTScgjm6z4T7i5CaDB97wPKEAo4fLg+SAoj8Q=
=2Bp/
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
