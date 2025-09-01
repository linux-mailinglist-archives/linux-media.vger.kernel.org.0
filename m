Return-Path: <linux-media+bounces-41434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F332B3E35B
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 14:39:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB9B27A8739
	for <lists+linux-media@lfdr.de>; Mon,  1 Sep 2025 12:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9168F337693;
	Mon,  1 Sep 2025 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LUst9Pjl"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ACB326D74;
	Mon,  1 Sep 2025 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756730110; cv=none; b=lyOBYiUMd78qWWFQ8b8igsxWjLQIbevpMj8HnVBHB8xjGCCLLQOJ8MONmGav9JLeaNqnQnM8pMTb4dE835WIGjq3BrOHFmBPymPktZnWphD9tm9xKr/peJRUsNanv1J9lkT9c61pjXMMH9I/suZiCVNNFPLqLoAtWR+GX7o5p4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756730110; c=relaxed/simple;
	bh=rGr7Bo1vXWwjrmge9Wg/+zFRIYmWBsmAkZO4GZCgaQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reB40ZOPH5wylg14Ix9w/r6nDO3c3JU8sysszdPBEkcl0eM/i17bEQ5oekaTr8IMxsq1z+dUkzsjqe/0WOpzOr9DwSs6B7Lbh8BSmqToEuLWPby+/g4R1tj6HbpqNm2ehDTIhDx6RzwTIpQFkLQVtEAgFz2qfUZ5qIx1KVebj2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LUst9Pjl; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756730108; x=1788266108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=rGr7Bo1vXWwjrmge9Wg/+zFRIYmWBsmAkZO4GZCgaQU=;
  b=LUst9Pjl4S3GSatj4ui3pJ7DN5qgj9SZ4ZLEBYPk2++n4wN3UOnUpAeA
   suulgekhmFSkvpqn7CLLUNxA7dqXmU5oMbSX7+oRCMN/ES+x2MpRlOC5f
   KvcfblUrjFGYS2G89YSmrymgFT2bVLfUxsPgKxVoZIFEyYsAPRZbk/YLw
   aInwBsxcVd0Oc1N/eHw5LyYMoS3NQZVUae0KCe0+wtx3t5SxlD9Wm4Vm7
   8fMar6BjrPmM1FzP3VDmalpYEk5P8OtfAaH9QAZO4ndVcJ5P7I4EIsX8r
   vrFjndRFprnkkctgh8sLuP9M9Qm1JbKlnpExA+Q1ZSnp5/9OP6EyCi18I
   A==;
X-CSE-ConnectionGUID: wjYAcG+ZTcumTZh4BpciHQ==
X-CSE-MsgGUID: XDzyZPKYRXmDRuPtTS5m/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62820819"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62820819"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 05:35:08 -0700
X-CSE-ConnectionGUID: LenhrOEsRM219DWntpmz9w==
X-CSE-MsgGUID: IaHq/rL4Smaq9EvD+l+KTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="201934761"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 05:35:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1ut3kU-0000000APcx-01Qi;
	Mon, 01 Sep 2025 15:35:02 +0300
Date: Mon, 1 Sep 2025 15:35:01 +0300
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
Subject: Re: [PATCH 1/2] staging: media: atomisp: Remove typedefs for basic
 types in vmem.c
Message-ID: <aLWS9QsvmzZW4Bak@smile.fi.intel.com>
References: <20250901091050.1935505-1-abarnas@google.com>
 <20250901091050.1935505-2-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250901091050.1935505-2-abarnas@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Sep 01, 2025 at 09:10:49AM +0000, Adrian Barnaś wrote:
> Cleared typedefs hiding unsigned long long type, to align with
> kernel coding style.

...

> -static inline hive_uedge
> -subword(hive_uedge w, unsigned int start, unsigned int end)
> +static inline unsigned long long
> +subword(unsigned long long w, unsigned int start, unsigned int end)
>  {
>  	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
>  }
>  
>  /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx0000xxxx]LSB */
> -static inline hive_uedge
> -inv_subword(hive_uedge w, unsigned int start, unsigned int end)
> +static inline unsigned long long
> +inv_subword(unsigned long long w, unsigned int start, unsigned int end)
>  {
>  	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
>  }

Also consider to simplify the above (in a separate change).

static inline unsigned long long
subword(unsigned long long w, unsigned int start, unsigned int end)
{
	return (w & GENMASK_ULL(end, 0)) >> start;
}

static inline unsigned long long
inv_subword(unsigned long long w, unsigned int start, unsigned int end)
{
	return w & (~GENMASK_ULL(end, 0) | GENMASK_ULL(start, 0));
}

...if I'm not mistaken, so double check all these.

At least in my case the end == 64 is not allowed while it seems the original
code allows it to be equal to the end == 63 case. Needs testing anyway...

-- 
With Best Regards,
Andy Shevchenko



