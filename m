Return-Path: <linux-media+bounces-12660-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7048FE99E
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 16:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61BEE1C24EF5
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2024 14:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7721719AD7A;
	Thu,  6 Jun 2024 14:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NqPlybz9"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED7E19AD5C;
	Thu,  6 Jun 2024 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717683045; cv=none; b=hoCny5thMzQ8FCgMEY1tee2jHuA/M2n9T7HFgNp7eZggVtINPRpyWW3C5/2o6RghuQiGcr1MEzBYTi+Mah4a7SXkb3v2pXNAipY8jxJE6yFYeMB1UUsCWkMI+WxcsI5iyt/ZoYJUpqp3ORPiSKOuJBidYwz4F0V8ogFmHWM1278=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717683045; c=relaxed/simple;
	bh=MUI6PIsAE4F5Czr38Qw9LN4nLxY0Y714ALhc4YdR7Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ckJ2To8mQ19QNg7hBFWqSJfiyF4U7OusBjYlVMfLi1m38fqqEvYrH3QOSq/JmBDPSL8YKtmoQC337JDfd4jYRZZQjgPAFa1+vqNCc7VyIFFkKGeQr77UG3LyykDGPnYZXyzfOZYHVjcmjSwAtwBn/buM7H8Ilmx8BSi2Sliay3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NqPlybz9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717683044; x=1749219044;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MUI6PIsAE4F5Czr38Qw9LN4nLxY0Y714ALhc4YdR7Ig=;
  b=NqPlybz9L5vuu97ai4SV1SZw1lS4AbohjcGeSD73eNa/mO5TaXdSNbHr
   QluLD2sHkVHaj+dCHLOhGSLU/xr2so9yCimCfpHZhBbnfiutjereK16bl
   SiLslH9DjTARhsTdlRCmv0VuM/KOvVJsvFirlT6yMo+udVUNPtPwIsUlf
   Pk51zyzbLu2CdfyC00w/zhuPgzQeDXbQfey+XeO0oTa8N139Dt4IdO9pg
   9CPrmBdaombLwDDrfSjoa1a7X8ywGXUT419YhZ+bTwRRrDrXC2pvy8X63
   s7c/1lSP1TEiQjytaYe/fViyux7ZB1d/Sto2HRiSswhbXIevrOVjTHRsA
   Q==;
X-CSE-ConnectionGUID: teN4sAQsTJuFMgtrRgKyvg==
X-CSE-MsgGUID: QotK4DpwSR23w2ChglR5Aw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18144821"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="18144821"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 07:10:43 -0700
X-CSE-ConnectionGUID: 3UNBXoQ1QG+szVQWA/DKGA==
X-CSE-MsgGUID: 8x0BivwhSzSELBrM4WHGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="42444804"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 07:10:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sFDp4-0000000ECQy-0sFQ;
	Thu, 06 Jun 2024 17:10:34 +0300
Date: Thu, 6 Jun 2024 17:10:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.gaignard@collabora.com,
	dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
	nicolas@ndufresne.ca, p.zabel@pengutronix.de, airlied@gmail.com,
	daniel@ffwll.ch, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, adobriyan@gmail.com,
	jani.nikula@intel.com
Subject: Re: [PATCH v12 12/13] media: imagination: Round to closest multiple
 for cropping region
Message-ID: <ZmHDWeuezCEgj20m@smile.fi.intel.com>
References: <20240604104001.2235082-1-devarsht@ti.com>
 <20240604105335.2257629-1-devarsht@ti.com>
 <20240606114459.x73yebdu7kg7re52@basti-XPS-13-9310>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606114459.x73yebdu7kg7re52@basti-XPS-13-9310>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 06, 2024 at 01:44:59PM +0200, Sebastian Fricke wrote:
> Hey,
> 
> On 04.06.2024 16:23, Devarsh Thakkar wrote:
> > If neither of the flags to round down (V4L2_SEL_FLAG_LE) or round up
> > (V4L2_SEL_FLAG_GE) are specified by the user, then round to nearest
> > multiple of requested value while updating the crop rectangle coordinates.
> > 
> > Use the rounding macro which gives preference to rounding down in case two
> > nearest values (high and low) are possible to raise the probability of
> > cropping rectangle falling inside the bound region.
> > 
> > This complies with the VIDIOC_G_SELECTION, VIDIOC_S_SELECTION ioctl
> > description as documented in v4l uapi [1] which specifies that driver
> > should choose crop rectangle as close as possible if no flags are passed by
> > user-space, as quoted below :
> > 
> > "``0`` - The driver can adjust the rectangle size freely and shall choose a
> > crop/compose rectangle as close as possible to the requested
> > one."
> > 
> > Link: https://www.kernel.org/doc/Documentation/userspace-api/media/v4l/vidioc-g-selection.rst [1]
> > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> 
> Acked-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> 
> Can, whoever picks up the math changes, pick up this change as well?
> I will send 1-6 via the media subsystem.

math.h is orphaned, meaning any Tier-1 maintainer may push this through.
So, there is nobody behind it.

-- 
With Best Regards,
Andy Shevchenko



