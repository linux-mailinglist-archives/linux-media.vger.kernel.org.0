Return-Path: <linux-media+bounces-42893-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B2FB8F303
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 08:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7C877A448B
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 06:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D84C2264A0;
	Mon, 22 Sep 2025 06:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nP7VXSl1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54F8A55;
	Mon, 22 Sep 2025 06:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758523590; cv=none; b=U4Oh+Wcgwsf6xNvdxi6muZs4qOn8DMzP9tWWWWgUiqXb1hDM1PjVL+kRlCWeyvVt8DiugrAbju2v2fUFiDJ4rMxB9mTnlPCejYU0lwNiKhPwzesAYeSfcIdv3dGnf+mI9QQ4cSmg118Qmni0hXYOWrnoCkEGxjFboKopBFyjLPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758523590; c=relaxed/simple;
	bh=mp29UBXZYvpEtP1el7OKjbHwlHEypaNYsUJfhUBttwQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=l25zKC3G2PAbqYHLaWqZIv9BGR1Tkb6Ltsm555gGxrBneQZ0teet1uGXP1NmQxnPu78LmcgHY5UHnOQJwQ5P7gPzqRkec7g5cy0TDwN7oWGZbNwlqkRZ9TitBR4bJi933J8uv+2VRK1fgIrlvkbS7BgyeSmvxO8sMR3eRs9LdOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nP7VXSl1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DC5C4CEF0;
	Mon, 22 Sep 2025 06:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758523590;
	bh=mp29UBXZYvpEtP1el7OKjbHwlHEypaNYsUJfhUBttwQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=nP7VXSl1degD44CnUCKz8XyH1Y/s9xpLGdhM9qwWmJuXpdoF576t7wIoG+s3pSbOM
	 0+hSoze0v+fM5ObE64bldFy1KMOLs2vuHU0i0JHaniSbexXjprQcImtoj4KwwnlSgR
	 R9CnU6RUQnYC3MuC2mMRo6cRaWVc/IoQhmL7dPOV5qumigrlxjncHqj2ciiigLNcVY
	 Cy3Yghr806XVKrOvYM7UZIERQR8BemLI5iRJbmEoeHjd/vcf3UDZsGPALGT1jO7PG5
	 Vz4Tzh8sPu+6a3Q615qHMAmX5q4gapKyarsrZZsn6MzitPUv1VQ1K0BxkNyc4BayRl
	 bzlgRJe0ZVVBA==
Message-ID: <a317e3e5-d1fc-4d87-8fb7-c47adf7c5a69@kernel.org>
Date: Mon, 22 Sep 2025 08:46:26 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: hverkuil+cisco@kernel.org
Subject: Re: [PATCH v4] media: i2c: wm8775: parameterize wm8775_platform_data
 based on config
To: Alex Tran <alex.t.tran@gmail.com>, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org, hansg@kernel.org,
 ribalda@chromium.org, laurent.pinchart@ideasonboard.com, cascardo@igalia.com
References: <20250921190155.1013277-1-alex.t.tran@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20250921190155.1013277-1-alex.t.tran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alex,

On 21/09/2025 21:01, Alex Tran wrote:
> Parameterized wm8775_platform_data struct, removing the single boolean
> for determining device type. wm8775_standard_cfg struct will be used
> for standard devices and wm8775_nova_s_cfg for nova_s devices. 

Thank you for your patch, but since this driver is ancient, and has not seen new
development for years, I don't think it is a good idea to apply this.

It just increases the code size, and causes unnecessary code churn.

It might be interesting if we get more exceptions like the nova_s, but that
is highly unlikely.

Rejected-by: Hans Verkuil <hverkuil+cisco@kernel.org>

Regards,

	Hans

