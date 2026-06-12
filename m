Return-Path: <linux-media+bounces-64682-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Lw4xAMbgK2qXGwQAu9opvQ
	(envelope-from <linux-media+bounces-64682-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 12:34:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 615B9678B7D
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 12:34:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=NuUw24qN;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64682-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-64682-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 65825307BFDC
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 10:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F083391512;
	Fri, 12 Jun 2026 10:34:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8560B389E05
	for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 10:34:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260478; cv=none; b=TPA4ZVPv8LDbOtljN7/z0e/avUK9qPnizr0vYNzA4AtPySumF28Orxt6IGuQZugXM9zA4JBTLHQp/nr1kDSmMM7bimI2Tpp7vFQI+QY/Ar9oDoUNDjUe/zWOuDhD9OmWibTCiFK7byj+aqOihdxdJJaawcqeTh215kFfELU18d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260478; c=relaxed/simple;
	bh=q332f//qs/7lWHzxStfraxxnR12Jhs2KA0pej6/0ejc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kSBsS/luvSoq6pIBwM+DcOFg2X4rDhxYBb8VZGjdh4gmwGrt/FIbu+/gi7u+yNu1SNPdBTGtJzbIdLbbKkKJ43cQUgJ2khYTi0GQCQc23DWUoyOH0txhq3sU6oUc/IfP1vKaRtbRynH7Lf18mSGgU7LvZRIULAZuPXorGRGaMz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NuUw24qN; arc=none smtp.client-ip=209.85.208.172
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-396775428d6so1340511fa.3
        for <linux-media@vger.kernel.org>; Fri, 12 Jun 2026 03:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781260475; x=1781865275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgdbnAk3UJEE5zKftaOJQ3yz5TM0Qib/IG+fbBXDUSU=;
        b=NuUw24qNN1gRPRFzdkBNh6fQFrLsF6brBt57VBk75tGtlAYslVQyUNb7OPTHa+MC8w
         c2pEK8SVkzHmPuNFteJ+e/WqUx0XPBhI9OBfJxlJoNVbwvuYilyzYSwlsBQkOH+pwWSv
         MHaA8+T0L7/diSGtLMSzRAJu9xQPk6KEf4/01iqU0W8K3hwZuCj8DtoPZLwBPd/TzFOX
         tD/ELm7oDAnRj5Vt+g8ndzemfeYjlVn7Kbm5ah4GV/hFaalYuu02saymzmgHYVPRaXS0
         eYgbWcEv13PGDwmM4vjOn18Rv3AIp2w1N7l4uCnASUI2/j9OjaEghtCRnX01gAmLgCCV
         gGFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260475; x=1781865275;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KgdbnAk3UJEE5zKftaOJQ3yz5TM0Qib/IG+fbBXDUSU=;
        b=FkNomRW6rzjiUhV0J+nuG1kKgHeQTdn/HSTz7P4/UJepwKK/zOoyFm2UysYmO+qCt/
         vcZqd87hFsqeL4ivw7XR1onIpLZUEO/NjUpiCPU1jL3orfRwsWNVp+JdCNl/jm2//cyH
         ZdvHZ8bLgZZ3+MoQB8p/W3qfcdpoyaK6p7Ww93ceHrleoTILe6QQ+uA7RUyTGsNZo1k+
         8EW0xo3wWhcTv5z/rlE2Mo4iXMCoKKgqSz2mTcDj+JrabY+cPny2xL4olgYyvq8YEumO
         mSbIvAwN3uylGYPuGScVd6TN/EaHPUBwLr517fsuXRE3Fy3KcoDGdQqTnDSPVhTt4BY2
         9WaA==
X-Forwarded-Encrypted: i=1; AFNElJ9FVEsbFImhM4g32jOsuywnH1Bqtun7YEHV/IiwBn6k3Er2ay8IE7TzyyG1VfeihF4kEskYx6woCt0ovw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzza1OLHAzTCdqgiF9Owjmydnqvai5e/V+FBuh5BlKPWcOklEZH
	+tAFUKaWSZNyqgQFW+kyKhx37K39b5Q5VW8R6+6OruH73b6SiMl4fPWUHxgkVgdNGrI=
X-Gm-Gg: Acq92OGiFbhEnicyXDZNcFNTuO6wjQ11f2zvRXUqrtlIL+nFhlsu4iScjjVnxAAO4GG
	6VXJKtk5lPeqY5Mye81/tM6G3230xTUPj/UwH/GQY61fIOp7m54NDPL4DtCtpfECUfRznxY8/D+
	Qg4Xo/DUFNgabPq08qNzRghxrsvcbhCflCAhnu4CSkx9lemE7iDE5jhVQO89qw1ISGUwU6qrnID
	aezGbJUs9tPxnqdTbjgJ9B4ESOt9HEjzH5uX8bkyEc3lf2chs0ZNT5lcrbDJTtlb8b44ss/l5oW
	y8BXy/+gugynekj6oDRs9+qDdHDfR9jkRTQxUyYYFLRdTMIPNyrwVu0wKYzIGiHtzZP8QVCe/yi
	AfcVNSZYFj1pjYcfa/nxWSATLWQzY/7XBMnmcAGSsd+QWZzKA+oRampNh8UJQMKYJ6JOkd6ZbLY
	s7Wdxb5KG/LLhkbyp6J3/r6SXPKFhAj15X6JQnUx2SpzlxxAucu8gfw9jPsARiDX707JIVHbShp
	eNeCw==
X-Received: by 2002:a05:6512:12c8:b0:5ad:2ac0:9fb0 with SMTP id 2adb3069b0e04-5ad2db7474bmr375307e87.4.1781260474515;
        Fri, 12 Jun 2026 03:34:34 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1ae1f2sm427142e87.61.2026.06.12.03.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 03:34:33 -0700 (PDT)
Message-ID: <0f4bfe08-0504-48ff-83ce-c84600e6f38d@linaro.org>
Date: Fri, 12 Jun 2026 13:34:32 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] media: i2c: os02g10: implement crop handling with
 set_selection
