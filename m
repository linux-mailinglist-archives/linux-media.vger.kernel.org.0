Return-Path: <linux-media+bounces-22394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC2F9DF6F0
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2024 19:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55CB928174B
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2024 18:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AE01D86F1;
	Sun,  1 Dec 2024 18:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b="aWMQqYrV"
X-Original-To: linux-media@vger.kernel.org
Received: from www637.your-server.de (www637.your-server.de [168.119.26.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84371B6555;
	Sun,  1 Dec 2024 18:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.26.117
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733078685; cv=none; b=gPYumq7yl+Vyfk+wW26QQJtFVW0Rp4OrKs1/1XI05jJch2b0IsbnwHjItFvB6z7ccvHy2jqoRnPK9tDvCIhnKpDObC0KfhWwLRi0xB1EMCP23LdCas+RHrInlaEWgDOhF21zWo1f7/uW9kAnEsmZJHU+Gw01NyrOrVXjJUt/vDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733078685; c=relaxed/simple;
	bh=7RnqtiIs3yxjelXw16vVWhcdS9fqa1m8NOdcsIZw86Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HzMYFzy6Yi303VTkWs0tajQoXnEd6bSNqiLrFIJacSbMfPElIXGadhY7yubz63cezFLjMq4Kt1+nB0QPj4QcvDZ3zYM2YdVFGQO6X34il3m7ySKeFVQmuyBi2XK2+wctQ3J6bOJyvdL1Y7eeuZ85QFSnZCI+aGtRMq5pWn+pgrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu; spf=pass smtp.mailfrom=apitzsch.eu; dkim=pass (2048-bit key) header.d=apitzsch.eu header.i=@apitzsch.eu header.b=aWMQqYrV; arc=none smtp.client-ip=168.119.26.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=apitzsch.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=apitzsch.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=apitzsch.eu
	; s=default2410; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=/4nI2FAaoA3rsXi7OjP//bqodmp6s6H263icRSEzEr8=; b=aWMQqYrVsUnFUbN7iY4fxIj3+t
	qjZzkiDXaLKSAuBsk2Cv7acHxaVYDjk2jwEEcXaZ+aZ5zR67RZnxOq2KtzJ0CYh2aLYCcKvb9Qwc8
	FFqYdYx4RYKeyFoRWBnz5EzMjHgOJ10FcAlH6mGlCc/LerFbfwN/uNC1GEvyFVOt7AkzvtDFJU34y
	Dvvo7IiNgrVlkDyEYznMnceghUQ8nDdjyZJepWl2Au9GK8h1ZJA27pTlgc1FNFKD6UdfUK3NbfrGu
	Os/aFsqqjFUve+2hadRIMDvkwleKnyly8TsH6l5KYOYMWFL0PwFDYq+mJvn5C2QXjFgJ2/8zcUeLH
	RZrc84WQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www637.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <git@apitzsch.eu>)
	id 1tHob6-0005M6-0V;
	Sun, 01 Dec 2024 19:23:08 +0100
Received: from [77.64.252.106] (helo=framework.lan)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <git@apitzsch.eu>)
	id 1tHob6-000NxA-15;
	Sun, 01 Dec 2024 19:23:08 +0100
Message-ID: <16eebeed3cbc45394d12a67a393315a454cdbd5a.camel@apitzsch.eu>
Subject: Re: [PATCH v2 09/13] media: i2c: imx214: Extract format and crop
 settings
From: =?ISO-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
To: Ricardo Ribalda <ribalda@kernel.org>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, Dave Stevenson
	 <dave.stevenson@raspberrypi.com>
Date: Sun, 01 Dec 2024 19:23:07 +0100
In-Reply-To: <20241021-imx214-v2-9-fbd23e99541e@apitzsch.eu>
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu>
	 <20241021-imx214-v2-9-fbd23e99541e@apitzsch.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Authenticated-Sender: andre@apitzsch.eu
X-Virus-Scanned: Clear (ClamAV 1.0.7/27474/Sun Dec  1 10:42:26 2024)

Hi,

I'll drop this patch for now. The changes included are not needed to
make imx214 work with libcamera. And with [1] the patch might need a
rework anyway.

Best regards,
Andr=C3=A9

[1]
https://lore.kernel.org/linux-media/20241129095142.87196-1-sakari.ailus@lin=
ux.intel.com/

