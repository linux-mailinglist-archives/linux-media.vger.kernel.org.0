Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 487C63206B1
	for <lists+linux-media@lfdr.de>; Sat, 20 Feb 2021 19:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhBTSnL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 20 Feb 2021 13:43:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbhBTSnK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 20 Feb 2021 13:43:10 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A2BC061786
        for <linux-media@vger.kernel.org>; Sat, 20 Feb 2021 10:42:29 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id g1so36717201ljj.13
        for <linux-media@vger.kernel.org>; Sat, 20 Feb 2021 10:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=LS5gwKcMHR9sdDFFvyyOOfE/sEKmvwhv6AyHy6Ue0Eg=;
        b=CxRwsvrkffeovIBHK7QTB89JlhPdqIfqw+OlXY+dk1cV4IBWxveisxrcUXMAzaouwX
         fCV67iU6F7wX58CSAB5bIhAZryiPW4kLYNGaSHKwHyZfiC3BJaxC8F8KyC//7Sr9kedd
         k/1Z1c5M9zpDpPUVPZTbt3wjaCQILE4AU3eRYQr9gUWqgLvDhdPANHX6twqvn52BSM9d
         /XVXHjsqNzgP19683zUFeWOvXII9YAEt77lIPj9EDecTQ2EJZTbTZwboEFHJFWKYWFO2
         Yw/69e/r8XLUYqeR2buSTRgqQGY5iAHXuDqg9R3jh1hm9KKUmurs62Vy6ubPsfD2xqan
         T5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LS5gwKcMHR9sdDFFvyyOOfE/sEKmvwhv6AyHy6Ue0Eg=;
        b=X54dxHNaRZ70jsnOcBz3chpdjB0BnMGBpnVdD3N4WtmLrr2EwVI9w9Pi7a56uGrv5W
         +qHQZWnTSFbfiNcASoqW+YgOpkYemRCYKmLXjU3UHA5vHCtEkzS1VNSnYCeNILhNRP9n
         92sKIysZ1/QxEEvjJf0BiTq/ltsZh4iG2ZpTLr78/M1B5i1IYiy4cuGbNQiapTPK0jb4
         gWVOPdlP8aIXADIuQ+E7UnWbVc0qtjK4fIEFFt4z9s/MI4lNGyCEIJznN0K75wAliDqa
         56yIGK8uaLvvyAzkhmQB0ULdMyJeT96wK57YGm9tcFTnjzZI94fprgDBx+Df15iA104S
         +Xcg==
X-Gm-Message-State: AOAM5330JKHOFDdxXCh+v0WrNAIQF8wHyuGT/jrdl+eoVNV5xqJez1Mk
        rVX2vApuhaF3M+8JSbsGctlwUg==
X-Google-Smtp-Source: ABdhPJy4Ons8DzOVQF9Alozjt1JiZgxRKMkzCccYD/nKdhBwPokycuN7WiTTNWnzO+LvOxU2rXYJ4g==
X-Received: by 2002:a2e:9707:: with SMTP id r7mr575046lji.359.1613846548141;
        Sat, 20 Feb 2021 10:42:28 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.69])
        by smtp.gmail.com with ESMTPSA id i30sm1316467lfc.154.2021.02.20.10.42.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Feb 2021 10:42:27 -0800 (PST)
Subject: Re: [PATCH v5 04/22] media: camss: Add CAMSS_845 camss version
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
 <20210217112122.424236-5-robert.foss@linaro.org>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <17de547b-a473-129e-62a1-f453d5f9881b@linaro.org>
Date:   Sat, 20 Feb 2021 21:42:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210217112122.424236-5-robert.foss@linaro.org>
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
> Add enum representing the SDM845 SOC, which incorporates version
> 170 of the Titan architecture ISP.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
> index 3a0484683cd6..46e986452824 100644
> --- a/drivers/media/platform/qcom/camss/camss.h
> +++ b/drivers/media/platform/qcom/camss/camss.h
> @@ -66,6 +66,7 @@ enum camss_version {
>   	CAMSS_8x16,
>   	CAMSS_8x96,
>   	CAMSS_660,
> +	CAMSS_845,
>   };
>   
>   struct camss {
> 
