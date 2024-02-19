Return-Path: <linux-media+bounces-5425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D88A885A631
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 15:40:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95BCF2818BE
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 14:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F6E37155;
	Mon, 19 Feb 2024 14:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IwqOUN0X"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7031E539
	for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 14:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708353617; cv=none; b=P1S8rbXBYObM+OehZzfrMHWXepyk2DJ8/k/bp9GaipqAZSAAIl6vNzi/dChhyazjrNnVkm0CktyrAMnPEgpyZUu3d3LFXKSMxUg5NaB7FCASNOgnIOEXgZW7Hq3FIdXGAwhs6zKL0WG0NjtllvrszJMv00I7P26L3SvYygyRaCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708353617; c=relaxed/simple;
	bh=c0dJsyBwcHuvLiGGgERSuLn+RoZcLttcnBEYQqdHVD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aUeA9EwEAgEfhV0cYIWi8GGjNWEY6IfHta3fPwc9SzDeTm8mLRdk+/6VZyU/0peKwquSY4jzbgEIINYK3l4IKHkTDe5wR2lKeG0V7L/ucAI6dpCGzhv4mOQSf0oq90/bMr1vI3Z+RHbfEsE3Z+90prx0C8Q6PQSRJ1N7yRozocE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IwqOUN0X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708353614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TVkatn/OQ7E91SGBo3Ophlv8x9VJieUAAbT6nXbzjT8=;
	b=IwqOUN0XBKlhkXf2CjeMx7/TDfXiGdBfkxsigkCr1V8mlK/e33LB7Z1GNlbJZzkmfi46pH
	z0Jw+iPQBdnZ0NS4Xrl/DFEQ+yJK27ZlgV3LxJvXERYmCJYs4N/PI2dmzWR0do4GrywEw4
	iehStOnqTZAs9AGHsv8r8moRoJjLqp4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-SLEgJ7QpN0S4Y21BXjWA-w-1; Mon, 19 Feb 2024 09:40:10 -0500
X-MC-Unique: SLEgJ7QpN0S4Y21BXjWA-w-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-564347c68b9so846802a12.0
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 06:40:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708353609; x=1708958409;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TVkatn/OQ7E91SGBo3Ophlv8x9VJieUAAbT6nXbzjT8=;
        b=T6EV8X8AZapj2mDITdJi0fvCcs9+okjPvsKCJkHoc7QqJZK+yyoMognoZpUnbUg7sh
         CzOxTt6OahwwSdsj++En40h2ZgF20wRs4Z/+E0Fjcf17hqE2IMslZIHKZgvUDqf4Gfu1
         g0qMTML/2kYCQ5LChqcaDyv6hGyMNKO8/3w9Kk9xAtXmTEwP0+hHgBao7pYICmikRisk
         Ah/+j+J056v1pFSvL+GLS0LYFkum5hkQAptJt9UWFYyJLy+WVEzI7DPS7xwyL4Nv8J7N
         LIcl7ZaMXISTj0GgzvYc6N0GcQ+oyQRLiVzWqKbgixbuXfNh1Sz0RmUc5ofgmPvvcz0D
         v42g==
X-Forwarded-Encrypted: i=1; AJvYcCV5//YEGP09jnOORlHTybV89WGyIkosuNzyKl0sHmy05TEf/eu74a/zntzZp/57d73bDUztHK/NzmH4fBPJ7/O0GKH0VX1vuSCgrxI=
X-Gm-Message-State: AOJu0YwkLn/W6UMqJBhV5iUD9I4JRro1vLEVKXJF2ezB8Sddz40FPIeG
	1f5pIxZzyveB9DA2LqlTD6zAHU6DE7OjR6FzZprBJS1/fYDe3MyxeEPhtNjv2udxaYg+laGfNwb
	s/Ftl3YYyTHUxxHSLmFEMOkCSiIAXJKbbeKutJl7X4KuOSYn3ynRWu+/wYXJ/y+p3acEF
X-Received: by 2002:a05:6402:1a50:b0:564:8adf:9a7f with SMTP id bf16-20020a0564021a5000b005648adf9a7fmr1350200edb.17.1708353609021;
        Mon, 19 Feb 2024 06:40:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFonjtZ9ZNXPUOxp1t4AJBzSusJ0qly5l3swuhtwSLD7kQlVLaL4nj3GKd6uQLrNkpG+blVkg==
X-Received: by 2002:a05:6402:1a50:b0:564:8adf:9a7f with SMTP id bf16-20020a0564021a5000b005648adf9a7fmr1350185edb.17.1708353608737;
        Mon, 19 Feb 2024 06:40:08 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id q25-20020aa7da99000000b005645ee828a1sm1462993eds.94.2024.02.19.06.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 06:40:08 -0800 (PST)
Message-ID: <007655fb-d56a-4d6e-a19f-46e418f0a4e5@redhat.com>
Date: Mon, 19 Feb 2024 15:40:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] media: atomisp: ssh_css: Fix a null-pointer
 dereference in load_video_binaries
Content-Language: en-US
To: Zhipeng Lu <alexious@zju.edu.cn>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Hsuan
 <hpa@redhat.com>, Dan Carpenter <error27@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Brent Pappas <bpappas@pappasbrent.com>, Alan Cox <alan@linux.intel.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240118151303.3828292-1-alexious@zju.edu.cn>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240118151303.3828292-1-alexious@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/18/24 16:13, Zhipeng Lu wrote:
> The allocation failure of mycs->yuv_scaler_binary in load_video_binaries
> is followed with a dereference of mycs->yuv_scaler_binary after the
> following call chain:
> 
> sh_css_pipe_load_binaries
>   |-> load_video_binaries (mycs->yuv_scaler_binary == NULL)
>   |
>   |-> sh_css_pipe_unload_binaries
>         |-> unload_video_binaries
> 
> In unload_video_binaries, it calls to ia_css_binary_unload with argument
> &pipe->pipe_settings.video.yuv_scaler_binary[i], which refers to the
> same memory slot as mycs->yuv_scaler_binary. Thus, a null-pointer
> dereference is triggered.
> 
> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>
> ---
> Changelog:
> 
> v2: change fix approach to set mycs->num_yuv_scaler = 0 in
> load_video_binaries. Change the fix tag to correct commit.

Thank you for you patch.

I have applied this patch to my media-atomip branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

and I will include this in my next media-atomisp
pull-request to Mauro.

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index f35c90809414..638f08b3f21b 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -4719,6 +4719,7 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
>  						  sizeof(struct ia_css_binary),
>  						  GFP_KERNEL);
>  		if (!mycs->yuv_scaler_binary) {
> +			mycs->num_yuv_scaler = 0;
>  			err = -ENOMEM;
>  			return err;
>  		}


