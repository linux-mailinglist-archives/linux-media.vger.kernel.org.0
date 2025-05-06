Return-Path: <linux-media+bounces-31879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB98AAACF06
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 22:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9DDA1C203AE
	for <lists+linux-media@lfdr.de>; Tue,  6 May 2025 20:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0380192D70;
	Tue,  6 May 2025 20:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1NDpqmq"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DD172637;
	Tue,  6 May 2025 20:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746564794; cv=none; b=bEQ5O9gKHHzZRpYSnZUUqLRLZt4vOogTInEjM4GQJ1rOOMhoRw7PDmNJ+SK67ZkRKhGVDGJTPj36FUmRwUEDo0cs45YoXO1PsNPDQqbSADHZ53+3ARayUpq0SFUKBAX6RPrSFY8Q9YfObRRtHpfgFeJYjjh+yZE8W9FJOlatse0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746564794; c=relaxed/simple;
	bh=IB1uMXaOatUPA60/ne1y1pkBU8eZN/3MPpgmhWmqY0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQ55LLb3Und+fyHD4HXh/lVBGfUOa2730aRtWI7ciBpx2CF1hoQ60z2cIjY/rfAv60hdzNQTImM4N1VD6sa8WhR2dcx9EcsMmJ/D3i8vC4h4BU32O7S2MbeQ9VqAyN3SPgI17EvbXxpvh+sGXlvgHu78y2SersTMDTSP7WlEyDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1NDpqmq; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746564792; x=1778100792;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IB1uMXaOatUPA60/ne1y1pkBU8eZN/3MPpgmhWmqY0s=;
  b=R1NDpqmqXMK9MmT3KAJPcWOrVbpO7pfKzfo0DucwSWOLojlaHdXoKKrz
   SRc2yXsqCXynDTncvSwnCbG/EQe1U80Xbnvvoxwa15pfLz1+iFRo67IZZ
   kVrbeXUv+aRfeylbsK7kVRvan9Tkbb6txH4YW52jxRRRTmz4aRoawmxTw
   J8b5A0M+fG48EfjP+Uj68hhgr6lwO4Li+TgtWQ9VBCGysk/VZviXr9HO7
   VG3Z9D5ENQuWAWARNYHBf891aONglNOVQz/k6aR3iIQvNyQVmBjK/5IO0
   GrIttsnryfLxYtnPVnBseiK4W3GezQxW5phGXsVLrknUFtdBGMgRvBkKh
   w==;
X-CSE-ConnectionGUID: L61HA9sxTVma+9jibaj93Q==
X-CSE-MsgGUID: c3SgT6krTPmRJSHB8gnS3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58461288"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="58461288"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 13:53:11 -0700
X-CSE-ConnectionGUID: 6i/gg743RveY/zJJX4exRw==
X-CSE-MsgGUID: E1qb+XBwTOKoh+HUG91CtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; 
   d="scan'208";a="172924263"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.152])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 13:53:09 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 0349412022D;
	Tue,  6 May 2025 23:53:06 +0300 (EEST)
Date: Tue, 6 May 2025 20:53:05 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v2 3/4] media: i2c: imx214: Make use of CCS PLL calculator
Message-ID: <aBp2sYhJ6NNF_2sH@kekkonen.localdomain>
References: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
 <20250505-imx214_ccs_pll-v2-3-f50452061ff1@apitzsch.eu>
 <aBnCrlMm0EbbmB2w@kekkonen.localdomain>
 <9a06eecc32e4bc1fe1c181a52c8504e00a4882fa.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a06eecc32e4bc1fe1c181a52c8504e00a4882fa.camel@apitzsch.eu>

Hi André,