> 
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>
> ---
> Changes in v2:
> - rebased from mchehab linux media onto media committers tree
> - resolve patch and build errors
> Changes in v3:
> - cc updated maintainers list
> Changes in v4:
> - exported config symbols
> - cx88_core wm8775_data field converted to pointer
>  drivers/media/i2c/wm8775.c          | 111 ++++++++++++++++------------
>  drivers/media/pci/cx88/cx88-video.c |   6 +-
>  drivers/media/pci/cx88/cx88.h       |   2 +-
>  include/media/i2c/wm8775.h          |  25 +++++--
>  4 files changed, 87 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/media/i2c/wm8775.c b/drivers/media/i2c/wm8775.c
> index 56778d3bc..a6c605303 100644
> --- a/drivers/media/i2c/wm8775.c
> +++ b/drivers/media/i2c/wm8775.c
> @@ -50,6 +50,45 @@ struct wm8775_state {
>  	u8 input;		/* Last selected input (0-0xf) */
>  };
>  
> +struct wm8775_platform_data wm8775_standard_cfg = {
> +	.reset = 0x000, /* RESET */
> +	.zero_cross_timeout = 0x000, /* Disable zero cross detect timeout */
> +	.interface_ctrl =
> +		0x021, /* HPF enable, left justified, 24-bit (Philips) mode */
> +	.master_mode = 0x102, /* Master mode, clock ratio 256fs */
> +	.powerdown = 0x000, /* Powered up */
> +	.adc_l = 0x1d4, /* ADC gain +2.5dB, enable zero cross */
> +	.adc_r = 0x1d4, /* ADC gain +2.5dB, enable zero cross */
> +	.alc_ctrl_1 =
> +		0x1bf, /* ALC Stereo, ALC target level -1dB FS max gain +8dB */
> +	.alc_ctrl_2 = 0x185, /* Enable gain control, ALC hold time 42.6 ms */
> +	.alc_ctrl_3 = 0x0a2, /* Ramp up delay 34 s, ramp down delay 33 ms */
> +	.noise_gate = 0x005, /* Enable noise gate, threshold -72dBfs */
> +	.limiter_ctrl = 0x07a, /* Window 4ms, lower PGA gain limit -1dB */
> +	.adc_mixer = 0x102, /* LRBOTH = 1, use input 2. */
> +	.should_set_audio = false,
> +};
> +EXPORT_SYMBOL_GPL(wm8775_standard_cfg);
> +
> +struct wm8775_platform_data wm8775_nova_s_cfg = {
> +	.reset = 0x000, /* RESET */
> +	.zero_cross_timeout = 0x000, /* Disable zero cross detect timeout */
> +	.interface_ctrl =
> +		0x021, /* HPF enable, left justified, 24-bit (Philips) mode */
> +	.master_mode = 0x102, /* Master mode, clock ratio 256fs */
> +	.powerdown = 0x000, /* Powered up */
> +	.adc_l = WM8775_REG_UNUSED,
> +	.adc_r = WM8775_REG_UNUSED,
> +	.alc_ctrl_1 = 0x1bb, /* Stereo, target level -5dB FS, max gain +8dB */
> +	.alc_ctrl_2 = WM8775_REG_UNUSED,
> +	.alc_ctrl_3 = 0x0a2, /* Ramp up delay 34 s, ramp down delay 33 ms */
> +	.noise_gate = 0x005, /* Enable noise gate, threshold -72dBfs */
> +	.limiter_ctrl = 0x0fb, /* Transient window 4ms, ALC min gain -5dB  */
> +	.adc_mixer = WM8775_REG_UNUSED,
> +	.should_set_audio = true, /* set volume/mute/mux */
> +};
> +EXPORT_SYMBOL_GPL(wm8775_nova_s_cfg);
> +
>  static inline struct wm8775_state *to_state(struct v4l2_subdev *sd)
>  {
>  	return container_of(sd, struct wm8775_state, sd);
> @@ -195,12 +234,8 @@ static int wm8775_probe(struct i2c_client *client)
>  	struct wm8775_state *state;
>  	struct v4l2_subdev *sd;
>  	int err;
> -	bool is_nova_s = false;
> -
> -	if (client->dev.platform_data) {
> -		struct wm8775_platform_data *data = client->dev.platform_data;
> -		is_nova_s = data->is_nova_s;
> -	}
> +	struct wm8775_platform_data *data = client->dev.platform_data ?:
> +						    &wm8775_standard_cfg;
>  
>  	/* Check if the adapter supports the needed features */
>  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
> @@ -233,49 +268,29 @@ static int wm8775_probe(struct i2c_client *client)
>  	}
>  
>  	/* Initialize wm8775 */
> +	wm8775_write(sd, R23, data->reset);
> +	wm8775_write(sd, R7, data->zero_cross_timeout);
> +	wm8775_write(sd, R11, data->interface_ctrl);
> +	wm8775_write(sd, R12, data->master_mode);
> +	wm8775_write(sd, R13, data->powerdown);
> +	if (data->adc_l != WM8775_REG_UNUSED)
> +		wm8775_write(sd, R14, data->adc_l);
> +	if (data->adc_r != WM8775_REG_UNUSED)
> +		wm8775_write(sd, R15, data->adc_r);
> +	wm8775_write(sd, R16, data->alc_ctrl_1);
> +	if (data->alc_ctrl_2 != WM8775_REG_UNUSED)
> +		wm8775_write(sd, R17, data->alc_ctrl_2);
> +	else
> +		wm8775_write(sd, R17,
> +			     (state->loud->val ? ALC_EN : 0) | ALC_HOLD);
> +	wm8775_write(sd, R18, data->alc_ctrl_3);
> +	wm8775_write(sd, R19, data->noise_gate);
> +	wm8775_write(sd, R20, data->limiter_ctrl);
> +	if (data->adc_mixer != WM8775_REG_UNUSED)
> +		wm8775_write(sd, R21, data->adc_mixer);
> +	if (data->should_set_audio)
> +		wm8775_set_audio(sd, 1);
>  
> -	/* RESET */
> -	wm8775_write(sd, R23, 0x000);
> -	/* Disable zero cross detect timeout */
> -	wm8775_write(sd, R7, 0x000);
> -	/* HPF enable, left justified, 24-bit (Philips) mode */
> -	wm8775_write(sd, R11, 0x021);
> -	/* Master mode, clock ratio 256fs */
> -	wm8775_write(sd, R12, 0x102);
> -	/* Powered up */
> -	wm8775_write(sd, R13, 0x000);
> -
> -	if (!is_nova_s) {
> -		/* ADC gain +2.5dB, enable zero cross */
> -		wm8775_write(sd, R14, 0x1d4);
> -		/* ADC gain +2.5dB, enable zero cross */
> -		wm8775_write(sd, R15, 0x1d4);
> -		/* ALC Stereo, ALC target level -1dB FS max gain +8dB */
> -		wm8775_write(sd, R16, 0x1bf);
> -		/* Enable gain control, use zero cross detection,
> -		   ALC hold time 42.6 ms */
> -		wm8775_write(sd, R17, 0x185);
> -	} else {
> -		/* ALC stereo, ALC target level -5dB FS, ALC max gain +8dB */
> -		wm8775_write(sd, R16, 0x1bb);
> -		/* Set ALC mode and hold time */
> -		wm8775_write(sd, R17, (state->loud->val ? ALC_EN : 0) | ALC_HOLD);
> -	}
> -	/* ALC gain ramp up delay 34 s, ALC gain ramp down delay 33 ms */
> -	wm8775_write(sd, R18, 0x0a2);
> -	/* Enable noise gate, threshold -72dBfs */
> -	wm8775_write(sd, R19, 0x005);
> -	if (!is_nova_s) {
> -		/* Transient window 4ms, lower PGA gain limit -1dB */
> -		wm8775_write(sd, R20, 0x07a);
> -		/* LRBOTH = 1, use input 2. */
> -		wm8775_write(sd, R21, 0x102);
> -	} else {
> -		/* Transient window 4ms, ALC min gain -5dB  */
> -		wm8775_write(sd, R20, 0x0fb);
> -
> -		wm8775_set_audio(sd, 1);      /* set volume/mute/mux */
> -	}
>  	return 0;
>  }
>  
> diff --git a/drivers/media/pci/cx88/cx88-video.c b/drivers/media/pci/cx88/cx88-video.c
> index 0c8732768..2054daeba 100644
> --- a/drivers/media/pci/cx88/cx88-video.c
> +++ b/drivers/media/pci/cx88/cx88-video.c
> @@ -1348,14 +1348,14 @@ static int cx8800_initdev(struct pci_dev *pci_dev,
>  		struct i2c_board_info wm8775_info = {
>  			.type = "wm8775",
>  			.addr = 0x36 >> 1,
> -			.platform_data = &core->wm8775_data,
> +			.platform_data = core->wm8775_data,
>  		};
>  		struct v4l2_subdev *sd;
>  
>  		if (core->boardnr == CX88_BOARD_HAUPPAUGE_NOVASPLUS_S1)
> -			core->wm8775_data.is_nova_s = true;
> +			core->wm8775_data = &wm8775_nova_s_cfg;
>  		else
> -			core->wm8775_data.is_nova_s = false;
> +			core->wm8775_data = &wm8775_standard_cfg;
>  
>  		sd = v4l2_i2c_new_subdev_board(&core->v4l2_dev, &core->i2c_adap,
>  					       &wm8775_info, NULL);
> diff --git a/drivers/media/pci/cx88/cx88.h b/drivers/media/pci/cx88/cx88.h
> index 2ff3226a5..c8f85d2f4 100644
> --- a/drivers/media/pci/cx88/cx88.h
> +++ b/drivers/media/pci/cx88/cx88.h
> @@ -391,7 +391,7 @@ struct cx88_core {
>  
>  	/* I2C remote data */
>  	struct IR_i2c_init_data    init_data;
> -	struct wm8775_platform_data wm8775_data;
> +	struct wm8775_platform_data *wm8775_data;
>  
>  	struct mutex               lock;
>  	/* various v4l controls */
> diff --git a/include/media/i2c/wm8775.h b/include/media/i2c/wm8775.h
> index a02695ee3..99678d165 100644
> --- a/include/media/i2c/wm8775.h
> +++ b/include/media/i2c/wm8775.h
> @@ -20,13 +20,28 @@
>  #define WM8775_AIN3 4
>  #define WM8775_AIN4 8
>  
> +#define WM8775_REG_UNUSED ((u16)-1)
>  
>  struct wm8775_platform_data {
> -	/*
> -	 * FIXME: Instead, we should parameterize the params
> -	 * that need different settings between ivtv, pvrusb2, and Nova-S
> -	 */
> -	bool is_nova_s;
> +	u16 reset; /* RESET (R23) */
> +	u16 zero_cross_timeout; /* Zero cross detect timeout (R7) */
> +	u16 interface_ctrl; /* Interface control (R11) */
> +	u16 master_mode; /* Master mode (R12) */
> +	u16 powerdown; /* Power down (R13) */
> +
> +	u16 adc_l; /* ADC left (R14) */
> +	u16 adc_r; /* ADC right (R15) */
> +	u16 alc_ctrl_1; /* ALC control 1 (R16)*/
> +	u16 alc_ctrl_2; /* ALC control 2 (R17) */
> +	u16 alc_ctrl_3; /* ALC control 3 (R18) */
> +	u16 noise_gate; /* Noise gate (R19) */
> +	u16 limiter_ctrl; /* Limiter control (R20) */
> +	u16 adc_mixer; /* ADC mixer control (R21) */
> +
> +	bool should_set_audio;
>  };
>  
> +extern struct wm8775_platform_data wm8775_nova_s_cfg;
> +extern struct wm8775_platform_data wm8775_standard_cfg;
> +
>  #endif


