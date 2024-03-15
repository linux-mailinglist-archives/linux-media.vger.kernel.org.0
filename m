Return-Path: <linux-media+bounces-7151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 095AA87D0EC
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 17:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B479D1F215A7
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 16:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0046344C64;
	Fri, 15 Mar 2024 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SYiWulS7"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605E03A1B5
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710518918; cv=none; b=aUDbptNpB3Zswgi/5bqx4mT5UlwnWLDVX/bW6TvqzP5HcyQ/Ln409wuvBbPJsERc74WRdvEGrhtGRjJxO7PIbJIeANK8cmZ+Bl4rZ2CzpIWIpQjPNqafH1kKOOxVCp6QL3EnAsZ32FHdS8iYK87oQ6fK/8L5vX1JQfa5lF0EUIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710518918; c=relaxed/simple;
	bh=cMmEMwEqyHGkOHVt+KM/M7MyVNKa4wqycUA1abNvnQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HpfxkllcZ8Zd3KtSN8swJcB5Ndh+0OVFLXThadBmeZFQ+BDRuVLZHxCZSDJA1cOr/rOdPpJTw3zh6di582ak+io1UnvWq6cYAKFvKxJslBs8FY9GhIKriexso2gor7JBoOL/8svON8eME2Ne54J43Jn9FHbvPR3gmvKyyyIJJOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SYiWulS7; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710518913;
	bh=cMmEMwEqyHGkOHVt+KM/M7MyVNKa4wqycUA1abNvnQE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SYiWulS71mIe6VNKYTxEhbYdm6wqvm4nrmsvgSq1WiL6O+Ofa7KnbGK2ht4SkC5GG
	 Sm2ILIFrT8T6PFdQb32HpNF3UuvKvxP/5Dsfwxcoc6QVCFlwWiG4n4n1Kf4TLdrftW
	 3ORxLngBwrbo7nTwsm4W/V/7wYFCNYtf+wDHDuEPgCjsSElvgC7iYY5x+EDtt7NKrp
	 CS7oXlulAtukFfRybfE9FNU3VCzGaPJfsJuOmIZfXQYcpsDrS+2ZHdh7Gs/+y6cGWZ
	 7UHrsJlJYpjSgJXW3YYm2hzCoBj9OTGf9JJZm8N6816uxlhwBLJJdEVRNU0eOw1xAg
	 gG3J67o+V1xEA==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D69303782110;
	Fri, 15 Mar 2024 16:08:32 +0000 (UTC)
Message-ID: <501a1429-b437-461f-a7a3-1701ce06e2d9@collabora.com>
Date: Fri, 15 Mar 2024 17:08:31 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 37/38] media: ccs: Add IMMUTABLE route flag
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
 <20240313072516.241106-38-sakari.ailus@linux.intel.com>
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <20240313072516.241106-38-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/13/24 08:25, Sakari Ailus wrote:
> Add immutable route flag to the routing table.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Julien Massot <julien.massot@collabora.com>
> ---
>   drivers/media/i2c/ccs/ccs-core.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 838daab212f2..5205d1ecf8f2 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -3368,12 +3368,14 @@ static int ccs_src_init_state(struct v4l2_subdev *sd,
>   			.sink_pad = CCS_PAD_SINK,
>   			.source_pad = CCS_PAD_SRC,
>   			.source_stream = CCS_STREAM_PIXEL,
> -			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
>   		}, {
>   			.sink_pad = CCS_PAD_META,
>   			.source_pad = CCS_PAD_SRC,
>   			.source_stream = CCS_STREAM_META,
> -			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE,
>   		}
>   	};
>   	struct v4l2_subdev_krouting routing = {

-- 
Julien Massot
Senior Software Engineer
Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

