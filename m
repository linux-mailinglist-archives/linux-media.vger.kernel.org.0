Return-Path: <linux-media+bounces-47079-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EE8C5D248
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 13:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5A396349754
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 12:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6319715746E;
	Fri, 14 Nov 2025 12:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCnoAerF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF37B147C9B
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 12:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763123528; cv=none; b=OOVsqixMfXoXtjrBYmW3e+U/ddEVsvdrVt619emm7bAYC03hDib76D3d1KU/lLoS50dqTLgdq70TBYbmT2ebMDKk8Gk1My+vSHUAn745/IRSBFIoCfdxpnjvfRnS+45J+fpnD6xpmhKP03Tr1O9SuuYz/qFQFdmPFz1ZJVAtwFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763123528; c=relaxed/simple;
	bh=fQbdYyrgAQM8llNGfdhTnkUNiS0izaNUo3ZQjP5bEZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQ3N+tDoCw7BuidESdO5/26T/6FYnVbh8EGm/NhLXm8dmSrrD4kInJSsMaYKOanViDB1aQgZ1kJyJPW4AMr2dc0hEZUQqkmtn4WuWhsQCDcksPwbxKMWvbG3ISrfdrNvBnCdNld9D2EHpIG1pYLEjPGxzwvE5eLimpIgpn4ObNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCnoAerF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763123526; x=1794659526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fQbdYyrgAQM8llNGfdhTnkUNiS0izaNUo3ZQjP5bEZ8=;
  b=kCnoAerF/kp0RPtUpW9/j2w/9fdJhbkNAwzALB04vepheBx5kBfA381w
   bCyJNytLtk8Ogu8gDwFBw4ILzK3xFo+YNBMbTF7uSNHO34Za4PxY50KLw
   ipDo+ucCWqZmyVqCJESXOGVX2dABz0TkuJTZpVDFiPjnyvjnPDNXxmZWR
   ig95mq5D4jL1fgrXz/c8M7Eg1XNMDHi45/R63G2XUaKZQU04n/VNYKfBf
   lZz/0S3M5R9ul2QQ/rycgLL2qUREgil3Y/U3gqkxfDq7Bb6xauUpbRWDK
   10mEy7fc7ucwFmNX7uL+AFR//MbMkE7ZnBMb4qV7lh9GtJbOFR0ZwH6j0
   g==;
X-CSE-ConnectionGUID: x5Y+vPL9S9ex9PSX8jKTgg==
X-CSE-MsgGUID: TE+fCXGwQJ+nnMiQ3aD4qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="52783093"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="52783093"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 04:32:06 -0800
X-CSE-ConnectionGUID: a7fbtR3jQ5SkyJXZ3yQwig==
X-CSE-MsgGUID: JtCHabebQcmNUhwWzatdRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="190545091"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.53])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 04:32:04 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id ED98E121DDE;
	Fri, 14 Nov 2025 14:32:03 +0200 (EET)
Date: Fri, 14 Nov 2025 14:32:03 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: hans@jjverkuil.nl, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 0/2] Mali-C55, v4l2-isp late fixes
Message-ID: <aRchQytoLBS0llYd@kekkonen.localdomain>
References: <20251114110213.523187-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114110213.523187-1-jacopo.mondi@ideasonboard.com>

On Fri, Nov 14, 2025 at 12:02:10PM +0100, Jacopo Mondi wrote:
> As suggested by Hans, 2 patches to be applied on top of the Mali C55
> pull request.
> 
> The first addresses Hans' review comments on v4l2-isp and updates its users.
> The second one is a drive-by change that brings Mali in par with RkISP1 and
> C3 and asserts the size correctness of the ISP blocks handlers and type info.
> 
> Jacopo Mondi (2):
>   media: v4l2-isp: Rename block_info to block_type_info
>   media: mali-c55: Assert ISP blocks size correctness
> 
>  .../platform/amlogic/c3/isp/c3-isp-params.c   |  9 ++++---
>  .../platform/arm/mali-c55/mali-c55-params.c   | 10 ++++---
>  .../platform/rockchip/rkisp1/rkisp1-params.c  |  9 ++++---
>  drivers/media/v4l2-core/v4l2-isp.c            | 16 ++++++------
>  include/media/v4l2-isp.h                      | 26 +++++++++----------
>  5 files changed, 38 insertions(+), 32 deletions(-)

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus

