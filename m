Return-Path: <linux-media+bounces-47253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DF84DC683DB
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 09:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 9B3332A42B
	for <lists+linux-media@lfdr.de>; Tue, 18 Nov 2025 08:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C931B2BEFE6;
	Tue, 18 Nov 2025 08:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kP2wffvG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6594E30F928;
	Tue, 18 Nov 2025 08:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455298; cv=none; b=bibFuZlFYahSub+ss/x5cFQgwbFGwphgebMuFE3wIbUxa4E7kBE0K6MNz3T9/0Ge0Db6leV8jhBi4NkN/krxwAERDL2tgsQPNdil809xbmg0FHAkcgwKwD3ZSNn0kDGT9XbA0DmZcV2foeZOQxSlOAFJqHO/unIMRHmBVpSdFAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455298; c=relaxed/simple;
	bh=AEhbcbXENagsmWB/4Ic476yD9q2RIQLbM+gUv/370OI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZmbyvUQ0Oli7qKjY0IbwjL59XKKa9F0GfYbgpuocPU/GWe5YZ5DQaZN2XNrJdmNOuSvbnb6+MC/JyHyHDwJ43SWYQ95SHCv8WAHofiaPb1QPMCNjhV56rcmktERB81S7AcLbmXKY89t1CtxeGmuJK1RcLMT1ZChMf7eg9uKVLvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kP2wffvG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70D64B3;
	Tue, 18 Nov 2025 09:39:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763455170;
	bh=AEhbcbXENagsmWB/4Ic476yD9q2RIQLbM+gUv/370OI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kP2wffvGDHdFcMv1UjPmYe1ullov2/6Gjiote6R8l/FBjEeHqePa2PfmAeSCvMUfD
	 iiO1DKTikTr+92ovN2Mhnkw79pe682O++fI2/1gNejhdBjzHkH7gmwMSYjZqQJa4Ax
	 YF6Rodfe8YuYy9tLWn67pb9yWrDOLBthx19o5mAg=
Message-ID: <92038204-f5ba-4d15-a217-6632a9b064a7@ideasonboard.com>
Date: Tue, 18 Nov 2025 08:41:31 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mali-c55: Remove unneeded semicolon
To: Chen Ni <nichen@iscas.ac.cn>, jacopo.mondi@ideasonboard.com,
 mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251118020430.492921-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20251118020430.492921-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Chen, thanks for the patch

On 18/11/2025 02:04, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/platform/arm/mali-c55/mali-c55-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> index 43b834459ccf..e4118e8e0faa 100644
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -458,7 +458,7 @@ static int mali_c55_media_frameworks_init(struct mali_c55 *mali_c55)
>   	if (ret) {
>   		dev_err(mali_c55->dev, "failed to register V4L2 device\n");
>   		goto err_unregister_media_device;
> -	};
> +	}
>   
>   	mali_c55->notifier.ops = &mali_c55_notifier_ops;
>   	v4l2_async_nf_init(&mali_c55->notifier, &mali_c55->v4l2_dev);


