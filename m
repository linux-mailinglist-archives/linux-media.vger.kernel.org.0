Return-Path: <linux-media+bounces-32026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B9DAAF7B7
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 12:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEFEF4E2E93
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 10:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683AE1C8612;
	Thu,  8 May 2025 10:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kku5pFtZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4851D1ADC97;
	Thu,  8 May 2025 10:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746699740; cv=none; b=PrS0OZ3+1xWIFVTHlklBvP3i15wI/LbhM7rJNxNRWEu6Fk+s0fWpkJdP+2I7x0aLt+O4zkpW17JerJVYEAT6QXEt/dGL9jA7+wfxLYkwYjSkQj1SYf27UAlu2t22WYM8l2LOew9a9xDrCl1mC8YloZbsiW7EjG7FtuWHIFbO5HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746699740; c=relaxed/simple;
	bh=tLVZ7l0uzlnYz3RGAPEntPGU7KyqpAXPp/cok9Dqxok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cjOtmxkxmgy3VuSIon68qrZ4YXxEemTFoxt3vcYbLSIDdbfBSdxByeQWbyLVQ11JJqy5A9I7TJxUUtZWvoY+HW7+Gopmh82KPewgBD7zEXxkCW1DMsBp5snikRd1mzKJWMQKXFnHeHpv0QzG9m8jUyLc7rjJlFk1YBHqUznYAAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kku5pFtZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746699739; x=1778235739;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tLVZ7l0uzlnYz3RGAPEntPGU7KyqpAXPp/cok9Dqxok=;
  b=kku5pFtZ7/UIiHUHm9BEMtQL7InJjkB5cqTcrbPrXPlQSCDXFWs3wFld
   PpfTJASp95m0CP0PU1hOyqftHy03qFMnaStp1HPoyeZ8R9fMeANGcop85
   OPfSBq7RoqiOuViyjNgzkE2AhIDeKv9CkEcw9omaG3kxlXt6Zswqx8NtG
   iuWphFvDGjZN6tMNZC9BnL1gUAbRpHtETym4KOoavHq6p8h5c4vT/B3nB
   C+hnndiKW7fpVOgq7ePE9M/jo2FpsAIObZAhQ9djqXexqLgYb1p+bIeJE
   5RqF2mW57wY0dU0QW7JWbhUAPQxvD7jK/Q27ypapnkJDn6SFFpoD+/O+f
   w==;
X-CSE-ConnectionGUID: s+6+x1gRRfaiwBIoX0YRYw==
X-CSE-MsgGUID: DGVKu/JTTCiVEG3amqfKcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47576644"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="47576644"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 03:22:18 -0700
X-CSE-ConnectionGUID: tT1P/t+xR+GrU1Vj4sRAmA==
X-CSE-MsgGUID: AnhrPIMAQPiNBYVfY/5qZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="137238321"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.168])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 03:22:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 21B7011F90E;
	Thu,  8 May 2025 13:22:14 +0300 (EEST)
Date: Thu, 8 May 2025 10:22:14 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 0/6] platform/x86: int3472: Allow re-using sensor GPIO
 mapping in atomisp
Message-ID: <aByF1gMxTi6FAAQO@kekkonen.localdomain>
References: <20250507184737.154747-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507184737.154747-1-hdegoede@redhat.com>

On Wed, May 07, 2025 at 08:47:31PM +0200, Hans de Goede wrote:
> Hi All,
> 
> This patch series does some small refactoring of the int3472 code to allow
> re-using the sensor GPIO mapping code in the atomisp driver and then the
> final patch in the series moves the atomisp driver over.
> 
> About merging this, maybe the int3472 patches can be merged in time for
> the 6.16 merge window and then the atomisp patch can be merged after
> 6.16-rc1 is released, otherwise an immutable pdx86 branch with the first
> 5 patches will be necessary.

Thanks, Hans!

For the first five:

Reviwed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Feel free to add to the last patch (i haven't looked at the details, but
the approach seems good):

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

