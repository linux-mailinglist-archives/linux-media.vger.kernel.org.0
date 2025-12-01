Return-Path: <linux-media+bounces-47945-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD0BC97156
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 12:40:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7A4FD3456C0
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 11:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F6B26F2BE;
	Mon,  1 Dec 2025 11:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+vjrXUW"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0D026E6F7
	for <linux-media@vger.kernel.org>; Mon,  1 Dec 2025 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764588933; cv=none; b=ZZLnqw5RkOhuXpimuy409r1Omu2aIWQ3eaUjMAUTwCg/pyDVkTeW5HJRUpv6sG+nWkt4/av39Wgxyuwd+/jBzJuOJfvRJ9hWur4jBzz1holndlC8o9ACgXcIG2Rj0TkKiYRC8WKK7hcHnMzLdbWE4N+/39xRBsBL1Oa5nUiN+dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764588933; c=relaxed/simple;
	bh=ld9DPivj9Ek7VWfQa1+Lpu6xQBneuacucm4VbnBBj8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hg1pe5dgD1HMH2QVaQDZuiQ9iR+e9zgPQkQxH1lMTys5Tc5Xd5q/8Q9nbdRpYuKZlPsTTAtOwo+A4OFifZBe1BO/t2634Nj+kmZjGz3BLWQcIKqLX36iOh7cyGS4g57JO6+5vh0DTe5HzK+3qa2NZkzfVauJOSi3yVc+qvGqOtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+vjrXUW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764588931; x=1796124931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ld9DPivj9Ek7VWfQa1+Lpu6xQBneuacucm4VbnBBj8I=;
  b=T+vjrXUWsjBWVe1gcY8dklC2G7HsVQS7yqTLizLvOuKD+8EEhZ99ingn
   6yCbGep9sGRTU9geS7X2bCuJPGQVT6s1wQIqQtqPsAc7MUJNw3J8IGoaA
   rHxWr+mmkhKiSG4qGcmr3DQJDVt6AGyI7OPUZBC+tEW3+PAm/tgG7jJEI
   QsHjcNd64qNcQS/Svv9KdOsbZkwvYxkDhGyb96QqlIZkdFGYLl6JEq9PS
   GjJG7vczInuMzs4sp/pGWcDyq04A5MagwKPEFYMsho1sN0xuFxGQ/CjqN
   FKoyiaXoFuzrmuYWmGQUAvULFOgmfJ8s1x983N+nD6jnmgqafMFsvDsyH
   A==;
X-CSE-ConnectionGUID: QwwECj+0RdyTiZcuzcIy9Q==
X-CSE-MsgGUID: 8/Qn7lJrR1ifQPrA8oT2Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="70136615"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="70136615"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 03:35:30 -0800
X-CSE-ConnectionGUID: FJpt29K5RGK+oilAxze71Q==
X-CSE-MsgGUID: B9uN5AdYTpuGD8a5ghNxIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193871034"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.162])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 03:35:29 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 50EE111FA74;
	Mon, 01 Dec 2025 13:35:31 +0200 (EET)
Date: Mon, 1 Dec 2025 13:35:31 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 04/14] media: omap3isp: implement enum_fmt_vid_cap/out
Message-ID: <aS19g3Z38hAAcBkw@kekkonen.localdomain>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <30813a3e81f2d8a6f42f637eba6fba2481b535cf.1760707611.git.hverkuil+cisco@kernel.org>
 <aPiOIoe24l5NNz6z@kekkonen.localdomain>
 <9cd8b533-95fb-4495-a67b-bdf5c7774a74@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cd8b533-95fb-4495-a67b-bdf5c7774a74@kernel.org>

Hi Hans,

On Mon, Dec 01, 2025 at 09:40:58AM +0100, Hans Verkuil wrote:
> On 22/10/2025 09:56, Sakari Ailus wrote:
> > Hi Hans,
> > 
> > On Fri, Oct 17, 2025 at 03:26:41PM +0200, Hans Verkuil wrote:
> >> Add missing ioctls. This makes v4l2-compliance happier:
> >>
> >> fail: v4l2-test-formats.cpp(516): pixelformat 59565955 (UYVY) for buftype 1 not reported by ENUM_FMT
> >> 	test VIDIOC_G_FMT: FAIL
> >> fail: v4l2-test-formats.cpp(516): pixelformat 59565955 (UYVY) for buftype 1 not reported by ENUM_FMT
> >> 	test VIDIOC_TRY_FMT: FAIL
> >> fail: v4l2-test-formats.cpp(516): pixelformat 56595559 (YUYV) for buftype 1 not reported by ENUM_FMT
> >> 	test VIDIOC_S_FMT: FAIL
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> >> ---
> >>  drivers/media/platform/ti/omap3isp/ispvideo.c | 34 +++++++++++++++++++
> >>  1 file changed, 34 insertions(+)
> >>
> >> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >> index 864d38140b87..77beea00d507 100644
> >> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> >> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> >> @@ -652,6 +652,38 @@ isp_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
> >>  	return 0;
> >>  }
> >>  
> >> +static int
> >> +isp_video_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
> >> +{
> >> +	struct isp_video *video = video_drvdata(file);
> >> +	unsigned int i, j;
> >> +	unsigned int skip_last_fmts = 1;
> >> +
> >> +	if (f->type != video->type)
> >> +		return -EINVAL;
> >> +
> >> +	/*
> >> +	 * The last two formats have the same pixelformat as the two
> >> +	 * formats before them, but they do have different mediabus
> >> +	 * codes. So to avoid reporting duplicate pixelformats we skip
> >> +	 * those two, provided f->mbus_code is 0.
> >> +	 */
> >> +	if (!f->mbus_code)
> >> +		skip_last_fmts += 2;
> >> +	for (i = 0, j = 0; i < ARRAY_SIZE(formats) - skip_last_fmts; i++) {
> >> +		if (f->mbus_code && formats[i].code != f->mbus_code)
> >> +			continue;
> > 
> > How about, instead of the skip_last_fmts thingy, using this:
> > 
> > 		/* Weed out pixelformats with the same mbus code. */
> > 		if (i && formats[i - 1].code == formats[i].code)
> > 			continue;
> 
> Good idea, but it should be this:
> 
>                /* Weed out duplicate pixelformats with different mbus codes */
>                if (!f->mbus_code && i &&
>                    formats[i - 1].pixelformat == formats[i].pixelformat)
>                        continue;

I think you shouldn't add !f->mbus_code check here, there's already a check
for that right after the for ... line.

> 
> And the duplicate pixelformats in the formats array must be together in the
> array for this to work. Easy enough to change.

The pixelformats in formats array would need to be sorted for this -- right
now they're not (16- vs. 8-bit YUV formats at the end of the table). So I
think this should be:

		if (f->mbus_code && formats[i].code != f->mbus_code)
			continue;

		/* Weed up duplicate pixelformats. */
		if (i && formats[i - 1].pixelformat == formats[i].pixelformat)
			continue;

-- 
Kind regards,

Sakari Ailus

