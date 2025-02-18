Return-Path: <linux-media+bounces-26293-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 46514A3A078
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 15:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36E59165213
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2025 14:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39ADE26A1A6;
	Tue, 18 Feb 2025 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gGfsCzPr"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7702269B09;
	Tue, 18 Feb 2025 14:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739889967; cv=none; b=F4zdvJ677F4jtKiC6aNu6y1kJtTsJ/gpJDQcXIW2fOjiawxxYONZpqdq1j3LioIvErgAYuQsobfxsaDaYsRrGiY2PIwqd5DTjRSL9TIrXjRRlMAZ/V3z/UR+aKMhZ0QmU60R47LxcbxgsfA8Ieu6XINCDVSCXU6izIol/O7PPpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739889967; c=relaxed/simple;
	bh=L37JwsRhUvhyj8Iy1agx1x1+8qG2Qjpv6F1PihNs1dw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VQRwSuZ/d3XvUhjc6pl4iSX71FFy3FCtgiuiH3WQ0709RQoefCLIZOpfHyAenVHSOPB1q40lCCayMr81phJvnxUkDAU+QDSl7q9wvrpFbvzpMbYOVUK+dYEoprcY9S8eVrQjo918kh2nc3ym3WHznsS0iDzLDXbdgYO1hWDxazM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gGfsCzPr; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739889963;
	bh=L37JwsRhUvhyj8Iy1agx1x1+8qG2Qjpv6F1PihNs1dw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gGfsCzPrAZNoM9FAqQ2NNqibLLOcXtfJYQ4kDFc4lQDc3/n/zb1KyoHBSh952KTE0
	 grIqMk7ZIoMpcC55mnzQ7sQJumYUkLFOPFKb551oXPiGuj66KriytXm1gPODpjB9qE
	 uudCRvDxL9ps0+SLHGVWL53Zbc3w66KCdpRLOThF7Ym4d+ziPaxWEGnCZzZdRvR0Hj
	 hy0+xQmgS7uKoyffrOjeBSBJQCI4djIdKJL+P5d5noBm3tJL2bP4AUrq0/88i3WLrP
	 e6tS0faVQiFFR5/vrIaDZQvyvpzdr0wkA+bDyyMklexsLmf+gt9eUDievTckmlQsza
	 uFKCIjIUcVChA==
