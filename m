Return-Path: <linux-media+bounces-37231-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23230AFF3B6
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 23:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19FB51C83589
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 21:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA6D23BCFD;
	Wed,  9 Jul 2025 21:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ry7uaS/k"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2D313B797;
	Wed,  9 Jul 2025 21:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752095585; cv=none; b=ga8mCkMqIznjPyvO7Jym2IlIugn/cISzdi2Elw9Uh25FtJu0y2nnzPA8EsM5IoJ/A03AXUrvJsoIOAvn9yRQcsvz+nI2zF1WLC5gDuzBvbifM+Ct6KZ0bSa8dtFfY7+LnujWKu5sZ+GH0wbJ8J+vocxJiNx0HCmSJIYlPKUhzc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752095585; c=relaxed/simple;
	bh=euOd07cHnX9O5CkW5J+sbo8I4BBSaxORTjOxCBxyPUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmLwBgF2tOA5z9CdwzjjHgMX782m9VS46Di/GtbvjlYLHe50yZD3w+LPauCHHd9oqh5P+f2wAi9/1NuDPPVPfdEkfiOukU92mxwEPZBAe1FxxHo7yfD85ko3zzTgeWtFgB3KvRyWfAIE3dcY1j0YtNMXcbo5r4ynSqK/FCQRkMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ry7uaS/k; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752095584; x=1783631584;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=euOd07cHnX9O5CkW5J+sbo8I4BBSaxORTjOxCBxyPUg=;
  b=Ry7uaS/kGrv8Cl7xGx7Z3/zvVUKJWYlBDo4l2AqLo3k4mVxffaY7Sdk+
   B9mWJBqZ7wKlrVL6rSe7k/fT6MS9Oh3gYCoKJMTYPeBfh9wY6Cmx4XU7z
   azuzf+WuLIGB7L2J7/bwfDTve2UqA4bik4RQ66jSPllcGCDbxRpCVH5L7
   AOUhasJBEWRYPXV9oSBpuuNWn2t1doM0dQD6cMOX00kFcOTIbapPmSRno
   cthxJzqh9hrySqd4tOqpGk7hkpD324Vzu4O5z6rkUoJ00jEhjsOeG/XOc
   y9XH+xPAvE4h2vCCiF74FczyL1z+crm9gb2Ho5TeKJ+6qJspOXZha979D
   g==;
X-CSE-ConnectionGUID: cbwKT87RRPSvVFwpJqVd6Q==
X-CSE-MsgGUID: HZLQBJi7QGalrSmLdlzx0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="53582958"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="53582958"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 14:13:03 -0700
X-CSE-ConnectionGUID: tk7aBOlVSIm4iog4lyeLCA==
X-CSE-MsgGUID: qwK92l/rQo6T0zx2/mhiCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; 
   d="scan'208";a="155297528"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.15])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 14:13:00 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id B41F711F89A;
	Thu, 10 Jul 2025 00:12:57 +0300 (EEST)
Date: Wed, 9 Jul 2025 21:12:57 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 06/10] media: i2c: ov9282: add led_mode v4l2 control
Message-ID: <aG7bWXpz5sxYcLKI@kekkonen.localdomain>
References: <20250617-ov9282-flash-strobe-v5-0-9762da74d065@linux.dev>
 <20250617-ov9282-flash-strobe-v5-6-9762da74d065@linux.dev>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617-ov9282-flash-strobe-v5-6-9762da74d065@linux.dev>

Hi Richard,

Thanks for the update.

On Tue, Jun 17, 2025 at 09:31:40AM +0200, Richard Leitner wrote:
> Add V4L2_CID_FLASH_LED_MODE support using the "strobe output enable"
> feature of the sensor. This implements following modes:
> 
>  - V4L2_FLASH_LED_MODE_NONE, which disables the strobe output
>  - V4L2_FLASH_LED_MODE_FLASH, which enables the strobe output

I really think you should use a different control for this. The sensor can
strobe the flash but it won't control its mode.

How about calling it V4L2_FLASH_STROBE_ENABLE?

-- 
Kind regards,

Sakari Ailus

