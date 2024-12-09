Return-Path: <linux-media+bounces-22863-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 867789E8E71
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 10:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BB951885B25
	for <lists+linux-media@lfdr.de>; Mon,  9 Dec 2024 09:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9494C215F48;
	Mon,  9 Dec 2024 09:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jsufn80h"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417FA1BC4E;
	Mon,  9 Dec 2024 09:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733735491; cv=none; b=Y2UHgc9hUfzpMUYH7frLB5hfwMF0a4kjdYQw2aK7/n3xHINaacLbbg3uGEnKZZgThcaODDaMRSkgMGTwvHMJ1pj6pj4pqZHJBfu1oUZGRdRdfOj5PCnjbzL8yfwITtAbd9TSq+lalUIaKJDPwQ17Nd1NDN9NuPuH9djvqJu8nvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733735491; c=relaxed/simple;
	bh=H9L0MHhjjhm0zhl+c8rdRcjDV9gB1mSiunea67/jqFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHnkKAcFevDqVFL8ouef59DaauhV/hnMlyigetR0/rBKDwH8NO2Lg3f4WAXqtF3WmSC3iQDLTGwueoUe8KmMQDNj0aQuUFYOqMUuOIXmsIr2vpVgfyO2BuvYvaMwNqe9o0DUy4oitZlF2EUqHOzwVM5V9An5BEiXPYmbMuCp4f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jsufn80h; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733735489; x=1765271489;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H9L0MHhjjhm0zhl+c8rdRcjDV9gB1mSiunea67/jqFA=;
  b=Jsufn80hZAcaKckobUhfEoxFoFplD9ZRhd2Zrg3Jf5EW8KFc5+8T4OuC
   hevBAE+CSVWifV8wLF+C5crAGzelOY/XrhlIKYU/Gx3WQEEkgo8i3ML3p
   /AYKXQb89i7lTpB7m0fdhk52BuKKPQk1TI4SbtCWK2+WKRINfxPsCYniT
   vkJ+drhhQAYHjlV0K4gSd6WcIQLXLDdPRYB6Pv3FhdVsAaRzgSgrmaq9d
   7Td7mwF6Ih7cIZDUqPok7YrePlLMtBNvyxRimJp3VBuoH49GQD5qI1B8K
   JFY7xSUG5znxBGmQOjNqsOpmyFjPmjmsgMLbRcwg9lsCLRx5tc0h0bGjE
   Q==;
X-CSE-ConnectionGUID: xDS5EjrjQoW2AACTUGq0Lw==
X-CSE-MsgGUID: by6Gva6uSi256nnMETt3ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34081172"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34081172"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 01:11:27 -0800
X-CSE-ConnectionGUID: /zk0q9kDRNm9IvVDN0OIkg==
X-CSE-MsgGUID: MpLYHR0FSAypxk0ggc25qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95211991"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 01:11:25 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 03E4111F775;
	Mon,  9 Dec 2024 11:11:23 +0200 (EET)
Date: Mon, 9 Dec 2024 09:11:22 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 04/15] media: i2c: ds90ub960: Fix logging SP & EQ
 status only for UB9702
Message-ID: <Z1a0OiRDw92o1w6_@kekkonen.localdomain>
References: <20241206-ub9xx-fixes-v4-0-466786eec7cc@ideasonboard.com>
 <20241206-ub9xx-fixes-v4-4-466786eec7cc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-ub9xx-fixes-v4-4-466786eec7cc@ideasonboard.com>

Huomenta,

