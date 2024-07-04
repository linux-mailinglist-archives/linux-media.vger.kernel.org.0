Return-Path: <linux-media+bounces-14634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8402927676
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 14:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FAC9281C3C
	for <lists+linux-media@lfdr.de>; Thu,  4 Jul 2024 12:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077B31AE0BC;
	Thu,  4 Jul 2024 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lhOU+PmQ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55DD26289
	for <linux-media@vger.kernel.org>; Thu,  4 Jul 2024 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720097635; cv=none; b=MmskmFH/w75yawRtNFRxbmn7/zcqpdhz1By3ww6kyde+1QzHpoLe0IJBAIJI/VuiyyQZJBGEP5pi5/j2HJkSIfoVKvJ/397LKftLIlyHLqXo0gg+AxOQHg6VjVzlpH3iTdBgyqu3ot8NdnKe/HbgRjPvpnkwwNF4Avo/DzmrQf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720097635; c=relaxed/simple;
	bh=ay7lmimbP/vEt4iAC7x+PfVavKZ5hZbQdGAmkUe3oOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZdWS+DuWlmo4jCQYedgANCsS6ykJBtdtmASRIq6/IPeBy5Th+C8hqjNV8dDSWAbW5LViigfETEDsfo5E1u0+Ss2fkNmYzRPv4pwFgtTo0x2oLVs21nl1C/uklkq7+oCR18igpZbok2HN1ilCx126tdNTNw8Jtk/jQojPsFAbV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lhOU+PmQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C80FA63D;
	Thu,  4 Jul 2024 14:53:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720097601;
	bh=ay7lmimbP/vEt4iAC7x+PfVavKZ5hZbQdGAmkUe3oOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhOU+PmQj1pSpIuQD5ovxsl78cTmhXEL/NveUPYcKb4Ti64mdkrH8ueV0ZmZ89v2f
	 PghYOpcb0AJlmKIBEUsdcyHFOkK01v3BHDSXylxdIUhWxZGGZ8YOjlD8Dj//lR6gYO
	 E23QthdPe0WX52PVTxO/SH1dA8lU5r+4+gfuMN+c=
Date: Thu, 4 Jul 2024 15:53:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v1 5/5] media: rkisp1: Add support for the companding
 block
Message-ID: <20240704125329.GD10099@pendragon.ideasonboard.com>
References: <20240703222533.1662-1-laurent.pinchart@ideasonboard.com>
 <20240703222533.1662-6-laurent.pinchart@ideasonboard.com>
 <pqjankalgfcfxyiz57vkx3stgvjeiaxiqs4evkhmedzutkaosm@wpiub5jo3hv4>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <pqjankalgfcfxyiz57vkx3stgvjeiaxiqs4evkhmedzutkaosm@wpiub5jo3hv4>

