Return-Path: <linux-media+bounces-28119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AB3A5EEED
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 10:05:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEF9A18831A3
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 09:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE4C263883;
	Thu, 13 Mar 2025 09:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dA+wqG7a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CADB262D1C;
	Thu, 13 Mar 2025 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741856730; cv=none; b=D3drOVTMxHqKVLRP1bnZ9sP9FU4YiAyz9ZfnAe0PbvwogJmJASr9WbyTotwFC7EkHWHRXee8MrWn6OwpTK8PDweBCQiMZIPqT2MAMlSaM4sZYDJ5jktWearGN4Aht/bjhwiX/it8MrVAcVAym+JlLxctUellMLYzXWccpGv/YLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741856730; c=relaxed/simple;
	bh=HWLWuVRAruMFY8gJ7PUSLj6g/W5wMg9slfTaZDMeLH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKBMahoET9VYHFW2d5N/JZe1GMuZ7QpunK4Q+3jyUjAcxjgFV1IHyxMakLm0blyDYdCy1bgEiivQiCrTQDo3P6nNUsgDirNeDDB53oBalCyHLH5Skncptnt1to7dnDtD+GH4PBDZzvK6qUqSAtNjll6Xm8+k6/JMfAPKjEI0Adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dA+wqG7a; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741856728; x=1773392728;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HWLWuVRAruMFY8gJ7PUSLj6g/W5wMg9slfTaZDMeLH4=;
  b=dA+wqG7aTWdM6Xbq5u0rlEHrnGcY2NqFKEfaIsCngUHnwfwJqP/l/tag
   u3iUVtS9qlgVJi7PYlwwo347yEwBVPOQV4bgXO4mfBN6Jr34QPi3QPvB5
   35ZgBaNPe1tONK+j+zrvsaSgsWjqd5haO4WFzKcRyp+E84iomAJbQkZJc
   9niUHJTTAOZ7wWBsKPQ+fGzl/bfJS+DYOSwTAcTdWec2kc0GZZUlMp/X1
   mRSJXjG9Z7TqiQPRSzOi21PKWsAFYK1EUeow0tY7TMyDvSOEd/8MNJSB5
   gCi75DsP56QAhPuWXTA9Z52Zy3qIGcPwtHOAfjRoYoFPdWi37nH/CNYUJ
   A==;
X-CSE-ConnectionGUID: s3Rwdy7mQvSJQ6UelCtjKQ==
X-CSE-MsgGUID: 054DvXLgQS65pA+c0hZ1EA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42842926"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="42842926"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 02:05:27 -0700
X-CSE-ConnectionGUID: +kKVKGMjTry8NiyH63vxsg==
X-CSE-MsgGUID: cyICXEtuQK+Amz3Nj2A8bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; 
   d="scan'208";a="125964428"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 02:05:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tseVH-000000027q5-3njP;
	Thu, 13 Mar 2025 11:05:23 +0200
Date: Thu, 13 Mar 2025 11:05:23 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [v2,1/1] media: =?iso-8859-1?Q?v4l2-co?=
 =?iso-8859-1?Q?re=3A_Replace_the_check_for_firmware_registered_I=B2?=
 =?iso-8859-1?Q?C?= devices
Message-ID: <Z9Kf06nLg86jmcqI@smile.fi.intel.com>
References: <20250312192528.95838-1-andriy.shevchenko@linux.intel.com>
 <67d1f748.050a0220.353790.339b@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67d1f748.050a0220.353790.339b@mx.google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 12, 2025 at 02:06:16PM -0700, Patchwork Integration wrote:
> Dear Andy Shevchenko:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
> 
> # Test media-patchstyle:./0001-media-v4l2-core-Replace-the-check-for-firmware-regis.patch media style
> ERROR: ./0001-media-v4l2-core-Replace-the-check-for-firmware-regis.patch: Missing 'media:' prefix in Subject

LOL, what?

> Please fix your series, and upload a new version. If you have a patchwork
> account, do not forget to mark the current series as Superseded.
> 
> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/72774130/artifacts/report.htm .

-- 
With Best Regards,
Andy Shevchenko



