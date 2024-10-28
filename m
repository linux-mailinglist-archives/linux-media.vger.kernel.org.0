Return-Path: <linux-media+bounces-20407-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 892269B2BBC
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 10:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3544A1F2309A
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 09:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4F51B6547;
	Mon, 28 Oct 2024 09:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fTXHqGwu"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28586192D64;
	Mon, 28 Oct 2024 09:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730108665; cv=none; b=ZHq/+mW+zYDORH1gpRPj9xiwO2nnsgIe0yDYHMbOX/7BsznCbbLyKq5pWnCoSkiGV2idomWbhYLj0YhO7JFxopSPdz/e/pUOmCHBxj8+QHQxpEhtE6nMeiX1sqfVb06E26SnAeiCYhxXwvrfbbagcTz+25e5QrVp8D20Ntu819o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730108665; c=relaxed/simple;
	bh=uWBMLZIPYFIK7BsWSgF/Si/PP3ai3yapy1mWecjTsws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEFFuxwM8rgQRwR3X/U814wecRt/A6dBo8UVHBAxvNb6IZh2n6yzFKPAv6ePrQGfmEbYXyV76Gi5MtrW+UyZarXAH/Qz/9VqiGIOlz9kiU7IwmHR0/AdG0aZ+3qQhdTg3AOD6/ZYw+GHY5ErYGO5a614kldWMG+A8reEb1McL2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fTXHqGwu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730108663; x=1761644663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uWBMLZIPYFIK7BsWSgF/Si/PP3ai3yapy1mWecjTsws=;
  b=fTXHqGwu+57kJ4Wu5wUZbjz18ncOtqwbW4gxrtWjoUyltF45JdOdU2PT
   xf/yDSwUcJW2I5m7pdZiDRwCA9ikNDdzzKODildB/syHfUTunQLTSp30U
   RTTRfxoeJPN/69wIE1KFkM1UiSeIHjAv0Nb5ttrnt5YEYzJKuuHfSxZK0
   Lc0Zhpb3R2AE6p6MganuqchMORcuP2zTnTfYyRKnGP7yJC2U+GEngi0un
   ISWw5cDHw7UMf9/2/bpH3uAUJEm3VV6eJJvE4DHcO7abDCPsCgjsxapDE
   OADIiZKkJvQHeY5N+gKVvLZToHUAk+olOH2mPtgQJs9yzYkRGnKXnNRxv
   Q==;
X-CSE-ConnectionGUID: Fp+OARsZTmC0NLitxmRe5Q==
X-CSE-MsgGUID: u5fETH8OQrC5TTdvXXIFZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29887889"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29887889"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 02:44:23 -0700
X-CSE-ConnectionGUID: jyJWlb0hQAmeAxwsJRM8xw==
X-CSE-MsgGUID: qvz5HfdbQbOC/xt7kybhaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="81666335"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 02:44:21 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CD13911FB46;
	Mon, 28 Oct 2024 11:44:18 +0200 (EET)
Date: Mon, 28 Oct 2024 09:44:18 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: laurent.pinchart@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: mt9p031: Refactor format handling for
 different sensor models
Message-ID: <Zx9c8gvmy_nY5l7e@kekkonen.localdomain>
References: <20241025221638.127457-1-tarang.raval@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025221638.127457-1-tarang.raval@siliconsignals.io>

Hi Tarang,

On Sat, Oct 26, 2024 at 03:45:40AM +0530, Tarang Raval wrote:
> Add new structure 'mt9p031_model_info' to encapsulate format codes for
> the mt9p031 camera sensor family. This approach enhances code clarity
> and maintainability.
> 
> Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
> ---
>  drivers/media/i2c/mt9p031.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index f2f52f484044..3576d3066738 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -112,6 +112,24 @@
>  #define MT9P031_TEST_PATTERN_RED			0xa2
>  #define MT9P031_TEST_PATTERN_BLUE			0xa3
>  
> +struct mt9p031_model_info {
> +	u32 code;
> +};
> +
> +enum mt9p031_model {
> +	MT9P031_MODEL_BAYER,
> +	MT9P031_MODEL_MONO,
> +};
> +
> +static const struct mt9p031_model_info mt9p031_models[] = {
> +	[MT9P031_MODEL_BAYER] = {
> +		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
> +	},
> +	[MT9P031_MODEL_MONO] = {
> +		.code = MEDIA_BUS_FMT_Y12_1X12,
> +	},
> +};
> +
>  struct mt9p031 {
>  	struct v4l2_subdev subdev;
>  	struct media_pad pad;
> @@ -1209,9 +1227,16 @@ static void mt9p031_remove(struct i2c_client *client)
>  }
>  
>  static const struct of_device_id mt9p031_of_match[] = {
> -	{ .compatible = "aptina,mt9p006", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> -	{ .compatible = "aptina,mt9p031", .data = (void *)MEDIA_BUS_FMT_SGRBG12_1X12 },
> -	{ .compatible = "aptina,mt9p031m", .data = (void *)MEDIA_BUS_FMT_Y12_1X12 },
> +	{
> +		.compatible = "aptina,mt9p006",
> +		.data = &mt9p031_models[MT9P031_MODEL_BAYER]
> +	}, {
> +		.compatible = "aptina,mt9p031",
> +		.data = &mt9p031_models[MT9P031_MODEL_BAYER]
> +	}, {
> +		.compatible = "aptina,mt9p031m",
> +		.data = &mt9p031_models[MT9P031_MODEL_MONO]

Instead using an index into an array, could you add structs for describing
both separately? See e.g. drivers/media/i2c/ccs/ccs-core.c for an example.

> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, mt9p031_of_match);

-- 
Kind regards,

Sakari Ailus

