Return-Path: <linux-media+bounces-27332-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EF7A4C2D8
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 15:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95C111894C04
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 14:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B91213E60;
	Mon,  3 Mar 2025 14:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eeY/o1vs"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049282135BB
	for <linux-media@vger.kernel.org>; Mon,  3 Mar 2025 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741010856; cv=none; b=pg5i6H4Mc1BHkMCyfH2YbL9yApsiJDquprizPOPSBnejvmaAnJcJgRdeTBq+VsOmn4Wda8Ue/yA3pu530I04sS/YYC9541ltnjBt2fRqXVqcW0Mp+RdFR36Nmquilhw4JvxsfAn/HSIcqwBNYWiHvJR5QaaBt+jFQzepYQonTao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741010856; c=relaxed/simple;
	bh=8sxbX5O26w5xPQxkxTSVAiTsZlfgUWGK53dYCGtXYu4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/4zGJ1iWIk/RoeNBNFUwVV/C6pXu/x8F3uIl/huAkmZQICmnZ6fmn72eZwGAlwUWs356tu9q+PrZXYZwZWfa+YTg7ckEzBQezUs9zsU/rrD+GTK4zarx79i+b4aHVgYzvE1O2oeweDO4Qs0Rl7SEBNr7Qol6PtO2N5NaPzok1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eeY/o1vs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741010853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B/jz82WLxz2AXnyirtjFiRLnkqi5Gdqp332HU/uapU0=;
	b=eeY/o1vsbwAUaiSRjxA/kLnVafvI0W3hlh+8bS4TFM5TlR96uH/EP8bVddUhSAKRQn6WbK
	j9cZG67uPoSBAHB9bzJsPkcFKMWYix4hCaW79SsCJ8cC2rMnmSLlI1dZG5nRaqJVVrlLAO
	x+a0HrvKwnmYEkL68Axu/nGOWMGCeOY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-ExwApft_PwC6OTjUZwY0JQ-1; Mon, 03 Mar 2025 09:07:27 -0500
X-MC-Unique: ExwApft_PwC6OTjUZwY0JQ-1
X-Mimecast-MFC-AGG-ID: ExwApft_PwC6OTjUZwY0JQ_1741010846
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-abf46dba035so244261366b.0
        for <linux-media@vger.kernel.org>; Mon, 03 Mar 2025 06:07:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741010846; x=1741615646;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/jz82WLxz2AXnyirtjFiRLnkqi5Gdqp332HU/uapU0=;
        b=A0KoYWyvlRwr6AtuwI4/VVtP9rz6opon8LDvXJoK25Oqs14QLL1vdu40CkxY4CHqaA
         qP2rPK8bItkRz9Q9sOIqmU8JD+bg49XczC0Apwfs6mwctlxXD1I1I6+hddM49hkm+XaZ
         JQRRwPIda7qX/1wgJ7jGLRGeSSN5Kmy25elHUvUD/mgKS/Ste2dBesdlTTU0b3R8GiII
         ERw6pHk+qsfH/a0fs68bguQe68sWTzXbWE4pSLYx7GhcB5y8zwP73Vy1WUwqQjIaKzn2
         qzRPYCRhtHjMfm+vXnVeUKZAdr8U29t6eLA5oRG5mWJy9/HfdchoPJ8TAC8OmqvgrJq8
         toXw==
X-Gm-Message-State: AOJu0YwTlHDg6AAF3fWl0ENh3Bxo2krNroo/IjR+k4XmQJRs/dgOBdPC
	CyOIfQfHLJ7bbZRbFh4vxFV+BmbVIh9JPmzhYz4CCvjYJNuNUD/DHLsZJoUCOE0FT5TV9mxhpkp
	B0pr2eGNDLpDNyO8UXbCNHgV3X2+GmgyzhwMafiwnV1/CYe0SY+2bDCHJaUID
