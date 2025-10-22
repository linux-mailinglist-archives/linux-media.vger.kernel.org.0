Return-Path: <linux-media+bounces-45206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB5BBFAB59
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 270CB188E906
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C20D2F363F;
	Wed, 22 Oct 2025 07:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQzVfyft"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11B82FD7C8
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 07:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119785; cv=none; b=r/LTP1NMqb8DgRCSnV9uNi5BFT5Hq9qqe/TOevBPqakKO3GGhVkvmkior+6knIkzEbp78mH4+uPA2zoDctew//hfmhJBvcmZXtI1Bl2nlcUatOq0fFg2GkdS0wPAA/GFevP8I5oaolAmU3tYFuV7ojfGMK1lB4Pae2/tqPmoCm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119785; c=relaxed/simple;
	bh=xSTlxrhqm5wUBZJ7I9edPMfjufbJvQBibvzjxOdv8lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LRMMGfJjH84MkXe7XkKLGsuUP4FCO8YADUKYEd0wOkZ2081lAMGTwQF9KJ3Ser73S9q3+CqSeCcPCBbh4Czz8R4Yau0SWAp681373Wv9Ch5e/oF0xnfdJNXFTacu8laBJiQFccIxoDYLKom8922osBjjE9pDlHKJV+4PkhtvNzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQzVfyft; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761119784; x=1792655784;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xSTlxrhqm5wUBZJ7I9edPMfjufbJvQBibvzjxOdv8lM=;
  b=cQzVfyft4XzUYmTRuJpiuOTmHt2pK6m78S+RiBlAIJy/X/+VkMOJzhje
   8VZJpvdUCWyXaX8IAYkuTPsEk7sTKt7lcHCVkw9fYv3u/0RZ95Gn4yUkx
   733A11JGzihxhd08JC7wMW5bYMpkx3aUHdhvKQ95qyjPH/d2brq3lku5g
   1XHFozSl/05zKj1XKOuMFwP67Z2mh+YJx8khoASkeT9iA89JN7g7uq0KA
   67eQI/A1kDaCcBKxbuKCSV87LGMRhjAvCgM8xGyPj15kgtFlBGFtDDmeY
   OTbinpsbD9KTKLVFjZ6NwFMvXlzV9jxzHvk1yduCXQZRmW9o9x2r8DcQ3
   Q==;
X-CSE-ConnectionGUID: IvW5c2wkTrGBcvJydolNUA==
X-CSE-MsgGUID: yrwMhNzgT12SNBp25nQktQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73864709"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="73864709"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 00:56:22 -0700
X-CSE-ConnectionGUID: 8PGwMpO+S8u/zYFSH7qwiw==
X-CSE-MsgGUID: 5Ed97lmGTauyi12bl5cZfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="183694013"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.28])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 00:56:21 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4826711F87B;
	Wed, 22 Oct 2025 10:56:18 +0300 (EEST)
Date: Wed, 22 Oct 2025 10:56:18 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 04/14] media: omap3isp: implement enum_fmt_vid_cap/out
Message-ID: <aPiOIoe24l5NNz6z@kekkonen.localdomain>
References: <cover.1760707611.git.hverkuil+cisco@kernel.org>
 <30813a3e81f2d8a6f42f637eba6fba2481b535cf.1760707611.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30813a3e81f2d8a6f42f637eba6fba2481b535cf.1760707611.git.hverkuil+cisco@kernel.org>

Hi Hans,

On Fri, Oct 17, 2025 at 03:26:41PM +0200, Hans Verkuil wrote:
> Add missing ioctls. This makes v4l2-compliance happier:
> 
> fail: v4l2-test-formats.cpp(516): pixelformat 59565955 (UYVY) for buftype 1 not reported by ENUM_FMT
> 	test VIDIOC_G_FMT: FAIL
> fail: v4l2-test-formats.cpp(516): pixelformat 59565955 (UYVY) for buftype 1 not reported by ENUM_FMT
> 	test VIDIOC_TRY_FMT: FAIL
> fail: v4l2-test-formats.cpp(516): pixelformat 56595559 (YUYV) for buftype 1 not reported by ENUM_FMT
> 	test VIDIOC_S_FMT: FAIL
> 
> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> ---
>  drivers/media/platform/ti/omap3isp/ispvideo.c | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
> index 864d38140b87..77beea00d507 100644
> --- a/drivers/media/platform/ti/omap3isp/ispvideo.c
> +++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
> @@ -652,6 +652,38 @@ isp_video_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
>  	return 0;
>  }
>  
> +static int
> +isp_video_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
> +{
> +	struct isp_video *video = video_drvdata(file);
> +	unsigned int i, j;
> +	unsigned int skip_last_fmts = 1;
> +
> +	if (f->type != video->type)
> +		return -EINVAL;
> +
> +	/*
> +	 * The last two formats have the same pixelformat as the two
> +	 * formats before them, but they do have different mediabus
> +	 * codes. So to avoid reporting duplicate pixelformats we skip
> +	 * those two, provided f->mbus_code is 0.
> +	 */
> +	if (!f->mbus_code)
> +		skip_last_fmts += 2;
> +	for (i = 0, j = 0; i < ARRAY_SIZE(formats) - skip_last_fmts; i++) {
> +		if (f->mbus_code && formats[i].code != f->mbus_code)
> +			continue;

How about, instead of the skip_last_fmts thingy, using this:

		/* Weed out pixelformats with the same mbus code. */
		if (i && formats[i - 1].code == formats[i].code)
			continue;

> +
> +		if (j == f->index) {
> +			f->pixelformat = formats[i].pixelformat;
> +			return 0;
> +		}
> +		j++;
> +	}
> +
> +	return -EINVAL;
> +}
> +
>  static int
>  isp_video_get_format(struct file *file, void *fh, struct v4l2_format *format)
>  {
> @@ -1258,9 +1290,11 @@ isp_video_s_input(struct file *file, void *fh, unsigned int input)
>  
>  static const struct v4l2_ioctl_ops isp_video_ioctl_ops = {
>  	.vidioc_querycap		= isp_video_querycap,
> +	.vidioc_enum_fmt_vid_cap	= isp_video_enum_format,
>  	.vidioc_g_fmt_vid_cap		= isp_video_get_format,
>  	.vidioc_s_fmt_vid_cap		= isp_video_set_format,
>  	.vidioc_try_fmt_vid_cap		= isp_video_try_format,
> +	.vidioc_enum_fmt_vid_out	= isp_video_enum_format,
>  	.vidioc_g_fmt_vid_out		= isp_video_get_format,
>  	.vidioc_s_fmt_vid_out		= isp_video_set_format,
>  	.vidioc_try_fmt_vid_out		= isp_video_try_format,

-- 
Kind regards,

Sakari Ailus

