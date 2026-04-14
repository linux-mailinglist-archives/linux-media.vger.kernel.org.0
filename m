Return-Path: <linux-media+bounces-58744-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8M8NMg9d3mn5CQAAu9opvQ
	(envelope-from <linux-media+bounces-58744-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:28:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FB33FBD49
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 17:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B5E0B3019C8E
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 15:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35343DA5DA;
	Tue, 14 Apr 2026 15:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DbhCAvs7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBF130C35E;
	Tue, 14 Apr 2026 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179114; cv=none; b=O3Zw6l+iJw5LOAJEczWZA0T5FNlRDstzcsEvtlBwfL14oDnVZCAHldGdPniQ1Eg5t+whdWquprf9jcrVi0nsZc67z4q7dhPKg3FUoFRz/Q2F1E7U9xXzn0so9fXM6MBT61RPRbhQkVU1rfoPT8vvVpo4t48Axi1cOhnDjC8plKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179114; c=relaxed/simple;
	bh=boJevWsbDghWyY8aGraYhqwGuXjph0s55ULoI5dUQKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZWW4saIJmYDe9LsuqmYX/auS2Qw52l4sE12ZmBa8GSMLIglwjOxsZpDKevkI21zOERuohqBYy3HvjYEolda+wmaIA3gVl48xGIjzLW3T8QOe/SeTIdy1VBmVOkbwCMoK5BQJf9sjbGiqDMnyEWlImJA1Z0U5ehC0Ir0WbeInew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DbhCAvs7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EBE8463C;
	Tue, 14 Apr 2026 17:03:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776179016;
	bh=boJevWsbDghWyY8aGraYhqwGuXjph0s55ULoI5dUQKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DbhCAvs79znCVUmR2NQaNDK3iTXpHy2ZHe/CVMNW8lppjfXJBL4ylm/5aGWzvZtQr
	 ZgBMWqjJZ+yDI8dwL6fGtbxQOytlJFAoJoAH9FROwm/eGIuQL9a7c9pi1rhxbFrRYr
	 fioyPn6/+RxUN5uspcfmilU7Td/ah+js71Uz/gKA=
Date: Tue, 14 Apr 2026 17:05:05 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v7 02/18] media: uapi: Add extensible param and stats
 blocks for RPPX1
Message-ID: <ad0F38XgZ5N_FQY7@zed>
References: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
 <20260410-rppx1-v7-2-43cfc6b44f1f@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260410-rppx1-v7-2-43cfc6b44f1f@ideasonboard.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58744-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ragnatech.se,glider.be,gmail.com,renesas.com,vger.kernel.org,ideasonboard.com,mailbox.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63FB33FBD49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jai

On Fri, Apr 10, 2026 at 02:35:37PM +0530, Jai Luthra wrote:
> Define the userspace API for the Dreamchip RPP-X1 ISP extensible
> parameters and statistics. The RPP-X1 is functionally similar to the
> RkISP1 already supported upstream, but operates at higher bit depths (up
> to 24-bit precision in many blocks) and exposes additional configuration
> options. This warrants a dedicated uAPI rather than reusing the RkISP1
> definitions.
>
> The parameter blocks follow the V4L2 extensible parameters framework
> using struct v4l2_isp_params_block_header, with each ISP functional
> block represented as a tagged configuration structure. The statistics
> buffer provides AWB, auto-exposure and histogram measurement results at
> native RPP-X1 precision.
>
> Not all functional blocks present on the RPP-X1 hardware are included
> yet, but the format is extensible and new blocks can be added without
> breaking existing userspace.

Let me continue the uAPI review

