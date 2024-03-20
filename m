Return-Path: <linux-media+bounces-7389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F27B5880D28
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 09:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 248DC285160
	for <lists+linux-media@lfdr.de>; Wed, 20 Mar 2024 08:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B2838F87;
	Wed, 20 Mar 2024 08:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMPQf4ws"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE3038DEC
	for <linux-media@vger.kernel.org>; Wed, 20 Mar 2024 08:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710923780; cv=none; b=tD+SvTQoUYmU1AwbwE3OXrTlzp425jDiOueGgeiP21bOau/3BzmTfoMAkmpQ4KayRzh5O3dxg5oIKNlm0OHcW8BaVWamf4tL2BcNQIHCV4/XtDDJc4k4PNayXfTeVJVWOiG+CkOQ5iJSF90Yf0l3SZFlAQplefcXrmVdextyf4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710923780; c=relaxed/simple;
	bh=0GF+3keQj/KEn1eUBmEPrpODXgtEH9qPJhdPPNsdAM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdrXg7m9BxYN8UqP5Ac4G8/SCC/lSDbyXHlNdpoNi/jCJnkyej0vyh+OLvPwjusq8aTHLaPYKj2gaHC1lsGRgykXHiRhMdFaN3XU9jP8HBxwPqA+qDsYpOE0jj1y9BvVe/M+pmLdIX1DhMWIlPtAA0ne5xAZ8HfIvL/KS0jliyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMPQf4ws; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710923779; x=1742459779;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0GF+3keQj/KEn1eUBmEPrpODXgtEH9qPJhdPPNsdAM4=;
  b=iMPQf4wshzN6zZtbTsF53wav5paLdSiHptSOSWQ/OaZ8U00ojE0/QaAa
   evjR6gcnRwvIfL+AFEDZ31NxwTPWHbAT9oBOO+WLOxEgiPMvJCy+bkuod
   jCDq1UZsZm3yynSaMKJIv/7SwzFfV/MQk50XbiJLPW5MBPM1Gva5hafsC
   8ar+Hqg57AbZJ7VhbKZ/qQHaFhWQlGKkKUN6E4Z6ffRl8sDLRq8DxOe2S
   W2uJRYKRI2y1CjtECHdXxTZYI5vBnn8ZNDbk4L7jGIJa0RvdPZfMmYrox
   x+k+UIvWYGh/b81PXoV2HOgj4EQmbJV7UP7q9DZLpeexmIGXcFfmeUORE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5956800"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5956800"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 01:36:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="51524943"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 01:36:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 9C96E11F853;
	Wed, 20 Mar 2024 10:36:12 +0200 (EET)
Date: Wed, 20 Mar 2024 08:36:12 +0000
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
Message-ID: <Zfqf_B4VSCJ14I0f@kekkonen.localdomain>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-4-sakari.ailus@linux.intel.com>
 <ff9d63d0-528a-4afb-a85a-fcb8633fec07@ideasonboard.com>
 <ZfmSzM7kL_Si2pRW@kekkonen.localdomain>
 <4a20047b-559b-4877-8385-d22968499595@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a20047b-559b-4877-8385-d22968499595@ideasonboard.com>

Moi,

On Tue, Mar 19, 2024 at 04:20:35PM +0200, Tomi Valkeinen wrote:
> On 19/03/2024 15:27, Sakari Ailus wrote:
> > Moi,
> > 
> > On Thu, Mar 14, 2024 at 09:30:50AM +0200, Tomi Valkeinen wrote:
> > > On 13/03/2024 09:24, Sakari Ailus wrote:
> > > > Add generic serial metadata mbus formats. These formats describe data
> > > > width and packing but not the content itself. The reason for specifying
> > > > such formats is that the formats as such are fairly device specific but
> > > > they are still handled by CSI-2 receiver drivers that should not be aware
> > > > of device specific formats. What makes generic metadata formats possible
> > > > is that these formats are parsed by software only, after capturing the
> > > > data to system memory.
> > > > 
> > > > Also add a definition for "Data unit" to cover what is essentially a pixel
> > > > but is not image data.
> > > 
> > > The CCS spec talks about legacy packing and optimized packing for 16+ bit
> > > formats. You cover only the "legacy" ones here. Did you look at those?
> > 
> > The reason is that the bus data layout of the new packing at higher bit
> > depth matches with packing at lower bit depths (half to be precise). That's
> > why there's no need to define formats for the new packing methods at higher
> > bit depths (the driver simply uses the packing at half of the bit depth).
> 
> Hmm. If we're capturing 10-bit raw format, say, with the width of 640
> pixels, we'll configure the video stream format according to those. For the
> embedded stream, we'll set it to V4L2_META_FMT_GENERIC_CSI2_10 and 640
> width, right?
> 
> If we're capturing 20-bit raw, we'll configure the video stream format again
> accordingly, width to 640, and 20 bit fourcc/mbus code. If the embedded
> stream uses the "legacy" packing, we'll set the format to
> V4L2_META_FMT_GENERIC_CSI2_20 with width of 640, right?
> 
> But if it's using packed format for the embedded stream, we set the format
> to V4L2_META_FMT_GENERIC_CSI2_10 and width to 1280?

The driver sets the embedded data sub-device format apart from the mbus
code. The width would be 1280 in this case, yes, and fewer embedded data
lines could be needed.

> 
> Considering that the video and (line-based) embedded data come from the same
> source, I'd expect the widths to be the same.

The width in bytes (with the packing) of embedded data is still the same as
for the image data. Pixels don't matter in this case.

-- 
Terveisin,

Sakari Ailus

