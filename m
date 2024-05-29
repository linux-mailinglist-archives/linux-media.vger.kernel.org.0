Return-Path: <linux-media+bounces-12135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 085F68D2CDC
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 08:05:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9ABBB1F26E2C
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 06:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E519F15CD7F;
	Wed, 29 May 2024 06:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m3GVTvxe"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AA915CD41
	for <linux-media@vger.kernel.org>; Wed, 29 May 2024 06:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716962696; cv=none; b=htZHn+lTP/rYDwRzfXvE7d1esJiCdefEyzCyncf6Q178JQXDQAFQLil743vx8YoE0E0ZxZWsPxROMtXWKtPIydWBSlmq+8vW2ObtVebHA/fGKA4fDKPFP670tHkXreLUNyrBLSXWsQRa3AKQlN4ZfS+vC+GyLFGxzOfaCnqqWqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716962696; c=relaxed/simple;
	bh=FpNmGV/HXxbh1YSfH1cfKb9wfDWQ7c+WTI6wgsq5+TE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/zwjFIt74YoRxCHYWo2P2W0ZPlX4gqPKS5zEYd5JGWDycK9Z+7OKAwtbM5nNr0EAbdj8E/BjowB0okFqALSY0wsPQku6UdyKdhrVcFGXaWJNoGVdzmKNqqc9B1DqxqB2fn7QI8YJasmMe11W3Z+kJn0OWJ+qL4eFeuVCN4vcoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m3GVTvxe; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716962695; x=1748498695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FpNmGV/HXxbh1YSfH1cfKb9wfDWQ7c+WTI6wgsq5+TE=;
  b=m3GVTvxe8Qd5n0BpvTkoWzL5xP+No5357a7mCliPA9ZN4IgyM6AMoYaJ
   fWBKdlJz2omtrG27kFPzeJxVemR4cOvh5KVR/kQv5jWsSQFOqDKihp//c
   mcgjCuqnKl2ou+BnbnLC3Rm7MZDEdECT7g+tHF6QpnpVbQ4xNJB9yUAX/
   6Jt35EFXPkTIkOEXsqMlJ+l6BA6rdpGmsAScYto9s9vQ9NO19Q4vE8Phf
   1w+xFnOlRjUWCaNa29CsM/6QeqzBra0NuRnlTgmRVJKfXbFlbeki1i1ZJ
   x6MEV0DdN1riCSlNEkhb0nx2aqPX+mGQZqSmpi4fIh3Ih0lSjxuTmKS9A
   A==;
X-CSE-ConnectionGUID: JmS4NEd4SUCnAJuQ2soQLw==
X-CSE-MsgGUID: pECLKIFSQxq7+VwBJE02kA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30871682"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="30871682"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 23:04:54 -0700
X-CSE-ConnectionGUID: Hqe/FUriQRyu1v3MxJd/9g==
X-CSE-MsgGUID: +XkOK37iSpqn6DKTaL5WOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35344796"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 23:04:53 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BB79711FA4A;
	Wed, 29 May 2024 09:04:50 +0300 (EEST)
Date: Wed, 29 May 2024 06:04:50 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: bingbu.cao@intel.com
Cc: linux-media@vger.kernel.org, tian.shu.qiu@intel.com
Subject: Re: [PATCH 2/2] media: intel/ipu6: add csi2 port sanity check in
 notifier bound
Message-ID: <ZlbFgkV73nR1VjYT@kekkonen.localdomain>
References: <20240529034600.117803-1-bingbu.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529034600.117803-1-bingbu.cao@intel.com>

Hi Bingbu,

Thanks for the patch.

On Wed, May 29, 2024 at 11:46:00AM +0800, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Invalid csi2 port will break the isys notifier bound ops as it is
> trying to access an invalid csi2 sub-device instance based on the
> port. It will trigger a mc warning, and it will cause the sensor
> driver to unbound an inexistent isys csi2 and crash. Adding a
> csi2 port sanity check, return error to avoid such case.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/pci/intel/ipu6/ipu6-isys.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> index 5992138c7290..997fbfbf2ea5 100644
> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
> @@ -676,8 +676,16 @@ static int isys_notifier_bound(struct v4l2_async_notifier *notifier,
>  		container_of(notifier, struct ipu6_isys, notifier);
>  	struct sensor_async_sd *s_asd =
>  		container_of(asc, struct sensor_async_sd, asc);
> +	u32 nports;
>  	int ret;
>  
> +	nports = isys->pdata->ipdata->csi2.nports;
> +	if (nports <= s_asd->csi2.port) {

No need for a temporary variable. I'd also put the non-static value
(s_asd->csi2.port) on the left side of the comparison.

> +		dev_err(&isys->adev->auxdev.dev, "invalid csi2 port %u\n",
> +			s_asd->csi2.port);
> +		return -EINVAL;
> +	}
> +
>  	ret = ipu_bridge_instantiate_vcm(sd->dev);
>  	if (ret) {
>  		dev_err(&isys->adev->auxdev.dev, "instantiate vcm failed\n");

-- 
Kind regards,

Sakari Ailus