Received: from apertis-1.home (2a01cb088Cca73006086F5F072C6a07a.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9434917E0657;
	Tue, 18 Feb 2025 15:46:03 +0100 (CET)
Message-ID: <46ee390957d980189887badc1ca5e8ed437166d5.camel@collabora.com>
Subject: Re: [PATCH 4/5] media/i2c: max96717: add FSYNC support
From: Julien Massot <julien.massot@collabora.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Date: Tue, 18 Feb 2025 15:46:02 +0100
In-Reply-To: <20250207112958.2571600-5-laurentiu.palcu@oss.nxp.com>
References: <20250207112958.2571600-1-laurentiu.palcu@oss.nxp.com>
	 <20250207112958.2571600-5-laurentiu.palcu@oss.nxp.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Laurentiu,

Thanks for your patch
On Fri, 2025-02-07 at 13:29 +0200, Laurentiu Palcu wrote:
> According to specs:
>=20
> """
> Frame synchronization (FSYNC) is used to align images sent from multiple
> sources in surround-view applications and is required for concatenation.
> In FSYNC mode, the GMSL2 CSI-2 quad deserializer sends a sync signal to
> each serializer; the serializers then send the signal to the connected
> sensor.
> """
>=20
> Since max96717 can be used in multi-sensor setups, we need FSYNC
> support. For that, I added a DT property("maxim,fsync-config") that will
> be used to configure the frame sync output pin and the RX ID of the
> GPIO as sent by the deserializer chip.
>=20
> Also, add the .request() callback for the gpiochip so that we can use
> 'gpio-reserved-ranges' in DT to exclude the pins that are used for
> FSYNC from being used as GPIOs.
>=20
>=20
> I'm seeing different features in this patch:
- Adding the request callback=20
- Adding GPIO forwarding=20
- Adding support to some pinctrl features such as pullup/pulldown



>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
> =C2=A0drivers/media/i2c/max96717.c | 87 ++++++++++++++++++++++++++++++++-=
---
> =C2=A01 file changed, 79 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
> index 6a668a004c717..47a3be195a971 100644
> --- a/drivers/media/i2c/max96717.c
> +++ b/drivers/media/i2c/max96717.c
> @@ -70,13 +70,28 @@
> =C2=A0#define MAX96717_VTX_CHKB_ALT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 CCI_REG8(0x275)
> =C2=A0
> =C2=A0/* GPIO */
> -#define MAX96717_NUM_GPIO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 11
> -#define MAX96717_GPIO_REG_A(gpio) CCI_REG8(0x2be + (gpio) * 3)
> -#define MAX96717_GPIO_OUT=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 BIT(4)
> -#define MAX96717_GPIO_IN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 BIT(3)
> -#define MAX96717_GPIO_RX_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2)
> -#define MAX96717_GPIO_TX_EN=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1)
> -#define MAX96717_GPIO_OUT_DIS=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)
> +#define MAX96717_NUM_GPIO		11
> +#define MAX96717_GPIO_REG_A(gpio)	CCI_REG8(0x2be + (gpio) * 3)
> +#define MAX96717_GPIO_OUT		BIT(4)
> +#define MAX96717_GPIO_IN		BIT(3)
> +#define MAX96717_GPIO_RX_EN		BIT(2)
> +#define MAX96717_GPIO_TX_EN		BIT(1)
> +#define MAX96717_GPIO_OUT_DIS		BIT(0)
> +#define MAX96717_GPIO_REG_B(gpio)	CCI_REG8(0x2bf + (gpio) * 3)
> +#define MAX96717_GPIO_TX_ID_MASK	GENMASK(4, 0)
> +#define MAX96717_GPIO_TX_ID_SHIFT	0
> +#define MAX96717_OUT_TYPE		BIT(5)
> +#define MAX96717_OUT_TYPE_PUSH_PULL	BIT(5)
> +#define MAX96717_OUT_TYPE_OPEN_DRAIN	0
> +#define MAX96717_PULL_UPDN_SEL_MASK	GENMASK(7, 6)
> +#define MAX96717_PULL_UPDN_SEL_SHIFT	6
> +#define MAX96717_GPIO_NO_PULL		0
> +#define MAX96717_GPIO_PULL_UP		1
> +#define MAX96717_GPIO_PULL_DOWN		2
> +#define MAX96717_GPIO_REG_C(gpio)	CCI_REG8(0x2c0 + (gpio) * 3)
> +#define MAX96717_GPIO_RX_ID_MASK	GENMASK(4, 0)
> +#define MAX96717_GPIO_RX_ID_SHIFT	0
> +#define MAX96717_OVR_RES_CFG		BIT(7)
> =C2=A0
> =C2=A0/* CMU */
> =C2=A0#define MAX96717_CMU_CMU2		CCI_REG8(0x0302)
> @@ -125,6 +140,11 @@ enum max96717_vpg_mode {
> =C2=A0	MAX96717_VPG_GRADIENT =3D 2,
> =C2=A0};
> =C2=A0
> +struct max96717_fsync_desc {
> +	int pin;
> +	int rx_id;
> +};
> +
> =C2=A0struct max96717_priv {
> =C2=A0	struct i2c_client		=C2=A0 *client;
> =C2=A0	struct regmap			=C2=A0 *regmap;
> @@ -141,6 +161,7 @@ struct max96717_priv {
> =C2=A0	struct clk_hw=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_h=
w;
> =C2=A0	struct gpio_chip=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio_chip;
> =C2=A0	enum max96717_vpg_mode=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pattern;
> +	struct max96717_fsync_desc	=C2=A0 fsync;
Here we can have multiple GPIOs forwarded.

> =C2=A0};
> =C2=A0
> =C2=A0static inline struct max96717_priv *sd_to_max96717(struct v4l2_subd=
ev *sd)
> @@ -364,6 +385,7 @@ static int max96717_gpiochip_probe(struct max96717_pr=
iv *priv)
> =C2=A0	gc->get_direction =3D max96717_gpio_get_direction;
> =C2=A0	gc->direction_input =3D max96717_gpio_direction_in;
> =C2=A0	gc->direction_output =3D max96717_gpio_direction_out;
> +	gc->request =3D gpiochip_generic_request;
> =C2=A0	gc->set =3D max96717_gpiochip_set;
> =C2=A0	gc->get =3D max96717_gpiochip_get;
> =C2=A0	gc->of_gpio_n_cells =3D 2;
> @@ -386,6 +408,26 @@ static int max96717_gpiochip_probe(struct max96717_p=
riv *priv)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> +static int max96717_fsync_setup(struct max96717_priv *priv)
> +{
> +	int ret =3D 0;
> +
> +	if (priv->fsync.pin =3D=3D -1)
> +		return 0;
> +
> +	cci_update_bits(priv->regmap, MAX96717_GPIO_REG_C(priv->fsync.pin),
> +			MAX96717_GPIO_RX_ID_MASK,
> +			priv->fsync.rx_id << MAX96717_GPIO_RX_ID_SHIFT, &ret);
                        FIELD_PREP(MAX96717_GPIO_RX_ID_MASK, priv->fsync.rx=
_id), &ret);
And you can get rid of the _SHIFT define.

>=20
> +
> +	cci_update_bits(priv->regmap, MAX96717_GPIO_REG_B(priv->fsync.pin),
> +			MAX96717_PULL_UPDN_SEL_MASK,
> +			1 << MAX96717_PULL_UPDN_SEL_SHIFT, &ret);

The serializer can't guess what kind of pin configuration is required for t=
he design.
This change deserves his own patch most likely implementing pinconf support=
.

> +
> +	return cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(priv->fsync.pi=
n),
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX96717_GPIO_RX_EN | MAX96717_G=
PIO_OUT_DIS,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAX96717_GPIO_RX_EN, &ret);
> +}


