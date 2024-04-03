Return-Path: <linux-media+bounces-8488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F1A896900
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 10:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1B1E283BB1
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 08:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F086E2A3;
	Wed,  3 Apr 2024 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bajV4bdr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B279E6773B
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712133716; cv=none; b=chY2msRgiiJ+T+1FFXYnjERFb3Fzd1xCjAcvE09QvtOsVcZB/7a4vA8dKoIIDFL7baYklMSMaSG0H5fEV7BKc7IAj6ySghgfUzjFlcW79pfQv+PKThMKD/glqVQmjDpy331a+eizfI+IV/saOZ/fYruq1us8nChz4FIVoZb4tlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712133716; c=relaxed/simple;
	bh=XT8BT6DOBwQonmmcfb60+iC1uPzh29ipbulpu7KCmrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJn2ZXm7Z1xdHwyP5/kT3fsiG5q2rCydVJzSMMbFKXRamhBw1Tip/x0WyTKRFdphfhTXkgyWckq3uhEPJ4+EkxV66ygLn0icpuFvjAQ0qFKetYqWpeOEkjylp7AuvkoQY4QEdAmeESzddv/JQXChIuvk3zveI538UJZIqAuDDPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bajV4bdr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48F65674;
	Wed,  3 Apr 2024 10:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712133676;
	bh=XT8BT6DOBwQonmmcfb60+iC1uPzh29ipbulpu7KCmrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bajV4bdr3ZHrMV09JFGJg/7NtvUn3f054+F3iH9pdRyBeQmsbltz/txNlA8puhQRD
	 vvv7nZYjU/7CdnbxdCoJw0mj1hTs1o8aly2PtBJfMMbMEu0mjF+bgiKFDOOONZTAi1
	 icTQvIPEZR8HkisSlPxQvUjjTSvQrZg1zqGKAZbk=
Date: Wed, 3 Apr 2024 11:41:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v4l-utils 1/2] v4l2-compliance: Fix use of routing on
 32-bit platforms
Message-ID: <20240403084142.GO16740@pendragon.ideasonboard.com>
References: <20240403-v4l2-compliance-streams-fixes-v1-0-a1c383cc2139@ideasonboard.com>
 <20240403-v4l2-compliance-streams-fixes-v1-1-a1c383cc2139@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240403-v4l2-compliance-streams-fixes-v1-1-a1c383cc2139@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Wed, Apr 03, 2024 at 11:16:28AM +0300, Tomi Valkeinen wrote:
> At the moment we do:
> 
> routing.routes = (__u64)&routes;
> 
> On 32-bit platforms the 32-bit address will be sign-extended, possibly
> resulting setting the address to, e.g., 0xff000000 -> 0xffffffffff000000.
> 
> Fix this by first converting the address to uintptr_t.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  utils/v4l2-compliance/v4l2-compliance.cpp   | 4 ++--
>  utils/v4l2-compliance/v4l2-test-subdevs.cpp | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index 2cf97909..82615c17 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -1274,7 +1274,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
>  
>  				sd_routing[which].which = which;
> -				sd_routing[which].routes = (__u64)sd_routes[which];
> +				sd_routing[which].routes = (__u64)(uintptr_t)sd_routes[which];
>  				sd_routing[which].num_routes = NUM_ROUTES_MAX;
>  
>  				ret = doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &sd_routing[which]);
> @@ -1305,7 +1305,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  					routes = sd_routes[which];
>  				} else {
>  					dummy_routing.num_routes = 1;
> -					dummy_routing.routes = (__u64)&dummy_routes;
> +					dummy_routing.routes = (__u64)(uintptr_t)&dummy_routes;
>  					dummy_routes[0].source_pad = pad;
>  					dummy_routes[0].source_stream = 0;
>  					dummy_routes[0].sink_pad = pad;
> diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> index ebca1b94..fe7a9e1d 100644
> --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> @@ -586,7 +586,7 @@ int testSubDevRouting(struct node *node, unsigned which)
>  	int ret;
>  
>  	routing.which = which;
> -	routing.routes = (__u64)&routes;
> +	routing.routes = (__u64)(uintptr_t)&routes;
>  	routing.num_routes = 0;
>  	memset(routing.reserved, 0xff, sizeof(routing.reserved));
>  
> 

-- 
Regards,

Laurent Pinchart

