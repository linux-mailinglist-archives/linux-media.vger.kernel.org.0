Return-Path: <linux-media+bounces-65695-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +BJDDyFKPmrZCgkAu9opvQ
	(envelope-from <linux-media+bounces-65695-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 11:45:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9378E6CBCBE
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 11:45:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=N3aRcrMu;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65695-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65695-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEC1D3017245
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 09:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B913E9281;
	Fri, 26 Jun 2026 09:44:55 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB8530BB9B;
	Fri, 26 Jun 2026 09:44:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467094; cv=none; b=lRHgJpnR0wQIsfdKncuYebZLM4GQmZQnRq9e5QtrJz5BUMu41xkdYDXsEeuJshNP0Icnks2NaqlV4dwARLtDa8an7N5GlZnxEKqeJfdDvPGU6Ry1FVBBuKTKUgWni/p2x9GzJ5ANrntAz2GHgHR6GLkFtTIz+A75Dkq8fF6gdhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467094; c=relaxed/simple;
	bh=50JTSrabamteqM36Mm8lGf6z40pyJ/13A8r0/qxl/FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnsc8j7t8pWj35YLVADbw2VOEHuIv6zMqRQyxQWIHb+WmIXyLGSgwPsMSsg3NhjJ4wdFtW/m4i5WgTw39xAcIqM44UwEb2dZij3deN97vmCWOhr5mGvK2jmCAPOR1bAo+nkgxR8ZyLC9dFLaBA5U+6y33QEXkgMCbgAXdy3BqR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=N3aRcrMu; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C2E9E204C;
	Fri, 26 Jun 2026 02:44:47 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D25CC3F836;
	Fri, 26 Jun 2026 02:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782467092; bh=50JTSrabamteqM36Mm8lGf6z40pyJ/13A8r0/qxl/FY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N3aRcrMuJgLByf+UseR4q7MVMTVfK6xctw3XsvSOuRQM00eWQ1RgyOFaDv5RFbRN9
	 MzJ1n1ZrkWDk55n9Q9mJEap7ess843a5JSsGJO7kYXVTVGiPt9u/jAm5vi1ig51H/A
	 zM+HdzjiOkXGxzBRHpfAk0lf8uNmvb2wvEn40f+8=
Message-ID: <1a4fe819-8351-465f-b77a-71433eb5eb68@arm.com>
Date: Fri, 26 Jun 2026 10:44:49 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: arm: mali-c55: Add support for CCM
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>, linus.walleij@arm.com,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com>
 <20260616-mali-c55-ccm-gamma-v2-1-0f93e9a95d98@ideasonboard.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260616-mali-c55-ccm-gamma-v2-1-0f93e9a95d98@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[arm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[vincenzo.frascino@arm.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65695-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vincenzo.frascino@arm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9378E6CBCBE

Hi Jacopo,

thank you for your patch!

And sorry for the delay in my review.

On 16/06/2026 15:36, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> Add support for the CCM (Color Correction Matrix) for the Mali C55 ISP.
> 
> Define a new block in the uAPI using the extensible v4l2-isp format and
> implement support for configuring the CCM parameters in the mali-c55
> ISP driver.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

I have a couple of questions. With this:

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  .../media/platform/arm/mali-c55/mali-c55-params.c  | 52 ++++++++++++++++++++++
>  include/uapi/linux/media/arm/mali-c55-config.h     | 41 ++++++++++++++++-
>  2 files changed, 92 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index de0e9d898db7..96f1b28a6d77 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -46,6 +46,7 @@
>   * @awb_config:		For header->type == MALI_C55_PARAM_BLOCK_AWB_CONFIG
>   * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
>   * @shading_selection:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
> + * @ccm:		For header->type == MALI_C55_PARAM_BLOCK_CCM
>   * @data:		Allows easy initialisation of a union variable with a
>   *			pointer into a __u8 array.
>   */
> @@ -59,6 +60,7 @@ union mali_c55_params_block {
>  	const struct mali_c55_params_awb_config *awb_config;
>  	const struct mali_c55_params_mesh_shading_config *shading_config;
>  	const struct mali_c55_params_mesh_shading_selection *shading_selection;
> +	const struct mali_c55_params_ccm *ccm;
>  	const __u8 *data;
>  };
>  
> @@ -414,6 +416,52 @@ static void mali_c55_params_lsc_selection(struct mali_c55 *mali_c55,
>  				 params->mesh_strength);
>  }
>  
> +static void mali_c55_params_ccm(struct mali_c55 *mali_c55,
> +				union mali_c55_params_block block)
> +{
> +	const struct mali_c55_params_ccm *params = block.ccm;
> +
> +	if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> +		mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 0);
> +		return;
> +	}
> +
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_R_R,
> +				 MALI_C55_CCM_COEF_MASK, params->coeffs[0][0]);

