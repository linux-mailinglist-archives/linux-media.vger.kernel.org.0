Return-Path: <linux-media+bounces-8519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B909D896C78
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 12:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A19C1F2BFD6
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 10:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E7FB137C2F;
	Wed,  3 Apr 2024 10:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="iG1eJ/nl"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A051136E22
	for <linux-media@vger.kernel.org>; Wed,  3 Apr 2024 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712140159; cv=none; b=eBq1Y//2aTHiAva8gAwVMF4bnJ65Lv2HSdPmTU7ggzkVcENMOkIWb4+LdY+SyXKyzgwykPHSiudj2f3nTI+nQrEKkvOjf8o5Qi1lxtLGtUoOU06EUVzkzrx1kTNPm3/dIae2pAi+8CBBbHX6ekoVZSimDD3Yl4QWlTE6KKYDTCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712140159; c=relaxed/simple;
	bh=EGa+RHjce/Ma7n+GtRWY4isDTsZWxGOv87Whs9ptxwo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dlBc1+1Ws/A01vig+4CX+lKSgLZSQ9qb9C3hkF+ZBVFRft+1KKhefXjKYLt1w1AR20UEGUENO8zSe5jEtLIiK4l4F35WuaotFesBrizKbZ5MFM4ZrLzoGg0Z38AJ+l1NovdPRNaXlQJy+g5jfX5bgLBB77GQPUobTc4v73dRbPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=iG1eJ/nl; arc=none smtp.client-ip=195.121.94.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: e0cfbce8-f1a4-11ee-b64f-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id e0cfbce8-f1a4-11ee-b64f-005056994fde;
	Wed, 03 Apr 2024 12:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=CTgC2D4oJxykarb+KMuLjGMo6vUx9vcIZdq5q3EjP2I=;
	b=iG1eJ/nlwoYPMxr7mEDFvCCLXZ8Inpb78n18gwgGRDY9qgKm2Cx8hEleC8cIGXAlezUBqHEnsl8RT
	 mHNsUo+y2/gYlhB5rxVerp/3geIvyIieoBiRN1hOISA9oADZ6ffVp+l1S67krLPE31ZRIzXgF9XcTp
	 DWhxTUq+0Wwr1fmupVpmAuil8Fc2ED0RGxo7t3XYI3uXyZDhOpJGxEFyFj6Lex+u9f9eXf+of7vlCC
	 6KAkus6rMTs6MkStnWdjajQbihpWAV90rBtcjmzQMD4nA5EWrsxbB7OQ/X/FHR3Un7RUQbuL81fidV
	 Ks82EimRPb4tEDP7BX3935QPIFfQXUQ==
X-KPN-MID: 33|mYITw+fUi2nZIyO+gf/1PwZWvvg3LNLvON9SZQYPrmhA5pU5OW6OaI6ZZQ+H0hn
 J6Vy/GDP8fNxQ00o44DILg2AMf8meszDSTz5eORGSpS8=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|UkEdq+STyDQqnFlTPumMpIb5Ew0XAHr5RvLxT3kIOmALucX+Grxq6ntN61QEWa1
 H32stPj0nwGEIwsVLB5eHmA==
Received: from [10.47.75.249] (unknown [173.38.220.36])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id cc802395-f1a4-11ee-9b37-005056998788;
	Wed, 03 Apr 2024 12:28:06 +0200 (CEST)
Message-ID: <4752414a-dc7d-41f9-a92f-a7a2a20f91e9@xs4all.nl>
Date: Wed, 3 Apr 2024 12:27:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4l-utils v2 1/2] v4l2-compliance: Fix use of routing on
 32-bit platforms
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20240403-v4l2-compliance-streams-fixes-v2-0-be9b338dc204@ideasonboard.com>
 <20240403-v4l2-compliance-streams-fixes-v2-1-be9b338dc204@ideasonboard.com>
Content-Language: en-US
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240403-v4l2-compliance-streams-fixes-v2-1-be9b338dc204@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 12:15, Tomi Valkeinen wrote:
> At the moment we do:
> 
> routing.routes = (__u64)&routes;
> 
> On 32-bit platforms the 32-bit address will be sign-extended, possibly
> resulting setting the address to, e.g., 0xff000000 -> 0xffffffffff000000.
> 
> Fix this by converting the address to uintptr_t.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  utils/v4l2-compliance/v4l2-compliance.cpp   | 4 ++--
>  utils/v4l2-compliance/v4l2-test-subdevs.cpp | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compliance/v4l2-compliance.cpp
> index 2cf97909..fd7e7d76 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -1274,7 +1274,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  				which <= V4L2_SUBDEV_FORMAT_ACTIVE; which++) {
>  
>  				sd_routing[which].which = which;
> -				sd_routing[which].routes = (__u64)sd_routes[which];
> +				sd_routing[which].routes = (uintptr_t)sd_routes[which];
>  				sd_routing[which].num_routes = NUM_ROUTES_MAX;
>  
>  				ret = doioctl(&node, VIDIOC_SUBDEV_G_ROUTING, &sd_routing[which]);
> @@ -1305,7 +1305,7 @@ void testNode(struct node &node, struct node &node_m2m_cap, struct node &expbuf_
>  					routes = sd_routes[which];
>  				} else {
>  					dummy_routing.num_routes = 1;
> -					dummy_routing.routes = (__u64)&dummy_routes;
> +					dummy_routing.routes = (uintptr_t)&dummy_routes;
>  					dummy_routes[0].source_pad = pad;
>  					dummy_routes[0].source_stream = 0;
>  					dummy_routes[0].sink_pad = pad;
> diff --git a/utils/v4l2-compliance/v4l2-test-subdevs.cpp b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> index ebca1b94..560efb70 100644
> --- a/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> +++ b/utils/v4l2-compliance/v4l2-test-subdevs.cpp
> @@ -586,7 +586,7 @@ int testSubDevRouting(struct node *node, unsigned which)
>  	int ret;
>  
>  	routing.which = which;
> -	routing.routes = (__u64)&routes;
> +	routing.routes = (uintptr_t)&routes;
>  	routing.num_routes = 0;
>  	memset(routing.reserved, 0xff, sizeof(routing.reserved));
>  
> 


