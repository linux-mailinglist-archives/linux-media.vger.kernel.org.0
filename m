Return-Path: <linux-media+bounces-42982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6CBB94F81
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 10:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2D0F3AE9DC
	for <lists+linux-media@lfdr.de>; Tue, 23 Sep 2025 08:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557DC31A07B;
	Tue, 23 Sep 2025 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RpdbT5++"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94A931A042;
	Tue, 23 Sep 2025 08:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758615687; cv=none; b=mVb/EAKICYuJEXEz6LhYjg7YDn2CNB5YsAbNA4x6TeCAHnr0+Ku+8vD7i3zRaMJ536cBAq380ALYD7T+7E9hJD1hfjftDdbVMYGFfL/d+Ru+OILA2qKAw5PiAiwoTxgJqNO4bGDB+Vvht98FJiuAz61CqXE7709HLJm9Ve8YknQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758615687; c=relaxed/simple;
	bh=KoLRoy7R7Box1BqO6iHeia2s/gK2+w7RPQznI8A35og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHswYc2eC0uu0A/+uxDflpD//ldu9ivGQ/ol1VSnI6mwLXv+pqZ9cQnbBIcSaVfDzj5ZDGT8FoK5rKVKj6I4OOMIrVIjq8I+FMrjw3PXebqWuc98NI8hpAQg045Plxn/0Y1q4P8h7F6nEl3FuMa3EswSD2u/xrhBo99GsXKnFfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RpdbT5++; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758615686; x=1790151686;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KoLRoy7R7Box1BqO6iHeia2s/gK2+w7RPQznI8A35og=;
  b=RpdbT5++POCN/gQqKutcOZmDLJ4M6BMQKhxgzectzNHD2HoLGOlUKuy6
   O9Pmfbt9bJpnrnsfaZFmUufiUeU4kWNn1/Op6nJOEFQugS+ZWIJiSiyWw
   cRwPTkPjREjPfJlyRYJp96sDBhfU9J8npic9ja575caiFynNkPB4exo3x
   s0VTzFEBrZzPN9Rc0+0tC3UgvdHtQEIKaJvIUKxB/4T6XaYRm5oc+FCEL
   rV4xJ0DI/Cq1NnE+14+WlPPUMDwhDCCGANiho3PT1+RMuUNXV4303Hto5
   atZnHDM9dshBl8AKDbvKDME4yxTwxmXs39ca082mcjAKQGkXa0+acRWIx
   Q==;
X-CSE-ConnectionGUID: 5X+eM0SYQ4WHPl7bqYFeYg==
X-CSE-MsgGUID: /qjI33iwSVOwzwenTte5Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63518312"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="63518312"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 01:21:25 -0700
X-CSE-ConnectionGUID: wZNkPy8eStiwtO+mBMUv6A==
X-CSE-MsgGUID: 6mKpF1JQR3uEjd0bfxHLLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="181001940"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.23])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 01:21:22 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id EE43C121ED8;
	Tue, 23 Sep 2025 11:21:17 +0300 (EEST)
Date: Tue, 23 Sep 2025 11:21:17 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: bingbu.cao@intel.com, lixu.zhang@intel.com,
	stanislaw.gruszka@linux.intel.com, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: Re: [PATCH v4] media: pci: intel: ivsc: improve device reference
 counting in mei_ace driver
Message-ID: <aNJYfbpA9aR7I5Bx@kekkonen.localdomain>
References: <20250923033650.4408-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923033650.4408-1-make24@iscas.ac.cn>

Hi Ma,

Thanks for the update.

On Tue, Sep 23, 2025 at 11:36:50AM +0800, Ma Ke wrote:
> The device reference counting in mei_ace_setup_dev_link() was
> incomplete, as the reference acquired by device_find_child_by_name()
> was not released immediately on the success path. Add put_device() to

I wouldn't say it's incomplete, that reference is put in the driver's
remove function. The reference may be put right after calling
device_link_add() as device_link_add() takes a reference already. So this
patch would be a cleanup, not a fix.

> properly balance the reference count. Additionally, the redundant
> put_device() in mei_ace_remove() is removed.
> 
> Found by code review.
> 
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v4:
> - updated the subject as suggestions;
> Changes in v3:
> - deleted the tag of Fixes and CC, and moved put_device() to immediately after device_link_add() as suggestions;
> Changes in v2:
> - modified the put_device() operations and the patch title as suggestions.
> ---
>  drivers/media/pci/intel/ivsc/mei_ace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
> index 98310b8511b1..9969c02da671 100644
> --- a/drivers/media/pci/intel/ivsc/mei_ace.c
> +++ b/drivers/media/pci/intel/ivsc/mei_ace.c
> @@ -414,6 +414,7 @@ static int mei_ace_setup_dev_link(struct mei_ace *ace)
>  	/* setup link between mei_ace and mei_csi */
>  	ace->csi_link = device_link_add(csi_dev, dev, DL_FLAG_PM_RUNTIME |
>  					DL_FLAG_RPM_ACTIVE | DL_FLAG_STATELESS);
> +	put_device(csi_dev);
>  	if (!ace->csi_link) {
>  		ret = -EINVAL;
>  		dev_err(dev, "failed to link to %s\n", dev_name(csi_dev));

I believe there's still extra put_device() call some lines below from here
on the error path.

> @@ -522,7 +523,6 @@ static void mei_ace_remove(struct mei_cl_device *cldev)
>  	cancel_work_sync(&ace->work);
>  
>  	device_link_del(ace->csi_link);
> -	put_device(ace->csi_dev);
>  
>  	pm_runtime_disable(&cldev->dev);
>  	pm_runtime_set_suspended(&cldev->dev);

-- 
Regards,

Sakari Ailus

