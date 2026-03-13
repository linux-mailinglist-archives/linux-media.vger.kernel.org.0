Return-Path: <linux-media+bounces-55732-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPyHHOc0tGn4igAAu9opvQ
	(envelope-from <linux-media+bounces-55732-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:01:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 577632868A0
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C77DF30BDB33
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 15:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C039363080;
	Fri, 13 Mar 2026 15:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ip29mVYz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46843363C43;
	Fri, 13 Mar 2026 15:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417570; cv=none; b=C8DcCajLZJinlm0BTdnuqnmB1pYu56tzn7Dz1QLo+ZYsnb5O5rEaM6aSRYXSQH3Rpma8Vs3bxCnrHgH/uKWYc45d4FwrJXPmXjy/CMWZ1FYz63uM+YJJNLt+GMLn69W6YqXULdISVpB/Gv/8YgoJE3kTed+D1ReW0HfYzJxvgc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417570; c=relaxed/simple;
	bh=e5SsRN3GdBzgQj1/e1VLThEaG9cDxkH7UMg/rIO1KZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X8nzp+JyvnZ4c6xUFMoBYN8x1CU1ouXetTAmgo/DqcsvxG0B8gxj325EoLskuZv3CF4J82MlCHuCFRDoEHLsPOXzG078+Cteez1XF79DagKXEnY4CSn87HOrDixE8GXpN+7OXg7rb92E3AYzD6ZFiHzWxuzIz/5eTDXNCtgiq0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ip29mVYz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BD2B5A5;
	Fri, 13 Mar 2026 16:58:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773417497;
	bh=e5SsRN3GdBzgQj1/e1VLThEaG9cDxkH7UMg/rIO1KZk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ip29mVYzbjv9ZXm+Pa+bMc101Pw2mViipm0/lEankEK5epiCkWUxwkFz9wqhby+oI
	 gW3PAexZTxkrTD330CcoZvbshCJkVSMuEgpHURGPhLuc6jrH26rVrifElU8ZLH/Uwr
	 /3W/Ny1uZDZKj8eMOpulJvGSJm5QwJyk0Mh5esxU=
Message-ID: <fc5b4699-37b8-41fe-ab9d-b1ac7fbe33e2@ideasonboard.com>
Date: Fri, 13 Mar 2026 15:59:22 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] media: mali-c55: Initialize the ISP in
 enable_streams()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Nayden Kanchev <Nayden.Kanchev@arm.com>,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260313-mali-c55-fixes-v7-0-v2-0-885c07961f30@ideasonboard.com>
 <20260313-mali-c55-fixes-v7-0-v2-2-885c07961f30@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260313-mali-c55-fixes-v7-0-v2-2-885c07961f30@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55732-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[dan.scally@ideasonboard.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 577632868A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo - thanks for the patches

On 13/03/2026 14:53, Jacopo Mondi wrote:
> The Mali C55 driver initializes the ISP in two points:
> 
> 1) At probe time it disables ISP blocks by configuring them in bypass
>     mode
> 2) At enable_streams() it initializes the crop rectangles and the image
>     processing pipeline using the current image format
> 
> However, as ISP blocks are configured by userspace, if their
> configuration is not reset, from the second enable_streams() call
> onwards the ISP configuration will depend on the previous streaming
> session configuration.
> 
> To re-initialize the ISP completely at enable_strems() time consolidate

s/enable_strems/enable_streams

> the ISP block bypass configuration and the image processing path
> configuration in a single function to be called at enabled_streams()
> time.

I'm slightly confused; the change seems fine, but as far as I can see it's non-functional...or is 
this just preliminary reorganisation to make the next patch easier?

Thanks
Dan

