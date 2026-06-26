Return-Path: <linux-media+bounces-65750-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +esMGvmQPmqFIAkAu9opvQ
	(envelope-from <linux-media+bounces-65750-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:47:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F35706CE183
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:47:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=nRN65jnf;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65750-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65750-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1FF1730572BD
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E9D3FC5B7;
	Fri, 26 Jun 2026 14:45:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC92248886;
	Fri, 26 Jun 2026 14:45:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782485142; cv=none; b=Tv3Zq8XEQWzJjgyl8HZ5ZwpgXghfHpXWbymWM6f9tgAU/YLKE8dWLPUQ8kafEsWi/uGPIrtUqHqDDqU8/Kt8WwHNSDIIdoUJY8Rh7zJNw69vjkBjbQxF6bjbgMLNcWQVmdDL8FHp/v+DIDj6NK4gJAH4DY+IQOJqxwdRLqWJJdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782485142; c=relaxed/simple;
	bh=YZbMKAPKx6bcOYDowagGlO8moSpkFyhd98QssTAgvrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epc62Dm/VAcDr8jz0YD0Nu2w9PkPZQyfI8rX4dOdc+RrVBevScdufJ3Y1oUkfgRPYuTBWK+xpELSPZP6GTk7OUkX8cbms/M/ExU737GrnFqH09i1nUGzvtLNnC04FEC38kdOL2sCNT0NO1EisbOKPTF5ng2PIAG9VEHzynUnsxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nRN65jnf; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 859251E6;
	Fri, 26 Jun 2026 16:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782485087;
	bh=YZbMKAPKx6bcOYDowagGlO8moSpkFyhd98QssTAgvrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nRN65jnfrpnutkwUoPwM48+5SRvF4KHQ1i9nwY3mZVYY+jrczpglPONgLHnXCiG14
	 vlRJS/yjwuzYE+4AefPfG2y5KlN7w6OfwQFxlDI4zHkXb2gzvw/M7TKj31/uqlosl6
	 uiHF4ahgkv3tChEKC2Tm1YRKQebO7wK34ZyZaMtA=
Date: Fri, 26 Jun 2026 16:45:25 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com, 
	Konstantin Babin <Konstantin.Babin@arm.com>, Anthony McGivern <anthony.mcgivern@arm.com>, 
	linus.walleij@arm.com, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 1/2] media: arm: mali-c55: Add support for CCM
Message-ID: <aj6QBQhRlX6L5KGm@zed>
References: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com>
 <20260616-mali-c55-ccm-gamma-v2-1-0f93e9a95d98@ideasonboard.com>
 <1a4fe819-8351-465f-b77a-71433eb5eb68@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1a4fe819-8351-465f-b77a-71433eb5eb68@arm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65750-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:vincenzo.frascino@arm.com,m:jacopo.mondi@ideasonboard.com,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F35706CE183

Hi Vincenzo
   thanks for the review

On Fri, Jun 26, 2026 at 10:44:49AM +0100, Vincenzo Frascino wrote:
> Hi Jacopo,
>
> thank you for your patch!
>
> And sorry for the delay in my review.
>
> On 16/06/2026 15:36, Jacopo Mondi wrote:
> > From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> >
> > Add support for the CCM (Color Correction Matrix) for the Mali C55 ISP.
> >
> > Define a new block in the uAPI using the extensible v4l2-isp format and
> > implement support for configuring the CCM parameters in the mali-c55
> > ISP driver.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>
> I have a couple of questions. With this:
>
> Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>
> > ---
> >  .../media/platform/arm/mali-c55/mali-c55-params.c  | 52 ++++++++++++++++++++++
> >  include/uapi/linux/media/arm/mali-c55-config.h     | 41 ++++++++++++++++-
> >  2 files changed, 92 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > index de0e9d898db7..96f1b28a6d77 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > @@ -46,6 +46,7 @@
> >   * @awb_config:		For header->type == MALI_C55_PARAM_BLOCK_AWB_CONFIG
> >   * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
> >   * @shading_selection:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
> > + * @ccm:		For header->type == MALI_C55_PARAM_BLOCK_CCM
> >   * @data:		Allows easy initialisation of a union variable with a
> >   *			pointer into a __u8 array.
> >   */
> > @@ -59,6 +60,7 @@ union mali_c55_params_block {
> >  	const struct mali_c55_params_awb_config *awb_config;
> >  	const struct mali_c55_params_mesh_shading_config *shading_config;
> >  	const struct mali_c55_params_mesh_shading_selection *shading_selection;
> > +	const struct mali_c55_params_ccm *ccm;
> >  	const __u8 *data;
> >  };
> >
> > @@ -414,6 +416,52 @@ static void mali_c55_params_lsc_selection(struct mali_c55 *mali_c55,
> >  				 params->mesh_strength);
> >  }
> >
> > +static void mali_c55_params_ccm(struct mali_c55 *mali_c55,
> > +				union mali_c55_params_block block)
> > +{
> > +	const struct mali_c55_params_ccm *params = block.ccm;
> > +
> > +	if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > +		mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 0);
> > +		return;
> > +	}
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_R_R,
> > +				 MALI_C55_CCM_COEF_MASK, params->coeffs[0][0]);
>
> Should values be validated or masked before programming? Since this is

