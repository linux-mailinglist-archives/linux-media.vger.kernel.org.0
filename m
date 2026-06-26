Return-Path: <linux-media+bounces-65698-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QsqhAAlMPmp9CwkAu9opvQ
	(envelope-from <linux-media+bounces-65698-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 11:53:13 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 458CE6CBD7B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 11:53:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=HpHRwaba;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65698-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65698-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=arm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EC3A303AF3F
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 09:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9443E9C16;
	Fri, 26 Jun 2026 09:52:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B8337CD59;
	Fri, 26 Jun 2026 09:52:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467563; cv=none; b=U7J41Odu57vvY7WLIhKi4gjEwbh1aU+2q1QI7MZHSG6bral8FehpsO8bv27WP325GEOPmHivA4+ZRlgaS8GUgCLg/49qO3nnKoDnzr0LwXWw3kkkJNOUO3F+WKwMOm/N4xg5ry+XR+WgCh8g1FF6cBzTzbSs4liZDO5asZmXhCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467563; c=relaxed/simple;
	bh=oUBNkOZfnu7SZBi/dIM3CW9LfmSfiQFc7Zk5Vo+Emdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mcfXSbqsm2YZKxcMBJ8XkGw3Ra7F4n9d0JnT3j3z/jkhvyR+o/MfwfrWXG3L/5n/Lhy43jA5FbOYeSCw00T9slYgWeeferPk28G83CaBoT7yHd3CTcqsC9HLsO0AYM+SR6zbqj/loLsgKSwYJCx15HKl7V8TLtVsKSeA9nqfk9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HpHRwaba; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23E132103;
	Fri, 26 Jun 2026 02:52:36 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 660EA3F632;
	Fri, 26 Jun 2026 02:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782467560; bh=oUBNkOZfnu7SZBi/dIM3CW9LfmSfiQFc7Zk5Vo+Emdo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HpHRwabaNxOvAAY3Eq/cD4RJX1f7UI0njxrhBXb+TIAUIE/7YtoU4ROrlOgmc14GM
	 tBaHPlv4ssNEttUFt0pw+tiXVEuczLgjDWyBtvyg+gWnGah9kwMgCcpF7ku7CVUvxs
	 ttIAJt4hzc7wjtt3Sny+C5d1O2foGOMN2iNJbNY0=
Message-ID: <2f80d1b2-5e0e-4581-a525-895fc4130c93@arm.com>
Date: Fri, 26 Jun 2026 10:52:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] media: arm: mali-c55: Add support for RGB Gamma
Content-Language: en-GB
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com,
 Konstantin Babin <Konstantin.Babin@arm.com>,
 Anthony McGivern <anthony.mcgivern@arm.com>, linus.walleij@arm.com,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
References: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com>
 <20260616-mali-c55-ccm-gamma-v2-2-0f93e9a95d98@ideasonboard.com>
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260616-mali-c55-ccm-gamma-v2-2-0f93e9a95d98@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-65698-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 458CE6CBD7B

Hi Jacopo,

thank you for your patch!

On 16/06/2026 15:36, Jacopo Mondi wrote:
> From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> 
> Add support for Gamma curve correction for the Mali C55 ISP.
> 
> Define a new block in the uAPI using the extensible v4l2-isp format and
> implement support for configuring the RGB Gamma parameters in the
> mali-c55 parameters handler.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

