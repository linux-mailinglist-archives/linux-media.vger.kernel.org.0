Return-Path: <linux-media+bounces-35889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C9DAE8956
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 18:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 261311BC7F13
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 16:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CCE2BF018;
	Wed, 25 Jun 2025 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QHpU5A4B"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8B62BEFEF
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 16:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750867850; cv=none; b=XVKHHhivAdoNJBx8EVcbJyj2SF2CTU/niIAbtKaK3OkD1xvLuqrH6p6gtv0ijl5cXiv79Cn9f0Ml2RqQUV85O+bNlRAPciN8i9IkR1SMuJmT+qoNnZhRCR1BhXan80/LFz16DNaKBxyWQTUvnnJlwuqouT0dH0KoxaKtKis3NQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750867850; c=relaxed/simple;
	bh=QFDG1sTGmUo77E1FUYaXdDYPU8EDNC71b8t/Phr8YlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+P04+m1yeV3Qu1uR21Lqb/nZvzeH/43wkfWYUnqfi2LY9CaGSZuhw8qOxQ/7IZ15iEud8zSvLqrD0vBd0C+VMvUf+NWpx9P5LBsAm+SlQrT70elDHv3RNvWjjUEZcRvNPboCB4TtMoldGcG+Tuy0XNrDncXdFZkKYCQ+wkpQmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QHpU5A4B; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750867848; x=1782403848;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QFDG1sTGmUo77E1FUYaXdDYPU8EDNC71b8t/Phr8YlM=;
  b=QHpU5A4BYtJrPKi74v3QHRoS/+s8dqwy1yMoSYQzpL4sFqk0Y0Eke0RR
   JxC6IfIUoAXvjc23+64w4vIEUEHL9nyoelPYsopMrXZO6pggveGC/CK+V
   JwAvdvKRN29jFC3LZHBfftIS43JWQF5ynaXM5awnwJWlS49IIoIL5Ro+D
   CDsKE0i4qVK9d2d5AfjEFJvnkEUKNPTACZo+wd5MF8qojyzTcu/H+UgbN
   CEByOE3rsvzndhfLx0NhJDvhhpjNNdWqXjvkpHiefWxnZYrqd1z6T6F75
   I6IKu6LD+0Z/sDpUGNbBQ0yt6kKFahagsmU7b7z5K7q0T7ex+D407DiPk
   A==;
X-CSE-ConnectionGUID: aGOyEQfuQtmJVVf/4ptuuA==
X-CSE-MsgGUID: 0OZum9ZbSFaTcYoWuFQADg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63834835"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="63834835"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:10:47 -0700
X-CSE-ConnectionGUID: +PlQ0NzSSEy8bpBb1mfE7A==
X-CSE-MsgGUID: BC/fq2ITQzCrvMH/w0viCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="152553143"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.57])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:10:46 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CC0B911F737;
	Wed, 25 Jun 2025 19:10:42 +0300 (EEST)
Date: Wed, 25 Jun 2025 16:10:42 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 06/13] media: v4l2-subdev: Mark both streams of a route
 enabled
Message-ID: <aFwfgtkXIZ1APh04@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-7-sakari.ailus@linux.intel.com>
 <20250619165604.GH32166@pendragon.ideasonboard.com>
 <aFRYMWoi9vpsdYKa@kekkonen.localdomain>
 <20250619221857.GM32166@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619221857.GM32166@pendragon.ideasonboard.com>

Hi Laurent,

On Fri, Jun 20, 2025 at 01:18:57AM +0300, Laurent Pinchart wrote:
> On Thu, Jun 19, 2025 at 06:34:25PM +0000, Sakari Ailus wrote:
> > On Thu, Jun 19, 2025 at 07:56:04PM +0300, Laurent Pinchart wrote:
> > > On Thu, Jun 19, 2025 at 11:15:39AM +0300, Sakari Ailus wrote:
> > > > Streams are stored in sink-source pairs in sub-device state.
> > > 
> > > Is it really this simple ? Don't we support for instance stream merging
> > > where two streams on possibly different sink pads are routed to a single
> > > stream on a source pad ?
> > 
> > As far as I'm concerned, yes. Each route has a sink and a source pad, you
> > may have multiple routes from a pad or to a pad, but these are all separate
> > routes. The UAPI as well as v4l2-subdev.c is aligned with this and I
> > wouldn't expect it to be otherwise.
> 
> Should we then refactor v4l2_subdev_stream_configs to contain a list of
> route configs, with each route config containing two stream configs, one
> for the sink pad and one for the source pad ? We would still have
> duplicated entries when multiple routes originate from or end at the
> same pad/stream, but the data structures would be more explicit and we
> would rely less on the fact that each route has a pair of consecutive
> stream configs.

Most of the code dealing with stream configurations works on either sink or
source pads and the current data structure makes that code more simple. I
think this was probably a factor why Tomi wrote it like this.

Tomi, any comment on this?

> 
> > I'd like to have Tomi's view on this, too.
> > 
> > > > When a stream
> > > > was marked enabled (or disabled), only the state of one end of the stream
> > > > was modified, leaving the stream in an incoherent state. Mark both ends of
> > > > the stream enabled (or disabled).
> > 
> > This should discuss "route" in fact, not "stream".
> 
> That would make it a bit clearer.

I'll fix this for v2.

-- 
Regards,

Sakari Ailus

