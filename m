Return-Path: <linux-media+bounces-25739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E22A2B67C
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2025 00:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA2B13A7F81
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 23:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC8B2376E6;
	Thu,  6 Feb 2025 23:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="wUO/C86z"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E5F2417E2
	for <linux-media@vger.kernel.org>; Thu,  6 Feb 2025 23:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738883854; cv=none; b=a5/wDtPvpTo4XR3pU1KEkeOdJQxAMWeEnKJBmwa60lWLsZhDxBQWrdPB9dKf8sUQOdFu6mx6NBHPCc2XUNfFjznQz5R+8JU+SO4l3Pe6ym+1djDizh5KpRvspshaxT747keSYk+jsZVuV/M4v326+gY56QCSAqx6TwsHbTeg+WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738883854; c=relaxed/simple;
	bh=4ar1ZW3CDVsTZRBp9tR7gvm1fe+VLdf5rnY0sNoJMYY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ONXqW6vAV+ZF+bBpaHPWyakREEqvojIGseFidolDawQ01C1b3x3ex/XLJN2u0QMs+bJo14l6503NmW83OP8tCfU1p4BBEYeiV2d4YzAdd/naDVBuvxtRYkXEpUiq8J2F+QSxjCVi0c+1S7wJTEyoUY0t93WITBMQHxPElV88U/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=wUO/C86z; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=d/PVQFZfr9kbg+e4T3WhgGLnclGl4/vZIsK3OhhNxA4=; b=wUO/C86zH4insoc/OFOYeOptAC
	C37cMiZ5P8ssHrtUOrpz35XPY88TqCtkZfNAYdJqnvuuFXsgD4ab9FYULzmtEKjIwiMXqTTlpXzsI
	ePn9YQZPmmhQMHvagHz8wDdk+8qCIieo/QPzDP+8N1dJxxcTCtLbok4C1m3GYxBwFeGRMnl4F9sbG
	a7oYs1P8bGCLdNxWt+9+uhKzb2KMl1TTStmeRLtmRNoN/arC6O/laXcp+516qzHprPgOlGOwUpwbi
	Avk4kQp2+BL/Y5/Eir0GTlAeU9nYRu5hGluZkJ+G1q6A8SfoQh7Of6a5kfiVjtOACLppZpD4E4yuu
	x+09uOtg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1tgB7Z-000DeD-1V;
	Fri, 07 Feb 2025 00:17:21 +0100
Received: from [92.206.120.88] (helo=framework.lan)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1tgB7Z-000EhJ-1i;
	Fri, 07 Feb 2025 00:17:21 +0100
Message-ID: <343f76201d60015bbf2ff4d2c9c6110796d63219.camel@apitzsch.eu>
Subject: Re: [PATCH] media: dw9719: Add DW9761 support
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Hans de Goede <hdegoede@redhat.com>, Daniel Scally
 <djrscally@gmail.com>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>, Sakari
 Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Date: Fri, 07 Feb 2025 00:17:19 +0100
In-Reply-To: <20241105203658.29737-1-hdegoede@redhat.com>
References: <20241105203658.29737-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: andre@apitzsch.eu
X-Virus-Scanned: Clear (ClamAV 1.0.7/27541/Thu Feb  6 10:51:09 2025)

Hello Hans,

