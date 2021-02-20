Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6E13206B7
	for <lists+linux-media@lfdr.de>; Sat, 20 Feb 2021 19:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbhBTSou (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Feb 2021 13:44:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbhBTSos (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Feb 2021 13:44:48 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D516C06178A
        for <linux-media@vger.kernel.org>; Sat, 20 Feb 2021 10:44:08 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id y7so40573108lji.7
        for <linux-media@vger.kernel.org>; Sat, 20 Feb 2021 10:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tykDSNBQyBWy4Y86qvV5HFG7OJitL0SuiJFGnG8I3rM=;
        b=r0EPXWZGv4/NlyMklT9yopa3l5vE9pVO1jbbfvz27OK0kq234TDt/DfTzaH+LOQaN2
         CN+24t2KAstxrkNR+SSTdp7+hoaYdVpP8VOVDFW5JJR59j2WegQBkjOw5cyx+O6mHOLp
         Hzbej3lEYuv/5z8XS8enXoet42DgdO09GmkwUDNmIp7jovpmqM3oKExc4IZhIXDVEbYD
         oHXzjfWIzDQWwX/HLUg1m5NRdj9I3xkLoaWbvaCWd8jBgwcGdtEijkL6DtPRlfh0xsDc
         t3avfZSrtRBY/13tAQzixddlA+PG5Ka3hMzSlHW6gxPvhzTivscvTMEjQurfN9tlJIdy
         sY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tykDSNBQyBWy4Y86qvV5HFG7OJitL0SuiJFGnG8I3rM=;
        b=o6c4hrOaDo3wDYgYgSLCcQmWhkTXd/X1tw3iUq2FmQBtwSpKSSlwNRCtHK4FEzWErI
         bQI79ELo2OEVLwY8nEj6bEScCO2UdAe6UFYyxQGa2XH3qmd3qW6XFdAdamEIOENJF72k
         iDbnObYVLp1UwPb0Qrl1wMBy/5OZyXCi6hMK2B2JXa86kN+Un+qnN1cZGMQhsVFKZbMN
         DyxJ9M8ejYDBp73LKrujRe65VAEj0p1BHbBt8uoGTYTdNIkNhUStbU37l2/W9yvnVGbL
         hKedW9pW2miPw9grkQJeG4wIMoPC3vPqE12/+fwMEPTHIMK79rimQaSHxI1FFnJ00wCK
         I47A==
X-Gm-Message-State: AOAM533G+KfmZPkTaBYtsDuQpfpXP7DWm2JAsLgWVJiezKAq3ir6Jkl9
        Ws2pRk619SGLa9iFMqLiO4pN9w==
X-Google-Smtp-Source: ABdhPJzzCOoRpf3qhkAYfl757QlNomIJ3iDADZ5FbjXc75O1jpMKdr61UWhI1bU8+vRk9vhkonwT5Q==
X-Received: by 2002:a2e:948:: with SMTP id 69mr2098073ljj.480.1613846646623;
        Sat, 20 Feb 2021 10:44:06 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id x31sm1353093lfu.10.2021.02.20.10.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Feb 2021 10:44:05 -0800 (PST)
Subject: Re: [PATCH v5 01/22] media: camss: Fix vfe_isr_comp_done()
 documentation
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, todor.too@gmail.com,
        mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20210217112122.424236-1-robert.foss@linaro.org>
 <20210217112122.424236-2-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <69de93cd-8dee-56f2-12f8-317093c462f0@linaro.org>
Date:   Sat, 20 Feb 2021 21:44:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217112122.424236-2-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Thanks,
Andrey

On 17.02.2021 14:21, Robert Foss wrote:
> Function name is comment is wrong, and was changed to be
> the same as the actual function name.
> 
> The comment was changed to kerneldoc format.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> Changes since v1
>   - Bjorn: Fix function doc name & use kerneldoc format
> 
> 
>   drivers/media/platform/qcom/camss/camss-vfe.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index fae2b513b2f9..94c9ca7d5cbb 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -1076,8 +1076,8 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
>   }
>   
> -/*
> - * vfe_isr_wm_done - Process composite image done interrupt
> +/**
> + * vfe_isr_comp_done() - Process composite image done interrupt
>    * @vfe: VFE Device
>    * @comp: Composite image id
>    */
> 
