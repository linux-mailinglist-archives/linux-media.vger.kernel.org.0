Return-Path: <linux-media+bounces-11325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2975A8C2747
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 17:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0FDD287294
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2024 15:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878CA17109C;
	Fri, 10 May 2024 15:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WHQffnzF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B74D12C53F;
	Fri, 10 May 2024 15:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715353445; cv=none; b=MCIz0cZEVSrWmg1jOeAUxkJQwOYo89u+Z7jYseo+OTDNOx78BJVJtM26t8v0wqEg1aRx4uMrikh7wNVaxyog3iv3wIqp7wa3Hb+mELA1icSEpfyKDJcVNO02oH3t6U8NiPvHOVaRsyLYE004j6bCycP4z/gNSRPM/TRlLioUZFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715353445; c=relaxed/simple;
	bh=DfIwLOulQLcLembSLllTkooRPlHt5xY4HjiqBcwUzpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n2G4W3SFcIYMfqJ1S4Y3ZtklmbRdD+Du5LO7UjnPR7d3MHaa9pB2HV3QsAtOaIzmuPkZRUZB5QaC4aW5tgI0lJfWouWBKE5Ok75oXgwb6qAXRiKf8WfaFYG+15GVRwpU9SIWA5Txg/NSFSNbmEgtIeLVgHzpuw114U2pFIJ1EQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WHQffnzF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715353444; x=1746889444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DfIwLOulQLcLembSLllTkooRPlHt5xY4HjiqBcwUzpw=;
  b=WHQffnzFzpDRRgk8AJLgcCgfRIr2pXQ1GuwkCDuI3vX2FAWpPzx+z3PR
   Nm/hp96kMgmq9Gjyzb6Ti0wyvTafru9H6+rpgq/4UQ6FxRgRIKS5Hw0Y1
   ihiZ2GI+2oD5l8IdxGwDSslapIDZ7EqQbZ/kqROO/fOWRQLHiAKXNSrYn
   qN6yAbT4Xe/i8yP3h/1Jo9Zy/FAb+/wUXtEXoIah1V1t3BCuRRCcObtEG
   pjifHQJCUcwpulsU0vygI4huPzjPecF3V3UCp5dG/JiCvPZYHS2d563tv
   0QTr6Hn4QxwR5gwEds+0hj+kRbG4hjpJ5WiyZr6MXlkgnkB5p7hzsyfky
   w==;
X-CSE-ConnectionGUID: L2Y5qE9RTfKQwfzxXL2hhg==
X-CSE-MsgGUID: YBJF/5J6Swq1RSsX1YtqgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11200621"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="11200621"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:04:03 -0700
X-CSE-ConnectionGUID: GHZdCY6/TtajG/italIwTA==
X-CSE-MsgGUID: 7K0z7nQkRdS4ezJTcxrYqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; 
   d="scan'208";a="29489293"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 08:03:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1s5Rmq-000000068aS-1p1l;
	Fri, 10 May 2024 18:03:52 +0300
Date: Fri, 10 May 2024 18:03:52 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.gaignard@collabora.com, sebastian.fricke@collabora.com,
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
	praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
	p-mantena@ti.com, vijayp@ti.com, andrzej.p@collabora.com,
	nicolas@ndufresne.ca, akpm@linux-foundation.org,
	gregkh@linuxfoundation.org, adobriyan@gmail.com,
	jani.nikula@intel.com
Subject: Re: [PATCH v7 8/8] gpu: ipu-v3: Use generic macro for rounding to
 nearest multiple
Message-ID: <Zj43WDlT1aFpgdVv@smile.fi.intel.com>
References: <20240509184010.4065359-1-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240509184010.4065359-1-devarsht@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, May 10, 2024 at 12:10:10AM +0530, Devarsh Thakkar wrote:
> Use generic macro round_closest_up for rounding to nearest multiple instead

round_closest_up()

We refer to the functions as func().

> of using local function.

...

> @@ -565,7 +563,7 @@ static void find_best_seam(struct ipu_image_convert_ctx *ctx,
>  		 * The closest input sample position that we could actually
>  		 * start the input tile at, 19.13 fixed point.
>  		 */
> -		in_pos_aligned = round_closest(in_pos, 8192U * in_align);
> +		in_pos_aligned = round_closest_up(in_pos, 8192U * in_align);
>  		/* Convert 19.13 fixed point to integer */
>  		in_pos_rounded = in_pos_aligned / 8192U;

Oh, these seems to be better to use either ALIGN*(), or PFN_*() / PAGE_*()
families of macros. What the semantic of 8192 is?

-- 
With Best Regards,
Andy Shevchenko



