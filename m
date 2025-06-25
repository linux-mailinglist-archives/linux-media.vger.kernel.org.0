Return-Path: <linux-media+bounces-35892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1675AE8971
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 18:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1CBC189B090
	for <lists+linux-media@lfdr.de>; Wed, 25 Jun 2025 16:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA80E2638BC;
	Wed, 25 Jun 2025 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXNkzbIo"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D7B25DB1E
	for <linux-media@vger.kernel.org>; Wed, 25 Jun 2025 16:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868087; cv=none; b=XQc97tPMZrMLDy6jisfmxfWoPB+RbWKZhB11UV8pc3SF6jld8anUqDNy+ycRQnYMo4XDxc95iu5kIUR1wWj42tkXFaZSBrkcsu4VJu59HoBASYxXfdLLM0LNgcKZnJv7r1uHTNRu0o+Er3Z557P/pOH/7KovKSz2q1IUTeIBvqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868087; c=relaxed/simple;
	bh=ms+AJt6cHlM7I9njltlhwH3hUmbrMd69Dh/gHYVBnKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KJ5bSLgKE65zlijt91lzfrDNTrk9zfsP5pPi93lA4n36PUuQGfLRvnMAI3xkO7tACmIN78upYXsTwngediQzzmkI1G6XjoRemQS2leOV9d1/auGkIU0JRMl9IGdZvgpBZI1t/nxwydFAnIMTLWDMaGZ5gtgwmSnWhNMz10Ef0PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXNkzbIo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750868086; x=1782404086;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ms+AJt6cHlM7I9njltlhwH3hUmbrMd69Dh/gHYVBnKg=;
  b=JXNkzbIoN7gZBS3b1tOZjXUia1M8QL0uHKJHsCAr26IPQW2CS3Ku5wnA
   pQXQugdN1gESP1M3/LM+MKsPxHWA+1YVOu56UmOVpYUG7ihVJmdlq5e31
   6mO3DA5mtPjr/k3PvF01ibzkbBx5/R5sFCRHMVSpMeRivii2Uo5qUYClD
   sWDTo8hxDFcbCWS2HzmDcOb75otim1PD8KAEannA3eLsAm20jK8GZbyq9
   lh2Ii8BA8S98EEmkuDMkauiM/+V0Uj9aQiPdJzYMgEC8sGUaP7Wyk+cre
   4h1BzcyQUB18bPlaauP84hHmpyqF2Sr2e10QqIkUIF/EDkhK6GQHQydOH
   w==;
X-CSE-ConnectionGUID: fv1RXRHkS4uUlFyEQgcegA==
X-CSE-MsgGUID: iBAbLW8rSKeBTxKT+q7VHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53012201"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53012201"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:14:45 -0700
X-CSE-ConnectionGUID: YDJrTW0kSamCgle8W2JDpA==
X-CSE-MsgGUID: pE3bl1ZtTEqrEo3eDWiBbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="175911622"
Received: from agladkov-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.57])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 09:14:43 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id CF43811F737;
	Wed, 25 Jun 2025 19:14:39 +0300 (EEST)
Date: Wed, 25 Jun 2025 16:14:39 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, bingbu.cao@linux.intel.com,
	stanislaw.gruszka@linux.intel.com, tian.shu.qiu@intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 09/13] media: v4l2-subdev: Collect streams on source pads
 only
Message-ID: <aFwgb-tCCJ-X_DR5@kekkonen.localdomain>
References: <20250619081546.1582969-1-sakari.ailus@linux.intel.com>
 <20250619081546.1582969-10-sakari.ailus@linux.intel.com>
 <20250619170717.GK32166@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619170717.GK32166@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, Jun 19, 2025 at 08:07:17PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.

Thank you for the review!

> 
> On Thu, Jun 19, 2025 at 11:15:42AM +0300, Sakari Ailus wrote:
> > v4l2_subdev_collect_streams() is used to find the streams present on
> > source pads only. Only iterate through the streams on source pads, i.e. on
> > odd array indices.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-subdev.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 6bc855058ca6..932fca795d4a 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -2225,16 +2225,17 @@ static void v4l2_subdev_collect_streams(struct v4l2_subdev *sd,
> >  	*found_streams = 0;
> >  	*enabled_streams = 0;
> >  
> > -	for (unsigned int i = 0; i < state->stream_configs.num_configs; ++i) {
> > -		const struct v4l2_subdev_stream_config *cfg =
> > -			&state->stream_configs.configs[i];
> > +	for (unsigned int i = 0; i < state->stream_configs.num_configs; i += 2) {
> > +		const struct v4l2_subdev_stream_config *src_cfg =
> > +			&state->stream_configs.configs[i + 1];
> 
> You could start at i = 1 and avoid the + 1 here.
> 
> Unless I missed it, I don't think we document anywhere that we store two
> values per route in the array, and that, if multiple routes have the
> same sink or source stream, multiple entries will exist for the same
> stream. I'd like to see this clearly explained somewhere, instead of
> relying on an implemetation detail only known by few people.

I'll add this in a separate patch.

-- 
Regards,

Sakari Ailus