On Fri, Dec 06, 2024 at 10:26:40AM +0200, Tomi Valkeinen wrote:
> UB9702 does not have SP and EQ registers, but the driver uses them in
> log_status(). Fix this by separating the SP and EQ related log_status()
> work into a separate function (for clarity) and calling that function
> only for UB960.
> 
> Cc: stable@vger.kernel.org
> Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
> Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/i2c/ds90ub960.c | 90 ++++++++++++++++++++++++-------------------
>  1 file changed, 50 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 24198b803eff..94c8acf171b4 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -2950,6 +2950,54 @@ static const struct v4l2_subdev_pad_ops ub960_pad_ops = {
>  	.set_fmt = ub960_set_fmt,
>  };
>  
> +static void ub960_log_status_ub960_sp_eq(struct ub960_data *priv,
> +					 unsigned int nport)
> +{
> +	struct device *dev = &priv->client->dev;
> +	u8 eq_level;
> +	s8 strobe_pos;
> +	u8 v = 0;
> +
> +	/* Strobe */
> +
> +	ub960_read(priv, UB960_XR_AEQ_CTL1, &v);

How about adding __must_check to the ub960_read()?

> +
> +	dev_info(dev, "\t%s strobe\n",
> +		 (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) ? "Adaptive" :
> +							  "Manual");
> +
> +	if (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) {
> +		ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
> +
> +		dev_info(dev, "\tStrobe range [%d, %d]\n",
> +			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) - 7,
> +			 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT) & 0xf) - 7);
> +	}
> +
> +	ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
> +
> +	dev_info(dev, "\tStrobe pos %d\n", strobe_pos);
> +
> +	/* EQ */
> +
> +	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
> +
> +	dev_info(dev, "\t%s EQ\n",
> +		 (v & UB960_RR_AEQ_BYPASS_ENABLE) ? "Manual" :
> +						    "Adaptive");
> +
> +	if (!(v & UB960_RR_AEQ_BYPASS_ENABLE)) {
> +		ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
> +
> +		dev_info(dev, "\tEQ range [%u, %u]\n",
> +			 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) & 0xf,
> +			 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT) & 0xf);
> +	}
> +
> +	if (ub960_rxport_get_eq_level(priv, nport, &eq_level) == 0)
> +		dev_info(dev, "\tEQ level %u\n", eq_level);
> +}
> +
>  static int ub960_log_status(struct v4l2_subdev *sd)
>  {
>  	struct ub960_data *priv = sd_to_ub960(sd);
> @@ -2997,8 +3045,6 @@ static int ub960_log_status(struct v4l2_subdev *sd)
>  
>  	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
>  		struct ub960_rxport *rxport = priv->rxports[nport];
> -		u8 eq_level;
> -		s8 strobe_pos;
>  		unsigned int i;
>  
>  		dev_info(dev, "RX %u\n", nport);
> @@ -3034,44 +3080,8 @@ static int ub960_log_status(struct v4l2_subdev *sd)
>  		ub960_rxport_read(priv, nport, UB960_RR_CSI_ERR_COUNTER, &v);
>  		dev_info(dev, "\tcsi_err_counter %u\n", v);
>  
> -		/* Strobe */
> -
> -		ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
> -
> -		dev_info(dev, "\t%s strobe\n",
> -			 (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) ? "Adaptive" :
> -								  "Manual");
> -
> -		if (v & UB960_XR_AEQ_CTL1_AEQ_SFILTER_EN) {
> -			ub960_read(priv, UB960_XR_SFILTER_CFG, &v);
> -
> -			dev_info(dev, "\tStrobe range [%d, %d]\n",
> -				 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) & 0xf) - 7,
> -				 ((v >> UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT) & 0xf) - 7);
> -		}
> -
> -		ub960_rxport_get_strobe_pos(priv, nport, &strobe_pos);
> -
> -		dev_info(dev, "\tStrobe pos %d\n", strobe_pos);
> -
> -		/* EQ */
> -
> -		ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
> -
> -		dev_info(dev, "\t%s EQ\n",
> -			 (v & UB960_RR_AEQ_BYPASS_ENABLE) ? "Manual" :
> -							    "Adaptive");
> -
> -		if (!(v & UB960_RR_AEQ_BYPASS_ENABLE)) {
> -			ub960_rxport_read(priv, nport, UB960_RR_AEQ_MIN_MAX, &v);
> -
> -			dev_info(dev, "\tEQ range [%u, %u]\n",
> -				 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_FLOOR_SHIFT) & 0xf,
> -				 (v >> UB960_RR_AEQ_MIN_MAX_AEQ_MAX_SHIFT) & 0xf);
> -		}
> -
> -		if (ub960_rxport_get_eq_level(priv, nport, &eq_level) == 0)
> -			dev_info(dev, "\tEQ level %u\n", eq_level);
> +		if (!priv->hw_data->is_ub9702)
> +			ub960_log_status_ub960_sp_eq(priv, nport);
>  
>  		/* GPIOs */
>  		for (i = 0; i < UB960_NUM_BC_GPIOS; i++) {
> 

-- 
Terveisin,

Sakari Ailus

