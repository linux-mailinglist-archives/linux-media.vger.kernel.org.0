Return-Path: <linux-media+bounces-12272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC608D5235
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 21:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36987B24AF4
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 19:19:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99D3E8288A;
	Thu, 30 May 2024 19:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+c7aIZ7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF332481C6;
	Thu, 30 May 2024 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717096790; cv=none; b=VYMCKO0H0+q3J6kDgO1wNusrxp5EPRz9Gikj3X7a9hFWvWrQwMJWZ4DpJAnf7xGdJvEtJv+7pFSx3Br4pOz+no5X/K1MZtDPbNer4IbnCaO3egTHw2lZI7GcdD5aNRxq6jSC4bPdX6CYIBSlDv4IFf3BdGeS/7xzcTQcRe+YSY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717096790; c=relaxed/simple;
	bh=sp3+UKyu7QZRBKVkZbrdlt6UzICleSS/gZ25TAZe1eY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBRUVA8YoYcN+l9ML0N2mcxkMeIdc8ufsge6YRBdl29AYAItqsKyqR/o8KRJbsbPImZGGHpytqUxze7EknfaiSq2s12J0WzDdo9om3bU/cOBeUmE5lwYOwIw8ca6AMPMPkCbr2GAFgSL8fJtBnWfbfHwHy4qBJNXOGDKe+sVo84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+c7aIZ7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717096789; x=1748632789;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sp3+UKyu7QZRBKVkZbrdlt6UzICleSS/gZ25TAZe1eY=;
  b=i+c7aIZ7v+II/KyZgf9dnaQlfWhydFbjP27ArpVHUiWiS1t+wnlY2YcQ
   tF6mojyzOMGSa8A3ZW4VGtgKTSDbD0UiEkttmqehu+bf2nKKhFrEhJBG4
   gzdau0uczVextRjbhF/2l61WzqBc4nd6yBYc9dFIieEubdlmGWhChp7BN
   PxMW/Gkr6VkkL63crn0Du4M010Zk6i23/c6fndFoAjO8seosj7skgOrTW
   Xx6x8hJvRlZ6HndEra/Sp6xMa34rFMsa0OWKO+ugEMdl5vgWpuzmhAuSs
   slDe6/UXgkBksivMo0kMBejqp9csoBySvL4NWNZdCN7Spz8d+cBJ+hHv/
   Q==;
X-CSE-ConnectionGUID: SqA9Mi/8Qyyjwzf7vNYWvg==
X-CSE-MsgGUID: GnF9zCJvR9eZGtRM910pxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="31140613"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="31140613"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 12:19:48 -0700
X-CSE-ConnectionGUID: dlisauIEQ164ZcDr/2yrog==
X-CSE-MsgGUID: 03UwKfwDRxyNWOAbeKQYZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40826362"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 12:19:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sClJJ-0000000CHRR-2XT4;
	Thu, 30 May 2024 22:19:37 +0300
Date: Thu, 30 May 2024 22:19:37 +0300
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
Subject: Re: [PATCH v10 06/11] math.h: Add macros for rounding to closest
 value
Message-ID: <ZljRSXtXWdOyCJaB@smile.fi.intel.com>
References: <20240530165925.2715837-1-devarsht@ti.com>
 <20240530171225.2749312-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530171225.2749312-1-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, May 30, 2024 at 10:42:25PM +0530, Devarsh Thakkar wrote:
> Add below rounding related macros:
> 
> round_closest_up(x, y) : Rounds x to closest multiple of y where y is a
> power of 2, with a preference to round up in case two nearest values are
> possible.
> 
> round_closest_down(x, y) : Rounds x to closest multiple of y where y is a
> power of 2, with a preference to round down in case two nearest values are
> possible.
> 
> roundclosest(x, y) : Rounds x to closest multiple of y, this macro should
> generally be used only when y is not multiple of 2 as otherwise
> round_closest* macros should be used which are much faster.
> 
> Examples:
>  * round_closest_up(17, 4) = 16
>  * round_closest_up(15, 4) = 16
>  * round_closest_up(14, 4) = 16
>  * round_closest_down(17, 4) = 16
>  * round_closest_down(15, 4) = 16
>  * round_closest_down(14, 4) = 12
>  * roundclosest(21, 5) = 20
>  * roundclosest(19, 5) = 20
>  * roundclosest(17, 5) = 15

...

> + * Examples :

It's inconsistent with the other one below.

> + * 	round_closest_up(17, 4) = 16
> + *
> + * 	round_closest_up(15, 4) = 16
> + *
> + * 	round_closest_up(14, 4) = 16

The three have TABs/spaces mixture.

I believe you wanted:

 * Examples::
 * * round_closest_up(17, 4) = 16
 * * round_closest_up(15, 4) = 16
 * * round_closest_up(14, 4) = 16

...

> + * Examples:
> + *
> + * 	round_closest_down(17, 4) = 16
> + *
> + * 	round_closest_down(15, 4) = 16
> + *
> + * 	round_closest_down(14, 4) = 12

As per above

...

> + * Examples :
> + *
> + * 	roundclosest(21, 5) = 20
> + *
> + * 	roundclosest(19, 5) = 20
> + *
> + * 	roundclosest(17, 5) = 15

As per above.

-- 
With Best Regards,
Andy Shevchenko



