Return-Path: <linux-media+bounces-61455-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAX9BdWPBGoVLgIAu9opvQ
	(envelope-from <linux-media+bounces-61455-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:51:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7D553574E
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 16:50:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 971B83432FDF
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2E42D7D2E;
	Wed, 13 May 2026 13:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDiKpu/d"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD8B2BEC4E;
	Wed, 13 May 2026 13:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680668; cv=none; b=VjIA9kBION9e7A4I8JPbJ1r6W99fMezej0pL9zHY65WOMLScRVmDxDLIzy7HO7Pys3b2Oi0h5cpZRv9VM1ZIMz2GaouoeOnvLdplE/YYwWLdc+pSZEt7myu4AjkD+JQpjmUPW80TzVls0zi2mjpIffwIQ8abX6X0F/8ss7+ROmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680668; c=relaxed/simple;
	bh=xCGSmUNmAHPDgb/YXdd0V9GbihR6QzirJZG+PlgQxoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AnmGVq7dty3QEIwlCn4vwQqzy425mYr5CK6J6VHezlpZUN47aEJynX80BNNMdIQ+sJjGBSkf+a/mjKtGVHXTdnt7iQ7CSZ5fFaMZhILuBvohpcZl4eQP85kemzSXDh8brvGn97BMg1hC0k9A4w7PnuhtxHj1eqgIRJD/+IkR0As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDiKpu/d; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778680667; x=1810216667;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xCGSmUNmAHPDgb/YXdd0V9GbihR6QzirJZG+PlgQxoc=;
  b=lDiKpu/dGlWXyPDPiIurUgusp/s6L55sayJz1M/07DVMrTBh7Cu6Exk4
   6qDVr9NrGYEYw+xTypYeuQH/xco0f0qV68zxZPabBCaPdGmVlSmosqtgj
   lbdBX+9KqR7JRIxMHue4xKESvAHDdXWUwYVjyq3sYBv8nooBBRPsskS4h
   V9fuAYRsSUma7qdo6VqkTZbqZ8i6O4+JLZ9wxNY/ToB8ydTrSiyeLnz0B
   u32a6FRAh3mO5NJRhodjqnFamUDetaDrmvM5i25UL3aXPQf5Y7C4Y7pPT
   LNYC8321ouqKwYIKC7bXljw19rJuo4r251x+jfkxckw3dANlu63MrmR0/
   Q==;
X-CSE-ConnectionGUID: jZamJhBfSym+/qhprChyFA==
X-CSE-MsgGUID: f4/jKj+gRSaRAl4Lt6qyWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97034625"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="97034625"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 06:57:47 -0700
X-CSE-ConnectionGUID: KmLy6cpsRD6biS0Axw4NwA==
X-CSE-MsgGUID: 029kK+GUTgW9bdGj+3ao3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="231700498"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.111])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 06:57:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 68CE0121C9E;
	Wed, 13 May 2026 16:57:40 +0300 (EEST)
Date: Wed, 13 May 2026 16:57:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v4 2/5] media: hi846: fix link frequency handling
Message-ID: <agSDVJX0QKNgDMuw@kekkonen.localdomain>
References: <20260511103927.279550-1-mitltlatltl@gmail.com>
 <20260511103927.279550-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511103927.279550-3-mitltlatltl@gmail.com>
X-Rspamd-Queue-Id: 6B7D553574E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-61455-lists,linux-media=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,posteo.de,puri.sm,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Action: no action

Hi Penguy,

On Mon, May 11, 2026 at 06:39:24PM +0800, Pengyu Luo wrote:
> link frequency is tied to PLL configuration, lane count, and external

A sentence begins with a capital letter, also the subject does.

> clock rate, so use runtime here instead of hardcoding for specific
> configuration. To implement this, this commit did
> 
> 1. dropped exposed link freqs as a v4l2_ctrl, since we are runtime
> now, it is inconvenient and unnecessary to expose it, and
> hi846_set_ctrl has nothing to do with it.

Please describe the changes the patch does in imperative form.

