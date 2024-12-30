Return-Path: <linux-media+bounces-24178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E519FE911
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 17:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D71118825C6
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 16:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33C4A1ACEB6;
	Mon, 30 Dec 2024 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EElFWxdx"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD20AD2D;
	Mon, 30 Dec 2024 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735576486; cv=none; b=OhkcFdk1hvsVKYO4z++k+R34Gy7C02Yq3grvbK4k+HNYhjisYtIUYOL6KeNX4TjUVpbYnS2uNad6ZjrIpoBkHsiGgQwUWfi0SuQ0ieoXuEatbFjUWS5n6pAorNJLdvzHhcqKLZeHntqNJvgYhHl3dC1mNVpyL4yQDybfpdInT2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735576486; c=relaxed/simple;
	bh=IjBuOglw9QZNKSXJgtOA47o1XWkryNyuWFHperi0Ff0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJnUR7yrnBGe/sYeqw8I3E5CIV+dyLNyXyFPqS4m5v6qlO2pSZe1UDDoxYRPtrqCz0FUtlHZ/Cxw9fkf5bpA1w4rn5p/ErfMdq3VKcNvpq3GEQcdKvBuskWzblWzlWSLlJ+HZuzNnDl21xL+JscZOR145tmhsVV+WShCbhNZbzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EElFWxdx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:4ee5:79f0:305d:67e0:677a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0125573B;
	Mon, 30 Dec 2024 17:33:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735576435;
	bh=IjBuOglw9QZNKSXJgtOA47o1XWkryNyuWFHperi0Ff0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EElFWxdxLthvXQhYyaz3ZdMeaCmsW9Ka5XcYM1DnPhtSSKwXXub/RMhlphDxW+4Aq
	 tUbvvHjeFLEek7tiOU6ALCI6tMy0xgS3PpeKIvEpkB145eV3Nf4gIfLnu7j1iX+YFu
	 LgynuKtq8xKDor7GGyjNLvVu8w8vK/E0W9jwgEjE=
Date: Mon, 30 Dec 2024 22:04:36 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] media: rockchip: rkisp1: Add support for AWB64
Message-ID: <pnngtp4oajfwlcxomkegg5mmvdf7opmitrkhhzhcuyza2kxos7@tcgu7gc4d5ws>
References: <20241230-awb64-v1-1-27b0ee65f551@ideasonboard.com>
 <20241230153037.GC31841@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ez7tsnedwl7jgryr"
Content-Disposition: inline
In-Reply-To: <20241230153037.GC31841@pendragon.ideasonboard.com>


--ez7tsnedwl7jgryr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC] media: rockchip: rkisp1: Add support for AWB64
MIME-Version: 1.0

Hi Laurent,

Thanks for the thorough review.

