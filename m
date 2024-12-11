Return-Path: <linux-media+bounces-23222-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 954089ED349
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 18:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4E631674E8
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 17:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338CC1FC0E4;
	Wed, 11 Dec 2024 17:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TsWCuN9g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99AF31F9F70;
	Wed, 11 Dec 2024 17:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733937684; cv=none; b=Q+1b/jHWIy0FIz4mIotygajgBP+p6yNKd/ff9oBc3k3WUnwyk1ALyv1z/Oe0KP2UVP7G5CotwJlMTj86lerc4Ed+9jPKI+pRnjFH5nASub22P6/drct0RgHliqV60dYzVP7buR6YKnZRIigpJAI7dpCYezEXtaHP9GNceH5TCjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733937684; c=relaxed/simple;
	bh=MpTsHwW4a2ZAUE4wnln4f3KV1OTxGZAwaXjrkoO1+hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmBWjAzrybWo2+4dQczitYngK1IdOiy/7f9XSBpTSm0qTqpdVeaEDOn/U9L9nx57OEzFA4nDPzp7fLnrCAbbT9YtchPLHydf4OPdxihROYUlaW2QSpasUtoGu0Vo4+nJk1ue/QbZllBnfM5oKKeo7XFm0iiXnYjvYfskJK78k5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TsWCuN9g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6738D352;
	Wed, 11 Dec 2024 18:20:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733937642;
	bh=MpTsHwW4a2ZAUE4wnln4f3KV1OTxGZAwaXjrkoO1+hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TsWCuN9geGyxRvRsSIM1S04thV+zm2GYM8iaud0Jn+4D/rWaVPdhkZL30ky05Mpuo
	 qJrHlS9D30OOBefI+XOVXZ9qyGTRh40x06SCldOwAacjAXB45ajLaf9+nprAxsmx/O
	 FD+uCnAi6mrlGrBC/SWW+5fwuW34F39jNiZF6/tA=
Date: Wed, 11 Dec 2024 18:21:12 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: keke.li@amlogic.com
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com, 
	laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
Subject: Re: [PATCH v4 07/10] media: uapi: Add stats buffer and parameters
 buffer for c3 ISP
Message-ID: <uep67vpp245wrbzs3xpwlxmknalnri7vc3paooqqpb67qx53zt@zdibmsldg2yn>
References: <20241205-c3isp-v4-0-cb1868be0105@amlogic.com>
 <20241205-c3isp-v4-7-cb1868be0105@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205-c3isp-v4-7-cb1868be0105@amlogic.com>

Hi Keke

On Thu, Dec 05, 2024 at 05:04:33PM +0800, Keke Li via B4 Relay wrote:
> From: Keke Li <keke.li@amlogic.com>
>
> Add a header that describes the 3A statistics buffer and the
> parameters buffer for c3 ISP
>
> Signed-off-by: Keke Li <keke.li@amlogic.com>
> ---
>  include/uapi/linux/media/amlogic/c3-isp-config.h | 555 +++++++++++++++++++++++
>  1 file changed, 555 insertions(+)
>
> diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
> new file mode 100644
> index 000000000000..52b9b805f870
> --- /dev/null
> +++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
> @@ -0,0 +1,555 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
> + */
> +
> +#ifndef _UAPI_C3_ISP_CONFIG_H_
> +#define _UAPI_C3_ISP_CONFIG_H_
> +
> +#include <linux/types.h>
> +
> +/*
> + * Frames are split into zones of almost equal width and height - a zone is a
> + * rectangular tile of a frame. The metering blocks within the ISP collect
> + * aggregated statistics per zone.
> + */
> +#define C3_ISP_AE_MAX_ZONES               (17 * 15)
> +#define C3_ISP_AF_MAX_ZONES               (17 * 15)
> +#define C3_ISP_AWB_MAX_ZONES              (32 * 24)
> +
> +/* The maximum number of point on the diagonal of the frame for statistics */
> +#define C3_ISP_AE_MAX_PT_NUM              18
> +#define C3_ISP_AF_MAX_PT_NUM              18
> +#define C3_ISP_AWB_MAX_PT_NUM             33
> +
> +/**
> + * struct c3_isp_awb_zone_stats - AWB statistics of a zone
> + *
> + * AWB zone stats is aligned with 8 bytes
> + *
> + * @rg: the ratio of R / G in a zone
> + * @bg: the ratio of B / G in a zone
> + * @pixel_sum: the total number of pixels used in a zone
> + */
> +struct c3_isp_awb_zone_stats {
> +	__u16 rg;
> +	__u16 bg;
> +	__u32 pixel_sum;
> +};
> +
> +/**
> + * struct c3_isp_awb_stats - Auto white balance statistics information.
> + *
> + * AWB statistical information of all zones.
> + *
> + * @stats: array of auto white balance statistics
> + */
> +struct c3_isp_awb_stats {
> +	struct c3_isp_awb_zone_stats stats[C3_ISP_AWB_MAX_ZONES];
> +} __attribute__((aligned(16)));