I have a couple of comments in addition to what Linus mentioned in his review.
With this:

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> 
> ---
> v2:
> - Remove unused 'rgb_enable' member
> - Address checkpatch issues
> ---
>  .../media/platform/arm/mali-c55/mali-c55-params.c  | 75 ++++++++++++++++++++++
>  .../platform/arm/mali-c55/mali-c55-registers.h     |  5 ++
>  include/uapi/linux/media/arm/mali-c55-config.h     | 45 ++++++++++++-
>  3 files changed, 124 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> index 96f1b28a6d77..21f031aaf595 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> @@ -47,6 +47,8 @@
>   * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
>   * @shading_selection:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
>   * @ccm:		For header->type == MALI_C55_PARAM_BLOCK_CCM
> + * @gamma:		For header->type == MALI_C55_PARAM_BLOCK_GAMMA_FR and
> + *			header->type = MALI_C55_PARAM_BLOCK_GAMMA_DS
>   * @data:		Allows easy initialisation of a union variable with a
>   *			pointer into a __u8 array.
>   */
> @@ -61,6 +63,7 @@ union mali_c55_params_block {
>  	const struct mali_c55_params_mesh_shading_config *shading_config;
>  	const struct mali_c55_params_mesh_shading_selection *shading_selection;
>  	const struct mali_c55_params_ccm *ccm;
> +	const struct mali_c55_params_gamma *gamma;
>  	const __u8 *data;
>  };
>  
> @@ -462,6 +465,70 @@ static void mali_c55_params_ccm(struct mali_c55 *mali_c55,
>  	mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 1);
>  }
>  
> +static void mali_c55_params_gamma(struct mali_c55 *mali_c55,
> +				  union mali_c55_params_block block,
> +				  __u32 offset, __u32 lut_base)
> +{
> +	const struct mali_c55_params_gamma *params = block.gamma;
> +
> +	if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> +		mali_c55_ctx_update_bits(mali_c55,
> +					 MALI_C55_REG_GAMMA_RGB_ENABLE + offset,
> +					 MALI_C55_GAMMA_ENABLE_MASK, 0x00);
> +		return;
> +	}
> +
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_1 + offset,
> +				 MALI_C55_GAMMA_GAIN_R_MASK, params->gains[0]);
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_1 + offset,
> +				 MALI_C55_GAMMA_GAIN_G_MASK,
> +				 MALI_C55_GAMMA_GAIN_G(params->gains[1]));
> +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_2 + offset,
> +				 MALI_C55_GAMMA_GAIN_B_MASK, params->gains[2]);
> +	mali_c55_ctx_update_bits(mali_c55,
> +				 MALI_C55_REG_GAMMA_OFFSETS_1 + offset,
> +				 MALI_C55_GAMMA_OFFSET_R_MASK,
> +				 params->offs[0]);
> +	mali_c55_ctx_update_bits(mali_c55,
> +				 MALI_C55_REG_GAMMA_OFFSETS_1 + offset,
> +				 MALI_C55_GAMMA_OFFSET_G_MASK,
> +				 MALI_C55_GAMMA_OFFSET_G(params->offs[1]));
> +	mali_c55_ctx_update_bits(mali_c55,
> +				 MALI_C55_REG_GAMMA_OFFSETS_2 + offset,
> +				 MALI_C55_GAMMA_OFFSET_B_MASK,
> +				 params->offs[2]);
> +
> +	for (unsigned int i = 0; i < MALI_C55_NUM_GAMMA_LUT_ELEMENTS; i++) {
> +		__u32 addr = lut_base + (i * 4);
> +
> +		mali_c55_ctx_write(mali_c55, addr, params->lut[i]);
> +	}
> +
> +	mali_c55_ctx_update_bits(mali_c55,
> +				 MALI_C55_REG_GAMMA_RGB_ENABLE + offset,
> +				 MALI_C55_GAMMA_ENABLE_MASK, 0x1);
> +}
> +
> +static void mali_c55_params_gamma_fr(struct mali_c55 *mali_c55,
> +				     union mali_c55_params_block block)
> +{
> +	return mali_c55_params_gamma(mali_c55, block,
> +				     MALI_C55_CAP_DEV_FR_REG_OFFSET,
> +				     MALI_C55_REG_FR_GAMMA_RGB_MEM);
> +}
> +
> +static void mali_c55_params_gamma_ds(struct mali_c55 *mali_c55,
> +				     union mali_c55_params_block block)
> +{
> +	/* We cannot apply parameters to DS if it is not fitted. */
> +	if (!(mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED))
> +		return;
> +
> +	return mali_c55_params_gamma(mali_c55, block,
> +				     MALI_C55_CAP_DEV_DS_REG_OFFSET,
> +				     MALI_C55_REG_DS_GAMMA_RGB_MEM);
> +}
> +
>  static const mali_c55_params_handler mali_c55_params_handlers[] = {
>  	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = &mali_c55_params_sensor_offs,
>  	[MALI_C55_PARAM_BLOCK_AEXP_HIST] = &mali_c55_params_aexp_hist,
> @@ -475,6 +542,8 @@ static const mali_c55_params_handler mali_c55_params_handlers[] = {
>  	[MALI_C55_PARAM_MESH_SHADING_CONFIG] = &mali_c55_params_lsc_config,
>  	[MALI_C55_PARAM_MESH_SHADING_SELECTION] = &mali_c55_params_lsc_selection,
>  	[MALI_C55_PARAM_BLOCK_CCM] = &mali_c55_params_ccm,
> +	[MALI_C55_PARAM_BLOCK_GAMMA_FR] = &mali_c55_params_gamma_fr,
> +	[MALI_C55_PARAM_BLOCK_GAMMA_DS] = &mali_c55_params_gamma_ds,
>  };
>  
>  static const struct v4l2_isp_params_block_type_info
> @@ -515,6 +584,12 @@ mali_c55_params_block_types_info[] = {
>  	[MALI_C55_PARAM_BLOCK_CCM] = {
>  		.size = sizeof(struct mali_c55_params_ccm),
>  	},
> +	[MALI_C55_PARAM_BLOCK_GAMMA_FR] = {
> +		.size = sizeof(struct mali_c55_params_gamma),
> +	},
> +	[MALI_C55_PARAM_BLOCK_GAMMA_DS] = {
> +		.size = sizeof(struct mali_c55_params_gamma),
> +	},
>  };
>  
>  static_assert(ARRAY_SIZE(mali_c55_params_handlers) ==
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> index f098effde7b4..7a606bd2e843 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> @@ -425,11 +425,13 @@ enum mali_c55_interrupts {
>  #define MALI_C55_REG_GAMMA_GAINS_1			0x1c068
>  #define MALI_C55_GAMMA_GAIN_R_MASK			GENMASK(11, 0)
>  #define MALI_C55_GAMMA_GAIN_G_MASK			GENMASK(27, 16)
> +#define MALI_C55_GAMMA_GAIN_G(x)			((x) << 16)
>  #define MALI_C55_REG_GAMMA_GAINS_2			0x1c06c
>  #define MALI_C55_GAMMA_GAIN_B_MASK			GENMASK(11, 0)
>  #define MALI_C55_REG_GAMMA_OFFSETS_1			0x1c070
>  #define MALI_C55_GAMMA_OFFSET_R_MASK			GENMASK(11, 0)
>  #define MALI_C55_GAMMA_OFFSET_G_MASK			GENMASK(27, 16)
> +#define MALI_C55_GAMMA_OFFSET_G(x)				((x) << 16)

Nit: there is an extra tab before ((x) << 16) compared to the surrounding
defines. Please align this with the style of the nearby MALI_C55_GAMMA_GAIN_G()
macro.

>  #define MALI_C55_REG_GAMMA_OFFSETS_2			0x1c074
>  #define MALI_C55_GAMMA_OFFSET_B_MASK			GENMASK(11, 0)
>  
> @@ -441,6 +443,9 @@ enum mali_c55_interrupts {
>  #define MALI_C55_REG_FR_GAMMA_RGB_ENABLE		0x1c064
>  #define MALI_C55_REG_DS_GAMMA_RGB_ENABLE		0x1c1d8
>  
> +#define MALI_C55_REG_FR_GAMMA_RGB_MEM			0x18280
> +#define MALI_C55_REG_DS_GAMMA_RGB_MEM			0x18484
> +
>  #define MALI_C55_REG_FR_SCALER_HFILT			0x34a8
>  #define MALI_C55_REG_FR_SCALER_VFILT			0x44a8
>  #define MALI_C55_REG_DS_SCALER_HFILT			0x14a8
> diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
> index 0b2085eed81b..7e96564cb89c 100644
> --- a/include/uapi/linux/media/arm/mali-c55-config.h
> +++ b/include/uapi/linux/media/arm/mali-c55-config.h
> @@ -36,6 +36,9 @@
>   */
>  #define MALI_C55_MAX_ZONES	(15 * 15)
>  
> +/* Number of RGB gamma LUT entries. */
> +#define MALI_C55_NUM_GAMMA_LUT_ELEMENTS 129
> +
>  /**
>   * struct mali_c55_ae_1024bin_hist - Auto Exposure 1024-bin histogram statistics
>   *
> @@ -220,6 +223,8 @@ struct mali_c55_stats_buffer {
>   * @MALI_C55_PARAM_MESH_SHADING_CONFIG : Mesh shading tables configuration
>   * @MALI_C55_PARAM_MESH_SHADING_SELECTION: Mesh shading table selection
>   * @MALI_C55_PARAM_BLOCK_CCM: Colour correction matrix
> + * @MALI_C55_PARAM_BLOCK_GAMMA_FR: Gamma gain and offset for FR pipe
> + * @MALI_C55_PARAM_BLOCK_GAMMA_DS: Gamma gain and offset for DS pipe
>   */
>  enum mali_c55_param_block_type {
>  	MALI_C55_PARAM_BLOCK_SENSOR_OFFS,
> @@ -234,6 +239,8 @@ enum mali_c55_param_block_type {
>  	MALI_C55_PARAM_MESH_SHADING_CONFIG,
>  	MALI_C55_PARAM_MESH_SHADING_SELECTION,
>  	MALI_C55_PARAM_BLOCK_CCM,
> +	MALI_C55_PARAM_BLOCK_GAMMA_FR,
> +	MALI_C55_PARAM_BLOCK_GAMMA_DS,
>  };
>  
>  /**
> @@ -795,6 +802,40 @@ struct mali_c55_params_ccm {
>  	__u16 offs[3];
>  };
>  
> +/**
> + * struct mali_c55_params_gamma - RGB Gamma correction
> + *
> + * Gamma correction is used to program a standard gamma curve such as the sRGB
> + * one. It provides gains and offsets to implement contrast adjustments.
> + *
> + * Gamma correction is applied on both the FR and DS pipes separately in the RGB
> + * colour domain where the following operations take place:
> + * 1) An offset is subtracted from each colour channel
> + * 2) Each colour channel is multiplied by a gain
> + * 3) The Gamma LUT is applied to each colour channel
> + *
> + * The Gamma LUT has 129 entries where each node is an unsigned 12 bit number.
> + * It is expected that LUT[0]=0 and LUT[128]=0xffff, with the other 127 values

lut entries are documented as unsigned 12-bit values, so 0xffff looks
inconsistent. Should this be 0xfff instead?

> + * defining the Gamma correction curve.
> + *
> + * As one Gamma correction block is available on both the FR and DS pipes, the
> + * header.type field should be set to one of either
> + * MALI_C55_PARAM_BLOCK_GAMMA_FR or MALI_C55_PARAM_BLOCK_GAMMA_DS from
> + * :c:type:`mali_c55_param_block_type`.
> + *
> + * @header:	The Mali-C55 parameters block header
> + * @gains:	Gains for the red, green and blue channel in unsigned Q4.8 format
> + * @offs:	Offsets subtracted from the red, green and blue channels
> + *		in unsigned 12-bit format
> + * @lut:	129-node Gamma LUT in u0.12 format
> + */
> +struct mali_c55_params_gamma {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 gains[3];
> +	__u16 offs[3];
> +	__u32 lut[MALI_C55_NUM_GAMMA_LUT_ELEMENTS];
> +};
> +
>  /**
>   * define MALI_C55_PARAMS_MAX_SIZE - Maximum size of all Mali C55 Parameters
>   *
> @@ -819,6 +860,8 @@ struct mali_c55_params_ccm {
>  	sizeof(struct mali_c55_params_awb_gains) +		\
>  	sizeof(struct mali_c55_params_mesh_shading_config) +	\
>  	sizeof(struct mali_c55_params_mesh_shading_selection) +	\
> -	sizeof(struct mali_c55_params_ccm))
> +	sizeof(struct mali_c55_params_ccm) +			\
> +	sizeof(struct mali_c55_params_gamma) +			\
> +	sizeof(struct mali_c55_params_gamma))
>  
>  #endif /* __UAPI_MALI_C55_CONFIG_H */
> 

-- 
Regards,
Vincenzo