> Cc: stable@vger.kernel.org
> Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>   .../media/platform/arm/mali-c55/mali-c55-common.h  |  2 +
>   .../media/platform/arm/mali-c55/mali-c55-core.c    | 35 -----------
>   drivers/media/platform/arm/mali-c55/mali-c55-isp.c | 37 ++---------
>   .../media/platform/arm/mali-c55/mali-c55-params.c  | 72 ++++++++++++++++++++++
>   4 files changed, 79 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-common.h b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
> index 31c1deaca146..13a3e9dc4243 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-common.h
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-common.h
> @@ -306,5 +306,7 @@ bool mali_c55_pipeline_ready(struct mali_c55 *mali_c55);
>   void mali_c55_stats_fill_buffer(struct mali_c55 *mali_c55,
>   				enum mali_c55_config_spaces cfg_space);
>   void mali_c55_params_write_config(struct mali_c55 *mali_c55);
> +void mali_c55_params_init_isp_config(struct mali_c55 *mali_c55,
> +				     const struct v4l2_subdev_state *state);
>   
>   #endif /* _MALI_C55_COMMON_H */
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index 43b834459ccf..c1a562cd214e 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -663,41 +663,6 @@ static int mali_c55_init_context(struct mali_c55 *mali_c55,
>   		      mali_c55->base + config_space_addrs[MALI_C55_CONFIG_PING],
>   		      MALI_C55_CONFIG_SPACE_SIZE);
>   
> -	/*
> -	 * Some features of the ISP need to be disabled by default and only
> -	 * enabled at the same time as they're configured by a parameters buffer
> -	 */
> -
> -	/* Bypass the sqrt and square compression and expansion modules */
> -	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_1,
> -				 MALI_C55_REG_BYPASS_1_FE_SQRT,
> -				 MALI_C55_REG_BYPASS_1_FE_SQRT);
> -	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
> -				 MALI_C55_REG_BYPASS_3_SQUARE_BE,
> -				 MALI_C55_REG_BYPASS_3_SQUARE_BE);
> -
> -	/* Bypass the temper module */
> -	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_2,
> -			   MALI_C55_REG_BYPASS_2_TEMPER);
> -
> -	/* Disable the temper module's DMA read/write */
> -	mali_c55_ctx_write(mali_c55, MALI_C55_REG_TEMPER_DMA_IO, 0x0);
> -
> -	/* Bypass the colour noise reduction  */
> -	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_4,
> -			   MALI_C55_REG_BYPASS_4_CNR);
> -
> -	/* Disable the sinter module */
> -	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_SINTER_CONFIG,
> -				 MALI_C55_SINTER_ENABLE_MASK, 0);
> -
> -	/* Disable the RGB Gamma module for each output */
> -	mali_c55_ctx_write(mali_c55, MALI_C55_REG_FR_GAMMA_RGB_ENABLE, 0);
> -	mali_c55_ctx_write(mali_c55, MALI_C55_REG_DS_GAMMA_RGB_ENABLE, 0);
> -
> -	/* Disable the colour correction matrix */
> -	mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 0);
> -
>   	return 0;
>   }
>   
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> index 497f25fbdd13..4c0fd1ec741c 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
> @@ -112,9 +112,6 @@ static int mali_c55_isp_start(struct mali_c55 *mali_c55,
>   			      const struct v4l2_subdev_state *state)
>   {
>   	struct mali_c55_context *ctx = mali_c55_get_active_context(mali_c55);
> -	const struct mali_c55_isp_format_info *cfg;
> -	const struct v4l2_mbus_framefmt *format;
> -	const struct v4l2_rect *crop;
>   	u32 val;
>   	int ret;
>   
> @@ -122,35 +119,11 @@ static int mali_c55_isp_start(struct mali_c55 *mali_c55,
>   			     MALI_C55_REG_MCU_CONFIG_WRITE_MASK,
>   			     MALI_C55_REG_MCU_CONFIG_WRITE_PING);
>   
> -	/* Apply input windowing */
> -	crop = v4l2_subdev_state_get_crop(state, MALI_C55_ISP_PAD_SINK_VIDEO);
> -	format = v4l2_subdev_state_get_format(state,
> -					      MALI_C55_ISP_PAD_SINK_VIDEO);
> -	cfg = mali_c55_isp_get_mbus_config_by_code(format->code);
> -
> -	mali_c55_write(mali_c55, MALI_C55_REG_HC_START,
> -		       MALI_C55_HC_START(crop->left));
> -	mali_c55_write(mali_c55, MALI_C55_REG_HC_SIZE,
> -		       MALI_C55_HC_SIZE(crop->width));
> -	mali_c55_write(mali_c55, MALI_C55_REG_VC_START_SIZE,
> -		       MALI_C55_VC_START(crop->top) |
> -		       MALI_C55_VC_SIZE(crop->height));
> -	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BASE_ADDR,
> -				 MALI_C55_REG_ACTIVE_WIDTH_MASK, format->width);
> -	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BASE_ADDR,
> -				 MALI_C55_REG_ACTIVE_HEIGHT_MASK,
> -				 format->height << 16);
> -	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BAYER_ORDER,
> -				 MALI_C55_BAYER_ORDER_MASK, cfg->order);
> -	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_INPUT_WIDTH,
> -				 MALI_C55_INPUT_WIDTH_MASK,
> -				 MALI_C55_INPUT_WIDTH_20BIT);
> -
> -	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_ISP_RAW_BYPASS,
> -				 MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK,
> -				 cfg->bypass ? MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK :
> -					     0x00);
> -
> +	/*
> +	 * Apply default ISP configuration and the apply configurations from
> +	 * the first available parameters buffer.
> +	 */
> +	mali_c55_params_init_isp_config(mali_c55, state);
>   	mali_c55_params_write_config(mali_c55);
>   	ret = mali_c55_config_write(ctx, MALI_C55_CONFIG_PING, true);
>   	if (ret) {
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index c03a6120ddbf..c84a6047a570 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -732,6 +732,78 @@ void mali_c55_params_write_config(struct mali_c55 *mali_c55)
>   	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
>   }
>   
> +void mali_c55_params_init_isp_config(struct mali_c55 *mali_c55,
> +				     const struct v4l2_subdev_state *state)
> +{
> +	const struct mali_c55_isp_format_info *cfg;
> +	const struct v4l2_mbus_framefmt *format;
> +	const struct v4l2_rect *crop;
> +
> +	/* Apply input windowing */
> +	crop = v4l2_subdev_state_get_crop(state, MALI_C55_ISP_PAD_SINK_VIDEO);
> +	format = v4l2_subdev_state_get_format(state,
> +					      MALI_C55_ISP_PAD_SINK_VIDEO);
> +	cfg = mali_c55_isp_get_mbus_config_by_code(format->code);
> +
> +	mali_c55_write(mali_c55, MALI_C55_REG_HC_START,
> +		       MALI_C55_HC_START(crop->left));
> +	mali_c55_write(mali_c55, MALI_C55_REG_HC_SIZE,
> +		       MALI_C55_HC_SIZE(crop->width));
> +	mali_c55_write(mali_c55, MALI_C55_REG_VC_START_SIZE,
> +		       MALI_C55_VC_START(crop->top) |
> +		       MALI_C55_VC_SIZE(crop->height));
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BASE_ADDR,
> +				 MALI_C55_REG_ACTIVE_WIDTH_MASK, format->width);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BASE_ADDR,
> +				 MALI_C55_REG_ACTIVE_HEIGHT_MASK,
> +				 format->height << 16);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BAYER_ORDER,
> +				 MALI_C55_BAYER_ORDER_MASK, cfg->order);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_INPUT_WIDTH,
> +				 MALI_C55_INPUT_WIDTH_MASK,
> +				 MALI_C55_INPUT_WIDTH_20BIT);
> +
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_ISP_RAW_BYPASS,
> +				 MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK,
> +				 cfg->bypass ? MALI_C55_ISP_RAW_BYPASS_BYPASS_MASK :
> +					     0x00);
> +
> +	/*
> +	 * Some features of the ISP need to be disabled by default and only
> +	 * enabled at the same time as they're configured by a parameters buffer
> +	 */
> +
> +	/* Bypass the sqrt and square compression and expansion modules */
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_1,
> +				 MALI_C55_REG_BYPASS_1_FE_SQRT,
> +				 MALI_C55_REG_BYPASS_1_FE_SQRT);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_BYPASS_3,
> +				 MALI_C55_REG_BYPASS_3_SQUARE_BE,
> +				 MALI_C55_REG_BYPASS_3_SQUARE_BE);
> +
> +	/* Bypass the temper module */
> +	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_2,
> +			   MALI_C55_REG_BYPASS_2_TEMPER);
> +
> +	/* Disable the temper module's DMA read/write */
> +	mali_c55_ctx_write(mali_c55, MALI_C55_REG_TEMPER_DMA_IO, 0x0);
> +
> +	/* Bypass the colour noise reduction  */
> +	mali_c55_ctx_write(mali_c55, MALI_C55_REG_BYPASS_4,
> +			   MALI_C55_REG_BYPASS_4_CNR);
> +
> +	/* Disable the sinter module */
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_SINTER_CONFIG,
> +				 MALI_C55_SINTER_ENABLE_MASK, 0);
> +
> +	/* Disable the RGB Gamma module for each output */
> +	mali_c55_ctx_write(mali_c55, MALI_C55_REG_FR_GAMMA_RGB_ENABLE, 0);
> +	mali_c55_ctx_write(mali_c55, MALI_C55_REG_DS_GAMMA_RGB_ENABLE, 0);
> +
> +	/* Disable the colour correction matrix */
> +	mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 0);
> +}
> +
>   void mali_c55_unregister_params(struct mali_c55 *mali_c55)
>   {
>   	struct mali_c55_params *params = &mali_c55->params;
> 


