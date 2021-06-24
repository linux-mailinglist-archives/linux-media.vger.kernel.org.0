Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2DF83B26B8
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 07:22:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbhFXFYa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Jun 2021 01:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbhFXFYa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Jun 2021 01:24:30 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C04F3C061574
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 22:22:10 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id a16so6059398ljq.3
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 22:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MaHQNN1uIEh60sl3JhLhmfuVPnwJYmbKYFL30K/miDk=;
        b=wOtDljlo77yLlHTV3c4ifq4N6M1CkZfITEE+y1gJxnDeLqmXDXBCsQjh1qeIoVp5r6
         DMfcIznqcmidir7ypQZUUbUthjNMyoaBIRD2TYTf94AxPZWihdzfQ3iMl08ALRoWNQeV
         uhBBIzFeEJ1KgDm8aPbvDGNIGG0WN4xEWdADMYknyQm5m6OImWY30B9kSnaaBIAx64Hz
         0cSFEO/JWxqJNBmZkmBFu9Zbtq3fwp9AVCodhRnAn8cXnGtiLRKJhGOKTl+j9jpoPWc+
         ne1/a91Y38gt0ejYDVHagntGC9X8X4TRvMuppD0Vxq9XW5AiRyAKr7EtZ6XxCxGXPVjO
         pVXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MaHQNN1uIEh60sl3JhLhmfuVPnwJYmbKYFL30K/miDk=;
        b=L6hJZcikI6sMZ6vnFNPUnnCe6Ht/pmO5s6MWA7HUlf+BV1bqkstykKAIddGHOA5b3N
         NusxSBmWT7XH3kmZKXHITo9/FrznM5HP1vzueX/XsMReSBzt5gaOPi1oB02UODKnJMKt
         dsN5XdRG3zNtlEeq+thqThC8IDPiPdZBVvQNF7XxvOCyUIXmjGukKZodMDCzuH3FRAMQ
         7UcNpqEpUZImC0R9TzAa+19izMyNWmw8Wv1bxIz5cigrg2TcqijORq+YYPYKpmtL9n/u
         PTCx+0ElYllUftVbI9sV+zatxdOoOMiytlPDkrO3g7P1OHUwf3ZVIbWykvmux6Jsz+zy
         9xww==
X-Gm-Message-State: AOAM531Ijdb95sSrJbAGvj0PF5eq4PtqG+IitVJaSAQh8XtWCabd+GWq
        2IUC88k75qlu7EZFktMVCX+c8g==
X-Google-Smtp-Source: ABdhPJwmVL0tULXDq7rk+67cKWU4EGnFh7WlddH0h6017KWVQrSRtZ+CmWmT+bAHkV6jzD2hQNKkSQ==
X-Received: by 2002:a2e:a78d:: with SMTP id c13mr2580898ljf.0.1624512129143;
        Wed, 23 Jun 2021 22:22:09 -0700 (PDT)
Received: from [192.168.88.254] ([85.249.44.185])
        by smtp.gmail.com with ESMTPSA id w8sm106911lfp.209.2021.06.23.22.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 22:22:08 -0700 (PDT)
Subject: Re: [PATCH 6/6] Documentation: v4l: Fix V4L2_CID_PIXEL_RATE
 documentation
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <20210622112200.13914-1-sakari.ailus@linux.intel.com>
 <20210622112200.13914-7-sakari.ailus@linux.intel.com>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <3018cfbb-8363-c952-4742-a0cf05eb0ac5@linaro.org>
Date:   Thu, 24 Jun 2021 08:22:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622112200.13914-7-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for your patch!

On 22.06.2021 14:22, Sakari Ailus wrote:
> The V4L2_CID_PIXEL_RATE is nowadays used to tell pixel sampling rate in
> the sub-device's pixel array, not the pixel rate over a link (for which it
> also becomes unfit with the addition of multiplexed streams later on). Fix
> this.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Thanks,
Andrey
> ---
>   .../userspace-api/media/v4l/ext-ctrls-image-process.rst         | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> index 37dad2f4df8c..6d681af95624 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-process.rst
> @@ -38,7 +38,7 @@ Image Process Control IDs
>       of this control is Hz.
>   
>   ``V4L2_CID_PIXEL_RATE (64-bit integer)``
> -    Pixel rate in the source pads of the subdev. This control is
> +    Pixel sampling rate in the device's pixel array. This control is
>       read-only and its unit is pixels / second.
>   
>   ``V4L2_CID_TEST_PATTERN (menu)``
> 
