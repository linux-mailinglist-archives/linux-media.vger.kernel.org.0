Return-Path: <linux-media+bounces-7313-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2931B87FE8F
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 14:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8B57285341
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 13:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8351D80027;
	Tue, 19 Mar 2024 13:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haOB4ka0"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3BE3FBB9
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 13:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854477; cv=none; b=ZrlJPcIY2Zrxf+ZDvD/WLDmwr5UU8LbibodXv2BNk3c409IXmBBH3zP2D9iyOpIIV3nZV9sXfN63N5PxDOmcVICzJFMmkgeYtqgswLFRSoeJs2Hv5dwsl2aWMQrPUV6AB89mnswJ6JStmR6ItYYzcJwhFLdAoxDuuhRotOuAu/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854477; c=relaxed/simple;
	bh=9flzhiWJqfczqGg2YEpjfj56v02V7WTnWc/QuI/JhAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Le0a9x4NWG2fwFJCvwzrE4Ic1bYmIgdpy0jsKpNoH5atWh7MrMFw33CPs1sH4xJmd+VsPDW8BN/bSecUZhV7u4OAlWjHpkmRmcCTGEiDSCZfqRBhl0KTRaD0lWIPEWvJJhmX+oIH82gWr4K3+dlWeOd4iF+pZbJ9lpLWEB11BVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haOB4ka0; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710854476; x=1742390476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9flzhiWJqfczqGg2YEpjfj56v02V7WTnWc/QuI/JhAY=;
  b=haOB4ka0l16/Rt06jGjnpMorHlgVmqVRWPlH+1tsRHsg3u4CsjzByCX9
   0AxQeqI9U7jLmUzj76rcV8SgUmksquFdk9xP9TIcZSInkjrKRLcXIJu0z
   z/Rds9GorZT9ZhbWrPCsOKU9Irw1+4PTBVioO+igqIlwsKwzZWQkdN7F+
   7njqBoq797Nh8iZneaARrqyqhXGlOHzd+Beo9BV/GKPoWKMtr0lxrE9Cy
   mHnCz8FkclR4gmuH/F09lzjviCnDYUWKpEdodz0iQgAVFBWgf/2eJplgd
   mgmeTofW4hy2t3sh8Suvaz1+GrYCD/WvHEvg6oTsVN36MH/Bb2L3OgqKs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="17125196"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="17125196"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 06:21:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="14467723"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 06:21:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C596E11F853;
	Tue, 19 Mar 2024 15:21:09 +0200 (EET)
Date: Tue, 19 Mar 2024 13:21:09 +0000
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
Subject: Re: [PATCH v8 01/38] media: mc: Add INTERNAL pad flag
Message-ID: <ZfmRRd4o0VDZFZbj@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-2-sakari.ailus@linux.intel.com>
 <86a51397-d0a9-4875-a3e8-fb4526b340f4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86a51397-d0a9-4875-a3e8-fb4526b340f4@ideasonboard.com>

On Thu, Mar 14, 2024 at 09:17:08AM +0200, Tomi Valkeinen wrote:
> > @@ -381,6 +382,13 @@ Types and flags used to represent the media graph elements
> >   	  enabled links even when this flag isn't set; the absence of the flag
> >   	  doesn't imply there is none.
> > +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> > +       -  The internal flag indicates an internal pad that has no external
> > +	  connections. Such a pad shall not be connected with a link.
> > +
> > +	  The internal flag may currently be present only in a source pad where
> 
> s/source/sink/
> 
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Thanks, I'll fix that for v9.

-- 
Sakari Ailus

