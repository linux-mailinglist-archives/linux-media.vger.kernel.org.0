Return-Path: <linux-media+bounces-10108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C56B8B1E0B
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 11:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D88C41F21EC1
	for <lists+linux-media@lfdr.de>; Thu, 25 Apr 2024 09:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64CE84D12;
	Thu, 25 Apr 2024 09:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6ZCeykg"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78B928F7
	for <linux-media@vger.kernel.org>; Thu, 25 Apr 2024 09:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714037503; cv=none; b=iCza8u4EPoav20tqLv7PbAJnX5DFsqZNOoARttYQaD7Lelu93e0/ZhJtojPWhg4Cc1IA6LlpQywIycc8ClCLwtl2OreC+wv2MzWT+LxfX1RiJETvfTz8NNi99GpvDLpLZvg3G6XCEp2fZyDKCvQZU1BPIXnEjWI71Mqzqnk6qAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714037503; c=relaxed/simple;
	bh=1UOoLoO307bPICIv12DHZsNYzjpMihyaS3VTK90r9KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvA5sanuHWUrMTJ5E7BiK2rL6jQTtzr+WJlZpz1zIcswoFtp7lLl5vXxcPXBX/twrueRV87GdD1sxzKIQQ4CT+RxWyZSGXYwa/OmRwgHoUfjHVTMGCr6859OhKS8YdKMJUOjf+cJT3t9AQBEBTZXFjjB93r6RHRfrLkRMc+ouuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6ZCeykg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714037502; x=1745573502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1UOoLoO307bPICIv12DHZsNYzjpMihyaS3VTK90r9KQ=;
  b=U6ZCeykgmcdy0bs/rIxhEs0k+dRAiZztiPhlS+NaMU5MG+0M+OAQYVEU
   Rfnv1aCI1RxtGpS1yzvqrX9CkF0C11Y0gbH1/4MrJ6qZuX5wUVYEqkjNe
   0+xGECr5TKbpSZICHa5TH+eLC203S7FquRjzO5z/zcf0mpAchfxyC5jng
   bCYXP9g8iXdk6oW+1z3X+F6qmAglCzVilZvqpYBYGeH6RlojHWRUXfghU
   /6MEG/7RPFiyuTt6WUwRZadVOZ6zRTmjNfoURCZlsVehmiSujAe3BDXHS
   w3YddMi0yB2UfbREEjLMNJOL/R6HXkYobxs3v5rsSi19UWyYI596J4ZiQ
   g==;
X-CSE-ConnectionGUID: e8pWOxAxQjaqW+PCkCYYJg==
X-CSE-MsgGUID: gZxpLJflROqQH3wBh+zu7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9580578"
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="9580578"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:31:40 -0700
X-CSE-ConnectionGUID: HVmbZYiLQKyyhgKWhB9oTA==
X-CSE-MsgGUID: vloPb9rwS7652VdyMPCshQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,228,1708416000"; 
   d="scan'208";a="25077016"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 02:31:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rzvS4-00000000woH-1BDt;
	Thu, 25 Apr 2024 12:31:36 +0300
Date: Thu, 25 Apr 2024 12:31:35 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [GIT PULL FOR v6.10] media: various fixes
Message-ID: <Zioi9944CkqSeUlY@smile.fi.intel.com>
References: <eafd2ebe-ed0b-43f4-b067-2ea5a26e4585@xs4all.nl>
 <Zikfl71LbB4HQLO3@smile.fi.intel.com>
 <81f3e1f6-4e80-41f0-82d8-df852f15f7e8@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81f3e1f6-4e80-41f0-82d8-df852f15f7e8@xs4all.nl>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 25, 2024 at 08:30:19AM +0200, Hans Verkuil wrote:
> On 24/04/2024 17:04, Andy Shevchenko wrote:
> > On Wed, Apr 24, 2024 at 01:48:04PM +0200, Hans Verkuil wrote:
> >> If there are no objections, then I plan to push this tomorrow.
> > 
> > No, only one thing is if it's possible to have
> > this one Message-ID: <20240423192529.3249134-2-andriy.shevchenko@linux.intel.com>
> > to be reviewed and included?
> 
> I saw Andrew Morton picked up this series, so I dropped the stih-cec.c patch
> from my pull request.

Fine by me, thanks!

-- 
With Best Regards,
Andy Shevchenko