Should values be validated or masked before programming? Since this is
uAPI-controlled input, it may be worth rejecting values with bits outside
MALI_C55_CCM_COEF_MASK rather than silently truncating them in update_bits().

> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_R_G,
> +				 MALI_C55_CCM_COEF_MASK, params->coeffs[0][1]);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_R_B,
> +				 MALI_C55_CCM_COEF_MASK, params->coeffs[0][2]);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_G_R,
> +				 MALI_C55_CCM_COEF_MASK, params->coeffs[1][0]);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_G_G,
> +				 MALI_C55_CCM_COEF_MASK, params->coeffs[1][1]);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_G_B,
> +				 MALI_C55_CCM_COEF_MASK, params->coeffs[1][2]);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_B_R,
> +				 MALI_C55_CCM_COEF_MASK, params->coeffs[2][0]);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_B_G,
> +				 MALI_C55_CCM_COEF_MASK, params->coeffs[2][1]);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_B_B,
> +				 MALI_C55_CCM_COEF_MASK, params->coeffs[2][2]);
> +
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_GAIN_R,
> +				 MALI_C55_CCM_ANTIFOG_GAIN_MASK, params->gains[0]);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_GAIN_G,
> +				 MALI_C55_CCM_ANTIFOG_GAIN_MASK, params->gains[1]);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_GAIN_B,
> +				 MALI_C55_CCM_ANTIFOG_GAIN_MASK, params->gains[2]);
> +
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_OFFSET_R,
> +				 MALI_C55_CCM_ANTIFOG_OFFSET_MASK, params->offs[0]);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_OFFSET_G,
> +				 MALI_C55_CCM_ANTIFOG_OFFSET_MASK, params->offs[1]);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_OFFSET_B,
> +				 MALI_C55_CCM_ANTIFOG_OFFSET_MASK, params->offs[2]);
> +
> +	mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 1);
> +}
> +
>  static const mali_c55_params_handler mali_c55_params_handlers[] = {
>  	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = &mali_c55_params_sensor_offs,
>  	[MALI_C55_PARAM_BLOCK_AEXP_HIST] = &mali_c55_params_aexp_hist,
> @@ -426,6 +474,7 @@ static const mali_c55_params_handler mali_c55_params_handlers[] = {
>  	[MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP] = &mali_c55_params_awb_gains,
>  	[MALI_C55_PARAM_MESH_SHADING_CONFIG] = &mali_c55_params_lsc_config,
>  	[MALI_C55_PARAM_MESH_SHADING_SELECTION] = &mali_c55_params_lsc_selection,
> +	[MALI_C55_PARAM_BLOCK_CCM] = &mali_c55_params_ccm,
>  };
>  
>  static const struct v4l2_isp_params_block_type_info
> @@ -463,6 +512,9 @@ mali_c55_params_block_types_info[] = {
>  	[MALI_C55_PARAM_MESH_SHADING_SELECTION] = {
>  		.size = sizeof(struct mali_c55_params_mesh_shading_selection),
>  	},
> +	[MALI_C55_PARAM_BLOCK_CCM] = {
> +		.size = sizeof(struct mali_c55_params_ccm),
> +	},
>  };
>  
>  static_assert(ARRAY_SIZE(mali_c55_params_handlers) ==
> diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
> index 3d335f950eeb..0b2085eed81b 100644
> --- a/include/uapi/linux/media/arm/mali-c55-config.h
> +++ b/include/uapi/linux/media/arm/mali-c55-config.h
> @@ -219,6 +219,7 @@ struct mali_c55_stats_buffer {
>   * @MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP: Auto-white balance gains for AEXP-0 tap
>   * @MALI_C55_PARAM_MESH_SHADING_CONFIG : Mesh shading tables configuration
>   * @MALI_C55_PARAM_MESH_SHADING_SELECTION: Mesh shading table selection
> + * @MALI_C55_PARAM_BLOCK_CCM: Colour correction matrix
>   */
>  enum mali_c55_param_block_type {
>  	MALI_C55_PARAM_BLOCK_SENSOR_OFFS,
> @@ -232,6 +233,7 @@ enum mali_c55_param_block_type {
>  	MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP,
>  	MALI_C55_PARAM_MESH_SHADING_CONFIG,
>  	MALI_C55_PARAM_MESH_SHADING_SELECTION,
> +	MALI_C55_PARAM_BLOCK_CCM,
>  };
>  
>  /**
> @@ -757,6 +759,42 @@ struct mali_c55_params_mesh_shading_selection {
>  	__u16 mesh_strength;
>  };
>  
> +/**
> + * struct mali_c55_params_ccm - Coefficients, offsets and gains for the colour
> + *				correction matrix
> + *
> + * The colour correction module converts images data from a sensor-specific
> + * colour space to known one.
> + *
> + * Colour correction is applied after demosaicing and each pixel is represented
> + * as a column vector of the three RGB colour channels on which the following
> + * operations take place:
> + * 1) An offset is subtracted from each colour channel
> + * 2) Each colour channel is multiplied by a gain
> + * 3) The pixel column vector is multiplied by the colour correction matrix
> + *
> + * This struct allows users to configure the coefficients for CCM and the
> + * per-channel offsets and gains. The nine matrix coefficients are expressed as
> + * signed Q4.8 Sign/Magnitude fixed-point numbers, the three gain multipliers
> + * are expressed as unsigned Q4.8 fixed-point numbers and the three offsets are
> + * expressed as a 12-bit unsigned integers.
> + *
> + * header.type should be set to MALI_C55_PARAM_BLOCK_CCM from
> + * :c:type:`mali_c55_param_block_type`.
> + *
> + * @header:	The Mali-C55 parameters block header
> + * @coeffs:	3x3 color conversion matrix coefficients in sign/magnitude
> + *		Q4.8 format
> + * @gains:	Gains for red, green and blue channels in unsigned Q4.8 format
> + * @offs:	Offsets for red, green and blue channels
> + */
> +struct mali_c55_params_ccm {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 coeffs[3][3];
> +	__u16 gains[3];
> +	__u16 offs[3];

The comment says offsets are 12-bit unsigned integers. Is there a reason why
instead of validation in the params parser so userspace gets an error for values
above 4095, we rely on register masking?

> +};
> +
>  /**
>   * define MALI_C55_PARAMS_MAX_SIZE - Maximum size of all Mali C55 Parameters
>   *
> @@ -780,6 +818,7 @@ struct mali_c55_params_mesh_shading_selection {
>  	sizeof(struct mali_c55_params_awb_config) +		\
>  	sizeof(struct mali_c55_params_awb_gains) +		\
>  	sizeof(struct mali_c55_params_mesh_shading_config) +	\
> -	sizeof(struct mali_c55_params_mesh_shading_selection))
> +	sizeof(struct mali_c55_params_mesh_shading_selection) +	\
> +	sizeof(struct mali_c55_params_ccm))
>  
>  #endif /* __UAPI_MALI_C55_CONFIG_H */
> 

-- 
Regards,
Vincenzo