On Thu, Jul 04, 2024 at 12:40:42PM +0200, Jacopo Mondi wrote:
> Hi Laurent
> On Thu, Jul 04, 2024 at 01:25:33AM GMT, Laurent Pinchart wrote:
> > From: Paul Elder <paul.elder@ideasonboard.com>
> >
> > Add support to the rkisp1 driver for the companding block that exists on
> > the i.MX8MP version of the ISP. This requires usage of the new
> > extensible parameters format, and showcases how the format allows for
> > extensions without breaking backward compatibility.
> >
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v0:
> >
> > - Drop RKISP1_EXT_PARAM_BUFFER_V2
> > - Use common structure for compression and expansion curves
> > - Rename config fields in rkisp1_ext_params_*_config to just config
> > - Mention block type in structures documentation
> > - Constify arguments
> > - Replace __uxx types with uxx
> > - Use rkisp1_bls_swap_regs() helper in rkisp1_compand_bls_config()
> > - Use generic feature handling mechanism
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-params.c  | 166 ++++++++++++++++++
> >  include/uapi/linux/rkisp1-config.h            |  85 ++++++++-
> >  2 files changed, 250 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index bac9d4972493..5865d53be9c8 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -57,6 +57,8 @@ union rkisp1_ext_params_config {
> >  	struct rkisp1_ext_params_hst_config hst;
> >  	struct rkisp1_ext_params_aec_config aec;
> >  	struct rkisp1_ext_params_afc_config afc;
> > +	struct rkisp1_ext_params_compand_bls_config compand_bls;
> > +	struct rkisp1_ext_params_compand_curve_config compand_curve;
> >  };
> >
> >  enum rkisp1_params_formats {
> > @@ -1258,6 +1260,92 @@ rkisp1_dpf_strength_config(struct rkisp1_params *params,
> >  	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_DPF_STRENGTH_R, arg->r);
> >  }
> >
> > +static void rkisp1_compand_write_px_curve(struct rkisp1_params *params,
> > +					  unsigned int addr, const u8 *px_curve)
> > +{
> > +	size_t i, j;
> > +	u32 val;
> > +
> > +	/*
> > +	 * The compand curve is specified as a piecewise linear function with
> > +	 * 64 points. X coordinates are stored as a log2 of the displacement
> > +	 * from the previous point, in 5 bits, with 6 values per register. The
> > +	 * last register stores 4 values.
> > +	 */
> > +	for (i = 0; i < 10; i++) {
> > +		val = 0;
> > +		for (j = 0; j < 6; j++)
> 
> This loops up to (9 * 6 + 5 = 59) and writes registers up to PX9
> This should probably be i < 11 or <= 10 as the companding PX curve has
> 64 points and 10 registers.
> 
> Also, to make sure, I would define the number of PX() registers
> entries instead of using the crude '10' and '6' values
> 
> > +			val |= ((px_curve[i * 6 + j] & 0x1f) << (j * 5));
> 
> Can't you just assign val without initializing it to 0 first and
> or-ing it later ?

I'm not sure to see what you mean here.

> Also, once you make the external loop go up to 11, the last two
> iterations will out-of-bound access px[64] and px[65] (px is declared
> of size "RKISP1_CIF_ISP_COMPAND_MAX_SAMPLES 64").
> 
> So this probably needs a check:
> 
>                 if (i == 10 && j > 3)
>                         break;
> 
> before accessing px_curve[], or maybe declare the for loop as
> 
> 		for (j = 0; j < (i == 10 ? 4 : 6); j++)
> 
> > +		rkisp1_write(params->rkisp1, addr + (i * 4), val);
> 
> Then the parameteric macros
> RKISP1_CIF_ISP_COMPAND_EXPAND_PX_N(n)
> RKISP1_CIF_ISP_COMPAND_COMPRESS_PX_N(n)
> 
> are unused if not for the base address. Should you remove them and
> only declare the base address value ?

I think it's useful to document what's available in terms of register
macros, even if not everything is used.

> > +	}
> > +
> > +	val = 0;
> > +	for (j = 0; j < 4; j++)
> > +		val |= ((px_curve[60 + j] & 0x1f) << (j * 5));
> 
> ...
> 
> ok, I should maybe read the whole function before commenting. I left
> the above comments there in case you want to unify the loop.

I'll try to rework the code.

> > +	rkisp1_write(params->rkisp1, addr + (i * 4), val);
> > +}
> > +
> > +static void
> > +rkisp1_compand_write_curve_mem(struct rkisp1_params *params,
> > +			       unsigned int reg_addr, unsigned int reg_data,
> > +			       size_t num_samples, const u32 *curve)
> 
> isn't the number of samples fixed to
> RKISP1_CIF_ISP_COMPAND_MAX_SAMPLES ?

A previous version of the patch had two macros for the expand and
compress curves. Now that it's unified, I can drop the argument.

