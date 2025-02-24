Return-Path: <linux-media+bounces-26806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21839A41BCA
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 11:57:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72EEB1895A93
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67907257AED;
	Mon, 24 Feb 2025 10:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1k8JJGX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAB4257ACA;
	Mon, 24 Feb 2025 10:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740394648; cv=none; b=ljza60MH58/Xo4DauZNIR9IvVUiFVP5lARnnMddivy0ZsBSDphvapXN0HE60KpEbopSGB95Q/213fOgokQfeMoDt5m4QuVDDDdwzzE8sLGAqPNKNFF6XUxbTNeMd0o5E1MkKGDaE3XfM1ahhsx7n4E0RptclRZYGpyfNHG26BaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740394648; c=relaxed/simple;
	bh=7hfsHgL/INpLXjgYIikKyfu88EoC0IKBjD6nLFbtgU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VzGs/eHpQdSNfnPx23x3TimU7BDwpgsHtpoSqbA8a/dfYeBlJ4j8mNL2xXMG+jdXttyrAwbIltbk0OWislGffZbWcrU+Af9qLiy76dLyJrl0XcHlMIbZmijC6fZsWdl04OH99oudgLU/F54kyGl0kkDUfS/K+St9V+XbDKS3ATk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1k8JJGX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740394647; x=1771930647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7hfsHgL/INpLXjgYIikKyfu88EoC0IKBjD6nLFbtgU0=;
  b=Y1k8JJGXvhH60fmOXf3tkJZb6hPjCFRbh6Lx6alXqrUWsipwPrjc53E8
   aL7CFcrcbjjUf9o5p2WPqGuxIGNH8uEUthUPuSoVIGdU+shxXQ7u9oHr9
   UkRhXf8tBDopN5jI2Oqy4ntDt1kQDqGxFsKYlXn1vBtqBZdK64sCMyVgv
   2P4/fwErlfxocZPD1MOsO4nEzP0BYpnJeOSjY+WqwMxVk5osNxLA0Qza1
   ahz4Jp3tEZjxBfwSibrJ1+vLUlhiJAl0mrp6A/Pzm7NE3gSB4RfiXbbBQ
   aEAcQH8tTItTwv2yQQIJObX3ewQ1M20CX/MgEXoP0uBgdWlGlDOhXVabm
   g==;
X-CSE-ConnectionGUID: 4JoCJs8WTBCtCQLx6FPysA==
X-CSE-MsgGUID: vzl46NoPT6K2z9Pv/IvOJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41282466"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41282466"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 02:57:26 -0800
X-CSE-ConnectionGUID: ES+jTAJtSXKQ2sETxQyyEQ==
X-CSE-MsgGUID: BpUwIM6JRqagnvcwet6SMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120150992"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 02:57:20 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmW9D-0000000Efl5-0aOo;
	Mon, 24 Feb 2025 12:57:15 +0200
Date: Mon, 24 Feb 2025 12:57:14 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: "pmladek@suse.com" <pmladek@suse.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>,
	"linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
	"tzimmermann@suse.de" <tzimmermann@suse.de>,
	"airlied@gmail.com" <airlied@gmail.com>,
	"simona@ffwll.ch" <simona@ffwll.ch>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>,
	"kekrby@gmail.com" <kekrby@gmail.com>,
	"admin@kodeit.net" <admin@kodeit.net>,
	Orlando Chamberlain <orlandoch.dev@gmail.com>,
	"evepolonium@gmail.com" <evepolonium@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	Hector Martin <marcan@marcan.st>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"asahi@lists.linux.dev" <asahi@lists.linux.dev>,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Z7xQikQeHLOHb1G8@smile.fi.intel.com>
References: <16F819E8-E866-4552-BB08-31486D2BA8C5@live.com>
 <4DA18DF6-4C41-4D45-9DD4-B82E043B3320@live.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4DA18DF6-4C41-4D45-9DD4-B82E043B3320@live.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Feb 23, 2025 at 03:16:28PM +0000, Aditya Garg wrote:

> > Looking at the header files, it looks like doing cpu_to_le32 on that variable and doing le32_to_cpu will actually reverse the order twice, on big endian systems, thus technically all way would not swap the order at all.
> > 
> > I'm not really sure how to manage the sparse warnings here.
> 
> Not sure whether the maintainers would like it, but we can do something like this:

This is not what we want, I believe. And this looks like a reinventing a wheel
of cpu_to_*() and *_to_cpu() or similar macros.

> 	case 'l’:
> #ifdef __LITTLE_ENDIAN
> 		val = orig;
> #else
> 		orig = swab32(orig);
> 		val = orig;
> #endif
> 		break;
> 
> 	case 'b’:
> #ifdef __LITTLE_ENDIAN
> 		orig = swab32(orig);
> 		val = orig;
> #else
> 		val = orig;
> #endif
> 		break;

-- 
With Best Regards,
Andy Shevchenko