the 16 bytes alignment is to match the layout produced by the HW ?

> +
> +/**
> + * struct c3_isp_ae_zone_stats - AE statistics of a zone
> + *
> + * AE zone stats is aligned with 8 bytes.
> + * This is a 5-bin histogram and the total sum is
> + * normalized to 0xffff.

Here and in many other comments text should be re-flowed to 80 cols

> + * So hist2 = 0xffff - (hist0 + hist1 + hist3 + hist4)
> + *
> + * @hist0: the global normalized pixel count for bin 0
> + * @hist1: the global normalized pixel count for bin 1
> + * @hist3: the global normalized pixel count for bin 3
> + * @hist4: the global normalized pixel count for bin 4
> + */
> +struct c3_isp_ae_zone_stats {
> +	__u16 hist0;
> +	__u16 hist1;
> +	__u16 hist3;
> +	__u16 hist4;
> +};
> +
> +/**
> + * struct c3_isp_ae_stats - Exposure statistics information
> + *
> + * AE statistical information consists of
> + * all blocks information and a 1024-bin histogram.
> + *
> + * @stats: array of auto exposure block statistics
> + * @reserved: undefined buffer space
> + * @hist: a 1024-bin histogram for the entire image
> + */
> +struct c3_isp_ae_stats {
> +	struct c3_isp_ae_zone_stats stats[C3_ISP_AE_MAX_ZONES];
> +	__u32 reserved[2];
> +	__u32 hist[1024];
> +} __attribute__((aligned(16)));
> +
> +/**
> + * struct c3_isp_af_zone_stats - AF statistics of a zone
> + *
> + * AF zone stats is aligned with 8 bytes.
> + * The zonal accumulated contrast metrics are stored
> + * in floating point format with 16 bits mantissa and
> + * 5 or 6 bits exponent.
> + * Apart from contrast metrics we accumulate squared image and
> + * quartic image data over the zone.
> + *
> + * @i2_mat: the mantissa of zonal squared image pixel sum
> + * @i4_mat: the mantissa of zonal quartic image pixel sum
> + * @e4_mat: the mantissa of zonal multi-directional quartic edge sum
> + * @e4_exp: the exponent of zonal multi-directional quartic edge sum
> + * @i2_exp: the exponent of zonal squared image pixel sum
> + * @i4_exp: the exponent of zonal quartic image pixel sum
> + */
> +struct c3_isp_af_zone_stats {
> +	__u16 i2_mat;
> +	__u16 i4_mat;
> +	__u16 e4_mat;
> +	__u16 e4_exp: 5;
> +	__u16 i2_exp: 5;
> +	__u16 i4_exp: 6;
> +};
> +
> +/**
> + * struct c3_isp_af_stats - Auto Focus statistics information
> + *
> + * AF statistical information of each zone
> + *
> + * @stats: array of auto focus block statistics
> + * @reserved: undefined buffer space
> + */
> +struct c3_isp_af_stats {
> +	struct c3_isp_af_zone_stats stats[C3_ISP_AF_MAX_ZONES];
> +	__u32 reserved[2];
> +} __attribute__((aligned(16)));
> +
> +/**
> + * struct c3_isp_stats_buffer - V4L2_META_FMT_C3ISP_STATS
> + *
> + * Contains ISP statistics
> + *
> + * @awb: auto white balance stats
> + * @ae: auto exposure stats
> + * @af: auto focus stats
> + */
> +struct c3_isp_stats_buffer {
> +	struct c3_isp_awb_stats awb;
> +	struct c3_isp_ae_stats ae;
> +	struct c3_isp_af_stats af;
> +};
> +
> +/**
> + * enum c3_isp_params_buffer_version -  C3 ISP parameters block versioning
> + *
> + * @C3_ISP_PARAMS_BUFFER_V0: First version of C3 ISP parameters block
> + */
> +enum c3_isp_params_buffer_version {
> +	C3_ISP_PARAMS_BUFFER_V0,
> +};
> +
> +/**
> + * enum c3_isp_params_block_type - Enumeration of C3 ISP parameter blocks
> + *
> + * Each block configures a specific processing block of the C3 ISP.
> + * The block type allows the driver to correctly interpret
> + * the parameters block data.

can be reflowed

> + *
> + * @C3_ISP_PARAMS_BLOCK_AWB_GAINS: White balance gains
> + * @C3_ISP_PARAMS_BLOCK_AWB_CONFIG: AE statistics parameters

This is AWB

> + * @C3_ISP_PARAMS_BLOCK_AE_CONFIG: AE statistics parameters
> + * @C3_ISP_PARAMS_BLOCK_AF_CONFIG: AF statistics parameters

I would say "statistic format configuration" for all blocks that
configure how stats are generated


> + * @C3_ISP_PARAMS_BLOCK_PST_GAMMA: post gamma parameters
> + * @C3_ISP_PARAMS_BLOCK_CCM: Color correction matrix parameters
> + * @C3_ISP_PARAMS_BLOCK_CSC: Color space conversion parameters
> + * @C3_ISP_PARAMS_BLOCK_BLC: Black level correction parameters
> + * @C3_ISP_PARAMS_BLOCK_SENTINEL: First non-valid block index
> + */
> +enum c3_isp_params_block_type {
> +	C3_ISP_PARAMS_BLOCK_AWB_GAINS,
> +	C3_ISP_PARAMS_BLOCK_AWB_CONFIG,
> +	C3_ISP_PARAMS_BLOCK_AE_CONFIG,
> +	C3_ISP_PARAMS_BLOCK_AF_CONFIG,
> +	C3_ISP_PARAMS_BLOCK_PST_GAMMA,
> +	C3_ISP_PARAMS_BLOCK_CCM,
> +	C3_ISP_PARAMS_BLOCK_CSC,
> +	C3_ISP_PARAMS_BLOCK_BLC,
> +	C3_ISP_PARAMS_BLOCK_SENTINEL
> +};
> +
> +#define C3_ISP_PARAMS_BLOCK_FL_NONE		0

