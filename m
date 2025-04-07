Return-Path: <linux-media+bounces-29503-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95322A7DE68
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 15:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4204F1888374
	for <lists+linux-media@lfdr.de>; Mon,  7 Apr 2025 13:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C982A23C8C0;
	Mon,  7 Apr 2025 13:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WvXpiJhg"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B22B22A1F1
	for <linux-media@vger.kernel.org>; Mon,  7 Apr 2025 13:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030972; cv=none; b=VwuKqQch7RefVgUQnpHY7aySvcdKLGrH7vQfLOJj09lRcClhlfXPFr1b7/HzwUicgpJt8LRkQgSirrwjAwEDX5o4rlsIA28j+xsTewC+e9/+jerxjZnA8c5FBnX1svor6/KtaAlRA02q67yLjOhLnA2mUUBQoh+A5tYPvP9bkxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030972; c=relaxed/simple;
	bh=4wEfAfpNpyVRT1KG4Jp7NXlVFJTUhte98RFnNHbj9lk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u5fk6q4W8riNwg+1mj463gjW6x0qEoThxDQO8ROEX3/9PeuhjXGpAzkZkk0pTR3CMy35f0RhJl/H1EsX70UJtLITevoeaj9WQ1XPtCx1H9JQp8ceqf0ndHnre7KBlPxBOeIMUNy14mJTCSsa2v9YOXilKuPMGM+mKPPx1kzy3wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WvXpiJhg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744030969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QN5V11JQJn749B7yJB3Rd7WNs8XT3qNDgGSI4GX9Fqw=;
	b=WvXpiJhgkOGJc/k07CFwntFnJi8+gGwkOhhJHsBiTEdB/zw3DksR1QCPbMBiSjjRcUeLmX
	TV1IKvaxGXoO16Uem59fFheorKwpG/GNUVUOph3R8wX3JR9fOJ6J728d7LTPB+jUNhCq8a
	EGpeRVyu/RIrpvt63reuKLLjtcz57fo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-cPRz7p4SPZmTYWbjbYUgsA-1; Mon, 07 Apr 2025 09:02:47 -0400
X-MC-Unique: cPRz7p4SPZmTYWbjbYUgsA-1
X-Mimecast-MFC-AGG-ID: cPRz7p4SPZmTYWbjbYUgsA_1744030967
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d22c304adso24605165e9.0
        for <linux-media@vger.kernel.org>; Mon, 07 Apr 2025 06:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744030967; x=1744635767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QN5V11JQJn749B7yJB3Rd7WNs8XT3qNDgGSI4GX9Fqw=;
        b=NHDNMg+74hRtnySPG6gbPww+6MkIAkfY6AAoXXp+sw8E5Vf2VvO85RY6SnPtLHEsQH
         D9ONoIYvS+/RPbSwhIr50ieGYAN+Nw4sHB+cYbM9m1dUDtjRsnti4vKb+dsDTZotOVYl
         BElXYPqOQ0ZyAUaJLEfrGo14XCa8ZTKFZqXdJkVr+zKoeIdJubN9/ayDIwWuULeJzP/d
         x5+Y4GP+QjSVbqsKNF+NdoSBvi4XLP5YFFuF6ew8ieKqkyYQqR90wy60s342mRNZdU6A
         /9Kc49Xr7wuGXamv5NtHW8J5zjwU4+BMB/AaElULLScMq3sjzr4OW9K2bTkxI5YA5GGe
         DfpQ==
X-Gm-Message-State: AOJu0YwAWYNMSTZpxBvAOQAELr3H0Ervy4Ka+MEVqva30AMGYuYiHsTS
	/xezKISZ0J0WYO9pMcCgaZ1VRWKTxkGQghW7lUfcQCJQKCoDNRkesln1QnPH2gmOOou42StWQBM
	2/lpt4hFyAcl/kibBtNmAZ4R+GgcmcLvujLGR3G01OVJItnh9rbfUGToLToGm
X-Gm-Gg: ASbGncu7kYwyurl3Jm+UH+SBh5gWKmA60UWym4ZU/Uv706qefcjMoHlIxhuv/wMOi++
	jvQAkNPncZm2aTzDd3NfioZI9sCT4LgjT3IycK5Cu8dbSIUnxmxF4RIEqmwW3O/mfvOHq1SOokh
	tvIYNlEOGMrrh1ZhFSeGnzdp3EETiQoPkMdiXI53m2oyxQkFyDif6RwAUpc7sbOjk7/teN/m+E7
	dwjwlwZM/ZG5LBUHPn9BSivuA+8MmEmAgLMPFNrW67rTd/qIXLxI+xBLflxEOzVmGUaCC6x0t7W
	pOcvFBrgbxxAzVS9gR4=