> 
> 2. attached pll_cfg_4lane to current mode, and use it with clock, lane
> count to calculate link frequency, we use 4-lane config as default,
> but we can double it easily for 2-lane case.
> 
> 3. dropped mclk clock rate check.
> 
> Fixes: e8c0882685f9 ("media: i2c: add driver for the SK Hynix Hi-846 8M pixel camera")
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/media/i2c/hi846.c | 75 ++++++++++++++++++++-------------------
>  1 file changed, 38 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index 7f069aca0fce..61297ef66a0e 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // Copyright (c) 2021 Purism SPC
>  
> -#include <linux/unaligned.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> @@ -11,6 +11,7 @@
>  #include <linux/pm.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/unaligned.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-fwnode.h>
> @@ -219,8 +220,8 @@ struct hi846_mode {
>  	/* Horizontal timing size */
>  	u32 llp;
>  
> -	/* Link frequency needed for this resolution */
> -	u8 link_freq_index;
> +	/* PLL configuration for 4-lane link at this resolution */
> +	u16 pll_cfg_4lane;

Please use separate fields for different PLL configuration parameters, i.e.
not register values.

>  
>  	u16 fps;
>  
> @@ -1040,13 +1041,6 @@ static const char * const hi846_test_pattern_menu[] = {
>  	"Resolution Pattern",
>  };
>  
> -#define FREQ_INDEX_640	0
> -#define FREQ_INDEX_1280	1
> -static const s64 hi846_link_freqs[] = {
> -	[FREQ_INDEX_640] = 80000000,
> -	[FREQ_INDEX_1280] = 200000000,
> -};
> -
>  static const struct hi846_reg_list hi846_init_regs_list_2lane = {
>  	.num_of_regs = ARRAY_SIZE(hi846_init_2lane),
>  	.regs = hi846_init_2lane,
> @@ -1061,7 +1055,7 @@ static const struct hi846_mode supported_modes[] = {
>  	{
>  		.width = 640,
>  		.height = 480,
> -		.link_freq_index = FREQ_INDEX_640,
> +		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
>  		.fps = 120,
>  		.frame_len = 631,
>  		.llp = HI846_LINE_LENGTH,
> @@ -1086,7 +1080,7 @@ static const struct hi846_mode supported_modes[] = {
>  	{
>  		.width = 1280,
>  		.height = 720,
> -		.link_freq_index = FREQ_INDEX_1280,
> +		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
>  		.fps = 90,
>  		.frame_len = 842,
>  		.llp = HI846_LINE_LENGTH,
> @@ -1112,7 +1106,7 @@ static const struct hi846_mode supported_modes[] = {
>  	{
>  		.width = 1632,
>  		.height = 1224,
> -		.link_freq_index = FREQ_INDEX_1280,
> +		.pll_cfg_4lane = 0x4924, /* HI846_REG_PLL_CFG_MIPI2_H */
>  		.fps = 30,
>  		.frame_len = 2526,
>  		.llp = HI846_LINE_LENGTH,
> @@ -1161,7 +1155,6 @@ struct hi846 {
>  	struct v4l2_ctrl_handler ctrl_handler;
>  	u8 nr_lanes;
>  
> -	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *pixel_rate;
>  	struct v4l2_ctrl *vblank;
>  	struct v4l2_ctrl *hblank;
> @@ -1192,21 +1185,37 @@ static const struct hi846_datafmt *hi846_find_datafmt(u32 code)
>  	return NULL;
>  }
>  
> -static inline u8 hi846_get_link_freq_index(struct hi846 *hi846)
> +static u64
> +hi846_get_link_freq(struct hi846 *hi846, const struct hi846_mode *cur_mode)
>  {
> -	return hi846->cur_mode->link_freq_index;
> -}
> +	u16 cfg = cur_mode->pll_cfg_4lane;
> +	u64 mclk = clk_get_rate(hi846->clock);
>  
> -static u64 hi846_get_link_freq(struct hi846 *hi846)
> -{
> -	u8 index = hi846_get_link_freq_index(hi846);
> +	/* NOTE: 6, 7 actually map to 8, 10, but this won't be that big */
> +	u8 post_div1 = 1 + FIELD_GET(GENMASK(10, 8), cfg);
> +	u8 post_div2 = 1 << FIELD_GET(GENMASK(12, 11), cfg);

s/1U/1/

>  
> -	return hi846_link_freqs[index];
> +	/*
> +	 * HI846_REG_PLL_CFG_MIPI1_H = 0x025a, it is fixed in listed modes
> +	 * [11:8]: 0x02 => pre_div = 3
> +	 * [7:0]: 0x5a => multiplier = 90
> +	 */
> +	u64 link_freq = mclk / 3 * 90 / post_div1 / post_div2;

This needs div_u64().

Don't divide by 3 upfront, you'll lose information.

> +	/*
> +	 * for shared modes, since lane count is halved for 2-lane, then getting
> +	 * link_freq doubled to match the same data rate. Since 720x480 is
> +	 * 2-lane only(reg_list_4lane.num_of_regs == 0), no pll cfg for 4-lane,
> +	 * the pll cfg is for 2-lane, so use the cfg as is.
> +	 */
> +	if (hi846->nr_lanes == 2 && cur_mode->reg_list_4lane.num_of_regs)
> +		link_freq *= 2;
> +
> +	return link_freq;
>  }
>  
>  static u64 hi846_calc_pixel_rate(struct hi846 *hi846)
>  {
> -	u64 link_freq = hi846_get_link_freq(hi846);
> +	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
>  	u64 pixel_rate = link_freq * 2 * hi846->nr_lanes;
>  
>  	do_div(pixel_rate, HI846_RGB_DEPTH);
> @@ -1426,14 +1435,6 @@ static int hi846_init_controls(struct hi846 *hi846)
>  
>  	ctrl_hdlr->lock = &hi846->mutex;
>  
> -	hi846->link_freq =
> -		v4l2_ctrl_new_int_menu(ctrl_hdlr, &hi846_ctrl_ops,
> -				       V4L2_CID_LINK_FREQ,
> -				       ARRAY_SIZE(hi846_link_freqs) - 1,
> -				       0, hi846_link_freqs);
> -	if (hi846->link_freq)
> -		hi846->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
> -
>  	hi846->pixel_rate =
>  		v4l2_ctrl_new_std(ctrl_hdlr, &hi846_ctrl_ops,
>  				  V4L2_CID_PIXEL_RATE, 0,
> @@ -1503,10 +1504,10 @@ static int hi846_set_video_mode(struct hi846 *hi846, int fps)
>  	u64 frame_length;
>  	int ret = 0;
>  	int dummy_lines;
> -	u64 link_freq = hi846_get_link_freq(hi846);
> +	u64 link_freq = hi846_get_link_freq(hi846, hi846->cur_mode);
>  
>  	dev_dbg(&client->dev, "%s: link freq: %llu\n", __func__,
> -		hi846_get_link_freq(hi846));
> +		link_freq);

Fits on the same line.

>  
>  	do_div(link_freq, fps);
>  	frame_length = link_freq;
> @@ -1749,7 +1750,6 @@ static int hi846_set_format(struct v4l2_subdev *sd,
>  	mf->code = HI846_MEDIA_BUS_FORMAT;
>  	mf->field = V4L2_FIELD_NONE;
>  
> -	__v4l2_ctrl_s_ctrl(hi846->link_freq, hi846_get_link_freq_index(hi846));
>  	__v4l2_ctrl_s_ctrl_int64(hi846->pixel_rate,
>  				 hi846_calc_pixel_rate(hi846));
>  
> @@ -1950,16 +1950,17 @@ static int hi846_identify_module(struct hi846 *hi846)
>  static s64 hi846_check_link_freqs(struct hi846 *hi846,
>  				  struct v4l2_fwnode_endpoint *ep)
>  {
> -	const s64 *freqs = hi846_link_freqs;
> -	int freqs_count = ARRAY_SIZE(hi846_link_freqs);
> +	int freqs_count = ARRAY_SIZE(supported_modes);
> +	u64 link_freq;
>  	int i, j;
>  
>  	for (i = 0; i < freqs_count; i++) {
> +		link_freq = hi846_get_link_freq(hi846, &supported_modes[i]);
>  		for (j = 0; j < ep->nr_of_link_frequencies; j++)
> -			if (freqs[i] == ep->link_frequencies[j])
> +			if (link_freq == ep->link_frequencies[j])
>  				break;
>  		if (j == ep->nr_of_link_frequencies)
> -			return freqs[i];
> +			return link_freq;

I think v4l2_link_freq_to_bitmap() would be useful here.

>  	}
>  
>  	return 0;

-- 
Regards,

Sakari Ailus

