Return-Path: <linux-media+bounces-66362-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4BoZGb9kRmpXSgsAu9opvQ
	(envelope-from <linux-media+bounces-66362-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:16:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA9D6F8370
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:16:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=vbZfgiV8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66362-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-66362-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25DC430E9270
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 13:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58A9649252E;
	Thu,  2 Jul 2026 13:10:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9CA4534BB
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 13:10:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997858; cv=none; b=jQZYrdl8dMzorngINZ8BP72T0VzxYGS3SQGDve2OluPvAU8jYziCItOWoaiqH8xGO1U2t5fN7k7vWll9VUke+gSufDSm3FZoFpAhbm/iuXAxtlBDBv6rbhJCekZD6kvWNx4YHOg+vsjs9FQHXAqUhmi4U07F45bxooxzW5jm3ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997858; c=relaxed/simple;
	bh=ZsGoUaagSoyVg9JFYK/yyvuM/6qeeT45Iw4A0ax4t2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1CnDfQLUfACbq9hmuZO8CJtuZL7Ax1RrBrw90OZRIfb17hEa3+I4bfy48TtX4QrMLGTvrdkV3L+4ow5nU28lLmN5ZLvg4PJJ7Dp5QdQhu0YHemvk9NirTvXadpBfiT12Gsvopre2ivZjGJ6cUeS1NMOf7ppZ4f5rOneWl4x+lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vbZfgiV8; arc=none smtp.client-ip=209.85.167.50
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aebd7da975so228404e87.2
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 06:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782997854; x=1783602654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5NNNzuIeXQFoc+XgbGgwjG1/j/CSu7vr8nVpaLHNyRk=;
        b=vbZfgiV8A9r/ycTUb9fGitY54Ty5cKFAo3Vt6RHPcR5dGHhKXyovjEYzkE2fsMXtas
         42pcqJLbHp8rPh8vrGqbULCfARS/l6KGiitxeFbkgxu0FvN2KwYc4SroAq4pAc7MDvJK
         w1W/XYMzecu/ZynKKpeGmJ5rXoxTJ8+wZjSAy3IX7FasHL25mt01VXANFA52pZX/pI5D
         NrgbomVxAbPc+PIaF8rVPfak5DOY4RL/iKp/zTKikQ0lZYe/sFMMLv1UZnF+9/XBT2iL
         iVE3cQQZvAW+STt06NQwmD34eox+zbLc1Bv0ZB9jwf9hZaHq01ibA3qlZU81IDWJ1PxZ
         ZP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782997854; x=1783602654;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NNNzuIeXQFoc+XgbGgwjG1/j/CSu7vr8nVpaLHNyRk=;
        b=Zkqn7kcI3bKj71aAmNnGTMVeEWXQoD9hhzs2Fsle20o+Qdhfc71WNeOt6AT1jussns
         Y1Hp9z4cmHk/CR5EW+8uoCA+0K0to3MoPAeNVjKESVc16xNBgrbqQcLneMBDqE2bNN6w
         p7yFMe6xKxKB5BmkGbDAXwJp254xaoJrpS87vFXY27PAH2ujHdowl/U1P7C2Sk0Onw/c
         U3HHzO95AwSwGu2cNfTr4NsjklRGMBw1VSMyGwOdSsvUFY58rXVGs6V3feivKbIgdVc9
         Wvu9I8DGVxNgCAP64T8NiGyMBDGeC86C8XORZKreBXFmJn42M2bKJxUw7AJlYaH8RjAo
         JpZA==
X-Gm-Message-State: AOJu0YzoPCtGGiEeE4V6KXxeljWUeAC73NoYf/c5FfgAm1eZSt4riXX1
	REV1hfb7fqky12Z4PoOhzYswSnmAOFBwiPTTtTiE01bi13jhybQMGpS3rDjddXQOuPw=
X-Gm-Gg: AfdE7cnX0Le7otmZGDRME87KqlbYOtFn1PhH+DaRpKAawTjYN25mP62HyEGAh2UPZGL
	wDtmSxqrLMcXFxMUDRVa8TdF5DWMxOosNoe7y1PGUuZJyT/Ro51v+oHhPuIu+7dUfL9/xNpfqtZ
	C69fbJNBDXp9SGNnRbR6S8XzLz4GiKoBiDFE+t8TXwyGiYYJVoR/u1cWKPgnr5VqG0P8PE7Kkxt
	RDKHEUrdGpuvXreydKHO+9EFcnP6Pm1aWy7cLZslIRIkBTx8TMnDv1WE1cNj4/edJxq+dpnGV9o
	6Yz01HfmD7pYTcqKPt51E0WiB36jgMM/iQRpOPmve6utURv7661fExG/mY2BIiZjra7KezT9E5d
	14OC5ctogqlM3CyJ6eznJh/CK50GKDN6q41CCMuoT3UuOKG06AgMF2pvqHBzT3ymfuuS+4WMrXg
	ditLJ3/s7bCos6BA7F+NknG8x9NTFnPr6R5bnY2H+v4nSDABiKky0ChkcBQVHTil1xAmg=
X-Received: by 2002:a05:6512:3a88:b0:5ae:bb50:e938 with SMTP id 2adb3069b0e04-5aec67a1a43mr853809e87.1.1782997853886;
        Thu, 02 Jul 2026 06:10:53 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89916c5sm694103e87.9.2026.07.02.06.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 06:10:53 -0700 (PDT)
Message-ID: <3421134a-3aba-4c49-8810-f774a46488e8@linaro.org>
Date: Thu, 2 Jul 2026 16:10:52 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: i2c: og0ve1b: Introduce per-sensor data
 structure
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
 <20260702-og0va1b-v2-2-0071442caa2a@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260702-og0va1b-v2-2-0071442caa2a@oss.qualcomm.com>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-66362-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wenmeng.liu@oss.qualcomm.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECA9D6F8370

Hi Wenmeng.

On 7/2/26 13:52, Wenmeng Liu wrote:
> In preparation for supporting further OmniVision sensors that share most
> of this driver, move the sensor-specific parameters (chip id, MCLK
> frequency, test pattern register, link frequency menu and the list of
> supported modes) into a new struct og0ve1b_sensor_data, selected through
> i2c_get_match_data() at probe time.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/media/i2c/og0ve1b.c | 101 +++++++++++++++++++++++++++++---------------
>   1 file changed, 67 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
> index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..acc06b10bf896f734926289099a70fbc2bb628d5 100644
> --- a/drivers/media/i2c/og0ve1b.c
> +++ b/drivers/media/i2c/og0ve1b.c
> @@ -66,10 +66,21 @@ struct og0ve1b_mode {
>   	u32 hts;	/* Horizontal timing size */
>   	u32 vts;	/* Default vertical timing size */
>   	u32 bpp;	/* Bits per pixel */
> +	u32 code;	/* MEDIA_BUS_FMT code */

In this particular case of grayscale only sensors there is no need for both
bpp and media bus format code, since there is a natural one-to-one mapping.

I'm fine with "code" just replacing "bpp", and in og0ve1b_init_controls()
simply replace "bpp" with "(code == MEDIA_BUS_FMT_Y8_1X8 ? 8 : 10)".

>   
>   	const struct og0ve1b_reg_list reg_list;	/* Sensor register setting */
>   };
>   
> +struct og0ve1b_sensor_data {
> +	u64 chip_id;
> +	unsigned long mclk_freq;
> +	u32 test_pattern_reg;
> +	const s64 *link_freq_menu;
> +	int num_link_freqs;
> +	const struct og0ve1b_mode *modes;
> +	int num_modes;
> +};
> +
>   static const char * const og0ve1b_test_pattern_menu[] = {
>   	"Disabled",
>   	"Vertical Colour Bars",
> @@ -97,8 +108,7 @@ struct og0ve1b {
>   	struct v4l2_ctrl *exposure;
>   	struct v4l2_ctrl_handler ctrl_handler;
>   
> -	/* Saved register value */
> -	u64 pre_isp;

I'm afraid this will break test pattern on og0ve1b, unfortunately it should
be kept as is for now.

The register is used for something else, and IIRC even cci_update_bits() API
does not work expectedly, it certainly should be read once and written later.

Hence it leaves an option to keep og0ve1b_enable_test_pattern() and then
introduce in 3/3 a new og0va1b_enable_test_pattern() function, the selection
will be done in runtime similarly to other og0ve/og0va branches.

> +	const struct og0ve1b_sensor_data *sensor;

Well, the identifier name is confusing to me, it is not "sensor", it's
"sensor data" or just "data", no?

>   };
>   
>   static const struct cci_reg_sequence og0ve1b_640x480_120fps_mode[] = {
> @@ -254,6 +264,7 @@ static const struct og0ve1b_mode supported_modes[] = {
>   		.hts = 792,
>   		.vts = 568,
>   		.bpp = 8,
> +		.code = MEDIA_BUS_FMT_Y8_1X8,
>   		.reg_list = {
>   			.regs = og0ve1b_640x480_120fps_mode,
>   			.num_regs = ARRAY_SIZE(og0ve1b_640x480_120fps_mode),
> @@ -261,23 +272,39 @@ static const struct og0ve1b_mode supported_modes[] = {
>   	},
>   };
>   
> +static const struct og0ve1b_sensor_data og0ve1b_data = {
> +	.chip_id	= OG0VE1B_CHIP_ID,
> +	.mclk_freq	= OG0VE1B_MCLK_FREQ_24MHZ,
> +	.test_pattern_reg = OG0VE1B_REG_PRE_ISP,
> +	.link_freq_menu	= og0ve1b_link_freq_menu,
> +	.num_link_freqs	= ARRAY_SIZE(og0ve1b_link_freq_menu),
> +	.modes		= supported_modes,
> +	.num_modes	= ARRAY_SIZE(supported_modes),

Please use tab symbols or spaces before '=' sign consistently on all lines.

> +};
> +
>   static int og0ve1b_enable_test_pattern(struct og0ve1b *og0ve1b, u32 pattern)
>   {
> -	u64 val = og0ve1b->pre_isp;
> +	u32 reg = og0ve1b->sensor->test_pattern_reg;
> +	u64 val;
> +	int ret;
> +
> +	ret = cci_read(og0ve1b->regmap, reg, &val, NULL);
> +	if (ret)
> +		return ret;
>   
>   	if (pattern)
>   		val |= OG0VE1B_TEST_PATTERN_ENABLE;
>   	else
>   		val &= ~OG0VE1B_TEST_PATTERN_ENABLE;
>   
> -	return cci_write(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP, val, NULL);
> +	return cci_write(og0ve1b->regmap, reg, val, NULL);
>   }

So far let's keep the function above unmodified, but call it by pointer stored
in the new struct.

Does OG0VA have also just one "Vertical Colour Bars" test pattern mode?

Let me test this v2 for test pattern regression to formally confirm it shortly.

>   
>   static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct og0ve1b *og0ve1b = container_of(ctrl->handler, struct og0ve1b,
>   					       ctrl_handler);
> -	const struct og0ve1b_mode *mode = &supported_modes[0];
> +	const struct og0ve1b_mode *mode = &og0ve1b->sensor->modes[0];
>   	s64 exposure_max;
>   	int ret;
>   
> @@ -333,7 +360,8 @@ static const struct v4l2_ctrl_ops og0ve1b_ctrl_ops = {
>   static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>   {
>   	struct v4l2_ctrl_handler *ctrl_hdlr = &og0ve1b->ctrl_handler;
> -	const struct og0ve1b_mode *mode = &supported_modes[0];
> +	const struct og0ve1b_mode *mode = &og0ve1b->sensor->modes[0];
> +	const struct og0ve1b_sensor_data *sensor = og0ve1b->sensor;
>   	s64 exposure_max, pixel_rate, h_blank, v_blank;
>   	struct v4l2_fwnode_device_properties props;
>   	struct v4l2_ctrl *ctrl;
> @@ -343,12 +371,12 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>   
>   	ctrl = v4l2_ctrl_new_int_menu(ctrl_hdlr, &og0ve1b_ctrl_ops,
>   				      V4L2_CID_LINK_FREQ,
> -				      ARRAY_SIZE(og0ve1b_link_freq_menu) - 1,
> -				      0, og0ve1b_link_freq_menu);
> +				      sensor->num_link_freqs - 1,
> +				      0, sensor->link_freq_menu);
>   	if (ctrl)
>   		ctrl->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>   
> -	pixel_rate = og0ve1b_link_freq_menu[0] / mode->bpp;
> +	pixel_rate = sensor->link_freq_menu[0] / mode->bpp;

Since it becomes more complex, can you please move the calculation to
a new inline function, like os05b10_pixel_rate()?

>   	v4l2_ctrl_new_std(ctrl_hdlr, &og0ve1b_ctrl_ops, V4L2_CID_PIXEL_RATE,
>   			  0, pixel_rate, 1, pixel_rate);
>   
> @@ -407,7 +435,7 @@ static int og0ve1b_init_controls(struct og0ve1b *og0ve1b)
>   static void og0ve1b_update_pad_format(const struct og0ve1b_mode *mode,
>   				      struct v4l2_mbus_framefmt *fmt)
>   {
> -	fmt->code = MEDIA_BUS_FMT_Y8_1X8;
> +	fmt->code = mode->code;
>   	fmt->width = mode->width;
>   	fmt->height = mode->height;
>   	fmt->field = V4L2_FIELD_NONE;
> @@ -421,8 +449,8 @@ static int og0ve1b_enable_streams(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_state *state, u32 pad,
>   				  u64 streams_mask)
>   {
> -	const struct og0ve1b_reg_list *reg_list = &supported_modes[0].reg_list;
>   	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
> +	const struct og0ve1b_reg_list *reg_list = &og0ve1b->sensor->modes[0].reg_list;
>   	int ret;
>   
>   	ret = pm_runtime_resume_and_get(og0ve1b->dev);
> @@ -484,13 +512,14 @@ static int og0ve1b_set_pad_format(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_state *state,
>   				  struct v4l2_subdev_format *fmt)
>   {
> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
>   	struct v4l2_mbus_framefmt *format;
>   	const struct og0ve1b_mode *mode;
>   
>   	format = v4l2_subdev_state_get_format(state, 0);
>   
> -	mode = v4l2_find_nearest_size(supported_modes,
> -				      ARRAY_SIZE(supported_modes),
> +	mode = v4l2_find_nearest_size(og0ve1b->sensor->modes,
> +				      og0ve1b->sensor->num_modes,
>   				      width, height,
>   				      fmt->format.width,
>   				      fmt->format.height);
> @@ -505,10 +534,12 @@ static int og0ve1b_enum_mbus_code(struct v4l2_subdev *sd,
>   				  struct v4l2_subdev_state *sd_state,
>   				  struct v4l2_subdev_mbus_code_enum *code)
>   {
> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
> +
>   	if (code->index > 0)
>   		return -EINVAL;
>   
> -	code->code = MEDIA_BUS_FMT_Y8_1X8;
> +	code->code = og0ve1b->sensor->modes[0].code;
>   
>   	return 0;
>   }
> @@ -517,15 +548,18 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
>   				   struct v4l2_subdev_state *sd_state,
>   				   struct v4l2_subdev_frame_size_enum *fse)
>   {
> -	if (fse->index >= ARRAY_SIZE(supported_modes))
> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);
> +	const struct og0ve1b_sensor_data *sensor = og0ve1b->sensor;
> +
> +	if (fse->index >= sensor->num_modes)
>   		return -EINVAL;
>   
> -	if (fse->code != MEDIA_BUS_FMT_Y8_1X8)
> +	if (fse->code != sensor->modes[fse->index].code)
>   		return -EINVAL;
>   
> -	fse->min_width = supported_modes[fse->index].width;
> +	fse->min_width = sensor->modes[fse->index].width;
>   	fse->max_width = fse->min_width;
> -	fse->min_height = supported_modes[fse->index].height;
> +	fse->min_height = sensor->modes[fse->index].height;
>   	fse->max_height = fse->min_height;
>   
>   	return 0;
> @@ -534,13 +568,14 @@ static int og0ve1b_enum_frame_size(struct v4l2_subdev *sd,
>   static int og0ve1b_init_state(struct v4l2_subdev *sd,
>   			      struct v4l2_subdev_state *state)
>   {
> +	struct og0ve1b *og0ve1b = to_og0ve1b(sd);

struct og0ve1b_sensor_data *data = to_og0ve1b(sd)->sensor; // ->data anticipated

>   	struct v4l2_subdev_format fmt = {
>   		.which = V4L2_SUBDEV_FORMAT_TRY,
>   		.pad = 0,
>   		.format = {
> -			.code = MEDIA_BUS_FMT_Y8_1X8,
> -			.width = supported_modes[0].width,
> -			.height = supported_modes[0].height,
> +			.code = og0ve1b->sensor->modes[0].code,
> +			.width = og0ve1b->sensor->modes[0].width,
> +			.height = og0ve1b->sensor->modes[0].height,
>   		},
>   	};
>   
> @@ -586,18 +621,13 @@ static int og0ve1b_identify_sensor(struct og0ve1b *og0ve1b)
>   		return ret;
>   	}
>   
> -	if (val != OG0VE1B_CHIP_ID) {
> -		dev_err(og0ve1b->dev, "chip id mismatch: %x!=%llx\n",
> -			OG0VE1B_CHIP_ID, val);
> +	if (val != og0ve1b->sensor->chip_id) {
> +		dev_err(og0ve1b->dev, "chip id mismatch: %llx!=%llx\n",
> +			og0ve1b->sensor->chip_id, val);
>   		return -ENODEV;
>   	}
>   
> -	ret = cci_read(og0ve1b->regmap, OG0VE1B_REG_PRE_ISP,
> -		       &og0ve1b->pre_isp, NULL);
> -	if (ret)
> -		dev_err(og0ve1b->dev, "failed to read pre_isp: %d\n", ret);
> -
> -	return ret;
> +	return 0;
>   }
>   
>   static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
> @@ -624,8 +654,8 @@ static int og0ve1b_check_hwcfg(struct og0ve1b *og0ve1b)
>   	ret = v4l2_link_freq_to_bitmap(og0ve1b->dev,
>   				       bus_cfg.link_frequencies,
>   				       bus_cfg.nr_of_link_frequencies,
> -				       og0ve1b_link_freq_menu,
> -				       ARRAY_SIZE(og0ve1b_link_freq_menu),
> +				       og0ve1b->sensor->link_freq_menu,
> +				       og0ve1b->sensor->num_link_freqs,
>   				       &freq_bitmap);
>   
>   	v4l2_fwnode_endpoint_free(&bus_cfg);
> @@ -686,6 +716,9 @@ static int og0ve1b_probe(struct i2c_client *client)
>   		return -ENOMEM;
>   
>   	og0ve1b->dev = &client->dev;
> +	og0ve1b->sensor = i2c_get_match_data(client);
> +	if (!og0ve1b->sensor)
> +		return -ENODEV;
>   
>   	v4l2_i2c_subdev_init(&og0ve1b->sd, client, &og0ve1b_subdev_ops);
>   
> @@ -700,7 +733,7 @@ static int og0ve1b_probe(struct i2c_client *client)
>   				     "failed to get XVCLK clock\n");
>   
>   	freq = clk_get_rate(og0ve1b->xvclk);
> -	if (freq && freq != OG0VE1B_MCLK_FREQ_24MHZ)
> +	if (freq && freq != og0ve1b->sensor->mclk_freq)
>   		return dev_err_probe(og0ve1b->dev, -EINVAL,
>   				     "XVCLK clock frequency %lu is not supported\n",
>   				     freq);
> @@ -819,7 +852,7 @@ static const struct dev_pm_ops og0ve1b_pm_ops = {
>   };
>   
>   static const struct of_device_id og0ve1b_of_match[] = {
> -	{ .compatible = "ovti,og0ve1b" },
> +	{ .compatible = "ovti,og0ve1b", .data = &og0ve1b_data },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, og0ve1b_of_match);
> 

Looks good overall, thank you.

-- 
Best wishes,
Vladimir

