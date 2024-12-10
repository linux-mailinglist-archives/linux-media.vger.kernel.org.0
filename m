Return-Path: <linux-media+bounces-23057-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F169EB0E9
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 13:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19A71188C683
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 12:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92BE81A725C;
	Tue, 10 Dec 2024 12:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9xlXarJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7077B23DE98;
	Tue, 10 Dec 2024 12:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733834148; cv=none; b=iAYwRv55jgGcd2FnGcDypco8e1DKkIPk/nDpwvfWRO5w2DnjWg//VfyidQExzrCe+hKMAU0QTE4D5AXiFS8OAOBA1LXwGdIgZRpk0cQVImpoF7br5TbQLd5JvOGegE7X4xkmJDBtTbkjCLL2ke9pz/XMuU3qH25+T2bLKY+lxLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733834148; c=relaxed/simple;
	bh=7Psu0x3enpcD7yIPJ0wKAaBMSHHi4eUz22y/I2aELKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXlkctSU9YTqw4+mn0S1lSyPu0lWT5jcLSrwqFMAfwpzLTdKmkXKGEu+WSjm9FH7Fa4AspGL9CH+qX99gJ+/LfX35ONww4fYBfn5OuRNhb9+F9kUPe+ccNgubEPeqCKl/PmD5ic57ZcyrBTyge7h2UaNAqwqF9trF0fMrFTYPxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9xlXarJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733834146; x=1765370146;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7Psu0x3enpcD7yIPJ0wKAaBMSHHi4eUz22y/I2aELKs=;
  b=d9xlXarJAK6sNQjaPcCqxjFETUgzIPRF0tMgs5gbR8t6DDTAAE8kcs9p
   hEBf63AYLfz/ArwVp5ZSbJ5IZYlZxwoiVvDVwzgYbGn01onYoxQ6cJtx2
   GH7mjFbamwqxpVIzyoDYii/ljs0bfPqFgHEt0nwSpjxP2gciQamoRgVRG
   HSSgsfFZux/f4/c40s60u3iWj21qOOu9lTTGwmZZ8fhmuC1M8RS1Wyc01
   DRtPpv42R806Oeh0Zina9FylWkJlWUawVvUT22/FnoW8w8U/JIEWmYZ2F
   Uy9znC29R5bUyEanDp90URmHba0KckghIXXateVnV2/IPJs6CUKJZgFlu
   Q==;
X-CSE-ConnectionGUID: sxVA71DFQJeXJzS/6aV64w==
X-CSE-MsgGUID: 5GdaBGG8RFyKcsU00Gar7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="56655151"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="56655151"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 04:35:46 -0800
X-CSE-ConnectionGUID: pUqky3emT/+Cpey+W3mFmQ==
X-CSE-MsgGUID: 4JGFZDGWQq2MYpcHNcWaug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="100207306"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 04:35:43 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 3A44711F81D;
	Tue, 10 Dec 2024 14:35:41 +0200 (EET)
Date: Tue, 10 Dec 2024 12:35:41 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>
Subject: Re: [PATCH v3 06/12] media: i2c: imx214: Check number of lanes from
 device tree
Message-ID: <Z1g1neVF6CG7vfFF@kekkonen.localdomain>
References: <20241207-imx214-v3-0-ab60af7ee915@apitzsch.eu>
 <20241207-imx214-v3-6-ab60af7ee915@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241207-imx214-v3-6-ab60af7ee915@apitzsch.eu>

Hi André,

On Sat, Dec 07, 2024 at 09:47:55PM +0100, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> The imx214 camera is capable of either two-lane or four-lane operation.
> 
> Currently only the four-lane mode is supported, as proper pixel rates
> and link frequences for the two-lane mode are unknown.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 07926f7257877155548f7bcf0e7ee80037b4ce6c..f1c72db0775eaf4810f762e8798d301c5ad9923c 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -199,7 +199,6 @@ struct imx214 {
>  
>  /*From imx214_mode_tbls.h*/
>  static const struct cci_reg_sequence mode_4096x2304[] = {
> -	{ IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
>  	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>  	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>  	{ IMX214_REG_EXPOSURE_RATIO, 1 },
> @@ -272,7 +271,6 @@ static const struct cci_reg_sequence mode_4096x2304[] = {
>  };
>  
>  static const struct cci_reg_sequence mode_1920x1080[] = {
> -	{ IMX214_REG_CSI_LANE_MODE, IMX214_CSI_4_LANE_MODE },
>  	{ IMX214_REG_HDR_MODE, IMX214_HDR_MODE_OFF },
>  	{ IMX214_REG_HDR_RES_REDUCTION, IMX214_HDR_RES_REDU_THROUGH },
>  	{ IMX214_REG_EXPOSURE_RATIO, 1 },
> @@ -788,6 +786,13 @@ static int imx214_start_streaming(struct imx214 *imx214)
>  		return ret;
>  	}
>  
> +	ret = cci_write(imx214->regmap, IMX214_REG_CSI_LANE_MODE,
> +			IMX214_CSI_4_LANE_MODE, NULL);
> +	if (ret) {
> +		dev_err(imx214->dev, "%s failed to configure lanes\n", __func__);

You can drop the function name here.

> +		return ret;
> +	}
> +
>  	ret = cci_multi_reg_write(imx214->regmap, imx214->cur_mode->reg_table,
>  				  imx214->cur_mode->num_of_regs, NULL);
>  	if (ret < 0) {
> @@ -948,6 +953,13 @@ static int imx214_parse_fwnode(struct device *dev)
>  		goto done;
>  	}
>  
> +	/* Check the number of MIPI CSI2 data lanes */
> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 4) {
> +		ret = dev_err_probe(dev, -EINVAL,
> +				    "only 4 data lanes are currently supported\n");
> +		goto done;
> +	}
> +
>  	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++)
>  		if (bus_cfg.link_frequencies[i] == IMX214_DEFAULT_LINK_FREQ)
>  			break;
> 

-- 
Sakari Ailus

