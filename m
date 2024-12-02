Return-Path: <linux-media+bounces-22453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCB69E0647
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 16:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0203816AA7E
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 14:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCFD20CCDC;
	Mon,  2 Dec 2024 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fIvzC6Zw"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC17208992
	for <linux-media@vger.kernel.org>; Mon,  2 Dec 2024 14:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733150703; cv=none; b=VrbWNZQgfActx2rTt1cjXLfQE8+MyNZmREqajnzy6gYuQrrhIDEbbn6hZGj3DkGWAWpWMVuigfEv7055xFPO6B9zpKSN9X08DCPjLtrYMGNmjP5hYH+w9CXmu+gF3v0UN63SjcffdJG9JV/E81r0rSc67B9AnYwKnZyT5f20tv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733150703; c=relaxed/simple;
	bh=J6NojA2RZH+RoRRnvD/OYyIay8Vieq6tR0DB9lycCcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJQmSazpeP1YayBzyQXOqOY5idwXbmT93Cu06E3T9nLpCjgUThMHc6H4G6Sq8vADXl9htrlz5HAIIjmOuxstR1rd1dQldrt5APsG6axgFCJPc/ZkJ9Jz0tcRJ2MooEiVUGXdy4Qjp500uttTo0mqvBVn2PrJoTiM9CFIICGwe3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fIvzC6Zw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733150700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qh0LHQ0l/zAThehTKofaSdXJERCbtOgQsR2kqyENj+s=;
	b=fIvzC6ZwJVaDmO5Mqyc2xn+XEF31RTqNWafnjDV9MolpjMo/ifiNbDsB2s3xl3J1dKZMRx
	FoGLON5utZm9wKUUMmEyUCaIZSnnXK/EgRVxmCMCXPjJ2YeihEcaBCX7JhVBvyf3xsVmiZ
	1Dpyt7w5aVgunc2oZmW0mirgBpyLX/o=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-467-JIO8nVgKP8yPWM7GdcIhNQ-1; Mon, 02 Dec 2024 09:44:59 -0500
X-MC-Unique: JIO8nVgKP8yPWM7GdcIhNQ-1
X-Mimecast-MFC-AGG-ID: JIO8nVgKP8yPWM7GdcIhNQ
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa55354400eso505706866b.1
        for <linux-media@vger.kernel.org>; Mon, 02 Dec 2024 06:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733150698; x=1733755498;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh0LHQ0l/zAThehTKofaSdXJERCbtOgQsR2kqyENj+s=;
        b=sQZJ60g1v4W1ysJJnLXZjtZqGGZJBiOHFrc4MX3CiMhRJ8oEW0Mwzs2uNn2xxwVbqj
         nFnl39eAdsMERs/zoHpEXOc7xT+jS5N/qM3ek9/51zhz/mVTM4kgulIMAoX2xaYqKnSW
         KUASE+UHSnaDsM0okatZelXd3P/aiBsjCZ63gRvecL9PRU5AOyZEGlcpfold9Sw79HWb
         F9hNvpp3UX7WTIdg/3TAxAmK6xDPebbYsVhoQKrm+uRvYo0U+bWhP+EshKeLjtyxCRT0
         3yLPdQIdhNCHfElLCdz6wMYb0P15ivOhJ/vVK3p1IwRqHfGE8dGsN+FBy5fliToUJenX
         j+FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhoEkUcYV+3G8TOy+/9QTWbZpEzL518IjOg47oQL+hikODlJKlvlL4Xo2pD8D/FTqnqDXbd662MkucAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBC7wGGLK/wbZ3KiDi16sxNrj7MWdVaStzoNX6Yw30pnqyS9pa
	fBQzbQReNY+Rv0WJBnElMs3StMTORLj8p8ug6V5A7dHxDD9jWiZa+k4GrPoT9YX2WELkeEsIWHV
	r9wecsZZDuFZ7lmkLpVJBehaqwogdXxfeXpuWYbj1dnRKP+7uGbLnIo5Jnx/2
X-Gm-Gg: ASbGncsn/QjcspPWx0MJdor1C3DiMsw43baw4mkmdJlZ7WQUC0XY4KZOHbX6SxVSdC1
	WJsksaeHa/ttx+HN1EHS4p0oW6Qb2KEYctX89GvzR8nGcqIaHD/cZOkuV4R5PNaQscq8ffI3xOW
	EgfTJFC+0o6orVbcQPxwGoIA0iE56VpR5Rg9XHI7xnc+TSMofNQAhROFoHelsz5cINGR5nCCX+P
	tcI3yOS12V/u3C7XsQe88Za72zwt9EGSGpna5aLU739/W3A2qvROQ==
X-Received: by 2002:a17:907:31c4:b0:aa5:ee58:5b0b with SMTP id a640c23a62f3a-aa5ee585b94mr57507066b.25.1733150698551;
        Mon, 02 Dec 2024 06:44:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ5xsPPDw4cMz2OuXoK45oswDh5+JI1Ux9Dyy0RZYl3J0FpDJcTTmFFvcexFdg7ZUlQCxJ0Q==
X-Received: by 2002:a17:907:31c4:b0:aa5:ee58:5b0b with SMTP id a640c23a62f3a-aa5ee585b94mr57503366b.25.1733150698102;
        Mon, 02 Dec 2024 06:44:58 -0800 (PST)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c19b5sm514217666b.5.2024.12.02.06.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 06:44:57 -0800 (PST)
Message-ID: <0531da34-d35f-4f46-be14-a9f864f38784@redhat.com>
Date: Mon, 2 Dec 2024 15:44:57 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] media: uvcvideo: Remove redundant NULL assignment
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241202-uvc-fix-async-v5-0-6658c1fe312b@chromium.org>
 <20241202-uvc-fix-async-v5-4-6658c1fe312b@chromium.org>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241202-uvc-fix-async-v5-4-6658c1fe312b@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2-Dec-24 3:24 PM, Ricardo Ribalda wrote:
> ctrl->handle will only be different than NULL for controls that have
> mappings. This is because that assignment is only done inside
> uvc_ctrl_set() for mapped controls.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/media/usb/uvc/uvc_ctrl.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
> index 576e3854be91..e90bf2aeb5e4 100644
> --- a/drivers/media/usb/uvc/uvc_ctrl.c
> +++ b/drivers/media/usb/uvc/uvc_ctrl.c
> @@ -1672,10 +1672,8 @@ bool uvc_ctrl_status_event_async(struct urb *urb, struct uvc_video_chain *chain,
>  	struct uvc_device *dev = chain->dev;
>  	struct uvc_ctrl_work *w = &dev->async_ctrl;
>  
> -	if (list_empty(&ctrl->info.mappings)) {
> -		ctrl->handle = NULL;
> +	if (list_empty(&ctrl->info.mappings))
>  		return false;
> -	}
>  
>  	w->data = data;
>  	w->urb = urb;
> 


