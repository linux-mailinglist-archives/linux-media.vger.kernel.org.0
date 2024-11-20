Return-Path: <linux-media+bounces-21638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866989D3CD9
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 14:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46BAF282A36
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 13:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A431AAE13;
	Wed, 20 Nov 2024 13:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ywgjHL4z"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D74D1A706F
	for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732110978; cv=none; b=eh8CPKdDZETv1+x2isZ8q3LtyU1IgPXsOKIt4iPeSl23bE22q2MhcAy56rdwnTi+wPfzkfUQgBq2gKCeWrkyNOZVpndb0cdsiCb6swms+GOMgnn6/+fyPqUrcasNMpJ5b5iEb20CEplGLTdP/IZihKuOAfGQfg++DF/5eFiJZOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732110978; c=relaxed/simple;
	bh=dfwcfgfI4H85Ukr3770WXJoLmT/uQHvNcLTWBiKiEZs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QG41kGyQ/iqkYK5zKxqqJYaHsmmakSVoTCEudgBIkA2k1jYMO/lIJYIYrd9hRxuVUwuQerApFHjP+GYBdaPy9+iYykZ214AivNNzWnC+ev5APzAWYRz+weGbcW+srbZkmKEDKFXXY1PH6oweUo8cn6t5YwG/F05wjNBy6oFCY+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ywgjHL4z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-432d866f70fso19342535e9.2
        for <linux-media@vger.kernel.org>; Wed, 20 Nov 2024 05:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1732110974; x=1732715774; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LtLwiYWJMe5D9pQFX6Ax9Ul9+sGhVnnWmSdEh99pxKM=;
        b=ywgjHL4z7RnkNdF42dkBlG0P7vBOSh3+VQ/0c16Ht2fL6iu+SlFc81Dwf2DjmnKUK9
         OLM9VwCjlDkx9vDEvVTh3HZK0U9Gvh0luzxG1cB8WmMt8STz6F25F0AZoB+CvaF3q3NL
         0VWHk9dl6CuEA4u8lGMEDvoHnyD7jXgPIBjbE+SgFdSyJKXerOelmdAY83zCETogOTjJ
         5hmMoQuJf2+YjILj6nRyoSUaC/FVq6mCjuR196CD/ThT0/iTjadBU0h7cnfVEPyopYoK
         /9f8eDN0zkunDFdb0gAUMja0la9sJHSdRQbWt6ORbys87dxKDcZUFVLcodmRkWsNEgqD
         kvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732110974; x=1732715774;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LtLwiYWJMe5D9pQFX6Ax9Ul9+sGhVnnWmSdEh99pxKM=;
        b=n51PFEq/C8maOk6Pmg/GxVtlW/6ef0LnQhTbf2nXfCikTuOAxG5FMc8x82zFF4WsZb
         RYacTt7cmCuI3U9FNLnsj6Jo2vd32Ezc/UTbSa0AKaOlDa79eETK8YG69UKwQn/89NiY
         GJtrgZ0ssGcKhFKlII5mLf3roEmZFJV7eBxgtpgrVIfS/BRk/mbkkHx/N46qdL6YmIhl
         JHOkmKAoo2WQEO2HIFSkeJ/k7/xX00bz3B6dlJS8/boUf8nGtH/t+lxg2nVfvNbGYyD6
         AopoA8Yj1wovKTahJkI/bOAX/i2t39sd+nthpV3dn5vfA8U6qjrPEVY8IgDOmnqjk353
         OUNA==
X-Forwarded-Encrypted: i=1; AJvYcCV292vbLwtfKyoOG4Jgk9ms4tCwgbfhcr4kBXuc6jdvMLHy43Uc7XlsNaDtXfbBCB4D95HMDSJZyUWK3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRQHKGFuHhlTzD+26LbwWw2dtZ86vMSoYnTrrFofV0P0pnYVPX
	mlp0pWBU9wibT/E964nPYWiq0FkTSM8VAkX4RB/2saWP70SQ+LZfRxMhSgcsN/xm20TJ8v/sBSx
	X