mmm, in other versions of the extensible format (rkisp1) there's an
ENABLED and DISABLED flag. It seems to me you're using FL_NONE as
FL_ENABLED here. I'm not sure what's best, as setting a field to FL_NONE
seems weird, but also having to specify FL_ENABLED might be
redundant...

> +#define C3_ISP_PARAMS_BLOCK_FL_DISABLED		BIT(0)
> +
> +/**
> + * struct c3_isp_params_block_header - C3 ISP parameter block header
> + *
> + * This structure represents the common part of all the ISP configuration
> + * blocks. Each parameters block shall embed an instance of this structure type
> + * as its first member, followed by the block-specific configuration data. The
> + * driver inspects this common header to discern the block type and its size and
> + * properly handle the block content by casting it to the correct block-specific
> + * type.
> + *
> + * The @type field is one of the values enumerated by
> + * :c:type:`c3_isp_params_block_type` and specifies how the data should be
> + * interpreted by the driver. The @size field specifies the size of the
> + * parameters block and is used by the driver for validation purposes. The
> + * @flags field is a bitmask of per-block flags C3_ISP_PARAMS_FL*.
> + *
> + * When userspace wants to disable an ISP block the
> + * C3_ISP_PARAMS_BLOCK_FL_DISABLED bit should be set in the @flags field. In
> + * this case userspace may optionally omit the remainder of the configuration
> + * block, which will be ignored by the driver.
> + *
> + * When a new configuration of an ISP block needs to be applied userspace
> + * shall fully populate the ISP block and omit setting the
> + * C3_ISP_PARAMS_BLOCK_FL_DISABLED bit in the @flags field.
> + *
> + * Userspace is responsible for correctly populating the parameters block header
> + * fields (@type, @flags and @size) and the block-specific parameters.
> + *
> + * For example:
> + *
> + * .. code-block:: c
> + *
> + *	void populate_pst_gamma(struct c3_isp_params_block_header *block) {
> + *		struct c3_isp_params_pst_gamma *gamma =
> + *			(struct c3_isp_params_pst_gamma *)block;
> + *
> + *		gamma->header.type = C3_ISP_PARAMS_BLOCK_PST_GAMMA;
> + *		gamma->header.flags = C3_ISP_PARAMS_BLOCK_FL_NONE;

maybe explicitly saying FL_ENABLED is better ?

I guess it also depends if your driver differentiate "update the
config without enabling" from "apply a config and enable the block".

I'll find out in later patches I presume...

> + *		gamma->header.size = sizeof(*gamma);
> + *
> + *		for (unsigned int i = 0; i < 129; i++)
> + *			gamma->pst_gamma_lut[i] = i;
> + *	}
> + *
> + * @type: The parameters block type from :c:type:`c3_isp_params_block_type`
> + * @flags: A bitmask of block flags
> + * @size: Size (in bytes) of the parameters block, including this header
> + */
> +struct c3_isp_params_block_header {
> +	__u16 type;
> +	__u16 flags;
> +	__u32 size;
> +};
> +
> +/**
> + * struct c3_isp_params_awb_gains - Gains for auto-white balance
> + *
> + * This struct allows users to configure the gains for white balance. There
> + * are four gain settings corresponding to each colour channel in the bayer domain.

easy to reflow to 80 cols

> + * All of the gains are stored in Q4.8 format.
> + *
> + * header.type should be set to C3_ISP_PARAMS_BLOCK_AWB_GAINS
> + * from :c:type:`c3_isp_params_block_type`
> + *
> + * @header: The C3 ISP parameters block header
> + * @gr_gain: Multiplier for Gr channel (Q4.8 format)
> + * @r_gain: Multiplier for R channel (Q4.8 format)
> + * @b_gain: Multiplier for B channel (Q4.8 format)
> + * @gb_gain: Multiplier for Gb channel (Q4.8 format)
> + */
> +struct c3_isp_params_awb_gains {
> +	struct c3_isp_params_block_header header;
> +	__u16 gr_gain;
> +	__u16 r_gain;
> +	__u16 b_gain;
> +	__u16 gb_gain;
> +};
> +
> +/*

If you want this documented by kernel-doc use /**

> + * enum c3_isp_params_awb_tap_points - Tap points for the AWB statistics
> + * @C3_ISP_AWB_STATS_TAP_FE: immediately after the optical frontend block
> + * @C3_ISP_AWB_STATS_TAP_GE: immediately after the green equal block
> + * @C3_ISP_AWB_STATS_TAP_BEFORE_WB: immediately before the white balance block
> + * @C3_ISP_AWB_STATS_TAP_AFTER_WB: immediately after the white balance block
> + */
> +enum c3_isp_params_awb_tap_point {
> +	C3_ISP_AWB_STATS_TAP_OFE = 0,
> +	C3_ISP_AWB_STATS_TAP_GE,
> +	C3_ISP_AWB_STATS_TAP_BEFORE_WB,
> +	C3_ISP_AWB_STATS_TAP_AFTER_WB,
> +};
> +
> +/**
> + * struct c3_isp_params_awb_config - Stats settings for auto-white balance
> + *
> + * This struct allows the configuration of the statistics generated for auto
> + * white balance.
> + *
> + * header.type should be set to C3_ISP_PARAMS_BLOCK_AWB_CONFIG
> + * from :c:type:`c3_isp_params_block_type`
> + *
> + * @header: the C3 ISP parameters block header
> + * @tap_point: the tap point from enum c3_isp_params_awb_tap_point
> + * @satur_vald: AWB statistic over saturation control
> + *	        value: 0: disable, 1: enable
> + * @horiz_zones_num: active zones number of hotizontal [0..32]

active number of horizontal zones

> + * @vert_zones_num: active zones number of vertical [0..24]

ditto

> + * @rg_min: minimum R/G ratio (Q4.8 format)
> + * @rg_max: maximum R/G ratio (Q4.8 format)
> + * @bg_min: minimum B/G ratio (Q4.8 format)
> + * @bg_max: maximum B/G ratio (Q4.8 format)
> + * @rg_low: R/G ratio trim low (Q4.8 format)
> + * @rg_high: R/G ratio trim hight (Q4.8 format)
> + * @bg_low: B/G ratio trim low (Q4.8 format)
> + * @bg_high: B/G ratio trim high (Q4.8 format)
> + * @zone_weight: array of weights for AWB statistics zones [0..15]
> + * @horiz_cood: the horizontal coordinate of point on the diagonal [0..2888]
> + * @vert_cood: the vertical coordinate of point on the diagonal [0..2240]
> + */
> +struct c3_isp_params_awb_config {
> +	struct c3_isp_params_block_header header;
> +	__u8 tap_point;
> +	__u8 satur_vald;
> +	__u8 horiz_zones_num;
> +	__u8 vert_zones_num;
> +	__u16 rg_min;
> +	__u16 rg_max;
> +	__u16 bg_min;
> +	__u16 bg_max;
> +	__u16 rg_low;
> +	__u16 rg_high;
> +	__u16 bg_low;
> +	__u16 bg_high;
> +	__u8 zone_weight[C3_ISP_AWB_MAX_ZONES];
> +	__u16 horiz_cood[C3_ISP_AWB_MAX_PT_NUM];
> +	__u16 vert_cood[C3_ISP_AWB_MAX_PT_NUM];
> +};
> +
> +/*

ditto, use /** if you want this documented

> + * enum c3_isp_params_ae_tap_points - Tap points for the AE statistics
> + * @C3_ISP_AE_STATS_TAP_GE: immediately after the green equal block
> + * @C3_ISP_AE_STATS_TAP_MLS: immediately after the mesh lens shading block
> + */
> +enum c3_isp_params_ae_tap_point {
> +	C3_ISP_AE_STATS_TAP_GE = 0,
> +	C3_ISP_AE_STATS_TAP_MLS,
> +};
> +
> +/**
> + * struct c3_isp_params_ae_config - Stats settings for auto-exposure
> + *
> + * This struct allows the configuration of the statistics generated for
> + * auto exposure.
> + *
> + * header.type should be set to C3_ISP_PARAMS_BLOCK_AE_CONFIG
> + * from :c:type:`c3_isp_params_block_type`
> + *
> + * @header: the C3 ISP parameters block header
> + * @horiz_zones_num: active zones number of hotizontal [0..17]

s/hotizontal/horizontal

same comment as per the AWB stats

> + * @vert_zones_num: active zones number of vertical [0..15]
> + * @tap_point: the tap point from enum c3_isp_params_ae_tap_point
> + * @zone_weight: array of weights for AE statistics zones [0..15]
> + * @horiz_cood: the horizontal coordinate of point on the diagonal [0..2888]
> + * @vert_cood: the vertical coordinate of point on the diagonal [0..2240]

I'm not sure how these fields are used, so I'm not sure if this should
be 'point' or 'points'

> + */
> +struct c3_isp_params_ae_config {
> +	struct c3_isp_params_block_header header;
> +	__u8 tap_point;
> +	__u8 horiz_zones_num;
> +	__u8 vert_zones_num;
> +	__u8 zone_weight[C3_ISP_AE_MAX_ZONES];
> +	__u16 horiz_cood[C3_ISP_AE_MAX_PT_NUM];
> +	__u16 vert_cood[C3_ISP_AE_MAX_PT_NUM];
> +};

