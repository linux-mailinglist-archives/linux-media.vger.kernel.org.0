Return-Path: <linux-media+bounces-20563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FD29B5D03
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 08:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C35732847EF
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 07:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E871DFE15;
	Wed, 30 Oct 2024 07:35:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E1A1DE8B6;
	Wed, 30 Oct 2024 07:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730273745; cv=none; b=mDfSBIf4XNzOmfR3y3LYKpQsNOTk0fljOBemmNcVe+uqo+AIXKNwCLCEBPj2hlei2hQ6Z/eIT16lZipyHX0VVajuZmUog0MpLrrnIHpnPOBvcvJVH8CEsSN3369JwyophetkpZjcF6AeS1YyN3Ht0eF4y6i1fSChKNMwwQI0q4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730273745; c=relaxed/simple;
	bh=ug3+autQhTSBrhXggayh7xagmMimocKt8WM7S+ulbnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XikshVWdKp9S/aUV44Qms8LGPDrZ/Q+m2eZuIrGl52gLKE97gMtzLY+aEYVkWNy9Yn1FgI3xiLPKL6VeiAnOrpZ78/opFFbNl3dSBWQPFlod1+4sAU/iKm80k+7IAfpXy6O1B4K1O0Z5ZotEOvIyoWbsLk1QQyfZiJSWvxTKTdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948EBC4CEE4;
	Wed, 30 Oct 2024 07:35:43 +0000 (UTC)
Message-ID: <ae2cb9e1-0ced-47be-a851-c21c3245ea07@xs4all.nl>
Date: Wed, 30 Oct 2024 08:35:41 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] drivers:media:radio: Fix atomicity violation in
 fmc_send_cmd()
To: Qiu-ji Chen <chenqiuji666@gmail.com>, mchehab@kernel.org,
 allen.lkml@gmail.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, stable@vger.kernel.org
References: <20241030064824.6122-1-chenqiuji666@gmail.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20241030064824.6122-1-chenqiuji666@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Qiu-ji Chen,

On 30/10/2024 07:48, Qiu-ji Chen wrote:
> Atomicity violation occurs when the fmc_send_cmd() function is executed 
> simultaneously with the modification of the fmdev->resp_skb value. 
> Consider a scenario where, after passing the validity check within the 
> function, a non-null fmdev->resp_skb variable is assigned a null value. 
> This results in an invalid fmdev->resp_skb variable passing the validity 
> check. As seen in the later part of the function, skb = fmdev->resp_skb; 
> when the invalid fmdev->resp_skb passes the check, a null pointer 
> dereference error may occur at line 478, evt_hdr = (void *)skb->data;
> 
> To address this issue, it is recommended to include the validity check of 
> fmdev->resp_skb within the locked section of the function. This 
> modification ensures that the value of fmdev->resp_skb does not change 
> during the validation process, thereby maintaining its validity.
> 
> This possible bug is found by an experimental static analysis tool
> developed by our team. This tool analyzes the locking APIs
> to extract function pairs that can be concurrently executed, and then
> analyzes the instructions in the paired functions to identify possible
> concurrency bugs including data races and atomicity violations.

FYI, since this driver will be removed soon, I'm not taking this patch.

See this patch for the driver removal:

https://patchwork.linuxtv.org/project/linux-media/patch/20241028083030.26351-1-lukas.bulwahn@redhat.com/

Regards,

	Hans

> 
> Fixes: e8454ff7b9a4 ("[media] drivers:media:radio: wl128x: FM Driver Common sources")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
> ---
>  drivers/media/radio/wl128x/fmdrv_common.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/radio/wl128x/fmdrv_common.c b/drivers/media/radio/wl128x/fmdrv_common.c
> index 3d36f323a8f8..4d032436691c 100644
> --- a/drivers/media/radio/wl128x/fmdrv_common.c
> +++ b/drivers/media/radio/wl128x/fmdrv_common.c
> @@ -466,11 +466,12 @@ int fmc_send_cmd(struct fmdev *fmdev, u8 fm_op, u16 type, void *payload,
>  			   jiffies_to_msecs(FM_DRV_TX_TIMEOUT) / 1000);
>  		return -ETIMEDOUT;
>  	}
> +	spin_lock_irqsave(&fmdev->resp_skb_lock, flags);
>  	if (!fmdev->resp_skb) {
> +		spin_unlock_irqrestore(&fmdev->resp_skb_lock, flags);
>  		fmerr("Response SKB is missing\n");
>  		return -EFAULT;
>  	}
> -	spin_lock_irqsave(&fmdev->resp_skb_lock, flags);
>  	skb = fmdev->resp_skb;
>  	fmdev->resp_skb = NULL;
>  	spin_unlock_irqrestore(&fmdev->resp_skb_lock, flags);


