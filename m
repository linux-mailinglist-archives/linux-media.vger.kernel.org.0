Return-Path: <linux-media+bounces-26638-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB31A400A7
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 21:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B6067AE205
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 20:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804B8254AED;
	Fri, 21 Feb 2025 20:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CahYxV7c"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E524C25333A;
	Fri, 21 Feb 2025 20:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169110; cv=none; b=Ijyhp53aB9szf0cItTB9C0nc6iL9ALWMmIyggYF6G2FXGp/jtQtpxuSRyCOH+LbygP00WXsFYo6sedUukEbsa+lFTcm/QrgNHYp7UlQlENfyaeh4EF8vsho+vCnWkDqhPOFY1PvFMT3zqReuO9i4f6WC+Guo82la3armA/A3L5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169110; c=relaxed/simple;
	bh=S/2hGfrFysJuEd0unIxyyVV+UbHaC4Fe/uh7YjUz8Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGgKgZgJWqVHEllgSNyeZOen1UKPzHhqzw2toVOMymV9eYgqU0PkBHPscWI7bPfoPqhy52mPSsG4ILibzlS2SACqAny0w5ONWIMuiSnN9pLeuD+hysY2kc7g0GYMcvjweiIBpZArinfme8/8a+zVWVHPwbeQF9Y8fqb8ievG+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CahYxV7c; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740169109; x=1771705109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=S/2hGfrFysJuEd0unIxyyVV+UbHaC4Fe/uh7YjUz8Ms=;
  b=CahYxV7cTKQULcos5wuIdZ8y2Ci9WVKWbksMTLWuOs4ZgwiJGkFzlWAT
   e8rLF73DkfrANHhQ7thWOkUI8H0eHVhoZUW4ECGP8OLcCjzfsvzi2rXpN
   4q0/zj31BIYutrCGpLiGuzclxNtWwGkHpE/0S0mLxqf85NFJ71tVwxHFF
   6rzb18T/033Ywt7JW/vB4QCkNcVCGzDoHMsIpHdJdZhpvJJ7qflnLtNKc
   D6YL1jacZP0XMSrr2M9UrArO/rIpmmJr8N17FXXnXaPpLlq9m4plQhr3r
   8m8qvBd6aZuioheO2R1hHNQgylFDIdX+2K7jrYAmvRZkix4Te0OfF2rDY
   A==;
X-CSE-ConnectionGUID: 1H7mO8qESF+0izX5lpe98Q==
X-CSE-MsgGUID: YYGc8vW8SImS9EVsf2iSmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="41143554"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="41143554"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 12:18:28 -0800
X-CSE-ConnectionGUID: 88ZxKzAJRuW9VMb7P1uFew==
X-CSE-MsgGUID: yH8yGsrgTQuJiHoU/ePCeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="120566440"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 12:18:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tlZTU-0000000Djsq-2C8r;
	Fri, 21 Feb 2025 22:18:16 +0200
Date: Fri, 21 Feb 2025 22:18:16 +0200
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
Message-ID: <Z7jfiKNt-bThVr_-@smile.fi.intel.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <98289BC4-D5E1-41B8-AC89-632DBD2C2789@live.com>
 <Z7ib8uH91rKdoyjP@smile.fi.intel.com>
 <ED4B4FD3-CD26-4200-97E0-BC01B3408A4C@live.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ED4B4FD3-CD26-4200-97E0-BC01B3408A4C@live.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Feb 21, 2025 at 07:37:17PM +0000, Aditya Garg wrote:
> > On 21 Feb 2025, at 8:59 PM, andriy.shevchenko@linux.intel.com wrote:
> > On Fri, Feb 21, 2025 at 11:37:13AM +0000, Aditya Garg wrote:

> > First of all, I do not see the cover letter. Is it only an issue on my side?
> 
> These are literally 3 patches that are self explanatory.

So what? Anybody will be puzzled with the simple question (and probably not the
only one): Why are these in the series? Do they dependent or independent? What's
the goal and how they should be routed? (You see, there are already 4).

> Is this a hard and fast rule that a cover letter MUST be there?

Cover letter SHOULD be there if there are more than one patch.
Yes, there are exceptions, but this is the idea for the series.

Use your common sense, if there is no documented thingy.

...

> > Second, don't issue versions too fast, give at least a few days for the
> > reviewers to have a chance on looking into it.
> 
> Sure, I’ll take care of that.

Btw, _this_ is very clearly documented.

-- 
With Best Regards,
Andy Shevchenko