>
> Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> ---
>  include/uapi/linux/media/dreamchip/rppx1-config.h | 728 ++++++++++++++++++++++
>  1 file changed, 728 insertions(+)
>
> diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..b9083e6f32b15329333eb13491b50c0aea8d1a32
> --- /dev/null
> +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> @@ -0,0 +1,728 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +/*
> + * Dreamchip RPP-X1 ISP Driver - Userspace API
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + * Copyright (C) 2026 Ideas on Board Oy
> + * Copyright (C) 2026 Ragnatech AB
> + */
> +
> +#ifndef __UAPI_RPP_X1_CONFIG_H
> +#define __UAPI_RPP_X1_CONFIG_H
> +
> +#include <linux/types.h>
> +#include <linux/media/v4l2-isp.h>
> +
> +/*
> + * Defect Pixel Cluster Correction
> + */
> +#define RPPX1_DPCC_METHODS_MAX				3
> +
> +/* Linearization (Sensor De-gamma) */
> +#define RPPX1_LIN_SAMPLES_NUM				17
> +
> +/* Gamma Out */
> +#define RPPX1_GAMMA_OUT_MAX_SAMPLES			17
> +
> +/* Lens Shade Correction */
> +#define RPPX1_LSC_SECTORS_TBL_SIZE			8
> +#define RPPX1_LSC_SAMPLES_MAX				17
> +
> +/* Histogram */
> +#define RPPX1_HIST_BIN_N_MAX				32
> +
> +/* Exposure Measurement */
> +#define RPPX1_EXM_MEAN_MAX				25
> +
> +/* AWB Measurement */
> +#define RPPX1_AWB_MAX_GRID				1
> +
> +/* Color Correction Matrix */
> +#define RPPX1_CTK_COEFF_MAX				0x8000
> +#define RPPX1_CTK_OFFSET_MAX				0x800000
> +
> +/* Filter */
> +#define RPPX1_BDM_MAX_TH				0xffff
> +
> +/**
> + * enum rppx1_params_block_type - RPP-X1 extensible params block types
> + *
> + * @RPPX1_PARAMS_BLOCK_TYPE_BLS: Black Level Subtraction
> + * @RPPX1_PARAMS_BLOCK_TYPE_DPCC: Defect Pixel Cluster Correction
> + * @RPPX1_PARAMS_BLOCK_TYPE_LIN: Linearization (Sensor De-gamma)
> + * @RPPX1_PARAMS_BLOCK_TYPE_AWB_GAIN: Auto White Balance Gains
> + * @RPPX1_PARAMS_BLOCK_TYPE_FLT: ISP Filtering
> + * @RPPX1_PARAMS_BLOCK_TYPE_BDM: Bayer Demosaic
> + * @RPPX1_PARAMS_BLOCK_TYPE_CTK: Color Correction (Cross-Talk)
> + * @RPPX1_PARAMS_BLOCK_TYPE_GOC: Gamma Out Correction
> + * @RPPX1_PARAMS_BLOCK_TYPE_DPF: De-noise Pre-Filter
> + * @RPPX1_PARAMS_BLOCK_TYPE_DPF_STRENGTH: De-noise Pre-Filter Strength
> + * @RPPX1_PARAMS_BLOCK_TYPE_LSC: Lens Shading Correction
> + * @RPPX1_PARAMS_BLOCK_TYPE_AWB_MEAS: AWB Measurement Configuration
> + * @RPPX1_PARAMS_BLOCK_TYPE_HST_MEAS: Histogram Measurement Configuration
> + * @RPPX1_PARAMS_BLOCK_TYPE_AEC_MEAS: Auto Exposure Measurement Configuration
> + */
> +enum rppx1_params_block_type {
> +	RPPX1_PARAMS_BLOCK_TYPE_BLS,
> +	RPPX1_PARAMS_BLOCK_TYPE_DPCC,
> +	RPPX1_PARAMS_BLOCK_TYPE_LIN,
> +	RPPX1_PARAMS_BLOCK_TYPE_AWB_GAIN,
> +	RPPX1_PARAMS_BLOCK_TYPE_FLT,
> +	RPPX1_PARAMS_BLOCK_TYPE_BDM,
> +	RPPX1_PARAMS_BLOCK_TYPE_CTK,
> +	RPPX1_PARAMS_BLOCK_TYPE_GOC,
> +	RPPX1_PARAMS_BLOCK_TYPE_DPF,
> +	RPPX1_PARAMS_BLOCK_TYPE_DPF_STRENGTH,
> +	RPPX1_PARAMS_BLOCK_TYPE_LSC,
> +	RPPX1_PARAMS_BLOCK_TYPE_AWB_MEAS,
> +	RPPX1_PARAMS_BLOCK_TYPE_HST_MEAS,
> +	RPPX1_PARAMS_BLOCK_TYPE_AEC_MEAS,
> +};
> +
> +/**
> + * struct rppx1_window - Measurement window
> + *
> + * @h_offs: horizontal offset from the left of the frame in pixels
> + * @v_offs: vertical offset from the top of the frame in pixels
> + * @h_size: horizontal size of the window in pixels
> + * @v_size: vertical size of the window in pixels
> + */
> +struct rppx1_window {
> +	__u16 h_offs;
> +	__u16 v_offs;
> +	__u16 h_size;
> +	__u16 v_size;
> +};
> +
> +/**
> + * struct rppx1_bls_fixed_val - BLS fixed subtraction values
> + *
> + * Fixed black level values subtracted from sensor data per Bayer channel.
> + * Negative values result in addition. Each value is a 24-bit + sign
> + * (25-bit signed) fixed-point number stored in a __s32.
> + *
> + * RPP-X1 supports 12/20/24-bit + sign depending on hardware version.
> + * Userspace should provide values at full 24-bit precision; the driver
> + * truncates to match the hardware.
> + *
> + * @r: subtraction value for Bayer pattern R
> + * @gr: subtraction value for Bayer pattern Gr
> + * @gb: subtraction value for Bayer pattern Gb
> + * @b: subtraction value for Bayer pattern B
> + */
> +struct rppx1_bls_fixed_val {
> +	__s32 r;
> +	__s32 gr;
> +	__s32 gb;
> +	__s32 b;
> +};
> +
> +/**
> + * struct rppx1_params_bls_config - Black Level Subtraction configuration
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_BLS)
> + * @enable_auto: 1 = use measured values, 0 = use fixed_val
> + * @en_windows: enabled measurement windows bitmask
> + * @bls_window1: measurement window 1
> + * @bls_window2: measurement window 2
> + * @bls_samples: log2 of the number of measured pixels per Bayer position
> + * @fixed_val: fixed subtraction values (24-bit + sign)
> + */
> +struct rppx1_params_bls_config {
> +	struct v4l2_isp_params_block_header header;
> +	__u8 enable_auto;
> +	__u8 en_windows;
> +	struct rppx1_window bls_window1;
> +	struct rppx1_window bls_window2;
> +	__u8 bls_samples;
> +	struct rppx1_bls_fixed_val fixed_val;
> +};
> +
> +/**
> + * struct rppx1_dpcc_methods_config - DPCC methods set configuration
> + *
> + * This structure stores the configuration of one set of methods for the DPCC
> + * algorithm. Multiple methods can be selected in each set (independently for
> + * the Green and Red/Blue components) through the @method field, the result is
> + * the logical AND of all enabled methods. The remaining fields set thresholds
> + * and factors for each method.
> + *
> + * @method: method enable bits (RPPX1_DPCC_METHODS_SET_*)
> + * @line_thresh: line threshold (RPPX1_DPCC_LINE_THRESH_*)
> + * @line_mad_fac: line MAD factor (RPPX1_DPCC_LINE_MAD_FAC_*)
> + * @pg_fac: peak gradient factor (RPPX1_DPCC_PG_FAC_*)
> + * @rnd_thresh: rank neighbor difference threshold (RPPX1_DPCC_RND_THRESH_*)
> + * @rg_fac: rank gradient factor (RPPX1_DPCC_RG_FAC_*)
> + */
> +struct rppx1_dpcc_methods_config {
> +	__u32 method;
> +	__u32 line_thresh;
> +	__u32 line_mad_fac;
> +	__u32 pg_fac;
> +	__u32 rnd_thresh;
> +	__u32 rg_fac;
> +};
> +
> +/**
> + * struct rppx1_params_dpcc_config - Defect Pixel Cluster Correction configuration
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_DPCC)
> + * @mode: DPCC mode (RPPX1_DPCC_MODE_*)
> + * @output_mode: interpolation output mode (RPPX1_DPCC_OUTPUT_MODE_*)
> + * @set_use: methods sets selection (RPPX1_DPCC_SET_USE_*)
> + * @methods: methods sets configuration
> + * @ro_limits: rank order limits (RPPX1_DPCC_RO_LIMITS_*)
> + * @rnd_offs: differential rank offsets (RPPX1_DPCC_RND_OFFS_*)
> + */
> +struct rppx1_params_dpcc_config {
> +	struct v4l2_isp_params_block_header header;
> +	__u32 mode;
> +	__u32 output_mode;
> +	__u32 set_use;
> +	struct rppx1_dpcc_methods_config methods[RPPX1_DPCC_METHODS_MAX];
> +	__u32 ro_limits;
> +	__u32 rnd_offs;
> +};
> +
> +/**
> + * struct rppx1_lin_curve - Linearization curve for one color channel
> + *
> + * The RPP-X1 linearization module supports 12/20/24-bit precision depending
> + * on hardware version. Values are provided at 24-bit precision; the driver
> + * truncates to the hardware capability.
> + *
> + * @gamma_y: curve y-axis values, each up to 24 bits
> + */
> +struct rppx1_lin_curve {
> +	__u32 gamma_y[RPPX1_LIN_SAMPLES_NUM];
> +};
> +
> +/**
> + * struct rppx1_lin_curve_dx - Linearization curve x-axis (sampling points)
> + * increments.
> + *
> + * gamma_dx[0] is for the lower samples, so Bits 0:3 for sample 1, ... Bits
> + * 28:31 for sample 8
> + * gamma_dx[1] is for the higher samples, so Bits 0:3 for sample 9, ... Bits
> + * 28:31 for sample 16
> + *
> + * The reset values for both fields is 0xcccccccc. This means that each sample
> + * is 12 units away from the previous one on the x-axis.
> + *
> + * @gamma_dx: curve x-axis increments in 4-bit precision
> + */
> +struct rppx1_lin_curve_dx {
> +	__u32 gamma_dx[2];
> +};
> +
> +/**
> + * struct rppx1_params_lin_config - Linearization (Sensor De-gamma) configuration
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_LIN)
> + * @curve_r: linearization curve for red channel
> + * @curve_g: linearization curve for green channel
> + * @curve_b: linearization curve for blue channel
> + * @xa_pnts: x axis increment definitions
> + */
> +struct rppx1_params_lin_config {
> +	struct v4l2_isp_params_block_header header;
> +	struct rppx1_lin_curve curve_r;
> +	struct rppx1_lin_curve curve_g;
> +	struct rppx1_lin_curve curve_b;
> +	struct rppx1_lin_curve_dx xa_pnts;
> +};
> +
> +/**
> + * struct rppx1_params_lsc_config - Lens Shading Correction configuration
> + *

A little more details maybe

The correction factor are expressed as a grid of 16x16 segments that are
mapped on the image. The size of each segment is expressed by the
@x_size_tbl and @y_size_tbl arrays.

The correction factors are expressed per-color channel in the
@r_data_tbl, @gr_data_tbl, @gb_data_tbl and @b_data_tbl fields in
Q2.10 format ranging from 1 to 3.999.

Pre-calculated multiplication factors shall be provided in the
@x_grad_tbl and @y_grad_tbl fields. Gradients are expressed as 12 bits
integer values.

> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_LSC)
> + * @r_data_tbl: sample table red

I would drop _tbl and use

      @r_data: Correction factors for the red channel in Q2.10 format

> + * @gr_data_tbl: sample table green (red)
> + * @gb_data_tbl: sample table green (blue)
> + * @b_data_tbl: sample table blue

Same for these

> + * @x_grad_tbl: gradient table x

I would drop _tbl and use

      @x_grad: Interpolation gradients for each horizontal sector

> + * @y_grad_tbl: gradient table y

      @y_grad: Interpolation gradients for each vertical sector

> + * @x_size_tbl: size table x

      @x_sect_size: Horizontal sectors sizes

> + * @y_size_tbl: size table y

      @y_sect_size: Vertical sectors sizes

> + * @config_width: reserved
> + * @config_height: reserved

What for ?

> + */
> +struct rppx1_params_lsc_config {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 r_data_tbl[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
> +	__u16 gr_data_tbl[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
> +	__u16 gb_data_tbl[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
> +	__u16 b_data_tbl[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
> +	__u16 x_grad_tbl[RPPX1_LSC_SECTORS_TBL_SIZE];
> +	__u16 y_grad_tbl[RPPX1_LSC_SECTORS_TBL_SIZE];
> +	__u16 x_size_tbl[RPPX1_LSC_SECTORS_TBL_SIZE];
> +	__u16 y_size_tbl[RPPX1_LSC_SECTORS_TBL_SIZE];

Both sectors and gradients are 16 and not 8.
I would name RPPX1_LSC_SECTORS_TBL_SIZE as RPPX1_LSC_NUM_SECTORS

> +	__u16 config_width;
> +	__u16 config_height;

Drop these if not used

> +};
> +
> +/**
> + * struct rppx1_params_awb_gain_config  - AWB gain configuration
> + *
> + * RPP-X1 AWB gains are 18-bit with 12-bit fractional part (0x1000 = 1.0),

The White Balance (WB) module allows to specify per-color channel
gains  WB gains are expressed as unsigned fixed-point values in
Q6.12 format with a maximum of 63.999.

> + * giving a range of 0.0 to 64.0.
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_AWB_GAIN)
> + * @gain_red: gain for red component, 18-bit (Q6.12)
> + * @gain_green_r: gain for green-in-red component, 18-bit (Q6.12)
> + * @gain_blue: gain for blue component, 18-bit (Q6.12)
> + * @gain_green_b: gain for green-in-blue component, 18-bit (Q6.12)
> + */
> +struct rppx1_params_awb_gain_config {
> +	struct v4l2_isp_params_block_header header;
> +	__u32 gain_red;
> +	__u32 gain_green_r;
> +	__u32 gain_blue;
> +	__u32 gain_green_b;
> +};
> +
> +/**
> + * struct rppx1_params_flt_config - Filter (demosaic/denoise) configuration

The filter/sharpening block seems to be embedded in the Debayer block.
I don't think we have exercised this one enough to be confident we
have a suitable userspace implementation yet.

Can maybe post-pone this one ?

> + *
> + * RPP-X1 thresholds are 18-bit and factors are 8-bit.
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_FLT)
> + * @mode: filter mode
> + * @grn_stage1: green filter stage 1 select (range 0x0...0x8)
> + * @chr_h_mode: chroma filter horizontal mode
> + * @chr_v_mode: chroma filter vertical mode
> + * @thresh_bl0: If thresh_bl1 < sum_grad < thresh_bl0 then fac_bl0 is selected (blurring th)
> + * @thresh_bl1: If sum_grad < thresh_bl1 then fac_bl1 is selected (blurring th)
> + * @thresh_sh0: If thresh_sh0 < sum_grad < thresh_sh1 then thresh_sh0 is selected (sharpening th)
> + * @thresh_sh1: If thresh_sh1 < sum_grad then thresh_sh1 is selected (sharpening th)
> + * @lum_weight: luminance weight, min (bits 0:11), kink (bits 12:23), gain (bits 28:30)
> + * @fac_sh1: filter factor for sharp1 level
> + * @fac_sh0: filter factor for sharp0 level
> + * @fac_mid: filter factor for mid level and for static filter mode
> + * @fac_bl0: filter factor for blur0 level
> + * @fac_bl1: filter factor for blur1 level (max blur)
> + */
> +struct rppx1_params_flt_config {
> +	struct v4l2_isp_params_block_header header;
> +	__u32 mode;
> +	__u8 grn_stage1;
> +	__u8 chr_h_mode;
> +	__u8 chr_v_mode;
> +	__u32 thresh_bl0;
> +	__u32 thresh_bl1;
> +	__u32 thresh_sh0;
> +	__u32 thresh_sh1;
> +	__u32 lum_weight;
> +	__u32 fac_sh1;
> +	__u32 fac_sh0;
> +	__u32 fac_mid;
> +	__u32 fac_bl0;
> +	__u32 fac_bl1;
> +};
> +
> +/**
> + * struct rppx1_params_bdm_config - Bayer Demosaic configuration
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_BDM)
> + * @demosaic_th: threshold for texture detection, 16-bit
> + */
> +struct rppx1_params_bdm_config {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 demosaic_th;
> +};

We don't have an algo in libcamera, right ? This seems simple, but
until it's not exercised by userspace I would defer introducing it.

> +
> +/**
> + * struct rppx1_params_ctk_config - Color Correction (Cross-Talk) configuration

The module seems to be called CCOR (Color CORrection)

I would use that term

> + *
> + * RPP-X1 coefficients are 16-bit signed fixed-point (Q4.12).
> + * Range: -8.0 (0x8000) to +7.9996 (0x7FFF), 1.0 = 0x1000.

The CCOR (Color Correction) module performs color space conversion
on a pixel-per-pixel basis using a 3x3 matrix of coefficients
and per-color channel offsets.

The matrix coefficients are represented as signed fixed point values
in Q4.12 format ranging from -8 to +7.999.

The per-channel color offsets are represented as 2's complement values
stored in 25 bits ranging from -16777216 to 16777215.

> + *
> + * RPP-X1 offsets are up to 24-bit + sign depending on hardware version.

For RPP-X1 the value seems to be fixed to 24 bits.

We might want to report the ccor_version register value in stats if
this changes for other ISP model. However I would leave it out for the
time being, assume 24 and if we need to support a different register
size introduce ccor_version in stats and add a comment here. We won't
need to change the block definition.

> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_CTK)
> + * @coeff: 3x3 color correction matrix, Q4.12 signed
> + * @ct_offset: R, G, B offsets, up to 25-bit signed
> + */
> +struct rppx1_params_ctk_config {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 coeff[3][3];
> +	__u32 ct_offset[3];

Or simply 'offset'

> +};
> +
> +/**
> + * struct rppx1_params_goc_config - Gamma Out Correction configuration

mmm, I would have used 'gamma', as that's what the manual use. But
registers are named GAMMA_OUT so I would be fine with goc if that's
preferred

> + *
> + * RPP-X1 gamma output values are up to 24-bit depending on hardware version.

The module allows to apply a Gamma correction curve to RGB data
represented with a table of 16 entries @gamma_y. The 16 input sample
points can be equidistant or segmented using a logarithmic scale
according to the value of @mode.

> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_GOC)
> + * @mode: gamma curve mode (0 = logarithmic, 1 = equidistant)

Please define an enum and refer to it here

/**
 * enum rppx1_params_goc_mode - GOC curve segmentation mode
 * @RPPX1_PARAMS_GOC_MODE_LOGARITHMIC: Logarithmic segmentation mode (default)
 * @RPPX1_PARAMS_GOC_MODE_EQUIDISTANT: Equidistant segmentation mode
 */
enum rppx1_params_goc_mode {
        RPPX1_PARAMS_GOC_MODE_LOGARITHMIC,
        RPPX1_PARAMS_GOC_MODE_EQUIDISTANT
};

> + * @gamma_y: gamma out curve y-axis values, up to 24-bit
> + */
> +struct rppx1_params_goc_config {
> +	struct v4l2_isp_params_block_header header;
> +	__u32 mode;
> +	__u32 gamma_y[RPPX1_GAMMA_OUT_MAX_SAMPLES];
> +};
> +
> +/**
> + * enum rppx1_dpf_gain_usage - DPF noise function gain usage mode
> + * @RPPX1_DPF_GAIN_USAGE_DISABLED: gain not used
> + * @RPPX1_DPF_GAIN_USAGE_NF_GAINS: use noise function gains
> + * @RPPX1_DPF_GAIN_USAGE_LSC_GAINS: use LSC gains
> + * @RPPX1_DPF_GAIN_USAGE_NF_LSC_GAINS: use noise function and LSC gains
> + * @RPPX1_DPF_GAIN_USAGE_AWB_GAINS: use AWB gains
> + * @RPPX1_DPF_GAIN_USAGE_AWB_LSC_GAINS: use AWB and LSC gains
> + */
> +enum rppx1_dpf_gain_usage {
> +	RPPX1_DPF_GAIN_USAGE_DISABLED,
> +	RPPX1_DPF_GAIN_USAGE_NF_GAINS,
> +	RPPX1_DPF_GAIN_USAGE_LSC_GAINS,
> +	RPPX1_DPF_GAIN_USAGE_NF_LSC_GAINS,
> +	RPPX1_DPF_GAIN_USAGE_AWB_GAINS,
> +	RPPX1_DPF_GAIN_USAGE_AWB_LSC_GAINS,
> +};
> +
> +/**
> + * enum rppx1_nll_scale_mode - DPF noise level lookup scale mode
> + * @RPPX1_NLL_SCALE_LINEAR: linear scaling
> + * @RPPX1_NLL_SCALE_LOGARITHMIC: logarithmic scaling
> + */
> +enum rppx1_nll_scale_mode {
> +	RPPX1_NLL_SCALE_LINEAR,
> +	RPPX1_NLL_SCALE_LOGARITHMIC,
> +};
> +
> +/**
> + * enum rppx1_dpf_rb_filtersize - DPF red/blue filter kernel size
> + * @RPPX1_DPF_RB_FILTERSIZE_13x9: 13x9 filter size
> + * @RPPX1_DPF_RB_FILTERSIZE_9x9: 9x9 filter size
> + */
> +enum rppx1_dpf_rb_filtersize {
> +	RPPX1_DPF_RB_FILTERSIZE_13x9,
> +	RPPX1_DPF_RB_FILTERSIZE_9x9,
> +};
> +
> +/**
> + * struct rppx1_dpf_gain - DPF noise function gain configuration
> + *
> + * @mode: gain usage mode
> + * @nf_r_gain: noise function gain replacing AWB gain for red
> + * @nf_b_gain: noise function gain replacing AWB gain for blue
> + * @nf_gr_gain: noise function gain replacing AWB gain for green-in-red
> + * @nf_gb_gain: noise function gain replacing AWB gain for green-in-blue
> + */
> +struct rppx1_dpf_gain {
> +	__u32 mode;
> +	__u16 nf_r_gain;
> +	__u16 nf_b_gain;
> +	__u16 nf_gr_gain;
> +	__u16 nf_gb_gain;
> +};
> +
> +#define RPPX1_DPF_MAX_NLF_COEFFS			17
> +#define RPPX1_DPF_MAX_SPATIAL_COEFFS			6
> +
> +/**
> + * struct rppx1_dpf_nll - DPF noise level lookup
> + *
> + * @coeff: noise level lookup coefficients
> + * @scale_mode: 0 = linear, 1 = logarithmic
> + */
> +struct rppx1_dpf_nll {
> +	__u16 coeff[RPPX1_DPF_MAX_NLF_COEFFS];
> +	__u32 scale_mode;
> +};
> +
> +/**
> + * struct rppx1_dpf_rb_flt - DPF red/blue filter configuration
> + *
> + * @fltsize: filter kernel size (0 = 13x9, 1 = 9x9)
> + * @spatial_coeff: spatial weight coefficients
> + * @r_enable: enable filter for red pixels
> + * @b_enable: enable filter for blue pixels
> + */
> +struct rppx1_dpf_rb_flt {
> +	__u32 fltsize;
> +	__u8 spatial_coeff[RPPX1_DPF_MAX_SPATIAL_COEFFS];
> +	__u8 r_enable;
> +	__u8 b_enable;
> +};
> +
> +/**
> + * struct rppx1_dpf_g_flt - DPF green filter configuration
> + *
> + * @spatial_coeff: spatial weight coefficients
> + * @gr_enable: enable filter for green-in-red pixels
> + * @gb_enable: enable filter for green-in-blue pixels
> + */
> +struct rppx1_dpf_g_flt {
> +	__u8 spatial_coeff[RPPX1_DPF_MAX_SPATIAL_COEFFS];
> +	__u8 gr_enable;
> +	__u8 gb_enable;
> +};
> +
> +/**
> + * struct rppx1_params_dpf_config - De-noising Pre-Filter configuration
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_DPF)
> + * @gain: noise function gain
> + * @g_flt: green filter configuration
> + * @rb_flt: red/blue filter configuration
> + * @nll: noise level lookup
> + */
> +struct rppx1_params_dpf_config {
> +	struct v4l2_isp_params_block_header header;
> +	struct rppx1_dpf_gain gain;
> +	struct rppx1_dpf_g_flt g_flt;
> +	struct rppx1_dpf_rb_flt rb_flt;
> +	struct rppx1_dpf_nll nll;
> +};
> +
> +/**
> + * struct rppx1_params_dpf_strength_config - DPF strength configuration
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_DPF_STRENGTH)
> + * @r: filter strength for RED
> + * @g: filter strength for GREEN
> + * @b: filter strength for BLUE
> + */
> +struct rppx1_params_dpf_strength_config {
> +	struct v4l2_isp_params_block_header header;
> +	__u8 r;
> +	__u8 g;
> +	__u8 b;
> +};

This seems to be named "Bilateral Denoise".

Same reasoning goes as per the filter module.

We have an algorithm in libcamera for RkISP1 but it has been under
heavy rework and I wouldn't consider it final or even very well
tested.

The whole denoising part need more work and I think we can we maybe
post-pone DPF for RPP-X1 ?

The risk is to define blocks we'll have to re-define later on.

> +
> +/**
> + * enum rppx1_awb_mode_type - AWB measurement mode
> + * @RPPX1_AWB_MODE_MANUAL: manual white balance

I can't find any reference to Manual mode.

I see
1: RGB measurement
0: YcbCr

> + * @RPPX1_AWB_MODE_RGB: RGB measurement mode
> + * @RPPX1_AWB_MODE_YCBCR: YCbCr measurement mode
> + */
> +enum rppx1_awb_mode_type {

Maybe let's use AWB_MEAS as a prefix

> +	RPPX1_AWB_MODE_MANUAL,

Both for the type and the fields

> +	RPPX1_AWB_MODE_RGB,
> +	RPPX1_AWB_MODE_YCBCR,
> +};
> +
> +/**
> + * struct rppx1_params_awb_meas_config - AWB measurement configuration
> + *

    * The auto-white balance measurement module supports two
    * measurement modes, selected by the @awb_mode field.
    * The measurement window is programmed through the @awb_wnd field.
    *
    * To support measurement in YCbCr a color conversion matrix with
    * programmable offset is available is available in the
    * @ccor_coeff and @ccor_offs fields.
    */


> + * RPP-X1 min_y, max_y, min_c, max_csum, awb_ref_cr, awb_ref_cb are up to
> + * 24-bit depending on hardware version (8/20/24-bit).

As for the other similar cases, I think for RPP-X1 we can assume 24
bits. If another version appears with a different bitwidth, we should
report `awb_meas_version` through stats and add a comment here about
the expected fields width.

> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_AWB_MEAS)
> + * @awb_wnd: measurement window
> + * @awb_mode: measurement mode (from enum rppx1_awb_mode_type)

Missing 'awb_max_en' with the associated enum

/**
 * enum rppx1_awb_max_en - Enable max luminance threshold
 *
 * Luminance max threshold enable. Only pixels with a luminance value
 * lower than @max_y are considered. Only valid in YCbCr measurement mode.
 *
 * @RPPX1_AWB_MEAS_Y_MAX_DISABLE: Disable luminance threshold
 * @RPPX1_AWB_MEAS_Y_MAX_ENABLE: Enable luminance threshold
 */
enum rppx1_awb_max_en {
        RPPX1_AWB_MEAS_Y_MAX_DISABLE,
         RPPX1_AWB_MEAS_Y_MAX_ENABLE
};

> + * @max_y: upper pixel value limit, up to 24-bit

This is worth a longer explanation.

      @max_y: luminance maximum value. Only pixels with luminance
              value below this threshold are considered. Only valid if
              @awb_mode is set to YCbCr and @awb_max_en is set to
              enable.

> + * @min_y: lower pixel value limit, up to 24-bit

      @min_y_max_g: luminance minimum value in YCbCr mode; maximum
      green value in RGB mode

> + * @max_csum: chrominance sum maximum, up to 24-bit

Missing:

      @enable_ymax_cmp: enable Y_MAX compare

> + * @min_c: chrominance minimum, up to 24-bit
> + * @frames: number of frames for mean value calculation (0 = 1 frame)

      (0 = 1 frame, ..., 7 = 8 frames)

> + * @awb_ref_cr: reference Cr for AWB regulation, up to 24-bit

      @ref_cr_max_r: reference Cr or maximum red pixels value

> + * @awb_ref_cb: reference Cb for AWB regulation, up to 24-bit

      @ref_cb_max_b: reference Cb or maximum blue pixels value

> + *

Missing
      @ccor_coeffs: Color conversion matrix coefficients. The
      coefficients have to be programmed according to the measurement
      mode in use.
      @ccor_offs: Color conversion matrix offsets.

As these two fields match the color conversion matrix, it might be
worth defining a type for it where to defer the description of the
coefficients and offset representations.

> + */
> +struct rppx1_params_awb_meas_config {
> +	struct v4l2_isp_params_block_header header;
> +	struct rppx1_window awb_wnd;
> +	__u32 awb_mode;
> +	__u32 max_y;
> +	__u32 min_y;
> +	__u32 max_csum;
> +	__u32 min_c;
> +	__u8 frames;
> +	__u32 awb_ref_cr;
> +	__u32 awb_ref_cb;
> +	__u8 enable_ymax_cmp;
> +};
> +
> +/**
> + * enum rppx1_histogram_mode - Histogram measurement mode
> + * @RPPX1_HISTOGRAM_MODE_DISABLE: histogram disabled
> + * @RPPX1_HISTOGRAM_MODE_RGB_COMBINED: combined RGB histogram
> + * @RPPX1_HISTOGRAM_MODE_R_HISTOGRAM: red channel histogram
> + * @RPPX1_HISTOGRAM_MODE_G_HISTOGRAM: green channel histogram
> + * @RPPX1_HISTOGRAM_MODE_B_HISTOGRAM: blue channel histogram
> + * @RPPX1_HISTOGRAM_MODE_Y_HISTOGRAM: luminance histogram
> + */
> +enum rppx1_histogram_mode {
> +	RPPX1_HISTOGRAM_MODE_DISABLE,
> +	RPPX1_HISTOGRAM_MODE_RGB_COMBINED,
> +	RPPX1_HISTOGRAM_MODE_R_HISTOGRAM,
> +	RPPX1_HISTOGRAM_MODE_G_HISTOGRAM,
> +	RPPX1_HISTOGRAM_MODE_B_HISTOGRAM,
> +	RPPX1_HISTOGRAM_MODE_Y_HISTOGRAM,
> +};
> +
> +#define RPPX1_HISTOGRAM_WEIGHT_GRIDS_SIZE		25

Missing the tap points definitions for HIST_CHANNEL_SEL

> +
> +/**
> + * struct rppx1_params_hst_config - Histogram measurement configuration
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_HST_MEAS)
> + * @mode: histogram mode (from enum rppx1_histogram_mode)

Missing:
      @tap_point


> + * @histogram_predivider: process every Nth pixel

I see a separate v_stepsize and h_step_inc for the subsampling

> + * @meas_window: measurement window coordinates
> + * @hist_weight: weighting factors for sub-windows (5x5 grid)

There also are three programmable coefficients, offsets and shifts

> + */
> +struct rppx1_params_hst_config {
> +	struct v4l2_isp_params_block_header header;
> +	__u32 mode;
> +	__u8 histogram_predivider;
> +	struct rppx1_window meas_window;
> +	__u8 hist_weight[RPPX1_HISTOGRAM_WEIGHT_GRIDS_SIZE];
> +};
> +
> +/**
> + * enum rppx1_exp_meas_mode - Exposure measurement mode
> + * @RPPX1_EXP_MEASURING_MODE_0: Y = 16 + 0.25R + 0.5G + 0.1094B
> + * @RPPX1_EXP_MEASURING_MODE_1: Y = (R + G + B) x (85/256)
> + */
> +enum rppx1_exp_meas_mode {
> +	RPPX1_EXP_MEASURING_MODE_0,
> +	RPPX1_EXP_MEASURING_MODE_1,

This doesn't match the definition of EXM_MODE I see:

	RPPX1_EXP_MEASURING_MODE_0 = Disabled
	RPPX1_EXP_MEASURING_MODE_1 = Y/R/G/B exposure measurement
	RPPX1_EXP_MEASURING_MODE_2 = RGB Bayer exposure measurement
> +};
> +

Missing TAP point definitions for EXM_CHANNEL_SEL

> +/**
> + * struct rppx1_params_aec_config - Auto Exposure measurement configuration
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_AEC_MEAS)
> + * @mode: exposure measure mode (from enum rppx1_exp_meas_mode)
> + * @autostop: 0 = continuous, 1 = stop after one frame

Seems not to be supported

> + * @meas_window: measurement window coordinates
> + */
> +struct rppx1_params_aec_config {
> +	struct v4l2_isp_params_block_header header;
> +	__u32 mode;
> +	__u32 autostop;

There also are coefficients

        /* Unsigned Q0.7 values ranging from 0 to 1.992 */
        struct {
                r;
                gr;
                b;
                gb;
        } coeffs;

> +	struct rppx1_window meas_window;
> +};
> +
> +/**
> + * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
> + */
> +#define RPPX1_PARAMS_MAX_SIZE						\
> +	(sizeof(struct rppx1_params_bls_config)			+	\
> +	sizeof(struct rppx1_params_dpcc_config)			+	\
> +	sizeof(struct rppx1_params_lin_config)			+	\
> +	sizeof(struct rppx1_params_awb_gain_config)		+	\
> +	sizeof(struct rppx1_params_flt_config)			+	\
> +	sizeof(struct rppx1_params_bdm_config)			+	\
> +	sizeof(struct rppx1_params_ctk_config)			+	\
> +	sizeof(struct rppx1_params_goc_config)			+	\
> +	sizeof(struct rppx1_params_dpf_config)			+	\
> +	sizeof(struct rppx1_params_dpf_strength_config)		+	\
> +	sizeof(struct rppx1_params_lsc_config)			+	\
> +	sizeof(struct rppx1_params_awb_meas_config)		+	\
> +	sizeof(struct rppx1_params_hst_config)			+	\
> +	sizeof(struct rppx1_params_aec_config))
> +
> +/* ---------------------------------------------------------------------------
> + * Statistics Structures
> + *
> + * Native RPP-X1 precision. Fields use __u32 where the hardware provides
> + * wider-than-8-bit results.
> + */
> +
> +/**
> + * struct rppx1_awb_meas - AWB measured values
> + *
> + * @cnt: white pixel count
> + * @mean_y_or_g: mean Y (or G in RGB mode), up to 24-bit
> + * @mean_cb_or_b: mean Cb (or B in RGB mode), up to 24-bit
> + * @mean_cr_or_r: mean Cr (or R in RGB mode), up to 24-bit
> + */
> +struct rppx1_awb_meas {
> +	__u32 cnt;
> +	__u32 mean_y_or_g;
> +	__u32 mean_cb_or_b;
> +	__u32 mean_cr_or_r;
> +};
> +
> +/**
> + * struct rppx1_awb_stat - AWB statistics
> + *
> + * @awb_mean: measured AWB data
> + */
> +struct rppx1_awb_stat {
> +	struct rppx1_awb_meas awb_mean[RPPX1_AWB_MAX_GRID];
> +};
> +
> +/**
> + * struct rppx1_bls_meas_val - BLS measured values
> + *
> + * RPP-X1 BLS statistics can be 8/20/24-bit depending on version.
> + *
> + * @meas_r: mean measured value for Bayer pattern R
> + * @meas_gr: mean measured value for Bayer pattern Gr
> + * @meas_gb: mean measured value for Bayer pattern Gb
> + * @meas_b: mean measured value for Bayer pattern B
> + */
> +struct rppx1_bls_meas_val {
> +	__u32 meas_r;
> +	__u32 meas_gr;
> +	__u32 meas_gb;
> +	__u32 meas_b;
> +};
> +
> +/**
> + * struct rppx1_ae_stat - Auto Exposure statistics
> + *
> + * RPP-X1 exposure mean values are up to 20-bit depending on version.
> + * The image is divided into a 5x5 grid (25 blocks).
> + *
> + * @exp_mean: mean luminance values per block, up to 20-bit
> + * @bls_val: BLS measured values
> + */
> +struct rppx1_ae_stat {
> +	__u32 exp_mean[RPPX1_EXM_MEAN_MAX];
> +	struct rppx1_bls_meas_val bls_val;
> +};
> +
> +/**
> + * struct rppx1_hist_stat - Histogram statistics
> + *
> + * @hist_bins: 32 histogram bin counters, each 20-bit unsigned fixed point
> + *	       (bits 0-4 fractional, bits 5-19 integer)
> + */
> +struct rppx1_hist_stat {
> +	__u32 hist_bins[RPPX1_HIST_BIN_N_MAX];
> +};
> +
> +/**
> + * struct rppx1_stat - RPP-X1 3A statistics
> + *
> + * @awb: auto white balance statistics
> + * @ae: auto exposure statistics
> + * @hist: histogram statistics
> + */
> +struct rppx1_stat {
> +	struct rppx1_awb_stat awb;
> +	struct rppx1_ae_stat ae;
> +	struct rppx1_hist_stat hist;
> +};
> +
> +/**
> + * RPPX1_STAT_AWB - AWB measurement data available
> + * RPPX1_STAT_AUTOEXP - Auto exposure measurement data available
> + *
Missing documentation of:

      RPPX1_STAT_HIST - Histogram measurement data available

> + */
> +#define RPPX1_STAT_AWB			(1U << 0)
> +#define RPPX1_STAT_AUTOEXP		(1U << 1)
> +#define RPPX1_STAT_HIST			(1U << 2)
> +
> +/**
> + * struct rppx1_stat_buffer - RPP-X1 statistics metadata buffer
> + *
> + * @meas_type: bitmask of available measurements (RPPX1_STAT_*)
> + * @frame_id: frame identifier for synchronization
> + * @params: statistics data
> + */
> +struct rppx1_stat_buffer {
> +	__u32 meas_type;
> +	__u32 frame_id;
> +	struct rppx1_stat params;

Maybe name it stats as well ?

Now that v2 of extensible stats is out, I would rebase this on top of
them

Thank you!
   j

> +};
> +
> +#endif /* __UAPI_RPP_X1_CONFIG_H */
>
> --
> 2.53.0
>
>

