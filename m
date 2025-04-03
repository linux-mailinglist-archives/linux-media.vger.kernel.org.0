Return-Path: <linux-media+bounces-29330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 697D1A7A4AD
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 16:09:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 688DA176A01
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 14:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927A624EA8D;
	Thu,  3 Apr 2025 14:05:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9946645C18;
	Thu,  3 Apr 2025 14:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743689157; cv=none; b=eTdBWRffYICO6WfG8s0NWdl0wSZMSTJOXj5EnuJFMO+qnDbIayT5/vwLZzMv35Wa3SO/AxtSHm5TQDd+wcl16XktN8zVngwMYMCg9VYjwfWP2LW5cn49TAMvWnsSvOWQN+yoGA1Prz6nIWxLNKVtaS28BiWsnlQkoSr8u3R5Ks0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743689157; c=relaxed/simple;
	bh=PYnPutNqMUnp5M2wGqeL7kuooL43hFPQyqTo7HkQ9/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjLarr8ie1kO3OEomJtu+1I8wO5sou9ukUOx7FNnRlF3fBjbvJxzPlKnd4vpMqSg/NuWyR9i7qFx8ry5lxOOSGhsdcYBGXEPU5VnvdJF9M5LruU+EebnnIgrB5QB1JfWilnB9dd0DP2IG379ENxBBQ/A649JrzYIfcG/eX9f7fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: GlR9QPOUTf+EyGoMiCMokg==
X-CSE-MsgGUID: cmEpQjOPQH6lwwsCUCBd3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="44983421"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44983421"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:05:55 -0700
X-CSE-ConnectionGUID: wnwoBHTBQKC+Zas90gmtmQ==
X-CSE-MsgGUID: ltcCiUu0TZ6rpx3QYERWYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="131145303"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 07:05:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1u0LCX-00000008pfL-3xe1;
	Thu, 03 Apr 2025 17:05:49 +0300
Date: Thu, 3 Apr 2025 17:05:49 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Duane <duanek@chorus.net>, platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 0/9] platform/x86: int3472: Add handshake pin support
Message-ID: <Z-6VvbH3XZxIxjLq@smile.fi.intel.com>
References: <20250402202510.432888-1-hdegoede@redhat.com>
 <CAHp75VfxjYQ=RzeYUWP7gu=xJ=f1gH=VGXz_cBRqBvkfSH02ow@mail.gmail.com>
 <37de4bf2-c6c1-4d16-9f04-c0d9152dfe7b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37de4bf2-c6c1-4d16-9f04-c0d9152dfe7b@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Apr 03, 2025 at 12:30:29PM +0200, Hans de Goede wrote:
> On 2-Apr-25 11:02 PM, Andy Shevchenko wrote:
> > On Wed, Apr 2, 2025 at 11:25 PM Hans de Goede <hdegoede@redhat.com> wrote:

...

> > Offtopic: I sent you a message asking about AtomISP patch queue
> > status, but no answer. I understand that you are kinda very busy,
> > still it seems we missed one cycle for the patches you already have in
> > your queue. I haven't investigated where the bottle neck happened,
> > though. Hence just asking what's the plan with them and other patches
> > that are already in the mailing list (I have received at least two
> > that I was Cc'ed on).
> 
> Yeah, I've been burried in work a bit, so this fall through the cracks.
> 
> I've some more bandwidth now and I have a mailfolder with all
> the pending atomisp patches in there. I plan to start merging these
> soon and to send out an atomisp pull-request for 6.15 well in time.

Ah, cool! Don't hesitate to ask for a review the patches I haven't seen
for AtomISP driver.

-- 
With Best Regards,
Andy Shevchenko



