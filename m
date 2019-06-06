Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89A9437F27
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 22:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727665AbfFFU5W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 16:57:22 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44651 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727251AbfFFU5U (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Jun 2019 16:57:20 -0400
Received: by mail-wr1-f68.google.com with SMTP id b17so2721460wrq.11
        for <linux-media@vger.kernel.org>; Thu, 06 Jun 2019 13:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yc3mIWAOmzHLsJR8ETFapoAFaIyvxuHseTv4ycdMJAA=;
        b=HfDVpn9rD1xoy6TiwTnp55C660rqvMS7UbuxsqaxbKuxOVCCCyXf/NFuK0R6wNw5e1
         iT3FG4KKohgCds+EzsVs/xOqcJyfiSv8LJyESbdXog9CfwvnSHw0iIr0OivkDwgcSLLe
         VwaiURO5zaRUphb3Ux5P5ACJDJmGKk8GXEm29+xKm+ez9IMjXq1gtadxcb7GmbZ+gFaV
         57nEgBaUd2Blq/aAreHgJzRoUPDudyyrqeClz3UeC2IV8KO9moXT17A51wgrOCxH0vMF
         hXFMwWz6+B+qJpI4kFc0lI2XJW3WqYS4rzlLoJvoS3KJU0Voy9EmP4uk5NsdfT+58Ju6
         rwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yc3mIWAOmzHLsJR8ETFapoAFaIyvxuHseTv4ycdMJAA=;
        b=UhhEqkD2zGdECmtkZK4hHbdbyxigFg1hMGkMUCM4PIe5A73JWO+OoKLfKg2hMyiYXp
         wUWvFPDEI3UPeJJQRBI7JubMi2wYWdXsYmfp2Oo6d7F65H5QF3FQtKujR5iRTH6EppqK
         I9M8LAxzd+GXHY9EVZhdZPP7nVyuAdEaKMPo9nRxwP8PvP5gtwmoQajbJSUAErBp7d5p
         PmpDcEUUHh5oP/ie5Ja5ET53m/5de1xGBDSWtXedWTRjI3CwTzFoFxoqPKvwu0hfxZ7N
         KNVlpTc/+PLzeCRJl52cqNL1iYMEFuDRTCsxzf7lASwwDe46U/awRw9kCL2UJamMQGg1
         8Uqw==
X-Gm-Message-State: APjAAAW7uAe/omT6a8RNMl55TS0tsL86QtI6e1/d93e7kp2kV0vyzijt
        rt0L4MYaBHJJfQtxbxM4AaqOFQ==
X-Google-Smtp-Source: APXvYqwXj2etJ/M3sp849BOhuQAtV/gHqw0dA6C4Q5N+pFvKjsOwzoiYWXPOc4OBixtAveLznLnCSQ==
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr15283767wrt.290.1559854638401;
        Thu, 06 Jun 2019 13:57:18 -0700 (PDT)
Received: from ?IPv6:2a02:587:1936:1900:9d54:196a:5d8d:4379? ([2a02:587:1936:1900:9d54:196a:5d8d:4379])
        by smtp.googlemail.com with ESMTPSA id x11sm45119wmg.23.2019.06.06.13.57.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 13:57:17 -0700 (PDT)
Subject: Re: [PATCH] Revert "media: hfi_parser: don't trick gcc with a wrong
 expected size"
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:QUALCOMM VENUS VIDEO ACCELERATOR DRIVER" 
        <linux-media@vger.kernel.org>,
        "open list:QUALCOMM VENUS VIDEO ACCELERATOR DRIVER" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190605201941.4150-1-jonathan@marek.ca>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <59d458b5-8c29-1c66-ea39-b678889e25cc@linaro.org>
Date:   Thu, 6 Jun 2019 23:57:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190605201941.4150-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonathan,

I sent a fix for that here [1] and Mauro already taken it.

regards,
Stan

[1] https://patchwork.kernel.org/patch/10963369/

On 5.06.19 г. 23:19 ч., Jonathan Marek wrote:
> This reverts commit ded716267196862809e5926072adc962a611a1e3.
> 
> This change doesn't make any sense and breaks the driver.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/media/platform/qcom/venus/hfi_helper.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index 34ea503a9842..15804ad7e65d 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -569,7 +569,7 @@ struct hfi_capability {
>   
>   struct hfi_capabilities {
>   	u32 num_capabilities;
> -	struct hfi_capability *data;
> +	struct hfi_capability data[1];
>   };
>   
>   #define HFI_DEBUG_MSG_LOW	0x01
> @@ -726,7 +726,7 @@ struct hfi_profile_level {
>   
>   struct hfi_profile_level_supported {
>   	u32 profile_count;
> -	struct hfi_profile_level *profile_level;
> +	struct hfi_profile_level profile_level[1];
>   };
>   
>   struct hfi_quality_vs_speed {
> 
