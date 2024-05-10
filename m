Return-Path: <linux-media+bounces-11324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6368C2740
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 17:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63E881F23213
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F588171094;
	Fri, 10 May 2024 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwvST95I"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC1414F128;
	Fri, 10 May 2024 15:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715353290; cv=none; b=XlH8hQ8eX2nHz+yg4CiXzKDXJu55ZSLXoDA0bKBN+vmDDbp22iLFMIQPBBwiiDWNorgeFN/kgVLM4i5OGJDqBnNpjhGNyhROmPnjFAaiCY5T4WXjbS08kTCked/ZWO65FHI5HDtNA4XghglSwtJqgPzbyUUPf8BVj1Ukp0ZYp4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715353290; c=relaxed/simple;
	bh=dMN3JddNCU2TCtaus7k5EYytVw6hgfYHO3cWEFNdI7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtOFxtwHvp13cl7ROD/PyVQ+ohBMRpXjKZNM1z3E4OV2OSnOoxAsrXepi7YN8wrc0e+VEZrBMpLol2SA+TcZKBzA8pi6AVuiCB+EQprHhBXQp2IQcStdVl/Klr0RuxVxMMK+LEvx7/CI+mEuZOomDa+rFDQehZx3RldbtMfeztg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwvST95I; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715353290; x=1746889290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dMN3JddNCU2TCtaus7k5EYytVw6hgfYHO3cWEFNdI7w=;
  b=MwvST95IbpIMG4njNBrQY+2x6UC1MOw3N3LQ1qTEeF2pzIV1Hy7MQ1Jn
   +N2hEVZQ+RgAAXD6wb54E3zVc4kJQs+KTxaqengb0a7TLQ2uQnqnHQWVY
   OnJfIp4QuiuL5iifKxTlyMulIApUdgq7ZDMes7HSqQOk47Uhx/3vi1Fg9
   c8sPrD2DmcFuJ8G8SChzjlHsnDBxRv+4X6r6Tw6ISVYhAN3IYee799M0P
   G5gJxfA1TESf0PUsxleaoOpwhzAuNPNRKT+mJBmqnJi6Kf2uNhckEcP1C
   enzzEwHrP1DuuRUvy995Rp/z6fxiVtV1Uz9nTjvI3dJyg/fJrtOZIn5+a
   A==;
X-CSE-ConnectionGUID: Id3es4ShQYyFfUpC1Ug9qQ==
X-CSE-MsgGUID: p3JFCzK5QVeAH/7WodpSaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11189303"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11189303"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:01:29 -0700
X-CSE-ConnectionGUID: /PStARpCQnOn9LyomMB+qw==
X-CSE-MsgGUID: dtewjjKuS5WbMxK+3Las3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="34288929"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:01:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s5RkM-000000068XT-0pEH;
	Fri, 10 May 2024 18:01:18 +0300
Date: Fri, 10 May 2024 18:01:17 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
	akpm@linux-foundation.org, gregkh@linuxfoundation.org,
	adobriyan@gmail.com, jani.nikula@intel.com, p.zabel@pengutronix.de,
	airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
	laurent.pinchart@ideasonboard.com, praneeth@ti.com, nm@ti.com,
	vigneshr@ti.com, a-bhatia1@ti.com, j-luthra@ti.com, b-brnich@ti.com,
	detheridge@ti.com, p-mantena@ti.com, vijayp@ti.com,
	andrzej.p@collabora.com, nicolas@ndufresne.ca
Subject: Re: [PATCH v7 6/8] math.h Add macros to round to closest specified
 power of 2
Message-ID: <Zj42vTpyH71TWeTk@smile.fi.intel.com>
References: <20240509183952.4064331-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509183952.4064331-1-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 12:09:52AM +0530, Devarsh Thakkar wrote:
> Add macros to round to nearest specified power of 2.

This is not what they are doing. For the above we already have macros defined.

> Two macros are added :

(Yes, after I wrapped to comment this line looks better on its own,
 so whatever will be the first sentence, this line should be separated
 from.)

> round_closest_up and round_closest_down which round up to nearest multiple

round_closest_up() and round_closest_down()


> of 2 with a preference to round up or round down respectively if there are
> two possible nearest values to the given number.

You should reformulate, because AFAICS there is the crucial difference
from these and existing round_*_pow_of_two().

> This patch is inspired from the Mentor Graphics IPU driver [1] which uses
> similar macro locally and which can be updated to use this generic macro
> instead along with other drivers having similar requirements.
> 
> [1]:
> https://elixir.bootlin.com/linux/v6.8.9/source/drivers/gpu/ipu-v3/ipu-image-convert.c#L480

Instead of this, just add a patch to convert that driver to use this new macro.
Besides, this paragraph should go to the comment/changelog area below.

> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V1->V6 (No change, patch introduced in V7)
> ---

-- 
With Best Regards,
Andy Shevchenko