X-Gm-Gg: ASbGncvgvnMWsNeIYXluhZYSUtvF6FobuIEOfxsb1hLT9mIYCwsW959q+qr9j3gzb9S
	Ji+5rmKGYK+KlwxafNU5Cenjz0LU3sbPB0dPT8gJ1WQl69WUSrqEPk1/HWZ6byv+UBYf8jEerBI
	EqaSob9B0nIcIRz/KcxCgm+BYO+4hn/3PK14Su6LtPOpJwq5ZCB8BW/gYOz0BIDDD3rKn2QTJHM
	L39spw68uK4Pxh0cvSU1/e5NAJl/CtbT4tFxTpIOqqrzyeAvP8jweZWpuGwOBOV84zuYUWNoiWq
	WxQQZvj/mIdmHjTpbGglNvomKJkacfHzpABOxMfuw7YkrkmBkEwed0w43g==
X-Google-Smtp-Source: AGHT+IFbhr6TKRXwkCurmAT31SRDis1mjzKGAuhFO0ZzdznKHmroXbp056ni2cLo0orO+YGry+0/hQ==
X-Received: by 2002:a05:600c:511b:b0:42c:b750:1a1e with SMTP id 5b1f17b1804b1-43348906b4bmr27745045e9.0.1732110974377;
        Wed, 20 Nov 2024 05:56:14 -0800 (PST)
