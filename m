Return-Path: <linux-media+bounces-7311-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B38A87FE76
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 14:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB154B235E4
	for <lists+linux-media@lfdr.de>; Tue, 19 Mar 2024 13:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F093180BEB;
	Tue, 19 Mar 2024 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVt0fQ1J"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADC080636
	for <linux-media@vger.kernel.org>; Tue, 19 Mar 2024 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710854043; cv=none; b=rmGqwhoHkZR4XgHDpd2xCn7eLjXkEbF8/w9A8JSf/xedA1hatgb8Ua1Sgp9BnJ0GL9i6w4JdKP5qzQ650ThOVr6GDwN4XELojq9CEM+ik3W9NwFjzq78jLr74wwUv81sRT6HyH2UyzZf+5Bs90QWFvGqhWbIa65ZCSDGlxhPnFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710854043; c=relaxed/simple;
	bh=79fmBC7ORHLMKs2PVJ8fks2uK23X4rPlQauWpfw1xY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBiqd75JhewRp38xPXVsXS2DkZT1OLSThYvVOfZihpis3AXWcxxiUAQw51nhocBpucvEL2e2V+wMR6iE5q0nk9FQaAPWqAvDLMWZIXDO+QFcZ9Z6mHiqB3izZQT8MwUQnnJsMf0nmAupTTAgryOaVfbFnohB77uEPV/Bu8MZYbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVt0fQ1J; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710854042; x=1742390042;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=79fmBC7ORHLMKs2PVJ8fks2uK23X4rPlQauWpfw1xY8=;
  b=RVt0fQ1JxrYT+mY+gJph8DsNNYvboSxWWdPw3yizGH9djzjwNSJAnMDL
   kNwFl/W87B6HRqXjFMHP4nePtVj6yh9PlH1AdSlyqDWr1M6zgB8eSKrGw
   N6ApLC7X7RViG2yjM50976rc/ki0oAXN/sIQ4pmvOLjwGaBXkVdErkafr
   ptOuUEVStJ+ZhcVGC02JE0PClTBqdlg5eagn2l9FTThwxCbVQZCJjDeIS
   Ocmbyt9UPFRYkuKQDTGN7PSME+3xOAVJQOjT2rxRLkqVvD5lCgrW2SRVd
   ARJsg3wyfTBqG1OIZobyDuf/8FyRuqmDkJ5Fvm7WHQQBDLqGyozbSOTuo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16266386"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="16266386"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 06:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="14254859"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 06:13:58 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 88E2611F853;
	Tue, 19 Mar 2024 15:13:55 +0200 (EET)
Date: Tue, 19 Mar 2024 13:13:55 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Bingbu Cao <bingbu.cao@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
	hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 35/38] media: ov2740: Add support for embedded data
Message-ID: <ZfmPkzkBmQj-qY1W@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-36-sakari.ailus@linux.intel.com>
 <01085a01-8cb8-bcde-2f06-e0d636ebbfd8@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01085a01-8cb8-bcde-2f06-e0d636ebbfd8@linux.intel.com>

Hi Bingbu,

On Thu, Mar 14, 2024 at 03:00:49PM +0800, Bingbu Cao wrote:
> > +	entry->stream = OV2740_STREAM_PIXEL;
> > +	entry->bus.csi2.dt = MIPI_CSI2_DT_RAW10;
> > +	entry++;
> > +	desc->num_entries++;
> > +
> > +	entry->pixelcode = MEDIA_BUS_FMT_META_8;
> 
> Should we change the pixelcode to META_10 also?

For others to know: Bingbu confirmed the sensor embedded data output is
actually using 10 bits per pixel packing.

> 
> > +	entry->stream = OV2740_STREAM_META;
> > +	entry->bus.csi2.dt = MIPI_CSI2_DT_GENERIC_LONG(1);
> 
> In the register setting array, the 0x4816 is set to 0x52 instead of
> its default value 0x53, so the data type should be
> MIPI_CSI2_DT_GENERIC_LONG(0) or MIPI_CSI2_DT_EMBEDDED_8B.
> 
> Or you can change back to the default settings. :)

I'll use MIPI_CSI2_DT_EMBEDDED_8B.

-- 
Regards,

Sakari Ailus

