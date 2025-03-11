Return-Path: <linux-media+bounces-28015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0D4A5BC9B
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 10:48:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7598E188D660
	for <lists+linux-media@lfdr.de>; Tue, 11 Mar 2025 09:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A00221B9F4;
	Tue, 11 Mar 2025 09:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLlapSMF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8671DDC1D;
	Tue, 11 Mar 2025 09:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741686488; cv=none; b=oHfaLItbHbeovph804hGk4d/GOe4PfvSrqYxKNEbijfD2COqDPjmLoMyi1BlFVb9/zGFCXwY57yxxkU056fsa5mO3zAkLXfCSDyAVpss52KHyWV4HwjHURvxjnr1a2Q3H17taqH03QQyNs21r2+Ar/pDd8k8KArZfIOLHsctmco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741686488; c=relaxed/simple;
	bh=X8Lq5Nc+lcKUd1ahVl/hf0cTUAUK19srf04e+JxmWow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+jTz7x60BmKjQbvEq+xV5+RaX4fDujiAqdF8+Ddhi/7ZMDmoMzXh8jR9doepbCe4PQvjaSHP+8twnsLZ8ZRtLMfB5yWS2JPY42jqfbko9dRQSKOWiXqIrTFNGPi71NpBkCPkfC7SlSK8ptxeQnLr3tvmf60Z4UiaAGVBx9xz+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLlapSMF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741686487; x=1773222487;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=X8Lq5Nc+lcKUd1ahVl/hf0cTUAUK19srf04e+JxmWow=;
  b=lLlapSMFMLKPzyZISf7mDBwY2jLbAkuaizlrCIGqkiYk0MqE4YP2+SCr
   Krr3/e4Vt8p07MBoZuikjO3orAHbbUXg7LUVZkE1Ceva/RBuuqomXy49A
   IO1qUmymxjHXDMPfBdm0+a6Nq3R7CeEEHmsLcCeThMmqXanUm5l5vzqt7
   OdKO6W8sDW3zMif8CJg24TstmUKRzLWLFvFKm1LwyIBmtAMpgK+XMAkl/
   +5UG70uMsZ13EAiIBfFxYvIARqm3imnRLgqzsJh6ioFInDtvTf0dxiT+x
   17weqKsXOgs6HUgHlFio1Hc4D6CpIbO51hM7IhStpVRwSz9oH9fjfHthZ
   Q==;
X-CSE-ConnectionGUID: ztz/WL7mRW6H3g96rBsGOQ==
X-CSE-MsgGUID: qCx+mXgnRmqPkkM6IwbkmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42569559"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="42569559"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 02:47:52 -0700
X-CSE-ConnectionGUID: sIaWXje/TKS0/s7n8j2nLA==
X-CSE-MsgGUID: uvyFR+/ARRqxhlFwHqvXQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; 
   d="scan'208";a="119990044"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 02:47:50 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1962F11F7F2;
	Tue, 11 Mar 2025 11:47:48 +0200 (EET)
Date: Tue, 11 Mar 2025 09:47:48 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: shravan kumar <shravan.chippa@microchip.com>
Cc: mchehab@kernel.org, kieran.bingham@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	conor.dooley@microchip.com, valentina.fernandezalanis@microchip.com,
	praveen.kumar@microchip.com
Subject: Re: [PATCH V7 2/4] media: i2c: imx334: common reg value correction
Message-ID: <Z9AGxJuk7V-QPKW1@kekkonen.localdomain>
References: <20250305051442.3716817-1-shravan.chippa@microchip.com>
 <20250305051442.3716817-3-shravan.chippa@microchip.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305051442.3716817-3-shravan.chippa@microchip.com>

Hi Shravan,

On Wed, Mar 05, 2025 at 10:44:40AM +0530, shravan kumar wrote:
> From: Shravan Chippa <shravan.chippa@microchip.com>
> 
> correcting the CPWAIT_TIME value as per the data sheet
> for the link frequency and input clock
> 
> Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>

I've postponed applying this one once we have a better understanding what
that change actually is and why Tarang would seem to want to revert it.

> ---
>  drivers/media/i2c/imx334.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> index db61b298ceb3..0b42bc0470a1 100644
> --- a/drivers/media/i2c/imx334.c
> +++ b/drivers/media/i2c/imx334.c
> @@ -191,7 +191,7 @@ static const struct imx334_reg common_mode_regs[] = {
>  	{0x31a0, 0x20},
>  	{0x31a1, 0x0f},
>  	{0x300c, 0x3b},
> -	{0x300d, 0x29},
> +	{0x300d, 0x2a},
>  	{0x314c, 0x29},
>  	{0x314d, 0x01},
>  	{0x315a, 0x06},

-- 
Kind regards,

Sakari Ailus