When passed through pahole this gives me

	/* size: 340, cachelines: 6, members: 7 */
	/* padding: 2 */

Because the compile aligns to the larger members in the struct which
is a __u32.

so I think you should

        __u8 reserved[2];

at the end of the structure to avoid the compiler insert padding
bytes.

Generally, for uAPI it's a good idea to avoid implicit alignments and
holes, and possibly align to 8 bytes.

This is a new format, and it's extensible, so it's versioned, but I
would rather make sure all holes/fields are declared as reserved and
the driver requires to have them set to 0 by userspace.

Reason is, assume you add a field to this structure in a future kernel
revision: existing userspace compiled against an older header version
will set the fields to 0 and the driver can ignore them, newer
userspace can populate them and the driver can use them. Relying on
implicit padding means that if you have to extend this single
structure a new version of the extensible should be declared and the
driver prepared to handle both, while I do expect the extensible
format version to be updated only when a major change to the data
layout (or the header) is performed.

All in all I would:
1) Add __attribute__((aligned(8))); to all types
2) Check with paholes is there are holes or padding bytes and declare
them as reserved, documenting that those fields should be set to 0 by
userspace.

The discussion we had with Hans and Laurent to provide some background
https://lore.kernel.org/all/20240724085004.82694-1-jacopo.mondi@ideasonboard.com/T/#m5333e7b6ab4230bb32efa063ab6fd73a529fdc29
(I hope I got all points right).

