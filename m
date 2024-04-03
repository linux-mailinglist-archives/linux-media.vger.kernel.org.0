Return-Path: <linux-media+bounces-8494-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BE78969BF
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 11:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA3EC1C24E57
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 09:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B606E6EB70;
	Wed,  3 Apr 2024 09:00:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9CA6EB41
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 09:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712134806; cv=none; b=Rj21tEVXW/NufzdDZ8R51cG4QZLGr+V7yKE56PgTSzya7jUuO+C+U/X/PzWYK0B+4zVw/u12RUzlLHyP/UGRx9Dv/kFjQGx85+PNGLhXBTft/IPBIermqh2W1lu1UxnuWZMcK8HECilGW47CKtyMh8utZ4W7UwV3zSEh8OgcjI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712134806; c=relaxed/simple;
	bh=bIZzl0jwGbjGxbGCSx8MDuJUBmSWnE1mKrClBP9Vf+o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uh0Dx56QSHywDyK9S2v6v/biTUpgYdxRJZu9VTm78j7uleyt4bcEJhH2V8H9bLHXEIOo3N7HQHhCISwTj9xJH+BPgDFDCK/DPU4jXoveXBjntzn1eN1TOyfSjlZnxy4+D+BQGznSgMroblNp33RZkd08vKB3Kp8JNc7Kv1VZkZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01D5C433F1;
	Wed,  3 Apr 2024 09:00:04 +0000 (UTC)
Message-ID: <d07139e6-dddc-4e52-a16f-1183415b52d7@xs4all.nl>
Date: Wed, 3 Apr 2024 11:00:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4l-utils 1/2] v4l2-compliance: Fix use of routing on
 32-bit platforms
Content-Language: en-US, nl
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20240403-v4l2-compliance-streams-fixes-v1-0-a1c383cc2139@ideasonboard.com>
 <20240403-v4l2-compliance-streams-fixes-v1-1-a1c383cc2139@ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240403-v4l2-compliance-streams-fixes-v1-1-a1c383cc2139@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/04/2024 10:16, Tomi Valkeinen wrote:
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

You can drop the (__u64) cast. Same for the places below. The cast to uintptr_t
is sufficient and indeed required.

Regards,

	Hans

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