Don't mali_c55_ctx_update_bits() does making already ?

> uAPI-controlled input, it may be worth rejecting values with bits outside
> MALI_C55_CCM_COEF_MASK rather than silently truncating them in update_bits().
>
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_R_G,
> > +				 MALI_C55_CCM_COEF_MASK, params->coeffs[0][1]);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_R_B,
> > +				 MALI_C55_CCM_COEF_MASK, params->coeffs[0][2]);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_G_R,
> > +				 MALI_C55_CCM_COEF_MASK, params->coeffs[1][0]);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_G_G,
> > +				 MALI_C55_CCM_COEF_MASK, params->coeffs[1][1]);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_G_B,
> > +				 MALI_C55_CCM_COEF_MASK, params->coeffs[1][2]);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_B_R,
> > +				 MALI_C55_CCM_COEF_MASK, params->coeffs[2][0]);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_B_G,
> > +				 MALI_C55_CCM_COEF_MASK, params->coeffs[2][1]);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_COEF_B_B,
> > +				 MALI_C55_CCM_COEF_MASK, params->coeffs[2][2]);
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_GAIN_R,
> > +				 MALI_C55_CCM_ANTIFOG_GAIN_MASK, params->gains[0]);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_GAIN_G,
> > +				 MALI_C55_CCM_ANTIFOG_GAIN_MASK, params->gains[1]);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_GAIN_B,
> > +				 MALI_C55_CCM_ANTIFOG_GAIN_MASK, params->gains[2]);
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_OFFSET_R,
> > +				 MALI_C55_CCM_ANTIFOG_OFFSET_MASK, params->offs[0]);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_OFFSET_G,
> > +				 MALI_C55_CCM_ANTIFOG_OFFSET_MASK, params->offs[1]);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_CCM_ANTIFOG_OFFSET_B,
> > +				 MALI_C55_CCM_ANTIFOG_OFFSET_MASK, params->offs[2]);
> > +
> > +	mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 1);
> > +}
> > +
> >  static const mali_c55_params_handler mali_c55_params_handlers[] = {
> >  	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = &mali_c55_params_sensor_offs,
> >  	[MALI_C55_PARAM_BLOCK_AEXP_HIST] = &mali_c55_params_aexp_hist,
> > @@ -426,6 +474,7 @@ static const mali_c55_params_handler mali_c55_params_handlers[] = {
> >  	[MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP] = &mali_c55_params_awb_gains,
> >  	[MALI_C55_PARAM_MESH_SHADING_CONFIG] = &mali_c55_params_lsc_config,
> >  	[MALI_C55_PARAM_MESH_SHADING_SELECTION] = &mali_c55_params_lsc_selection,
> > +	[MALI_C55_PARAM_BLOCK_CCM] = &mali_c55_params_ccm,
> >  };
> >
> >  static const struct v4l2_isp_params_block_type_info
> > @@ -463,6 +512,9 @@ mali_c55_params_block_types_info[] = {
> >  	[MALI_C55_PARAM_MESH_SHADING_SELECTION] = {
> >  		.size = sizeof(struct mali_c55_params_mesh_shading_selection),
> >  	},
> > +	[MALI_C55_PARAM_BLOCK_CCM] = {
> > +		.size = sizeof(struct mali_c55_params_ccm),
> > +	},
> >  };
> >
> >  static_assert(ARRAY_SIZE(mali_c55_params_handlers) ==
> > diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
> > index 3d335f950eeb..0b2085eed81b 100644
> > --- a/include/uapi/linux/media/arm/mali-c55-config.h
> > +++ b/include/uapi/linux/media/arm/mali-c55-config.h
> > @@ -219,6 +219,7 @@ struct mali_c55_stats_buffer {
> >   * @MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP: Auto-white balance gains for AEXP-0 tap
> >   * @MALI_C55_PARAM_MESH_SHADING_CONFIG : Mesh shading tables configuration
> >   * @MALI_C55_PARAM_MESH_SHADING_SELECTION: Mesh shading table selection
> > + * @MALI_C55_PARAM_BLOCK_CCM: Colour correction matrix
> >   */
> >  enum mali_c55_param_block_type {
> >  	MALI_C55_PARAM_BLOCK_SENSOR_OFFS,
> > @@ -232,6 +233,7 @@ enum mali_c55_param_block_type {
> >  	MALI_C55_PARAM_BLOCK_AWB_GAINS_AEXP,
> >  	MALI_C55_PARAM_MESH_SHADING_CONFIG,
> >  	MALI_C55_PARAM_MESH_SHADING_SELECTION,
> > +	MALI_C55_PARAM_BLOCK_CCM,
> >  };
> >
> >  /**
> > @@ -757,6 +759,42 @@ struct mali_c55_params_mesh_shading_selection {
> >  	__u16 mesh_strength;
> >  };
> >
> > +/**
> > + * struct mali_c55_params_ccm - Coefficients, offsets and gains for the colour
> > + *				correction matrix
> > + *
> > + * The colour correction module converts images data from a sensor-specific
> > + * colour space to known one.
> > + *
> > + * Colour correction is applied after demosaicing and each pixel is represented
> > + * as a column vector of the three RGB colour channels on which the following
> > + * operations take place:
> > + * 1) An offset is subtracted from each colour channel
> > + * 2) Each colour channel is multiplied by a gain
> > + * 3) The pixel column vector is multiplied by the colour correction matrix
> > + *
> > + * This struct allows users to configure the coefficients for CCM and the
> > + * per-channel offsets and gains. The nine matrix coefficients are expressed as
> > + * signed Q4.8 Sign/Magnitude fixed-point numbers, the three gain multipliers
> > + * are expressed as unsigned Q4.8 fixed-point numbers and the three offsets are
> > + * expressed as a 12-bit unsigned integers.
> > + *
> > + * header.type should be set to MALI_C55_PARAM_BLOCK_CCM from
> > + * :c:type:`mali_c55_param_block_type`.
> > + *
> > + * @header:	The Mali-C55 parameters block header
> > + * @coeffs:	3x3 color conversion matrix coefficients in sign/magnitude
> > + *		Q4.8 format
> > + * @gains:	Gains for red, green and blue channels in unsigned Q4.8 format
> > + * @offs:	Offsets for red, green and blue channels
> > + */
> > +struct mali_c55_params_ccm {
> > +	struct v4l2_isp_params_block_header header;
> > +	__u16 coeffs[3][3];
> > +	__u16 gains[3];
> > +	__u16 offs[3];
>
> The comment says offsets are 12-bit unsigned integers. Is there a reason why
> instead of validation in the params parser so userspace gets an error for values
> above 4095, we rely on register masking?
>

If we want per-block validation of values they should be implemented
on top of https://patchwork.linuxtv.org/project/linux-media/patch/20260505-extensible-stats-v1-4-e16f326b8dad@ideasonboard.com/
using the new block_validate() callback.

I can do so by listing
https://patchwork.linuxtv.org/project/linux-media/list/?series=24772
as a pre-requisite of this patch

> > +};
> > +
> >  /**
> >   * define MALI_C55_PARAMS_MAX_SIZE - Maximum size of all Mali C55 Parameters
> >   *
> > @@ -780,6 +818,7 @@ struct mali_c55_params_mesh_shading_selection {
> >  	sizeof(struct mali_c55_params_awb_config) +		\
> >  	sizeof(struct mali_c55_params_awb_gains) +		\
> >  	sizeof(struct mali_c55_params_mesh_shading_config) +	\
> > -	sizeof(struct mali_c55_params_mesh_shading_selection))
> > +	sizeof(struct mali_c55_params_mesh_shading_selection) +	\
> > +	sizeof(struct mali_c55_params_ccm))
> >
> >  #endif /* __UAPI_MALI_C55_CONFIG_H */
> >
>
> --
> Regards,
> Vincenzo
>
>

