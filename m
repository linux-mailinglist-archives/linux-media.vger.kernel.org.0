Return-Path: <linux-media+bounces-23446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FB89F28DA
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 04:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AE9E7A1903
	for <lists+linux-media@lfdr.de>; Mon, 16 Dec 2024 03:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D340F160884;
	Mon, 16 Dec 2024 03:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="cJnh5S23"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-m49228.qiye.163.com (mail-m49228.qiye.163.com [45.254.49.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0665D219FC;
	Mon, 16 Dec 2024 03:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734320471; cv=none; b=Pk3B5fQo3Eg7yzJvmmHFuGlbYvway4M9ZHDton4O5+E5Y/v84AoFdK3LRSKgeHkbgMDfvvJqm5hMIjNbsmRZXvP9Xjr5dzO6V8weMdu/+hXb5WOQFM/VDIb97X8u/3Z46/XucRZprIUNBH7OP+0Zl5wgHoqrYySC+7qHMxaAXcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734320471; c=relaxed/simple;
	bh=XtYhUqtmEkSatUpBBz9kjyFyeUJyxa1tDVzLJKZAR0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M4+Bd8BMV22RvQbrthS82/b/GL8E0bpdZb95+DBuTl8T25vMAVXdScrsVDXTDYSikSz9bCmLqFk6GCJKLA5GbJJuCyq79o1GFZq88DF6TeEy3I8kyg3tCBKoH0sRfmNIiGYbuk993kwIIvVT6NMQGSLdTc2Gx/h063gWQnRgvo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=cJnh5S23; arc=none smtp.client-ip=45.254.49.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.67] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5d0822dc;
	Mon, 16 Dec 2024 11:40:58 +0800 (GMT+08:00)
Message-ID: <a5455f60-4705-4517-a262-226d1219cc17@rock-chips.com>
Date: Mon, 16 Dec 2024 11:40:57 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rockchip: rga: Fix Copyright description
To: Andy Yan <andyshrk@163.com>, mchehab@kernel.org,
 linux-media@vger.kernel.org, ezequiel@vanguardiasur.com.ar
Cc: heiko@sntech.de, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
References: <20241215093051.3447711-1-andyshrk@163.com>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <20241215093051.3447711-1-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhPHVZKSEsZQx1KGRkYQ0xWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a93cd8e09d803afkunm5d0822dc
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PU06HBw5SzIUUSFMCSM#Dk0O
	HEMaCQ9VSlVKTEhPSElLT05CTUJOVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFISEtPNwY+
DKIM-Signature:a=rsa-sha256;
	b=cJnh5S23HYkwk60nuSGmzX+IJmO9fZjmQg+g7En5F2x73FJJr8OuqW0W6FZAKDrbZ9T/9+a8QDz7uNcqi1G4kK+ADrlIvGGDKcLa3d8n1sLiBlZwZrgQIENg3WfAI3fP2EJMjnvToPhzhL1o6H0WOunoAkjrurj/RXB9kTwuuBY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=U4klOZfq1Cxu+8x9TcEc9jk4qUXMCWi+y8koj8VIoSg=;
	h=date:mime-version:subject:message-id:from;


On 2024/12/15 17:30, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
>
> The company name has update to Rockchip Electronics Co., Ltd.
> since 2021.
> And change Co.Ltd to Co., Ltd. to fix mail server warning:
> DBL_SPAM(6.50)[co.ltd:url];
>
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Kever Yang <kever.yang@rock-chips.com>

Thanks,
- Kever
> ---
>
>   drivers/media/platform/rockchip/rga/rga-buf.c | 2 +-
>   drivers/media/platform/rockchip/rga/rga-hw.c  | 2 +-
>   drivers/media/platform/rockchip/rga/rga-hw.h  | 2 +-
>   drivers/media/platform/rockchip/rga/rga.c     | 2 +-
>   drivers/media/platform/rockchip/rga/rga.h     | 2 +-
>   5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
> index 8a48e9d91f96..0a7cb1af9b1a 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (C) 2017 Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (c) Rockchip Electronics Co., Ltd.
>    * Author: Jacob Chen <jacob-chen@iotwrt.com>
>    */
>   
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 11c3d7234757..26c6645797fe 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (c) Rockchip Electronics Co., Ltd.
>    * Author: Jacob Chen <jacob-chen@iotwrt.com>
>    */
>   
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
> index e8917e5630a4..5ccc081a88b2 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (c) Rockchip Electronics Co., Ltd.
>    * Author: Jacob Chen <jacob-chen@iotwrt.com>
>    */
>   #ifndef __RGA_HW_H__
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index 1739ac0c8e92..c671d289ceed 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (c) Rockchip Electronics Co., Ltd.
>    * Author: Jacob Chen <jacob-chen@iotwrt.com>
>    */
>   
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
> index 8105bb2efe57..69841f2a352e 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -1,6 +1,6 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   /*
> - * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
> + * Copyright (c) Rockchip Electronics Co., Ltd.
>    * Author: Jacob Chen <jacob-chen@iotwrt.com>
>    */
>   #ifndef __RGA_H__