X-Gm-Gg: ASbGncvzPvhZ2M78eQVwRsGhqK4fP86w3bgLz9g0YUgTcw5GEN/F8zJgkMPlF6C1rvx
	IZUPNqZuN3VByrzugLvSQ57BoPIcRIbvOPAms3cH5r6FZ8Ks8ud9GN/08A7b9Czf5sCAMTG5rCl
	1OueL3dTgVksiJ1IugbMQZSDB28tcIX68ngMSPem5gptUXdWRwTP062cCtMVnAzP5Doq+PhaF4z
	Xgvx+LLlKeI2TwJfYCmZLtjH3z15N6mFPc4/QAT5+fcEEsv+pElzlQfEsiMQJIrwYnT2i+SCUZl
	KDhVrAe34T+sg25JeaQ=
X-Received: by 2002:a17:907:3f9a:b0:ab7:8079:78ae with SMTP id a640c23a62f3a-abf265e9bcfmr1589132766b.44.1741010844567;
        Mon, 03 Mar 2025 06:07:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBD8Aj0BpxaGnvRgtUOdfzwUMqZL2wprJlFC35LC4uCN781yYjf3zsY7UYORaHX540v0YrEw==
X-Received: by 2002:a17:907:3f9a:b0:ab7:8079:78ae with SMTP id a640c23a62f3a-abf265e9bcfmr1589125666b.44.1741010844028;
        Mon, 03 Mar 2025 06:07:24 -0800 (PST)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf6348394dsm357844666b.63.2025.03.03.06.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 06:07:23 -0800 (PST)
Message-ID: <3b64dbbb-d5b4-4813-9dce-aa6e361133cf@redhat.com>
Date: Mon, 3 Mar 2025 15:07:22 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] media: uvcvideo: Keep streaming state in the file
 handle
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
References: <20250226-uvc-granpower-ng-v4-0-3ec9be906048@chromium.org>
 <20250226-uvc-granpower-ng-v4-1-3ec9be906048@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250226-uvc-granpower-ng-v4-1-3ec9be906048@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 26-Feb-25 15:23, Ricardo Ribalda wrote:
> Add a variable in the file handle state to figure out if a camera is in
> the streaming state or not. This variable will be used in the future for
> power management policies.
> 
> Now that we are at it, make use of guards to simplify the code.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 18 +++++++++++++-----
>  drivers/media/usb/uvc/uvcvideo.h |  1 +
>  2 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 93c6cdb23881..f9cd6db759c5 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -835,11 +835,18 @@ static int uvc_ioctl_streamon(struct file *file, void *fh,
>  	if (!uvc_has_privileges(handle))
>  		return -EBUSY;
>  
> -	mutex_lock(&stream->mutex);
> +	guard(mutex)(&stream->mutex);
> +
> +	if (handle->is_streaming)
> +		return 0;
> +
>  	ret = uvc_queue_streamon(&stream->queue, type);
> -	mutex_unlock(&stream->mutex);
> +	if (ret)
> +		return ret;
>  
> -	return ret;
> +	handle->is_streaming = true;
> +
> +	return 0;
>  }
>  
>  static int uvc_ioctl_streamoff(struct file *file, void *fh,
> @@ -851,9 +858,10 @@ static int uvc_ioctl_streamoff(struct file *file, void *fh,
>  	if (!uvc_has_privileges(handle))
>  		return -EBUSY;
>  
> -	mutex_lock(&stream->mutex);
> +	guard(mutex)(&stream->mutex);
> +
>  	uvc_queue_streamoff(&stream->queue, type);
> -	mutex_unlock(&stream->mutex);
> +	handle->is_streaming = false;
>  
>  	return 0;
>  }
> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
> index 5e388f05f3fc..bc87e1f2c669 100644
> --- a/drivers/media/usb/uvc/uvcvideo.h
> +++ b/drivers/media/usb/uvc/uvcvideo.h
> @@ -618,6 +618,7 @@ struct uvc_fh {
>  	struct uvc_streaming *stream;
>  	enum uvc_handle_state state;
>  	unsigned int pending_async_ctrls;
> +	bool is_streaming;
>  };
>  
>  struct uvc_driver {
> 


