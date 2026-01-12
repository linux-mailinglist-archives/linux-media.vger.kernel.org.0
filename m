Return-Path: <linux-media+bounces-50443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3000FD12281
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 12:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35DCE30D5A14
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 11:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A830350D4B;
	Mon, 12 Jan 2026 11:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R4ZhjcUw"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A00B352C50;
	Mon, 12 Jan 2026 11:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215607; cv=none; b=VwTvCyPAcswWh4C2q0IRyFfWTyHEH4Qs1M9QD4HYpLp4SBtuFyU8ejKUh2Zq5wpaODxhQ10Im9bn7i2S6JQZsLhMisYdS95sTd291qv1kwULXqIqdYBHD5AjZx5GGk20bGB2MSZuQ7RlfgGolFhQZdGT5hjnalgaN6WIlob+khQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215607; c=relaxed/simple;
	bh=66BKk/4ygt6/qommiW1LbYtM+Gz37jh1jetETCOXjX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJ5WwM7bHYI3U7untifz28Kyg8m9hKAIvuh1kzLK5YdrNsllWcKo9O54FreR75gf1uo7Wnvmtac0Ym7JOhCiVDjVwSpTLg/8oBmP5jXYNLWhpWFolHsnSvalJ2ovw2ANtaUq4pyNebBgVK/SEqsHd9c5Ej4BR/M0iUVkagTm8Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R4ZhjcUw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768215605; x=1799751605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=66BKk/4ygt6/qommiW1LbYtM+Gz37jh1jetETCOXjX4=;
  b=R4ZhjcUwLM4+gQugC+s4YmLMUFdbFxCoYsIl49d89VMc0EO1kMBWhjjt
   aPNA+F0JIM/BsrlyeVkFb8gQqoLHOlnkhI+eklot5tb+C5UfpuZ+hVsAT
   DOu/LLBMyTd+VAnBeVKWpNyk9TKnWZgyrWSbaoX2pyVIVXVNAM71heNix
   lr2D9Yt1OalU9PowgVi+KITPjW72Mvn1IKJJf163XtppgWVUDJ4kAOUjr
   DhE8JX8cIqutVh+CTDk99y7ewZtK7leDahX2Plyxabod2EJoVKaB7w3ac
   E0DaYFLf2L8MCyfeabGLw0tLwbdNPU0bF13K5+Mj2BUZ+C8MIeHmWg7iv
   w==;
X-CSE-ConnectionGUID: xtZICmlETK2stbTTAXmSPg==
X-CSE-MsgGUID: Mq1MjyL1QmaXkn1gvDhSkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69471585"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69471585"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:00:05 -0800
X-CSE-ConnectionGUID: zU0uUBbaSD+i1HG6/RAbwA==
X-CSE-MsgGUID: swhQPFCPQpeLCiXWg3TI3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204079907"
Received: from zzombora-mobl1 (HELO kekkonen.fi.intel.com) ([10.245.245.52])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 03:00:03 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 570E41229EA;
	Mon, 12 Jan 2026 13:00:00 +0200 (EET)
Date: Mon, 12 Jan 2026 13:00:00 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Karthikey D Kadati <karthikey3608@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: remove private white balance IOCTLs
Message-ID: <aWTUMPVMzxL7XuHt@kekkonen.localdomain>
References: <20251231052427.58840-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231052427.58840-1-karthikey3608@gmail.com>

Hi Karthikey,