Am Montag, dem 21.10.2024 um 00:13 +0200 schrieb Andr=C3=A9 Apitzsch via B4
Relay:
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>=20
> Remove format and crop settings from register sequences and set them
> programmatically.
>=20
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> ---
> =C2=A0drivers/media/i2c/imx214.c | 129 ++++++++++++++++++++++++++++++++++=
-
> ----------
> =C2=A01 file changed, 97 insertions(+), 32 deletions(-)
>=20
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index
> cb443d8bee6fe72dc9378b2c2d3caae09f8642c5..87a03e292e19ccd71f1b2dcee34
> 09826b2f5cb6f 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -96,6 +96,9 @@
> =C2=A0#define IMX214_REG_PREPLLCK_VT_DIV	CCI_REG8(0x0305)
> =C2=A0#define IMX214_REG_PLL_VT_MPY		CCI_REG16(0x0306)
> =C2=A0#define IMX214_REG_OPPXCK_DIV		CCI_REG8(0x0309)
> +#define IMX214_OPPXCK_DIV_COMP6		6
> +#define IMX214_OPPXCK_DIV_COMP8		8
> +#define IMX214_OPPXCK_DIV_RAW10		10
> =C2=A0#define IMX214_REG_OPSYCK_DIV		CCI_REG8(0x030b)
> =C2=A0#define IMX214_REG_PLL_MULT_DRIV	CCI_REG8(0x0310)
> =C2=A0#define IMX214_PLL_SINGLE		0
> @@ -132,6 +135,9 @@
> =C2=A0#define IMX214_BINNING_NONE		0
> =C2=A0#define IMX214_BINNING_ENABLE		1
> =C2=A0#define IMX214_REG_BINNING_TYPE		CCI_REG8(0x0901)
> +#define IMX214_BINNING_1X1		0
> +#define IMX214_BINNING_2X2		0x22
> +#define IMX214_BINNING_4X4		0x44
> =C2=A0#define IMX214_REG_BINNING_WEIGHTING	CCI_REG8(0x0902)
> =C2=A0#define IMX214_BINNING_AVERAGE		0x00
> =C2=A0#define IMX214_BINNING_SUMMED		0x01
> @@ -211,36 +217,22 @@ static const struct cci_reg_sequence
> mode_4096x2304[] =3D {
> =C2=A0	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> =C2=A0	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH
> },
> =C2=A0	{ IMX214_REG_EXPOSURE_RATIO, 1 },
> -	{ IMX214_REG_X_ADD_STA, 56 },
> -	{ IMX214_REG_Y_ADD_STA, 408 },
> -	{ IMX214_REG_X_ADD_END, 4151 },
> -	{ IMX214_REG_Y_ADD_END, 2711 },
> =C2=A0	{ IMX214_REG_X_EVEN_INC, 1 },
> =C2=A0	{ IMX214_REG_X_ODD_INC, 1 },
> =C2=A0	{ IMX214_REG_Y_EVEN_INC, 1 },
> =C2=A0	{ IMX214_REG_Y_ODD_INC, 1 },
> -	{ IMX214_REG_BINNING_MODE, IMX214_BINNING_NONE },
> -	{ IMX214_REG_BINNING_TYPE, 0 },
> =C2=A0	{ IMX214_REG_BINNING_WEIGHTING, IMX214_BINNING_AVERAGE },
> =C2=A0	{ CCI_REG8(0x3000), 0x35 },
> =C2=A0	{ CCI_REG8(0x3054), 0x01 },
> =C2=A0	{ CCI_REG8(0x305C), 0x11 },
> =C2=A0
> -	{ IMX214_REG_CSI_DATA_FORMAT, IMX214_CSI_DATA_FORMAT_RAW10
> },
> -	{ IMX214_REG_X_OUTPUT_SIZE, 4096 },
> -	{ IMX214_REG_Y_OUTPUT_SIZE, 2304 },
> =C2=A0	{ IMX214_REG_SCALE_MODE, IMX214_SCALE_NONE },
> =C2=A0	{ IMX214_REG_SCALE_M, 2 },
> -	{ IMX214_REG_DIG_CROP_X_OFFSET, 0 },
> -	{ IMX214_REG_DIG_CROP_Y_OFFSET, 0 },
> -	{ IMX214_REG_DIG_CROP_WIDTH, 4096 },
> -	{ IMX214_REG_DIG_CROP_HEIGHT, 2304 },
> =C2=A0
> =C2=A0	{ IMX214_REG_VTPXCK_DIV, 5 },
> =C2=A0	{ IMX214_REG_VTSYCK_DIV, 2 },
> =C2=A0	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
> =C2=A0	{ IMX214_REG_PLL_VT_MPY, 150 },
> -	{ IMX214_REG_OPPXCK_DIV, 10 },
> =C2=A0	{ IMX214_REG_OPSYCK_DIV, 1 },
> =C2=A0	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
> =C2=A0
> @@ -281,36 +273,22 @@ static const struct cci_reg_sequence
> mode_1920x1080[] =3D {
> =C2=A0	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
> =C2=A0	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH
> },
> =C2=A0	{ IMX214_REG_EXPOSURE_RATIO, 1 },
> -	{ IMX214_REG_X_ADD_STA, 1144 },
> -	{ IMX214_REG_Y_ADD_STA, 1020 },
> -	{ IMX214_REG_X_ADD_END, 3063 },
> -	{ IMX214_REG_Y_ADD_END, 2099 },
> =C2=A0	{ IMX214_REG_X_EVEN_INC, 1 },
> =C2=A0	{ IMX214_REG_X_ODD_INC, 1 },
> =C2=A0	{ IMX214_REG_Y_EVEN_INC, 1 },
> =C2=A0	{ IMX214_REG_Y_ODD_INC, 1 },
> -	{ IMX214_REG_BINNING_MODE, IMX214_BINNING_NONE },
> -	{ IMX214_REG_BINNING_TYPE, 0 },
> =C2=A0	{ IMX214_REG_BINNING_WEIGHTING, IMX214_BINNING_AVERAGE },
> =C2=A0	{ CCI_REG8(0x3000), 0x35 },
> =C2=A0	{ CCI_REG8(0x3054), 0x01 },
> =C2=A0	{ CCI_REG8(0x305C), 0x11 },
> =C2=A0
> -	{ IMX214_REG_CSI_DATA_FORMAT, IMX214_CSI_DATA_FORMAT_RAW10
> },
> -	{ IMX214_REG_X_OUTPUT_SIZE, 1920 },
> -	{ IMX214_REG_Y_OUTPUT_SIZE, 1080 },
> =C2=A0	{ IMX214_REG_SCALE_MODE, IMX214_SCALE_NONE },
> =C2=A0	{ IMX214_REG_SCALE_M, 2 },
> -	{ IMX214_REG_DIG_CROP_X_OFFSET, 0 },
> -	{ IMX214_REG_DIG_CROP_Y_OFFSET, 0 },
> -	{ IMX214_REG_DIG_CROP_WIDTH, 1920 },
> -	{ IMX214_REG_DIG_CROP_HEIGHT, 1080 },
> =C2=A0
> =C2=A0	{ IMX214_REG_VTPXCK_DIV, 5 },
> =C2=A0	{ IMX214_REG_VTSYCK_DIV, 2 },
> =C2=A0	{ IMX214_REG_PREPLLCK_VT_DIV, 3 },
> =C2=A0	{ IMX214_REG_PLL_VT_MPY, 150 },
> -	{ IMX214_REG_OPPXCK_DIV, 10 },
> =C2=A0	{ IMX214_REG_OPSYCK_DIV, 1 },
> =C2=A0	{ IMX214_REG_PLL_MULT_DRIV, IMX214_PLL_SINGLE },
> =C2=A0
> @@ -623,6 +601,7 @@ static int imx214_set_format(struct v4l2_subdev
> *sd,
> =C2=A0	struct v4l2_mbus_framefmt *__format;
> =C2=A0	struct v4l2_rect *__crop;
> =C2=A0	const struct imx214_mode *mode;
> +	unsigned int bin_h, bin_v, bin;
> =C2=A0
> =C2=A0	mode =3D v4l2_find_nearest_size(imx214_modes,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(imx214_modes),
> width, height,
> @@ -637,9 +616,32 @@ static int imx214_set_format(struct v4l2_subdev
> *sd,
> =C2=A0
> =C2=A0	*__format =3D format->format;
> =C2=A0
> +	/*
> +	 * Use binning to maximize the crop rectangle size, and
> centre it in the
> +	 * sensor.
> +	 */
> +	bin_h =3D IMX214_PIXEL_ARRAY_WIDTH / __format->width;
> +	bin_v =3D IMX214_PIXEL_ARRAY_HEIGHT / __format->height;
> +
> +	switch (min(bin_h, bin_v)) {
> +	case 1:
> +		bin =3D 1;
> +		break;
> +	case 2:
> +	case 3:
> +		bin =3D 2;
> +		break;
> +	case 4:
> +	default:
> +		bin =3D 4;
> +		break;
> +	}
> +
> =C2=A0	__crop =3D v4l2_subdev_state_get_crop(sd_state, 0);
> -	__crop->width =3D mode->width;
> -	__crop->height =3D mode->height;
> +	__crop->width =3D __format->width * bin;
> +	__crop->height =3D __format->height * bin;
> +	__crop->left =3D (IMX214_NATIVE_WIDTH - __crop->width) / 2;
> +	__crop->top =3D (IMX214_NATIVE_HEIGHT - __crop->height) / 2;
> =C2=A0
> =C2=A0	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> =C2=A0		int exposure_max;
> @@ -847,7 +849,62 @@ static int imx214_ctrls_init(struct imx214
> *imx214)
> =C2=A0	return 0;
> =C2=A0};
> =C2=A0
> -static int imx214_start_streaming(struct imx214 *imx214)
> +static int imx214_set_framefmt(struct imx214 *imx214,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_subdev_state *state)
> +{
> +	const struct v4l2_mbus_framefmt *format;
> +	const struct v4l2_rect *crop;
> +	u64 bin_mode;
> +	u64 bin_type;
> +	int ret =3D 0;
> +
> +	format =3D v4l2_subdev_state_get_format(state, 0);
> +	crop =3D v4l2_subdev_state_get_crop(state, 0);
> +
> +	cci_write(imx214->regmap, IMX214_REG_X_ADD_STA,
> +		=C2=A0 crop->left - IMX214_PIXEL_ARRAY_LEFT, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_X_ADD_END,
> +		=C2=A0 crop->left - IMX214_PIXEL_ARRAY_LEFT + crop->width
> - 1, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_Y_ADD_STA,
> +		=C2=A0 crop->top - IMX214_PIXEL_ARRAY_TOP, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_Y_ADD_END,
> +		=C2=A0 crop->top - IMX214_PIXEL_ARRAY_TOP + crop->height
> - 1, &ret);
> +
> +	/* Proper setting is required even if cropping is not used
> */
> +	cci_write(imx214->regmap, IMX214_REG_DIG_CROP_WIDTH, crop-
> >width, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_DIG_CROP_HEIGHT, crop-
> >height, &ret);
> +
> +	switch (crop->width / format->width) {
> +	case 1:
> +	default:
> +		bin_mode =3D IMX214_BINNING_NONE;
> +		bin_type =3D IMX214_BINNING_1X1;
> +		break;
> +	case 2:
> +		bin_mode =3D IMX214_BINNING_ENABLE;
> +		bin_type =3D IMX214_BINNING_2X2;
> +		break;
> +	case 4:
> +		bin_mode =3D IMX214_BINNING_ENABLE;
> +		bin_type =3D IMX214_BINNING_4X4;
> +		break;
> +	}
> +
> +	cci_write(imx214->regmap, IMX214_REG_BINNING_MODE, bin_mode,
> &ret);
> +	cci_write(imx214->regmap, IMX214_REG_BINNING_TYPE, bin_type,
> &ret);
> +
> +	cci_write(imx214->regmap, IMX214_REG_X_OUTPUT_SIZE, format-
> >width, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_Y_OUTPUT_SIZE, format-
> >height, &ret);
> +
> +	cci_write(imx214->regmap, IMX214_REG_CSI_DATA_FORMAT,
> +		=C2=A0 IMX214_CSI_DATA_FORMAT_RAW10, &ret);
> +	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV,
> IMX214_OPPXCK_DIV_RAW10, &ret);
> +
> +	return ret;
> +};
> +
> +static int imx214_start_streaming(struct imx214 *imx214,
> +				=C2=A0 struct v4l2_subdev_state *state)
> =C2=A0{
> =C2=A0	int ret;
> =C2=A0
> @@ -865,6 +922,14 @@ static int imx214_start_streaming(struct imx214
> *imx214)
> =C2=A0		return ret;
> =C2=A0	}
> =C2=A0
> +	/* Apply format and crop settings */
> +	ret =3D imx214_set_framefmt(imx214, state);
> +	if (ret) {
> +		dev_err(imx214->dev, "%s failed to set frame format:
> %d\n",
> +			__func__, ret);
> +		return ret;
> +	}
> +
> =C2=A0	ret =3D cci_multi_reg_write(imx214->regmap, imx214->cur_mode-
> >reg_table,
> =C2=A0				=C2=A0 imx214->cur_mode->num_of_regs,
> NULL);
> =C2=A0	if (ret < 0) {
> @@ -913,7 +978,7 @@ static int imx214_s_stream(struct v4l2_subdev
> *subdev, int enable)
> =C2=A0			return ret;
> =C2=A0
> =C2=A0		state =3D
> v4l2_subdev_lock_and_get_active_state(subdev);
> -		ret =3D imx214_start_streaming(imx214);
> +		ret =3D imx214_start_streaming(imx214, state);
> =C2=A0		v4l2_subdev_unlock_state(state);
> =C2=A0		if (ret < 0)
> =C2=A0			goto err_rpm_put;
>=20


