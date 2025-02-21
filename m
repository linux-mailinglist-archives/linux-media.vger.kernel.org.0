Return-Path: <linux-media+bounces-26639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E209EA400B0
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 21:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7B184409FE
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 20:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD8D253358;
	Fri, 21 Feb 2025 20:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8eI8Dba"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B841FBC86;
	Fri, 21 Feb 2025 20:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169335; cv=none; b=SR/Tauqj/q+5HHMpaqjeH9A06FcaoxA0CrrELWJVi2gvkSXE5ChkTmZFOAshEyyKk5Nz+SIh/q4YI1to2EzigvP4B2UaDUqp8a2D31RFMhIH00+XGZPGzSIVNjthBg9ECyrLz2oHX8dgkVc35JFCftHTPGe1iHuNexjJ3gkOOMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169335; c=relaxed/simple;
	bh=AUzvSnv84EpX4e4E79CiVNx0gt1v4fC+4XcCV1madfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0IvfgKS7cQWF5RFJ/EsULw6St1/x+VsVkM7K+Dfz0ZwJpf/dl84nfwEW6vRg8rY2HtkV47bmyGsFjSliS/3ff8Eaw2HuS3PlQE6t5ZHnmuvn1ZZxRaPWiHk1/RMJu8zoV6J39uFjjFD/b2HFIjwro3rRJwiOLN/nVhCbyIzvh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8eI8Dba; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740169334; x=1771705334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AUzvSnv84EpX4e4E79CiVNx0gt1v4fC+4XcCV1madfA=;
  b=D8eI8DbaaoqdX4FxvOfTqKOJMVJ++A6wRQDicgr/BEnuAtznRbux1qKT
   D9NZSJ/nNSAPslCmyo79RVIQpV0dHweRKJHIzNUVV/ev5r0lEbcXQBBKq
   tsZ7fAbi/YcMmv7AGh13EifM21IiBd8fAOvhD5Q52OhuoMxQFKY0ojqeF
   GN/A9Eui/+2LoNAOCyXcD+y61JO+6Uum0HLq4IqZB3ACipQRuH851WD+L
   0GSbjyohnpFPZR6bbTWXVPr/lHVk3MEC3QBSz1icD1J4PFWc1OVwlXYZj
   byYsssaRfPDtLrDxCaRDLGfRI9lLDx4Ghrd5FPuWZQFxrjLWC9kwVK00u
   w==;
X-CSE-ConnectionGUID: fn/OUDdORsCpyYs2OSyNLw==
X-CSE-MsgGUID: 6tfSuU1wQ1iJa0elppgN2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="44650206"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="44650206"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 12:22:13 -0800
X-CSE-ConnectionGUID: X3EO2ExMQRaPtqTxAjtKxw==
X-CSE-MsgGUID: ztBA2dFsRaKo1BmM0ylV9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="120442343"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 12:22:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tlZX6-0000000Djvj-2poe;
	Fri, 21 Feb 2025 22:22:00 +0200
Date: Fri, 21 Feb 2025 22:22:00 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	Andrew Morton <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	Kerem Karabay <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
	Orlando Chamberlain <orlandoch.dev@gmail.com>,
	Atharva Tiwari <evepolonium@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	Hector Martin <marcan@marcan.st>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v3 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Z7jgaL0u8VzN-12X@smile.fi.intel.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
 <Z7ib8uH91rKdoyjP@smile.fi.intel.com>
 <ED4B4FD3-CD26-4200-97E0-BC01B3408A4C@live.com>
 <Z7jfiKNt-bThVr_-@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7jfiKNt-bThVr_-@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 21, 2025 at 10:18:16PM +0200, andriy.shevchenko@linux.intel.com wrote:
> On Fri, Feb 21, 2025 at 07:37:17PM +0000, Aditya Garg wrote:
> > > On 21 Feb 2025, at 8:59 PM, andriy.shevchenko@linux.intel.com wrote:
> > > On Fri, Feb 21, 2025 at 11:37:13AM +0000, Aditya Garg wrote:
> 
> > > First of all, I do not see the cover letter. Is it only an issue on my side?
> > 
> > These are literally 3 patches that are self explanatory.
> 
> So what? Anybody will be puzzled with the simple question (and probably not the
> only one): Why are these in the series? Do they dependent or independent? What's
> the goal and how they should be routed? (You see, there are already 4).
> 
> > Is this a hard and fast rule that a cover letter MUST be there?
> 
> Cover letter SHOULD be there if there are more than one patch.
> Yes, there are exceptions, but this is the idea for the series.

FWIW, two more points:
1) yes, it's a MUST for some subsystems (BPF has this even documented);
2) there are tools (`b4`) that rely on the cover letter (shazam feature
or multiplying trailers if it/they was/were given against the cover letter).

> Use your common sense, if there is no documented thingy.

-- 
With Best Regards,
Andy Shevchenko



