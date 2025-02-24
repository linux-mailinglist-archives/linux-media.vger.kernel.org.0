Return-Path: <linux-media+bounces-26804-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CCCA41BA5
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 11:50:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4689D3AB051
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0DB9255E26;
	Mon, 24 Feb 2025 10:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIbGB0/J"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95DD24C66A;
	Mon, 24 Feb 2025 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740394134; cv=none; b=A22/MA1TE/GW6dBt21TesxfXMZDbr52eGO4fkRnPXscbqEsl3O8Z4cSg+cGcKLa7g2PcPMW94HPCf9B3rVdcx8irV+ZpNndDlUgL7m1ABcWM1it6a3v/6vu7cG1IYworw98R/DFzEaQMEplJAf9BhyTp1u6QZQkEv3OP8yZRnJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740394134; c=relaxed/simple;
	bh=OtIOQaQoJLBkpZbs4145CiVHNBvcVb5nGQVLgTK4vEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qll4VDjzStPCugBvuMKD/8Ekkbaod+RphFD7IRIUJDA4fDSWc/1AjDR6d5xAZWZPtGJe7HAoVn7CYgLiG2Bw5BA3qjLfExi2gJXp2YiXcY5xEOJTSGA+2arhFBftL4ioOmwmn/ytkpLni0giDC+kaPYTS4DiHSi59MjZvMWMKYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIbGB0/J; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740394133; x=1771930133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OtIOQaQoJLBkpZbs4145CiVHNBvcVb5nGQVLgTK4vEI=;
  b=MIbGB0/J13BEccObtTd5BgWOu65Zb1/5VakC+1pEJrYMaDWLTGG64oxV
   e0bAya4PVVSeUJd/f8ps+gis5YNbiRTHP0f6MnrVj/W750pnL6iblO3YR
   XRhOBjeQOysvSRxPC/1aMeQ2//WL1TWSX4QJpEW+8Mqz4K6t7ik3weml3
   cmL6BhMnHhNOEOKuEvE/dpmThVEQRbjL0y7HwIJ80MjLHyRfqJvH2G9Qe
   W5pLprM3T9F404rqTngf8QZWeIPvz9PwA6YpWriJ0mk/IuMjykeKQrm5I
   G9AtnDg0+jMprUs7muTSOk0thzgZshDy2H+bSz/P6ySIxdAjMml9yKlNy
   Q==;
X-CSE-ConnectionGUID: 8VRGrqfcSpCxiZmyLt+ScQ==
X-CSE-MsgGUID: JkYzoda2Sgio4TGq/jlxRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="63612350"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="63612350"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 02:48:52 -0800
X-CSE-ConnectionGUID: I0KWzrBmTauijSdEfky6AQ==
X-CSE-MsgGUID: wqtI++JaSbCVnWW5Q/CAoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="139249147"
Received: from smile.fi.intel.com ([10.237.72.58])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 02:48:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1tmW0u-0000000EfdP-23DT;
	Mon, 24 Feb 2025 12:48:40 +0200
Date: Mon, 24 Feb 2025 12:48:40 +0200
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
Message-ID: <Z7xOiK92jFfDqujz@smile.fi.intel.com>
References: <716BCB0A-785B-463A-86C2-94BD66D5D22E@live.com>
 <C66F35BB-2ECC-4DB8-8154-DEC5177967ED@live.com>
 <6CB20172-906F-4D13-B5E4-100A9CF74F02@live.com>
 <Z7xCr4iPmIkPoWGC@smile.fi.intel.com>
 <PN3PR01MB9597CF2907CBBD6ED43D5E62B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7xIxFT-eB_OTGzm@smile.fi.intel.com>
 <PN3PR01MB9597FA2077E6FD498E8CDDD9B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7xMt2Kp1pFuMar2@smile.fi.intel.com>
 <PN3PR01MB9597DDF5CD7965128C2075DBB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PN3PR01MB9597DDF5CD7965128C2075DBB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Feb 24, 2025 at 10:43:54AM +0000, Aditya Garg wrote:
> > On 24 Feb 2025, at 4:11 PM, andriy.shevchenko@linux.intel.com wrote:
> > ﻿On Mon, Feb 24, 2025 at 10:32:27AM +0000, Aditya Garg wrote:
> >>>> On 24 Feb 2025, at 3:54 PM, andriy.shevchenko@linux.intel.com wrote:
> >>> ﻿On Mon, Feb 24, 2025 at 10:18:48AM +0000, Aditya Garg wrote:
> >>>>>> On 24 Feb 2025, at 3:28 PM, andriy.shevchenko@linux.intel.com wrote:
> >>>>> ﻿On Sat, Feb 22, 2025 at 03:46:03PM +0000, Aditya Garg wrote:
> >>>>>>>> On 20 Feb 2025, at 10:09 PM, Aditya Garg <gargaditya08@live.com> wrote:

...

> >>>>>>> %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> >>>>>>> it's useful to be able to print generic 4-character codes formatted as
> >>>>>>> an integer. Extend it to add format specifiers for printing generic
> >>>>>>> 32-bit FOURCCs with various endian semantics:
> >>>>>>> 
> >>>>>>> %p4ch   Host-endian
> >>>>>>> %p4cl Little-endian
> >>>>>>> %p4cb Big-endian
> >>>>>>> %p4cr Reverse-endian
> >>>>>>> 
> >>>>>>> The endianness determines how bytes are interpreted as a u32, and the
> >>>>>>> FOURCC is then always printed MSByte-first (this is the opposite of
> >>>>>>> V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> >>>>>>> allow printing LSByte-first FOURCCs stored in host endian order
> >>>>>>> (other than the hex form being in character order, not the integer
> >>>>>>> value).
> >>>>> 
> >>>>> ...
> >>>>> 
> >>>>>> BTW, after looking at the comments by Martin [1], its actually better to use
> >>>>>> existing specifiers for the appletbdrm driver.  The driver needs the host
> >>>>>> endian as proposed by this patch, so instead of that, we can use %.4s
> >>>>> 
> >>>>> Do you mean this patch will not be needed? If this a case, that would be the
> >>>>> best solution.
> >>>> 
> >>>> I tested with %4pE, and the results are different from expected. So this
> >>>> would be preferred. Kindly see my latest email with a proposed workaround for
> >>>> the sparse warnings.
> >>> 
> >>> %.4s sounded okay, but %4pE is always about escaping and the result may occupy
> >>> %4x memory (octal escaping of non-printable characters). Of course, you may vary
> >>> the escaping classes, but IIRC the octal or hex escaping is unconditional.
> >> 
> >> %.4s is used for unsigned int iirc, here it's __le32.
> > 
> > No, it's used to 'char *'. in case one may guarantee that it at least is
> > four characters long.

> Still the argument here is __le32. %p4h is showing reverse values than what
> %4pE as well as %.4s shows.

For __le32 the %.4s will print from LSB to MSB and otherwise for __be32.
You can provide any conversion you want to have it stable between
the endianesses. In any case looking at the DRM patch it might be that
the entire driver got the endianess wrong. Have you checked my comment
there?

> >>>>>> [1]: https://lore.kernel.org/asahi/E753B391-D2CB-4213-AF82-678ADD5A7644@cutebit.org/
> >>>>>> 
> >>>>>> Alternatively we could add a host endian only. Other endians are not really
> >>>>>> used by any driver AFAIK. The host endian is being used by appletbdrm and
> >>>>>> Asahi Linux’ SMC driver only.

-- 
With Best Regards,
Andy Shevchenko