On Dec 30, 2024 at 17:30:37 +0200, Laurent Pinchart wrote:
> Hi Jai,
>=20
> Thank you for the patch.
>=20
> On Mon, Dec 30, 2024 at 12:25:09PM +0530, Jai Luthra wrote:
> > AWB64 is an advanced auto white-balance statistics block, present on the
> > ISP in iMX8MP. This block can calculate color statistics for a maximum
> > of 8 different (elliptical) regions, which can be used by the AWB
> > algorithm to better tune the color gains.
> >=20
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> > This patch is only compile-tested, thus marked as an RFC.
> >=20
> > Some of the ellipse and color transformation parameters are sparsely
> > documented, so the API might have to change on further testing.
> > ---
> >  .../media/platform/rockchip/rkisp1/rkisp1-common.h |   9 ++
> >  .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   3 +-
> >  .../media/platform/rockchip/rkisp1/rkisp1-params.c | 123 +++++++++++++=
++++++++
> >  .../media/platform/rockchip/rkisp1/rkisp1-regs.h   |  41 +++++++
> >  .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |  31 +++++-
> >  include/uapi/linux/rkisp1-config.h                 | 105 +++++++++++++=
+++++
> >  6 files changed, 310 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/d=
rivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index ca952fd0829ba7d923ad42fec92840ccd422b6e5..7dc9d101a1a01627f174cc4=
c454e4e57b38e1f8e 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -118,6 +118,7 @@ enum rkisp1_isp_pad {
> >   * @RKISP1_FEATURE_DMA_34BIT: The ISP uses 34-bit DMA addresses
> >   * @RKISP1_FEATURE_BLS: The ISP has a dedicated BLS block
> >   * @RKISP1_FEATURE_COMPAND: The ISP has a companding block
> > + * @RKISP1_FEATURE_AWB64: The ISP has an AWB64 block
> >   *
> >   * The ISP features are stored in a bitmask in &rkisp1_info.features a=
nd allow
> >   * the driver to implement support for features present in some ISP ve=
rsions
> > @@ -131,6 +132,7 @@ enum rkisp1_feature {
> >  	RKISP1_FEATURE_DMA_34BIT =3D BIT(4),
> >  	RKISP1_FEATURE_BLS =3D BIT(5),
> >  	RKISP1_FEATURE_COMPAND =3D BIT(6),
> > +	RKISP1_FEATURE_AWB64 =3D BIT(7),
> >  };
> > =20
> >  #define rkisp1_has_feature(rkisp1, feature) \
> > @@ -345,6 +347,8 @@ struct rkisp1_stats;
> >  struct rkisp1_stats_ops {
> >  	void (*get_awb_meas)(struct rkisp1_stats *stats,
> >  			     struct rkisp1_stat_buffer *pbuf);
> > +	void (*get_awb64_meas)(struct rkisp1_stats *stats,
> > +			       struct rkisp1_stat_buffer *pbuf);
> >  	void (*get_aec_meas)(struct rkisp1_stats *stats,
> >  			     struct rkisp1_stat_buffer *pbuf);
> >  	void (*get_hst_meas)(struct rkisp1_stats *stats,
> > @@ -381,6 +385,11 @@ struct rkisp1_params_ops {
> >  	void (*awb_meas_enable)(struct rkisp1_params *params,
> >  				const struct rkisp1_cif_isp_awb_meas_config *arg,
> >  				bool en);
> > +	void (*awb64_meas_config)(struct rkisp1_params *params,
> > +				  const struct rkisp1_cif_isp_awb64_meas_config *arg);
> > +	void (*awb64_meas_enable)(struct rkisp1_params *params,
> > +				  const struct rkisp1_cif_isp_awb64_meas_config *arg,
> > +				  bool en);
> >  	void (*awb_gain_config)(struct rkisp1_params *params,
> >  				const struct rkisp1_cif_isp_awb_gain_config *arg);
> >  	void (*aec_config)(struct rkisp1_params *params,
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/driv=
ers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index 0100b9c3edbefbdc001e2e4d13049efa9493e3bd..20903823b8eec2dd6b2fda7=
88a42ef7545158f8c 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -557,7 +557,8 @@ static const struct rkisp1_info imx8mp_isp_info =3D=
 {
> >  	.isp_ver =3D RKISP1_V_IMX8MP,
> >  	.features =3D RKISP1_FEATURE_MAIN_STRIDE
> >  		  | RKISP1_FEATURE_DMA_34BIT
> > -		  | RKISP1_FEATURE_COMPAND,
> > +		  | RKISP1_FEATURE_COMPAND
> > +		  | RKISP1_FEATURE_AWB64,
> >  	.max_width =3D 4096,
> >  	.max_height =3D 3072,
> >  };
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/d=
rivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > index b28f4140c8a309a3231d44d825c6461e3ecb2a44..1ee5f07d461c5ad7aadff90=
8c25f7a5bd2ff81f9 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> > @@ -60,6 +60,7 @@ union rkisp1_ext_params_config {
> >  	struct rkisp1_ext_params_afc_config afc;
> >  	struct rkisp1_ext_params_compand_bls_config compand_bls;
> >  	struct rkisp1_ext_params_compand_curve_config compand_curve;
> > +	struct rkisp1_ext_params_awb64_meas_config awb64;
> >  };
> > =20
> >  enum rkisp1_params_formats {
> > @@ -674,6 +675,101 @@ rkisp1_awb_meas_enable_v12(struct rkisp1_params *=
params,
> >  	}
> >  }
> > =20
> > +/* ISP White Balance Mode */
> > +static void
> > +rkisp1_awb64_meas_config_v10(struct rkisp1_params *params,
> > +			     const struct rkisp1_cif_isp_awb64_meas_config *arg)
>=20
> v10 refers to the Rockchip ISP v1.0. As the AWB64 block is found in the
> VSI ISP8000 Nano (v18.02 if I'm not mistaken), which we refer to in this
> driver as "RKISP1_V_IMX8MP", I would name this function
> rkisp1_awb64_meas_config_imx8mp() or just rkisp1_awb64_meas_config().
> Same for rkisp1_awb64_meas_enable_v10().
>=20

Will fix.

> > +{
> > +	/* window offset */
>=20
> 	/* Window offset and size */
>=20
> > +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_V_OFFS,
> > +		     arg->awb_wnd.v_offs);
> > +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_V_OFFS,
> > +		     arg->awb_wnd.v_offs);
>=20
> You're writing the same register twice.
>=20

Oops, will fix.

> > +	/* AWB window size */
>=20
> Drop this.
>=20
> > +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_V_SIZE,
> > +		     arg->awb_wnd.v_size);
> > +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_H_SIZE,
> > +		     arg->awb_wnd.h_size);
>=20
> A blank line here would make code easier to read.
>=20
> > +	/* RGB thresholds for measurement */
> > +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_R_MIN_MAX,
> > +		     arg->max_r << 8 | arg->min_r);
>=20
> To simplify the calculations in the kernel, would it make sense for
> userspace to compute this and store it in a single 16-bit field ?
>=20

Indeed, will fix.

> > +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_G_MIN_MAX,
> > +		     arg->max_g << 8 | arg->min_g);
> > +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_B_MIN_MAX,
> > +		     arg->max_b << 8 | arg->min_b);
>=20
> Same here.
>=20
> > +	/* Minimum input divider threshold */
> > +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_MIN_DIVIDER,
> > +		     arg->min_div & RKISP1_CIF_ISP_AWB64_MIN_DIV_MASK);
>=20
> And here.
>=20
> > +	/* Colorspace matrix coefficients */
> > +	for (int i =3D 0; i < 3; i++)
> > +		for (int j =3D 0; j < 3; j++)
> > +			rkisp1_write(params->rkisp1,
> > +				     RKISP1_CIF_ISP_AWB64_CC_COEFF(i * 3 + j),
> > +				     arg->cc_coeff[i][j]);
>=20
> Use curly braces for outer loop.
>=20
> > +	/* Ellipse configuration */
> > +	for (int i =3D 0; i < RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE; i++) {
>=20
> 		const struct rkisp1_cif_isp_awb64_ellip *ellip =3D &arg->ellip[i];
>=20
> > +		/* Center */
> > +		rkisp1_write(params->rkisp1,
> > +			     RKISP1_CIF_ISP_AWB64_ELLIP_CEN_X(i),
> > +			     arg->ellip[i].cen_x &
> > +				     RKISP1_CIF_ISP_AWB64_ELLIP_CEN_MASK);
>=20
> 			     ellip->cen_x & RKISP1_CIF_ISP_AWB64_ELLIP_CEN_MASK);
>=20
> Same below.
>=20
> > +		rkisp1_write(params->rkisp1,
> > +			     RKISP1_CIF_ISP_AWB64_ELLIP_CEN_Y(i),
> > +			     arg->ellip[i].cen_y &
> > +				     RKISP1_CIF_ISP_AWB64_ELLIP_CEN_MASK);
> > +		/* Radius */
> > +		rkisp1_write(params->rkisp1,
> > +			     RKISP1_CIF_ISP_AWB64_ELLIP_RMAX(i),
> > +			     arg->ellip[i].rmax &
> > +				     RKISP1_CIF_ISP_AWB64_ELLIP_RMAX_MASK);
> > +		/* CTM */
> > +		rkisp1_write(params->rkisp1,
> > +			     RKISP1_CIF_ISP_AWB64_ELLIP_A1(i),
> > +			     arg->ellip[i].ctm[0] &
> > +				     RKISP1_CIF_ISP_AWB64_ELLIP_A1_A3_MASK);
> > +		rkisp1_write(params->rkisp1,
> > +			     RKISP1_CIF_ISP_AWB64_ELLIP_A2(i),
> > +			     arg->ellip[i].ctm[1] &
> > +				     RKISP1_CIF_ISP_AWB64_ELLIP_A2_A4_MASK);
> > +		rkisp1_write(params->rkisp1,
> > +			     RKISP1_CIF_ISP_AWB64_ELLIP_A3(i),
> > +			     arg->ellip[i].ctm[2] &
> > +				     RKISP1_CIF_ISP_AWB64_ELLIP_A1_A3_MASK);
> > +		rkisp1_write(params->rkisp1,
> > +			     RKISP1_CIF_ISP_AWB64_ELLIP_A4(i),
> > +			     arg->ellip[i].ctm[3] &
> > +				     RKISP1_CIF_ISP_AWB64_ELLIP_A2_A4_MASK);
> > +	}
> > +}
> > +
> > +static void
> > +rkisp1_awb64_meas_enable_v10(struct rkisp1_params *params,
> > +			     const struct rkisp1_cif_isp_awb64_meas_config *arg,
> > +			     bool en)
> > +{
> > +	u32 reg_val =3D
> > +		rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_AWB64_MEAS_MODE);
> > +
> > +	if (en) {
> > +		if (arg->enable_median_filter)
> > +			reg_val |=3D RKISP1_CIF_ISP_AWB64_PRE_FILTER_EN;
> > +
> > +		if (arg->chrom_switch)
> > +			reg_val |=3D RKISP1_CIF_ISP_AWB64_CHROM_SWITCH;
> > +
> > +		reg_val |=3D (arg->ellip_unite & RKISP1_CIF_ISP_AWB64_UNITE_MASK)
> > +			   << RKISP1_CIF_ISP_AWB64_UNITE_SHIFT;
>=20
> You never clear any of those fields.
>=20

Ah I completely missed that, will fix.

> Is it intentional that you make it impossible to change those parameters
> without disabling and re-enabling the block ?
>=20

I was not exactly sure what all parameters were okay to toggle=20
mid-stream, so I kept everything in the MEAS_MODE register together in=20
this routine. For now I will move everything except the module enable=20
bit to the awb64_meas_config() routine.

But I guess more experimentation from the userspace side is needed, as I=20
see in the AWB block we only allow changing the colorspace mode when=20
enabling/disabling the block, and I am not sure if similar restrictions=20
are present here.

> > +
> > +		reg_val |=3D RKISP1_CIF_ISP_AWB64_MEAS_EN |
> > +			   RKISP1_CIF_ISP_AWB64_IRQ_EN;
> > +	} else {
> > +		reg_val &=3D ~RKISP1_CIF_ISP_AWB64_MEAS_EN;
> > +	}
> > +
> > +	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_AWB64_MEAS_MODE,
> > +		     reg_val);
> > +}
> > +
> >  static void
> >  rkisp1_awb_gain_config_v10(struct rkisp1_params *params,
> >  			   const struct rkisp1_cif_isp_awb_gain_config *arg)
> > @@ -2005,6 +2101,25 @@ static void rkisp1_ext_params_compand_compress(s=
truct rkisp1_params *params,
> >  				      RKISP1_CIF_ISP_COMPAND_CTRL_COMPRESS_ENABLE);
> >  }
> > =20
> > +static void rkisp1_ext_params_awb64(struct rkisp1_params *params,
> > +				    const union rkisp1_ext_params_config *block)
> > +{
> > +	const struct rkisp1_ext_params_awb64_meas_config *awb64 =3D &block->a=
wb64;
> > +
> > +	if (awb64->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE) {
> > +		params->ops->awb64_meas_enable(params, &awb64->config,
> > +					     false);
>=20
> Wrong indentation.
>=20
> > +		return;
> > +	}
> > +
> > +	params->ops->awb64_meas_config(params, &awb64->config);
> > +
> > +	if ((awb64->header.flags & RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE) &&
> > +	    !(params->enabled_blocks & BIT(awb64->header.type)))
> > +		params->ops->awb64_meas_enable(params, &awb64->config,
> > +					     true);
>=20
> Same here.
>=20
> > +}
> > +
> >  typedef void (*rkisp1_block_handler)(struct rkisp1_params *params,
> >  			     const union rkisp1_ext_params_config *config);
> > =20
> > @@ -2118,6 +2233,12 @@ static const struct rkisp1_ext_params_handler {
> >  		.group		=3D RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> >  		.features	=3D RKISP1_FEATURE_COMPAND,
> >  	},
> > +	[RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS] =3D {
> > +		.size		=3D sizeof(struct rkisp1_ext_params_awb64_meas_config),
> > +		.handler	=3D rkisp1_ext_params_awb64,
> > +		.group		=3D RKISP1_EXT_PARAMS_BLOCK_GROUP_OTHERS,
> > +		.features	=3D RKISP1_FEATURE_AWB64,
> > +	},
> >  };
> > =20
> >  static void rkisp1_ext_params_config(struct rkisp1_params *params,
> > @@ -2381,6 +2502,8 @@ static const struct rkisp1_params_ops rkisp1_v10_=
params_ops =3D {
> >  	.goc_config =3D rkisp1_goc_config_v10,
> >  	.awb_meas_config =3D rkisp1_awb_meas_config_v10,
> >  	.awb_meas_enable =3D rkisp1_awb_meas_enable_v10,
> > +	.awb64_meas_config =3D rkisp1_awb64_meas_config_v10,
> > +	.awb64_meas_enable =3D rkisp1_awb64_meas_enable_v10,
>=20
> I think you can drop these two fields and call
> rkisp1_awb64_meas_config() and rkisp1_awb64_meas_enable() directly.
>=20

Thanks, will do.

> >  	.awb_gain_config =3D rkisp1_awb_gain_config_v10,
> >  	.aec_config =3D rkisp1_aec_config_v10,
> >  	.hst_config =3D rkisp1_hst_config_v10,
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/dri=
vers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > index bf0260600a1923eebde6b5fe233daf7d427362dd..bc292a5738198fff28715b2=
a7e55e26e8fbddc64 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> > @@ -516,6 +516,24 @@
> >  #define RKISP1_CIF_ISP_AWB_CBCR_MAX_REF			0x000000ff
> >  #define RKISP1_CIF_ISP_AWB_THRES_MAX_YC			0x000000ff
> > =20
> > +/* AWB64 */
> > +/* ISP_AWB64_WHITE_CNT */
> > +#define RKISP1_CIF_ISP_AWB64_GET_PIXEL_CNT(x)		((x) & 0xffffff)
> > +/* ISP_AWB64_MEAS_MODE */
> > +#define RKISP1_CIF_ISP_AWB64_MEAS_EN			BIT(0)
> > +#define RKISP1_CIF_ISP_AWB64_PRE_FILTER_EN		BIT(1)
> > +#define RKISP1_CIF_ISP_AWB64_IRQ_EN			BIT(2)
> > +#define RKISP1_CIF_ISP_AWB64_CHROM_SWITCH		BIT(3)
> > +#define RKISP1_CIF_ISP_AWB64_UNITE_MASK			GENMASK(5, 0)
> > +#define RKISP1_CIF_ISP_AWB64_UNITE_SHIFT		4
> > +/* ISP_AWB64_DIVIDER_MIN */
> > +#define RKISP1_CIF_ISP_AWB64_MIN_DIV_MASK		GENMASK(9, 0)
> > +/* ISP_AWB64_ELLIP */
> > +#define RKISP1_CIF_ISP_AWB64_ELLIP_CEN_MASK		GENMASK(9, 0)
> > +#define RKISP1_CIF_ISP_AWB64_ELLIP_A1_A3_MASK		GENMASK(11, 0)
> > +#define RKISP1_CIF_ISP_AWB64_ELLIP_A2_A4_MASK		GENMASK(8, 0)
> > +#define RKISP1_CIF_ISP_AWB64_ELLIP_RMAX_MASK		GENMASK(23, 0)
> > +
> >  /* AE */
> >  /* ISP_EXP_CTRL */
> >  #define RKISP1_CIF_ISP_EXP_ENA				BIT(0)
> > @@ -1379,6 +1397,29 @@
> >  #define RKISP1_CIF_ISP_WDR_TONECURVE_YM_31_SHD	(RKISP1_CIF_ISP_WDR_BAS=
E + 0x0000012c)
> >  #define RKISP1_CIF_ISP_WDR_TONECURVE_YM_32_SHD	(RKISP1_CIF_ISP_WDR_BAS=
E + 0x00000130)
> > =20
> > +#define RKISP1_CIF_ISP_AWB64_BASE		0x00002c00
> > +#define RKISP1_CIF_ISP_AWB64_MEAS_MODE		(RKISP1_CIF_ISP_AWB64_BASE + 0=
x00000000)
> > +#define RKISP1_CIF_ISP_AWB64_H_OFFS		(RKISP1_CIF_ISP_AWB64_BASE + 0x00=
000000)
> > +#define RKISP1_CIF_ISP_AWB64_V_OFFS		(RKISP1_CIF_ISP_AWB64_BASE + 0x00=
000000)
> > +#define RKISP1_CIF_ISP_AWB64_H_SIZE		(RKISP1_CIF_ISP_AWB64_BASE + 0x00=
000000)
> > +#define RKISP1_CIF_ISP_AWB64_V_SIZE		(RKISP1_CIF_ISP_AWB64_BASE + 0x00=
000000)
> > +#define RKISP1_CIF_ISP_AWB64_R_MIN_MAX		(RKISP1_CIF_ISP_AWB64_BASE + 0=
x00000000)
> > +#define RKISP1_CIF_ISP_AWB64_G_MIN_MAX		(RKISP1_CIF_ISP_AWB64_BASE + 0=
x00000000)
> > +#define RKISP1_CIF_ISP_AWB64_B_MIN_MAX		(RKISP1_CIF_ISP_AWB64_BASE + 0=
x00000000)
> > +#define RKISP1_CIF_ISP_AWB64_MIN_DIVIDER	(RKISP1_CIF_ISP_AWB64_BASE + =
0x00000000)
> > +#define RKISP1_CIF_ISP_AWB64_CC_COEFF(n)	(RKISP1_CIF_ISP_AWB64_BASE + =
0x00000000 + (n) * 4)
>=20
> All those registers seem to be at the same address. I think the next
> version of this patch needs to be tested.
>=20

