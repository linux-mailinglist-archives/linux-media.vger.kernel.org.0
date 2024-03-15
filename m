Return-Path: <linux-media+bounces-7143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 592F987D083
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:43:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F55BB22382
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 15:43:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33F73E498;
	Fri, 15 Mar 2024 15:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fUxxKNiC"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A194A3E48E
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710517396; cv=none; b=Fk7kcXFKTALOO69KHckzTN0bJxttWFcML2ngKUmGGQazkgMj3abn2phTzrtE+JxXFCxkwSHTjiMStbZYgE3WYfKufgPk66P9/s8y3kKsQGo+N8XewmWyOu0AAGhJamFynPZk11e00T+OGXO3YzaMeVq1esg7DCQS9Pmsc1NfUUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710517396; c=relaxed/simple;
	bh=t2jooOyr7+CVAifsde5otIbYz2MYjENNCqshALL4zQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rtOnH87pIQeYGg59Fp1HGCMnDc8Pd1C9XvucAgAd7oCjcftLc6oDrPDQCG41gbQ+4YiHF4yfrFwAEBEIr43+vZiFW5pg/y8crItNM/hVZd2GrmkFGZQE3lb40BD7BWvkyvOAZkJCiSNaJJKGPMD9HGEvbbQK3/VndE8PTiLBRsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fUxxKNiC; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710517393;
	bh=t2jooOyr7+CVAifsde5otIbYz2MYjENNCqshALL4zQk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fUxxKNiCrkZR2p6GqeHTiDTWk9yrkev6YePhAoMvtxncOQYIYMSS4bVrxwNqVv64O
	 h6lcDF44lwPUGRLqgDsdlh90g2jrnEoQ1GOpHdRmvyqwT7G+MFXvWQqFaNnJx8ht6S
	 DS6WhTTXvl7is6c45TwFC3amW3axO+iSzRVuj7pN4cASFW36e1nRKw6QuR9GlhbU9N
	 0+fdIokYDGklCkYpy+CD0mRvLTalbbIjRr4gJYZpr5x9SR6LBYFT3CpCG/6KkEldTQ
	 kp+tBcFgq+u4Dz5V+l6ZRqYqAOzgexKn3cz0sF+13nnI0+ZQusSzgIdoOUyXDGcigi
	 eIxC2E47j188g==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8E85A37804B2;
	Fri, 15 Mar 2024 15:43:12 +0000 (UTC)
Message-ID: <60b7dc81-14f3-483b-9d72-bf8ae3300772@collabora.com>
Date: Fri, 15 Mar 2024 16:43:12 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 12/38] media: v4l: subdev: Move G_ROUTING handling
 below S_ROUTING
Content-Language: en-US
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
 hongju.wang@intel.com, hverkuil@xs4all.nl,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Dmitry Perchanov <dmitry.perchanov@intel.com>,
 "Ng, Khai Wen" <khai.wen.ng@intel.com>,
 Alain Volmat <alain.volmat@foss.st.com>
References: <20240313072516.241106-1-sakari.ailus@linux.intel.com>
 <20240313072516.241106-13-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-13-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:24, Sakari Ailus wrote:
> Move G_ROUTING IOCTL handling below that of S_ROUTING. G_ROUTING
> implementation will soon needed in handling S_ROUTING as well.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>   drivers/media/v4l2-core/v4l2-subdev.c | 54 +++++++++++++--------------
>   1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 6c34df19ea2f..ec8de3f872b9 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -909,33 +909,6 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>   	case VIDIOC_SUBDEV_QUERYSTD:
>   		return v4l2_subdev_call(sd, video, querystd, arg);
>   
> -	case VIDIOC_SUBDEV_G_ROUTING: {
> -		struct v4l2_subdev_routing *routing = arg;
> -		struct v4l2_subdev_krouting *krouting;
> -
> -		if (!v4l2_subdev_enable_streams_api)
> -			return -ENOIOCTLCMD;
> -
> -		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
> -			return -ENOIOCTLCMD;
> -
> -		memset(routing->reserved, 0, sizeof(routing->reserved));
> -
> -		krouting = &state->routing;
> -
> -		if (routing->num_routes < krouting->num_routes) {
> -			routing->num_routes = krouting->num_routes;
> -			return -ENOSPC;
> -		}
> -
> -		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> -		       krouting->routes,
> -		       krouting->num_routes * sizeof(*krouting->routes));
> -		routing->num_routes = krouting->num_routes;
> -
> -		return 0;
> -	}
> -
>   	case VIDIOC_SUBDEV_S_ROUTING: {
>   		struct v4l2_subdev_routing *routing = arg;
>   		struct v4l2_subdev_route *routes =
> @@ -984,6 +957,33 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>   					routing->which, &krouting);
>   	}
>   
> +	case VIDIOC_SUBDEV_G_ROUTING: {
> +		struct v4l2_subdev_routing *routing = arg;
> +		struct v4l2_subdev_krouting *krouting;
> +
> +		if (!v4l2_subdev_enable_streams_api)
> +			return -ENOIOCTLCMD;
> +
> +		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
> +			return -ENOIOCTLCMD;
> +
> +		memset(routing->reserved, 0, sizeof(routing->reserved));
> +
> +		krouting = &state->routing;
> +
> +		if (routing->num_routes < krouting->num_routes) {
> +			routing->num_routes = krouting->num_routes;
> +			return -ENOSPC;
> +		}
> +
> +		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> +		       krouting->routes,
> +		       krouting->num_routes * sizeof(*krouting->routes));
> +		routing->num_routes = krouting->num_routes;
> +
> +		return 0;
> +	}
> +
>   	case VIDIOC_SUBDEV_G_CLIENT_CAP: {
>   		struct v4l2_subdev_client_capability *client_cap = arg;
>   

-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

