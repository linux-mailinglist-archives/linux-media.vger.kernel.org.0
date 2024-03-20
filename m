Return-Path: <linux-media+bounces-7391-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 353EB880DB6
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 09:51:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C947B1F246B8
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 08:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE90139AFE;
	Wed, 20 Mar 2024 08:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tk7MB30u"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C2236137
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710924512; cv=none; b=lcQWMVSMaYFaDA6GKgRN/WSWileLXyKMoQSokdeCX72/8LA/02tNZHI/AQPHKWKwELvYDqVISZyCO+U82rce8tWjxI6Jf0SCGno6Hl/YZp6g1fa5HMfrBSu3ZN46MdBW1FlUd/kmvIYYbPWfBKfApXwMEyx645JJtbhGFEpNK64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710924512; c=relaxed/simple;
	bh=5x7uCgd0Zot6CD9o130+pGHXPDUv5EYoRK17BOHfWgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvfwMBuA3hSQWD0q+/bX34hwwE0SEDP7YFhI4St/d/bz/1g2tSZWlFO+bnSaFTtNQ5sjJZNw20NDXrs205yF42H/8TLWFIxC13s9tyK+lyi/pk3ho+4HQ5SklKheUQzV21t5ma8YkLYAyGtXEqF7X+738ROA8qBawIenNvrwHek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tk7MB30u; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710924510; x=1742460510;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5x7uCgd0Zot6CD9o130+pGHXPDUv5EYoRK17BOHfWgc=;
  b=Tk7MB30uNdFdhSWfOh0fV/v7dl3T0/uf0iJ1KvYmBjA/LWBcPOSax/3K
   CnhcUjseMy5N3+wVLQ2Qz466noceIvQoy8MF1bMFhjEUTNZ8dfphLI1+1
   jEpmZELRh6wSJhmrGIyjuK/biDjfNRxec7lCK436FFzivoTim8ZhruHFW
   VZEFT+BllwcmHrDq6nKswhNg2QrvkcVksOOgs5ux89RZXg2A5uX8ZagYZ
   4/mocghsBE9qQ5+Df9aeh4ikeGcpn+GwNPTz7hEAVjPvA6oeslj5mwIZH
   6nU9YWEgcjjD4awCZCeRyHXp4kG0H6UWCqLCMtfYa59HGJ//yvHcibyCx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5695985"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5695985"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 01:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="14493348"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 01:48:20 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3AC3A11F853;
	Wed, 20 Mar 2024 10:48:17 +0200 (EET)
Date: Wed, 20 Mar 2024 08:48:17 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, bingbu.cao@intel.com,
	hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 03/38] media: uapi: Add generic serial metadata mbus
 formats
Message-ID: <Zfqi0fsbRkvH_V7i@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-4-sakari.ailus@linux.intel.com>
 <ff9d63d0-528a-4afb-a85a-fcb8633fec07@ideasonboard.com>
 <ZfmSzM7kL_Si2pRW@kekkonen.localdomain>
 <4a20047b-559b-4877-8385-d22968499595@ideasonboard.com>
 <20240319223347.GF8501@pendragon.ideasonboard.com>
 <20240319230048.GH8501@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319230048.GH8501@pendragon.ideasonboard.com>

Hi Laurent,

On Wed, Mar 20, 2024 at 01:00:48AM +0200, Laurent Pinchart wrote:
> On Wed, Mar 20, 2024 at 12:33:48AM +0200, Laurent Pinchart wrote:
> > On Tue, Mar 19, 2024 at 04:20:35PM +0200, Tomi Valkeinen wrote:
> > > On 19/03/2024 15:27, Sakari Ailus wrote:
> > > > On Thu, Mar 14, 2024 at 09:30:50AM +0200, Tomi Valkeinen wrote:
> > > >> On 13/03/2024 09:24, Sakari Ailus wrote:
> > > >>> Add generic serial metadata mbus formats. These formats describe data
> > > >>> width and packing but not the content itself. The reason for specifying
> > > >>> such formats is that the formats as such are fairly device specific but
> > > >>> they are still handled by CSI-2 receiver drivers that should not be aware
> > > >>> of device specific formats. What makes generic metadata formats possible
> > > >>> is that these formats are parsed by software only, after capturing the
> > > >>> data to system memory.
> > > >>>
> > > >>> Also add a definition for "Data unit" to cover what is essentially a pixel
> > > >>> but is not image data.
> > > >>
> > > >> The CCS spec talks about legacy packing and optimized packing for 16+ bit
> > > >> formats. You cover only the "legacy" ones here. Did you look at those?
> > > > 
> > > > The reason is that the bus data layout of the new packing at higher bit
> > > > depth matches with packing at lower bit depths (half to be precise). That's
> > > > why there's no need to define formats for the new packing methods at higher
> > > > bit depths (the driver simply uses the packing at half of the bit depth).
> > > 
> > > Hmm. If we're capturing 10-bit raw format, say, with the width of 640 
> > > pixels, we'll configure the video stream format according to those. For 
> > > the embedded stream, we'll set it to V4L2_META_FMT_GENERIC_CSI2_10 and 
> > > 640 width, right?
> > > 
> > > If we're capturing 20-bit raw, we'll configure the video stream format 
> > > again accordingly, width to 640, and 20 bit fourcc/mbus code. If the 
> > > embedded stream uses the "legacy" packing, we'll set the format to 
> > > V4L2_META_FMT_GENERIC_CSI2_20 with width of 640, right?
> > > 
> > > But if it's using packed format for the embedded stream, we set the 
> > > format to V4L2_META_FMT_GENERIC_CSI2_10 and width to 1280?
> > > 
> > > Considering that the video and (line-based) embedded data come from the 
> > > same source, I'd expect the widths to be the same.
> > 
> > I don't have a strong objection against multiplying the width, but we
> > need to figure out the impact on other kernel space components, as well
> > as on userspace. I suppose the media bus code for the embedded data
> > stream on the sensor source pad when using optimized packing and
> > capturing RAW20 images would be MEDIA_BUS_FMT_META_10 ? In that case I
> > think the sensor driver should be able to handle the width calculations
> > on its own, and the value would just be propagated by userspace.
> 
> This should be documented somewhere in this series by the way (not in
> this patch).

This could go to the CCS driver documentation. I modified the last
paragraph and added a new one:

------8<-----------
Devices supporting embedded data for bit depths greater than or equal to 16 may
support more dense packing or legacy single metadata byte per data unit, or both
of these. The supported embedded data formats can be enumerated and configured
on stream 1 of the source pad (1) of the CCS source sub-device.

The use of the denser packing results in embedded data lines being longer than
the pixel data in data units since the data units are smaller. In bytes the
embedded data lines are still not longer than the image data lines.
------8<-----------

I believe the reason for the specs requiring embedded data lines not being
longer (in bytes) is most likely that some hardware may have issues
reciving the data otherwise for various reasons.

-- 
Regards,

Sakari Ailus

