Return-Path: <linux-media+bounces-28096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC76A5E3F2
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 19:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0877A19C06BB
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 18:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803EC257AFA;
	Wed, 12 Mar 2025 18:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9xrK22U"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFADE23CF12
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 18:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741805608; cv=none; b=MvLtnTliweGFb8hAE4l+Clf4ie2G2R1D7v19G/dEUWg/mnwxVC38V32VUUxlC9oJ7Bpo5baZp4QCWCGxt6z4sLmjswjsoxsptfHbpvnvMDCREuK2VQhkCm8baHxK1Mw/cbCfIJgRWJFgB6cf8t0S7acvhMtuqNKmickSEI82Xe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741805608; c=relaxed/simple;
	bh=z5M79GoGCcyPk4JvYR9VHqVC2Gnrz9bNi1L40AIYjA4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtbFio1r4+kFpk45EvW4TSk70NPIpMiV7Qv2BTmDYS4nHGgpRwMMZIGXdW6d1ZkYfgPJ+O+41Z88LGKeRO5/h/yciTYRVRnENvWN63rpjmN+qK9wQpb5nYFOwrCZi1MbIms8Y/ApMtd+7FsVrIXiGHIarVKUmZErwxfsUDmiU+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9xrK22U; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741805606; x=1773341606;
  h=date:from:to:subject:message-id:references:mime-version:
   in-reply-to;
  bh=z5M79GoGCcyPk4JvYR9VHqVC2Gnrz9bNi1L40AIYjA4=;
  b=A9xrK22UsJ1MkVLWaRUfDvvW5E+likYNkDA0EMKK7MoBsf1uFnCbsIK9
   dFyp9obdqfm7yTCTj5F4Kz/ErKY3laoKo0XD5a8SjTwUd0a3hghy/IqDA
   p+pPjx6edEGDkhiR3OJABYIsFUusfLOghPeON+XualK4NvIjGjVZMOO31
   y0ux9JWuXiKnTQGWllo0zSqehS1A+DAw8gHCO6DrbDdcB6v8wMhUM8MU7
   VKXkzs5Yqk/DoelKwWhLGfPEs+pCC/7xGo1QFdILJVWLym8Na4lVt3Nyr
   LPzzbB8RS54eH89PPpt1+g9W/YLrJgssdFPfcbcn+OE+fk7wD8XgvMkeS
   Q==;
X-CSE-ConnectionGUID: 1Y8uctB4TLC05g7fbb8piQ==
X-CSE-MsgGUID: tOssAgDTT/2SRDrECf/j9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="43083928"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="43083928"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 11:53:26 -0700
X-CSE-ConnectionGUID: CKF5CQ/FSBO4yivmJNdiVA==
X-CSE-MsgGUID: Ql9WNX/AQGC4pD1+qqQq4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="120755232"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 11:53:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tsRCl-00000001xDD-0WfV
	for linux-media@vger.kernel.org;
	Wed, 12 Mar 2025 20:53:23 +0200
Date: Wed, 12 Mar 2025 20:53:22 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-media@vger.kernel.org
Subject: Re: [v1,1/1] media: =?iso-8859-1?Q?v4l2-co?=
 =?iso-8859-1?Q?re=3A_Replace_the_check_for_firmware_registered_I=B2?=
 =?iso-8859-1?Q?C?= devices
Message-ID: <Z9HYIk7mvk3UZQPR@smile.fi.intel.com>
References: <20250312174116.4111623-1-andriy.shevchenko@linux.intel.com>
 <67d1d748.050a0220.54744.0b0f@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67d1d748.050a0220.54744.0b0f@mx.google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Mar 12, 2025 at 11:49:44AM -0700, Patchwork Integration wrote:
> Dear Andy Shevchenko:
> 
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:

Cool, I have been under impression that I compiled it...
Now I see that it was different configuration (and actually different branch).
I will fix and send a v2 for this.


-- 
With Best Regards,
Andy Shevchenko



