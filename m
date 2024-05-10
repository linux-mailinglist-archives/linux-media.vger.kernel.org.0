Return-Path: <linux-media+bounces-11329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 448C28C2772
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 17:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2E142847EB
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00E60171E4F;
	Fri, 10 May 2024 15:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BpprehXU"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B765F17166F;
	Fri, 10 May 2024 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715353850; cv=none; b=WaOYhTljJvvHRDG/2qet7FBGCymHr3Z9cojM8h2AOnuY3Q7NqyXEvrN62FpawsT97WrjNw9GiypupBT5QKbvHdW2P91umunOHwCk2GpPDOVJt58siancbDl7hdj6kjGmj1ekpMVaEv8K9/ThpuVEBeEng99vNxqirTT9dMdiUrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715353850; c=relaxed/simple;
	bh=1j7eg+9n1ylc7PMU1qKoy953XxcAw3FLb1qDay6E/FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8GIj7D3WiAq07EZAa6S2l/dCkr/hmatWQiHtmth3oz1Y2JPXT35tSRgJKkMKfFKvHDrD9Z1Rp1srY+n566R5d+do0do8LUdU7bwujXwUdmwUow9hm9HqBmSXi239exsBy6GZgtqTT1YFlvw86v4EIHoKhhuk5kZo8bbwPM1uWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BpprehXU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715353848; x=1746889848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1j7eg+9n1ylc7PMU1qKoy953XxcAw3FLb1qDay6E/FI=;
  b=BpprehXUhdtp8LWG3bdIzCRxhOUpbTOTYLmJivb1nK14IVm1o33jOWrk
   fU26FbyZEv+HRhvADwQxjoGDyNW82R4CME2mlRUvw44Z44G9cS0fqPqvZ
   MytA1HjaODFN121a4kcRjTrBkp1p/Ux52mcd8BEoW1Z8LLfaTvncej33+
   4ysy8ozR2SnKKfKFWuTVb8utj3dJOC9k3GTAeqiyYizq0bUEzhyCqvPa7
   0sabDT4M5NQ3YMj738qfcKleWe3RuXUoQfi1aXd4qcPOpxKJR5nmrkrN3
   GGYR7j2LzgkCUmJbjyWIdMPX7uPKtZrxGNIjruDBlKuD5MwEE/CURp12W
   g==;
X-CSE-ConnectionGUID: XDZxHLDZSaeyCL4Z7XIilw==
X-CSE-MsgGUID: vHZSQCaFRJKCbJq4aJGD6A==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11468751"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11468751"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:10:46 -0700
X-CSE-ConnectionGUID: NAF67pl8Qe+TSKl8VaEpXQ==
X-CSE-MsgGUID: SGb+tI1vQvi8k665RFaHhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29592182"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:10:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s5RtN-000000068i4-1K3v;
	Fri, 10 May 2024 18:10:37 +0300
Date: Fri, 10 May 2024 18:10:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
	dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
	nicolas@ndufresne.ca, p.zabel@pengutronix.de, airlied@gmail.com,
	daniel@ffwll.ch, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, adobriyan@gmail.com,
	jani.nikula@intel.com
Subject: Re: [PATCH v7 7/8] media: imagination: Round to closest multiple for
 cropping region
Message-ID: <Zj447ePSnccbj76v@smile.fi.intel.com>
References: <20240509184001.4064820-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509184001.4064820-1-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 12:10:01AM +0530, Devarsh Thakkar wrote:
> If neither of the flags to round down (V4L2_SEL_FLAG_LE) or round up
> (V4L2_SEL_FLAG_GE) are specified by the user, then round to nearest
> multiple of requested value while updating the crop rectangle coordinates.
> 
> Use the rounding macro which gives preference to rounding down in case two
> nearest values (high and low) are possible to raise the probability of
> cropping rectangle falling inside the bound region.

This is arguable. How do we know that the bigger range is supported?
The safest side is to go smaller than bigger.

-- 
With Best Regards,
Andy Shevchenko



