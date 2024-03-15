Return-Path: <linux-media+bounces-7155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 334D787D0FE
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 17:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E66C4B229F9
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD0945035;
	Fri, 15 Mar 2024 16:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="tPJcqng0"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C2D1773D
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710519262; cv=none; b=XAkJvIofUKHZ7vRqI3cWPuMtrW75gJ6aOIi7ls4yjQaIH5kVVp5kpYsVq9/6dRRKR5bXgG63SEEWUGkbUKS2k0tIn7rKIZOiPqhT8ZiMx6EliKEYkc+fIsdCVl2k2sStj1VTC0vf+qMrbknMz4bURAA4kzUNccQbV5T93lEv8tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710519262; c=relaxed/simple;
	bh=XObHnEu/mht1XTwD0IVMFbx7mAOQ4iDvRGSW6oH74pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eo1mJPyDwAIg6MPHPP4CGicqNeD+bzxoeztEi0/na7PHxalszLMRRhZ+zYR+HutpVgTXqsZMlkb00Dgf+5UpCuWsv6uMXelRrQkIPZRk9W1mwuso/PYIK491Ni9LRBuMeyEIp0JuzwOuZwW/UksHnUnZv059og5QjD/En8/KeOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=tPJcqng0; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710519257;
	bh=XObHnEu/mht1XTwD0IVMFbx7mAOQ4iDvRGSW6oH74pk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tPJcqng0CCGpiGo3+3uhXADH34xA3+BoqNE2XEj72xB8cPous3ZT8C23F5jylrh+Y
	 MhOh/dv8ck5fygcV3c4bNTL+mhCpqnALJuESkRIzETaVBmJEc9LgIXmAG6FrtKEqqc
	 g7gA/7vCCbX/qwz3Ns23ewkJai1i/TyY5/tHKE2OwZ2lgCsU4KmfIWpqgK4dO0iQwz
	 NNkNrskNbTbGD+QS3LPuL64LQZqq1FeV/37x685SCNcklb2MjLFtVlcgLmoXoLHiOU
	 cm7gnl1IHzFzOWdvdjpx4vlK6G7TJh0zk0wqICPlgoCh7GuDxj3qeVH+DXb/7In0yh
	 3Qb3QgRNzI4vw==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1F6253782110;
	Fri, 15 Mar 2024 16:14:17 +0000 (UTC)
Message-ID: <4590f828-ca02-4186-bb7d-9cb879f548f4@collabora.com>
Date: Fri, 15 Mar 2024 17:14:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 38/38] media: ov2740: Add IMMUTABLE route flag
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
 <20240313072516.241106-39-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-39-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:25, Sakari Ailus wrote:
> Add immutable route flag to the routing table.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>   drivers/media/i2c/ov2740.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 7488b2535071..3e2585eb6ec9 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -1150,12 +1150,14 @@ static int ov2740_init_state(struct v4l2_subdev *sd,
>   			.sink_pad = OV2740_PAD_PIXEL,
>   			.source_pad = OV2740_PAD_SOURCE,
>   			.source_stream = OV2740_STREAM_PIXEL,
> -			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
>   		}, {
>   			.sink_pad = OV2740_PAD_META,
>   			.source_pad = OV2740_PAD_SOURCE,
>   			.source_stream = OV2740_STREAM_META,
> -			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
>   		},
>   	};
>   	struct v4l2_subdev_krouting routing = {

-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