For pahole, what I've done is simply

-------------------- main.c -------------------------------------
#include "c3-isp-config.h"

int main(int argc, char *argv[])
{
	struct c3_isp_params_awb_gains awb_gains;
	struct c3_isp_params_awb_config awb_config;
	struct c3_isp_params_ae_config ae_config;
	struct c3_isp_params_af_config af_config;
	struct c3_isp_params_pst_gamma gamm;
	struct c3_isp_params_ccm ccm;
	struct c3_isp_params_csc csc;
	struct c3_isp_params_blc blc;

	return 0;
}
-------------------- main.c -------------------------------------

$ gcc -g main.c
$ pahole ./a.out

> +
> +/*
> + * enum c3_isp_params_af_tap_points - Tap points for the AF statistics
> + * @C3_ISP_AF_STATS_TAP_SNR: immediately after the spatial noise reduce block
> + * @C3_ISP_AF_STATS_TAP_DMS: immediately after the demosaic block
> + */
> +enum c3_isp_params_af_tap_point {
> +	C3_ISP_AF_STATS_TAP_SNR = 0,
> +	C3_ISP_AF_STATS_TAP_DMS,
> +};
> +
> +/**
> + * struct c3_isp_params_af_config - Stats settings for auto-focus
> + *
> + * This struct allows the configuration of the statistics generated for
> + * auto focus.
> + *
> + * header.type should be set to C3_ISP_PARAMS_BLOCK_AF_CONFIG
> + * from :c:type:`c3_isp_params_block_type`
> + *
> + * @header: the C3 ISP parameters block header
> + * @tap_point: the tap point from enum c3_isp_params_af_tap_point
> + * @horiz_zones_num: active zones number of hotizontal [0..17]
> + * @vert_zones_num: active zones number of vertical [0..15]
> + * @horiz_cood: the horizontal coordinate of point on the diagonal [0..2888]
> + * @vert_cood: the vertical coordinate of point on the diagonal [0..2240]

same comments as above about 'point' or 'points'

> + */
> +struct c3_isp_params_af_config {
> +	struct c3_isp_params_block_header header;
> +	__u8 tap_point;
> +	__u8 horiz_zones_num;
> +	__u8 vert_zones_num;

Pahole points out an hole here

	/* XXX 1 byte hole, try to pack */

> +	__u16 horiz_cood[C3_ISP_AF_MAX_PT_NUM];

Because this should be aligned to 2 bytes boundary. Add a reserved
field in between.

> +	__u16 vert_cood[C3_ISP_AF_MAX_PT_NUM];
> +};
> +
> +/**
> + * struct c3_isp_params_pst_gamma - Post gamma configuration
> + *
> + * This struct allows the configuration of the look up table for
> + * post gamma. The gamma curve consists of 129 points, so need to
> + * set lut[129].
> + *
> + * header.type should be set to C3_ISP_PARAMS_BLOCK_PST_GAMMA
> + * from :c:type:`c3_isp_params_block_type`
> + *
> + * @header: the C3 ISP parameters block header
> + * @lut: look up table for P-Stitch gamma [0..1023]

lookup

> + */
> +struct c3_isp_params_pst_gamma {
> +	struct c3_isp_params_block_header header;
> +	__u16 lut[129];
> +};

