Return-Path: <linux-media+bounces-25991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 090DAA307FB
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 11:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7413418898C3
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 10:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C9761F37A8;
	Tue, 11 Feb 2025 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLfkg1nt"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5531F2C43;
	Tue, 11 Feb 2025 10:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739268383; cv=none; b=cH+IDlFiXXbeKAQp2rpxEb5/wjcd8NylyWCKI8nE5Co9HS9wmmjlg3lcSkPIhQWdjpqecICL1JdxgMN8IAPwklWw+X/5BDeiP2nGpCoxOwu6Qhl4Q5MQZVKNGH3E/07Ij7KZkOxxywSoU3LSjh4OqTZaWz6p4x4RahXmiL5j4Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739268383; c=relaxed/simple;
	bh=w37iU9q7npRvABjETuciXvtARK3bpAqn4lNfaogHYzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iad0pwkkep2rqgd5Offu7lOweRw8np6OnsMfuNXmDRuoiuf3OQMStJLrhERnFpVX+r2jUsDlM4ETxnMeeNfWz6mSVP5l2QMVrPeCYC0CuDStfXD8pp6lJA3T+FLpJ+O5BBkNV5pT2GCQ+SAAmrxhEDx0qzIzE+HsHn/IIy6JlqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLfkg1nt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739268382; x=1770804382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w37iU9q7npRvABjETuciXvtARK3bpAqn4lNfaogHYzQ=;
  b=dLfkg1ntkAgi5DHgJ94tcJwTTXWY73TViXgXPDp9Fh0UtkWbzKr2k4UL
   WLXgDmCjyZRcNrH1ZyfinaYHxseG1IgfmxBs72gxPmXmshnNQpAQ1fJUY
   KZhdGSq8xZvM+h0nVvYG1nsD5W5KuhYsgtmb8x2zQ0vTxf0EpV0ZeUfxe
   yiO8sC2YxG+wg8ohJ9m+nuih3QFQ7wHtYx8hTDAsEA5fgiwkgXDlrQEGV
   B+vRcNCchzpVjVqidVZ6T50Yj/penoqKbj8RGCeswhZvw5qa3+JDUsDFd
   qqh1ZP+0972EZisINfjSa4CCddo2Q5oStKyua0ihOJl6b3I60C+74o3h6
   g==;
X-CSE-ConnectionGUID: uvXSY3grTMygsjDy3nbang==
X-CSE-MsgGUID: hPk4EpruTVW5iSCraiHZNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43807547"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="43807547"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 02:06:21 -0800
X-CSE-ConnectionGUID: LQmTXM9oTQ+rpKrwjAQ35g==
X-CSE-MsgGUID: z5g/5ijqRma0Urql1eaKbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; 
   d="scan'208";a="117494489"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 02:06:19 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1thn9k-0000000ASul-1T8w;
	Tue, 11 Feb 2025 12:06:16 +0200
Date: Tue, 11 Feb 2025 12:06:16 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v7 0/3] int3472: Support GPIO con_id based on _HID
Message-ID: <Z6shGGy2FPVc5mEK@smile.fi.intel.com>
References: <20250211072841.7713-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211072841.7713-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Feb 11, 2025 at 09:28:38AM +0200, Sakari Ailus wrote:
> One patch turned into a set, the second patch being the original one.
> 
> since v6:
> 
> - Reword the comment regarding GPIO map processing.

Hans, Ilpo, I think this is in good enough shape
(the order of the checks I'm still not happy about
 we can amend later on if required). Can it be taken?

-- 
With Best Regards,
Andy Shevchenko



