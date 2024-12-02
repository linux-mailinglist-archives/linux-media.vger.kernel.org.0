Return-Path: <linux-media+bounces-22448-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C4C9E0774
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 184B4B84495
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7304E21C161;
	Mon,  2 Dec 2024 14:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JQP8+c3L"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C83209692
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150043; cv=none; b=tAgnNeqGxpFjeMbAM05jMPJJ8/1/nO/qZlwTb8cERKxFY1brOZDkhHkxB6JrBSWqtaUORyjA+C0zDVNZGAeUTED7tZMswR1i08+VDEviL1zq+HJHHGoaboBVUdvpNdIY6X4nMf26wnhV9q2eWk+leV3VNmOAcxGUmEXgbDzRAso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150043; c=relaxed/simple;
	bh=pPSluDrPZolihQ9FF0FDY4FMT7vtIp8TVNy3EC6ESfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+XOANQoRDfWUtLvnwJLU2s9nRtYTzdwLoRVZQFwrdGVKPyhSjHVRfBrZ+z4kSG3u5IRYM6g+3SScKMdEvEmIghtgmCWW54dhD7jMntO1nwfoSD7iTlmKxEE3yG8tHYU1lSl8hRIn0mfQWVg3RGdW4rlgNdNQ2jubTaI76KkH9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JQP8+c3L; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733150041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6Xej+sefl62+HuZJ02rOMvYBMjieqyUp/Rq6GPi75M=;
	b=JQP8+c3LJjnAcMJFHlKWlMErW6RfYlbY4d1yWXs1sXwfsGJgdfXp+ajrnSK25Jkj8Q7WK0
	6aRu22ONRAl3/1Z+O5Ny110GZL4oWMaZAr91y2/54KZKx5zriWjBThJnYuxgU2sSuYhTFh
	A17qgPUakdQ1h+N79JdYV99jFHqrQiY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-QITxcKltM_izHHM2kTW3fQ-1; Mon, 02 Dec 2024 09:33:58 -0500
X-MC-Unique: QITxcKltM_izHHM2kTW3fQ-1
X-Mimecast-MFC-AGG-ID: QITxcKltM_izHHM2kTW3fQ
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aa51518b8d0so278596366b.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 06:33:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150037; x=1733754837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6Xej+sefl62+HuZJ02rOMvYBMjieqyUp/Rq6GPi75M=;
        b=OjZb4n0PCcLFYjuwsQDtWYTwvZvYnxN24kKUsXXSe6NeTHic/Kl/azg7bzQyVmebTv
         RB2d1xcjxdFupOGYYphoQp5mgv9TcciAH5Lpd8lq6D5gP7qDvGR50RcnW2W6WqCyGuWc
         v/0dUZKceNF+jFjTS3Fyg06Qd6CCBjn5BaXJXFWquzBMqO7Uj/JaPY7H4yVf1pQZzGrl
         HEKObvITqf5KWztgEuQhTEt+VQ1UOK5Tq63XoV89Z4I9Iv2skSxyGcDzeep/YG3CzS1W
         EGcXEP03f8tAOuMFZOV8RcxGtGp7XuIKdnHyYitoCdCrsh4+2/yqjDNnV6ShfWT5Aoko
         xKfA==
X-Forwarded-Encrypted: i=1; AJvYcCUc3QTKpAGoszbWZYmOeq09GaQz5sE+0oRepRBAjee2dTB6nxYkEkL9VROvLczibq24G7iRCav7n4sVBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKAmbgZPDq2sWxoHJvB8NKABwPSDXFRCuqXx7FT6sG+45YyH7D
	TFyswr7uwKyAOsOh1MXjVGhGTYUK46n0vX+8AdEz7rlpfEXQ35YS6JCkeUN4KkBVi/F9V1IyOoq
	NpXbfMD0HTrS3BNEnfw9XHtwW6dflJ40nqakdJTxBSIj9QYm4yAJaZbZQTSXq
X-Gm-Gg: ASbGncsLb5PfITVz5xaGfVqKuMBmqg1sznS8U4nMNrsE3kThLQ1/6N5+KlGE41wA2w6
	4C8gVD1ax+Mecgy6l04rtrdcfvgevLpTmynPkdkqTAq0l2XWFR3Eo3AUMXc3rfrilOXu6Drn4bz
	nc1QBbZ8rdmFtqck4nULFn0YIPm8CdNtL68CgQ6YD6FQTBMyKkO4vANTxSQ9ySdNKjsjCo/OpOK
	3iaB0oIQxrhnz+pKExtkh2r+AGwC78ktCPBsd46IGzJU1wSTQnq6g==
