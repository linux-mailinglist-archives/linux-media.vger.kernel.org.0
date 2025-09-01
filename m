Return-Path: <linux-media+bounces-41433-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B833B3E29B
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 14:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BADB17E43D
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 12:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C00730BF7B;
	Mon,  1 Sep 2025 12:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dSR281yj"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F07242D9F;
	Mon,  1 Sep 2025 12:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756729424; cv=none; b=dUpHZ9V9CGUCeRxEfGckkJxfTq/zHHLKiQlNBiw9MmwZExSwFN88Xhk2JmsvXXTxZJPDdBtLwBFUVYXRG77ukDnCUpuo36ciBV2psQFnWcjvSy1H17VbH8thUFhQQoYolJLSw3xv7M/SdJiilnou0UlYaguZ9Qp8MsI78fZaBv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756729424; c=relaxed/simple;
	bh=yFvygwLcFHD/6voobz7w19DKMbhyHW4ucdxxudzbGrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVgU4NhRJ4GF0jZBT2Xa+qu1YPK04fT78QXO7W9QplAicya/7Dg+xyay/n63TZ5tGyD5mztDwJuogpOBeTHL0gNvzKEpZwffORusJcftjQb9tJ9HIYLkU/w+gCp48JjQCTuo4vrcGl8Ymmxi/n3wHYz33yRPh9TipW+1Wi2V9hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dSR281yj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756729423; x=1788265423;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yFvygwLcFHD/6voobz7w19DKMbhyHW4ucdxxudzbGrY=;
  b=dSR281yjGwO9IIMuvSP+oWG7fYX9yM4aLi6t4vvfXENCjgoyOPZeFYnD
   pGLkyz3gaHDkL3lnWG/RLnNvjtdg05NVVKdxfPj48j66fjW1NVAWBQjia
   oUCzg+DDmv4+vWit6Wj49SLXeJvHBMg0V6gBlqJcEk3rHwmIIK2F0aXZm
   Eoh6bnNLY6frCbjq0WRBA8vWiQg01FhWluWtDeSfVW5YYrgGs5Gil6u56
   miMJkoOCiTFN7AXk+LaTJefpcqcMk4shWR/qWZTdLyQBJpBK3HR/nGP/7
   eVuK3uo2Jr+oUvGbs72bHxQ8fJAgz3MWloNtLTdXh0rKjqviggye66BVW
   A==;
X-CSE-ConnectionGUID: tLPU6ULVScatcTUen7zwXA==
X-CSE-MsgGUID: g27bHPWvRU+T6SkVq7Koiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="58015136"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58015136"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 05:23:43 -0700
X-CSE-ConnectionGUID: 9/SLPQv+SsK1HHL9nQ0C4A==
X-CSE-MsgGUID: okCmQ48NTMaIcDN+xu+6HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170565473"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 05:23:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1ut3ZR-0000000APUw-0Sga;
	Mon, 01 Sep 2025 15:23:37 +0300
Date: Mon, 1 Sep 2025 15:23:36 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] staging:media: atomisp: Whitespaces cleanup in vmem.c
Message-ID: <aLWQSAX1ZKg6IiTb@smile.fi.intel.com>
References: <20250901091050.1935505-1-abarnas@google.com>
 <20250901091050.1935505-3-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250901091050.1935505-3-abarnas@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Sep 01, 2025 at 09:10:50AM +0000, Adrian Barnaś wrote:
> Whitespaces cleanup to conform with kernel style and improve readability.

Strange...

...

>  /* subword bits move like this:         MSB[____xxxx____]LSB -> MSB[00000000xxxx]LSB */
> -static inline unsigned long long
> -subword(unsigned long long w, unsigned int start, unsigned int end)
> +static inline unsigned long long subword(unsigned long long w, unsigned int start,
> +					 unsigned int end)
>  {
>  	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
>  }
>  
>  /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx0000xxxx]LSB */
> -static inline unsigned long long
> -inv_subword(unsigned long long w, unsigned int start, unsigned int end)
> +static inline unsigned long long inv_subword(unsigned long long w, unsigned int start,
> +					     unsigned int end)
>  {
>  	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
>  }

These two were just "fixed according to the kernel coding style" and here
again. This is odd.

Note, the style after the first patch is okay. I dunno what's wrong with it.

...

> -void isp_vmem_load(
> -    const isp_ID_t		ID,
> -    const t_vmem_elem	*from,
> -    t_vmem_elem		*to,
> -    unsigned int elems) /* In t_vmem_elem */
> +void isp_vmem_load(const isp_ID_t ID, const t_vmem_elem *from, t_vmem_elem *to,
> +		   unsigned int elems) /* In t_vmem_elem */

Please, (re)move trailing comments somewhere else.

-- 
With Best Regards,
Andy Shevchenko



