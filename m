Return-Path: <linux-media+bounces-50792-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ABCD249D8
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 13:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DF5C30517C4
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 12:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC88239B480;
	Thu, 15 Jan 2026 12:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxtbAFuD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B32C39A7E4;
	Thu, 15 Jan 2026 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768481481; cv=none; b=Pk0SlUXQS5mDI01I2sjx3/I1SVHsmth24TJxkpVEzmaEqsu7PCzn5LgSMzFiQVhNgFhcj1DeyB9EBfp9PW11LcZnO+9D4HF5BOZ8nOCfZwj3qd1Awx5JH0Sx3LP94sc9kJnhrgtv9u/EVC3WwWmYZ7z9RbwrR33jNFL03/vUiuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768481481; c=relaxed/simple;
	bh=KKeZ1KF+3O3cYa8zsmv9J9kFdgkEq54tGVGau657HLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbvl484oS8zLNTbFP2h6IdalhGTSGkOJJc2Cc3Uusvi+oquLqTpS3eev+7oBtW9WHdWThKMuuRw2XLj/2yRf9baRyv88CbfkUAv8mS2bYLAVeiQyaf8lDtt7Oli/BLzWyz/u3TZWKB2kHi+bu7Ty9U7hPnkjQaHovv93RFYbcRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxtbAFuD; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768481480; x=1800017480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KKeZ1KF+3O3cYa8zsmv9J9kFdgkEq54tGVGau657HLM=;
  b=PxtbAFuDCZrN38yw6hGg+MeBeXzkxuBBVLMhkJ55gjcSDf3hfhQSsbzh
   jPPDECWc+owaqVJ5q/zpMWO9aNlOWb7OenvqFoBu0RJnjRRGy9rRjdtwP
   U7amqJz/yIyLUNUXYCHiweCWNkbWtSYJC89bppYpiJpWq3bAercQJ/bsQ
   6voKJ4h6ONoE4mq07Wr4xUvP6bgjzK9fT3Z5IumOH8cqJ9Npg13vcjlGf
   H+AUQUAHAQy0HJlySFPVjBIpq45tNduz6vE/nv5Ul2hi01c9tKCSM7WgV
   kTX0NaGZ9KeDrd3+gIgIEWZ6V+LxCK2ieiVHRwKpC01n/j/GQ4nsl5VXm
   Q==;
X-CSE-ConnectionGUID: e/G1tou9R0Kggufl1Jjoog==
X-CSE-MsgGUID: A0IuZKBPSxSMwSjpIrHH9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="69702479"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="69702479"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:51:19 -0800
X-CSE-ConnectionGUID: Pqa4sBGxS1qtKs8YTLth2A==
X-CSE-MsgGUID: HhxSxkdVTt+RZsR1qlBu0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; 
   d="scan'208";a="209093478"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.216])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:51:16 -0800
Date: Thu, 15 Jan 2026 14:51:14 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Hamdan Khan <hamdankhan212@gmail.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, hansg@kernel.org,
	mchehab@kernel.org, sakari.ailus@linux.intel.com,
	dave.hansen@linux.intel.com, tony.luck@intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: atomisp: Fix typos and formatting in
 headers
Message-ID: <aWjiwto4BQS8Uudz@smile.fi.intel.com>
References: <20260115121157.10840-1-hamdankhan212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115121157.10840-1-hamdankhan212@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jan 15, 2026 at 05:11:57PM +0500, Hamdan Khan wrote:
> This patch updates block and inline comments to follow kernel
> commenting conventions, fixes typos and wording, and reformats
> long comments for clarity and line length consistency.
> 
> No functional changes are intended.

...

> -/* DVS 2.0 Coefficient types. This structure contains 4 pointers to
> - *  arrays that contain the coefficients for each type.
> +/*
> + * DVS 2.0 Coefficient types. This structure contains 4 pointers to
> + * arrays that contain the coefficients for each type.
>   */
>  struct atomisp_dvs2_coef_types {
> -	short __user *odd_real; /** real part of the odd coefficients*/
> -	short __user *odd_imag; /** imaginary part of the odd coefficients*/
> -	short __user *even_real;/** real part of the even coefficients*/
> -	short __user *even_imag;/** imaginary part of the even coefficients*/
> +	short __user *odd_real; /* Real part of the odd coefficients*/
> +	short __user *odd_imag; /* Imaginary part of the odd coefficients*/
> +	short __user *even_real;/* Real part of the even coefficients*/
> +	short __user *even_imag;/* Imaginary part of the even coefficients*/
>  };

Have you tried to run kernel-doc script against this file? I believe
it will be a difference between before and after.

If so, it means that it's better to convert the description to be a fully
kernel-doc compliant.

...

>  struct atomisp_dvs2_stat_types {
> -	int __user *odd_real; /** real part of the odd statistics*/
> -	int __user *odd_imag; /** imaginary part of the odd statistics*/
> -	int __user *even_real;/** real part of the even statistics*/
> -	int __user *even_imag;/** imaginary part of the even statistics*/
> +	int __user *odd_real; /* Real part of the odd statistics*/
> +	int __user *odd_imag; /* Imaginary part of the odd statistics*/
> +	int __user *even_real;/* Real part of the even statistics*/
> +	int __user *even_imag;/* Imaginary part of the even statistics*/
>  };

Ditto.

...

>  struct atomisp_resolution {
> -	u32 width;  /** Width */
> -	u32 height; /** Height */
> +	u32 width;  /* Width */
> +	u32 height; /* Height */
>  };

Ditto and so on...

(As for this data type I think it makes sense to research for a substitution
 from the existing ones or even cease the existence of atomisp_resolution.)

-- 
With Best Regards,
Andy Shevchenko