Am Dienstag, dem 05.11.2024 um 21:36 +0100 schrieb Hans de Goede:
> Add support for the DW9761 VCM controller, which is very similar to
> the DW9719.
>=20
> The new support is based on
> drivers/external_drivers/camera/drivers/media/i2c/micam/dw9761.c
> from the Xiaomi kernel sources for the Mi Pad 2.
>=20
> The DW9761 support has been tested on a Xiaomi Mi Pad 2 tablet and
> DW9719 support has been tested (to avoid regressions) on a Microsoft
> Surface Go tablet.
>=20
> Link: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> =C2=A0drivers/media/i2c/dw9719.c | 113 +++++++++++++++++++++++-----------=
-
> --
> =C2=A01 file changed, 71 insertions(+), 42 deletions(-)
>=20
> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
> index c626ed845928..032fbcb981f2 100644
> --- a/drivers/media/i2c/dw9719.c
> +++ b/drivers/media/i2c/dw9719.c
> @@ -2,8 +2,10 @@
> =C2=A0// Copyright (c) 2012 Intel Corporation
> =C2=A0
> =C2=A0/*
> - * Based on linux/modules/camera/drivers/media/i2c/imx/dw9719.c in
> this repo:
> - * https://github.com/ZenfoneArea/android_kernel_asus_zenfone5
> + * Based on linux/modules/camera/drivers/media/i2c/imx/dw9719.c
> from:
> + * https://github.com/ZenfoneArea/android_kernel_asus_zenfone5=C2=A0and
> + * latte-l-
> oss/drivers/external_drivers/camera/drivers/media/i2c/micam/dw9761.c
> + * from: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/
> =C2=A0 */
> =C2=A0
> =C2=A0#include <linux/delay.h>
> @@ -23,26 +25,45 @@
> =C2=A0
> =C2=A0#define DW9719_INFO			CCI_REG8(0)
> =C2=A0#define DW9719_ID			0xF1
> +#define DW9761_ID			0xF4
> =C2=A0
> =C2=A0#define DW9719_CONTROL			CCI_REG8(2)
> +#define DW9719_STANDBY			0x00
> +#define DW9719_SHUTDOWN			0x01
> =C2=A0#define DW9719_ENABLE_RINGING		0x02
> =C2=A0
> =C2=A0#define DW9719_VCM_CURRENT		CCI_REG16(3)
> =C2=A0
> +#define DW9719_STATUS			CCI_REG16(5)
> +#define DW9719_STATUS_BUSY		BIT(0)
> +
> =C2=A0#define DW9719_MODE			CCI_REG8(6)
> =C2=A0#define DW9719_MODE_SAC_SHIFT		4
> -#define DW9719_MODE_SAC3		4
> +#define DW9719_DEFAULT_SAC		4
> +#define DW9761_DEFAULT_SAC		6
> =C2=A0
> =C2=A0#define DW9719_VCM_FREQ			CCI_REG8(7)
> =C2=A0#define DW9719_DEFAULT_VCM_FREQ		0x60
> +#define DW9761_DEFAULT_VCM_FREQ		0x3E
> +
> +#define DW9761_VCM_PRELOAD		CCI_REG8(8)
> +#define DW9761_DEFAULT_VCM_PRELOAD	0x73
> +
> =C2=A0
> =C2=A0#define to_dw9719_device(x) container_of(x, struct dw9719_device,
> sd)
> =C2=A0
> +enum dw9719_model {
> +	DW9719,
> +	DW9761,
> +};
> +
> =C2=A0struct dw9719_device {
> =C2=A0	struct v4l2_subdev sd;
> =C2=A0	struct device *dev;
> =C2=A0	struct regmap *regmap;
> =C2=A0	struct regulator *regulator;
> +	enum dw9719_model model;
> +	u32 mode_low_bits;
> =C2=A0	u32 sac_mode;
> =C2=A0	u32 vcm_freq;
> =C2=A0
> @@ -52,30 +73,14 @@ struct dw9719_device {
> =C2=A0	} ctrls;
> =C2=A0};
> =C2=A0
> -static int dw9719_detect(struct dw9719_device *dw9719)
> -{
> -	int ret;
> -	u64 val;
> -
> -	ret =3D cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
> -	if (ret < 0)
> -		return ret;
> -
> -	if (val !=3D DW9719_ID) {
> -		dev_err(dw9719->dev, "Failed to detect correct
> id\n");
> -		return -ENXIO;
> -	}
> -
> -	return 0;
> -}
> -
> =C2=A0static int dw9719_power_down(struct dw9719_device *dw9719)
> =C2=A0{
> =C2=A0	return regulator_disable(dw9719->regulator);
> =C2=A0}
> =C2=A0
> -static int dw9719_power_up(struct dw9719_device *dw9719)
> +static int dw9719_power_up(struct dw9719_device *dw9719, bool
> detect)
> =C2=A0{
> +	u64 val;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	ret =3D regulator_enable(dw9719->regulator);
> @@ -83,16 +88,54 @@ static int dw9719_power_up(struct dw9719_device
> *dw9719)
> =C2=A0		return ret;
> =C2=A0
> =C2=A0	/* Jiggle SCL pin to wake up device */
> -	cci_write(dw9719->regmap, DW9719_CONTROL, 1, &ret);
> -
> +	cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_SHUTDOWN,
> &ret);
> +	fsleep(100);
> +	cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_STANDBY,
> &ret);
> =C2=A0	/* Need 100us to transit from SHUTDOWN to STANDBY */
> =C2=A0	fsleep(100);
> =C2=A0
> +	if (detect) {
> +		ret =3D cci_read(dw9719->regmap, DW9719_INFO, &val,
> NULL);
> +		if (ret < 0)
> +			return ret;
> +
> +		switch (val) {
> +		case DW9719_ID:
> +			dw9719->model =3D DW9719;
> +			dw9719->mode_low_bits =3D 0x00;
> +			dw9719->sac_mode =3D DW9719_DEFAULT_SAC;
> +			dw9719->vcm_freq =3D DW9719_DEFAULT_VCM_FREQ;
> +			break;
> +		case DW9761_ID:
> +			dw9719->model =3D DW9761;
> +			dw9719->mode_low_bits =3D 0x01;
> +			dw9719->sac_mode =3D DW9761_DEFAULT_SAC;
> +			dw9719->vcm_freq =3D DW9761_DEFAULT_VCM_FREQ;
> +			break;
> +		default:
> +			dev_err(dw9719->dev,
> +				"Error unknown device id
> 0x%02llx\n", val);
> +			return -ENXIO;
> +		}
> +
> +		/* Optional indication of SAC mode select */
> +		device_property_read_u32(dw9719->dev, "dongwoon,sac-
> mode",
> +					 &dw9719->sac_mode);
> +
> +		/* Optional indication of VCM frequency */
> +		device_property_read_u32(dw9719->dev, "dongwoon,vcm-
> freq",
> +					 &dw9719->vcm_freq);
> +	}
> +
> =C2=A0	cci_write(dw9719->regmap, DW9719_CONTROL,
> DW9719_ENABLE_RINGING, &ret);
> -	cci_write(dw9719->regmap, DW9719_MODE,
> -		=C2=A0 dw9719->sac_mode << DW9719_MODE_SAC_SHIFT, &ret);
> +	cci_write(dw9719->regmap, DW9719_MODE, dw9719->mode_low_bits
> |
> +			=C2=A0 (dw9719->sac_mode <<
> DW9719_MODE_SAC_SHIFT), &ret);
> =C2=A0	cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq,
> &ret);
> =C2=A0
> +	if (dw9719->model =3D=3D DW9761)
> +		cci_write(dw9719->regmap, DW9761_VCM_PRELOAD,
> +			=C2=A0 DW9761_DEFAULT_VCM_PRELOAD, &ret);
> +
> =C2=A0	if (ret)
> =C2=A0		dw9719_power_down(dw9719);
> =C2=A0
> @@ -159,7 +202,7 @@ static int dw9719_resume(struct device *dev)
> =C2=A0	int ret;
> =C2=A0	int val;
> =C2=A0
> -	ret =3D dw9719_power_up(dw9719);
> +	ret =3D dw9719_power_up(dw9719, false);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> @@ -237,16 +280,6 @@ static int dw9719_probe(struct i2c_client
> *client)
> =C2=A0		return PTR_ERR(dw9719->regmap);
> =C2=A0
> =C2=A0	dw9719->dev =3D &client->dev;
> -	dw9719->sac_mode =3D DW9719_MODE_SAC3;
> -	dw9719->vcm_freq =3D DW9719_DEFAULT_VCM_FREQ;
> -
> -	/* Optional indication of SAC mode select */
> -	device_property_read_u32(&client->dev, "dongwoon,sac-mode",
> -				 &dw9719->sac_mode);
> -
> -	/* Optional indication of VCM frequency */
> -	device_property_read_u32(&client->dev, "dongwoon,vcm-freq",
> -				 &dw9719->vcm_freq);
> =C2=A0
> =C2=A0	dw9719->regulator =3D devm_regulator_get(&client->dev, "vdd");
> =C2=A0	if (IS_ERR(dw9719->regulator))
> @@ -274,14 +307,10 @@ static int dw9719_probe(struct i2c_client
> *client)
> =C2=A0	 * will work.
> =C2=A0	 */
> =C2=A0
> -	ret =3D dw9719_power_up(dw9719);
> +	ret =3D dw9719_power_up(dw9719, true);
> =C2=A0	if (ret)
> =C2=A0		goto err_cleanup_media;
> =C2=A0
> -	ret =3D dw9719_detect(dw9719);
> -	if (ret)
> -		goto err_powerdown;
> -
> =C2=A0	pm_runtime_set_active(&client->dev);
> =C2=A0	pm_runtime_get_noresume(&client->dev);
> =C2=A0	pm_runtime_enable(&client->dev);
> @@ -299,7 +328,6 @@ static int dw9719_probe(struct i2c_client
> *client)
> =C2=A0err_pm_runtime:
> =C2=A0	pm_runtime_disable(&client->dev);
> =C2=A0	pm_runtime_put_noidle(&client->dev);
> -err_powerdown:
> =C2=A0	dw9719_power_down(dw9719);
> =C2=A0err_cleanup_media:
> =C2=A0	media_entity_cleanup(&dw9719->sd.entity);
> @@ -327,6 +355,7 @@ static void dw9719_remove(struct i2c_client
> *client)
> =C2=A0
> =C2=A0static const struct i2c_device_id dw9719_id_table[] =3D {
> =C2=A0	{ "dw9719" },
> +	{ "dw9761" },
> =C2=A0	{ }
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(i2c, dw9719_id_table);

Thanks for the patch.

Do you plan to resend this patch?
If not, I can send it again, together with a patch that adds an
of_match table, that was needed to test these changes on my device.

Tested-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>

Best regards,
Andr=C3=A9

