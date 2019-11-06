Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BD67F1361
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 11:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728364AbfKFKJn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 05:09:43 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40043 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfKFKJn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 05:09:43 -0500
Received: by mail-ed1-f66.google.com with SMTP id p59so18809097edp.7
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2019 02:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zgoCk5GioxlHgORY0p+mSpP1ABgkg+76ItCxty7i0rU=;
        b=lVCDDiFC7mB1HeXSorW1F0J1BJR+7gloIpo97XnohjxEkXdBWIevIFY48uSfzV39rH
         BS+GlH1E4U5nFkaJZhlP8XjSbdD+JY4EVMShNzwdroPHn2xtlllexaKs+O9+AfiE3NgV
         bqZh4C42KDLQE8hkmpPXZ6IwEuOnxmujCtWr1UKfZdgQm0l8AhMno+a71vwOaNIr35kS
         pDz2xvRsTvH3u/RO/7+54YoUZNdbRqCcx0wtmt/NvLzHcNimZ3+pehs4Y1z67IZZMAYR
         Vj/De4s/rKn0bUY6/t5BmOTAXirT0M3Bw59efk4w/DVcxcQtRkxPZWWOoo9wcPAx2Jw/
         I/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zgoCk5GioxlHgORY0p+mSpP1ABgkg+76ItCxty7i0rU=;
        b=ZXApUJ1xtd0Fhp7FCOpc7QHixqjm1oajPNvf50US5HQNf+5rLEdBIF1Wy3hmAejO0L
         up/WeXRuOVL4EZNpChYCRqPVOP9LbKTfXDVmENhFltTNHmk4Jc2NSMY37a2/DA8T4zhm
         sTbJJxrwIB+Zw+xeQAVewazBh8fkTg6J21/MgezQfKhanzXbCdkXBJvodHsi854CIxjL
         +uV1nf/ghQXAlYhhIwvoFvb+hIZ+3DPUkmF6YV6D95vAhQqkKAfq5r0jRjrfhl7x3qin
         gbvQK0kvaWKCC/XX7j4yZG7fWKhxmL14CI0zzM1EZ1mO3oE5xuOE9LGKN9fFauv8wx9e
         gFrg==
X-Gm-Message-State: APjAAAXRBR4ufNpty0bC0DcnsqHJplHbk9VpV/GB55gQ4YShFoZQyHyN
        MVUTF2LtWQVp3GEculFNyGkT7Q==
X-Google-Smtp-Source: APXvYqwzbGV1+GbZkbMKyaQhnDBzTxqEoRgZNpxwrhzpuynMbLgHk10WYVX44cgvvfB2ZRK1mtMC1A==
X-Received: by 2002:a05:6402:2042:: with SMTP id bc2mr1642226edb.167.1573034980828;
        Wed, 06 Nov 2019 02:09:40 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id s8sm1137900edj.6.2019.11.06.02.09.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Nov 2019 02:09:39 -0800 (PST)
Subject: Re: [PATCH] media: venus: remove invalid compat_ioctl32 handler
To:     Arnd Bergmann <arnd@arndb.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     stable@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@s-opensource.com>,
        Andy Gross <agross@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191106090731.3152446-1-arnd@arndb.de>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <09d4d99f-55cf-54a1-b51e-ad883446b75b@linaro.org>
Date:   Wed, 6 Nov 2019 12:09:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191106090731.3152446-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Arnd,

Thanks for the catch!

On 11/6/19 11:06 AM, Arnd Bergmann wrote:
> v4l2_compat_ioctl32() is the function that calls into
> v4l2_file_operations->compat_ioctl32(), so setting that back to the same
> function leads to a trivial endless loop, followed by a kernel
> stack overrun.
> 
> Remove the incorrect assignment.
> 
> Cc: stable@vger.kernel.org
> Fixes: 7472c1c69138 ("[media] media: venus: vdec: add video decoder files")
> Fixes: aaaa93eda64b ("[media] media: venus: venc: add video encoder files")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>

> ---
>  drivers/media/platform/qcom/venus/vdec.c | 3 ---
>  drivers/media/platform/qcom/venus/venc.c | 3 ---
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
> index 7f4660555ddb..59ae7a1e63bc 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1412,9 +1412,6 @@ static const struct v4l2_file_operations vdec_fops = {
>  	.unlocked_ioctl = video_ioctl2,
>  	.poll = v4l2_m2m_fop_poll,
>  	.mmap = v4l2_m2m_fop_mmap,
> -#ifdef CONFIG_COMPAT
> -	.compat_ioctl32 = v4l2_compat_ioctl32,
> -#endif
>  };
>  
>  static int vdec_probe(struct platform_device *pdev)
> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
> index 1b7fb2d5887c..30028ceb548b 100644
> --- a/drivers/media/platform/qcom/venus/venc.c
> +++ b/drivers/media/platform/qcom/venus/venc.c
> @@ -1235,9 +1235,6 @@ static const struct v4l2_file_operations venc_fops = {
>  	.unlocked_ioctl = video_ioctl2,
>  	.poll = v4l2_m2m_fop_poll,
>  	.mmap = v4l2_m2m_fop_mmap,
> -#ifdef CONFIG_COMPAT
> -	.compat_ioctl32 = v4l2_compat_ioctl32,
> -#endif
>  };
>  
>  static int venc_probe(struct platform_device *pdev)
> 

-- 
regards,
Stan
