Return-Path: <linux-media+bounces-45205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 359F6BFAAF3
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:51:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AE274341253
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B98A2FD7DF;
	Wed, 22 Oct 2025 07:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/puWSqi"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EE72FDC47
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119326; cv=none; b=U8yBoMq+bBDgyhWQggFPws6TO/pZGR9DRd0U1NK97QbRYT9S92KjKAW2RCpg0HCDyZAxJ3WKKzBv+Kvl8bAK/0fAytcMvwshZLsmGNGTy9nLAUifQcg0Zs5hraz/OVfEyf2A9KxSShi4rteXgBtQ0nni/xjER/IhQJ56cm3svzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119326; c=relaxed/simple;
	bh=ybDBv2ELa32GlBvZnmoxQIlGeCYAO15dKrS1338wBTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SYagcTxTnnnFnF376agYjNijrhihF0kw8LZpXduJpyRX0pFJFRCKY4wEouk0ujd8FdBQlahUXLAKlNNcwEQd/VgPMlGpA/ZePQEk4Oyl++uL0tzrblAqmBe2Co6LpW8BHogVFeZjU5FHz7xi/I7UQmKqK8TywNjGNxvjDH4ABJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/puWSqi; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761119325; x=1792655325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ybDBv2ELa32GlBvZnmoxQIlGeCYAO15dKrS1338wBTw=;
  b=Y/puWSqiJutemJh5v9vcGMcOHprrn4GEUPg/haSILCqoHtexssiuQ8lr
   9GgUgAN5WlT4MjtVzjZiVgAc8U0bM96NTcLUa+u8Zrp7lvk80WZzRNCZF
   CXGl0MpaqP4FSnrj6bhi0/YiG+UlyFkp6UqVtlbF6GfC78AGvUcNni+eL
   M/zeYEilJtUSwzHRmRvAc+kbcDTgeZ2SkET0tD+cMrH5kofXDH0o/UViK
   X4q2rJIVSWAZQiUnmINSGnDY/xgX2heqNaT7oiavMK4q2PVGWelE9PiiA
   Ta9DXImG/G/ykGB9s93aIM5Fj8pKBFXtCcToLLI0BxaoPv/gmq3zW4Ly4
   Q==;
X-CSE-ConnectionGUID: A7IJJzRSRae7MthFd5Uohg==
X-CSE-MsgGUID: xv1mvj4LS2CGMRzCLkCfrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73549058"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="73549058"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 00:48:44 -0700
X-CSE-ConnectionGUID: 2JVGz05TR6i+CCYW5FZzeQ==
X-CSE-MsgGUID: yToaA7bIQ2CdzKzZbV1NNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="184288695"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 00:48:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 5059711F87B;
	Wed, 22 Oct 2025 10:48:40 +0300 (EEST)
Date: Wed, 22 Oct 2025 10:48:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 03/14] media: omap3isp: isp_video_mbus_to_pix/pix_to_mbus
 fixes
Message-ID: <aPiMWDmqbYwBacpJ@kekkonen.localdomain>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <1e7330bdeb61565bef5254fa35717a260d9e4633.1760707611.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e7330bdeb61565bef5254fa35717a260d9e4633.1760707611.git.hverkuil+cisco@kernel.org>

Hi Hans,

Thanks for the set.

On Fri, Oct 17, 2025 at 03:26:40PM +0200, Hans Verkuil wrote:
> The isp_video_mbus_to_pix/pix_to_mbus functions did not take
> the last empty entry { 0, } of the formats array into account.
> 
> As a result, isp_video_mbus_to_pix would accept code 0 and
> isp_video_pix_to_mbus would select code 0 if no match was found.
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
>  drivers/media/platform/ti/omap3isp/ispvideo.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> index 46609045e2c8..864d38140b87 100644
> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> @@ -148,12 +148,12 @@ static unsigned int isp_video_mbus_to_pix(const struct isp_video *video,
>  	pix->width = mbus->width;
>  	pix->height = mbus->height;
>  
> -	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
> +	for (i = 0; i < ARRAY_SIZE(formats) - 1; ++i) {

As it seems all users of the formats array depend on the size of the array
and not its contents, could we remove the sentinel entry from the array
instead?

>  		if (formats[i].code == mbus->code)
>  			break;
>  	}
>  
> -	if (WARN_ON(i == ARRAY_SIZE(formats)))
> +	if (WARN_ON(i == ARRAY_SIZE(formats) - 1))
>  		return 0;
>  
>  	min_bpl = pix->width * formats[i].bpp;
> @@ -191,7 +191,7 @@ static void isp_video_pix_to_mbus(const struct v4l2_pix_format *pix,
>  	/* Skip the last format in the loop so that it will be selected if no
>  	 * match is found.
>  	 */
> -	for (i = 0; i < ARRAY_SIZE(formats) - 1; ++i) {
> +	for (i = 0; i < ARRAY_SIZE(formats) - 2; ++i) {
>  		if (formats[i].pixelformat == pix->pixelformat)
>  			break;
>  	}

-- 
Kind regards,

Sakari Ailus

