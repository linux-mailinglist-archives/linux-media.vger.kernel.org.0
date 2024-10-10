Return-Path: <linux-media+bounces-19351-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B959988AA
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 16:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EA95B29D4C
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2024 14:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001AA1CB31A;
	Thu, 10 Oct 2024 14:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6maQH/W"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA631BFDF7;
	Thu, 10 Oct 2024 14:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728568944; cv=none; b=mBSVcreOFsNZFn5VLSBqmAHAeSLMA3jpEw4yP7CXIN7MiC1YfE4z3HhYLawEAy3o8E6wMDU8LuZCzhbgzXBEO+y76Yd9KyeRQFJ1IQTinSWVd6m1fGISaz7M8iykWvIsGN9vemzUdxNSRZw4KcKLsyCoIorkefPjXGSVz8QnuUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728568944; c=relaxed/simple;
	bh=WgANwihm9KBwZ5LTDgL6K6TpZ4A9WaoqCH1uyV6Q22k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFLxQFjyVu6/Bn8gH43ZdK5JFHjGi1L8DiRvz/ukGT3xkCSn2POXpf+a6ISa2trTlr0Z8ffN6q/12uAjNdn0PjFoOLaMsMd2UUQ1QmIOzDSSmZU4RtOh2a3PI+X4J6YAurqXL8z4pPSKGjb256JpUjRiG7fxhyqXq6RKlFGMxPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6maQH/W; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728568944; x=1760104944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WgANwihm9KBwZ5LTDgL6K6TpZ4A9WaoqCH1uyV6Q22k=;
  b=P6maQH/WesQB8MvAfxlUpA4t1OqmIlLDE4la+dqRsQxYTfRR9wmZ5cHf
   ffd9EfLPEYdYFxEULmq7iYbRUjCuAc40Q/fIETAAslXP4y1fPVPZPUoJh
   YkfsWmdxuRiY2y9d6pMudVqWckbN6OSycXdg13JcGmtjpOeTCcJKxdLbf
   RaP9My8o0NDvPOgq8L5DHjhxNprs05X3gRUs/qpr/BGWZOJ+5XFpJSVRA
   KBavVKj9kpQxMvgru63LTnR2PaPJEH4FYJr+UE2Wx0DgIYye0XCFSfRk1
   MrFIRz6cDP/fce0xegQ0/Q/pkNf5HZ+bzXGEeaSvQvcvCJ8nEZ/580tAV
   g==;
X-CSE-ConnectionGUID: rWvcabtvTWeZnpq+cLZFmg==
X-CSE-MsgGUID: dBQA/zDSQGiltX91sd4Skg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="28059221"
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="28059221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 07:02:23 -0700
X-CSE-ConnectionGUID: 2Ym4+BdvSXm1gEUOZMKBTA==
X-CSE-MsgGUID: SvIH2XcoSXGgWcI2dFQefg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,193,1725346800"; 
   d="scan'208";a="107441181"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 07:02:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sytk9-00000001YUV-3yrw;
	Thu, 10 Oct 2024 17:02:17 +0300
Date: Thu, 10 Oct 2024 17:02:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH 11/13] media: i2c: ds90ub960: Handle errors in
 ub960_log_status_ub960_sp_eq()
Message-ID: <ZwfeafBHg6Kgbh7G@smile.fi.intel.com>
References: <20241004-ub9xx-fixes-v1-0-e30a4633c786@ideasonboard.com>
 <20241004-ub9xx-fixes-v1-11-e30a4633c786@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004-ub9xx-fixes-v1-11-e30a4633c786@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Oct 04, 2024 at 05:46:42PM +0300, Tomi Valkeinen wrote:
> Add error handling for i2c read/write calls to
> ub960_log_status_ub960_sp_eq()

Missed period.

...

>  	u8 eq_level;
>  	s8 strobe_pos;
>  	u8 v = 0;

With that change in place you may remove redundant assignments to 0 here
and everywhere else where is not needed anymore.

> +	int ret;
>  
>  	/* Strobe */
>  
> -	ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
> +	ret = ub960_read(priv, UB960_XR_AEQ_CTL1, &v);
> +	if (ret)
> +		return;

-- 
With Best Regards,
Andy Shevchenko



