Return-Path: <linux-media+bounces-27355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FCFA4C5B0
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:51:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2690169C0E
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 15:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1519C214A7A;
	Mon,  3 Mar 2025 15:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZCQhnihp"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C765D1F4166
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 15:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017061; cv=none; b=AjnUCrKqPOlAcrnopbyrXYwLZXW4rvMsvrjnf6SPSLlvI2zLX/SX1sO9+rmqtWAm+LQRmQZTs4h8QDzw7Cl3KPpHz9Tyw9m4aYDdT8jbY3wB32CsTKO3zOvIdnlaTSmRkc1qU6s054IG3AzFW5efwSMBYSHuOQUySOAO+9wG/6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017061; c=relaxed/simple;
	bh=Q5kJVVC8kNtwYQqA9BcK86Gbrof3EdqlcoliQevVwto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dK4V9AjARJMz3CK3tZZbzvaVQ5/y+DBYdmDmpfCnETKzITW2/XFQluzfIrtQiU6PdMbxLFljiqDlJ4MoYRObcxOtlKU77eXHwpEKmIfe5OGNAoP2psaaLuBvurrWY+q+B6WPxnjscTI2MHVqsyhJNbacnf/3Nzk5xU+Cv64oPCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZCQhnihp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741017058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4dNvNAyHU5G5gygWRGJlXArKYYYBxB4wqYDMvVSBxrQ=;
	b=ZCQhnihpRkE0BSPAcw26igRGUlF+dL4IduEiqoGLVQavi/3Q/ekNmbPpvc+0eXAPxfesNP
	4aKSvR8ma5HFHld/EuDSlwEIsH8msQWE1qI/TmoeZrEqOInMgZYbHAOalothtEaPe2GWRi
	RH+EpJapW8j9wU1MDFdexvimtbJ/4Bw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-nefAiCCGP1qcXeKXIzA0DA-1; Mon, 03 Mar 2025 10:50:57 -0500
X-MC-Unique: nefAiCCGP1qcXeKXIzA0DA-1
X-Mimecast-MFC-AGG-ID: nefAiCCGP1qcXeKXIzA0DA_1741017056
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5d9e4d33f04so4830972a12.0
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 07:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741017056; x=1741621856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dNvNAyHU5G5gygWRGJlXArKYYYBxB4wqYDMvVSBxrQ=;
        b=QDI+d4EocrtYw1rpthXkT2RsewXUGavnNw8moQrHqrJvq36tily5beeEUXrEMsfgj6
         s/HUDXg9RNGDzvgBBCNbvB8ZhSg6obPUaKVR+s4Jh0D2OuOQyCcjIXbjoXEC8fZHEQ5i
         oL17PZXtVL9hVlUvCqI50M5VPL/JXxExM9K5tvADy0HYirgQQWWsqlij3thjX6c+jAfy
         zWnMek15pZ45N4BLAZcyosXW6dOGWROcuC9CBJlGQHtQW/Mrpg0BHUA2UNlgyhUnn6xI
         mNxVMZH2wqgS8mti9oQ4TPTqNQpwC1sGbzBXZROmjBK0UEj0yIBbekLpYMHaXRPjfHbZ
         jj7Q==
X-Gm-Message-State: AOJu0Yz+gbOgTFrVLP9Yk05CWoZ7je0HA1cVVf7pNUDHfllH4gxvDK5Q
	9OFCeQTfgnDo28/uCpFvF9KManj3wTXx579E5HNyptdb8D77jtVWaA1710drz4NUWDHr5w89gs2
	mtRz1kzDjW2h/yKoJt6dtV9GGaNtPy1se1TSDrDAH4VNNDb50pf4mKfq32LY9
X-Gm-Gg: ASbGnctDxrI81b5VuYmjLBazHKS4QYKP0IrMztN881PiF+RIavBHXqEySlcnMkFJaFl
	kARLJEwc+OADwE+1QysPoYktSWF+06g2gpnroQjc5GFeGOVqXym90zkwZT0t09mk8xhLq3vZdEU
	Ngom2Jn4Khbm8oAj1sOFnfacXUP/A/P7wJ8e29TfIg5WQbezOxZMCHcTao0ziyPWI4OBEqVrmN/
	YHT/z5XMm+ZpuPYj6/d+33mixoXM3yKC3BFbSh38HVepp9nAvRXxq/aMNPvpkVdfu1iw7F0sPBv
	iDRbDzMzcU/tOJ6wGUg=
X-Received: by 2002:a05:6402:40d1:b0:5e0:87eb:956b with SMTP id 4fb4d7f45d1cf-5e4d6b68f0dmr12880982a12.22.1741017056300;
        Mon, 03 Mar 2025 07:50:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpG/UQJz56LDbfAhf/kiJEcE14KnocWAUI5oNLuJ5COA4PPwaqHlXug2SOBV0xP2U4dgeukw==
X-Received: by 2002:a05:6402:40d1:b0:5e0:87eb:956b with SMTP id 4fb4d7f45d1cf-5e4d6b68f0dmr12880963a12.22.1741017055914;
        Mon, 03 Mar 2025 07:50:55 -0800 (PST)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e533a89a21sm3099850a12.60.2025.03.03.07.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 07:50:55 -0800 (PST)
Message-ID: <2cd42ab9-8079-4bd6-b650-42c2e894592a@redhat.com>
Date: Mon, 3 Mar 2025 16:50:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: uvcvideo: Send control events for partial
 succeeds
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@kernel.org
References: <20250224-uvc-data-backup-v2-0-de993ed9823b@chromium.org>
 <20250224-uvc-data-backup-v2-2-de993ed9823b@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250224-uvc-data-backup-v2-2-de993ed9823b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 24-Feb-25 11:34, Ricardo Ribalda wrote:
> Today, when we are applying a change to entities A, B. If A succeeds and B
> fails the events for A are not sent.
> 
> This change changes the code so the events for A are send right after
> they happen.
> 
> Cc: stable@kernel.org
> Fixes: b4012002f3a3 ("[media] uvcvideo: Add support for control events")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index f2484f6d21c1..7d074686eef4 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1705,7 +1705,9 @@ static bool uvc_ctrl_xctrls_has_control(const struct v4l2_ext_control *xctrls,
>  }
>  
>  static void uvc_ctrl_send_events(struct uvc_fh *handle,
> -	const struct v4l2_ext_control *xctrls, unsigned int xctrls_count)
> +				 struct uvc_entity *entity,
> +				 const struct v4l2_ext_control *xctrls,
> +				 unsigned int xctrls_count)
>  {
>  	struct uvc_control_mapping *mapping;
>  	struct uvc_control *ctrl;
> @@ -1716,6 +1718,9 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
>  		u32 changes = V4L2_EVENT_CTRL_CH_VALUE;
>  
>  		ctrl = uvc_find_control(handle->chain, xctrls[i].id, &mapping);
> +		if (ctrl->entity != entity)
> +			continue;
> +
>  		if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
>  			/* Notification will be sent from an Interrupt event. */
>  			continue;
> @@ -1954,11 +1959,12 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  					uvc_ctrl_find_ctrl_idx(entity, ctrls,
>  							       err_ctrl);
>  			goto done;
> +		} else if (ret > 0 && !rollback) {
> +			uvc_ctrl_send_events(handle, entity,
> +					     ctrls->controls, ctrls->count);
>  		}
>  	}
>  
> -	if (!rollback)
> -		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
>  	ret = 0;
>  done:
>  	mutex_unlock(&chain->ctrl_mutex);
> 


