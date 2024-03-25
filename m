Return-Path: <linux-media+bounces-7757-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A62488A88C
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 17:13:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09A981F3D562
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 16:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5D81442E2;
	Mon, 25 Mar 2024 14:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyF/LFEs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D25143C71
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 14:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711375348; cv=none; b=iAcXLEOLp8IY8563AeoCzhUjNAnze+ddk2NjdbSggLVUjQp+rjQ8sgtB5bZ35H1z748RmFbt0xPkQyNlEuOIUkSc3S4e/71IN/t4rZRFp7zp26nFComDokTk7asFEB2svd2ksbxcsEaLwfEc6d6qnv4MVATIdkBAXbLIVrPw2Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711375348; c=relaxed/simple;
	bh=QAR30rI9BZhtWeBd9atjBZ3RAV7+U3EuMsIsXtJIfNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtQ6qoEak05eodDY5LekaRV2aSVb+lhMkr2e2KQ57XKUS5VnJJlmJ/rqyUb70KXQb71oonZ9opbWkGLXdXngWdWZMZ4B1E9xwqED63tPeTGDi5SIgVrBjggQxIR3cYxGw+7668ily9+QsR0rPOa2zTutBPaSKDn9P+4k4+EJH+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyF/LFEs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711375348; x=1742911348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QAR30rI9BZhtWeBd9atjBZ3RAV7+U3EuMsIsXtJIfNE=;
  b=FyF/LFEsDQ0hCR4uv02stusONchxjrA3NPFRUYJmig8PeG3L5B9qPG8f
   6XTeyrT7tEsX66P9oVou1ytxohCZjoH4AM/4mdpBHXl48YlWmCpX7r76g
   T6Rl/duAegO5BrfDE/X7FNbw8yHK6De0WcfJG2XUvL3s3Kl2XuIQbQEbE
   mxDGhZi3NLILUnUaWYo8c+k86rv4PQf1KFp4sy9GvNt6zX+ORWwIb/tPj
   Yqg2DoAciDSJBQmX/mm28e1aiAP64jn7HA+CUpFrVkLC1UgXqWSEUjCIu
   q3Jb6CbfHY30Q+TOw4MzEfOEkPHQxE0Y92DbSd2ZRjIPizmxW8N80W/W+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="23826120"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="23826120"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 07:02:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="46609009"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 07:02:20 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 342BC11FB81;
	Mon, 25 Mar 2024 16:02:17 +0200 (EET)
Date: Mon, 25 Mar 2024 14:02:17 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, bingbu.cao@intel.com,
	hongju.wang@intel.com, hverkuil@xs4all.nl,
	Andrey Konovalov <andrey.konovalov@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>,
	"Ng, Khai Wen" <khai.wen.ng@intel.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v8 03/38] media: uapi: Add generic serial metadata mbus
 formats
Message-ID: <ZgGD6Whada3wLtzO@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-4-sakari.ailus@linux.intel.com>
 <ff9d63d0-528a-4afb-a85a-fcb8633fec07@ideasonboard.com>
 <ZfmSzM7kL_Si2pRW@kekkonen.localdomain>
 <4a20047b-559b-4877-8385-d22968499595@ideasonboard.com>
 <20240319223347.GF8501@pendragon.ideasonboard.com>
 <2fbd2ab3-afc8-4791-a83a-a91a8cdd7597@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fbd2ab3-afc8-4791-a83a-a91a8cdd7597@ideasonboard.com>

Moi,

On Fri, Mar 22, 2024 at 08:50:00AM +0200, Tomi Valkeinen wrote:
> On 20/03/2024 00:33, Laurent Pinchart wrote:
> > On Tue, Mar 19, 2024 at 04:20:35PM +0200, Tomi Valkeinen wrote:
> > > On 19/03/2024 15:27, Sakari Ailus wrote:
> > > > On Thu, Mar 14, 2024 at 09:30:50AM +0200, Tomi Valkeinen wrote:
> > > > > On 13/03/2024 09:24, Sakari Ailus wrote:
> > > > > > Add generic serial metadata mbus formats. These formats describe data
> > > > > > width and packing but not the content itself. The reason for specifying
> > > > > > such formats is that the formats as such are fairly device specific but
> > > > > > they are still handled by CSI-2 receiver drivers that should not be aware
> > > > > > of device specific formats. What makes generic metadata formats possible
> > > > > > is that these formats are parsed by software only, after capturing the
> > > > > > data to system memory.
> > > > > > 
> > > > > > Also add a definition for "Data unit" to cover what is essentially a pixel
> > > > > > but is not image data.
> > > > > 
> > > > > The CCS spec talks about legacy packing and optimized packing for 16+ bit
> > > > > formats. You cover only the "legacy" ones here. Did you look at those?
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
> Yes, I think it works. I just find it more logical if the widths of both the
> video and embedded streams are the same (which is the case for all other
> embedded formats).
> 
> However, even the CCS spec says "for RAW16, RAW20, and/or RAW24 Visible
> pixels, top-embedded data may instead be more optimally packed using RAW8,
> RAW10, and/or RAW12 pixels", so that's in line with what Sakari suggests.
> Although the spec specifically says "top-embedded", so does it mean that the
> optimized data is not allowed for bottom data?

I haven't read the spec regarding this but I don't think there should be
anything that prevents it: it's the embedded data format. The CCS driver
patches only adds support for the top embedded data anyway.

-- 
Regards,

Sakari Ailus

