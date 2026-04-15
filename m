Return-Path: <linux-media+bounces-58814-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFvxEHmB32mcUQAAu9opvQ
	(envelope-from <linux-media+bounces-58814-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 14:15:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C920404291
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 14:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 467F6302BEA2
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 12:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B518023ABB9;
	Wed, 15 Apr 2026 12:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aFJ9cM0q"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6A09460;
	Wed, 15 Apr 2026 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776255331; cv=none; b=UZv5NcQxPA5VBY0A0LRQFNT+wdKLob25JQQ5mTrt+gpCnNJPRdYs0FLudgBDyAN99Venbxzm7znrh3/4zxyC6afutgT9jCJ8E/EgGVEYjY5Mur1/r0ycKjFBHdduna/7UDghnO5zf0KBaa822r0o96gjxgvaw29YqLN9YBSBN98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776255331; c=relaxed/simple;
	bh=Gn65KyXCa3jvF7GfmkYYxx07Y11d9QXXeLBD1AqpwLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gfGp8kSc+S43ndmP/7NQZnfTNushpZKhdsuAhNIzdPV1vP6wEMvSRssH1QYsdjKURWpvdAJSTOx75raHoX+c+vBpBbp5+QDsqcT+No4gj3a8c08KjtXDSTAG5ZJP094yaYDBoY97tbSKhKp1JhbbB0h+6UhMUnDkYG8R0LhWfm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aFJ9cM0q; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69975A06;
	Wed, 15 Apr 2026 14:13:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776255227;
	bh=Gn65KyXCa3jvF7GfmkYYxx07Y11d9QXXeLBD1AqpwLs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aFJ9cM0qWE3ACZxXjCV2aRiG4D4PZTtoSvunO5mTHSXc+zMfS46ZPv8zf8DcTtxu3
	 vG6rorlL2utZVifPt31kdAO+CNY8gkJrrhUc0EU9M35rytH+njyI3bFbbnVCRgndN2
	 OBs2DDoWXFBZjrLIP3VVYuJz/1+sKBtZCl8CwwYA=
Date: Wed, 15 Apr 2026 14:15:17 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Marek Vasut <marek.vasut+renesas@mailbox.org>
Subject: Re: [PATCH v7 02/18] media: uapi: Add extensible param and stats
 blocks for RPPX1
Message-ID: <ad9dVya1U9bQ627t@zed>
References: <20260410-rppx1-v7-0-43cfc6b44f1f@ideasonboard.com>
 <20260410-rppx1-v7-2-43cfc6b44f1f@ideasonboard.com>
 <adkN3HLFanUYJs20@zed>
 <177623413873.489396.16433731405014713287@freya>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177623413873.489396.16433731405014713287@freya>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-58814-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,ragnatech.se,glider.be,gmail.com,renesas.com,vger.kernel.org,mailbox.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: 8C920404291
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jai

On Wed, Apr 15, 2026 at 11:52:18AM +0530, Jai Luthra wrote:
> Hi Jacopo
>
> Thanks for the review.
>
> Quoting Jacopo Mondi (2026-04-10 21:40:26)
> > Hi Jai
> >
> > On Fri, Apr 10, 2026 at 02:35:37PM +0530, Jai Luthra wrote:
> > > Define the userspace API for the Dreamchip RPP-X1 ISP extensible
> > > parameters and statistics. The RPP-X1 is functionally similar to the
> > > RkISP1 already supported upstream, but operates at higher bit depths (up
> > > to 24-bit precision in many blocks) and exposes additional configuration
> > > options. This warrants a dedicated uAPI rather than reusing the RkISP1
> > > definitions.
> > >
> > > The parameter blocks follow the V4L2 extensible parameters framework
> > > using struct v4l2_isp_params_block_header, with each ISP functional
> > > block represented as a tagged configuration structure. The statistics
> > > buffer provides AWB, auto-exposure and histogram measurement results at
> > > native RPP-X1 precision.
> > >
> > > Not all functional blocks present on the RPP-X1 hardware are included
> > > yet, but the format is extensible and new blocks can be added without
> > > breaking existing userspace.
> > >
> > > Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > > ---
> > >  include/uapi/linux/media/dreamchip/rppx1-config.h | 728 ++++++++++++++++++++++
> > >  1 file changed, 728 insertions(+)
> > >
> > > diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..b9083e6f32b15329333eb13491b50c0aea8d1a32
> > > --- /dev/null
> > > +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > > @@ -0,0 +1,728 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > > +/*
> > > + * Dreamchip RPP-X1 ISP Driver - Userspace API
> > > + *
> > > + * Copyright (C) 2026 Renesas Electronics Corp.
> > > + * Copyright (C) 2026 Ideas on Board Oy
> > > + * Copyright (C) 2026 Ragnatech AB
> > > + */
> > > +
> > > +#ifndef __UAPI_RPP_X1_CONFIG_H
> > > +#define __UAPI_RPP_X1_CONFIG_H
> > > +
> > > +#include <linux/types.h>
> > > +#include <linux/media/v4l2-isp.h>
> > > +
> > > +/*
> > > + * Defect Pixel Cluster Correction
> > > + */
> > > +#define RPPX1_DPCC_METHODS_MAX                               3
> > > +
> > > +/* Linearization (Sensor De-gamma) */
> > > +#define RPPX1_LIN_SAMPLES_NUM                                17
> > > +
> > > +/* Gamma Out */
> > > +#define RPPX1_GAMMA_OUT_MAX_SAMPLES                  17
> > > +
> > > +/* Lens Shade Correction */
> > > +#define RPPX1_LSC_SECTORS_TBL_SIZE                   8
> > > +#define RPPX1_LSC_SAMPLES_MAX                                17
> > > +
> > > +/* Histogram */
> > > +#define RPPX1_HIST_BIN_N_MAX                         32
> > > +
> > > +/* Exposure Measurement */
> > > +#define RPPX1_EXM_MEAN_MAX                           25
> > > +
> > > +/* AWB Measurement */
> > > +#define RPPX1_AWB_MAX_GRID                           1
> > > +
> > > +/* Color Correction Matrix */
> > > +#define RPPX1_CTK_COEFF_MAX                          0x8000
> > > +#define RPPX1_CTK_OFFSET_MAX                         0x800000
> > > +
> > > +/* Filter */
> > > +#define RPPX1_BDM_MAX_TH                             0xffff
> > > +
> > > +/**
> > > + * enum rppx1_params_block_type - RPP-X1 extensible params block types
> > > + *
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_BLS: Black Level Subtraction
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_DPCC: Defect Pixel Cluster Correction
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_LIN: Linearization (Sensor De-gamma)
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_AWB_GAIN: Auto White Balance Gains
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_FLT: ISP Filtering
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_BDM: Bayer Demosaic
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_CTK: Color Correction (Cross-Talk)
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_GOC: Gamma Out Correction
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_DPF: De-noise Pre-Filter
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_DPF_STRENGTH: De-noise Pre-Filter Strength
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_LSC: Lens Shading Correction
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_AWB_MEAS: AWB Measurement Configuration
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_HST_MEAS: Histogram Measurement Configuration
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_AEC_MEAS: Auto Exposure Measurement Configuration
> > > + */
> > > +enum rppx1_params_block_type {
> > > +     RPPX1_PARAMS_BLOCK_TYPE_BLS,
> > > +     RPPX1_PARAMS_BLOCK_TYPE_DPCC,
> > > +     RPPX1_PARAMS_BLOCK_TYPE_LIN,
> > > +     RPPX1_PARAMS_BLOCK_TYPE_AWB_GAIN,
> > > +     RPPX1_PARAMS_BLOCK_TYPE_FLT,
> > > +     RPPX1_PARAMS_BLOCK_TYPE_BDM,
> > > +     RPPX1_PARAMS_BLOCK_TYPE_CTK,
> > > +     RPPX1_PARAMS_BLOCK_TYPE_GOC,
> > > +     RPPX1_PARAMS_BLOCK_TYPE_DPF,
> > > +     RPPX1_PARAMS_BLOCK_TYPE_DPF_STRENGTH,
> > > +     RPPX1_PARAMS_BLOCK_TYPE_LSC,
> > > +     RPPX1_PARAMS_BLOCK_TYPE_AWB_MEAS,
> > > +     RPPX1_PARAMS_BLOCK_TYPE_HST_MEAS,
> > > +     RPPX1_PARAMS_BLOCK_TYPE_AEC_MEAS,
> > > +};
> >
> > Let me start with a review of some of the blocks, we'll go through
> > them one by one.
> >
> > > +
> > > +/**
> > > + * struct rppx1_window - Measurement window
> > > + *
> > > + * @h_offs: horizontal offset from the left of the frame in pixels
> >
> > I think it's relevant saying these are 14 bits values
> >
> > > + * @v_offs: vertical offset from the top of the frame in pixels
> > > + * @h_size: horizontal size of the window in pixels
> > > + * @v_size: vertical size of the window in pixels
> > > + */
> > > +struct rppx1_window {
> > > +     __u16 h_offs;
> > > +     __u16 v_offs;
> > > +     __u16 h_size;
> > > +     __u16 v_size;
> > > +};
> > > +
> > > +/**
> > > + * struct rppx1_bls_fixed_val - BLS fixed subtraction values
> > > + *
> > > + * Fixed black level values subtracted from sensor data per Bayer channel.
> > > + * Negative values result in addition. Each value is a 24-bit + sign
> > > + * (25-bit signed) fixed-point number stored in a __s32.
> >
> > I think these should be described as
> >
> > "Each value is is stored as a signed 2's complement representation
> > ranging from -2^24 to 2^24-1."
> >
> > As the fixed point representation in 2's complement allows to
> > represent a negative number with an integer I think the type of the
> > fields should be __u32.
>
> Ack, will fix.
>
> >
> > > + *
> > > + * RPP-X1 supports 12/20/24-bit + sign depending on hardware version.
> >
> > The ISP reports this through the "bls_version" register field.
> >
> > I would introduce an enumeration for this and reference it here.
> > More on this below.
> >
> > > + * Userspace should provide values at full 24-bit precision; the driver
> > > + * truncates to match the hardware.
> >
> > If you're looking at "bls_version" I didn't find where it is said that
> > it impacts the fixed values, I only read it impacts the measured
> > values. Have I missed that ?
> >
>
> Yes, the BLS_VERSION register doesn't talk about the fixed values, only the
> measured values.
>
> But the PRE1_BLS_A_FIXED is 24 bits while PRE2_BLS_A_FIXED is 12 bits,
> which matches the measured values described in the BLS_VERSION register.
>

You're right PRE2 is 12 bits, nd I presume this is not the only block
as the whole PRE2 pipe operates on 12 bits.

However the "bls_version" is diffent in the PRE1 and PRE2 pipes.
I would for the time being stick to the register default value (24
bits for PRE1) and eventually report "bls_version" for other ISP
implementation which use a different bitwidth.

Also, as discussed offline, we probably need to differentiate the pre1 and
pre2 pipe, to allow userspace to program them separately.

We could add a field to the struct that indicates which pipe it
operates on or define a new type.

As the length of the fields is different, I'm leaning towards defining
separate types.

> > > + *
> > > + * @r: subtraction value for Bayer pattern R
> > > + * @gr: subtraction value for Bayer pattern Gr
> > > + * @gb: subtraction value for Bayer pattern Gb
> > > + * @b: subtraction value for Bayer pattern B
> >
> > The manual describes the values as "A", "B", "C" and "D".
> >
> > These values are matched with the Bayer components according to the
> > cropping configuration on the input port. The pipeline should
> > carefully crop to the macro-pixel boundary so that A B C and D
> > correspond to the sensor's native Bayer ordering.
> >
>
> That's a good point, will add a note in the comments. Are you also implying
> that we should use A/B/C/D for the names of these parameters here?
>
> > Also, I wouldn't say "subtraction" but simply "Fixed black level for
> > channel ..."
>
> Ack.
>
> >
> > > + */
> > > +struct rppx1_bls_fixed_val {
> > > +     __s32 r;
> > > +     __s32 gr;
> > > +     __s32 gb;
> > > +     __s32 b;
> > > +};
> > > +
> > > +/**
> > > + * struct rppx1_params_bls_config - Black Level Subtraction configuration
> > > + *
> > > + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_BLS)
> > > + * @enable_auto: 1 = use measured values, 0 = use fixed_val
> >
> > I would call this "bls_mode" and create and enum for it
> >
> > enum rppx1_bls_mode {
> >         RPPX1_BLS_MODE_FIXED,
> >         RPPX1_BLS_MODE_MEAS,
> > };
> >
> > > + * @en_windows: enabled measurement windows bitmask
> >
> > For this one as well
> >
> > enum rppx1_bls_win_en {
> >         RPPX1_BLS_WIN_EN_OFF,
> >         RPPX1_BLS_WIN_EN_WIN1,
> >         RPPX1_BLS_WIN_EN_WIN2,
> >         RPPX1_BLS_WIN_EN_WIN12,
> > };
> >
>
> Ack.
>
> > > + * @bls_window1: measurement window 1
> > > + * @bls_window2: measurement window 2
> > > + * @bls_samples: log2 of the number of measured pixels per Bayer position
> > > + * @fixed_val: fixed subtraction values (24-bit + sign)
> >
> > Let's defer the field length description to the documentation of
> > rppx1_bls_fixed_val.
> >
> > Also, I would document these as "fixed black level values"
> >
> > > + */
> > > +struct rppx1_params_bls_config {
> > > +     struct v4l2_isp_params_block_header header;
> > > +     __u8 enable_auto;
> > > +     __u8 en_windows;
> >
> > I was about to complaint that you're missing the enable bit but we can
> > use the block header maybe ?
> >
>
> Indeed, that's what is done in all the module implementations. IMO that's
> cleaner than having two different enable toggles.
>
> > > +     struct rppx1_window bls_window1;
> > > +     struct rppx1_window bls_window2;
> > > +     __u8 bls_samples;
> > > +     struct rppx1_bls_fixed_val fixed_val;
> > > +};
> > > +
> > > +/**
> > > + * struct rppx1_dpcc_methods_config - DPCC methods set configuration
> > > + *
> > > + * This structure stores the configuration of one set of methods for the DPCC
> > > + * algorithm. Multiple methods can be selected in each set (independently for
> > > + * the Green and Red/Blue components) through the @method field, the result is
> > > + * the logical AND of all enabled methods. The remaining fields set thresholds
> > > + * and factors for each method.
> > > + *
> > > + * @method: method enable bits (RPPX1_DPCC_METHODS_SET_*)
> > > + * @line_thresh: line threshold (RPPX1_DPCC_LINE_THRESH_*)
> > > + * @line_mad_fac: line MAD factor (RPPX1_DPCC_LINE_MAD_FAC_*)
> > > + * @pg_fac: peak gradient factor (RPPX1_DPCC_PG_FAC_*)
> > > + * @rnd_thresh: rank neighbor difference threshold (RPPX1_DPCC_RND_THRESH_*)
> > > + * @rg_fac: rank gradient factor (RPPX1_DPCC_RG_FAC_*)
> > > + */
> > > +struct rppx1_dpcc_methods_config {
> > > +     __u32 method;
> >
> > Shoulf we define each bit ?
> >
> > #define RPPX1_DPCC_METHODS_RG_RB_EN             (1 << 12)
> > #define RPPX1_DPCC_METHODS_RND_RB_EN            (1 << 11)
> > #define RPPX1_DPCC_METHODS_RO_RB_EN             (1 << 10)
> > #define RPPX1_DPCC_METHODS_LC_RB_EN             (1 << 9)
> > #define RPPX1_DPCC_METHODS_PG_RB_EN             (1 << 8)
> > #define RPPX1_DPCC_METHODS_RG_G_EN              (1 << 4)
> > #define RPPX1_DPCC_METHODS_RND_G_EN             (1 << 3)
> > #define RPPX1_DPCC_METHODS_RO_G_EN              (1 << 2)
> > #define RPPX1_DPCC_METHODS_LC_G_EN              (1 << 1)
> > #define RPPX1_DPCC_METHODS_PG_G_EN              (1 << 0)
> >
>
> DPCC implementation is currently stubbed out. Maybe we can just drop it for
> this first iteration of the uAPI?

I think so, let's start with blocks with a solid userspace user

>
> In case we want to implement it before v8, I agree on defining these bits
> in the header.
>
> > > +     __u32 line_thresh;
> > > +     __u32 line_mad_fac;
> >
> > For these and other fields you can define bitshits like the RkISP1
> > uAPI header does
> >
> > > +     __u32 pg_fac;
> > > +     __u32 rnd_thresh;
> > > +     __u32 rg_fac;
> > > +};
> > > +
> > > +/**
> > > + * struct rppx1_params_dpcc_config - Defect Pixel Cluster Correction configuration
> > > + *
> > > + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_DPCC)
> > > + * @mode: DPCC mode (RPPX1_DPCC_MODE_*)
> > > + * @output_mode: interpolation output mode (RPPX1_DPCC_OUTPUT_MODE_*)
> > > + * @set_use: methods sets selection (RPPX1_DPCC_SET_USE_*)
> > > + * @methods: methods sets configuration
> > > + * @ro_limits: rank order limits (RPPX1_DPCC_RO_LIMITS_*)
> > > + * @rnd_offs: differential rank offsets (RPPX1_DPCC_RND_OFFS_*)
> > > + */
> > > +struct rppx1_params_dpcc_config {
> > > +     struct v4l2_isp_params_block_header header;
> > > +     __u32 mode;
> >
> > Here as well it might be useful to define
> >
> > #define RPPX1_DPCC_MODE_STAGE1_EN               (1 << 2)
> > #define RPPX1_DPCC_MODE_GRAYSCALE               (1 << 1)
> > #define RPPX1_DPPC_MODE_ENABLE                  (1 << 0)
> >
> > > +     __u32 output_mode;
> > > +     __u32 set_use;
> >
> > The same applies to these two registers
>
> Ack. I missed them because they were unused.
> Will go through other modules too before v8.
>
> >
> > > +     struct rppx1_dpcc_methods_config methods[RPPX1_DPCC_METHODS_MAX];
> > > +     __u32 ro_limits;
> > > +     __u32 rnd_offs;
> > > +};
> >
> > DPPC reports a version number that allows to identify the bit width.
> > Should it be communicated to userspace through statistics ?
> >
>
> Ah, so throughout this series I have picked the largest bit width for the
> uAPI. The module driver implementation handles shifting the data before
> reading from (stats) and writing to (config) registers. Abstracting away
> that detail from userspace.
>
> I thought that would make life easy for libcamera tuning, where it is done
> only once for the highest bitdepth.
>
> Am I missing some case where this information is important for tuning?

I would start by supporting the default lengths in all blocks, and
report the version registers through stats (or other means) for ISP
implementation which use a different length. Would this work ?

>
> > > +
> > > +/**
> > > + * struct rppx1_lin_curve - Linearization curve for one color channel
> > > + *
> > > + * The RPP-X1 linearization module supports 12/20/24-bit precision depending
> > > + * on hardware version. Values are provided at 24-bit precision; the driver
> >
> > The hardware version should be reported through stats with proper
> > defines
> >

AS per above, let's start with the defaults.

> > Did you get what the difference is between:
> > 0x006: 24 bit version
> > 0x009: 24 bit, 4 bit dxi
> >
> > It seems to me dxi samples are 4 bits, aren't they ?
> >
>
> I believe in the other version dxi samples will be 3 bits, like they're in
> RkISP.

Ok, so when not specified, 3 bits is implied.

>
> > > + *
> > > + * @gamma_y: curve y-axis values, each up to 24 bits
> > > + */
> > > +struct rppx1_lin_curve {
> > > +     __u32 gamma_y[RPPX1_LIN_SAMPLES_NUM];
> > > +};
> > > +
> > > +/**
> > > + * struct rppx1_lin_curve_dx - Linearization curve x-axis (sampling points)
> > > + * increments.
> > > + *
> > > + * gamma_dx[0] is for the lower samples, so Bits 0:3 for sample 1, ... Bits
> > > + * 28:31 for sample 8
> > > + * gamma_dx[1] is for the higher samples, so Bits 0:3 for sample 9, ... Bits
> > > + * 28:31 for sample 16
> > > + *
> > > + * The reset values for both fields is 0xcccccccc. This means that each sample
> > > + * is 12 units away from the previous one on the x-axis.
> > > + *
> > > + * @gamma_dx: curve x-axis increments in 4-bit precision
> > > + */
> > > +struct rppx1_lin_curve_dx {
> > > +     __u32 gamma_dx[2];
> > > +};
> > > +
> > > +/**
> > > + * struct rppx1_params_lin_config - Linearization (Sensor De-gamma) configuration
> > > + *
> > > + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_LIN)
> > > + * @curve_r: linearization curve for red channel
> > > + * @curve_g: linearization curve for green channel
> > > + * @curve_b: linearization curve for blue channel
> > > + * @xa_pnts: x axis increment definitions
> > > + */
> > > +struct rppx1_params_lin_config {
> > > +     struct v4l2_isp_params_block_header header;
> > > +     struct rppx1_lin_curve curve_r;
> > > +     struct rppx1_lin_curve curve_g;
> > > +     struct rppx1_lin_curve curve_b;
> > > +     struct rppx1_lin_curve_dx xa_pnts;
> > > +};
> >
> > Ack, I'll stop here for the time being :)
> >
>
> Thanks,
>     Jai
>
> [snip]
>

