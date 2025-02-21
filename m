Return-Path: <linux-media+bounces-26586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B368A3F8D0
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 287C2422C39
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 15:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D8D12116EC;
	Fri, 21 Feb 2025 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYhVXM39"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D426021129C;
	Fri, 21 Feb 2025 15:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151636; cv=none; b=qGMr3J/UXbBqhIBjZygiYI/J7k4S3YMiImjh9PUNQIMkwGzgcEd58opiUgBJdjcXuAhBoiCrQifu0iIG43kYUlM5dzlv5wA1KWclUmd1AFC8ce/lhcMjRA4gM0H+7kXf7zpvmlFun3LrKFT57jPxfW75DOgHW5G6QCxSXPUeq4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151636; c=relaxed/simple;
	bh=Sfehn+vxaohcVVAqSihS41naG90uu0O3ieV6HHFFTfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttuGl8Pn+ni7AyYi12PG5GTz9aUKcCiPBuv7l19joWXapYerbJTky4QgGJ1rMgkG3NHrCEK7+EeHOtDVEuuqR3RJ865YwEr7H418z01hPPDrQQzXK0JvjUB6+P2TwA/NnF4z9eF/Q38lK9VTsYZ4xu7KPJtUQKhBDMdBSt7vs2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYhVXM39; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740151635; x=1771687635;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Sfehn+vxaohcVVAqSihS41naG90uu0O3ieV6HHFFTfg=;
  b=RYhVXM39dyzhnSJeFNQBw60v7BzEv4dRfQEzXAu1k9uVi9Qpkm/R6miE
   UmdaSYX6iTjS5bNKCq+6pV7D/08FLEY+lV1xBNUz+iN9gsu+i4NiF0VQF
   GR+OYJcQONx0EINE8jb4YvdWClKio5f19Lx9Xz7Mxm5UQaFqND81qOgrv
   8KVAozF2SMzT5j3xlW/M2qojm11suQ69+cR5L4nGpyRyFP+IztnPxJ+/c
   O/AvQMwna6qoHO2KfR1PBrLOzMFibXWBvmHmU3DcTTjyzLwVal91sqKp9
   tTI2N53o98tupdDGGHksUbaiki9gYfSJF5TaciyRHGUFcpHdjXyNmG98s
   g==;
X-CSE-ConnectionGUID: y7rbXHGLT6iWvay7ACYPUw==
X-CSE-MsgGUID: /9UuDCOkTY6OJ9OqmEyfUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="51614284"
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; 
   d="scan'208";a="51614284"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 07:27:14 -0800
X-CSE-ConnectionGUID: LLjaei35SCi8ziZO34FEIg==
X-CSE-MsgGUID: naEziUDpSTKMRNtO8rc0Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="152589752"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 07:27:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tlUvd-0000000Dg3A-1782;
	Fri, 21 Feb 2025 17:27:01 +0200
Date: Fri, 21 Feb 2025 17:27:00 +0200
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
Message-ID: <Z7ibRHb2FS1cTx0O@smile.fi.intel.com>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Feb 20, 2025 at 04:39:23PM +0000, Aditya Garg wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FOURCCs with various endian semantics:
> 
> %p4ch   Host-endian
> %p4cl	Little-endian
> %p4cb	Big-endian
> %p4cr	Reverse-endian
> 
> The endianness determines how bytes are interpreted as a u32, and the
> FOURCC is then always printed MSByte-first (this is the opposite of
> V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> allow printing LSByte-first FOURCCs stored in host endian order
> (other than the hex form being in character order, not the integer
> value).

...

>  	orig = get_unaligned(fourcc);
> -	val = orig & ~BIT(31);
> +	switch (fmt[2]) {
> +	case 'h':
> +		val = orig;
> +		break;
> +	case 'r':
> +		orig = swab32(orig);
> +		val = orig;
> +		break;
> +	case 'l':

> +		orig = le32_to_cpu(orig);
> +		val = orig;
> +		break;
> +	case 'b':
> +		orig = be32_to_cpu(orig);

I do not see that orig is a union of different types. Have you run sparse?
It will definitely complain on this code.

> +		val = orig;
> +		break;
> +	case 'c':
> +		/* Pixel formats are printed LSB-first */
> +		val = swab32(orig & ~BIT(31));
> +		pixel_fmt = true;
> +		break;
> +	default:
> +		return error_string(buf, end, "(%p4?)", spec);
> +	}

...

> -	*p++ = ' ';
> -	strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
> -	p += strlen(p);

> +	if (pixel_fmt) {

Technically we can avoid a boolean by checking fmt[2] again here, but I'm okay
with a temporary holder.

> +		*p++ = ' ';
> +		strcpy(p, orig & BIT(31) ? "big-endian" : "little-endian");
> +		p += strlen(p);
> +	}

-- 
With Best Regards,
Andy Shevchenko



