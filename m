Return-Path: <linux-media+bounces-43709-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6B4BB6202
	for <lists+linux-media@lfdr.de>; Fri, 03 Oct 2025 09:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AB68B4E6750
	for <lists+linux-media@lfdr.de>; Fri,  3 Oct 2025 07:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A69A228CBC;
	Fri,  3 Oct 2025 07:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPlYBMjM"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECF5158DAC;
	Fri,  3 Oct 2025 07:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759475064; cv=none; b=CHfBh9sP80vFzZud/bLViqdWl7/ExP0ToOccWifXv71UiVTf0OFDr/WEFAy4K+cRQt8GVJTv71YBkfLc93vVf89oOHi3jqpwBJMLLb5/rb5NzwXPtRmw2xdnFaAeBiKutnoEor3E5fEa4t9KRniMw8px9EhyfVfpVdlNoBExzj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759475064; c=relaxed/simple;
	bh=LKhj0OA+zjMDWjybsyr4HohQ8bxE77BsEL62Ioho1Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k4+ojap+iH7B0dafLhfKkB+jIUFZK2S+HJzAXa0oFFzEZpgIZIHCsY5TGdQQ0RmIXnshMT4cNX7JBMRip64uk2JBHIoKz3Op+VmY26ytsKjBEbT8RM2cm3Z5dtCoLvpMMVKckuG7WugMKaHG5X45EnajM18uKIai52BAMW+QfHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPlYBMjM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759475063; x=1791011063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LKhj0OA+zjMDWjybsyr4HohQ8bxE77BsEL62Ioho1Uo=;
  b=MPlYBMjMwRBpjgraoPTxF/BaPF2t8OMU8D+1/wjlAI458UO5LzZubbR0
   CuPlpaKl7path8i32qpSXjR9IrNEeUD7moI5yaUfW+TOe6gdE3s5KSILc
   vxs11HEvWrz++hFOCAQko2/7uzVu+cUeOwO15Cpn7D6qpbF3bLTJ3D1Um
   m9xEu85OCgxShNS+YwCZt5MYSEQtE7aoz/WIeEUFPndjKvtOGxj4DG+1Q
   fxLgHv1GQCO2h3Czt1olv2NNpITWQQMbvgSOp9KrjIQCOve7n3ybBrqbv
   Eh2OI7PlWHF1+qb516Tba59KCUGUKB/okxdJWBt/YpsvRCVag43SuJGgs
   Q==;
X-CSE-ConnectionGUID: Syxi96T2QVa1LhRzFGJbnw==
X-CSE-MsgGUID: ykL87sHtQ8eHca6jsvtxYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="72861908"
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="72861908"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 00:04:21 -0700
X-CSE-ConnectionGUID: 2th5oiOfQK268i7sh60v4g==
X-CSE-MsgGUID: Z4V95aTfT7+ICcxDtYd6mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,311,1751266800"; 
   d="scan'208";a="179170648"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.72])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 00:04:18 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3EECE121186;
	Fri, 03 Oct 2025 10:04:15 +0300 (EEST)
Date: Fri, 3 Oct 2025 10:04:15 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Daniel Scally <djrscally@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] media: i2c: dw9719: Add DW9800K support
Message-ID: <aN91bwetQGrpj6of@kekkonen.localdomain>
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
 <20251002-dw9800-driver-v1-2-c305328e44f0@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002-dw9800-driver-v1-2-c305328e44f0@fairphone.com>

Hi Griffin,

Thank you for the set.

On Thu, Oct 02, 2025 at 12:15:34PM +0200, Griffin Kroah-Hartman wrote:
> The DW9800K is a similar part to the DW9719. The method for operation is
> the same as the DW9719, but the register set is different. Add support
> for this part to the existing dw9719 driver.
> 
> Tested on the Fairphone 5 smartphone.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  drivers/media/i2c/dw9719.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/media/i2c/dw9719.c b/drivers/media/i2c/dw9719.c
> index 3627e78b8b6668933c4ecd92231465ce4105ff0c..172479f2c9f63f6b2a1f6eccf8184142edb383b9 100644
> --- a/drivers/media/i2c/dw9719.c
> +++ b/drivers/media/i2c/dw9719.c
> @@ -68,6 +68,9 @@
>  #define DW9761_VCM_PRELOAD		CCI_REG8(8)
>  #define DW9761_DEFAULT_VCM_PRELOAD	0x73
>  
> +#define DW9800K_DEFAULT_SAC		1
> +#define DW9800K_MODE_SAC_SHIFT		6
> +#define DW9800K_DEFAULT_VCM_FREQ		0x10
>  
>  #define to_dw9719_device(x) container_of(x, struct dw9719_device, sd)
>  
> @@ -75,6 +78,7 @@ enum dw9719_model {
>  	DW9718S,
>  	DW9719,
>  	DW9761,
> +	DW9800K,
>  };
>  
>  struct dw9719_device {
> @@ -137,6 +141,12 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
>  			goto props;
>  		}
>  
> +		if (dw9719->model == DW9800K) {
> +			dw9719->sac_mode = DW9800K_DEFAULT_SAC;
> +			dw9719->vcm_freq = DW9800K_DEFAULT_VCM_FREQ;
> +			goto props;
> +		}

How about using switch() instead?

> +
>  		ret = cci_read(dw9719->regmap, DW9719_INFO, &val, NULL);
>  		if (ret < 0)
>  			return ret;
> @@ -177,6 +187,12 @@ static int dw9719_power_up(struct dw9719_device *dw9719, bool detect)
>  	}
>  
>  	switch (dw9719->model) {
> +	case DW9800K:
> +		cci_write(dw9719->regmap, DW9719_CONTROL, DW9719_ENABLE_RINGING, &ret);
> +		cci_write(dw9719->regmap, DW9719_MODE,
> +				  dw9719->sac_mode << DW9800K_MODE_SAC_SHIFT, &ret);

Indentation.

> +		cci_write(dw9719->regmap, DW9719_VCM_FREQ, dw9719->vcm_freq, &ret);
> +		break;
>  	case DW9718S:
>  		/* Datasheet says [OCP/UVLO] should be disabled below 2.5V */
>  		dw9719->sac_mode &= DW9718S_CONTROL_SAC_MASK;
> @@ -426,6 +442,7 @@ static const struct of_device_id dw9719_of_table[] = {
>  	{ .compatible = "dongwoon,dw9718s", .data = (const void *)DW9718S },
>  	{ .compatible = "dongwoon,dw9719", .data = (const void *)DW9719 },
>  	{ .compatible = "dongwoon,dw9761", .data = (const void *)DW9761 },
> +	{ .compatible = "dongwoon,dw9800k", .data = (const void *)DW9800K },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, dw9719_of_table);
> 

-- 
Regards,

Sakari Ailus

