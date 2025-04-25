Return-Path: <linux-media+bounces-30978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D63A9BEA8
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 08:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DEB31B661A5
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 06:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDE322AE59;
	Fri, 25 Apr 2025 06:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVHES5jc"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C0B137E
	for <linux-media@vger.kernel.org>; Fri, 25 Apr 2025 06:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745562629; cv=none; b=H7akz14gHY3OZzYRjW0m43yoQXArjbL/ywBpNvcQoylPDuhJ+zRp6Li0Hj3XSMIFfCSfeVP1A/uKBBVowVTMEWig4x1Bo363FOPaMx65EDSYGYSqcEHqc9U16THmn82asqvrLctIMtiqswpSZMfxz4+gi01AnRjBksQVOpJhBJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745562629; c=relaxed/simple;
	bh=NGO5/PsoYYAXs+F6MHCNT1GuFsINcRgl43FhO8Femlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcFRkiEvVe9TwAV3Fo/wg1gD864V/qyOHOyBiaur4xYCXkDAFkz8WJkoPmr5gLzeaBSpK/VxbVifspPQ38A1unphPR1TNVqLvrOwPMojfLxbi1E+qpDPN9GepMUra8d4bWJCCQMPA0N6UFf5xzdvslANnhrc/HLliRyr0SG2D3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVHES5jc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745562627; x=1777098627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NGO5/PsoYYAXs+F6MHCNT1GuFsINcRgl43FhO8Femlg=;
  b=KVHES5jc7cySN4o+Zh9L3lzPrO33dFpO8leIvLmxSB9HWMZaAy6BdEOB
   2YVNvJ53jTGfbN6vKl3AERuCYfwqxOJZO9ZJTAJ+czmbCn/pb3fNcwgqs
   8WNdJRU7MVJ3km49iw2I7krbpe6+D0D6tuAOC5pSQnid78wsz2wY82+GF
   McCBYUFQApbHRJ4dHtSSrukNL5jaztTSvgUiBd1E24JFZS6wkrGnJ8K/U
   oj4RcA7WESjF/SUozi8/OPCZrBaqhMMJJST78WQ6CE++HVIOkbG9sl5eN
   ma5Q2lkXFixusVtOZDt37dn5MNMBLkC/j0QV7U5eJGBDi/czdDxTGNiMI
   g==;
X-CSE-ConnectionGUID: QivAZDKyS5C4FjADrHAQIg==
X-CSE-MsgGUID: Uar8AT0CTnupFjmDP+xRPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="51023333"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="51023333"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 23:30:27 -0700
X-CSE-ConnectionGUID: TLoSYg6CSzelLfNODis04w==
X-CSE-MsgGUID: gwfMerDeSHOHVbhDH3UDPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133802404"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 23:30:26 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0546411FA28;
	Fri, 25 Apr 2025 09:30:22 +0300 (EEST)
Date: Fri, 25 Apr 2025 06:30:22 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hao Yao <hao.yao@intel.com>
Cc: Bingbu Cao <bingbu.cao@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: ipu6: Remove workaround for Meteor Lake ES2
Message-ID: <aAsr_vXdOpKEs3B-@kekkonen.localdomain>
References: <20250311084203.516205-1-hao.yao@intel.com>
 <f8fd0fd4-ca0c-12b5-acc6-ba846b2c9987@linux.intel.com>
 <aAomsUA01Sm5vo1x@kekkonen.localdomain>
 <fb923201-e49c-e61a-bbdf-e67744f2ea6c@linux.intel.com>
 <aAsgQjNEacme1NZU@kekkonen.localdomain>
 <badce13d-bded-4e50-89f5-74538b2c44f7@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <badce13d-bded-4e50-89f5-74538b2c44f7@intel.com>

On Fri, Apr 25, 2025 at 02:28:12PM +0800, Hao Yao wrote:
> Hi Sakari, Bingbu,
> 
> On 2025/4/25 13:40, Sakari Ailus wrote:
> > Hi Bingbu,
> > 
> > On Fri, Apr 25, 2025 at 11:05:54AM +0800, Bingbu Cao wrote:
> > > Sakari,
> > > 
> > > On 4/24/25 7:55 PM, Sakari Ailus wrote:
> > > > Hi Bingbu,
> > > > 
> > > > On Thu, Apr 24, 2025 at 12:18:06PM +0800, Bingbu Cao wrote:
> > > > > Hao,
> > > > > 
> > > > > On 3/11/25 4:41 PM, Hao Yao wrote:
> > > > > > There was a hardware bug which need IPU6 driver to disable the ATS.
> > > > > > This workaround is not needed anymore as the bug was fixed in
> > > > > > hardware level.
> > > > > > 
> > > > > 
> > > > > It is better to send v2 with fixes tag here:
> > > > > 
> > > > > Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device driver")
> > > > 
> > > > Is this worth backporting? Nothing is broken because of this, is it?
> > > 
> > > It is necessary. IPU6 on Raptor Lake share same device ID with
> > > Meteor Lake, this workaround will break camera on Raptor Lake.
> > > 
> > > And Meteor Lake ES2 is not used in product.
> > 
> > Ok, this should be visible in the commit message.
> > 
> > How about adding:
> > 
> > Additionally, Raptor Lake has the same IPU6 PCI ID and x86 stepping and but
> > does have the bug. Removing the Meteor Lake workaround is also required for
> > the driver to function on Raptor Lake.
> > 
> In fact it should be Arrow Lake. I will add below to next version:
> ---
>  Additionally, Arrow Lake has the same IPU6 PCI ID and x86 stepping
> 
>  but does not have the bug. Removing the Meteor Lake workaround is
> 
>  also required for the driver to function on Arrow Lake.
> 
> 
>  Fixes: 25fedc021985 ("media: intel/ipu6: add Intel IPU6 PCI device
> 
>  driver")
> ---

I can just take it from here, no need to resed.

-- 
Sakari Ailus

