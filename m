Return-Path: <linux-media+bounces-3626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F86482BC7F
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 09:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F49D287DDD
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 08:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C55553E35;
	Fri, 12 Jan 2024 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NxgG80tT"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA7A537F1
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 08:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705049363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCR5bRfxgHPmBloCia4lyHhepnFKs/EyakChbsYrBIQ=;
	b=NxgG80tT0yvE4kev9NnA+Nqnzu1kmpMKft4HoOe62B7ec94U8e2K/d1ap3ftYWfsLQwEAZ
	1yu4HadVY6/IKHmDZjrZXyX2oelJPyZcDSr14CECdXHUoxFYkJSxnp2/y+lVwTVOzgAPSG
	m2KLCFvjQPONScI3467ujkJ2w6I49GM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-rI1eTgZhNu-2LJXYBP1tZA-1; Fri, 12 Jan 2024 03:49:21 -0500
X-MC-Unique: rI1eTgZhNu-2LJXYBP1tZA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a2b6c2a5fddso182010166b.1
        for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 00:49:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705049360; x=1705654160;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCR5bRfxgHPmBloCia4lyHhepnFKs/EyakChbsYrBIQ=;
        b=r26/VI5LldqMQImxehAcxlHZH2bgR8et+HsvjnzI8G0Lg6oZh5HCJ4z8/JAqQX5zI7
         SjRoTnYte7JbFBlyo2/mrw9WKW3GwdAAinGatfK9rlLn9VZy4bbaS8uIN2twkBRzEKl8
         Bw+bXhaJDPVethih3u5jnRr8vYm6fN71UgSikfsi65gS3ESa0TwYTU16d6n1pz4PtkLn
         AdJPfqh1XdIRApaEefQoWysz5SPwrMhcgdRSIzzlnuOc2ryZnHloMTM4/lYVsVLDTIou
         vXCOVIK9yqAtvua2LllJPA9JlANkW0nPWc6ysVlxd8DxfyOH95avuo2dS6hiPzztMutM
         Rllw==
X-Gm-Message-State: AOJu0YxsSSpU2dAVzgx09oSfNloR2npCqMSgdtFCq7hJqXlYWhwEO9xF
	/jU4zhBaCaujaJT6QQjbG+RKDtNWPvTsdKtWN+n/9PbSGpWZF9tOAYYENnIXb+Qj9I4reYliklA
	ZSh6GUE/jzm5xDcFod06nSHzyh8Xz86M=
X-Received: by 2002:a17:906:b155:b0:a27:45a2:e5f4 with SMTP id bt21-20020a170906b15500b00a2745a2e5f4mr380566ejb.14.1705049359989;
        Fri, 12 Jan 2024 00:49:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJn4FR+hzfQY89lHJ8M2tFUtayLT65NlizQ9Ox1LTrqzTHrjpKkjHw0yowZCCByL3QkK8Xyw==
X-Received: by 2002:a17:906:b155:b0:a27:45a2:e5f4 with SMTP id bt21-20020a170906b15500b00a2745a2e5f4mr380561ejb.14.1705049359709;
        Fri, 12 Jan 2024 00:49:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k25-20020a170906a39900b00a27a25afaf2sm1553804ejz.98.2024.01.12.00.49.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jan 2024 00:49:19 -0800 (PST)
Message-ID: <5dd12651-232d-41f2-afa4-2a3e5c127969@redhat.com>
Date: Fri, 12 Jan 2024 09:49:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: ssh_css: Fix a null-pointer dereference
 in load_video_binaries
To: Zhipeng Lu <alexious@zju.edu.cn>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kate Hsuan
 <hpa@redhat.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Dan Carpenter <error27@gmail.com>, Brent Pappas <bpappas@pappasbrent.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240112083421.3728017-1-alexious@zju.edu.cn>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240112083421.3728017-1-alexious@zju.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Zhipeng Lu,

On 1/12/24 09:34, Zhipeng Lu wrote:
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
> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> Signed-off-by: Zhipeng Lu <alexious@zju.edu.cn>

Thank you for your patch. I believe it would be better to fix this
like this:

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 1d1fbda75da1..d566c5417448 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -4690,6 +4690,7 @@ static int load_video_binaries(struct ia_css_pipe *pipe)
 						  sizeof(struct ia_css_binary),
 						  GFP_KERNEL);
 		if (!mycs->yuv_scaler_binary) {
+			mycs->num_yuv_scaler = 0;
 			err = -ENOMEM;
 			return err;
 		}

Can you please submit a new version using this approach ?

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/pci/sh_css.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
> index f35c90809414..eb43f4e99d02 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css.c
> @@ -4936,9 +4936,10 @@ unload_video_binaries(struct ia_css_pipe *pipe)
>  	ia_css_binary_unload(&pipe->pipe_settings.video.video_binary);
>  	ia_css_binary_unload(&pipe->pipe_settings.video.vf_pp_binary);
>  
> -	for (i = 0; i < pipe->pipe_settings.video.num_yuv_scaler; i++)
> -		ia_css_binary_unload(&pipe->pipe_settings.video.yuv_scaler_binary[i]);
> -
> +	if (pipe->pipe_settings.video.yuv_scaler_binary)
> +		for (i = 0; i < pipe->pipe_settings.video.num_yuv_scaler; i++)
> +			ia_css_binary_unload(&pipe->pipe_settings.video.yuv_scaler_binary[i]);
> +		
>  	kfree(pipe->pipe_settings.video.is_output_stage);
>  	pipe->pipe_settings.video.is_output_stage = NULL;
>  	kfree(pipe->pipe_settings.video.yuv_scaler_binary);


