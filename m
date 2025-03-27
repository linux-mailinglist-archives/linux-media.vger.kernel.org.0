Return-Path: <linux-media+bounces-28837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D9FA72D6A
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 11:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7990D162B91
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 10:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1DB20E026;
	Thu, 27 Mar 2025 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHy8kk/3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D013E433C8;
	Thu, 27 Mar 2025 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743070173; cv=none; b=sZBqfUedoiQtJ45V2xSN8bjX8hiQ3G3m0s9OnvSgKtIsOuvd1h+5T09LaktYbHtL1OVdD/4n6cm8Gukx0MQuL4dvch/L7EhDZ4oORj2nf3DkEbVaB6baAYP4xlRLK6J65Vph7Ca3EXVUZgNB1S7FCJpucI5gTdfc+xPGlCmbYko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743070173; c=relaxed/simple;
	bh=d8XG/C09xjfs3CzpZIdecMSM3/jWhXt87UX1vhyMoaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzrRj4RMLf4hgzf3kmshharbwOU39S2uKBvtSbzHcAU4r6AwvD3EkJ1ZHHeoX3FxK+417qpYlO7GATTC8g3LYKFIimHDvtr9csFPH6mjPc2mAf8CBHmx4j6su++ES5KaB90l/8s1XIMo9+Rw7777Bjxmg/G/ovs2QCDaoUePVmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHy8kk/3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743070172; x=1774606172;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d8XG/C09xjfs3CzpZIdecMSM3/jWhXt87UX1vhyMoaU=;
  b=UHy8kk/3AY8awiHiHtMQukm3zy72t70CYYNxS9pMzGPtAJZVUWHu02jD
   bWqctvcKXEuWhUj6smvsLSpLBOfDPYr/XqoOy9MeHau7zEcx8GXG6/CxG
   5uY3kk+DNj8kwlFqoXf3WzRIRnHmvgN4B4UFPLe3PAwcnxSY+3m+CXr+S
   lmsKXlFCeKJ+vXrpndZOoH9ItWpQzEXt/GV17HEifZu3bYcAlSlVKND4N
   nICtID8Usg+JkDHTKKSfQBScj8PMvhTjhfeN3KI8wsgbTdxskTVGxK+hE
   Dt0qWjfmOCZAnFN2p/IC+Rh/cok1SFQNIKhG4/XIn1aEf+/P4IyHI22Rx
   Q==;
X-CSE-ConnectionGUID: c9Dc2yeVQuWKXMOj8ZxfHA==
X-CSE-MsgGUID: xaauNgO5Tke7xnGVwjE9Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55760011"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="55760011"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 03:09:31 -0700
X-CSE-ConnectionGUID: AIRUMm0sQ2SXk8zCZXAaPw==
X-CSE-MsgGUID: Lj332GGXTXenW6TOIDBV2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="129775600"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 03:09:28 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6D06A11F99F;
	Thu, 27 Mar 2025 12:09:25 +0200 (EET)
Date: Thu, 27 Mar 2025 10:09:25 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: kieran.bingham@ideasonboard.com, Shravan.Chippa@microchip.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Julien Massot <julien.massot@collabora.com>,
	Luis Garcia <git@luigi311.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] media: i2c: imx334: Support 4 or 8 lane operation
 modes
Message-ID: <Z-Uj1VnLKQH09__5@kekkonen.localdomain>
References: <20250310071751.151382-1-tarang.raval@siliconsignals.io>
 <20250310071751.151382-5-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310071751.151382-5-tarang.raval@siliconsignals.io>

Hi Tarang,

On Mon, Mar 10, 2025 at 12:47:46PM +0530, Tarang Raval wrote:
> imx334 can support both 4 and 8 lane configurations.
> Extend the driver to configure the lane mode accordingly.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/imx334.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index 24ccfd1d0986..23bfc64969cc 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -47,6 +47,8 @@
>  #define IMX334_EXPOSURE_DEFAULT	0x0648
>  
>  #define IMX334_REG_LANEMODE            CCI_REG8(0x3a01)
> +#define IMX334_CSI_4_LANE_MODE         3
> +#define IMX334_CSI_8_LANE_MODE         7
>  
>  /* Window cropping Settings */
>  #define IMX334_REG_AREA3_ST_ADR_1      CCI_REG16_LE(0x3074)
> @@ -107,7 +109,6 @@
>  /* CSI2 HW configuration */
>  #define IMX334_LINK_FREQ_891M	891000000
>  #define IMX334_LINK_FREQ_445M	445500000
> -#define IMX334_NUM_DATA_LANES	4
>  
>  #define IMX334_REG_MIN		0x00
>  #define IMX334_REG_MAX		0xfffff
> @@ -181,6 +182,7 @@ struct imx334_mode {
>   * @exp_ctrl: Pointer to exposure control
>   * @again_ctrl: Pointer to analog gain control
>   * @vblank: Vertical blanking in lines
> + * @lane_mode: Mode for number of connected data lanes
>   * @cur_mode: Pointer to current selected sensor mode
>   * @mutex: Mutex for serializing sensor controls
>   * @link_freq_bitmap: Menu bitmap for link_freq_ctrl
> @@ -204,6 +206,7 @@ struct imx334 {
>  		struct v4l2_ctrl *again_ctrl;
>  	};
>  	u32 vblank;
> +	u32 lane_mode;
>  	const struct imx334_mode *cur_mode;
>  	struct mutex mutex;
>  	unsigned long link_freq_bitmap;
> @@ -240,7 +243,6 @@ static const struct cci_reg_sequence common_mode_regs[] = {
>  	{ IMX334_REG_HADD_VADD, 0x00},
>  	{ IMX334_REG_VALID_EXPAND, 0x03},
>  	{ IMX334_REG_TCYCLE, 0x00},
> -	{ IMX334_REG_LANEMODE, 0x03},

Not a fault of this patch but also the closing brace should have a space
before it. Could you address it in the earlier patches?

>  	{ IMX334_REG_TCLKPOST, 0x007f},
>  	{ IMX334_REG_TCLKPREPARE, 0x0037},
>  	{ IMX334_REG_TCLKTRAIL, 0x0037},
> @@ -876,6 +878,13 @@ static int imx334_start_streaming(struct imx334 *imx334)
>  		return ret;
>  	}
>  
> +	ret = cci_write(imx334->cci, IMX334_REG_LANEMODE,
> +			imx334->lane_mode, NULL);
> +	if (ret) {
> +		dev_err(imx334->dev, "failed to configure lanes\n");
> +		return ret;
> +	}
> +
>  	ret = imx334_set_framefmt(imx334);
>  	if (ret) {
>  		dev_err(imx334->dev, "%s failed to set frame format: %d\n",
> @@ -1022,7 +1031,14 @@ static int imx334_parse_hw_config(struct imx334 *imx334)
>  	if (ret)
>  		return ret;
>  
> -	if (bus_cfg.bus.mipi_csi2.num_data_lanes != IMX334_NUM_DATA_LANES) {
> +	switch (bus_cfg.bus.mipi_csi2.num_data_lanes) {
> +	case 4:
> +		imx334->lane_mode = IMX334_CSI_4_LANE_MODE;
> +		break;
> +	case 8:
> +		imx334->lane_mode = IMX334_CSI_8_LANE_MODE;

Doesn't this affect the PLL configuration? Presumably higher frame rates
could be achieved at least.

> +		break;
> +	default:
>  		dev_err(imx334->dev,
>  			"number of CSI2 data lanes %d is not supported\n",
>  			bus_cfg.bus.mipi_csi2.num_data_lanes);

-- 
Regards,

Sakari Ailus