On Tue, May 06, 2025 at 10:16:23PM +0200, André Apitzsch wrote:
> Hi Sakari,
> 
> thanks for the feedback. One question below.
> 
> Am Dienstag, dem 06.05.2025 um 08:05 +0000 schrieb Sakari Ailus:
> > Hi André,
> > 
> > A few more comments below.
> > 
> > On Mon, May 05, 2025 at 11:05:55PM +0200, André Apitzsch via B4 Relay
> > wrote:
> > > From: André Apitzsch <git@apitzsch.eu>
> > > 
> > > Calculate PLL parameters based on clock frequency and link
> > > frequency.
> > > 
> > > Acked-by: Ricardo Ribalda <ribalda@chromium.org>
> > > Signed-off-by: André Apitzsch <git@apitzsch.eu>
> > > ---
> > >  drivers/media/i2c/Kconfig  |   1 +
> > >  drivers/media/i2c/imx214.c | 216
> > > +++++++++++++++++++++++++++++++++++++--------
> > >  2 files changed, 178 insertions(+), 39 deletions(-)
> > > 
> > > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > > index
> > > e576b213084d232e90b7e556a7a855a3bb95544c..c8e24c42e0c4ea169f1b6cdc4
> > > f2631234a51c7d9 100644
> > > --- a/drivers/media/i2c/Kconfig
> > > +++ b/drivers/media/i2c/Kconfig
> > > @@ -141,6 +141,7 @@ config VIDEO_IMX214
> > >  	depends on GPIOLIB
> > >  	select REGMAP_I2C
> > >  	select V4L2_CCI_I2C
> > > +	select VIDEO_CCS_PLL
> > >  	help
> > >  	  This is a Video4Linux2 sensor driver for the Sony
> > >  	  IMX214 camera.
> > > diff --git a/drivers/media/i2c/imx214.c
> > > b/drivers/media/i2c/imx214.c
> > > index
> > > 3aca6ebb02d649c1b7f0b6a6049c1e3aa3d08951..9e9be47394ec768a5b34d44b0
> > > 6b5bbb0988da5a1 100644
> > > --- a/drivers/media/i2c/imx214.c
> > > +++ b/drivers/media/i2c/imx214.c
> > > @@ -20,6 +20,8 @@
> > >  #include <media/v4l2-fwnode.h>
> > >  #include <media/v4l2-subdev.h>
> > >  
> > > +#include "ccs-pll.h"
> > > +
> > >  /* Chip ID */
> > >  #define IMX214_REG_CHIP_ID		CCI_REG16(0x0016)
> > >  #define IMX214_CHIP_ID			0x0214
> > > @@ -34,7 +36,6 @@
> > >  #define IMX214_DEFAULT_LINK_FREQ	600000000
> > >  /* Keep wrong link frequency for backward compatibility */
> > >  #define IMX214_DEFAULT_LINK_FREQ_LEGACY	480000000
> > > -#define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ *
> > > 8LL) / 10)
> > >  #define IMX214_FPS 30
> > >  
> > >  /* V-TIMING internal */
> > > @@ -84,6 +85,7 @@
> > >  #define IMX214_CSI_DATA_FORMAT_RAW10	0x0A0A
> > >  #define IMX214_CSI_DATA_FORMAT_COMP6	0x0A06
> > >  #define IMX214_CSI_DATA_FORMAT_COMP8	0x0A08
> > > +#define IMX214_BITS_PER_PIXEL_MASK	0xFF
> > >  
> > >  #define IMX214_REG_CSI_LANE_MODE	CCI_REG8(0x0114)
> > >  #define IMX214_CSI_2_LANE_MODE		1
> > > @@ -249,6 +251,10 @@ struct imx214 {
> > >  	struct clk *xclk;
> > >  	struct regmap *regmap;
> > >  
> > > +	struct ccs_pll pll;
> > > +
> > > +	struct v4l2_fwnode_endpoint bus_cfg;
> > > +
> > >  	struct v4l2_subdev sd;
> > >  	struct media_pad pad;
> > >  
> > > @@ -758,16 +764,22 @@ static int imx214_configure_pll(struct imx214
> > > *imx214)
> > >  {
> > >  	int ret = 0;
> > >  
> > > -	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV, 5, &ret);
> > > -	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV, 2, &ret);
> > > -	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV, 3,
> > > &ret);
> > > -	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY, 150,
> > > &ret);
> > > -	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV, 10,
> > > &ret);
> > > -	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV, 1, &ret);
> > > +	cci_write(imx214->regmap, IMX214_REG_VTPXCK_DIV,
> > > +		  imx214->pll.vt_bk.pix_clk_div, &ret);
> > > +	cci_write(imx214->regmap, IMX214_REG_VTSYCK_DIV,
> > > +		  imx214->pll.vt_bk.sys_clk_div, &ret);
> > > +	cci_write(imx214->regmap, IMX214_REG_PREPLLCK_VT_DIV,
> > > +		  imx214->pll.vt_fr.pre_pll_clk_div, &ret);
> > > +	cci_write(imx214->regmap, IMX214_REG_PLL_VT_MPY,
> > > +		  imx214->pll.vt_fr.pll_multiplier, &ret);
> > > +	cci_write(imx214->regmap, IMX214_REG_OPPXCK_DIV,
> > > +		  imx214->pll.op_bk.pix_clk_div, &ret);
> > > +	cci_write(imx214->regmap, IMX214_REG_OPSYCK_DIV,
> > > +		  imx214->pll.op_bk.sys_clk_div, &ret);
> > >  	cci_write(imx214->regmap, IMX214_REG_PLL_MULT_DRIV,
> > >  		  IMX214_PLL_SINGLE, &ret);
> > >  	cci_write(imx214->regmap, IMX214_REG_EXCK_FREQ,
> > > -		  IMX214_EXCK_FREQ(IMX214_DEFAULT_CLK_FREQ /
> > > 1000000), &ret);
> > > +		  IMX214_EXCK_FREQ(imx214->pll.ext_clk_freq_hz /
> > > 1000000), &ret);
> > >  
> > >  	return ret;
> > >  }
> > > @@ -872,9 +884,6 @@ static const struct v4l2_ctrl_ops
> > > imx214_ctrl_ops = {
> > >  
> > >  static int imx214_ctrls_init(struct imx214 *imx214)
> > >  {
> > > -	static const s64 link_freq[] = {
> > > -		IMX214_DEFAULT_LINK_FREQ
> > > -	};
> > >  	static const struct v4l2_area unit_size = {
> > >  		.width = 1120,
> > >  		.height = 1120,
> > > @@ -895,15 +904,14 @@ static int imx214_ctrls_init(struct imx214
> > > *imx214)
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > -	imx214->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
> > > -					      
> > > V4L2_CID_PIXEL_RATE, 0,
> > > -					      
> > > IMX214_DEFAULT_PIXEL_RATE, 1,
> > > -					      
> > > IMX214_DEFAULT_PIXEL_RATE);
> > > +	imx214->pixel_rate =
> > > +		v4l2_ctrl_new_std(ctrl_hdlr, NULL,
> > > V4L2_CID_PIXEL_RATE, 1,
> > > +				  INT_MAX, 1, 1);
> > >  
> > >  	imx214->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr,
> > > NULL,
> > >  						  
> > > V4L2_CID_LINK_FREQ,
> > > -						  
> > > ARRAY_SIZE(link_freq) - 1,
> > > -						   0, link_freq);
> > > +						   imx214-
> > > >bus_cfg.nr_of_link_frequencies - 1,
> > > +						   0, imx214-
> > > >bus_cfg.link_frequencies);
> > >  	if (imx214->link_freq)
> > >  		imx214->link_freq->flags |=
> > > V4L2_CTRL_FLAG_READ_ONLY;
> > >  
> > > @@ -1006,6 +1014,7 @@ static int imx214_start_streaming(struct
> > > imx214 *imx214)
> > >  	const struct v4l2_mbus_framefmt *fmt;
> > >  	struct v4l2_subdev_state *state;
> > >  	const struct imx214_mode *mode;
> > > +	int bit_rate_mbps;
> > >  	int ret;
> > >  
> > >  	ret = cci_multi_reg_write(imx214->regmap,
> > > mode_table_common,
> > > @@ -1021,8 +1030,10 @@ static int imx214_start_streaming(struct
> > > imx214 *imx214)
> > >  		return ret;
> > >  	}
> > >  
> > > +	bit_rate_mbps = (imx214->pll.pixel_rate_pixel_array /

You should btw. use pll.pixel_rate_csi here instead: this is on the link,
not the pixel array.

> > > 1000000)
> > > +			* imx214->pll.bits_per_pixel;
> > >  	ret = cci_write(imx214->regmap,
> > > IMX214_REG_REQ_LINK_BIT_RATE,
> > > -			IMX214_LINK_BIT_RATE_MBPS(4800), NULL);
> > > +			IMX214_LINK_BIT_RATE_MBPS(bit_rate_mbps),
> > > NULL);
> > >  	if (ret) {
> > >  		dev_err(imx214->dev, "failed to configure link bit
> > > rate\n");
> > >  		return ret;
> > > @@ -1105,6 +1116,112 @@ static int imx214_s_stream(struct
> > > v4l2_subdev *subdev, int enable)
> > >  	return ret;
> > >  }
> > >  
> > > +static int imx214_pll_calculate(struct imx214 *imx214, struct
> > > ccs_pll *pll,
> > > +				unsigned int link_freq)
> > > +{
> > > +	struct ccs_pll_limits limits = {
> > > +		.min_ext_clk_freq_hz = 6000000,
> > > +		.max_ext_clk_freq_hz = 27000000,
> > > +
> > > +		.vt_fr = {
> > > +			.min_pre_pll_clk_div = 1,
> > > +			.max_pre_pll_clk_div = 15,
> > > +			/* min_pll_op_clk_freq_hz /
> > > max_pll_multiplier */
> > > +			.min_pll_ip_clk_freq_hz = 281667,
> > > +			/* max_pll_op_clk_freq_hz /
> > > min_pll_multiplier */
> > > +			.max_pll_ip_clk_freq_hz = 100000000,
> > 
> > Regarding these limits -- the pll_ip_clk_freq_hz limits are likely
> > between around 6 MHz (lower limit) and between 12 MHz and 27 MHz. I'd
> > use 6 for lower and 12 for higher if they yield correct configuration
> > currently and loosen them up only if needed.
> 
> The range 6-12 MHz seems to work.
> With the updated min/max values, the comments are no longer valid,
> should I just remove them or what alternative comments could be used?

I'd still leave there the fact these are just educated guesses, not
manufacturer-defined values.

-- 
Regards,

Sakari Ailus

