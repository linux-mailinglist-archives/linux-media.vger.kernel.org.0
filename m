Return-Path: <linux-media+bounces-58782-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DPnEgs632kLQwAAu9opvQ
	(envelope-from <linux-media+bounces-58782-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:11:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6537401391
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 09:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D56A30293DF
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 07:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0687939B4AE;
	Wed, 15 Apr 2026 07:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ex9+ikAP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F573921F8;
	Wed, 15 Apr 2026 07:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776237057; cv=none; b=QvQmqwaI7+r8TAujEW1O2RnapNU/mXcjbhVsKQXXVgoPi6GOhJ4jc4UfGj/ZmZDsTk1q515CPl95rW9WZnx/4sWaIwLqgXcBIHjKB9DNue7GjGg3/dU86Q1Q2Ge9yyQc2aMKsssqh8YK6AToq66fxzmha6UmC1YhzYYwLtc/Hx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776237057; c=relaxed/simple;
	bh=alqsXU1zF74vHLWQOItAmJujx1s7BHFOgvznJwwOTOg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=fRcYR+8eNpIQbGqJsWAkC+4EJCUFFlwGxHTXOEyAoo2wWuj74rn1uggeVsNdhQZkB/h7RB/XMmIhmjCsXwLbBifPiCPCiNrZBvcTDYe/JuhkG7TjT5Sd94Bu4FSuusbU8yeystxTaBjRrM1eo3imXy2EWmtAo9F7fZC2FYug/BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ex9+ikAP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c30:51df:7e0d:3bc9:3b1b:3f69])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEDE8161;
	Wed, 15 Apr 2026 09:09:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776236958;
	bh=alqsXU1zF74vHLWQOItAmJujx1s7BHFOgvznJwwOTOg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ex9+ikAPl1v0OsOn3gGe+MtRX5zmZvh7Xkb2PCGyyQrO1QNzmb01nEl5oUR861RqH
	 6KWpmbmvyX2BAn8Pu8P86Kfurvef9QOEDVmjXeKw+c/MeKhBcXQk3JBMdRmOE/j1SM
	 ZDQVD13xN8EsqC4Kl7WHBv8SeCF65MB50EkHGkaY=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ad0F38XgZ5N_FQY7@zed>
References: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com> <20260410-rppx1-v7-2-43cfc6b44f1f@ideasonboard.com> <ad0F38XgZ5N_FQY7@zed>
Subject: Re: [PATCH v7 02/18] media: uapi: Add extensible param and stats blocks for RPPX1
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Date: Wed, 15 Apr 2026 12:40:46 +0530
Message-ID: <177623704654.489396.5578104193471185653@freya>
User-Agent: alot/0.13.dev20+g31692a239
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58782-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jai.luthra@ideasonboard.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,ragnatech.se,glider.be,gmail.com,renesas.com,vger.kernel.org,ideasonboard.com,mailbox.org];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D6537401391
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Quoting Jacopo Mondi (2026-04-14 20:35:05)
> Hi Jai
>=20
> On Fri, Apr 10, 2026 at 02:35:37PM +0530, Jai Luthra wrote:
> > Define the userspace API for the Dreamchip RPP-X1 ISP extensible
> > parameters and statistics. The RPP-X1 is functionally similar to the
> > RkISP1 already supported upstream, but operates at higher bit depths (up
> > to 24-bit precision in many blocks) and exposes additional configuration
> > options. This warrants a dedicated uAPI rather than reusing the RkISP1
> > definitions.
> >
> > The parameter blocks follow the V4L2 extensible parameters framework
> > using struct v4l2_isp_params_block_header, with each ISP functional
> > block represented as a tagged configuration structure. The statistics
> > buffer provides AWB, auto-exposure and histogram measurement results at
> > native RPP-X1 precision.
> >
> > Not all functional blocks present on the RPP-X1 hardware are included
> > yet, but the format is extensible and new blocks can be added without
> > breaking existing userspace.
>=20
> Let me continue the uAPI review
>=20
> >
> > Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > ---

[snip]

