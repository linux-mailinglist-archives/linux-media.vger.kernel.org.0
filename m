Return-Path: <linux-media+bounces-35428-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD91AE0CFD
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 20:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BEAC166446
	for <lists+linux-media@lfdr.de>; Thu, 19 Jun 2025 18:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB38D30E858;
	Thu, 19 Jun 2025 18:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LPIeIvBB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718B430E835
	for <linux-media@vger.kernel.org>; Thu, 19 Jun 2025 18:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750358073; cv=none; b=fxUzpDjqP+L0bmWPQZdsvWc6HDZllMmq1pVnjROo0abRK7ejjtAaHjxR6lA34B47gKMmvEmdM4H7ESspwTfKLMT7DdoiNk4G/udysJCKBLtIowcFcoHXMJkMYfAnUVu76GPEvw07xPVVmxabHsDlE3i8ZROkcBrAJ6kchqUrUH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750358073; c=relaxed/simple;
	bh=0rFsnE6ioeBZaipRWyKh0mQL+t+ev5qxroQuyWGZ6b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fg0gtHX/i+rK4vMXcoqLwh2gWInkgMTgxdkxiOpI6vK+HZb8xB32B6ULq25vtE+OWM6ZqSkaq2uUAD+Cy49lKMza03CXtCy9Muw8ru0G1LwxSIFfbuiHAbDNgAIYAH0h4qijmAvZ/xoikQE0SIuuxARwRaHiszUk4IydHYOyOfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LPIeIvBB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750358071; x=1781894071;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0rFsnE6ioeBZaipRWyKh0mQL+t+ev5qxroQuyWGZ6b8=;
  b=LPIeIvBBi06WExl9atRlpc0mTmTWno+bwWRinxozsxzi2ZC0Gk2FWzyx
   7iSgzWKxkM+ydAKFfKS4cyT/yPgoghvmRYY4k3v1UXyVaVPmoJsnHxqiv
   FaJe8gEUgNboCyGpQbn2uvbwUAZenOlFdrxE9I6YbYXExkCPCRPJ7ilFk
   jnZUcfvxfFkxZP0/YtHmuOzPOiQKeEOqEKHNsXtqCQzjdRtiUQbGRxhNt
   T09onoIfD1lSNIe8sjgdzSISIWJy+HqCLYFLJ+KJqsinslmIsJFWvckpi
   mKTe5ewa2wNvXWK9yVCIuzTeAum+xyPaByvNkzwNLwxDfntCCf5zVZQnH
   w==;
X-CSE-ConnectionGUID: uDTcOCiUTdaMUldeMWK6/w==
X-CSE-MsgGUID: Fib+uNh6S3etFjZSGwZvXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="63974961"
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="63974961"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:34:31 -0700
X-CSE-ConnectionGUID: n2HvNXZxQjSiYd5Wtx3a0g==
X-CSE-MsgGUID: 3Fl3VUEEQvq/jTKQHrwZKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,249,1744095600"; 
   d="scan'208";a="150922059"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.10])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 11:34:28 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 05EFB11FAB3;
	Thu, 19 Jun 2025 21:34:26 +0300 (EEST)
Date: Thu, 19 Jun 2025 18:34:25 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 06/13] media: v4l2-subdev: Mark both streams of a route
 enabled
Message-ID: <aFRYMWoi9vpsdYKa@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-7-sakari.ailus@linux.intel.com>
 <20250619165604.GH32166@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619165604.GH32166@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Jun 19, 2025 at 07:56:04PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thanks for the review.

> 
> On Thu, Jun 19, 2025 at 11:15:39AM +0300, Sakari Ailus wrote:
> > Streams are stored in sink-source pairs in sub-device state.
> 
> Is it really this simple ? Don't we support for instance stream merging
> where two streams on possibly different sink pads are routed to a single
> stream on a source pad ?

As far as I'm concerned, yes. Each route has a sink and a source pad, you
may have multiple routes from a pad or to a pad, but these are all separate
routes. The UAPI as well as v4l2-subdev.c is aligned with this and I
wouldn't expect it to be otherwise.

I'd like to have Tomi's view on this, too.

> 
> > When a stream
> > was marked enabled (or disabled), only the state of one end of the stream
> > was modified, leaving the stream in an incoherent state. Mark both ends of
> > the stream enabled (or disabled).

This should discuss "route" in fact, not "stream".

-- 
Regards,

Sakari Ailus