Check padding

> +
> +/**
> + * struct c3_isp_params_ccm - ISP CCM configuration
> + *
> + * This struct allows the configuration of the matrix for
> + * color correction. The matrix consists of 3 x 3 points,
> + * so need to set matrix[3][3].
> + *
> + * header.type should be set to C3_ISP_PARAMS_BLOCK_CCM
> + * from :c:type:`c3_isp_params_block_type`
> + *
> + * @header: the C3 ISP parameters block header
> + * @matrix: a 3 x 3 matrix used for color correction,
> + *          the value of matrix[x][y] is orig_value x 256. [-4096..4095]
> + */
> +struct c3_isp_params_ccm {
> +	struct c3_isp_params_block_header header;
> +	__s16 matrix[3][3];

check padding here as well

> +};
> +
> +/**
> + * struct c3_isp_params_csc - ISP Color Space Conversion configuration
> + *
> + * This struct allows the configuration of the matrix for
> + * color space conversion. The matrix consists of 3 x 3 points,
> + * so need to set matrix[3][3].
> + *
> + * header.type should be set to C3_ISP_PARAMS_BLOCK_CSC
> + * from :c:type:`c3_isp_params_block_type`
> + *
> + * @header: the C3 ISP parameters block header
> + * @matrix: a 3x3 matrix used for the color space conversion,
> + *          the value of matrix[x][y] is orig_value x 256. [-4096..4095]
> + */
> +struct c3_isp_params_csc {
> +	struct c3_isp_params_block_header header;
> +	__s16 matrix[3][3];
> +};

Check padding here as well

> +
> +/**
> + * struct c3_isp_params_blc - ISP Black Level Correction configuration
> + *
> + * This struct allows the configuration of the block level offset
> + * for each color channel.
> + *
> + * header.type should be set to C3_ISP_PARAMS_BLOCK_BLC
> + * from :c:type:`c3_isp_params_block_type`
> + *
> + * @header: the C3 ISP parameters block header
> + * @gr_ofst: Gr blc offset (Q4.8 format)
> + * @r_ofst: R blc offset (Q4.8 format)
> + * @b_ofst: B blc offset (Q4.8 format)
> + * @gb_ofst: Gb blc offset(Q4.8 format)
> + */
> +struct c3_isp_params_blc {
> +	struct c3_isp_params_block_header header;
> +	__u16 gr_ofst;
> +	__u16 r_ofst;
> +	__u16 b_ofst;
> +	__u16 gb_ofst;
> +};
> +
> +/**
> + * define C3_ISP_PARAMS_MAX_SIZE - Maximum size of all C3 ISP Parameters
> + *
> + * Though the parameters for the C3 ISP are passed as optional blocks, the
> + * driver still needs to know the absolute maximum size so that it can allocate
> + * a buffer sized appropriately to accommodate userspace attempting to set all
> + * possible parameters in a single frame.
> + */
> +#define C3_ISP_PARAMS_MAX_SIZE                           \
> +	(sizeof(struct c3_isp_params_awb_gains) +        \
> +	sizeof(struct c3_isp_params_awb_config) +        \
> +	sizeof(struct c3_isp_params_ae_config) +         \
> +	sizeof(struct c3_isp_params_af_config) +         \
> +	sizeof(struct c3_isp_params_pst_gamma) +         \
> +	sizeof(struct c3_isp_params_ccm) +               \
> +	sizeof(struct c3_isp_params_csc) +               \
> +	sizeof(struct c3_isp_params_blc))
> +
> +/**
> + * struct c3_isp_params_cfg - C3 ISP configuration parameters
> + *
> + * This struct contains the configuration parameters of the C3 ISP
> + * algorithms, serialized by userspace into an opaque data buffer. Each
> + * configuration parameter block is represented by a block-specific structure
> + * which contains a :c:type:`c3_isp_param_block_header` entry as first
> + * member. Userspace populates the @data buffer with configuration parameters
> + * for the blocks that it intends to configure. As a consequence, the data
> + * buffer effective size changes according to the number of ISP blocks that
> + * userspace intends to configure.
> + *
> + * The parameters buffer is versioned by the @version field to allow modifying
> + * and extending its definition. Userspace should populate the @version field to
> + * inform the driver about the version it intends to use. The driver will parse
> + * and handle the @data buffer according to the data layout specific to the
> + * indicated revision and return an error if the desired revision is not
> + * supported.
> + *
> + * For each ISP block that userspace wants to configure, a block-specific
> + * structure is appended to the @data buffer, one after the other without gaps
> + * in between nor overlaps. Userspace shall populate the @total_size field with
> + * the effective size, in bytes, of the @data buffer.
> + *
> + * The expected memory layout of the parameters buffer is::
> + *
> + *	+-------------------- struct c3_isp_params_cfg ---- ------------------+
> + *	| version = C3_ISP_PARAM_BUFFER_V0;                                   |
> + *	| data_size = sizeof(struct c3_isp_params_awb_gains) +                |
> + *	|              sizeof(struct c3_isp_params_awb_config);       |
> + *	| +------------------------- data  ---------------------------------+ |
> + *	| | +------------ struct c3_isp_params_awb_gains) ------------------+ |
> + *	| | | +---------  struct c3_isp_params_block_header header -----+ | | |
> + *	| | | | type = C3_ISP_PARAMS_BLOCK_AWB_GAINS;                   | | | |
> + *	| | | | flags = C3_ISP_PARAMS_BLOCK_FL_NONE;                    | | | |
> + *	| | | | size = sizeof(struct c3_isp_params_awb_gains);          | | | |
> + *	| | | +---------------------------------------------------------+ | | |
> + *	| | | gr_gain = ...;                                              | | |
> + *	| | | r_gain = ...;                                               | | |
> + *	| | | b_gain = ...;                                               | | |
> + *	| | | gb_gain = ...;                                              | | |
> + *	| | +------------------ struct c3_isp_params_awb_config ----------+ | |
> + *	| | | +---------- struct c3_isp_param_block_header header ------+ | | |
> + *	| | | | type = C3_ISP_PARAMS_BLOCK_AWB_CONFIG;                  | | | |
> + *	| | | | flags = C3_ISP_PARAMS_BLOCK_FL_NONE;                    | | | |
> + *	| | | | size = sizeof(struct c3_isp_params_awb_config)          | | | |
> + *	| | | +---------------------------------------------------------+ | | |
> + *	| | | tap_point = ...;                                            | | |
> + *	| | | satur_vald = ...;                                           | | |
> + *	| | | horiz_zones_num = ...;                                      | | |
> + *	| | | vert_zones_num = ...;                                       | | |
> + *	| | +-------------------------------------------------------------+ | |
> + *	| +-----------------------------------------------------------------+ |
> + *	+---------------------------------------------------------------------+
> + *
> + * @version: The C3 ISP parameters buffer version
> + * @data_size: The C3 ISP configuration data effective size,
> + *		excluding this header

can be reflowed.

Thanks
  j

> + * @data: The C3 ISP configuration blocks data
> + */
> +struct c3_isp_params_cfg {
> +	__u8 version;
> +	__u32 data_size;
> +	__u8 data[C3_ISP_PARAMS_MAX_SIZE];
> +};
> +
> +#endif
>
> --
> 2.47.0
>
>
>

