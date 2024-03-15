Return-Path: <linux-media+bounces-7146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B34087D0B4
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9ABD7283609
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 15:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C1E405F2;
	Fri, 15 Mar 2024 15:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Sd4UgOBO"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957233F9FB
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710517911; cv=none; b=Hba/OeoFH7JSxscU8jJdo2UNEwo+voZx4c887E4tf/OiFrix90Lxqdc40ecvuJP44SdCb1JPgSBacVTYy9s2PyQfpMedDCEMlnHpjIm4csarHYLeTeraAPNaNynaSHe3BtpH6a0skG6uJF2EgsLazR7RrT+d9sUzp7pZv6+EPjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710517911; c=relaxed/simple;
	bh=1xUFS71KeqD+BbUYAxDDB9nbCgvWygyNGWKGsT3qbNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+rv3hH4bZ4LsJv1X+Z6uRD7CkUDzVeMC1Qp7wPzOD7FlXkHQu9akq8pYdobvC8S+ogFzq3M4BeSHWaE/lYoQlkPqlQhYZeleT4oPoCBYSqXGl4169ltfh9C0ZsE7z5Y6dJMltHIjmTHkaJT2n7IMTRV33/EBXeyH4IwGQPxlo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Sd4UgOBO; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710517908;
	bh=1xUFS71KeqD+BbUYAxDDB9nbCgvWygyNGWKGsT3qbNY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Sd4UgOBOBdYyONcpmDH4KeQrOae7FxfB/lxpwd78cXtdgXZmKSAYUeTb7FYTHhsGA
	 LLIfX+te1FZRhbfvIV0x0xR8obK6EJIofBNSoFjn+4UuNNY8yvmu9ODhLP+K+R9vFZ
	 gLVkJr0H4CD7fpPpGUTqBSb31dY/O0PhOxX5GJe+G23hYn3oj5Yvpj1hLVT/QSaPOZ
	 r1G7Xs6aYfxVaW5d7jUOWnc70gxyyBvQkEmHa8QQNLfKwVQIDed2i8PXvsYFch+Pjs
	 mlHtvIl9WjnZEUd7wK072gE6xh4R6GmTSySTdQi8dYP95Vmgd1Rhn0NZzY1N35+WVJ
	 SLKP0rWmdfLnA==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 499933782110;
	Fri, 15 Mar 2024 15:51:47 +0000 (UTC)
Message-ID: <029a8e56-97f5-4c07-b837-96bfb6e94a91@collabora.com>
Date: Fri, 15 Mar 2024 16:51:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/38] media: v4l: subdev: Add trivial set_routing
 support
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
 <20240313072516.241106-18-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-18-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:24, Sakari Ailus wrote:
> Add trivial S_ROUTING IOCTL support for drivers where routing is static.
> Essentially this means returning the same information G_ROUTING call would
> have done.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>   drivers/media/v4l2-core/v4l2-subdev.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index a6107e440ef0..c8c435df92c8 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -930,6 +930,20 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>   
>   		memset(routing->reserved, 0, sizeof(routing->reserved));
>   
> +		/*
> +		 * If the driver doesn't support setting routing, just return
> +		 * the routing table here.
> +		 */
> +		if (!v4l2_subdev_has_op(sd, pad, set_routing)) {
> +			memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> +			       state->routing.routes,
> +			       min(state->routing.num_routes, routing->len_routes) *
> +			       sizeof(*state->routing.routes));
> +			routing->num_routes = state->routing.num_routes;
> +
> +			return 0;
> +		}
> +
>   		for (i = 0; i < routing->num_routes; ++i) {
>   			const struct v4l2_subdev_route *route = &routes[i];
>   			const struct media_pad *pads = sd->entity.pads;

-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