> > +{
> > +	size_t i;
> 
> why a size and not an unsigned int ?

The patch is originally from Paul, I don't know. I'll switch to unsigned
int as size_t is 64-bit on 64-bit platforms, which is overkill.

> > +
> > +	for (i = 0; i < num_samples; i++) {
> > +		rkisp1_write(params->rkisp1, reg_addr, i);
> > +		rkisp1_write(params->rkisp1, reg_data, curve[i]);
> > +	}
> > +}
> > +
> > +static void
> > +rkisp1_compand_bls_config(struct rkisp1_params *params,
> > +			  const struct rkisp1_cif_isp_compand_bls_config *arg)
> > +{
> > +	static const u32 regs[] = {
> > +		RKISP1_CIF_ISP_COMPAND_BLS_A_FIXED,
> > +		RKISP1_CIF_ISP_COMPAND_BLS_B_FIXED,
> > +		RKISP1_CIF_ISP_COMPAND_BLS_C_FIXED,
> > +		RKISP1_CIF_ISP_COMPAND_BLS_D_FIXED,
> > +	};
> > +	u32 swapped[4];
> > +
> > +	rkisp1_bls_swap_regs(params->raw_type, regs, swapped);
> > +
> > +	rkisp1_write(params->rkisp1, swapped[0], arg->r);
> > +	rkisp1_write(params->rkisp1, swapped[1], arg->gr);
> > +	rkisp1_write(params->rkisp1, swapped[2], arg->gb);
> > +	rkisp1_write(params->rkisp1, swapped[3], arg->b);
> > +}
> > +
> > +static void
> > +rkisp1_compand_expand_config(struct rkisp1_params *params,
> > +			     const struct rkisp1_cif_isp_compand_curve_config *arg)
> > +{
> > +	rkisp1_compand_write_px_curve(params, RKISP1_CIF_ISP_COMPAND_EXPAND_PX_N(0),
> > +				      arg->px);
> > +	rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_EXPAND_Y_ADDR,
> > +				       RKISP1_CIF_ISP_COMPAND_EXPAND_Y_WRITE_DATA,
> > +				       ARRAY_SIZE(arg->y), arg->y);
> > +	rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_EXPAND_X_ADDR,
> > +				       RKISP1_CIF_ISP_COMPAND_EXPAND_X_WRITE_DATA,
> > +				       ARRAY_SIZE(arg->x), arg->x);
> 
> As the header reports
> 
>  * @x: Compand curve x-values. The functionality of these parameters are
>  *     unknown to do a lack of hardware documentation, but these are left here
> 
>  is it safe to write them ?

Yes. They don't seem to have an effect, but they're written.

> > +}
> > +
> > +static void
> > +rkisp1_compand_compress_config(struct rkisp1_params *params,
> > +			       const struct rkisp1_cif_isp_compand_curve_config *arg)
> > +{
> > +	rkisp1_compand_write_px_curve(params, RKISP1_CIF_ISP_COMPAND_COMPRESS_PX_N(0),
> > +				      arg->px);
> > +	rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_COMPRESS_Y_ADDR,
> > +				       RKISP1_CIF_ISP_COMPAND_COMPRESS_Y_WRITE_DATA,
> > +				       ARRAY_SIZE(arg->y), arg->y);
> > +	rkisp1_compand_write_curve_mem(params, RKISP1_CIF_ISP_COMPAND_COMPRESS_X_ADDR,
> > +				       RKISP1_CIF_ISP_COMPAND_COMPRESS_X_WRITE_DATA,
> > +				       ARRAY_SIZE(arg->x), arg->x);
> > +}
> > +
> >  static void
> >  rkisp1_isp_isr_other_config(struct rkisp1_params *params,
> >  			    const struct rkisp1_params_cfg *new_params)
> > @@ -1844,6 +1932,66 @@ rkisp1_ext_params_afcm(struct rkisp1_params *params,
> >  				      RKISP1_CIF_ISP_AFM_ENA);
> >  }
> >
> > +static void rkisp1_ext_params_compand_bls(struct rkisp1_params *params,
> +					  const union rkisp1_ext_params_config *block)
> 
> nit: I presume going over 80-cols here is intentional

I think so :-)

