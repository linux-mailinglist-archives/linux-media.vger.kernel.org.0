Return-Path: <linux-media+bounces-26788-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E4DA419FA
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 11:02:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C7723B78AE
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B8D24292F;
	Mon, 24 Feb 2025 09:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIwc1H79"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428E5241CA6;
	Mon, 24 Feb 2025 09:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391101; cv=none; b=f3FYzAbVj3AMMeuq3t1x/8hyWmQAAdEXFhpgoazs3aOhLwg1Bf5BdwsWSw5eMI8ZTfbmvd3dAoEUvPKLAWqQF8Lyb8CYoiSJCsOne59TFDpsYg+sgB2fZN4QjbOrBODCbP5Xg+1As8EjqKKF+NjxqUQxS0pBi054v6kqODKXbFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391101; c=relaxed/simple;
	bh=nAiaU3xwjMDNRMLJw8qN9OXA1uMi4hAnYos+MNgxPWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdTgid5Ay+BMvRRjBZ19DYqZE/igxvPmFzU0u1VUBQoj/Gh2R1Hx4G8557L4Bg/agUNavO5PWLUNnHz1dW0vuJdevKrj7khRwYMR8hk7q29SK1160uZ/6L7PTrlteuIJuBrfV3xvl6pENq7KsPkftImCVCPEw0DWDbyKYsg8lVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIwc1H79; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740391100; x=1771927100;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=nAiaU3xwjMDNRMLJw8qN9OXA1uMi4hAnYos+MNgxPWo=;
  b=gIwc1H79NKR+8XApGQXGJ1bj0iBAsr0NFDkYg07gDhEEl9z6uhPz5aum
   bCYJP89IgFpOslUS2xvO3cVuJ+IPTixG0kEpWS2Yb9+BsL7s9rIcb8sM0
   bRLXHWy5UZYvJmGwvaaHzgPgOoOHJGVqOx3wAI7ky41xdRptEvEe1+GYH
   8ECxINfXEmRnRKFc1/VQLzHoCepUWc+joC3nL8C7hY9Na+QKUDoL3LxD8
   p7BzoFuWDZl7Ok+HazfjicX9f1GJzxSbTb41VbLX2sEl66I5N3frwvVEo
   rI8kcsUuqQf1/hNvG/AvQKfQvWp7xJHdZmRt3oCBMARBEx2iz+6WNjv4D
   Q==;
X-CSE-ConnectionGUID: MNsXkAJ/T9KU9b+CUpDRzQ==
X-CSE-MsgGUID: l2FIXTfFRRu4SBJjMnUlMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41349421"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41349421"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 01:58:19 -0800
X-CSE-ConnectionGUID: 11TMVs8TQuSz6IfVkUqtCg==
X-CSE-MsgGUID: zRpSnxCBTH6o2zWgA+I+MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="116206670"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 01:58:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmVDz-0000000Eequ-1e5o;
	Mon, 24 Feb 2025 11:58:07 +0200
Date: Mon, 24 Feb 2025 11:58:07 +0200
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
Message-ID: <Z7xCr4iPmIkPoWGC@smile.fi.intel.com>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
 <6CB20172-906F-4D13-B5E4-100A9CF74F02@live.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6CB20172-906F-4D13-B5E4-100A9CF74F02@live.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sat, Feb 22, 2025 at 03:46:03PM +0000, Aditya Garg wrote:
> > On 20 Feb 2025, at 10:09 PM, Aditya Garg <gargaditya08@live.com> wrote:
> > 
> > %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> > it's useful to be able to print generic 4-character codes formatted as
> > an integer. Extend it to add format specifiers for printing generic
> > 32-bit FOURCCs with various endian semantics:
> > 
> > %p4ch   Host-endian
> > %p4cl Little-endian
> > %p4cb Big-endian
> > %p4cr Reverse-endian
> > 
> > The endianness determines how bytes are interpreted as a u32, and the
> > FOURCC is then always printed MSByte-first (this is the opposite of
> > V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> > allow printing LSByte-first FOURCCs stored in host endian order
> > (other than the hex form being in character order, not the integer
> > value).

...

> BTW, after looking at the comments by Martin [1], its actually better to use
> existing specifiers for the appletbdrm driver.  The driver needs the host
> endian as proposed by this patch, so instead of that, we can use %.4s

Do you mean this patch will not be needed? If this a case, that would be the
best solution.

> [1]: https://lore.kernel.org/asahi/E753B391-D2CB-4213-AF82-678ADD5A7644@cutebit.org/
> 
> Alternatively we could add a host endian only. Other endians are not really
> used by any driver AFAIK. The host endian is being used by appletbdrm and
> Asahi Linux’ SMC driver only.

-- 
With Best Regards,
Andy Shevchenko



