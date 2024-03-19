Return-Path: <linux-media+bounces-7314-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6808887FED3
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 14:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D62E1F227B8
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 13:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9957A8002D;
	Tue, 19 Mar 2024 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hA60o7bR"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59887F7C1
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 13:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854867; cv=none; b=Yy5xw4tcgGWjTqLMqLj+DJyIFIRmtWnX5+B/Ch1i2iIZJfSm90LZx5dsLldLHxZNxjmiNJGuE0GhvaauNx5Y/xviFxrjtxzap4O/Q6lEXLUzlD0pYCBkYQDbR0GVKA37D3QywkqeusR1PHWRVHbdzHzY5ItGTgc3FPsbDZL7kvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854867; c=relaxed/simple;
	bh=oBUbVhNO10LoVPnIxcfgtHjka6SyoAWdIiP0ws/U8B4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvO9EMRrPaiUCY1yjB5pffdP3C5woYEOneoAFyAdpzMjh6zXUTnvZrFc6hjvzljkbKOOFp5klbvnN++NR3PPSSxGMrJWxtdJTHET09kozGe4liL2Ra1vfxFwKKEh8UUuaSHc6cZfN2AC/j7nOjc8CiTFvG5rKCgoxElpCqau0l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hA60o7bR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710854865; x=1742390865;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oBUbVhNO10LoVPnIxcfgtHjka6SyoAWdIiP0ws/U8B4=;
  b=hA60o7bRjntBsTCiBKcgm4ZadOo2U8tYwmylyX5li5MDUT4vrsTbkXnC
   So6CgU3ukihJFy8lVSrOisu7VqVQ04BwmlEZrqa0XL41GMfolQCpZb/3v
   yqOteHqEX8XtXERY2pRwwyWvbvzKItUyMJ6mE/LY4eaFBartb1tYQVJxk
   dvPrJ+oRWTjYH/1z5FxV25XT3uEv1vubgaYgh1hyDD/6P8aNYANgGqgqk
   ydsn1WzPHOlpEg+PZt2f2/L3hZabpxa+PSAuNtjujJCkZLZVSNZuGiBlK
   OE1WXmwAR14BD1JqEM8lIsjroWGPWXsv8lkbL1eBzTxRb3pu2smNWDOmc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="17126226"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="17126226"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 06:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="18383751"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 06:27:42 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1CA9211F853;
	Tue, 19 Mar 2024 15:27:40 +0200 (EET)
Date: Tue, 19 Mar 2024 13:27:40 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 03/38] media: uapi: Add generic serial metadata mbus
 formats
Message-ID: <ZfmSzM7kL_Si2pRW@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-4-sakari.ailus@linux.intel.com>
 <ff9d63d0-528a-4afb-a85a-fcb8633fec07@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff9d63d0-528a-4afb-a85a-fcb8633fec07@ideasonboard.com>

Moi,

On Thu, Mar 14, 2024 at 09:30:50AM +0200, Tomi Valkeinen wrote:
> On 13/03/2024 09:24, Sakari Ailus wrote:
> > Add generic serial metadata mbus formats. These formats describe data
> > width and packing but not the content itself. The reason for specifying
> > such formats is that the formats as such are fairly device specific but
> > they are still handled by CSI-2 receiver drivers that should not be aware
> > of device specific formats. What makes generic metadata formats possible
> > is that these formats are parsed by software only, after capturing the
> > data to system memory.
> > 
> > Also add a definition for "Data unit" to cover what is essentially a pixel
> > but is not image data.
> 
> The CCS spec talks about legacy packing and optimized packing for 16+ bit
> formats. You cover only the "legacy" ones here. Did you look at those?

The reason is that the bus data layout of the new packing at higher bit
depth matches with packing at lower bit depths (half to be precise). That's
why there's no need to define formats for the new packing methods at higher
bit depths (the driver simply uses the packing at half of the bit depth).

-- 
Terveisin,

Sakari Ailus