X-Received: by 2002:a05:600c:1991:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-43ebefb7f50mr167012925e9.15.1744030966642;
        Mon, 07 Apr 2025 06:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLU7pKg+nMPuiI5SurCH5seyxqbkaxqIDvfQwhDA/jiwqcW6EvfKlSq2nokduCEknwmGQoag==
X-Received: by 2002:a05:600c:1991:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-43ebefb7f50mr167011895e9.15.1744030965707;
        Mon, 07 Apr 2025 06:02:45 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea8d1673dsm151308495e9.0.2025.04.07.06.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 06:02:44 -0700 (PDT)
Message-ID: <c80da442-c35a-4336-9a49-5a6745e4ce6b@redhat.com>
Date: Mon, 7 Apr 2025 15:02:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: uvcvideo: Rollback non processed entities
 on error
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
References: <20250224-uvc-data-backup-v2-0-de993ed9823b@chromium.org>
 <20250224-uvc-data-backup-v2-3-de993ed9823b@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250224-uvc-data-backup-v2-3-de993ed9823b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 24-Feb-25 11:34, Ricardo Ribalda wrote:
> If we wail to commit an entity, we need to restore the

s/wail/fail/

I've fixed this up while merging this series and
I've pushed the entire series to:
https://gitlab.freedesktop.org/linux-media/users/uvc/ next now.

Note I had to manually fix some conflicts due to the granular power
saving series being merged first. I'm pretty sure I got things correct
but a double check would be appreciated.

Regards,

Hans




> UVC_CTRL_DATA_BACKUP for the other uncommitted entities. Otherwise the
> control cache and the device would be out of sync.
> 
> Cc: stable@kernel.org
> Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Closes: https://lore.kernel.org/linux-media/fe845e04-9fde-46ee-9763-a6f00867929a@redhat.com/
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 7d074686eef4..89b946151b16 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1864,7 +1864,7 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  	unsigned int processed_ctrls = 0;
>  	struct uvc_control *ctrl;
>  	unsigned int i;
> -	int ret;
> +	int ret = 0;
>  
>  	if (entity == NULL)
>  		return 0;
> @@ -1893,8 +1893,6 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  				dev->intfnum, ctrl->info.selector,
>  				uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT),
>  				ctrl->info.size);
> -		else
> -			ret = 0;
>  
>  		if (!ret)
>  			processed_ctrls++;
> @@ -1906,10 +1904,14 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  
>  		ctrl->dirty = 0;
>  
> -		if (ret < 0) {
> +		if (ret < 0 && !rollback) {
>  			if (err_ctrl)
>  				*err_ctrl = ctrl;
> -			return ret;
> +			/*
> +			 * If we fail to set a control, we need to rollback
> +			 * the next ones.
> +			 */
> +			rollback = 1;
>  		}
>  
>  		if (!rollback && handle &&
> @@ -1917,6 +1919,9 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  			uvc_ctrl_set_handle(handle, ctrl, handle);
>  	}
>  
> +	if (ret)
> +		return ret;
> +
>  	return processed_ctrls;
>  }
>  
> @@ -1947,7 +1952,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  	struct uvc_video_chain *chain = handle->chain;
>  	struct uvc_control *err_ctrl;
>  	struct uvc_entity *entity;
> -	int ret = 0;
> +	int ret_out = 0;
> +	int ret;
>  
>  	/* Find the control. */
>  	list_for_each_entry(entity, &chain->entities, chain) {
> @@ -1958,17 +1964,23 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  				ctrls->error_idx =
>  					uvc_ctrl_find_ctrl_idx(entity, ctrls,
>  							       err_ctrl);
> -			goto done;
> +			/*
> +			 * When we fail to commit an entity, we need to
> +			 * restore the UVC_CTRL_DATA_BACKUP for all the
> +			 * controls in the other entities, otherwise our cache
> +			 * and the hardware will be out of sync.
> +			 */
> +			rollback = 1;
> +
> +			ret_out = ret;
>  		} else if (ret > 0 && !rollback) {
>  			uvc_ctrl_send_events(handle, entity,
>  					     ctrls->controls, ctrls->count);
>  		}
>  	}
>  
> -	ret = 0;
> -done:
>  	mutex_unlock(&chain->ctrl_mutex);
> -	return ret;
> +	return ret_out;
>  }
>  
>  int uvc_ctrl_get(struct uvc_video_chain *chain,
> 


