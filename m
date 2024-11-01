Return-Path: <linux-media+bounces-20667-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D4F9B8CA7
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 09:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64726B21FAA
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 08:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2DB156968;
	Fri,  1 Nov 2024 08:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nco7pHNy"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E61715531A;
	Fri,  1 Nov 2024 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730448517; cv=none; b=UVxIV9qX5jiB5MTg/XSEW18taSy5QZGL6w7+HTiCFCCVunH0kpqr7RWt5hxDKOzoTSX+RMxOON6/hrN5CuBThRdRjcNURTiLHXPu/ngBW4JNECMwzyANdCkdMo1Or1RaSZA5r5Xl5fFmyH9EFosR2k5w3BQvCouHlst9MRcnoqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730448517; c=relaxed/simple;
	bh=PWykbg1w3A80eKkwEXxVoNvWAUdPzbmblHOAfS91HEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TALpSXz+ukflKyzPJ3vj4EHvaH6HFsT19sVpoJZS4zQq1HTRS9Ge+vXdXEH9r7xsDecwrTzsLG5qW+SwT9QLXIogY4KI2q5RC4mJBiGjlu2I71pQvyrGqGBj1yNNsgQLoTjdVw/qv7mHuBIS85vS2FL5sMWXcmvmrsz4Cl8p84A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nco7pHNy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730448516; x=1761984516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PWykbg1w3A80eKkwEXxVoNvWAUdPzbmblHOAfS91HEQ=;
  b=nco7pHNyMOuOQxgnvbcQguu0FSoVsZZLOMaMt8RbF4sWzD/NTg3EFpVA
   4ghnHYShQGC1my6GS6JSEfOJjZ4pLNKJtZ/Bbl+a3ElGdp6z/V46HGCzY
   puK+ztISl5I+Z/T/0uyu7Ziuf3GboLHMN+Zh5K+jywf6tzJkZRYS08DTy
   yIp0JNubK95Q6ZepdZkSmhzq3s6SRrUXcfnZx6ADK+t2Vh2K8AudTDUHB
   k2+j5qWx0jmVr0zUgJNeFr3UpOsIqzLGCtz9ZYyKPxFcdwvaBfQpcshM+
   buH2aUZx0k+s0yq5X4sc6WXBH5x3JBZlzqMSbU/FzIvzNpbUeP9x+PYf3
   A==;
X-CSE-ConnectionGUID: rMCbxOMVTLOXwSXqSpG00w==
X-CSE-MsgGUID: /W1rKyj/TsSgMGkIQie/OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="33044792"
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="33044792"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:08:35 -0700
X-CSE-ConnectionGUID: XOj9jkV1Qx+/prjKI6wiwA==
X-CSE-MsgGUID: DfcZ98QlTOCqNwcVqyAHYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="120355505"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 01:08:32 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A247611FA28;
	Fri,  1 Nov 2024 10:08:29 +0200 (EET)
Date: Fri, 1 Nov 2024 08:08:29 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: mchehab@kernel.org, ming.qian@nxp.com, eagle.zhou@nxp.com,
	stanimir.k.varbanov@gmail.com, quic_vgarodia@quicinc.com,
	bryan.odonoghue@linaro.org, hans.verkuil@cisco.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] media: i2c: dw9768: Fix pm_runtime_set_suspended()
 with runtime pm enabled
Message-ID: <ZySMfQAJ-NkYmUoP@kekkonen.localdomain>
References: <20240923035115.3008900-1-ruanjinjie@huawei.com>
 <20240923035115.3008900-2-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923035115.3008900-2-ruanjinjie@huawei.com>

Hi Jinjie,

Thanks for the patch.

On Mon, Sep 23, 2024 at 11:51:13AM +0800, Jinjie Ruan wrote:
> It is not valid to call pm_runtime_set_suspended() and
> pm_runtime_set_active() for devices with runtime PM enabled because it
> returns -EAGAIN if it is enabled already and working. So, adjust the
> order to fix it.
> 
> Fixes: 5f9a089b6de3 ("dw9768: Enable low-power probe on ACPI")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/media/i2c/dw9768.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/dw9768.c b/drivers/media/i2c/dw9768.c
> index 18ef2b35c9aa..61db1e8d2727 100644
> --- a/drivers/media/i2c/dw9768.c
> +++ b/drivers/media/i2c/dw9768.c
> @@ -471,7 +471,6 @@ static int dw9768_probe(struct i2c_client *client)
>  	 * to be powered on in an ACPI system. Similarly for power off in
>  	 * remove.
>  	 */
> -	pm_runtime_enable(dev);
>  	full_power = (is_acpi_node(dev_fwnode(dev)) &&
>  		      acpi_dev_state_d0(dev)) ||
>  		     (is_of_node(dev_fwnode(dev)) && !pm_runtime_enabled(dev));

pm_runtime_enabled() should be replaced by IS_ENABLED(CONFIG_PM) here.

> @@ -484,6 +483,7 @@ static int dw9768_probe(struct i2c_client *client)
>  		pm_runtime_set_active(dev);
>  	}
>  
> +	pm_runtime_enable(dev);
>  	ret = v4l2_async_register_subdev(&dw9768->sd);
>  	if (ret < 0) {
>  		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> @@ -495,12 +495,12 @@ static int dw9768_probe(struct i2c_client *client)
>  	return 0;
>  
>  err_power_off:
> +	pm_runtime_disable(dev);
>  	if (full_power) {
>  		dw9768_runtime_suspend(dev);
>  		pm_runtime_set_suspended(dev);
>  	}
>  err_clean_entity:
> -	pm_runtime_disable(dev);
>  	media_entity_cleanup(&dw9768->sd.entity);
>  err_free_handler:
>  	v4l2_ctrl_handler_free(&dw9768->ctrls);
> @@ -517,12 +517,12 @@ static void dw9768_remove(struct i2c_client *client)
>  	v4l2_async_unregister_subdev(&dw9768->sd);
>  	v4l2_ctrl_handler_free(&dw9768->ctrls);
>  	media_entity_cleanup(&dw9768->sd.entity);
> +	pm_runtime_disable(dev);
>  	if ((is_acpi_node(dev_fwnode(dev)) && acpi_dev_state_d0(dev)) ||
>  	    (is_of_node(dev_fwnode(dev)) && !pm_runtime_enabled(dev))) {

And similarly here. The patch seems fine with that change.

>  		dw9768_runtime_suspend(dev);
>  		pm_runtime_set_suspended(dev);
>  	}
> -	pm_runtime_disable(dev);
>  }
>  
>  static const struct of_device_id dw9768_of_table[] = {

-- 
Kind regards,

Sakari Ailus

