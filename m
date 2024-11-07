Return-Path: <linux-media+bounces-21035-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A50E9BFFBA
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 09:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0D2C1F23033
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 08:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9399A1D5156;
	Thu,  7 Nov 2024 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNc32DW0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD511D04A0
	for <linux-media@vger.kernel.org>; Thu,  7 Nov 2024 08:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730967024; cv=none; b=C8NtI/zPQO1hEJBD28JpJwQ12PFraQvMDlX6PcK3wLFaP1fW4b0ARNUFz7b0ncaivhwU2SkThDH5S4EoDTxIVMvnNpyG1byt7oj8KXNTlrTKfamkOB6jxcMvKuW3wNgjkTgJ9uySWVQR+GBLKszmLt87qDO9Di83wEnmyxUxEVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730967024; c=relaxed/simple;
	bh=n8lyntdpfiepsf4kkPEEAWQYePDF6bNZi2jObNc0H10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfeAO7MMIRyny+QlDfvFHjy3c4daZoXFSWAF5KH24AmDNh19yhQaXNTw93OccW4qSe2bl5XwY0MF5s8VPwoxymYlvkT/iEziT6OWPO1a/7PvkFfqbgS2YLSZE0xFJgyliGKiNLvXY2WOLJxrlUXSAvubh9zHYsuXWQ0kA5ZXoLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNc32DW0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730967023; x=1762503023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n8lyntdpfiepsf4kkPEEAWQYePDF6bNZi2jObNc0H10=;
  b=jNc32DW0r45VKflCrcmY9iTFgao0WBmlOHTspNjRK9orNLjYZCZPBgh+
   NmefQMtp+JwGB9G7IJlkcqGiV/lbN7O6Gwz/83Rhw9EBE2PK7WgDnoPBJ
   sr+i9U4ZI5DMNMWslWNCIx3Asr9cyJrRbvxR4H1I8anr9nKddCUoL+96l
   KRGAbzGo58wRhcmy9I6y1FEJrukuahoYoajl2C5/URsl/YCumQ7yT7lK1
   D34mpDPiPs3LS/sFlluEYocAIkWjcfPTQHoR5AxMxsQf60gXg2U1sJJUc
   cc+jJR9eW4Hj8KdwZoWrWDpzujHt7FUpSS1t2RcUCsbJRo468KjAeESs0
   A==;
X-CSE-ConnectionGUID: xcaPUcxLQ4+bjeuL5Ff+IQ==
X-CSE-MsgGUID: ZYRtcNPYSaiRtHUbF7Hrsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42200576"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="42200576"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 00:10:22 -0800
X-CSE-ConnectionGUID: Yst46NlrTWCEZnuCDbNI+A==
X-CSE-MsgGUID: PJdDhZmWQK6A21bxfYShcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="108251697"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 00:10:21 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t8xas-0000000CBHN-1mhf;
	Thu, 07 Nov 2024 10:10:18 +0200
Date: Thu, 7 Nov 2024 10:10:18 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: Avoid picking too big sensor resolution
Message-ID: <Zyx16tynGrfuZpBU@smile.fi.intel.com>
References: <20241106215509.40205-1-hdegoede@redhat.com>
 <Zyx1tlwysnNJmcEi@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zyx1tlwysnNJmcEi@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 07, 2024 at 10:09:26AM +0200, Andy Shevchenko wrote:
> On Wed, Nov 06, 2024 at 10:55:09PM +0100, Hans de Goede wrote:

...

> >  		f->width = min_t(u32, f->width, 1920);
> > +		f->height = min_t(u32, f->height, 1440);
> 
> Perhaps umin() instead of min_t() in both cases?

...or min(..., 1920U); and similar for the second one.

-- 
With Best Regards,
Andy Shevchenko



