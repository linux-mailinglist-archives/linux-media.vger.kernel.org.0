Return-Path: <linux-media+bounces-10065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 985578B0F17
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 17:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55A0B29580C
	for <lists+linux-media@lfdr.de>; Wed, 24 Apr 2024 15:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42451607A1;
	Wed, 24 Apr 2024 15:50:59 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB4715B158
	for <linux-media@vger.kernel.org>; Wed, 24 Apr 2024 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713973859; cv=none; b=V2dSiiyxjGYDAXiY0jf6SsnrB2XjjgnNHn/0iW8EariaszRK2Gfu4sY2Bc+IJAO8iZEzyPkw5WOX7oRH1qutVec69w/goRVq5w9ojYiDwSkfDP7oXGBsfUSmq6acLvZ4SRePulfLTxuIIL90/tJ+PBteHiOiGo8c0ArYpZDu1UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713973859; c=relaxed/simple;
	bh=qbuiggFUX6oQQz6A9gNV7rImSwX4q9H51xahwCsTrvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXSPHRj8J6qbO1JsmADMMNX2mZjML3l2cE0sABWMENI0SBJ7JmSdRFueiYleQy/NEV1wrf3hKtv6wCJLrHkJcNtjaa+e9TtLRi720dJT6iKlbD1EsZB0okFdlltENkvGBPI7LeWMfnLj2EWsNN/5gKgNuMPcU0ewVI0Jka/4sgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA8F3C113CD;
	Wed, 24 Apr 2024 15:50:57 +0000 (UTC)
Message-ID: <42abcacf-a160-4aed-8474-84f89c85f166@xs4all.nl>
Date: Wed, 24 Apr 2024 17:50:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4l-utils] [PATCH v2 3/7] v4l2-compliance: Support the changed
 routing API
Content-Language: en-US, nl
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Gregor Jasny <gjasny@googlemail.com>
References: <20240424152230.31923-1-laurent.pinchart@ideasonboard.com>
 <20240424152230.31923-4-laurent.pinchart@ideasonboard.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240424152230.31923-4-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2024 17:22, Laurent Pinchart wrote:
> Set len_routes of struct v4l2_subdev_routing. ENOSPC error code is no
> longer used, i.e. having room for fewer routes than exist in the
> configuration is not considered an error anymore.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  utils/v4l2-compliance/v4l2-compliance.cpp   | 12 +++++++-----
>  utils/v4l2-compliance/v4l2-test-subdevs.cpp | 19 +++++++++++--------
>  2 files changed, 18 insertions(+), 13 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index fd7e7d76e214..144f961842c6 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -1272,15 +1272,17 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  
>  			for (unsigned which = V4L2_SUBDEV_FORMAT_TRY;
>  				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
> +				struct v4l2_subdev_routing &routing = sd_routing[which];
>  
> -				sd_routing[which].which = which;
> -				sd_routing[which].routes = (uintptr_t)sd_routes[which];
> -				sd_routing[which].num_routes = NUM_ROUTES_MAX;
> +				routing.which = which;
> +				routing.routes = (uintptr_t)sd_routes[which];
> +				routing.len_routes = NUM_ROUTES_MAX;
> +				routing.num_routes = 0;
>  
> -				ret = doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &sd_routing[which]);
> +				ret = doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &routing);
>  				if (ret) {
>  					fail("VIDIOC_SUBDEV_G_ROUTING: failed to get routing\n");
> -					sd_routing[which].num_routes = 0;
> +					routing.num_routes = 0;
>  				}
>  			}
>  		}
> diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> index da304a8caa8a..41eaf77112f0 100644
> --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> @@ -587,17 +587,15 @@ int testSubDevRouting(struct node *node, unsigned which)
>  
>  	routing.which = which;
>  	routing.routes = (uintptr_t)&routes;
> +	routing.len_routes = 0;
>  	routing.num_routes = 0;
>  	memset(routing.reserved, 0xff, sizeof(routing.reserved));
>  
> -	/*
> -	 * First test that G_ROUTING either returns success, or ENOSPC and
> -	 * updates num_routes.
> -	 */
> +	/* First test that G_ROUTING returns success even when len_routes is 0. */
>  
>  	ret = doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing);
> -	fail_on_test(ret && ret != ENOSPC);
> -	fail_on_test(ret == ENOSPC && routing.num_routes == 0);
> +	fail_on_test(ret);
> +	fail_on_test(routing.num_routes > NUM_ROUTES_MAX);
>  	fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));
>  
>  	if (!routing.num_routes)
> @@ -609,7 +607,8 @@ int testSubDevRouting(struct node *node, unsigned which)
>  	 */
>  
>  	uint32_t num_routes = routing.num_routes;
> -	routing.num_routes = num_routes + 1;
> +	routing.len_routes = NUM_ROUTES_MAX;
> +	routing.num_routes = 0;
>  	fail_on_test(doioctl(node, VIDIOC_SUBDEV_G_ROUTING, &routing));
>  	fail_on_test(routing.num_routes != num_routes);
>  
> @@ -633,10 +632,14 @@ int testSubDevRouting(struct node *node, unsigned which)
>  		}
>  	}
>  
> -	/* Set the same routes back, which should always succeed. */
> +	/*
> +	 * Set the same routes back, which should always succeed and report the
> +	 * same number of routes.
> +	 */
>  
>  	memset(routing.reserved, 0xff, sizeof(routing.reserved));
>  	fail_on_test(doioctl(node, VIDIOC_SUBDEV_S_ROUTING, &routing));
> +	fail_on_test(routing.num_routes != num_routes);
>  	fail_on_test(check_0(routing.reserved, sizeof(routing.reserved)));

I think this needs another test: if S_ROUTING is called with num_routes > len_routes,
then EINVAL must be returned. This is an important test to make sure the core handles
this correctly and won't be using more than len_routes routes.

Regards,

	Hans

>  
>  	/* Test setting invalid pads */