> > +{
> > +	const struct rkisp1_ext_params_compand_bls_config *bls =
> > +		&block->compand_bls;
> > +
> > +	if (bls->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> > +					RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENABLE);
> > +		return;
> > +	}
> > +
> > +	rkisp1_compand_bls_config(params, &bls->config);
> > +
> > +	if (!(params->enabled_blocks &
> > +	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS)))
> > +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> > +				      RKISP1_CIF_ISP_COMPAND_CTRL_BLS_ENABLE);
> > +}
> > +
> > +static void rkisp1_ext_params_compand_expand(struct rkisp1_params *params,
> > +					     const union rkisp1_ext_params_config *block)
> > +{
> > +	const struct rkisp1_ext_params_compand_curve_config *curve =
> > +		&block->compand_curve;
> > +
> > +	if (curve->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> > +					RKISP1_CIF_ISP_COMPAND_CTRL_EXPAND_ENABLE);
> > +		return;
> > +	}
> > +
> > +	rkisp1_compand_expand_config(params, &curve->config);
> > +
> > +	if (!(params->enabled_blocks &
> > +	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND)))
> > +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> > +				      RKISP1_CIF_ISP_COMPAND_CTRL_EXPAND_ENABLE);
> > +}
> > +
> > +static void rkisp1_ext_params_compand_compress(struct rkisp1_params *params,
> > +					       const union rkisp1_ext_params_config *block)
> > +{
> > +	const struct rkisp1_ext_params_compand_curve_config *curve =
> > +		&block->compand_curve;
> > +
> > +	if (curve->header.enable == RKISP1_EXT_PARAMS_BLOCK_DISABLE) {
> > +		rkisp1_param_clear_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> > +					RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE);
> > +		return;
> > +	}
> > +
> > +	rkisp1_compand_compress_config(params, &curve->config);
> > +
> > +	if (!(params->enabled_blocks &
> > +	      BIT(RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS)))
> > +		rkisp1_param_set_bits(params, RKISP1_CIF_ISP_COMPAND_CTRL,
> > +				      RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE);
> > +}
> > +
> >  typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
> >  			     const union rkisp1_ext_params_config *config);
> >
> > @@ -1939,6 +2087,24 @@ static const struct rkisp1_ext_params_handler {
> >  		.handler	= rkisp1_ext_params_afcm,
> >  		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_compand_bls_config),
> > +		.handler	= rkisp1_ext_params_compand_bls,
> > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> > +		.features	= RKISP1_FEATURE_COMPAND,
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
> > +		.handler	= rkisp1_ext_params_compand_expand,
> > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> > +		.features	= RKISP1_FEATURE_COMPAND,
> > +	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS] = {
> > +		.size		= sizeof(struct rkisp1_ext_params_compand_curve_config),
> > +		.handler	= rkisp1_ext_params_compand_compress,
> > +		.group		= RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> > +		.features	= RKISP1_FEATURE_COMPAND,
> > +	},
> >  };
> >
> >  static void rkisp1_ext_params_config(struct rkisp1_params *params,
> > diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> > index 00b09c92cca7..dd962df53af5 100644
> > --- a/include/uapi/linux/rkisp1-config.h
> > +++ b/include/uapi/linux/rkisp1-config.h
> > @@ -164,6 +164,11 @@
> >  #define RKISP1_CIF_ISP_DPF_MAX_NLF_COEFFS      17
> >  #define RKISP1_CIF_ISP_DPF_MAX_SPATIAL_COEFFS  6
> >
> > +/*
> > + * Compand
> > + */
> > +#define RKISP1_CIF_ISP_COMPAND_MAX_SAMPLES	64
> > +
> >  /*
> >   * Measurement types
> >   */
> > @@ -851,6 +856,39 @@ struct rkisp1_params_cfg {
> >  	struct rkisp1_cif_isp_isp_other_cfg others;
> >  };
> >
> > +/**
> > + * struct rkisp1_cif_isp_compand_bls_config - Rockchip ISP1 Companding parameters (BLS)
> > + * @r: Fixed subtraction value for Bayer pattern R
> > + * @gr: Fixed subtraction value for Bayer pattern Gr
> > + * @gb: Fixed subtraction value for Bayer pattern Gb
> > + * @b: Fixed subtraction value for Bayer pattern B
> > + *
> > + * The values will be subtracted from the sensor values. Note that unlike the
> > + * dedicated BLS block, the BLS values in the compander are 20-bit unsigned.
> 
> I presume it's not worth mentioning this feature is only supported on
> specific platforms, right ?

We could, but we don't do so for the BLS block. I don't mind either way.
I think it's fairly clear from the driver code, and I would expect
people who want to use this driver to have to read the driver code
anyway.

> > + */
> > +struct rkisp1_cif_isp_compand_bls_config {
> > +	__u32 r;
> > +	__u32 gr;
> > +	__u32 gb;
> > +	__u32 b;
> > +};
> > +
> > +/**
> > + * struct rkisp1_cif_isp_compand_curve_config - Rockchip ISP1 Companding
> > + * parameters (expand and compression curves)
> 
> Here and below: multi-line comments are aligned differently in the
> rest of the file

We have a mix of all kinds of alignment styles :-( If someone wants to
clean things up, I'll ack a patch.

> * struct rkisp1_cif_isp_compand_curve_config - Rockchip ISP1 Companding
> *                                              parameters (expand and compression curves)

It would need to be

 * struct rkisp0_cif_isp_compand_curve_config - Rockchip ISP1 Companding
 *                                              parameters (expand and
 *                                              compression curves)

which starts looking ridiculous :-)

> > + * @px: Compand curve x-values. Each value stores the distance from the
> > + *      previous x-value, expressed as log2 of the distance on 5 bits.
> > + * @x: Compand curve x-values. The functionality of these parameters are
> > + *     unknown to do a lack of hardware documentation, but these are left here
> 
> s/unknown to/unknown due to/
> 
> > + *     for future compatibility purposes.
> 
> Also, the documentation of struct members in the existing code doesn't
> use '.' at the end (not totally true, some do, so up to you)

I've added one because it's a multi-sentence comment.

> > + * @y: Compand curve y-values
> > + */
> > +struct rkisp1_cif_isp_compand_curve_config {
> > +	__u8 px[RKISP1_CIF_ISP_COMPAND_MAX_SAMPLES];
> > +	__u32 x[RKISP1_CIF_ISP_COMPAND_MAX_SAMPLES];
> > +	__u32 y[RKISP1_CIF_ISP_COMPAND_MAX_SAMPLES];
> > +};
> > +
> >  /*---------- PART2: Measurement Statistics ------------*/
> >
> >  /**
> > @@ -1018,6 +1056,9 @@ struct rkisp1_stat_buffer {
> >   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS: Histogram statistics
> >   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS: Auto exposure statistics
> >   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS: Auto-focus statistics
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS: BLS in the compand block
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND: Companding expand curve
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS: Compandding compress curve
> 
> s/Compandding/Companding/
> 
> >   */
> >  enum rkisp1_ext_params_block_type {
> >  	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
> > @@ -1037,6 +1078,9 @@ enum rkisp1_ext_params_block_type {
> >  	RKISP1_EXT_PARAMS_BLOCK_TYPE_HST_MEAS,
> >  	RKISP1_EXT_PARAMS_BLOCK_TYPE_AEC_MEAS,
> >  	RKISP1_EXT_PARAMS_BLOCK_TYPE_AFC_MEAS,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
> >  };
> >
> >  /**
> > @@ -1384,6 +1428,42 @@ struct rkisp1_ext_params_afc_config {
> >  	struct rkisp1_cif_isp_afc_config config;
> >  } __attribute__((aligned(8)));
> >
> > +/**
> > + * struct rkisp1_ext_params_compand_bls_config - RkISP1 extensible params
> > + * Compand BLS config
> 
> Here and in other places 'Compand' is spelled with capital 'C'. Is it
> intentional ?

I think Paul matched the documentation of other blocks, that write e.g.
'Histogram'.

> > + *
> > + * RkISP1 extensible parameters Companding configuration block (black level
> > + * subtraction). Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Companding BLS configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_compand_bls_config`
> > + */
> > +struct rkisp1_ext_params_compand_bls_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_compand_bls_config config;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp1_ext_params_compand_curve_config - RkISP1 extensible params
> > + * Compand curve config
> > + *
> > + * RkISP1 extensible parameters Companding configuration block (expand and
> > + * compression curves). Identified by
> > + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND`or
> > + * :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Companding curve configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_compand_curve_config`
> > + */
> > +struct rkisp1_ext_params_compand_curve_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_compand_curve_config config;
> > +} __attribute__((aligned(8)));
> > +
> >  #define RKISP1_EXT_PARAMS_MAX_SIZE					\
> >  	(sizeof(struct rkisp1_ext_params_bls_config)			+\
> >  	sizeof(struct rkisp1_ext_params_dpcc_config)			+\
> > @@ -1401,7 +1481,10 @@ struct rkisp1_ext_params_afc_config {
> >  	sizeof(struct rkisp1_ext_params_awb_meas_config)		+\
> >  	sizeof(struct rkisp1_ext_params_hst_config)			+\
> >  	sizeof(struct rkisp1_ext_params_aec_config)			+\
> > -	sizeof(struct rkisp1_ext_params_afc_config))
> > +	sizeof(struct rkisp1_ext_params_afc_config)			+\
> > +	sizeof(struct rkisp1_ext_params_compand_bls_config)		+\
> > +	sizeof(struct rkisp1_ext_params_compand_curve_config)		+\
> > +	sizeof(struct rkisp1_ext_params_compand_curve_config))
> 
> Do we need a comment to say why there are two entries of the same
> type or not ?

I'll add one.

> >
> >  /**
> >   * enum rksip1_ext_param_buffer_version - RkISP1 extensible parameters version

-- 
Regards,

Laurent Pinchart

