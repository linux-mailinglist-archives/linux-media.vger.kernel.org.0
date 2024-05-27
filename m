Return-Path: <linux-media+bounces-12021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 106468D0EAC
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 22:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41BC91C2128C
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 20:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC02F161314;
	Mon, 27 May 2024 20:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Br4j+KvQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75F65338D;
	Mon, 27 May 2024 20:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716842297; cv=none; b=hYVimp8trqjKw44GytDlDnpuF9hoI4wlDLnMxsQ+MxCq4NISu6WrLskleiMMxYz3Sfa1qNYHGIAzKPSFQ83W47SF4kfbovE6QmDcznjRHIjpqizUCNmJvx61bLvi2EBzwIjaWdkEFh/dUuPQ0PqrXqZyYjaCdckwwKg2Z9yeI8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716842297; c=relaxed/simple;
	bh=5ij4LoZCJaP0Z3WwRoKYheiONp4dxGoT34/7Tch/SL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GUAc3Xt7evGhhxOHgoz5/EJQJbT7sYI4rgl/3ouIokbCFLt7KJhu+ezLJ3VhCk/OnCv3AcHN9RPd2r5mxP1IqpljmW4xy+oW9Vl5H47soNfn6Z3GPCPhoWi+g9XxYyEm+/8EAf7xvgbMUZcYweU8Nm4s5efCvw4qBzZZMvyI9Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Br4j+KvQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716842296; x=1748378296;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5ij4LoZCJaP0Z3WwRoKYheiONp4dxGoT34/7Tch/SL4=;
  b=Br4j+KvQqt05kQ9NrA3fsCU3A3ziPAMqF1FS0r3WvKYIyVWMn6liBwkV
   4P/ktfnfctE2GSL5cqQu9z9DQDjp0xFbZVtfoK7JP6hBrPoSOz3A1N/HM
   8PR68ygJI8jaOpH4lIuX0nlcMvHe5h1f/HvVapUrR+9kG87zawguiMF8K
   jOtdDnhMe6TvL59pRhxXpbqVlrtXtcb3fKXJgqjY6jexAO7op219IlR52
   Vwv2dKWljhvcYc71ilQH7MtcPcgbZxZATQTQhge4MmK07+JrsRN2D80xL
   PLOiaJKugvvEy/6LtRGgB69Q5RGvvn/gPMJW5LHvI58FLsb5oFC67y0xM
   A==;
X-CSE-ConnectionGUID: FjHAV2VuRh6zOCzhKUrj/A==
X-CSE-MsgGUID: xwfm6gF/TkuiSUt9KGUJ8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="11717976"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="11717976"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 13:38:15 -0700
X-CSE-ConnectionGUID: yCvC5PYWRQyenQLni3tKYQ==
X-CSE-MsgGUID: 7w34H7sKRcmaBGSayhQRxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="65660436"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 13:38:09 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sBh6b-0000000BMks-1LiV;
	Mon, 27 May 2024 23:38:05 +0300
Date: Mon, 27 May 2024 23:38:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
	akpm@linux-foundation.org, gregkh@linuxfoundation.org,
	adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
	airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
	vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
	detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
	andrzej.p@collabora.com, nicolas@ndufresne.ca, davidgow@google.com,
	dlatypov@google.com
Subject: Re: [PATCH v9 07/10] lib: add basic KUnit test for lib/math
Message-ID: <ZlTvLS8oTPcvZKQN@smile.fi.intel.com>
References: <20240526175655.1093707-1-devarsht@ti.com>
 <20240526180933.1126116-1-devarsht@ti.com>
 <ZlTu_9orsuosNiGk@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZlTu_9orsuosNiGk@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, May 27, 2024 at 11:37:20PM +0300, Andy Shevchenko wrote:
> On Sun, May 26, 2024 at 11:39:33PM +0530, Devarsh Thakkar wrote:

...

> > +MODULE_LICENSE("GPL");
> 
> modpost validator won't be happy about this, i.e. missing MODULE_DESCRIPTION().

And obviously + module.h in the inclusion block.

-- 
With Best Regards,
Andy Shevchenko



