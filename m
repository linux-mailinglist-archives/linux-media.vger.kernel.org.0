Return-Path: <linux-media+bounces-65752-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GIfLFFaTPmpXIQkAu9opvQ
	(envelope-from <linux-media+bounces-65752-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:57:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA8A6CE35C
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:57:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=RmNYlNU3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65752-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65752-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F1F8304A8F6
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 14:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036412D5C7A;
	Fri, 26 Jun 2026 14:55:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04C72AEE1;
	Fri, 26 Jun 2026 14:55:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782485713; cv=none; b=XPtWbGeGEQLhsXcZIhCOyAas4h6Z+vCJrylaTtsAYjJ4oBS/T0zRfM9jcxZEOXyN1fztlOyY6U5WfWgsvrigLoKC5CFrxacf9oCA/XtGU4fGkQroHE/XR4LY+0sqYb2255AqR4YtoFnx3dq5ttti7G0GTMATDR1BKNmOe5id1Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782485713; c=relaxed/simple;
	bh=BdtIIC9ySCFkek7899huGQQ8FekUtpI7Tm8CrXm1k6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C+6DXQg5zHASh0fDpaWCQRDwxdIiH7SuzIeqq9JLK1mg+zoKBIbXI2W0dswRvZLqtGR3Knb/GCpy6thjm33+Oq3lsyvwerQU1AL/9TjG2UA1EZ4l6EFQ0KOo8ky8gQz3lRNIdjld9k46jvqMRfmocnI77XgZibDnZHiYSOBQoUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RmNYlNU3; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A078174;
	Fri, 26 Jun 2026 16:54:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782485669;
	bh=BdtIIC9ySCFkek7899huGQQ8FekUtpI7Tm8CrXm1k6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RmNYlNU3JQUhXTXsKqbuAWyI4K81iVDXF4e+BsIZYifxf9Rdjd4kv6GZZThAnIQ6n
	 oxIkwYaOrtalZDzjMt1feLFPzozmPkTMkgPKNw/J4rTOmAsH2DC3eIlFm9ivE5hevb
	 Zinlz1AeC9G0h+bb4yZggRUbk+8w6n5dsx1ro+xY=
Date: Fri, 26 Jun 2026 16:55:07 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com, 
	Konstantin Babin <Konstantin.Babin@arm.com>, Anthony McGivern <anthony.mcgivern@arm.com>, 
	linus.walleij@arm.com, Daniel Scally <dan.scally@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] media: arm: mali-c55: Add support for RGB Gamma
Message-ID: <aj6ScwVqtEqARek6@zed>
References: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com>
 <20260616-mali-c55-ccm-gamma-v2-2-0f93e9a95d98@ideasonboard.com>
 <2f80d1b2-5e0e-4581-a525-895fc4130c93@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2f80d1b2-5e0e-4581-a525-895fc4130c93@arm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65752-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vincenzo.frascino@arm.com,m:jacopo.mondi@ideasonboard.com,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,arm.com:email,zed:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCA8A6CE35C

Hi Vincenzo

