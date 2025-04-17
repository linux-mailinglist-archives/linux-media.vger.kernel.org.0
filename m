Return-Path: <linux-media+bounces-30430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9BFA9150F
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 09:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 700C54460E5
	for <lists+linux-media@lfdr.de>; Thu, 17 Apr 2025 07:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25D62192FA;
	Thu, 17 Apr 2025 07:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIr4D4l7"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85BC2147FB
	for <linux-media@vger.kernel.org>; Thu, 17 Apr 2025 07:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744874612; cv=none; b=GTN72hmX4N7+LSA7jagfy9zKVxK/UgqPBm0i9FN1znfxPbIjQ3OgcjdvJZ+T6AoZJe1EjJoOWSLuUDB14U9vseL83REdyxaspz78tjDVA921ZIFWZd7d54GsFUNmBJ9wMRndN88jiO5jHQX5wWpDoe7wh3pLOj3SShcmZkzwISU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744874612; c=relaxed/simple;
	bh=1ffpPLrMrGMr9pGkR7Naab4viBa/K0EzkaUB30xq/qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8fm3FGP4e1wfusAodATe7Hd00pVdbJ24d5iOI8lsN3d5yyVearTyVu2xNhdUFy2oznFYQlef8frfB7edBAW1q0E4PcaY1dGfkHnvIlBbQb6JylMti8cepvGk7lZPpSj+TMl0ZiXkxalsBzvIiNDiHAGYbTi70iDsPlOcCjGmyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIr4D4l7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744874609; x=1776410609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1ffpPLrMrGMr9pGkR7Naab4viBa/K0EzkaUB30xq/qU=;
  b=QIr4D4l7Mtg7pWfJH/KQbBBlUjxOfTP+LbPi+DLjLbIDhdNlPpAFSMRP
   h7x2bN5NPldPJKHgDQnoLCNArDHt4OKr87V6YRaeNbLkJAyCir7iOaVdZ
   W7Jt82nQGn9kxywb3jTFXWYMVElrY783Z8X5ZsHT2iXl7lgdCI3kXfvLf
   StTFBHDHGn/UfXYPuHd0/dwSAXWQRCNZPj8za2pBWehk5N1byPpO/7kDF
   6dLQbkOJCA4N33QDy8QL1GUEmh0yRby8meAIaVkNOFBSRL+xkWrR6FDN/
   rjZoFq1JQ2fDscmfe2bwJFljruYLX2b+VA733Nt0Oafcx/6XJGBT/zYEV
   Q==;
X-CSE-ConnectionGUID: ziVjlo9VSRWUJ03afO55wA==
X-CSE-MsgGUID: SEcCeWf7RyKBwRDm+2lZvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57833236"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="57833236"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:23:29 -0700
X-CSE-ConnectionGUID: 3VDcktvBSHu5A/jigqfWuw==
X-CSE-MsgGUID: FjFg3a6qR9Kc+tWXF1ONyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; 
   d="scan'208";a="135806944"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 00:23:27 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 730FF11F9C2;
	Thu, 17 Apr 2025 10:23:24 +0300 (EEST)
Date: Thu, 17 Apr 2025 07:23:24 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Yan, Dongcheng" <dongcheng.yan@intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
	dave.stevenson@raspberrypi.com, hverkuil@xs4all.nl,
	ricardo.ribalda@gmail.com, bingbu.cao@linux.intel.com,
	tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
	dongcheng.yan@linux.intel.com
Subject: Re: [PATCH v5] media: i2c: Add ar0234 camera sensor driver
Message-ID: <aACsbHxw3GLXxQwU@kekkonen.localdomain>
References: <20250410161249.3455729-1-dongcheng.yan@intel.com>
 <aAClUxNhOhcPl9zX@kekkonen.localdomain>
 <4a432eb3-79ba-4e8e-a7f6-c0bb0db749a9@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a432eb3-79ba-4e8e-a7f6-c0bb0db749a9@intel.com>

Hi Dongcheng,

On Thu, Apr 17, 2025 at 03:16:13PM +0800, Yan, Dongcheng wrote:
> Hi Sakari,
> 
> On 4/17/2025 2:53 PM, Sakari Ailus wrote:
> > Hi Dongcheng,
> > 
> > On Fri, Apr 11, 2025 at 12:12:49AM +0800, Dongcheng Yan wrote:
> >> The driver is implemented with V4L2 framework,
> >> and supports following features:
> >>
> >>     - manual exposure and analog/digital gain control
> >>     - vblank/hblank control
> >>     - vflip/hflip control
> >>     - runtime PM support
> >>     - 1280x960@30fps and 1920x1200@60fps support
> >>     - dynamical pll_params set
> >>
> >> Signed-off-by: Dongcheng Yan <dongcheng.yan@intel.com>
> > 
> > I reviewed Laurent's ar0144 driver and it turns out that the ar0144 and
> > ar0234 sensors are nearly identical in their register interface. Thus they
> > could be controlled using the same driver, with relatively small changes.
> > Laurent's driver programmatically sets the register values in general and
> > does not rely on register lists, which is why I prefer that driver.
> > 
> > Would you be able to add ar0234 support to the ar0144 driver, please?
> 
> Do you mean use the ar0144 driver to support the ar0234? two sensors
> share the same driver code? Or do I implement the similar
> "programmatically sets the register values" in the ar0234 driver?

The former.

-- 
Kind regards,

Sakari Ailus