Oops, will fix. I was testing the register writes through a separate=20
shell script. Will test the kernel driver through libcamera before=20
sending the next revision.

> > +#define RKISP1_CIF_ISP_AWB64_ELLIP_CEN_X(n)	(RKISP1_CIF_ISP_AWB64_BASE=
 + 0x00000048 + (n) * 8)
> > +#define RKISP1_CIF_ISP_AWB64_ELLIP_CEN_Y(n)	(RKISP1_CIF_ISP_AWB64_BASE=
 + 0x0000004c + (n) * 8)
> > +#define RKISP1_CIF_ISP_AWB64_ELLIP_A1(n)	(RKISP1_CIF_ISP_AWB64_BASE + =
0x00000088 + (n) * 16)
> > +#define RKISP1_CIF_ISP_AWB64_ELLIP_A2(n)	(RKISP1_CIF_ISP_AWB64_BASE + =
0x0000008c + (n) * 16)
> > +#define RKISP1_CIF_ISP_AWB64_ELLIP_A3(n)	(RKISP1_CIF_ISP_AWB64_BASE + =
0x00000090 + (n) * 16)
> > +#define RKISP1_CIF_ISP_AWB64_ELLIP_A4(n)	(RKISP1_CIF_ISP_AWB64_BASE + =
0x00000094 + (n) * 16)
> > +#define RKISP1_CIF_ISP_AWB64_ELLIP_RMAX(n)	(RKISP1_CIF_ISP_AWB64_BASE =
+ 0x00000108 + (n) * 4)
> > +#define RKISP1_CIF_ISP_AWB64_WHITE_CNT(n)	(RKISP1_CIF_ISP_AWB64_BASE +=
 0x00000128 + (n) * 4)
> > +#define RKISP1_CIF_ISP_AWB64_R_ACCU(n)		(RKISP1_CIF_ISP_AWB64_BASE + 0=
x00000148 + (n) * 12)
> > +#define RKISP1_CIF_ISP_AWB64_G_ACCU(n)		(RKISP1_CIF_ISP_AWB64_BASE + 0=
x0000014c + (n) * 12)
> > +#define RKISP1_CIF_ISP_AWB64_B_ACCU(n)		(RKISP1_CIF_ISP_AWB64_BASE + 0=
x00000150 + (n) * 12)
> > +
> >  #define RKISP1_CIF_ISP_HIST_BASE_V12		0x00002c00
> >  #define RKISP1_CIF_ISP_HIST_CTRL_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + =
0x00000000)
> >  #define RKISP1_CIF_ISP_HIST_SIZE_V12		(RKISP1_CIF_ISP_HIST_BASE_V12 + =
0x00000004)
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c b/dr=
ivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> > index d5fdb8f82dc78b0143f71d76f36817db389921b7..a5b82963e74dac2340a1b3b=
07cd8d99dd23b5d5d 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-stats.c
> > @@ -172,6 +172,31 @@ rkisp1_stats_init_vb2_queue(struct vb2_queue *q, s=
truct rkisp1_stats *stats)
> >  	return vb2_queue_init(q);
> >  }
> > =20
> > +static void rkisp1_stats_get_awb64_meas_v10(struct rkisp1_stats *stats,
> > +					    struct rkisp1_stat_buffer *pbuf)
> > +{
> > +	/* Protect against concurrent access from ISR? */
>=20
> If this is needed, let's address the issue. If it's not, let's drop the
> comment.
>=20

Ack. I don't yet know if the same interrupt bit is used to signal stats=20
ready for both AWB and AWB64 blocks. Will hopefully have a better idea=20
once testing this with userspace.

> > +	struct rkisp1_device *rkisp1 =3D stats->rkisp1;
> > +	unsigned int i;
> > +	u32 white_cnt;
> > +
> > +	pbuf->meas_type |=3D RKISP1_CIF_ISP_STAT_AWB64;
> > +
> > +	for (i =3D 0; i < RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE; i++) {
>=20
> 	for (unsigned int i =3D 0; i < RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE; i++) {
> 		struct rkisp1_cif_isp_awb64_meas *count =3D
> 			&pbuf->params.awb64.count[i];
>=20
> and use count below.
>=20
> > +		white_cnt =3D rkisp1_read(rkisp1,
> > +					RKISP1_CIF_ISP_AWB64_WHITE_CNT(i));
> > +		pbuf->params.awb64.count[i].cnt =3D
> > +			RKISP1_CIF_ISP_AWB64_GET_PIXEL_CNT(white_cnt);
> > +
> > +		pbuf->params.awb64.count[i].accu_cr_or_r =3D
> > +			rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_R_ACCU(i));
> > +		pbuf->params.awb64.count[i].accu_y_or_g =3D
> > +			rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_G_ACCU(i));
> > +		pbuf->params.awb64.count[i].accu_cb_or_b =3D
> > +			rkisp1_read(rkisp1, RKISP1_CIF_ISP_AWB64_B_ACCU(i));
> > +	}
> > +}
> > +
> >  static void rkisp1_stats_get_awb_meas_v10(struct rkisp1_stats *stats,
> >  					  struct rkisp1_stat_buffer *pbuf)
> >  {
> > @@ -325,6 +350,7 @@ static void rkisp1_stats_get_bls_meas(struct rkisp1=
_stats *stats,
> > =20
> >  static const struct rkisp1_stats_ops rkisp1_v10_stats_ops =3D {
> >  	.get_awb_meas =3D rkisp1_stats_get_awb_meas_v10,
> > +	.get_awb64_meas =3D rkisp1_stats_get_awb64_meas_v10,
>=20
> Not all ISP versions using rkisp1_v10_stats_ops support the AWB64 block.
> You need to duplicate this structure, with a specific version for the
> i.MX8MP.
>=20
> >  	.get_aec_meas =3D rkisp1_stats_get_aec_meas_v10,
> >  	.get_hst_meas =3D rkisp1_stats_get_hst_meas_v10,
> >  };
> > @@ -355,8 +381,11 @@ rkisp1_stats_send_measurement(struct rkisp1_stats =
*stats, u32 isp_ris)
> > =20
> >  	cur_stat_buf =3D (struct rkisp1_stat_buffer *)
> >  			vb2_plane_vaddr(&cur_buf->vb.vb2_buf, 0);
> > -	if (isp_ris & RKISP1_CIF_ISP_AWB_DONE)
> > +	if (isp_ris & RKISP1_CIF_ISP_AWB_DONE) {
> >  		stats->ops->get_awb_meas(stats, cur_stat_buf);
> > +		if (stats->ops->get_awb64_meas)
> > +			stats->ops->get_awb64_meas(stats, cur_stat_buf);
>=20
> As you need to create rkisp1_imx8mp_stats_ops as explained above, you
> can combine awb and awb64 support in the .get_awb_meas() operation. One
> option is to create a rkisp1_stats_get_awb_meas_imx8mp() that calls
> rkisp1_stats_get_awb_meas_v10() and rkisp1_stats_get_awb64_meas().
>=20

Makes sense, will fix.

> > +	}
> > =20
> >  	if (isp_ris & RKISP1_CIF_ISP_AFM_FIN)
> >  		rkisp1_stats_get_afc_meas(stats, cur_stat_buf);
> > diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rk=
isp1-config.h
> > index 430daceafac7056951be968f3b4d9cd50eb04e71..22243ab8e079925d58f739b=
3078efed04fd8acda 100644
> > --- a/include/uapi/linux/rkisp1-config.h
> > +++ b/include/uapi/linux/rkisp1-config.h
> > @@ -45,6 +45,8 @@
> >  #define RKISP1_CIF_ISP_MODULE_DPF		(1U << 16)
> >  /* Denoise Pre-Filter Strength */
> >  #define RKISP1_CIF_ISP_MODULE_DPF_STRENGTH	(1U << 17)
> > +/* Auto White Balancing 64 statistics configuration */
> > +#define RKISP1_CIF_ISP_MODULE_AWB64		(1U << 18)
>=20
> This doesn't seem to be used, is that expected ?
>=20

Ah I don't think this is needed for blocks that are only used with=20
extended params API. Will drop after double checking.

> > =20
> >  #define RKISP1_CIF_ISP_CTK_COEFF_MAX            0x100
> >  #define RKISP1_CIF_ISP_CTK_OFFSET_MAX           0x800
> > @@ -88,6 +90,11 @@
> >  #define RKISP1_CIF_ISP_AWB_MAX_GRID                1
> >  #define RKISP1_CIF_ISP_AWB_MAX_FRAMES              7
> > =20
> > +/*
> > + * Automatic white balance extended block (AWB64)
> > + */
> > +#define RKISP1_CIF_ISP_AWB64_MAX_ELLIPSE           8
> > +
> >  /*
> >   * Gamma out
> >   */
> > @@ -176,6 +183,7 @@
> >  #define RKISP1_CIF_ISP_STAT_AUTOEXP       (1U << 1)
> >  #define RKISP1_CIF_ISP_STAT_AFM           (1U << 2)
> >  #define RKISP1_CIF_ISP_STAT_HIST          (1U << 3)
> > +#define RKISP1_CIF_ISP_STAT_AWB64         (1U << 4)
> > =20
> >  /**
> >   * enum rkisp1_cif_isp_version - ISP variants
> > @@ -519,6 +527,55 @@ struct rkisp1_cif_isp_awb_gain_config {
> >  	__u16 gain_green_b;
> >  };
> > =20
> > +/**
> > + * struct rkisp1_cif_isp_awb64_ellipse - Ellipse configuration for AWB=
64 measurement
> > + *
> > + * @rmax: Points within rmax (24 bits) distance from center are consid=
ered white point
>=20
> What's the unit ? A maximum radius of 16M pixels doesn't seem to make
> sense. Is this the square of the maximum radius ? Or a fixed-point
> integer value with a decimal part ?
>=20

The documentation just says 24 bits for RMax. My guess is it might be=20
some fixed point integer value, but I will have to experiment more to be=20
sure.

Same case for the color conversion and ellipse CTM co-efficients. Those=20
are most likely fixed point, but the documentation does not mention=20
that, and if it is how many bits are the fractional part.

> > + * @cen_x: X co-ordinate of the center of ellipse (10 bits)
>=20
> s/co-ordinate/coordinate/
>=20
> Same below.
>=20
> > + * @cen_y: Y co-ordinate of the center of ellipse (10 bits)
> > + * @ctm: Co-ordinate transformation matrix
> > + *       ctm[0] and ctm[2] are 12 bits, ctm[1] and ctm[3] are 9 bits
> > + */
> > +struct rkisp1_cif_isp_awb64_ellip {
> > +	__u32 rmax;
> > +	__u16 cen_x;
> > +	__u16 cen_y;
> > +	__u16 ctm[4];
> > +};
> > +
> > +/**
> > + * struct rkisp1_cif_isp_awb64_meas_config - Configuration for the AWB=
64 stats
> > + *
> > + * @awb_wnd: White balance measurement window (in pixels)
> > + * @ellip: Ellipse regions used for measurement
> > + * @cc_coeff: Colorspace matrix (all coefficients are 11 bits)
> > + * @min_div: Minimum divider, if input is less than this don't do divi=
sion (10 bits)
> > + * @max_r: Only pixels with R < max_r contribute to measurement
> > + * @min_r: Only pixels with R > min_r contribute to measurement
> > + * @max_g: Only pixels with G < max_g contribute to measurement
> > + * @min_g: Only pixels with G > min_g contribute to measurement
> > + * @max_b: Only pixels with B < max_b contribute to measurement
> > + * @min_b: Only pixels with B > min_b contribute to measurement
> > + * @ellip_unite: Bitmask to select which regions should be combined fo=
r measurement
> > + *               bits 0:2 to combine ellipse 0 with ellipse 1,2,3
> > + *               bits 3:5 to combine ellipse 4 with ellipse 5,6,7
> > + */
> > +struct rkisp1_cif_isp_awb64_meas_config {
> > +	struct rkisp1_cif_isp_window awb_wnd;
> > +	struct rkisp1_cif_isp_awb64_ellip ellip[RKISP1_CIF_ISP_AWB64_MAX_ELLI=
PSE];
> > +	__u16 cc_coeff[3][3];
> > +	__u16 min_div;
> > +	__u8 max_r;
> > +	__u8 min_r;
> > +	__u8 max_g;
> > +	__u8 min_g;
> > +	__u8 max_b;
> > +	__u8 min_b;
> > +	__u8 enable_median_filter;
>=20
> This field is not documented.
>=20
> > +	__u8 ellip_unite;
> > +	__u8 chrom_switch;
>=20
> Same here. Please compile-test the documentation.
>=20

Will do.

> > +};
> > +
> >  /**
> >   * struct rkisp1_cif_isp_flt_config - Configuration used by ISP filter=
ing
> >   *
> > @@ -1006,6 +1063,34 @@ struct rkisp1_cif_isp_hist_stat {
> >  	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
> >  };
> > =20
> > +/**
> > + * struct rkisp1_cif_isp_awb64_meas - AWB64 measured values
> > + *
> > + * @cnt: White pixel count, number of "white pixels" found during last
> > + *	 measurement
> > + * @accu_y_or_g: Total value of Y within elliptical region,
> > + *		 Green if RGB is selected.
> > + * @accu_cb_or_b: Total value of Cb within elliptical region,
> > + *		  Blue if RGB is selected.
> > + * @accu_cr_or_r: Total value of Cr within elliptical region,
> > + *		  Red if RGB is selected.
> > + */
> > +struct rkisp1_cif_isp_awb64_meas {
> > +	__u32 cnt;
> > +	__u32 accu_y_or_g;
> > +	__u32 accu_cb_or_b;
> > +	__u32 accu_cr_or_r;
> > +};
> > +
> > +/**
> > + * struct rkisp1_cif_isp_awb64_stat - statistics AWB64 data
> > + *
> > + * @count: Measured pixel accumulator data for elliptical regions
> > + */
> > +struct rkisp1_cif_isp_awb64_stat {
> > +	struct rkisp1_cif_isp_awb64_meas count[RKISP1_CIF_ISP_AWB64_MAX_ELLIP=
SE];
> > +};
> > +
> >  /**
> >   * struct rkisp1_cif_isp_stat - Rockchip ISP1 Statistics Data
> >   *
> > @@ -1019,6 +1104,7 @@ struct rkisp1_cif_isp_stat {
> >  	struct rkisp1_cif_isp_ae_stat ae;
> >  	struct rkisp1_cif_isp_af_stat af;
> >  	struct rkisp1_cif_isp_hist_stat hist;
> > +	struct rkisp1_cif_isp_awb64_stat awb64;
> >  };
> > =20
> >  /**
> > @@ -1059,6 +1145,7 @@ struct rkisp1_stat_buffer {
> >   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS: BLS in the compand block
> >   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND: Companding expand cur=
ve
> >   * @RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS: Companding compress=
 curve
> > + * @RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS: Auto white balance 64 sta=
tistics
> >   */
> >  enum rkisp1_ext_params_block_type {
> >  	RKISP1_EXT_PARAMS_BLOCK_TYPE_BLS,
> > @@ -1081,6 +1168,7 @@ enum rkisp1_ext_params_block_type {
> >  	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_BLS,
> >  	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_EXPAND,
> >  	RKISP1_EXT_PARAMS_BLOCK_TYPE_COMPAND_COMPRESS,
> > +	RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_MEAS,
> >  };
> > =20
> >  #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
> > @@ -1376,6 +1464,23 @@ struct rkisp1_ext_params_awb_meas_config {
> >  	struct rkisp1_cif_isp_awb_meas_config config;
> >  } __attribute__((aligned(8)));
> > =20
> > +/**
> > + * struct rkisp1_ext_params_awb64_meas_config - RkISP1 extensible para=
ms AWB64
> > + *						Meas config
> > + *
> > + * RkISP1 extensible parameters Auto-White Balance 64 Measurement conf=
iguration
> > + * block. Identified by :c:type:`RKISP1_EXT_PARAMS_BLOCK_TYPE_AWB64_ME=
AS`.
> > + *
> > + * @header: The RkISP1 extensible parameters header, see
> > + *	    :c:type:`rkisp1_ext_params_block_header`
> > + * @config: Auto-White Balance 64 measure configuration, see
> > + *	    :c:type:`rkisp1_cif_isp_awb64_meas_config`
> > + */
> > +struct rkisp1_ext_params_awb64_meas_config {
> > +	struct rkisp1_ext_params_block_header header;
> > +	struct rkisp1_cif_isp_awb64_meas_config config;
> > +} __attribute__((aligned(8)));
> > +
> >  /**
> >   * struct rkisp1_ext_params_hst_config - RkISP1 extensible params Hist=
ogram config
> >   *
> >=20
> > ---
> > base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
> > change-id: 20241230-awb64-79270098e15e
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

Will fix all the whitespace/indent issues that I didn't explictly ack=20
above.

Thanks,
Jai

--ez7tsnedwl7jgryr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmdyy5wACgkQQ96R+SSa
cUUs1g/+Iszi2w7BN6EIhFexr3uBR0GsgYxnwatiJay5zNaaOxEjS3UA8l01tmyC
t/htMuuKqcsJPACd03W/dQ5e3NjOxLLxL+oPCVdpsDEYst4LYg1oDhWwKTITtDJ5
/xbtV3lQJndk2i0712MJjB0iZBgS6mfV2S8B1HPzY8Fly/PKOFt2W85fXmBJF993
UsW+wO5qBVkrTEmaq/59kFmL7Kty82FxYISM7NpT+71KDTiSF4nMNTJz8k9ObGs9
ofm/3YNdZ+XtiDAjOeyEs1NQZLDbHTCl5nfZl70F56TeecK8xg+QbhKW9ePoUyl6
fKCAKnSVKUOLyWI5qeBcibkeqTLnZRSFodh5adJ2Dlz4QLnmqInxyqbczcTnMGAy
/gGhLRaevSfUPielB1SjInLND0lgvu9HR3GXNuN03hTk/k35/ni128E7/1mOEjcZ
PyiJZpix4Bg7HPXwmFkURqig4p1iAJ+Onh0MGs66PbhSqp0schG5lxX2D601+iwL
xM6tjQUJb78Ql3p2x8xVA7UUXWVg9r8MGtrAViO6wCqjc4PBhQm4XOGdwSUXOh1h
0xrh9gJBLJ/1qM2FM31jpQPW5i7jzvNpLEkqzMlKUDJw6x21jIr2TL3FRGekjPFG
u6TwTnpR8P62oOVYVzjSk5mhvt1EK2q2JaAnRJgIQNZRsFq7lEY=
=f9iW
-----END PGP SIGNATURE-----

--ez7tsnedwl7jgryr--

