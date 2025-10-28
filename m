Return-Path: <linux-media+bounces-45872-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D886C168F2
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 20:03:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FDB8188941A
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 19:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A1AB21FF23;
	Tue, 28 Oct 2025 19:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FN9oLFJ6"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B31215E8B
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 19:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761678119; cv=none; b=jkn/mUwCj6OZGd4fQV/IU1yacSZW8IT3pR7QQhr5dVWbJ336FbmtlZJI4PqinrBHy+yQ8TtQSQdCuQY5u4WX4GwM/qyIfu5c2EBg/FJ5mgbcZTox++wAzEW/GbjUJIhMTCzZBsreRep2NWyQcdMyVMimKDbmAJclMAG9YmqSZuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761678119; c=relaxed/simple;
	bh=hGNGFuPw4a8eOOixzNFYWf+hgOLBh++oTY1iuWgA3FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bcyDxzEclm8U7zvP3DPAuZf2xWe686zXicdgAUDawzTQ6ah7MceIBA+pI4Q0qW+cWV6EHS3RSjMhIU6BEDdhWcR8++/NAZiua4UvCvreTk55WnDSsyiyOfDdhCpf80JKn5/9B6XjBKVzygamD/OMaRnIGlgeklqrB9VyMKvtWSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FN9oLFJ6; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761678117; x=1793214117;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hGNGFuPw4a8eOOixzNFYWf+hgOLBh++oTY1iuWgA3FA=;
  b=FN9oLFJ6x8YvLIXML0LsRHnRr5s2Gish+B8nNAER48aZ4IU/xnH+1uIm
   gk7ARO1s42ApejdwOeO9xVY7KE1jxX8IMRQ/edoCwFvH3d73QkD9CKNic
   +S26HZ64fujZTHLs15Qht4LqLNdDdYB/kTYEioDapuhUncW+vJfzXfTuM
   4sgPMUwngdlgMdAEKvrTc/dAKzJGiCRh2IRoqLM/K3YYW0+CPiRi0HKbf
   yTTyi3qsLeOolYKpncvjaWgQ6CAJfB4wI6WPsYBhQmswCBG6ZY1YZ6BZ0
   VC8UEeOXEUma+Ijo20Q5Cv+NdayE0EKGJJxSp4/RySn4mHqSnXNHBXV16
   A==;
X-CSE-ConnectionGUID: ZN+Zw/OFQaqOdETz/ju9Qg==
X-CSE-MsgGUID: csE2KdVARMO4cv+s12wVeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74389740"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="74389740"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 12:01:56 -0700
X-CSE-ConnectionGUID: QRHy7zYiT/CMxZieEWhObA==
X-CSE-MsgGUID: i8pGlj6LRiqJZnvAYBzRxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185355372"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.190])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 12:01:55 -0700
Date: Tue, 28 Oct 2025 20:01:47 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 15/25] media: i2c: ov01a10: Use native and default for
 pixel-array size names
Message-ID: <vkghoohncxnmnuy3zitob62huopp5hpklefgknmc2iuz672hct@f3eebr4emy3n>
References: <20251014174033.20534-1-hansg@kernel.org>
 <20251014174033.20534-16-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014174033.20534-16-hansg@kernel.org>

Hi Hans,

On Tue, Oct 14, 2025 at 07:40:23PM +0200, Hans de Goede wrote:
> According to the OV01A10 product-brief PDF the OV01A10 has an active pixel
> array size of 1296x816. In otherwords the native and active sizes are
> the same.

Isn't that an error in the product-brief ?

I understood the following:

The native pixel array size is 1296x816
The active pixel array size is 1280x800 = these are the active pixels that can
be output.

1296x816 is not lised under the supported image sizes, so it
is not the active pixel array size.

I think in most sensors the active pixel array size is smaller than the
native one.

Or am I confused here ?

> 
> Replace the (misspelled) ACTIVE defines for the default resolution of
> 1280x800 with DEFAULT to avoid giving the impression that the active pixel
> array size is only 1280x800.
> 
> And replace PIXEL_ARRAY with NATIVE to make clear this is the native pixel
> array size / to match the V4L2_SEL_TGT_NATIVE_SIZE naming.
> 
> Signed-off-by: Hans de Goede <hansg@kernel.org>
> ---
>  drivers/media/i2c/ov01a10.c | 32 ++++++++++++++++----------------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
> index d0153e606c9a..f3bcb61c88dd 100644
> --- a/drivers/media/i2c/ov01a10.c
> +++ b/drivers/media/i2c/ov01a10.c
> @@ -34,10 +34,10 @@
>  #define OV01A10_MODE_STREAMING		0x01
>  
>  /* pixel array */
> -#define OV01A10_PIXEL_ARRAY_WIDTH	1296
> -#define OV01A10_PIXEL_ARRAY_HEIGHT	816
> -#define OV01A10_ACITVE_WIDTH		1280
> -#define OV01A10_ACITVE_HEIGHT		800
> +#define OV01A10_NATIVE_WIDTH		1296
> +#define OV01A10_NATIVE_HEIGHT		816
> +#define OV01A10_DEFAULT_WIDTH		1280
> +#define OV01A10_DEFAULT_HEIGHT		800

--
Kind Regards
Mehdi Djait