To: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>,
 Hans de Goede <johannes.goede@oss.qualcomm.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
 <20260424092554.26130-4-elgin.perumbilly@siliconsignals.io>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260424092554.26130-4-elgin.perumbilly@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-64682-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:elgin.perumbilly@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:tarang.raval@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:mehdi.djait@linux.intel.com,m:sylvain.petinot@foss.st.com,m:benjamin.mugnier@foss.st.com,m:bryan.odonoghue@linaro.org,m:heimir.sverrisson@gmail.com,m:hardevsinh.palaniya@siliconsignals.io,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linux.intel.com,foss.st.com,linaro.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,siliconsignals.io:email,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 615B9678B7D

On 4/24/26 12:25, Elgin Perumbilly wrote:
> From: Tarang Raval <tarang.raval@siliconsignals.io>
> 
> Add crop support to os02g10 by implementing .set_selection() and
> storing the crop rectangle in subdev state.
> 
> Initialize the default crop to the active area, make set_fmt() use the
> current crop, and update the output format when the crop size changes.
> Also program the sensor window from the active crop/format state instead
> of using the fixed supported_modes entry.
> 
> This allows userspace to configure the sensor crop window explicitly.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> ---
>   drivers/media/i2c/os02g10.c | 166 ++++++++++++++++++++++--------------
>   1 file changed, 103 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/media/i2c/os02g10.c b/drivers/media/i2c/os02g10.c
> index fad2dd0ad7aa..9bf8f5d1caea 100644
> --- a/drivers/media/i2c/os02g10.c
> +++ b/drivers/media/i2c/os02g10.c
> @@ -112,6 +112,11 @@
>   #define OS02G10_ORIENTATION_BAYER_FIX		0x32
>   
>   #define OS02G10_LINK_FREQ_720MHZ		(720 * HZ_PER_MHZ)
> +#define OS02G10_WINDOW_WIDTH_MIN		2
> +#define OS02G10_WINDOW_HEIGHT_MIN		2

Add a blank line before the new group of macro.

> +#define OS02G10_VBLANK_DEF			166

This one is computable, and it can be dropped.

> +#define OS02G10_VBLANK_MIN			25

This macro shall be added to the group of OS02G10_REG_FRAME_LENGTH
register, and it should be included into the previous change.

> +#define OS02G10_EXPOSURE_DEF			1100

This macro shall be added to the group of OS02G10_REG_LONG_EXPOSURE
register, and it should be included into the previous change.

