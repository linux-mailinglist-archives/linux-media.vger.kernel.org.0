Return-Path: <linux-media+bounces-31717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E66AA96EB
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 17:06:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 342C016CE38
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 15:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051D225CC62;
	Mon,  5 May 2025 15:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvsqW2+3"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEB112B71;
	Mon,  5 May 2025 15:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746457556; cv=none; b=My2Ts2ToMfhxpGNL4h5kzOz4VggXGqUbZ5ZOiyZn67eeBAHCZVDfjVCHYgtt2aDcyTDD7ly+MIF7EVzRiOBmJf1CJLBQjJuct7oeiI11TBIEX4bXgl6qi6t/Hf2mnIP1FR5K5ZP2m+0aIhtwPgo8/5iPANM238WzLI0dSx++/yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746457556; c=relaxed/simple;
	bh=jUqE+rWdlx5yWsXqRDq6euy6P163bhljbpfsqPDAtso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5W2p101yV9Z95wrAxkAE3POlzoHHGOhe6mdMIoNMzti2bPOqzGjro+c3n3m6/3FMLfALuNAe6VorX32D3c1+fW2mtgaucmhJ69aeDRMxGUMxsdNDZPWj3EnPT97+ManHSxv7HL0J6xmC6ewSfgDtUUQrZBFmigKVoDJZLqodeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvsqW2+3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746457555; x=1777993555;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jUqE+rWdlx5yWsXqRDq6euy6P163bhljbpfsqPDAtso=;
  b=dvsqW2+3zvPiiSP7WVxmmGNTufgPE//6B0O1ov3JmcshYZezztWWjCwM
   DYwHyla+OT8Ryhn7f9/XfqZIiI0qFn8+lV++YM+PoQUWgA2jKlyiXIHb8
   ZvYVMqlHxkyOdru68nc6JL+gisM1oIqNd0U4InOS69ImSICMUi70fhfgP
   tSCcVFACenTlbwCEFk8T2VCscFPKs3U0RcxsBVl7QC5RZfndu1u0w+niP
   KAz6gLzUt2b9yHoEJ73hppl+TS4b481qe6inUb4SYKOHAOD1A8F595btQ
   sr74OsV6KjINZyYu34oHBt7Z5bXnOhDvZH3MpVF5wcGuCKThdyHs/WQbW
   Q==;
X-CSE-ConnectionGUID: yl6NNIZjSYGDnQrccW4S1A==
X-CSE-MsgGUID: DMc+QIjPTKekj5rTISOihQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="47333195"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="47333195"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 08:05:54 -0700
X-CSE-ConnectionGUID: pIPKQOnOR/mj7ZkvZQs+OQ==
X-CSE-MsgGUID: ymkni0vAS76u4wqSGOWj6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="135255443"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.252])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 08:05:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id D259911FB1F;
	Mon,  5 May 2025 18:05:49 +0300 (EEST)
Date: Mon, 5 May 2025 15:05:49 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: git@apitzsch.eu
Cc: Ricardo Ribalda <ribalda@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] media: i2c: imx214: Read clock frequency from device
 tree
Message-ID: <aBjTzbrYXHV_ztA3@kekkonen.localdomain>
References: <20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@apitzsch.eu>
 <20250415-imx214_ccs_pll-v1-4-d3d7748e5fbd@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250415-imx214_ccs_pll-v1-4-d3d7748e5fbd@apitzsch.eu>

Hi André,

On Tue, Apr 15, 2025 at 11:22:18PM +0200, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> Replace the hard coded external clock frequency by the one read from
> device tree.
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---
>  drivers/media/i2c/imx214.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 5589228d2b44417c0dbf15a6a17fd8f954f1a2bc..6d7f05073aa9ffb054d454771ce22e3141af60e8 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1388,6 +1388,7 @@ static int imx214_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct imx214 *imx214;
> +	u32 xclk_freq;
>  	int ret;
>  
>  	imx214 = devm_kzalloc(dev, sizeof(*imx214), GFP_KERNEL);
> @@ -1401,7 +1402,14 @@ static int imx214_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(imx214->xclk),
>  				     "failed to get xclk\n");
>  
> -	ret = clk_set_rate(imx214->xclk, IMX214_DEFAULT_CLK_FREQ);
> +	ret = device_property_read_u32(dev, "clock-frequency", &xclk_freq);
> +	if (ret) {
> +		dev_warn(dev,
> +			 "clock-frequency not set, please review your DT. Fallback to default\n");
> +		xclk_freq = IMX214_DEFAULT_CLK_FREQ;
> +	}
> +
> +	ret = clk_set_rate(imx214->xclk, xclk_freq);

Please instead rely on the rate set on the clock (using
assigned-clock-rates etc.). See how other drivers do this. Essentially,
"clock-frequency" is only relevant for ancient systems and ACPI today.

<URL:https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html>

>  	if (ret)
>  		return dev_err_probe(dev, ret,
>  				     "failed to set xclk frequency\n");
> 

-- 
Kind regards,

Sakari Ailus

