Return-Path: <linux-media+bounces-50819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53457D28B23
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 22:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A834306B69A
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 21:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C5D2326D75;
	Thu, 15 Jan 2026 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m2gjhS4g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1D829B217;
	Thu, 15 Jan 2026 21:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768512057; cv=none; b=oDy9flEcMD+2ZIpsYno9e70tsCOEH6O+g1wCxZrMPKpQlNjZ38P5VTWRogXr4DVr48WwmGQKAShdBPJdJVJnfywgA36ul/zrBpKTFoD0iDPYKrixNmN/lUQ7RIogRHxoT61RavNw4QxeQsPw43la3TgBXJnWk3Urc2rJvY5QPTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768512057; c=relaxed/simple;
	bh=rgWQxGFATZ7V+O1vXE19K9GVyFj9iLFBDka8O8VB12M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mbqVuimdvzdQeDuZnsCV/HTePFJ5DievP3e/YxQSzIxRvg5mQ0AeJJptB+jQjVRKgg6SPWU1ThR5niW94NB06+jmTafHsEqSG2yjHcuJl0NpUWpGiLo4ZOM2l/7ZWAxqRSFHxDKNdnyh+LkUJE+3Ve8oc0PIPi2+jYHlL6TdFvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m2gjhS4g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F3A0316;
	Thu, 15 Jan 2026 22:20:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768512026;
	bh=rgWQxGFATZ7V+O1vXE19K9GVyFj9iLFBDka8O8VB12M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m2gjhS4gz24pOWn8wq3kWXvIc6bxesUaQJOn9saE9td+G+p2ta5B+bPVoyQ5flunc
	 7fCNzNlnrY1xi5Ggg6aozOtrqwD4zVSA2ig9pkw7/eagPFIP8+3unfAVNonadP1RRv
	 S3Xipn8IFgaAe3GeF+Yzzi79VeYDCddQjXiR5jtI=
Message-ID: <ead963dd-11eb-44b4-9bf5-bab4dae4bcde@ideasonboard.com>
Date: Thu, 15 Jan 2026 21:20:50 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: platform: Add WQ_PERCPU to alloc_workqueue users
To: Marco Crivellari <marco.crivellari@suse.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20260113140446.196930-1-marco.crivellari@suse.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260113140446.196930-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Marco

On 13/01/2026 14:04, Marco Crivellari wrote:
> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
> 
>     commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
>     commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> The refactoring is going to alter the default behavior of
> alloc_workqueue() to be unbound by default.
> 
> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
> must now use WQ_PERCPU. For more details see the Link tag below.
> 
> In order to keep alloc_workqueue() behavior identical, explicitly request
> WQ_PERCPU.
> 
> Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---

Sorry for the delay getting back to you. I haven't looked at the impact of the refactoring in 
detail, but I'm happy to trust you on the workqueue internals and this is line with the changes to 
other drivers across the tree so:

Acked-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> index 799453250b85..e3ff0482a84e 100644
> --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> @@ -445,7 +445,7 @@ int rzv2h_ivc_init_vdev(struct rzv2h_ivc *ivc, struct v4l2_device *v4l2_dev)
>   	INIT_LIST_HEAD(&ivc->buffers.queue);
>   	INIT_WORK(&ivc->buffers.work, rzv2h_ivc_transfer_buffer);
>   
> -	ivc->buffers.async_wq = alloc_workqueue("rzv2h-ivc", 0, 0);
> +	ivc->buffers.async_wq = alloc_workqueue("rzv2h-ivc", WQ_PERCPU, 0);
>   	if (!ivc->buffers.async_wq)
>   		return -EINVAL;
>   