> > +/**
> > + * struct rppx1_lin_curve - Linearization curve for one color channel
> > + *
> > + * The RPP-X1 linearization module supports 12/20/24-bit precision dep=
ending
> > + * on hardware version. Values are provided at 24-bit precision; the d=
river
> > + * truncates to the hardware capability.
> > + *
> > + * @gamma_y: curve y-axis values, each up to 24 bits
> > + */
> > +struct rppx1_lin_curve {
> > +     __u32 gamma_y[RPPX1_LIN_SAMPLES_NUM];
> > +};
> > +
> > +/**
> > + * struct rppx1_lin_curve_dx - Linearization curve x-axis (sampling po=
ints)
> > + * increments.
> > + *
> > + * gamma_dx[0] is for the lower samples, so Bits 0:3 for sample 1, ...=
 Bits
> > + * 28:31 for sample 8
> > + * gamma_dx[1] is for the higher samples, so Bits 0:3 for sample 9, ..=
. Bits
> > + * 28:31 for sample 16
> > + *
> > + * The reset values for both fields is 0xcccccccc. This means that eac=
h sample
> > + * is 12 units away from the previous one on the x-axis.
> > + *
> > + * @gamma_dx: curve x-axis increments in 4-bit precision
> > + */
> > +struct rppx1_lin_curve_dx {
> > +     __u32 gamma_dx[2];
> > +};
> > +
> > +/**
> > + * struct rppx1_params_lin_config - Linearization (Sensor De-gamma) co=
nfiguration
> > + *
> > + * @header: block header (type =3D RPPX1_PARAMS_BLOCK_TYPE_LIN)
> > + * @curve_r: linearization curve for red channel
> > + * @curve_g: linearization curve for green channel
> > + * @curve_b: linearization curve for blue channel
> > + * @xa_pnts: x axis increment definitions
> > + */
> > +struct rppx1_params_lin_config {
> > +     struct v4l2_isp_params_block_header header;
> > +     struct rppx1_lin_curve curve_r;
> > +     struct rppx1_lin_curve curve_g;
> > +     struct rppx1_lin_curve curve_b;
> > +     struct rppx1_lin_curve_dx xa_pnts;
> > +};
> > +
> > +/**
> > + * struct rppx1_params_lsc_config - Lens Shading Correction configurat=
ion
> > + *
>=20
> A little more details maybe
>=20
> The correction factor are expressed as a grid of 16x16 segments that are
> mapped on the image. The size of each segment is expressed by the
> @x_size_tbl and @y_size_tbl arrays.
>=20
> The correction factors are expressed per-color channel in the
> @r_data_tbl, @gr_data_tbl, @gb_data_tbl and @b_data_tbl fields in
> Q2.10 format ranging from 1 to 3.999.
>=20
> Pre-calculated multiplication factors shall be provided in the
> @x_grad_tbl and @y_grad_tbl fields. Gradients are expressed as 12 bits
> integer values.
>=20

Ack.

> > + * @header: block header (type =3D RPPX1_PARAMS_BLOCK_TYPE_LSC)
> > + * @r_data_tbl: sample table red
>=20
> I would drop _tbl and use
>=20
>       @r_data: Correction factors for the red channel in Q2.10 format
>=20
> > + * @gr_data_tbl: sample table green (red)
> > + * @gb_data_tbl: sample table green (blue)
> > + * @b_data_tbl: sample table blue
>=20
> Same for these
>=20
> > + * @x_grad_tbl: gradient table x
>=20
> I would drop _tbl and use
>=20
>       @x_grad: Interpolation gradients for each horizontal sector
>=20
> > + * @y_grad_tbl: gradient table y
>=20
>       @y_grad: Interpolation gradients for each vertical sector
>=20
> > + * @x_size_tbl: size table x
>=20
>       @x_sect_size: Horizontal sectors sizes
>=20
> > + * @y_size_tbl: size table y
>=20
>       @y_sect_size: Vertical sectors sizes
>=20
> > + * @config_width: reserved
> > + * @config_height: reserved
>=20
> What for ?
>=20

No idea :(

I copied these over from RkISP1 but can't figure out the potential use.
Will drop.

> > + */
> > +struct rppx1_params_lsc_config {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u16 r_data_tbl[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
> > +     __u16 gr_data_tbl[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
> > +     __u16 gb_data_tbl[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
> > +     __u16 b_data_tbl[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
> > +     __u16 x_grad_tbl[RPPX1_LSC_SECTORS_TBL_SIZE];
> > +     __u16 y_grad_tbl[RPPX1_LSC_SECTORS_TBL_SIZE];
> > +     __u16 x_size_tbl[RPPX1_LSC_SECTORS_TBL_SIZE];
> > +     __u16 y_size_tbl[RPPX1_LSC_SECTORS_TBL_SIZE];
>=20
> Both sectors and gradients are 16 and not 8.

The change from 8 to 16 is handled in a separate SQUASH patch.

> I would name RPPX1_LSC_SECTORS_TBL_SIZE as RPPX1_LSC_NUM_SECTORS
>=20
> > +     __u16 config_width;
> > +     __u16 config_height;
>=20
> Drop these if not used

Ack.

>=20
> > +};
> > +
> > +/**
> > + * struct rppx1_params_awb_gain_config  - AWB gain configuration
> > + *
> > + * RPP-X1 AWB gains are 18-bit with 12-bit fractional part (0x1000 =3D=
 1.0),
>=20
> The White Balance (WB) module allows to specify per-color channel
> gains  WB gains are expressed as unsigned fixed-point values in
> Q6.12 format with a maximum of 63.999.
>=20
> > + * giving a range of 0.0 to 64.0.
> > + *
> > + * @header: block header (type =3D RPPX1_PARAMS_BLOCK_TYPE_AWB_GAIN)
> > + * @gain_red: gain for red component, 18-bit (Q6.12)
> > + * @gain_green_r: gain for green-in-red component, 18-bit (Q6.12)
> > + * @gain_blue: gain for blue component, 18-bit (Q6.12)
> > + * @gain_green_b: gain for green-in-blue component, 18-bit (Q6.12)
> > + */
> > +struct rppx1_params_awb_gain_config {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u32 gain_red;
> > +     __u32 gain_green_r;
> > +     __u32 gain_blue;
> > +     __u32 gain_green_b;
> > +};
> > +
> > +/**
> > + * struct rppx1_params_flt_config - Filter (demosaic/denoise) configur=
ation
>=20
> The filter/sharpening block seems to be embedded in the Debayer block.
> I don't think we have exercised this one enough to be confident we
> have a suitable userspace implementation yet.
>=20
> Can maybe post-pone this one ?
>=20

Sure, will drop.

> > + *
> > + * RPP-X1 thresholds are 18-bit and factors are 8-bit.
> > + *
> > + * @header: block header (type =3D RPPX1_PARAMS_BLOCK_TYPE_FLT)
> > + * @mode: filter mode
> > + * @grn_stage1: green filter stage 1 select (range 0x0...0x8)
> > + * @chr_h_mode: chroma filter horizontal mode
> > + * @chr_v_mode: chroma filter vertical mode
> > + * @thresh_bl0: If thresh_bl1 < sum_grad < thresh_bl0 then fac_bl0 is =
selected (blurring th)
> > + * @thresh_bl1: If sum_grad < thresh_bl1 then fac_bl1 is selected (blu=
rring th)
> > + * @thresh_sh0: If thresh_sh0 < sum_grad < thresh_sh1 then thresh_sh0 =
is selected (sharpening th)
> > + * @thresh_sh1: If thresh_sh1 < sum_grad then thresh_sh1 is selected (=
sharpening th)
> > + * @lum_weight: luminance weight, min (bits 0:11), kink (bits 12:23), =
gain (bits 28:30)
> > + * @fac_sh1: filter factor for sharp1 level
> > + * @fac_sh0: filter factor for sharp0 level
> > + * @fac_mid: filter factor for mid level and for static filter mode
> > + * @fac_bl0: filter factor for blur0 level
> > + * @fac_bl1: filter factor for blur1 level (max blur)
> > + */
> > +struct rppx1_params_flt_config {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u32 mode;
> > +     __u8 grn_stage1;
> > +     __u8 chr_h_mode;
> > +     __u8 chr_v_mode;
> > +     __u32 thresh_bl0;
> > +     __u32 thresh_bl1;
> > +     __u32 thresh_sh0;
> > +     __u32 thresh_sh1;
> > +     __u32 lum_weight;
> > +     __u32 fac_sh1;
> > +     __u32 fac_sh0;
> > +     __u32 fac_mid;
> > +     __u32 fac_bl0;
> > +     __u32 fac_bl1;
> > +};
> > +
> > +/**
> > + * struct rppx1_params_bdm_config - Bayer Demosaic configuration
> > + *
> > + * @header: block header (type =3D RPPX1_PARAMS_BLOCK_TYPE_BDM)
> > + * @demosaic_th: threshold for texture detection, 16-bit
> > + */
> > +struct rppx1_params_bdm_config {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u16 demosaic_th;
> > +};
>=20
> We don't have an algo in libcamera, right ? This seems simple, but
> until it's not exercised by userspace I would defer introducing it.
>=20

Ack.

> > +
> > +/**
> > + * struct rppx1_params_ctk_config - Color Correction (Cross-Talk) conf=
iguration
>=20
> The module seems to be called CCOR (Color CORrection)
>=20
> I would use that term
>=20
> > + *
> > + * RPP-X1 coefficients are 16-bit signed fixed-point (Q4.12).
> > + * Range: -8.0 (0x8000) to +7.9996 (0x7FFF), 1.0 =3D 0x1000.
>=20
> The CCOR (Color Correction) module performs color space conversion
> on a pixel-per-pixel basis using a 3x3 matrix of coefficients
> and per-color channel offsets.
>=20
> The matrix coefficients are represented as signed fixed point values
> in Q4.12 format ranging from -8 to +7.999.
>=20
> The per-channel color offsets are represented as 2's complement values
> stored in 25 bits ranging from -16777216 to 16777215.
>=20
> > + *
> > + * RPP-X1 offsets are up to 24-bit + sign depending on hardware versio=
n.
>=20
> For RPP-X1 the value seems to be fixed to 24 bits.

Indeed, it is 24 + 1 sign bit for the POST and AWB modules.

I got confused by another CCOR instance used for RGB2YUV_CCOR module which
is 12 bit unsigned.

>=20
> We might want to report the ccor_version register value in stats if
> this changes for other ISP model. However I would leave it out for the
> time being, assume 24 and if we need to support a different register
> size introduce ccor_version in stats and add a comment here. We won't
> need to change the block definition.
>=20

Ah, so here too the driver currently right shifts the parameters if
hardware version reg reports 12/20 bit instead of 24bit.

So I have the same question as the previous patch, does the userspace
benefit from knowing what's actually used, or can we abstract it away in
the uAPI?

> > + *
> > + * @header: block header (type =3D RPPX1_PARAMS_BLOCK_TYPE_CTK)
> > + * @coeff: 3x3 color correction matrix, Q4.12 signed
> > + * @ct_offset: R, G, B offsets, up to 25-bit signed
> > + */
> > +struct rppx1_params_ctk_config {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u16 coeff[3][3];
> > +     __u32 ct_offset[3];
>=20
> Or simply 'offset'
>=20

Ack.

> > +};
> > +
> > +/**
> > + * struct rppx1_params_goc_config - Gamma Out Correction configuration
>=20
> mmm, I would have used 'gamma', as that's what the manual use. But
> registers are named GAMMA_OUT so I would be fine with goc if that's
> preferred
>=20

I think GAMMA_OUT would be better for this one, and GAMMA_IN for the LIN
module configuration?

> > + *
> > + * RPP-X1 gamma output values are up to 24-bit depending on hardware v=
ersion.
>=20
> The module allows to apply a Gamma correction curve to RGB data
> represented with a table of 16 entries @gamma_y. The 16 input sample
> points can be equidistant or segmented using a logarithmic scale
> according to the value of @mode.
>=20
> > + *
> > + * @header: block header (type =3D RPPX1_PARAMS_BLOCK_TYPE_GOC)
> > + * @mode: gamma curve mode (0 =3D logarithmic, 1 =3D equidistant)
>=20
> Please define an enum and refer to it here
>=20
> /**
>  * enum rppx1_params_goc_mode - GOC curve segmentation mode
>  * @RPPX1_PARAMS_GOC_MODE_LOGARITHMIC: Logarithmic segmentation mode (def=
ault)
>  * @RPPX1_PARAMS_GOC_MODE_EQUIDISTANT: Equidistant segmentation mode
>  */
> enum rppx1_params_goc_mode {
>         RPPX1_PARAMS_GOC_MODE_LOGARITHMIC,
>         RPPX1_PARAMS_GOC_MODE_EQUIDISTANT
> };
>=20

Ack.

> > + * @gamma_y: gamma out curve y-axis values, up to 24-bit
> > + */
> > +struct rppx1_params_goc_config {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u32 mode;
> > +     __u32 gamma_y[RPPX1_GAMMA_OUT_MAX_SAMPLES];
> > +};
> > +
> > +/**
> > + * enum rppx1_dpf_gain_usage - DPF noise function gain usage mode
> > + * @RPPX1_DPF_GAIN_USAGE_DISABLED: gain not used
> > + * @RPPX1_DPF_GAIN_USAGE_NF_GAINS: use noise function gains
> > + * @RPPX1_DPF_GAIN_USAGE_LSC_GAINS: use LSC gains
> > + * @RPPX1_DPF_GAIN_USAGE_NF_LSC_GAINS: use noise function and LSC gains
> > + * @RPPX1_DPF_GAIN_USAGE_AWB_GAINS: use AWB gains
> > + * @RPPX1_DPF_GAIN_USAGE_AWB_LSC_GAINS: use AWB and LSC gains
> > + */
> > +enum rppx1_dpf_gain_usage {
> > +     RPPX1_DPF_GAIN_USAGE_DISABLED,
> > +     RPPX1_DPF_GAIN_USAGE_NF_GAINS,
> > +     RPPX1_DPF_GAIN_USAGE_LSC_GAINS,
> > +     RPPX1_DPF_GAIN_USAGE_NF_LSC_GAINS,
> > +     RPPX1_DPF_GAIN_USAGE_AWB_GAINS,
> > +     RPPX1_DPF_GAIN_USAGE_AWB_LSC_GAINS,
> > +};
> > +
> > +/**
> > + * enum rppx1_nll_scale_mode - DPF noise level lookup scale mode
> > + * @RPPX1_NLL_SCALE_LINEAR: linear scaling
> > + * @RPPX1_NLL_SCALE_LOGARITHMIC: logarithmic scaling
> > + */
> > +enum rppx1_nll_scale_mode {
> > +     RPPX1_NLL_SCALE_LINEAR,
> > +     RPPX1_NLL_SCALE_LOGARITHMIC,
> > +};
> > +
> > +/**
> > + * enum rppx1_dpf_rb_filtersize - DPF red/blue filter kernel size
> > + * @RPPX1_DPF_RB_FILTERSIZE_13x9: 13x9 filter size
> > + * @RPPX1_DPF_RB_FILTERSIZE_9x9: 9x9 filter size
> > + */
> > +enum rppx1_dpf_rb_filtersize {
> > +     RPPX1_DPF_RB_FILTERSIZE_13x9,
> > +     RPPX1_DPF_RB_FILTERSIZE_9x9,
> > +};
> > +
> > +/**
> > + * struct rppx1_dpf_gain - DPF noise function gain configuration
> > + *
> > + * @mode: gain usage mode
> > + * @nf_r_gain: noise function gain replacing AWB gain for red
> > + * @nf_b_gain: noise function gain replacing AWB gain for blue
> > + * @nf_gr_gain: noise function gain replacing AWB gain for green-in-red
> > + * @nf_gb_gain: noise function gain replacing AWB gain for green-in-bl=
ue
> > + */
> > +struct rppx1_dpf_gain {
> > +     __u32 mode;
> > +     __u16 nf_r_gain;
> > +     __u16 nf_b_gain;
> > +     __u16 nf_gr_gain;
> > +     __u16 nf_gb_gain;
> > +};
> > +
> > +#define RPPX1_DPF_MAX_NLF_COEFFS                     17
> > +#define RPPX1_DPF_MAX_SPATIAL_COEFFS                 6
> > +
> > +/**
> > + * struct rppx1_dpf_nll - DPF noise level lookup
> > + *
> > + * @coeff: noise level lookup coefficients
> > + * @scale_mode: 0 =3D linear, 1 =3D logarithmic
> > + */
> > +struct rppx1_dpf_nll {
> > +     __u16 coeff[RPPX1_DPF_MAX_NLF_COEFFS];
> > +     __u32 scale_mode;
> > +};
> > +
> > +/**
> > + * struct rppx1_dpf_rb_flt - DPF red/blue filter configuration
> > + *
> > + * @fltsize: filter kernel size (0 =3D 13x9, 1 =3D 9x9)
> > + * @spatial_coeff: spatial weight coefficients
> > + * @r_enable: enable filter for red pixels
> > + * @b_enable: enable filter for blue pixels
> > + */
> > +struct rppx1_dpf_rb_flt {
> > +     __u32 fltsize;
> > +     __u8 spatial_coeff[RPPX1_DPF_MAX_SPATIAL_COEFFS];
> > +     __u8 r_enable;
> > +     __u8 b_enable;
> > +};
> > +
> > +/**
> > + * struct rppx1_dpf_g_flt - DPF green filter configuration
> > + *
> > + * @spatial_coeff: spatial weight coefficients
> > + * @gr_enable: enable filter for green-in-red pixels
> > + * @gb_enable: enable filter for green-in-blue pixels
> > + */
> > +struct rppx1_dpf_g_flt {
> > +     __u8 spatial_coeff[RPPX1_DPF_MAX_SPATIAL_COEFFS];
> > +     __u8 gr_enable;
> > +     __u8 gb_enable;
> > +};
> > +
> > +/**
> > + * struct rppx1_params_dpf_config - De-noising Pre-Filter configuration
> > + *
> > + * @header: block header (type =3D RPPX1_PARAMS_BLOCK_TYPE_DPF)
> > + * @gain: noise function gain
> > + * @g_flt: green filter configuration
> > + * @rb_flt: red/blue filter configuration
> > + * @nll: noise level lookup
> > + */
> > +struct rppx1_params_dpf_config {
> > +     struct v4l2_isp_params_block_header header;
> > +     struct rppx1_dpf_gain gain;
> > +     struct rppx1_dpf_g_flt g_flt;
> > +     struct rppx1_dpf_rb_flt rb_flt;
> > +     struct rppx1_dpf_nll nll;
> > +};
> > +
> > +/**
> > + * struct rppx1_params_dpf_strength_config - DPF strength configuration
> > + *
> > + * @header: block header (type =3D RPPX1_PARAMS_BLOCK_TYPE_DPF_STRENGT=
H)
> > + * @r: filter strength for RED
> > + * @g: filter strength for GREEN
> > + * @b: filter strength for BLUE
> > + */
> > +struct rppx1_params_dpf_strength_config {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u8 r;
> > +     __u8 g;
> > +     __u8 b;
> > +};
>=20
> This seems to be named "Bilateral Denoise".
>=20
> Same reasoning goes as per the filter module.
>=20
> We have an algorithm in libcamera for RkISP1 but it has been under
> heavy rework and I wouldn't consider it final or even very well
> tested.
>=20
> The whole denoising part need more work and I think we can we maybe
> post-pone DPF for RPP-X1 ?
>=20
> The risk is to define blocks we'll have to re-define later on.
>=20

Ack.

> > +
> > +/**
> > + * enum rppx1_awb_mode_type - AWB measurement mode
> > + * @RPPX1_AWB_MODE_MANUAL: manual white balance
>=20
> I can't find any reference to Manual mode.
>=20
> I see
> 1: RGB measurement
> 0: YcbCr

Indeed seems to be a leftover from RKISP, where too it is unused.

But looking at the implementation in rppx1_wbmeas.c, I see we are free to
program the CCOR coefficients and offsets, unlike RKISP.

WDYT about dropping the modes altogether and exposing that table to the
userspace?

>=20
> > + * @RPPX1_AWB_MODE_RGB: RGB measurement mode
> > + * @RPPX1_AWB_MODE_YCBCR: YCbCr measurement mode
> > + */
> > +enum rppx1_awb_mode_type {
>=20
> Maybe let's use AWB_MEAS as a prefix
>=20
> > +     RPPX1_AWB_MODE_MANUAL,
>=20
> Both for the type and the fields
>=20
> > +     RPPX1_AWB_MODE_RGB,
> > +     RPPX1_AWB_MODE_YCBCR,
> > +};
> > +
> > +/**
> > + * struct rppx1_params_awb_meas_config - AWB measurement configuration
> > + *
>=20
>     * The auto-white balance measurement module supports two
>     * measurement modes, selected by the @awb_mode field.
>     * The measurement window is programmed through the @awb_wnd field.
>     *
>     * To support measurement in YCbCr a color conversion matrix with
>     * programmable offset is available is available in the
>     * @ccor_coeff and @ccor_offs fields.
>     */
>=20
>=20
> > + * RPP-X1 min_y, max_y, min_c, max_csum, awb_ref_cr, awb_ref_cb are up=
 to
> > + * 24-bit depending on hardware version (8/20/24-bit).
>=20
> As for the other similar cases, I think for RPP-X1 we can assume 24
> bits. If another version appears with a different bitwidth, we should
> report `awb_meas_version` through stats and add a comment here about
> the expected fields width.
>=20
> > + *
> > + * @header: block header (type =3D RPPX1_PARAMS_BLOCK_TYPE_AWB_MEAS)
> > + * @awb_wnd: measurement window
> > + * @awb_mode: measurement mode (from enum rppx1_awb_mode_type)
>=20
> Missing 'awb_max_en' with the associated enum
>=20

`__u8 enable_ymax_cmp` handles that bit.

IMO an enum would be overkill for a simple disable/enable, we don't do that
elsewhere right?

> /**
>  * enum rppx1_awb_max_en - Enable max luminance threshold
>  *
>  * Luminance max threshold enable. Only pixels with a luminance value
>  * lower than @max_y are considered. Only valid in YCbCr measurement mode.
>  *
>  * @RPPX1_AWB_MEAS_Y_MAX_DISABLE: Disable luminance threshold
>  * @RPPX1_AWB_MEAS_Y_MAX_ENABLE: Enable luminance threshold
>  */
> enum rppx1_awb_max_en {
>         RPPX1_AWB_MEAS_Y_MAX_DISABLE,
>          RPPX1_AWB_MEAS_Y_MAX_ENABLE
> };
>=20
> > + * @max_y: upper pixel value limit, up to 24-bit
>=20
> This is worth a longer explanation.
>=20
>       @max_y: luminance maximum value. Only pixels with luminance
>               value below this threshold are considered. Only valid if
>               @awb_mode is set to YCbCr and @awb_max_en is set to
>               enable.

Ack.

>=20
> > + * @min_y: lower pixel value limit, up to 24-bit
>=20
>       @min_y_max_g: luminance minimum value in YCbCr mode; maximum
>       green value in RGB mode
>=20
> > + * @max_csum: chrominance sum maximum, up to 24-bit
>=20
> Missing:
>=20
>       @enable_ymax_cmp: enable Y_MAX compare
>=20

Hmm, I see it in my original mail?

> > + * @min_c: chrominance minimum, up to 24-bit
> > + * @frames: number of frames for mean value calculation (0 =3D 1 frame)
>=20
>       (0 =3D 1 frame, ..., 7 =3D 8 frames)

>=20
> > + * @awb_ref_cr: reference Cr for AWB regulation, up to 24-bit
>=20
>       @ref_cr_max_r: reference Cr or maximum red pixels value

Ack.

>=20
> > + * @awb_ref_cb: reference Cb for AWB regulation, up to 24-bit
>=20
>       @ref_cb_max_b: reference Cb or maximum blue pixels value
>=20
> > + *
>=20
> Missing
>       @ccor_coeffs: Color conversion matrix coefficients. The
>       coefficients have to be programmed according to the measurement
>       mode in use.
>       @ccor_offs: Color conversion matrix offsets.
>=20
> As these two fields match the color conversion matrix, it might be
> worth defining a type for it where to defer the description of the
> coefficients and offset representations.

So should we drop the RGB/YCbCr Modes and use only the table, or keep the
modes, and the "Manual mode" when the user wants to specify a table?

>=20
> > + */
> > +struct rppx1_params_awb_meas_config {
> > +     struct v4l2_isp_params_block_header header;
> > +     struct rppx1_window awb_wnd;
> > +     __u32 awb_mode;
> > +     __u32 max_y;
> > +     __u32 min_y;
> > +     __u32 max_csum;
> > +     __u32 min_c;
> > +     __u8 frames;
> > +     __u32 awb_ref_cr;
> > +     __u32 awb_ref_cb;
> > +     __u8 enable_ymax_cmp;
> > +};
> > +
> > +/**
> > + * enum rppx1_histogram_mode - Histogram measurement mode
> > + * @RPPX1_HISTOGRAM_MODE_DISABLE: histogram disabled
> > + * @RPPX1_HISTOGRAM_MODE_RGB_COMBINED: combined RGB histogram
> > + * @RPPX1_HISTOGRAM_MODE_R_HISTOGRAM: red channel histogram
> > + * @RPPX1_HISTOGRAM_MODE_G_HISTOGRAM: green channel histogram
> > + * @RPPX1_HISTOGRAM_MODE_B_HISTOGRAM: blue channel histogram
> > + * @RPPX1_HISTOGRAM_MODE_Y_HISTOGRAM: luminance histogram
> > + */
> > +enum rppx1_histogram_mode {
> > +     RPPX1_HISTOGRAM_MODE_DISABLE,
> > +     RPPX1_HISTOGRAM_MODE_RGB_COMBINED,
> > +     RPPX1_HISTOGRAM_MODE_R_HISTOGRAM,
> > +     RPPX1_HISTOGRAM_MODE_G_HISTOGRAM,
> > +     RPPX1_HISTOGRAM_MODE_B_HISTOGRAM,
> > +     RPPX1_HISTOGRAM_MODE_Y_HISTOGRAM,
> > +};
> > +
> > +#define RPPX1_HISTOGRAM_WEIGHT_GRIDS_SIZE            25
>=20
> Missing the tap points definitions for HIST_CHANNEL_SEL

Handled in a SQUASH patch later.

>=20
> > +
> > +/**
> > + * struct rppx1_params_hst_config - Histogram measurement configuration
> > + *
> > + * @header: block header (type =3D RPPX1_PARAMS_BLOCK_TYPE_HST_MEAS)
> > + * @mode: histogram mode (from enum rppx1_histogram_mode)
>=20
> Missing:
>       @tap_point
>=20
>=20
> > + * @histogram_predivider: process every Nth pixel
>=20
> I see a separate v_stepsize and h_step_inc for the subsampling
>=20

Yeah I chose to leave this particular one out because it seemed a little
more complex than others.

Will do before v8.

> > + * @meas_window: measurement window coordinates
> > + * @hist_weight: weighting factors for sub-windows (5x5 grid)
>=20
> There also are three programmable coefficients, offsets and shifts

The coefficients are currently not exposed, instead we have `enum
rppx1_histogram_mode` handling RGB_COMBINED or separate R/G/B/Y
Histograms.

Same question as AWB, do we want to drop the modes and expose the
coefficients directly, or maybe have an extra "MANUAL" mode and keep the
enum?

>=20
> > + */
> > +struct rppx1_params_hst_config {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u32 mode;
> > +     __u8 histogram_predivider;
> > +     struct rppx1_window meas_window;
> > +     __u8 hist_weight[RPPX1_HISTOGRAM_WEIGHT_GRIDS_SIZE];
> > +};
> > +
> > +/**
> > + * enum rppx1_exp_meas_mode - Exposure measurement mode
> > + * @RPPX1_EXP_MEASURING_MODE_0: Y =3D 16 + 0.25R + 0.5G + 0.1094B
> > + * @RPPX1_EXP_MEASURING_MODE_1: Y =3D (R + G + B) x (85/256)
> > + */
> > +enum rppx1_exp_meas_mode {
> > +     RPPX1_EXP_MEASURING_MODE_0,
> > +     RPPX1_EXP_MEASURING_MODE_1,
>=20
> This doesn't match the definition of EXM_MODE I see:
>=20
>         RPPX1_EXP_MEASURING_MODE_0 =3D Disabled
>         RPPX1_EXP_MEASURING_MODE_1 =3D Y/R/G/B exposure measurement
>         RPPX1_EXP_MEASURING_MODE_2 =3D RGB Bayer exposure measurement

This is fixed in the SQUASH patch later which also exposes programmable
coefficients and sampling point.

The "MODE_0 =3D Disabled" is not exposed in the enum but rather through the
V4L2_ISP_PARAMS_FL_BLOCK_DISABLE flag. Again, having only one toggle in
uAPI seems better than two.

> > +};
> > +
>=20
> Missing TAP point definitions for EXM_CHANNEL_SEL
>=20

Done in SQUASH patch later in the series.

> > +/**
> > + * struct rppx1_params_aec_config - Auto Exposure measurement configur=
ation
> > + *
> > + * @header: block header (type =3D RPPX1_PARAMS_BLOCK_TYPE_AEC_MEAS)
> > + * @mode: exposure measure mode (from enum rppx1_exp_meas_mode)
> > + * @autostop: 0 =3D continuous, 1 =3D stop after one frame
>=20
> Seems not to be supported
>=20

The hardware documentation defines the bit, but says it's not supported.
So, it would mean that it might be supported in some later revision of the
HW?

Thus, I kept it around. But we can drop it too and define a new block
later.

> > + * @meas_window: measurement window coordinates
> > + */
> > +struct rppx1_params_aec_config {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u32 mode;
> > +     __u32 autostop;
>=20
> There also are coefficients
>=20
>         /* Unsigned Q0.7 values ranging from 0 to 1.992 */
>         struct {
>                 r;
>                 gr;
>                 b;
>                 gb;
>         } coeffs;
>=20

Handled in the SQUASH patch.

> > +     struct rppx1_window meas_window;
> > +};
> > +
> > +/**
> > + * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
> > + */
> > +#define RPPX1_PARAMS_MAX_SIZE                                         =
       \
> > +     (sizeof(struct rppx1_params_bls_config)                 +       \
> > +     sizeof(struct rppx1_params_dpcc_config)                 +       \
> > +     sizeof(struct rppx1_params_lin_config)                  +       \
> > +     sizeof(struct rppx1_params_awb_gain_config)             +       \
> > +     sizeof(struct rppx1_params_flt_config)                  +       \
> > +     sizeof(struct rppx1_params_bdm_config)                  +       \
> > +     sizeof(struct rppx1_params_ctk_config)                  +       \
> > +     sizeof(struct rppx1_params_goc_config)                  +       \
> > +     sizeof(struct rppx1_params_dpf_config)                  +       \
> > +     sizeof(struct rppx1_params_dpf_strength_config)         +       \
> > +     sizeof(struct rppx1_params_lsc_config)                  +       \
> > +     sizeof(struct rppx1_params_awb_meas_config)             +       \
> > +     sizeof(struct rppx1_params_hst_config)                  +       \
> > +     sizeof(struct rppx1_params_aec_config))
> > +
> > +/* -------------------------------------------------------------------=
--------
> > + * Statistics Structures
> > + *
> > + * Native RPP-X1 precision. Fields use __u32 where the hardware provid=
es
> > + * wider-than-8-bit results.
> > + */
> > +
> > +/**
> > + * struct rppx1_awb_meas - AWB measured values
> > + *
> > + * @cnt: white pixel count
> > + * @mean_y_or_g: mean Y (or G in RGB mode), up to 24-bit
> > + * @mean_cb_or_b: mean Cb (or B in RGB mode), up to 24-bit
> > + * @mean_cr_or_r: mean Cr (or R in RGB mode), up to 24-bit
> > + */
> > +struct rppx1_awb_meas {
> > +     __u32 cnt;
> > +     __u32 mean_y_or_g;
> > +     __u32 mean_cb_or_b;
> > +     __u32 mean_cr_or_r;
> > +};
> > +
> > +/**
> > + * struct rppx1_awb_stat - AWB statistics
> > + *
> > + * @awb_mean: measured AWB data
> > + */
> > +struct rppx1_awb_stat {
> > +     struct rppx1_awb_meas awb_mean[RPPX1_AWB_MAX_GRID];
> > +};
> > +
> > +/**
> > + * struct rppx1_bls_meas_val - BLS measured values
> > + *
> > + * RPP-X1 BLS statistics can be 8/20/24-bit depending on version.
> > + *
> > + * @meas_r: mean measured value for Bayer pattern R
> > + * @meas_gr: mean measured value for Bayer pattern Gr
> > + * @meas_gb: mean measured value for Bayer pattern Gb
> > + * @meas_b: mean measured value for Bayer pattern B
> > + */
> > +struct rppx1_bls_meas_val {
> > +     __u32 meas_r;
> > +     __u32 meas_gr;
> > +     __u32 meas_gb;
> > +     __u32 meas_b;
> > +};
> > +
> > +/**
> > + * struct rppx1_ae_stat - Auto Exposure statistics
> > + *
> > + * RPP-X1 exposure mean values are up to 20-bit depending on version.
> > + * The image is divided into a 5x5 grid (25 blocks).
> > + *
> > + * @exp_mean: mean luminance values per block, up to 20-bit
> > + * @bls_val: BLS measured values
> > + */
> > +struct rppx1_ae_stat {
> > +     __u32 exp_mean[RPPX1_EXM_MEAN_MAX];
> > +     struct rppx1_bls_meas_val bls_val;
> > +};
> > +
> > +/**
> > + * struct rppx1_hist_stat - Histogram statistics
> > + *
> > + * @hist_bins: 32 histogram bin counters, each 20-bit unsigned fixed p=
oint
> > + *          (bits 0-4 fractional, bits 5-19 integer)
> > + */
> > +struct rppx1_hist_stat {
> > +     __u32 hist_bins[RPPX1_HIST_BIN_N_MAX];
> > +};
> > +
> > +/**
> > + * struct rppx1_stat - RPP-X1 3A statistics
> > + *
> > + * @awb: auto white balance statistics
> > + * @ae: auto exposure statistics
> > + * @hist: histogram statistics
> > + */
> > +struct rppx1_stat {
> > +     struct rppx1_awb_stat awb;
> > +     struct rppx1_ae_stat ae;
> > +     struct rppx1_hist_stat hist;
> > +};
> > +
> > +/**
> > + * RPPX1_STAT_AWB - AWB measurement data available
> > + * RPPX1_STAT_AUTOEXP - Auto exposure measurement data available
> > + *
> Missing documentation of:
>=20
>       RPPX1_STAT_HIST - Histogram measurement data available
>=20
> > + */
> > +#define RPPX1_STAT_AWB                       (1U << 0)
> > +#define RPPX1_STAT_AUTOEXP           (1U << 1)
> > +#define RPPX1_STAT_HIST                      (1U << 2)
> > +
> > +/**
> > + * struct rppx1_stat_buffer - RPP-X1 statistics metadata buffer
> > + *
> > + * @meas_type: bitmask of available measurements (RPPX1_STAT_*)
> > + * @frame_id: frame identifier for synchronization
> > + * @params: statistics data
> > + */
> > +struct rppx1_stat_buffer {
> > +     __u32 meas_type;
> > +     __u32 frame_id;
> > +     struct rppx1_stat params;
>=20
> Maybe name it stats as well ?
>=20

Ack.

> Now that v2 of extensible stats is out, I would rebase this on top of
> them
>=20

Will do.

Thanks,
    Jai

> Thank you!
>    j
>=20
> > +};
> > +
> > +#endif /* __UAPI_RPP_X1_CONFIG_H */
> >
> > --
> > 2.53.0
> >
> >