Received: from localhost (2a02-a210-0a3a-6f80-f04f-3897-bedf-0fb0.cable.dynamic.v6.ziggo.nl. [2a02:a210:a3a:6f80:f04f:3897:bedf:fb0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433b4643194sm19681675e9.40.2024.11.20.05.56.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 05:56:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Nov 2024 14:56:13 +0100
Message-Id: <D5R23G53SGCV.3Q5FLUKYAA5V8@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: imx412: Add missing newline to prints
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Sakari Ailus"
 <sakari.ailus@linux.intel.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241118-imx412-newlines-v1-1-152fe6863838@fairphone.com>
In-Reply-To: <20241118-imx412-newlines-v1-1-152fe6863838@fairphone.com>

On Mon Nov 18, 2024 at 10:45 PM CET, Luca Weiss wrote:
> Add trailing \n to dev_dbg and dev_err prints where missing.
>

Forgot to add:

Fixes: 9214e86c0cc1 ("media: i2c: Add imx412 camera sensor driver")
Cc: stable@vger.kernel.org

> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/media/i2c/imx412.c | 42 +++++++++++++++++++++-------------------=
--
>  1 file changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
> index 0bfe3046fcc8726ef4e484d0fbf980422343fccc..c74097a59c42853ff2a1b600f=
28ff5aacedb1c6b 100644
> --- a/drivers/media/i2c/imx412.c
> +++ b/drivers/media/i2c/imx412.c
> @@ -547,7 +547,7 @@ static int imx412_update_exp_gain(struct imx412 *imx4=
12, u32 exposure, u32 gain)
> =20
>  	lpfr =3D imx412->vblank + imx412->cur_mode->height;
> =20
> -	dev_dbg(imx412->dev, "Set exp %u, analog gain %u, lpfr %u",
> +	dev_dbg(imx412->dev, "Set exp %u, analog gain %u, lpfr %u\n",
>  		exposure, gain, lpfr);
> =20
>  	ret =3D imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 1);
> @@ -594,7 +594,7 @@ static int imx412_set_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_VBLANK:
>  		imx412->vblank =3D imx412->vblank_ctrl->val;
> =20
> -		dev_dbg(imx412->dev, "Received vblank %u, new lpfr %u",
> +		dev_dbg(imx412->dev, "Received vblank %u, new lpfr %u\n",
>  			imx412->vblank,
>  			imx412->vblank + imx412->cur_mode->height);
> =20
> @@ -613,7 +613,7 @@ static int imx412_set_ctrl(struct v4l2_ctrl *ctrl)
>  		exposure =3D ctrl->val;
>  		analog_gain =3D imx412->again_ctrl->val;
> =20
> -		dev_dbg(imx412->dev, "Received exp %u, analog gain %u",
> +		dev_dbg(imx412->dev, "Received exp %u, analog gain %u\n",
>  			exposure, analog_gain);
> =20
>  		ret =3D imx412_update_exp_gain(imx412, exposure, analog_gain);
> @@ -622,7 +622,7 @@ static int imx412_set_ctrl(struct v4l2_ctrl *ctrl)
> =20
>  		break;
>  	default:
> -		dev_err(imx412->dev, "Invalid control %d", ctrl->id);
> +		dev_err(imx412->dev, "Invalid control %d\n", ctrl->id);
>  		ret =3D -EINVAL;
>  	}
> =20
> @@ -803,14 +803,14 @@ static int imx412_start_streaming(struct imx412 *im=
x412)
>  	ret =3D imx412_write_regs(imx412, reg_list->regs,
>  				reg_list->num_of_regs);
>  	if (ret) {
> -		dev_err(imx412->dev, "fail to write initial registers");
> +		dev_err(imx412->dev, "fail to write initial registers\n");
>  		return ret;
>  	}
> =20
>  	/* Setup handler will write actual exposure and gain */
>  	ret =3D  __v4l2_ctrl_handler_setup(imx412->sd.ctrl_handler);
>  	if (ret) {
> -		dev_err(imx412->dev, "fail to setup handler");
> +		dev_err(imx412->dev, "fail to setup handler\n");
>  		return ret;
>  	}
> =20
> @@ -821,7 +821,7 @@ static int imx412_start_streaming(struct imx412 *imx4=
12)
>  	ret =3D imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
>  			       1, IMX412_MODE_STREAMING);
>  	if (ret) {
> -		dev_err(imx412->dev, "fail to start streaming");
> +		dev_err(imx412->dev, "fail to start streaming\n");
>  		return ret;
>  	}
> =20
> @@ -895,7 +895,7 @@ static int imx412_detect(struct imx412 *imx412)
>  		return ret;
> =20
>  	if (val !=3D IMX412_ID) {
> -		dev_err(imx412->dev, "chip id mismatch: %x!=3D%x",
> +		dev_err(imx412->dev, "chip id mismatch: %x!=3D%x\n",
>  			IMX412_ID, val);
>  		return -ENXIO;
>  	}
> @@ -927,7 +927,7 @@ static int imx412_parse_hw_config(struct imx412 *imx4=
12)
>  	imx412->reset_gpio =3D devm_gpiod_get_optional(imx412->dev, "reset",
>  						     GPIOD_OUT_LOW);
>  	if (IS_ERR(imx412->reset_gpio)) {
> -		dev_err(imx412->dev, "failed to get reset gpio %ld",
> +		dev_err(imx412->dev, "failed to get reset gpio %ld\n",
>  			PTR_ERR(imx412->reset_gpio));
>  		return PTR_ERR(imx412->reset_gpio);
>  	}
> @@ -935,13 +935,13 @@ static int imx412_parse_hw_config(struct imx412 *im=
x412)
>  	/* Get sensor input clock */
>  	imx412->inclk =3D devm_clk_get(imx412->dev, NULL);
>  	if (IS_ERR(imx412->inclk)) {
> -		dev_err(imx412->dev, "could not get inclk");
> +		dev_err(imx412->dev, "could not get inclk\n");
>  		return PTR_ERR(imx412->inclk);
>  	}
> =20
>  	rate =3D clk_get_rate(imx412->inclk);
>  	if (rate !=3D IMX412_INCLK_RATE) {
> -		dev_err(imx412->dev, "inclk frequency mismatch");
> +		dev_err(imx412->dev, "inclk frequency mismatch\n");
>  		return -EINVAL;
>  	}
> =20
> @@ -966,14 +966,14 @@ static int imx412_parse_hw_config(struct imx412 *im=
x412)
> =20
>  	if (bus_cfg.bus.mipi_csi2.num_data_lanes !=3D IMX412_NUM_DATA_LANES) {
>  		dev_err(imx412->dev,
> -			"number of CSI2 data lanes %d is not supported",
> +			"number of CSI2 data lanes %d is not supported\n",
>  			bus_cfg.bus.mipi_csi2.num_data_lanes);
>  		ret =3D -EINVAL;
>  		goto done_endpoint_free;
>  	}
> =20
>  	if (!bus_cfg.nr_of_link_frequencies) {
> -		dev_err(imx412->dev, "no link frequencies defined");
> +		dev_err(imx412->dev, "no link frequencies defined\n");
>  		ret =3D -EINVAL;
>  		goto done_endpoint_free;
>  	}
> @@ -1034,7 +1034,7 @@ static int imx412_power_on(struct device *dev)
> =20
>  	ret =3D clk_prepare_enable(imx412->inclk);
>  	if (ret) {
> -		dev_err(imx412->dev, "fail to enable inclk");
> +		dev_err(imx412->dev, "fail to enable inclk\n");
>  		goto error_reset;
>  	}
> =20
> @@ -1145,7 +1145,7 @@ static int imx412_init_controls(struct imx412 *imx4=
12)
>  		imx412->hblank_ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> =20
>  	if (ctrl_hdlr->error) {
> -		dev_err(imx412->dev, "control init failed: %d",
> +		dev_err(imx412->dev, "control init failed: %d\n",
>  			ctrl_hdlr->error);
>  		v4l2_ctrl_handler_free(ctrl_hdlr);
>  		return ctrl_hdlr->error;
> @@ -1183,7 +1183,7 @@ static int imx412_probe(struct i2c_client *client)
> =20
>  	ret =3D imx412_parse_hw_config(imx412);
>  	if (ret) {
> -		dev_err(imx412->dev, "HW configuration is not supported");
> +		dev_err(imx412->dev, "HW configuration is not supported\n");
>  		return ret;
>  	}
> =20
> @@ -1191,14 +1191,14 @@ static int imx412_probe(struct i2c_client *client=
)
> =20
>  	ret =3D imx412_power_on(imx412->dev);
>  	if (ret) {
> -		dev_err(imx412->dev, "failed to power-on the sensor");
> +		dev_err(imx412->dev, "failed to power-on the sensor\n");
>  		goto error_mutex_destroy;
>  	}
> =20
>  	/* Check module identity */
>  	ret =3D imx412_detect(imx412);
>  	if (ret) {
> -		dev_err(imx412->dev, "failed to find sensor: %d", ret);
> +		dev_err(imx412->dev, "failed to find sensor: %d\n", ret);
>  		goto error_power_off;
>  	}
> =20
> @@ -1208,7 +1208,7 @@ static int imx412_probe(struct i2c_client *client)
> =20
>  	ret =3D imx412_init_controls(imx412);
>  	if (ret) {
> -		dev_err(imx412->dev, "failed to init controls: %d", ret);
> +		dev_err(imx412->dev, "failed to init controls: %d\n", ret);
>  		goto error_power_off;
>  	}
> =20
> @@ -1222,14 +1222,14 @@ static int imx412_probe(struct i2c_client *client=
)
>  	imx412->pad.flags =3D MEDIA_PAD_FL_SOURCE;
>  	ret =3D media_entity_pads_init(&imx412->sd.entity, 1, &imx412->pad);
>  	if (ret) {
> -		dev_err(imx412->dev, "failed to init entity pads: %d", ret);
> +		dev_err(imx412->dev, "failed to init entity pads: %d\n", ret);
>  		goto error_handler_free;
>  	}
> =20
>  	ret =3D v4l2_async_register_subdev_sensor(&imx412->sd);
>  	if (ret < 0) {
>  		dev_err(imx412->dev,
> -			"failed to register async subdev: %d", ret);
> +			"failed to register async subdev: %d\n", ret);
>  		goto error_media_entity;
>  	}
> =20
>
> ---
> base-commit: ae58226b89ac0cffa05ba7357733776542e40216
> change-id: 20241118-imx412-newlines-3b0321da960d
>
> Best regards,


