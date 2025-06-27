Return-Path: <linux-media+bounces-36092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3C4AEB645
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 13:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BB7E7B0475
	for <lists+linux-media@lfdr.de>; Fri, 27 Jun 2025 11:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A3E2C08DF;
	Fri, 27 Jun 2025 11:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/ZjrE1i"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6498D2BF01C;
	Fri, 27 Jun 2025 11:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751023550; cv=none; b=fCae55vj5Vi3u4DfocGtzgkqLsxMWCANlTcZgOVVTw5rB8FYAe0tYRKz2UhCGF5KEtyi/MMDFfHzWlZ/LIJnqY6v9XnMQny8aTVPfo8di77R3uZHasuUE4/hvrfhhy4n1tukHnNrTdWtUfkC0vCIf77YWZwSF/9GE2vvXhb6wjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751023550; c=relaxed/simple;
	bh=Euvq24AZjpFuxasyR5DYxDf8px8ML+BoSiYByPWdCJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1HYXSTPzObjgVL/Wf08U1ZD/Nj15nNM/hHRl8d2mNT5/Xhx0ZttpxVJDs30FzW7TEH9XuXUr0YGuPQ+lfSMX3LIZe3vUGNiDg1TBOL6q4l0scy+crhvjhSpkDsysMF02/h9XrCgc12CMKoXgdreEmvUGwRQcrb4R0wTgmwbhu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/ZjrE1i; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751023550; x=1782559550;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Euvq24AZjpFuxasyR5DYxDf8px8ML+BoSiYByPWdCJ4=;
  b=P/ZjrE1itnms5iZQuxG+U6FmXav3myP8SSS4LcU1WhChLokStGiCWSIG
   R1yR2MRKgYm5lShXgRi8Vt4hQQSKdUdSXr3Mcz+RFgl939RMbp3gTahUr
   aGkkyq0s7ctGZTXeGYc0agNihQp4CscSRryuq7wl/p9DRaNVt2DUpEYJC
   9rqLBEwrRU4xxEHu1nYkYGMPNXdw4xx09CadCvBl9m+QcBRNBpL5jmSAA
   x5hL0LDqrECRdaaHybgTFLlq/tzjJD6Q6jelkTTAxv+iyDmvxuvCrShg9
   YzDmDElkxKN36G5SLOmDGab8dNwNe7d/E9HMOiThe2+/bAFtbiPl1VvED
   A==;
X-CSE-ConnectionGUID: M2pNcMJRQ/eZ4/htGQIMWA==
X-CSE-MsgGUID: CA3nwAApQtek+sQTR7ix0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53208739"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="53208739"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:25:49 -0700
X-CSE-ConnectionGUID: LPjdLtjBQV+FJKWsQfJBCw==
X-CSE-MsgGUID: cjAbBIO8SyG59+On3GS47w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; 
   d="scan'208";a="152960200"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 04:25:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uV7DB-0000000ASnS-3uJv;
	Fri, 27 Jun 2025 14:25:41 +0300
Date: Fri, 27 Jun 2025 14:25:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	viro@zeniv.linux.org.uk, thomas.weissschuh@linutronix.de,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v2 0/3] add dma noncoherent API
Message-ID: <aF5_td2Bb2vsAJ43@smile.fi.intel.com>
References: <20250627101939.3649295-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627101939.3649295-1-xu.yang_2@nxp.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jun 27, 2025 at 06:19:36PM +0800, Xu Yang wrote:
> On architectures where there is no coherent caching such as ARM it's
> proved that using dma_alloc_noncontiguous API and handling manually

dma_alloc_noncontiguous()

> the cache flushing will significantly improve performance.

> Refer to:
> commit 20e1dbf2bbe2 ("media: uvcvideo: Use dma_alloc_noncontiguous API")
> commit 68d0c3311ec1 ("media: stk1160: use dma_alloc_noncontiguous API")
> 
> However, it's obvious that there is significant code duplication between
> these two commits. Beside, a potential user USB Monitor may read outdated
> data before the driver do dma sync for cpu which will make the data

DMA
CPU

> unreliable.
> 
> To reduce code duplication and avoid USB Monitor result unreliable, this
> series will introduce dma noncoherent API to usb core. And the USB core

DMA
USB

> layer will manage synchronization itself.

-- 
With Best Regards,
Andy Shevchenko



