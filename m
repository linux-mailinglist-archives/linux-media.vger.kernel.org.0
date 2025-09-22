Return-Path: <linux-media+bounces-42934-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C903AB903E4
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 12:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 528F92A384B
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 10:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C426B3043A9;
	Mon, 22 Sep 2025 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e+xlhDzD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E5C286D56;
	Mon, 22 Sep 2025 10:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758537849; cv=none; b=hbW9bruSlIbkQT8ADSlCu2GPEQfaLhG164RlpbqeiLCqf5wONIcyqsGFq05jLcHNekT9U063I0NCRe+iBlrL8/w+neGGnBjlOCCebQ3vpRMc+GFdfNHvxBZp0X5HFlpbDglMjeUAmbhfZq7vwJ5FjENwyKf7VVZbagXRPedyhxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758537849; c=relaxed/simple;
	bh=Scu0SimwoCRkxOBYc7t64x6kXw6D/8lqrdYnldQqIz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoOfB6k9AZGzAUNE9KAPDTM7L2wWRuV/q5px3ZIhCKtpk5lVHqu8Na2O0jMRYDO8oyFBnPznnUQSvnp/ca3f5wDIPqXhsf98QU2SU8IkSNgviCTIkvA/EFC3CtdKm+lgojoeXoKcuBmPfv99WtoBg9beNNAGB+N+Gp6H/3p+c/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e+xlhDzD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758537848; x=1790073848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Scu0SimwoCRkxOBYc7t64x6kXw6D/8lqrdYnldQqIz4=;
  b=e+xlhDzDCi+qdwymzneAfgTUrWWg2qdDX5PoNX4ViLFQP2DYYC4rMbdd
   Bpxo+3qTZxq2hZI3/DzSU+NPcTTM3M5Iiv7C4zfd7ApU3PTeSyOCm+XPT
   tccHMGkREdkhnm4Dk7n6hx+NKcwWe3m1PDEUd97nVTfIMie2/N2uCxihc
   jYMG5gbd1C1ri9+VzayajKVZFqAG9T6LDNPwGvykVgDUVUtEEsrRBU7NX
   hJbnNqGja6T3vuUPH5NBnfSAxUWQWJuPY+33SMbCaZzgf7fBlVM8qJDKe
   ZCA3oM86ze/5oy07ZxS7DseEpiZdF5KHmQ92BmZ5ZS2CFEMQU0CYNqDQP
   w==;
X-CSE-ConnectionGUID: Pv8yjoPGTT+sXZdFpM07jw==
X-CSE-MsgGUID: /IoALYeNQZqmL6nN6htkdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60852398"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60852398"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 03:44:07 -0700
X-CSE-ConnectionGUID: jt9e9kpgS1C9Ak14/yW+Sw==
X-CSE-MsgGUID: uUk8EzvJR72Z1zRMDduf4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="180461341"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 03:44:04 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3C78211F967;
	Mon, 22 Sep 2025 13:44:01 +0300 (EEST)
Date: Mon, 22 Sep 2025 13:44:01 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: bingbu.cao@intel.com, lixu.zhang@intel.com,
	stanislaw.gruszka@linux.intel.com, mchehab@kernel.org,
	wentong.wu@intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] media: pci: intel: ivsc: fix error handling in
 mei_ace driver
Message-ID: <aNEocYyaT2pig7So@kekkonen.localdomain>
References: <20250922094335.28486-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922094335.28486-1-make24@iscas.ac.cn>

Hi Ma,

On Mon, Sep 22, 2025 at 05:43:35PM +0800, Ma Ke wrote:
> The mei_ace driver contains a device reference count leak in
> mei_ace_setup_dev_link() where device_find_child_by_name() increases
> the reference count of the found device but this reference is not
> properly decreased in the success path. Add put_device() in
> mei_ace_setup_dev_link() and delete put_device() in mei_ace_remove(),
> which ensures that the reference count of the device is correctly
> managed regardless of whether the probe is successful or fails.
> 
> Found by code review.
> 
> Cc: stable@vger.kernel.org
> Fixes: 78876f71b3e9 ("media: pci: intel: ivsc: Add ACE submodule")

As this isn't a bug fix, I don't think we need these two tags. This should
be taken into account in the subject and commit message as well.

> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
> Changes in v2:
> - modified the put_device() operations and the patch title as suggestions.
> ---
>  drivers/media/pci/intel/ivsc/mei_ace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
> index 98310b8511b1..bb57656fc85a 100644
> --- a/drivers/media/pci/intel/ivsc/mei_ace.c
> +++ b/drivers/media/pci/intel/ivsc/mei_ace.c
> @@ -420,6 +420,7 @@ static int mei_ace_setup_dev_link(struct mei_ace *ace)
>  		goto err_put;
>  	}
>  
> +	put_device(csi_dev);

You can do this right after calling device_link_add().

>  	ace->csi_dev = csi_dev;
>  
>  	return 0;
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

