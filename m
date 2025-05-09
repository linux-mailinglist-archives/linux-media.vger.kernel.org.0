Return-Path: <linux-media+bounces-32077-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFACAB0ACF
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 08:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67E83A00650
	for <lists+linux-media@lfdr.de>; Fri,  9 May 2025 06:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8942E26C398;
	Fri,  9 May 2025 06:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRjwk5/0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8FF26C3A3
	for <linux-media@vger.kernel.org>; Fri,  9 May 2025 06:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773038; cv=none; b=fj7vOppOPHNGw/I2LqzSF++6DOfJIFn90s/ple44QvZDXRBV4iy2UUBMcsPIjAhK8flcFC+NS3rgcDI0keyQYo3NIcIRmG4LHuBTMh/RZil6r34RAb1C8s5Zo71FnkNXjV5Rmls606ZnMJ+ow6l3g/u5dYNAirDO7eX8Dok86dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773038; c=relaxed/simple;
	bh=MFMpMDKvhZe7C/vZ0T9cAWULSx6sKaq+OVfQl7SKJh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMOltiEKIGKPbm8zK8TmM6Mjhoj679/8hC7TQsJhtU4CbsQpwOngqdTPuUnA/GiqlN+n98Gcthu83AZd5ZsVfasANOnPkqRo2sGhKX24RykBYEkDL2r5M0ESNoxzbgwCaN2KwYy2TWfr0xOQRlH50ZxUoM5rO0cLyEpTq36FTik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRjwk5/0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746773036; x=1778309036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MFMpMDKvhZe7C/vZ0T9cAWULSx6sKaq+OVfQl7SKJh0=;
  b=IRjwk5/07LAkLApgZ8N+IXCFA5RdZ539L8Sa4lrHcLQTm7F/eEMDwBqm
   SuSrcFDMAcQvU90HzxrYz2S8bbm4i9Br6y0YhOr7iJ4tKT56r2j9XOC63
   PU3XMcYIXWwkBfE5hxusgghzeH78r8pgb1/KvDMtTkVbB/8N0ZmAndgKq
   PCwfRotiASilGekZa6RYhqBJrFbTbQ5j52eHkDQ21lfuA7xtBySq7lrTx
   jxDvLqd+1rqbTyRV4FWUotdU2RyyTIS/d5V8/hy3Lb6pLd4MCdMixWoyL
   If9D0hNk0pMrchYvEwuPOdLM6NcpZ7UBSzmwOT0YCztsubwGCPOhtkJZp
   g==;
X-CSE-ConnectionGUID: l2zXPhGbQ/m9//eQDJfp6Q==
X-CSE-MsgGUID: C9hIKegmS0a3FffpqbwJVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52392732"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="52392732"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 23:43:56 -0700
X-CSE-ConnectionGUID: D8p+KCOtR86ezuQNOMvtuA==
X-CSE-MsgGUID: vUiClVvaS4q2i0OQlCg8wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="167601788"
Received: from sgruszka-mobl.ger.corp.intel.com (HELO localhost) ([10.245.83.20])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 23:43:54 -0700
Date: Fri, 9 May 2025 08:43:51 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
	Hans de Goede <hansg@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Subject: Re: [PATCH 1/1] media: ov02c10: Use div_u64 to divide a 64-bit number
Message-ID: <aB2kJ6rOoAac3M8Z@linux.intel.com>
References: <20250509062511.1092490-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509062511.1092490-1-sakari.ailus@linux.intel.com>

On Fri, May 09, 2025 at 09:25:11AM +0300, Sakari Ailus wrote:
> The ov02c10 driver divides a 64-bit number but reply relies on division
> operator to do that. Use div_u64() so this will compile everywhere.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>

> ---
>  drivers/media/i2c/ov02c10.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 9e3d4a4e12ce..089a4fd9627c 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -497,8 +497,8 @@ static int ov02c10_init_controls(struct ov02c10 *ov02c10)
>  		ov02c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  
>  	/* MIPI lanes are DDR -> use link-freq * 2 */
> -	pixel_rate = link_freq_menu_items[ov02c10->link_freq_index] * 2 *
> -		     ov02c10->mipi_lanes / OV02C10_RGB_DEPTH;
> +	pixel_rate = div_u64(link_freq_menu_items[ov02c10->link_freq_index] *
> +			     2 * ov02c10->mipi_lanes, OV02C10_RGB_DEPTH);
>  
>  	ov02c10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &ov02c10_ctrl_ops,
>  						V4L2_CID_PIXEL_RATE, 0,
> -- 
> 2.39.5
> 
> 