>   
>   /* OS02G10 native and active pixel array size */
>   static const struct v4l2_rect os02g10_native_area = {
> @@ -152,15 +157,6 @@ struct os02g10 {
>   	struct v4l2_ctrl *hflip;
>   };
>   
> -struct os02g10_mode {
> -	u32 width;
> -	u32 height;
> -	u32 vts_def;
> -	u32 exp_def;
> -	u32 x_start;
> -	u32 y_start;
> -};
> -
>   static const struct cci_reg_sequence os02g10_common_regs[] = {
>   	{ OS02G10_REG_PLL_DIV_CTRL,		0x0a},
>   	{ OS02G10_REG_PLL_DCTL_BIAS_CTRL,	0x04},
> @@ -245,17 +241,6 @@ static const struct cci_reg_sequence os02g10_common_regs[] = {
>   	{ OS02G10_REG_MIPI_TX_SPEED_CTRL,	0x05},
>   };
>   
> -static const struct os02g10_mode supported_modes[] = {
> -	{
> -		.width = 1920,
> -		.height = 1080,
> -		.vts_def = 1246,
> -		.exp_def = 1100,
> -		.x_start = 2,
> -		.y_start = 6,
> -	},
> -};
> -
>   static const s64 link_freq_menu_items[] = {
>   	OS02G10_LINK_FREQ_720MHZ,
>   };
> @@ -295,11 +280,12 @@ static int os02g10_set_ctrl(struct v4l2_ctrl *ctrl)
>   	if (ctrl->id == V4L2_CID_VBLANK) {
>   		/* Honour the VBLANK limits when setting exposure */
>   		s64 max = fmt->height + ctrl->val - OS02G10_EXPOSURE_MARGIN;
> +		s64 def = (max < OS02G10_EXPOSURE_DEF) ? max
> +			  : OS02G10_EXPOSURE_DEF;
>   
>   		ret = __v4l2_ctrl_modify_range(os02g10->exposure,
>   					       os02g10->exposure->minimum, max,
> -					       os02g10->exposure->step,
> -					       os02g10->exposure->default_value);
> +					       os02g10->exposure->step, def);
>   		if (ret)
>   			return ret;
>   	}
> @@ -362,10 +348,9 @@ static const struct v4l2_ctrl_ops os02g10_ctrl_ops = {
>   
>   static int os02g10_init_controls(struct os02g10 *os02g10)
>   {
> -	const struct os02g10_mode *mode = &supported_modes[0];
>   	struct v4l2_fwnode_device_properties props;
> -	u64 vblank_def, exp_max, pixel_rate;
>   	struct v4l2_ctrl_handler *ctrl_hdlr;
> +	u64 exp_max, pixel_rate;
>   	int ret;
>   
>   	ctrl_hdlr = &os02g10->handler;
> @@ -384,18 +369,19 @@ static int os02g10_init_controls(struct os02g10 *os02g10)
>   	if (os02g10->link_freq)
>   		os02g10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>   
> -	vblank_def = mode->vts_def - mode->height;
>   	os02g10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
> -					    V4L2_CID_VBLANK, vblank_def,
> -					    OS02G10_FRAME_LENGTH_MAX - mode->height,
> -					    1, vblank_def);
> +					    V4L2_CID_VBLANK, OS02G10_VBLANK_MIN,
> +					    OS02G10_FRAME_LENGTH_MAX -
> +					    os02g10_active_area.height,
> +					    1, OS02G10_VBLANK_DEF);
>   
> -	exp_max = mode->vts_def - OS02G10_EXPOSURE_MARGIN;
> +	exp_max = OS02G10_VBLANK_DEF + os02g10_active_area.height
> +		  - OS02G10_EXPOSURE_MARGIN;
>   	os02g10->exposure =
>   		v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
>   				  V4L2_CID_EXPOSURE,
>   				  OS02G10_EXPOSURE_MIN, exp_max,
> -				  OS02G10_EXPOSURE_STEP, mode->exp_def);
> +				  OS02G10_EXPOSURE_STEP, OS02G10_EXPOSURE_DEF);
>   
>   	v4l2_ctrl_new_std(ctrl_hdlr, &os02g10_ctrl_ops,
>   			  V4L2_CID_ANALOGUE_GAIN, OS02G10_ANALOG_GAIN_MIN,
> @@ -445,20 +431,18 @@ static int os02g10_set_framefmt(struct os02g10 *os02g10,
>   				struct v4l2_subdev_state *state)
>   {
>   	const struct v4l2_mbus_framefmt *format;
> -	const struct os02g10_mode *mode;
> +	const struct v4l2_rect *crop;
>   	int ret = 0;
>   
> +	crop = v4l2_subdev_state_get_crop(state, 0);
>   	format = v4l2_subdev_state_get_format(state, 0);
> -	mode = v4l2_find_nearest_size(supported_modes,
> -				      ARRAY_SIZE(supported_modes), width,
> -				      height, format->width, format->height);
>   
> -	cci_write(os02g10->cci, OS02G10_REG_V_START, mode->y_start, &ret);
> -	cci_write(os02g10->cci, OS02G10_REG_V_SIZE, mode->height, &ret);
> -	cci_write(os02g10->cci, OS02G10_REG_V_SIZE_MIPI, mode->height, &ret);
> -	cci_write(os02g10->cci, OS02G10_REG_H_START, mode->x_start, &ret);
> -	cci_write(os02g10->cci, OS02G10_REG_H_SIZE, mode->width, &ret);
> -	cci_write(os02g10->cci, OS02G10_REG_H_SIZE_MIPI, mode->width, &ret);
> +	cci_write(os02g10->cci, OS02G10_REG_V_START, crop->top, &ret);
> +	cci_write(os02g10->cci, OS02G10_REG_V_SIZE, crop->height, &ret);
> +	cci_write(os02g10->cci, OS02G10_REG_V_SIZE_MIPI, format->height, &ret);
> +	cci_write(os02g10->cci, OS02G10_REG_H_START, crop->left, &ret);
> +	cci_write(os02g10->cci, OS02G10_REG_H_SIZE, crop->width, &ret);
> +	cci_write(os02g10->cci, OS02G10_REG_H_SIZE_MIPI, format->width, &ret);
>   
>   	return ret;
>   }
> @@ -528,16 +512,67 @@ static int os02g10_disable_streams(struct v4l2_subdev *sd,
>   	return ret;
>   }
>   
> +static int os02g10_set_selection(struct v4l2_subdev *sd,
> +				 struct v4l2_subdev_state *sd_state,
> +				 struct v4l2_subdev_selection *sel)
> +{
> +	struct v4l2_mbus_framefmt *format;
> +	struct v4l2_rect *crop;
> +	struct v4l2_rect rect;
> +
> +	if (sel->target != V4L2_SEL_TGT_CROP)
> +		return -EINVAL;
> +
> +	rect.left = clamp_t(unsigned int, ALIGN(sel->r.left, 2),
> +			    os02g10_active_area.left,
> +			    os02g10_active_area.left +
> +			    os02g10_active_area.width -
> +			    OS02G10_WINDOW_WIDTH_MIN);
> +	rect.top = clamp_t(unsigned int, ALIGN(sel->r.top, 2),
> +			   os02g10_active_area.top,
> +			   os02g10_active_area.top +
> +			   os02g10_active_area.height -
> +			   OS02G10_WINDOW_HEIGHT_MIN);
> +	rect.width = clamp_t(unsigned int, ALIGN(sel->r.width, 2),
> +			     OS02G10_WINDOW_WIDTH_MIN,
> +			     os02g10_active_area.width);
> +	rect.height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
> +			      OS02G10_WINDOW_HEIGHT_MIN,
> +			      os02g10_active_area.height);
> +
> +	rect.width = min_t(unsigned int, rect.width,
> +			   os02g10_active_area.left +
> +			   os02g10_active_area.width - rect.left);
> +	rect.height = min_t(unsigned int, rect.height,
> +			    os02g10_active_area.top +
> +			    os02g10_active_area.height - rect.top);
> +
> +	crop = v4l2_subdev_state_get_crop(sd_state, sel->pad);
> +
> +	if (rect.width != crop->width || rect.height != crop->height) {
> +		format = v4l2_subdev_state_get_format(sd_state, sel->pad);
> +		format->width = rect.width;
> +		format->height = rect.height;
> +	}
> +
> +	*crop = rect;
> +	sel->r = rect;
> +
> +	return 0;
> +}
> +
>   static int os02g10_get_selection(struct v4l2_subdev *sd,
>   				 struct v4l2_subdev_state *sd_state,
>   				 struct v4l2_subdev_selection *sel)
>   {
>   	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
> +		return 0;
>   	case V4L2_SEL_TGT_CROP_BOUNDS:
>   	case V4L2_SEL_TGT_NATIVE_SIZE:
>   		sel->r = os02g10_native_area;
>   		return 0;
> -	case V4L2_SEL_TGT_CROP:
>   	case V4L2_SEL_TGT_CROP_DEFAULT:
>   		sel->r = os02g10_active_area;
>   		return 0;
> @@ -566,16 +601,16 @@ static int os02g10_enum_frame_size(struct v4l2_subdev *sd,
>   {
>   	struct os02g10 *os02g10 = to_os02g10(sd);
>   
> -	if (fse->index >= ARRAY_SIZE(supported_modes))
> +	if (fse->index)
>   		return -EINVAL;
>   
>   	if (fse->code != os02g10_get_format_code(os02g10))
>   		return -EINVAL;
>   
> -	fse->min_width = supported_modes[fse->index].width;
> -	fse->max_width = fse->min_width;
> -	fse->min_height = supported_modes[fse->index].height;
> -	fse->max_height = fse->min_height;
> +	fse->min_width = OS02G10_WINDOW_WIDTH_MIN;
> +	fse->max_width = os02g10_active_area.width;
> +	fse->min_height = OS02G10_WINDOW_HEIGHT_MIN;
> +	fse->max_height = os02g10_active_area.height;
>   
>   	return 0;
>   }
> @@ -586,18 +621,14 @@ static int os02g10_set_pad_format(struct v4l2_subdev *sd,
>   {
>   	struct os02g10 *os02g10 = to_os02g10(sd);
>   	struct v4l2_mbus_framefmt *format;
> -	const struct os02g10_mode *mode;
> +	struct v4l2_rect *crop;
>   
> +	crop = v4l2_subdev_state_get_crop(sd_state, 0);
>   	format = v4l2_subdev_state_get_format(sd_state, 0);
>   
> -	mode = v4l2_find_nearest_size(supported_modes,
> -				      ARRAY_SIZE(supported_modes),
> -				      width, height,
> -				      fmt->format.width, fmt->format.height);
> -
>   	fmt->format.code = os02g10_get_format_code(os02g10);
> -	fmt->format.width = mode->width;
> -	fmt->format.height = mode->height;
> +	fmt->format.width = crop->width;
> +	fmt->format.height = crop->height;
>   	fmt->format.field = V4L2_FIELD_NONE;
>   	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
>   	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
> @@ -606,11 +637,19 @@ static int os02g10_set_pad_format(struct v4l2_subdev *sd,
>   	*format = fmt->format;
>   
>   	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -		u32 vblank_def = mode->vts_def - mode->height;
> +		int ret, vblank;
>   
> -		int ret = __v4l2_ctrl_modify_range(os02g10->vblank, vblank_def,
> -						   OS02G10_FRAME_LENGTH_MAX -
> -						   mode->height, 1, vblank_def);
> +		ret = __v4l2_ctrl_modify_range(os02g10->vblank, OS02G10_VBLANK_MIN,
> +					       OS02G10_FRAME_LENGTH_MAX -
> +					       fmt->format.height, 1,
> +					       OS02G10_VBLANK_DEF);
> +		if (ret)
> +			return ret;
> +
> +		/* Set VBLANK to maintain 30 fps for the selected format. */
> +		vblank = os02g10_active_area.height - fmt->format.height
> +			 + OS02G10_VBLANK_DEF;
> +		ret = __v4l2_ctrl_s_ctrl(os02g10->vblank, vblank);
>   		if (ret)
>   			return ret;
>   	}
> @@ -626,14 +665,14 @@ static int os02g10_init_state(struct v4l2_subdev *sd,
>   		.which = V4L2_SUBDEV_FORMAT_TRY,
>   		.format = {
>   			.code = os02g10_get_format_code(os02g10),
> -			.width = supported_modes[0].width,
> -			.height = supported_modes[0].height,
> +			.width = os02g10_active_area.width,
> +			.height = os02g10_active_area.height,
>   		},
>   	};
> +	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
> +	*crop = os02g10_active_area;
>   
> -	os02g10_set_pad_format(sd, state, &fmt);
> -
> -	return 0;
> +	return os02g10_set_pad_format(sd, state, &fmt);
>   }
>   
>   static const struct v4l2_subdev_video_ops os02g10_video_ops = {
> @@ -645,6 +684,7 @@ static const struct v4l2_subdev_pad_ops os02g10_pad_ops = {
>   	.get_fmt = v4l2_subdev_get_fmt,
>   	.set_fmt = os02g10_set_pad_format,
>   	.get_selection = os02g10_get_selection,
> +	.set_selection = os02g10_set_selection,
>   	.enum_frame_size = os02g10_enum_frame_size,
>   	.enable_streams = os02g10_enable_streams,
>   	.disable_streams = os02g10_disable_streams,

I understand that this change is written by another person, and likely
it is not squashed with the previous one to preserve authorship, however
it significantly rewrites the change already found in the series.

I don't see information about the maximum supported frame height/width
or default VTS setting etc. anymore, for me it's hard to say, if
this kind of information can be dropped with no consequences in runtime.

Probably this 3/3 change will break a quick inclusion of the sensor
driver, you may consider to exlcude it from the series now, and publish
it afterwards.

-- 
Best wishes,
Vladimir

