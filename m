Return-Path: <linux-media+bounces-3806-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A13D8306F5
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 14:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9096288235
	for <lists+linux-media@lfdr.de>; Wed, 17 Jan 2024 13:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE08D1EB4B;
	Wed, 17 Jan 2024 13:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WfBKCdNW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F72F1EB24
	for <linux-media@vger.kernel.org>; Wed, 17 Jan 2024 13:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705497710; cv=none; b=fYhjFuHx9gKYievwasIU1D/9j1XqM376FWa/2EO0r8gGLlEAc06P0uIy/6yp6UzS36wty7wdJyylb+tN4/0xtNG5WWsiNST0iJZFvGopdCbcB81C3zVjMRBLedxikJOvrEc8gGwetiuVhPZWdtExpOt/XpsWvxA2BuDrt0yxjqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705497710; c=relaxed/simple;
	bh=GMSxQK7UyWaaS92pDkqH6fuWg9z5KtF5ZBP0ZNZNQu8=;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=eYiR+6sOpP+fPvuy0VDmsuk0wtGuN/VNfyWAi6HCymiTVa+QqFDA7r6n+qzM4epK/ayROCvtxmGaJQaT0y+YNE6BCAVT0bAX2LDkVBPo/yb8cCmB6KRMuPt7lpIcgagJBajHV/RZtxtVW2lSNDH7RSawvT/I+/ONJUefytUhyy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WfBKCdNW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D8917E2;
	Wed, 17 Jan 2024 14:20:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1705497637;
	bh=GMSxQK7UyWaaS92pDkqH6fuWg9z5KtF5ZBP0ZNZNQu8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WfBKCdNWoobdKZH0vzyqD273NiML2WYq6l3LAvFtqG++UdeOcSSRRmXGBjvGe8zBD
	 I/9g3695gd/lcP7uiHe2/H3UwxvpVR0w8fBmqasKKN5RqEUleo9CB04c1R/dVSngxh
	 H3o9rRMn2KBHAsUIK2EbQ16MecgHkEgxn3HH3ozg=
Date: Wed, 17 Jan 2024 15:21:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH 1/2] v4l2-ctl: Add --try-routing option
Message-ID: <20240117132150.GF4860@pendragon.ideasonboard.com>
References: <20240117130805.939312-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240117130805.939312-1-dan.scally@ideasonboard.com>

Hi Dan,

Thank you for the patch.

On Wed, Jan 17, 2024 at 01:08:04PM +0000, Daniel Scally wrote:
> v4l2-ctl's --list-subdev-mbus-codes option sets the which flag to
> V4L2_SUBDEV_FORMAT_TRY, which is an entirely reasonable choice, but
> means it's currently impossible to list mbus codes for pads that are
> only part of inactive routes as the --set-routing option sets ACTIVE
> routing rather than TRY.
> 
> Add a --try-routing option that has identical functionality to the
> existing --set-routing but which uses the TRY format instead.

I don't think this will help fixing your problem. They TRY context is
local to the file handle, v4l2-ctl will never seen the TRY routes you
set here.

> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 11 +++++++----
>  utils/v4l2-ctl/v4l2-ctl.cpp        |  1 +
>  utils/v4l2-ctl/v4l2-ctl.h          |  1 +
>  3 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> index 86e6c689..48b79288 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> @@ -96,7 +96,8 @@ void subdev_usage()
>  	       "  --set-subdev-fps pad=<pad>,stream=<stream>,fps=<fps> (for testing only, otherwise use media-ctl)\n"
>  	       "                     set the frame rate [VIDIOC_SUBDEV_S_FRAME_INTERVAL]\n"
>  	       "  --get-routing      Print the route topology\n"
> -	       "  --set-routing <routes>\n"
> +	       "  --set-routing      (for testing only, otherwise use media-ctl)\n"
> +	       "  --try-routing <routes>\n"
>  	       "                     Comma-separated list of route descriptors to setup\n"
>  	       "\n"
>  	       "Routes are defined as\n"
> @@ -458,14 +459,16 @@ void subdev_cmd(int ch, char *optarg)
>  			}
>  		}
>  		break;
> -	case OptSetRouting: {
> +	case OptSetRouting:
> +	case OptTryRouting: {
>  		struct v4l2_subdev_route *r;
>  		char *end, *ref, *tok;
>  		unsigned int flags;
>  
>  		memset(&routing, 0, sizeof(routing));
>  		memset(routes, 0, sizeof(routes[0]) * NUM_ROUTES_MAX);
> -		routing.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +		routing.which = ch == OptSetRouting ? V4L2_SUBDEV_FORMAT_ACTIVE :
> +				      V4L2_SUBDEV_FORMAT_TRY;
>  		routing.num_routes = 0;
>  		routing.routes = (__u64)routes;
>  
> @@ -683,7 +686,7 @@ void subdev_set(cv4l_fd &_fd)
>  					fival.interval.denominator, fival.interval.numerator);
>  		}
>  	}
> -	if (options[OptSetRouting]) {
> +	if (options[OptSetRouting] || options[OptTryRouting]) {
>  		if (!_fd.has_streams()) {
>  			printf("Streams API not supported.\n");
>  			return;
> diff --git a/utils/v4l2-ctl/v4l2-ctl.cpp b/utils/v4l2-ctl/v4l2-ctl.cpp
> index e195ad8e..f9121284 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl.cpp
> @@ -65,6 +65,7 @@ static struct option long_options[] = {
>  	{"set-fmt-video-out", required_argument, nullptr, OptSetVideoOutFormat},
>  	{"try-fmt-video-out", required_argument, nullptr, OptTryVideoOutFormat},
>  	{"get-routing", no_argument, 0, OptGetRouting},
> +	{"try-routing", required_argument, 0, OptTryRouting},
>  	{"set-routing", required_argument, 0, OptSetRouting},
>  	{"help", no_argument, nullptr, OptHelp},
>  	{"help-tuner", no_argument, nullptr, OptHelpTuner},
> diff --git a/utils/v4l2-ctl/v4l2-ctl.h b/utils/v4l2-ctl/v4l2-ctl.h
> index cc7f1184..6382619c 100644
> --- a/utils/v4l2-ctl/v4l2-ctl.h
> +++ b/utils/v4l2-ctl/v4l2-ctl.h
> @@ -193,6 +193,7 @@ enum Option {
>  	OptShowEdid,
>  	OptFixEdidChecksums,
>  	OptGetRouting,
> +	OptTryRouting,
>  	OptSetRouting,
>  	OptFreqSeek,
>  	OptEncoderCmd,

-- 
Regards,

Laurent Pinchart