> +
> =C2=A0static int _max96717_set_routing(struct v4l2_subdev *sd,
> =C2=A0				 struct v4l2_subdev_state *state,
> =C2=A0				 struct v4l2_subdev_krouting *routing)
> @@ -1037,7 +1079,8 @@ static int max96717_parse_dt(struct max96717_priv *=
priv)
> =C2=A0	struct v4l2_fwnode_endpoint vep =3D { .bus_type =3D V4L2_MBUS_CSI2=
_DPHY };
> =C2=A0	struct fwnode_handle *ep_fwnode;
> =C2=A0	unsigned char num_data_lanes;
> -	int ret;
> +	int ret, count;
> +	u32 dt_val[2];
> =C2=A0
> =C2=A0	ep_fwnode =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
> =C2=A0						=C2=A0=C2=A0=C2=A0 MAX96717_PAD_SINK, 0, 0);
> @@ -1058,6 +1101,30 @@ static int max96717_parse_dt(struct max96717_priv =
*priv)
> =C2=A0
> =C2=A0	priv->mipi_csi2 =3D vep.bus.mipi_csi2;
> =C2=A0
> +	priv->fsync.pin =3D -1;
> +	count =3D fwnode_property_present(dev_fwnode(dev), "maxim,fsync-config"=
);
> +	if (count > 0) {
> +		ret =3D fwnode_property_read_u32_array(dev_fwnode(dev), "maxim,fsync-c=
onfig",
> +						=C2=A0=C2=A0=C2=A0=C2=A0 dt_val, count);
> +		if (ret) {
> +			dev_err(dev, "Unable to read FSYNC config from DT.\n");
> +			return ret;
> +		}
> +
> +		priv->fsync.rx_id =3D dt_val[0];
> +		if (priv->fsync.rx_id > 31) {
> +			dev_err(dev, "Wrong GPIO RX ID. Allowed: 0 -> 31\n");
> +			return -EINVAL;
> +		}
> +
> +		priv->fsync.pin =3D dt_val[1];
> +		if (priv->fsync.pin >=3D MAX96717_NUM_GPIO) {
> +			dev_err(dev, "Wrong GPIO pin used for FSYNC. Allowed: 0 -> %d\n",
> +				MAX96717_NUM_GPIO - 1);
> +			return -EINVAL;
> +		}
> +	}
>=20
> +
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> @@ -1092,6 +1159,10 @@ static int max96717_probe(struct i2c_client *clien=
t)
> =C2=A0		return dev_err_probe(&client->dev, ret,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to init gpiochip\n");
> =C2=A0
> +	ret =3D max96717_fsync_setup(priv);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret, "Failed to setup FSYNC\n");
> +
Configuring GPIO forwarding can be done when calling GPIO chip probe.

> =C2=A0	ret =3D max96717_register_clkout(priv);
> =C2=A0	if (ret)
> =C2=A0		return dev_err_probe(dev, ret, "Failed to register clkout\n");

Best regards,
--=20
Julien