On Wed, Dec 31, 2025 at 10:54:27AM +0530, Karthikey D Kadati wrote:
> This patch resolves a MUST-FIX graduation blocker identified in the
> atomisp TODO by removing the private ATOMISP_IOC_G_ISP_WHITE_BALANCE
> and ATOMISP_IOC_S_ISP_WHITE_BALANCE and replacing them with standard
> V4L2 control handling.
> 
> The private IOCTLs were used to set white balance parameters. This
> functionality is now mapped to the standard V4L2 controls
> V4L2_CID_RED_BALANCE and V4L2_CID_BLUE_BALANCE.
> 
> A helper function `atomisp_v4l2_set_wb` is introduced to translate the
> V4L2 control values to the driver's internal configuration format.
> 
> Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
> ---
>  .../media/atomisp/include/linux/atomisp.h     |  5 +-
>  .../staging/media/atomisp/pci/atomisp_ioctl.c | 49 ++++++++++++++++---
>  2 files changed, 44 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
> index 3c8fa3f58..fcf116cc4 100644
> --- a/drivers/staging/media/atomisp/include/linux/atomisp.h
> +++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
> @@ -741,10 +741,7 @@ enum atomisp_burst_capture_options {
>  	_IOW('v', BASE_VIDIOC_PRIVATE + 15, struct atomisp_ctc_table)
>  
>  /* white balance Correction */
> -#define ATOMISP_IOC_G_ISP_WHITE_BALANCE \
> -	_IOR('v', BASE_VIDIOC_PRIVATE + 16, struct atomisp_wb_config)
> -#define ATOMISP_IOC_S_ISP_WHITE_BALANCE \
> -	_IOW('v', BASE_VIDIOC_PRIVATE + 16, struct atomisp_wb_config)
> +
>  
>  /* fpn table loading */
>  #define ATOMISP_IOC_S_ISP_FPN_TABLE \
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> index bb8b2f221..5c0a1d92b 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
> @@ -1083,6 +1083,38 @@ static int atomisp_g_ctrl(struct file *file, void *fh,
>   * applications initialize the id and value fields of a struct v4l2_control
>   * and call this ioctl.
>   */
> +static int atomisp_v4l2_set_wb(struct atomisp_sub_device *asd, int id,
> +			       int value)
> +{
> +	struct atomisp_device *isp = asd->isp;
> +	struct atomisp_wb_config config;
> +	int ret;
> +
> +	if (atomisp_css_get_wb_config(asd, &config)) {

I'm not sure this makes sense. How will the caller know the value of
integer_bits?

I'd think the IOCTL interface of this driver should probably be largely
removed, to be replaced by the parameter buffer.

> +		dev_err(isp->dev, "%s: can't get wb config\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	switch (id) {
> +	case V4L2_CID_BLUE_BALANCE:
> +		config.b = value << (16 - 8 - config.integer_bits + 1);
> +		break;
> +	case V4L2_CID_RED_BALANCE:
> +		config.r = value << (16 - 8 - config.integer_bits + 1);
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret = atomisp_white_balance_param(asd, 1, &config);
> +	if (ret) {
> +		dev_err(isp->dev, "%s: set wb config failed\n", __func__);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int atomisp_s_ctrl(struct file *file, void *fh,
>  			  struct v4l2_control *control)
>  {
> @@ -1122,6 +1154,17 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
>  	case V4L2_CID_ATOMISP_LOW_LIGHT:
>  		ret = atomisp_low_light(asd, 1, &control->value);
>  		break;
> +	case V4L2_CID_AUTO_WHITE_BALANCE:
> +		/*
> +		 * TODO: Auto White Balance is not supported yet.
> +		 * It is currently handled by the ISP.
> +		 */
> +		ret = 0;
> +		break;
> +	case V4L2_CID_RED_BALANCE:
> +	case V4L2_CID_BLUE_BALANCE:
> +		ret = atomisp_v4l2_set_wb(asd, control->id, control->value);
> +		break;
>  	default:
>  		ret = -EINVAL;
>  		break;
> @@ -1484,13 +1527,7 @@ static long atomisp_vidioc_default(struct file *file, void *fh,
>  		err = atomisp_ctc(asd, 1, arg);
>  		break;
>  
> -	case ATOMISP_IOC_G_ISP_WHITE_BALANCE:
> -		err = atomisp_white_balance_param(asd, 0, arg);
> -		break;
>  
> -	case ATOMISP_IOC_S_ISP_WHITE_BALANCE:
> -		err = atomisp_white_balance_param(asd, 1, arg);
> -		break;
>  
>  	case ATOMISP_IOC_G_3A_CONFIG:
>  		err = atomisp_3a_config_param(asd, 0, arg);

-- 
Regards,

Sakari Ailus