X-Received: by 2002:a17:906:3114:b0:aa5:427e:6af6 with SMTP id a640c23a62f3a-aa580ef3240mr1773024766b.3.1733150036755;
        Mon, 02 Dec 2024 06:33:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPHol0jCmNI2H8UjxKDJtgKrB4os1/jOlRU53xbQS9RZk2bYe0rO/MZNOZt8QSSYzr7GbqJw==
X-Received: by 2002:a17:906:3114:b0:aa5:427e:6af6 with SMTP id a640c23a62f3a-aa580ef3240mr1773021766b.3.1733150036328;
        Mon, 02 Dec 2024 06:33:56 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa599953f7esm512624166b.191.2024.12.02.06.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:33:55 -0800 (PST)
Message-ID: <6acfcc52-c547-4823-b8e2-4555ddc64085@redhat.com>
Date: Mon, 2 Dec 2024 15:33:54 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] media: uvcvideo: Only save async fh if success
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
 <20241202-uvc-fix-async-v5-1-6658c1fe312b@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241202-uvc-fix-async-v5-1-6658c1fe312b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Dec-24 3:24 PM, Ricardo Ribalda wrote:
> Now we keep a reference to the active fh for any call to uvc_ctrl_set,
> regardless if it is an actual set or if it is a just a try or if the
> device refused the operation.
> 
> We should only keep the file handle if the device actually accepted
> applying the operation.
> 
> Cc: stable@vger.kernel.org
> Fixes: e5225c820c05 ("media: uvcvideo: Send a control event when a Control Change interrupt arrives")
> Suggested-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thank you, nice patch, better then my original suggestion :)

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'll let this sit on the list to give others a chance to reply
and if there are no remarks I'll merge this next Monday.

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 4fe26e82e3d1..9a80a7d8e73a 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1811,7 +1811,10 @@ int uvc_ctrl_begin(struct uvc_video_chain *chain)
>  }
>  
>  static int uvc_ctrl_commit_entity(struct uvc_device *dev,
> -	struct uvc_entity *entity, int rollback, struct uvc_control **err_ctrl)
> +				  struct uvc_fh *handle,
> +				  struct uvc_entity *entity,
> +				  int rollback,
> +				  struct uvc_control **err_ctrl)
>  {
>  	struct uvc_control *ctrl;
>  	unsigned int i;
> @@ -1859,6 +1862,10 @@ static int uvc_ctrl_commit_entity(struct uvc_device *dev,
>  				*err_ctrl = ctrl;
>  			return ret;
>  		}
> +
> +		if (!rollback && handle &&
> +		    ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> +			ctrl->handle = handle;
>  	}
>  
>  	return 0;
> @@ -1895,8 +1902,8 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
>  
>  	/* Find the control. */
>  	list_for_each_entry(entity, &chain->entities, chain) {
> -		ret = uvc_ctrl_commit_entity(chain->dev, entity, rollback,
> -					     &err_ctrl);
> +		ret = uvc_ctrl_commit_entity(chain->dev, handle, entity,
> +					     rollback, &err_ctrl);
>  		if (ret < 0) {
>  			if (ctrls)
>  				ctrls->error_idx =
> @@ -2046,9 +2053,6 @@ int uvc_ctrl_set(struct uvc_fh *handle,
>  	mapping->set(mapping, value,
>  		uvc_ctrl_data(ctrl, UVC_CTRL_DATA_CURRENT));
>  
> -	if (ctrl->info.flags & UVC_CTRL_FLAG_ASYNCHRONOUS)
> -		ctrl->handle = handle;
> -
>  	ctrl->dirty = 1;
>  	ctrl->modified = 1;
>  	return 0;
> @@ -2377,7 +2381,7 @@ int uvc_ctrl_restore_values(struct uvc_device *dev)
>  			ctrl->dirty = 1;
>  		}
>  
> -		ret = uvc_ctrl_commit_entity(dev, entity, 0, NULL);
> +		ret = uvc_ctrl_commit_entity(dev, NULL, entity, 0, NULL);
>  		if (ret < 0)
>  			return ret;
>  	}
> 


