Return-Path: <linux-media+bounces-47489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B1620C74036
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 13:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 00A6135C43C
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 12:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85923358CF;
	Thu, 20 Nov 2025 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="djwhqx3Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5120733769F;
	Thu, 20 Nov 2025 12:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763642436; cv=none; b=o5N5EOBuA24VEn9svbDZt8ji7L43E75CrBhgQo5PYuzuLaliN5z703N10PUnTTnReQ7rzgxJXcoWeWRgOXTR1QaSKInxZEZGM3feV9f9Y7uzIKCeK2p0p+RCh/daAVkEElsZRZBV+imFo/elYc98EyghCvIVojbR5G9kfkgxtR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763642436; c=relaxed/simple;
	bh=ecacS3vLROhiO/copFFAPl1TABQMTTj0vieClgziu7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D5EelBWBryc4S9CE3Kfs+6vKAVbx2cSi1Y5HaUYZxI4onB0xy5MjYfw4HAqLh+iaG6WbErqami+s4WAFymkJGtChsHx7Gh6KHbvlAtWB2g9cJ+HvZaMoKnjNr+v4RaiIKt7HILUYXQC4C4/vyTgpM2ikUiHDp3sU+4/lqHQ8HlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=djwhqx3Q; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763642434; x=1795178434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ecacS3vLROhiO/copFFAPl1TABQMTTj0vieClgziu7Y=;
  b=djwhqx3QUgkxbBeojKoLmh1cBipOfeyb6ET4IF4m6XiGnm0vAr/xRDDW
   Lf8VomzIyqO+ScSFtLjB8rc60ZGB6CyHW8qaOzyv/1zD7oipOHX24NW16
   FOO1JiGfQ6esddEy5wJpGNQsjWmPVx4JKXoJSJIrocslr8meunaE1mbiw
   jGgiB+cGrv64qnVy3LYgP5PDqq/BRV3kbxuylj+QDXnw+uiDcm4EBdXKI
   ja2DQ1LrgdcBO/XPLw+QUY0DVl4cNmg4OZt65p6URCu33aC0hq1ftDz1o
   Lbup0ejBsQxAwXlx1aAeFhsPC15h5gFUHU8z+BSyoX3gYUX2rLo1GpY9D
   A==;
X-CSE-ConnectionGUID: A3fRh+KdRoCcRW8CZjbp7Q==
X-CSE-MsgGUID: 4GP0LF+CTQGR79bMFmk+OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65602677"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="65602677"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 04:40:33 -0800
X-CSE-ConnectionGUID: 1s+a1+duQieX/irvPb23tA==
X-CSE-MsgGUID: wZIsAbMqS/CabjtJCZmIFw==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.114])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 04:40:29 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F3EED121DCE;
	Thu, 20 Nov 2025 14:40:26 +0200 (EET)
Date: Thu, 20 Nov 2025 14:40:26 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com,
	mripard@kernel.org, y-abhilashchandra@ti.com, devarsht@ti.com,
	s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
	sjoerd@collabora.com, dan.carpenter@linaro.org,
	hverkuil+cisco@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 08/18] media: ti: j721e-csi2rx: Move to
 .enable/disable_streams API
Message-ID: <aR8MOiFowG8E3_NJ@kekkonen.localdomain>
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-9-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112115459.2479225-9-r-donadkar@ti.com>

On Wed, Nov 12, 2025 at 05:24:49PM +0530, Rishikesh Donadkar wrote:
> Support the new enable_stream()/disable_stream() APIs in the subdev
> instead of s_stream() hook.
> 
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

This addresses my comment on the 6th patch.

Shouldn't this be merged to that?

-- 
Sakari Ailus

