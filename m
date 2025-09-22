Return-Path: <linux-media+bounces-42887-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2EBB8F1A1
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 08:21:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41BD4189D4EE
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 06:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273BD24A063;
	Mon, 22 Sep 2025 06:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPpM8eY2"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA9317332C;
	Mon, 22 Sep 2025 06:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758522069; cv=none; b=RfEVxc94tyAErNJ7XerafiawFGIdQmzYkoUVp/3XCxljEHiqann7RUyYF38Lyi6BgC+s9YNfDJhcAeqwLYavyQqwuQOTn3kopQgvCoKSxkcoIYwSdhpSh75102DqsriguSCwr3V1WDTdEvLGguiL8DcTH7+3NcZ3j80POlj/N9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758522069; c=relaxed/simple;
	bh=9HiLbM40Ej70qCxUe+2HWgi1HQvvNJ4S7zpy/HKrHEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9VgSgnpJkJRhPHLDjrUwjvSFXNz41s0n2eI58WKEvq4iCl6AidCPpGNwFQCoo3kxje8vZZ+NFDu4YQQFqmJ+jlFVzUaBeCsOUx2O6fBJo6zeuD9ybB9b/uPAMpdrKF9fvQTEJQ96lpKHwJ8lhAsKxWePp3mi36P3AD4/KokJCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPpM8eY2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758522068; x=1790058068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9HiLbM40Ej70qCxUe+2HWgi1HQvvNJ4S7zpy/HKrHEY=;
  b=nPpM8eY2DKfNhPqh2zf5uxz7+3eO228WkxFrDgmoPDHYBVl4/ZLgQ965
   gsqFm7+fpXzXemlXHssG3lJP/jGGQFy1QnyzWPy3Z/XPia3ssrCnm5oH0
   o+VaklOZDmHE8s5LPEFCOPi+NJvBaENPpND3W+sFzgKfccx66eigIA6Y2
   ozoxYMkFhnN+LW5HNEmHEntjxuHiZm+f1B5L9E4SdPQxCzUo4MPtB9qd0
   LrLz+6SAVZdETNZGUUOqQjnG5tDOli1xd5erGBhM1CiXkbKAyWUJo4EvT
   rpRrHCY0TBlzoGmb9JsN4hMuX4tviEIRhAU4SfW/V0GG6mVk3DWjXcJSC
   w==;
X-CSE-ConnectionGUID: ry3Nl9RsS4SyBxUnkCR/Hg==
X-CSE-MsgGUID: 2KfctUv4RfKy92v66H52PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="86214258"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="86214258"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 23:21:06 -0700
X-CSE-ConnectionGUID: Zkp1zbnXSCeJFwwYNv5mkA==
X-CSE-MsgGUID: rLyaRBoCQu+fHTOJz0grtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; 
   d="scan'208";a="176833457"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 23:21:03 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0BDE711F982;
	Mon, 22 Sep 2025 09:21:01 +0300 (EEST)
Date: Mon, 22 Sep 2025 09:21:00 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ma Ke <make24@iscas.ac.cn>
Cc: bingbu.cao@intel.com, lixu.zhang@intel.com,
	stanislaw.gruszka@linux.intel.com, mchehab@kernel.org,
	wentong.wu@intel.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: pci: intel: ivsc: fix error handling in
 scan_one_device()
Message-ID: <aNDqzIXpHHKZRiju@kekkonen.localdomain>
References: <20250920134252.8612-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920134252.8612-1-make24@iscas.ac.cn>

Hi Ma,

Thank you for the patch.

On Sat, Sep 20, 2025 at 09:42:52PM +0800, Ma Ke wrote:
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
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/media/pci/intel/ivsc/mei_ace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c b/drivers/media/pci/intel/ivsc/mei_ace.c
> index 98310b8511b1..261b30788118 100644
> --- a/drivers/media/pci/intel/ivsc/mei_ace.c
> +++ b/drivers/media/pci/intel/ivsc/mei_ace.c
> @@ -421,6 +421,7 @@ static int mei_ace_setup_dev_link(struct mei_ace *ace)
>  	}
>  
>  	ace->csi_dev = csi_dev;
> +	put_device(csi_dev);
>  
>  	return 0;
>  
> @@ -522,7 +523,6 @@ static void mei_ace_remove(struct mei_cl_device *cldev)
>  	cancel_work_sync(&ace->work);
>  
>  	device_link_del(ace->csi_link);
> -	put_device(ace->csi_dev);
>  
>  	pm_runtime_disable(&cldev->dev);
>  	pm_runtime_set_suspended(&cldev->dev);

Is this a bug?

device_link_add() will get both devices in success case so you could
unconditionally put the csi_dev right after calling device_link_add().

-- 
Regards,

Sakari Ailus

