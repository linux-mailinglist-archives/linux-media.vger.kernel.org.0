Return-Path: <linux-media+bounces-47970-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F61C97FB0
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 16:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 384803A41C1
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 15:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C15331A049;
	Mon,  1 Dec 2025 15:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMVAl9HH"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF34313E0C
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 15:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764601829; cv=none; b=jXmPqHszqSFx3eASdfSIcEOtXL7BKlEkmcLJ+oGhJb4KcI43eXx+o5YhBDJW/+Da6vy4eCIg/GKN4d5WTBlnzcAiHDrKB/Bjs/zoq6Pvt27ZdxsCwZj0m8bbrF/3VZDwxuUSzhzlXqrNdI0bF/QoO0Zs6ybCRb4T63Ru8oWxLPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764601829; c=relaxed/simple;
	bh=A5ybvPkccLEYHJ6fjzebBHlTf44tFdmB80xWoIASSOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHm/WkG5HYXiMSYbPnLSPoK3wmGhmcNFCX6LTXpV4AZqeJo7ZytJ0nw576OLnxh9iO3BZIw3947bwR0tzc2Msneu7xcD4vUP0AOs+5IetBpKbQpDxYOHauIWpTUmomHOwh8UMLXZhCqVV7dVpmSkGv/gQMI3HfLgWT+YfDi8G/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMVAl9HH; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764601827; x=1796137827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A5ybvPkccLEYHJ6fjzebBHlTf44tFdmB80xWoIASSOY=;
  b=dMVAl9HH/LGyBF8WjBLdDI1a4U54jnhorxRLxKuNwYSLqx6+3An910YD
   z6hneKIg6tq3ipg9FoJzakuEeFH5H9IELAUXlFP+/lGm1fON4bfYS2gAX
   lMPUCI0pKUo6mqeNlWhR4ebcXyAPME5KgOo6N0rZxtnXlBxxhbWMtzUVD
   GarAxoiIDNDjhN8RgvLw8mD+uLiiuET+hk2yWa9Q8A1mmfB6qc0reCWVL
   SC65TCRI7TjBuqRuxtiLBPsX2O8FkKl5asPdhX/FWXv9dKwPvlHyGm3M8
   1EEmksk1PL2G9aa2/k902x1lTcroxi0QaK2qHAOvT2OJI2z7LLhXrdJHI
   Q==;
X-CSE-ConnectionGUID: Ir2CXAhARdiOD9al8QSyoQ==
X-CSE-MsgGUID: RQO/qXUURgynpAK6ZalmNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66434933"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66434933"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 07:10:23 -0800
X-CSE-ConnectionGUID: wEPT43qDT2SgluMGU8m3wQ==
X-CSE-MsgGUID: 6UbHIKRbQKCpcvVHclTEaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="225075029"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.19])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 07:10:21 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 82C8711F8A6;
	Mon, 01 Dec 2025 17:10:24 +0200 (EET)
Date: Mon, 1 Dec 2025 17:10:24 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 09/14] media: omap3isp: better VIDIOC_G/S_PARM handling
Message-ID: <aS2v4IwRNf2ZTTed@kekkonen.localdomain>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <659149538833acf06f40a5660d03809f9f1c7ef6.1760707611.git.hverkuil+cisco@kernel.org>
 <aPiRLPbzWoW4GFXt@kekkonen.localdomain>
 <b3c22527-7d92-44b0-b7cd-2f1fe2c42a36@kernel.org>
 <e8344b04-aa20-4971-aca7-8f77691dca19@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8344b04-aa20-4971-aca7-8f77691dca19@kernel.org>

Hi Hans,

On Mon, Dec 01, 2025 at 02:40:38PM +0100, Hans Verkuil wrote:
> On 01/12/2025 11:28, Hans Verkuil wrote:
> > On 22/10/2025 10:09, Sakari Ailus wrote:
> >> Hi Hans,
> >>
> >> On Fri, Oct 17, 2025 at 03:26:46PM +0200, Hans Verkuil wrote:
> >>> Fix various v4l2-compliance errors relating to timeperframe.
> >>>
> >>> VIDIOC_G/S_PARM is only supported for Video Output, so disable
> >>> these ioctls for Capture devices.
> >>>
> >>> Ensure numerator and denominator are never 0.
> >>>
> >>> Set missing V4L2_CAP_TIMEPERFRAME capability for VIDIOC_S_PARM.
> >>>
> >>> v4l2-compliance:
> >>>
> >>> 	fail: v4l2-test-formats.cpp(1388): out->timeperframe.numerator == 0 || out->timeperframe.denominator == 0
> >>> test VIDIOC_G/S_PARM: FAIL
> >>>
> >>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> >>> ---
> >>>  drivers/media/platform/ti/omap3isp/ispvideo.c | 11 +++++++++--
> >>>  1 file changed, 9 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>> index 471defa6e7fb..5603586271f5 100644
> >>> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >>> @@ -928,7 +928,10 @@ isp_video_set_param(struct file *file, void *fh, struct v4l2_streamparm *a)
> >>>  
> >>>  	if (a->parm.output.timeperframe.denominator == 0)
> >>>  		a->parm.output.timeperframe.denominator = 1;
> >>> +	if (a->parm.output.timeperframe.numerator == 0)
> >>> +		a->parm.output.timeperframe.numerator = 1;
> >>
> >> I believe S_PARM support has probably been added for v4l2-compliance in the
> >> past. Should there be either a dummy implementation for more or less all
> >> Media device centric drivers or could this be simply omitted?
> > 
> > v4l2-compliance has seen quite a few changes w.r.t. the G/S_PARM tests,
> > and I think it is fine to just drop support for these ioctls.
> > 
> > I'll test this a bit more, and if I don't find any issues, then I'll
> > just remove support for these ioctls in omap3isp.
> 
> Actually, S_PARM is used to set the max framerate for the output of the omap3isp.
> 
> So it is in use.
> 
> I'm keeping this patch.

You're right; it's used on OUTPUT buffers indeed.

-- 
Sakari Ailus