On Fri, Jun 26, 2026 at 10:52:38AM +0100, Vincenzo Frascino wrote:
> Hi Jacopo,
>
> thank you for your patch!
>
> On 16/06/2026 15:36, Jacopo Mondi wrote:
> > From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> >
> > Add support for Gamma curve correction for the Mali C55 ISP.
> >
> > Define a new block in the uAPI using the extensible v4l2-isp format and
> > implement support for configuring the RGB Gamma parameters in the
> > mali-c55 parameters handler.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
>
> I have a couple of comments in addition to what Linus mentioned in his review.
> With this:
>
> Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>
> >
> > ---
> > v2:
> > - Remove unused 'rgb_enable' member
> > - Address checkpatch issues
> > ---
> >  .../media/platform/arm/mali-c55/mali-c55-params.c  | 75 ++++++++++++++++++++++
> >  .../platform/arm/mali-c55/mali-c55-registers.h     |  5 ++
> >  include/uapi/linux/media/arm/mali-c55-config.h     | 45 ++++++++++++-
> >  3 files changed, 124 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > index 96f1b28a6d77..21f031aaf595 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > @@ -47,6 +47,8 @@
> >   * @shading_config:	For header->type == MALI_C55_PARAM_MESH_SHADING_CONFIG
> >   * @shading_selection:	For header->type == MALI_C55_PARAM_MESH_SHADING_SELECTION
> >   * @ccm:		For header->type == MALI_C55_PARAM_BLOCK_CCM
> > + * @gamma:		For header->type == MALI_C55_PARAM_BLOCK_GAMMA_FR and
> > + *			header->type = MALI_C55_PARAM_BLOCK_GAMMA_DS
> >   * @data:		Allows easy initialisation of a union variable with a
> >   *			pointer into a __u8 array.
> >   */
> > @@ -61,6 +63,7 @@ union mali_c55_params_block {
> >  	const struct mali_c55_params_mesh_shading_config *shading_config;
> >  	const struct mali_c55_params_mesh_shading_selection *shading_selection;
> >  	const struct mali_c55_params_ccm *ccm;
> > +	const struct mali_c55_params_gamma *gamma;
> >  	const __u8 *data;
> >  };
> >
> > @@ -462,6 +465,70 @@ static void mali_c55_params_ccm(struct mali_c55 *mali_c55,
> >  	mali_c55_ctx_write(mali_c55, MALI_C55_REG_CCM_ENABLE, 1);
> >  }
> >
> > +static void mali_c55_params_gamma(struct mali_c55 *mali_c55,
> > +				  union mali_c55_params_block block,
> > +				  __u32 offset, __u32 lut_base)
> > +{
> > +	const struct mali_c55_params_gamma *params = block.gamma;
> > +
> > +	if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > +		mali_c55_ctx_update_bits(mali_c55,
> > +					 MALI_C55_REG_GAMMA_RGB_ENABLE + offset,
> > +					 MALI_C55_GAMMA_ENABLE_MASK, 0x00);
> > +		return;
> > +	}
> > +
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_1 + offset,
> > +				 MALI_C55_GAMMA_GAIN_R_MASK, params->gains[0]);
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_1 + offset,
> > +				 MALI_C55_GAMMA_GAIN_G_MASK,
> > +				 MALI_C55_GAMMA_GAIN_G(params->gains[1]));
> > +	mali_c55_ctx_update_bits(mali_c55, MALI_C55_REG_GAMMA_GAINS_2 + offset,
> > +				 MALI_C55_GAMMA_GAIN_B_MASK, params->gains[2]);
> > +	mali_c55_ctx_update_bits(mali_c55,
> > +				 MALI_C55_REG_GAMMA_OFFSETS_1 + offset,
> > +				 MALI_C55_GAMMA_OFFSET_R_MASK,
> > +				 params->offs[0]);
> > +	mali_c55_ctx_update_bits(mali_c55,
> > +				 MALI_C55_REG_GAMMA_OFFSETS_1 + offset,
> > +				 MALI_C55_GAMMA_OFFSET_G_MASK,
> > +				 MALI_C55_GAMMA_OFFSET_G(params->offs[1]));
> > +	mali_c55_ctx_update_bits(mali_c55,
> > +				 MALI_C55_REG_GAMMA_OFFSETS_2 + offset,
> > +				 MALI_C55_GAMMA_OFFSET_B_MASK,
> > +				 params->offs[2]);
> > +
> > +	for (unsigned int i = 0; i < MALI_C55_NUM_GAMMA_LUT_ELEMENTS; i++) {
> > +		__u32 addr = lut_base + (i * 4);
> > +
> > +		mali_c55_ctx_write(mali_c55, addr, params->lut[i]);
> > +	}
> > +
> > +	mali_c55_ctx_update_bits(mali_c55,
> > +				 MALI_C55_REG_GAMMA_RGB_ENABLE + offset,
> > +				 MALI_C55_GAMMA_ENABLE_MASK, 0x1);
> > +}
> > +
> > +static void mali_c55_params_gamma_fr(struct mali_c55 *mali_c55,
> > +				     union mali_c55_params_block block)
> > +{
> > +	return mali_c55_params_gamma(mali_c55, block,
> > +				     MALI_C55_CAP_DEV_FR_REG_OFFSET,
> > +				     MALI_C55_REG_FR_GAMMA_RGB_MEM);
> > +}
> > +
> > +static void mali_c55_params_gamma_ds(struct mali_c55 *mali_c55,
> > +				     union mali_c55_params_block block)
> > +{
> > +	/* We cannot apply parameters to DS if it is not fitted. */
> > +	if (!(mali_c55->capabilities & MALI_C55_GPS_DS_PIPE_FITTED))
> > +		return;
> > +
> > +	return mali_c55_params_gamma(mali_c55, block,
> > +				     MALI_C55_CAP_DEV_DS_REG_OFFSET,
> > +				     MALI_C55_REG_DS_GAMMA_RGB_MEM);
> > +}
> > +
> >  static const mali_c55_params_handler mali_c55_params_handlers[] = {
> >  	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = &mali_c55_params_sensor_offs,
> >  	[MALI_C55_PARAM_BLOCK_AEXP_HIST] = &mali_c55_params_aexp_hist,
> > @@ -475,6 +542,8 @@ static const mali_c55_params_handler mali_c55_params_handlers[] = {
> >  	[MALI_C55_PARAM_MESH_SHADING_CONFIG] = &mali_c55_params_lsc_config,
> >  	[MALI_C55_PARAM_MESH_SHADING_SELECTION] = &mali_c55_params_lsc_selection,
> >  	[MALI_C55_PARAM_BLOCK_CCM] = &mali_c55_params_ccm,
> > +	[MALI_C55_PARAM_BLOCK_GAMMA_FR] = &mali_c55_params_gamma_fr,
> > +	[MALI_C55_PARAM_BLOCK_GAMMA_DS] = &mali_c55_params_gamma_ds,
> >  };
> >
> >  static const struct v4l2_isp_params_block_type_info
> > @@ -515,6 +584,12 @@ mali_c55_params_block_types_info[] = {
> >  	[MALI_C55_PARAM_BLOCK_CCM] = {
> >  		.size = sizeof(struct mali_c55_params_ccm),
> >  	},
> > +	[MALI_C55_PARAM_BLOCK_GAMMA_FR] = {
> > +		.size = sizeof(struct mali_c55_params_gamma),
> > +	},
> > +	[MALI_C55_PARAM_BLOCK_GAMMA_DS] = {
> > +		.size = sizeof(struct mali_c55_params_gamma),
> > +	},
> >  };
> >
> >  static_assert(ARRAY_SIZE(mali_c55_params_handlers) ==
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > index f098effde7b4..7a606bd2e843 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-registers.h
> > @@ -425,11 +425,13 @@ enum mali_c55_interrupts {
> >  #define MALI_C55_REG_GAMMA_GAINS_1			0x1c068
> >  #define MALI_C55_GAMMA_GAIN_R_MASK			GENMASK(11, 0)
> >  #define MALI_C55_GAMMA_GAIN_G_MASK			GENMASK(27, 16)
> > +#define MALI_C55_GAMMA_GAIN_G(x)			((x) << 16)
> >  #define MALI_C55_REG_GAMMA_GAINS_2			0x1c06c
> >  #define MALI_C55_GAMMA_GAIN_B_MASK			GENMASK(11, 0)
> >  #define MALI_C55_REG_GAMMA_OFFSETS_1			0x1c070
> >  #define MALI_C55_GAMMA_OFFSET_R_MASK			GENMASK(11, 0)
> >  #define MALI_C55_GAMMA_OFFSET_G_MASK			GENMASK(27, 16)
> > +#define MALI_C55_GAMMA_OFFSET_G(x)				((x) << 16)
>
> Nit: there is an extra tab before ((x) << 16) compared to the surrounding
> defines. Please align this with the style of the nearby MALI_C55_GAMMA_GAIN_G()
> macro.
>

Good catch, thanks

> >  #define MALI_C55_REG_GAMMA_OFFSETS_2			0x1c074
> >  #define MALI_C55_GAMMA_OFFSET_B_MASK			GENMASK(11, 0)
> >
> > @@ -441,6 +443,9 @@ enum mali_c55_interrupts {
> >  #define MALI_C55_REG_FR_GAMMA_RGB_ENABLE		0x1c064
> >  #define MALI_C55_REG_DS_GAMMA_RGB_ENABLE		0x1c1d8
> >
> > +#define MALI_C55_REG_FR_GAMMA_RGB_MEM			0x18280
> > +#define MALI_C55_REG_DS_GAMMA_RGB_MEM			0x18484
> > +
> >  #define MALI_C55_REG_FR_SCALER_HFILT			0x34a8
> >  #define MALI_C55_REG_FR_SCALER_VFILT			0x44a8
> >  #define MALI_C55_REG_DS_SCALER_HFILT			0x14a8
> > diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
> > index 0b2085eed81b..7e96564cb89c 100644
> > --- a/include/uapi/linux/media/arm/mali-c55-config.h
> > +++ b/include/uapi/linux/media/arm/mali-c55-config.h
> > @@ -36,6 +36,9 @@
> >   */
> >  #define MALI_C55_MAX_ZONES	(15 * 15)
> >
> > +/* Number of RGB gamma LUT entries. */
> > +#define MALI_C55_NUM_GAMMA_LUT_ELEMENTS 129
> > +
> >  /**
> >   * struct mali_c55_ae_1024bin_hist - Auto Exposure 1024-bin histogram statistics
> >   *
> > @@ -220,6 +223,8 @@ struct mali_c55_stats_buffer {
> >   * @MALI_C55_PARAM_MESH_SHADING_CONFIG : Mesh shading tables configuration
> >   * @MALI_C55_PARAM_MESH_SHADING_SELECTION: Mesh shading table selection
> >   * @MALI_C55_PARAM_BLOCK_CCM: Colour correction matrix
> > + * @MALI_C55_PARAM_BLOCK_GAMMA_FR: Gamma gain and offset for FR pipe
> > + * @MALI_C55_PARAM_BLOCK_GAMMA_DS: Gamma gain and offset for DS pipe
> >   */
> >  enum mali_c55_param_block_type {
> >  	MALI_C55_PARAM_BLOCK_SENSOR_OFFS,
> > @@ -234,6 +239,8 @@ enum mali_c55_param_block_type {
> >  	MALI_C55_PARAM_MESH_SHADING_CONFIG,
> >  	MALI_C55_PARAM_MESH_SHADING_SELECTION,
> >  	MALI_C55_PARAM_BLOCK_CCM,
> > +	MALI_C55_PARAM_BLOCK_GAMMA_FR,
> > +	MALI_C55_PARAM_BLOCK_GAMMA_DS,
> >  };
> >
> >  /**
> > @@ -795,6 +802,40 @@ struct mali_c55_params_ccm {
> >  	__u16 offs[3];
> >  };
> >
> > +/**
> > + * struct mali_c55_params_gamma - RGB Gamma correction
> > + *
> > + * Gamma correction is used to program a standard gamma curve such as the sRGB
> > + * one. It provides gains and offsets to implement contrast adjustments.
> > + *
> > + * Gamma correction is applied on both the FR and DS pipes separately in the RGB
> > + * colour domain where the following operations take place:
> > + * 1) An offset is subtracted from each colour channel
> > + * 2) Each colour channel is multiplied by a gain
> > + * 3) The Gamma LUT is applied to each colour channel
> > + *
> > + * The Gamma LUT has 129 entries where each node is an unsigned 12 bit number.
> > + * It is expected that LUT[0]=0 and LUT[128]=0xffff, with the other 127 values
>
> lut entries are documented as unsigned 12-bit values, so 0xffff looks
> inconsistent. Should this be 0xfff instead?

Oh yes!

Thanks
   j

>
> > + * defining the Gamma correction curve.
> > + *
> > + * As one Gamma correction block is available on both the FR and DS pipes, the
> > + * header.type field should be set to one of either
> > + * MALI_C55_PARAM_BLOCK_GAMMA_FR or MALI_C55_PARAM_BLOCK_GAMMA_DS from
> > + * :c:type:`mali_c55_param_block_type`.
> > + *
> > + * @header:	The Mali-C55 parameters block header
> > + * @gains:	Gains for the red, green and blue channel in unsigned Q4.8 format
> > + * @offs:	Offsets subtracted from the red, green and blue channels
> > + *		in unsigned 12-bit format
> > + * @lut:	129-node Gamma LUT in u0.12 format
> > + */
> > +struct mali_c55_params_gamma {
> > +	struct v4l2_isp_params_block_header header;
> > +	__u16 gains[3];
> > +	__u16 offs[3];
> > +	__u32 lut[MALI_C55_NUM_GAMMA_LUT_ELEMENTS];
> > +};
> > +
> >  /**
> >   * define MALI_C55_PARAMS_MAX_SIZE - Maximum size of all Mali C55 Parameters
> >   *
> > @@ -819,6 +860,8 @@ struct mali_c55_params_ccm {
> >  	sizeof(struct mali_c55_params_awb_gains) +		\
> >  	sizeof(struct mali_c55_params_mesh_shading_config) +	\
> >  	sizeof(struct mali_c55_params_mesh_shading_selection) +	\
> > -	sizeof(struct mali_c55_params_ccm))
> > +	sizeof(struct mali_c55_params_ccm) +			\
> > +	sizeof(struct mali_c55_params_gamma) +			\
> > +	sizeof(struct mali_c55_params_gamma))
> >
> >  #endif /* __UAPI_MALI_C55_CONFIG_H */
> >
>
> --
> Regards,
> Vincenzo
>
>

