Return-Path: <linux-media+bounces-26786-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB9CA419B8
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55E503AEC08
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B1C2500C9;
	Mon, 24 Feb 2025 09:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gX4xJkYD"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1E424E4B7;
	Mon, 24 Feb 2025 09:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740390918; cv=none; b=WbibGb+3NTLGmknPR3kUGwqWU8mElDbTu16BChLyDjRObpY6YnYtE1SFzG7ro9qIM8/BOKQcPudNwzFvgbH7djsOJAld2/VUrVbb3xQdXkvJGxE/SPsgZMBlJzpU0mrgzNjDN1oJaMewQpaWka1uY4Q0P0OpKH6ZMQO+r7823qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740390918; c=relaxed/simple;
	bh=1ilvj0oDQeThsIG8wBY8lof+2A6deA3Sr4q3qxryDVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QMM7MiI4Q1R65nYZPcwlH4rnkItChnVbCc1oTDCjco1oAT4k1t7og9gKKULZb/83rIAby+OZY5qqK0MRIvA9vMKmXlutJS+sOnnKH1hrhAsR9goQW+tPXni1JP+2Dq/DBZTjvG2AieGFPEoeL+dzNBBC/MM2w0VlqCzKirkSwQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gX4xJkYD; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740390917; x=1771926917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1ilvj0oDQeThsIG8wBY8lof+2A6deA3Sr4q3qxryDVo=;
  b=gX4xJkYDz44whQIiIslBU7wPE51awO3ARrB5WbjBE/7allBy4bbYy5XO
   EDIoKQWitUmKYhZom5ymyk6B5aQOnW2E/ArCFTU0eE8IFifbnXTQ+djG4
   l+XEAm/4eTo7TkvqFO69q0SABbkVrbxRrEoHetmRW1CdDZ+oMsWn4zu1U
   rTPbvcuoW7mnK0QXtbLfF22Iyht66U5NkxCAv0s+wbuLkrbedgmxqaWAY
   bfpPgSUQRRlQeIby35MLMvThVk0oC+JEFsNx5LicDglr30Bm1ET4JjBcv
   NVWC93ffvPaK6nTFLRxPXTgvnQdWz0OqJCfXX1k+q1SUNUwTBc6Je4cd9
   g==;
X-CSE-ConnectionGUID: Y658+ayFSQazQKCw/RLf7Q==
X-CSE-MsgGUID: S4G1EQNwRaauum5phCbQgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="52538795"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="52538795"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 01:55:16 -0800
X-CSE-ConnectionGUID: lC++JjrHQvqYs+QjHqNAUg==
X-CSE-MsgGUID: xy0XPd+SSduIhKi6mf0hPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="153213616"
Received: from smile.fi.intel.com ([10.237.72.58])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 01:55:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmVB1-0000000EeoE-3eVf;
	Mon, 24 Feb 2025 11:55:03 +0200
Date: Mon, 24 Feb 2025 11:55:03 +0200
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Aditya Garg <gargaditya08@live.com>,
	"pmladek@suse.com" <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>,
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
Subject: Re: [PATCH v3 1/3] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Message-ID: <Z7xB9xD6748bF9vJ@smile.fi.intel.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <Z7ig8Br4duEt2TUG@smile.fi.intel.com>
 <27efffe1-6562-4612-a748-893475ba02fa@suse.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27efffe1-6562-4612-a748-893475ba02fa@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 24, 2025 at 10:19:13AM +0100, Thomas Zimmermann wrote:
> Am 21.02.25 um 16:51 schrieb andriy.shevchenko@linux.intel.com:
> > On Fri, Feb 21, 2025 at 11:36:00AM +0000, Aditya Garg wrote:

...

> > > +	for (x = 0; x < pixels; x++) {
> > > +		pix = le32_to_cpu(sbuf32[x]);
> > > +		/* write red-green-blue to output in little endianness */
> > > +		*dbuf8++ = (pix & 0x00ff0000) >> 16;
> > > +		*dbuf8++ = (pix & 0x0000ff00) >> 8;
> > > +		*dbuf8++ = (pix & 0x000000ff) >> 0;
> > put_unaligned_be24()
> 
> I'm all for sharing helper code, but maybe not here.
> 
> - DRM pixel formats are always little endian.
> - CPU encoding is LE or BE.
> - Pixel-component order can be anything: RGB/BGR/etc.
> 
> So the code has a comment to explain what happens here. Adding that call
> with the _be24 postfix into the mix would make it more confusing.

I'm not objecting the comment, the code has definite meaning and with the
proposed helper it makes clearer (in my opinion).

Comment can be adjusted to explain better this conversion.

Or, perhaps pix should be be32? That's probably where confusion starts.

		pix = be32_to_cpu(sbuf32[x]);

		/* write red-green-blue to output in little endianness */
		put_unaligned_le24(...);

?

> > > +	}

...

> > > +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = {
> > > +		3,
> > > +	};
> > One line?
> > 
> > 	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] = { 3 };
> 
> I'd be ok, if there's a string preference in the kernel to use thins style.

Just a common sense to avoid more LoCs when it's not needed / redundant.

> Most of DRM doesn't AFAIK.

-- 
With Best Regards,
Andy Shevchenko



