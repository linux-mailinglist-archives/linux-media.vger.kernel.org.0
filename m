Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C63305FF200
	for <lists+linux-media@lfdr.de>; Fri, 14 Oct 2022 18:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbiJNQEW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Oct 2022 12:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbiJNQEV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Oct 2022 12:04:21 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBE25181D96
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 09:04:20 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id 137so4225325iou.9
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 09:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IsE/FYAnWpIQ57PTlUI6V6IRj4KnQO8XuB60JpxPjXU=;
        b=F+sUjb6aiIGLqT0IYjVG8m4+mDNlvCaQIuF+nIfBcQgHl3Xh4QqW6Qe7I4WJ9ZIlSK
         vYsHdt5uIDoOjaKSpu2vEKAh0MCLglIpvsxVyBLC4+u2MV5uyiRVHtWw1SuoDZ1C0Bw6
         73jACrlll4rmtQ5/mo8yd/EtBDfZqEX6VWklM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsE/FYAnWpIQ57PTlUI6V6IRj4KnQO8XuB60JpxPjXU=;
        b=8I+cCVpeb5woYhuUU4J3VdfnPWimxF9PRgXZYcuPrJ6WYudUDt8B1exKPe4G5kpV9j
         gyqncQn5CH4W1rL1qYZILnWVJqbcWaSlL4HkzsZvfeYyE8rnacjRGBJqnJfNyAsGR6LS
         YJFdsTQKAZVZJgTnz4l3rH/XEL2bzBcS+59gmVNdPXmXZfm11YKdhg2ON0zEc9IXSy/+
         Sc655jxCzcDikG6PHyA+tXhW0dPktDV7OWOgkcLMjB6LQZDRDGH8zaFHeCYDyyvSjBhh
         btGWOpMVzwkRjDMaJHBkDxt6qHFmoQCgCQYvErtVVeewycP4juWs983H32KLouL/MfcE
         IMaA==
X-Gm-Message-State: ACrzQf2h9F/wTWOW+ZVzTzps7LnPbfcbRegoExcxLSjGw1xRrueJDui7
        bRJtFkt3BZVIDzh7JNpMiOam/A==
X-Google-Smtp-Source: AMsMyM5a1BUlygz1RusUUU3DvEH7uQNUvmjyjnwQ6TRpHYlUqELWNUqMHb4/od7rtzxoONNqg1F3vQ==
X-Received: by 2002:a05:6602:2f0a:b0:6bc:8044:3316 with SMTP id q10-20020a0566022f0a00b006bc80443316mr2543297iow.87.1665763460259;
        Fri, 14 Oct 2022 09:04:20 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id l11-20020a92d8cb000000b002f592936fbfsm978967ilo.41.2022.10.14.09.04.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Oct 2022 09:04:19 -0700 (PDT)
Message-ID: <67a8244e-4d1a-f64b-7e8b-7b0433b1f93a@linuxfoundation.org>
Date:   Fri, 14 Oct 2022 10:04:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] media: vimc: Update device configuration in the
 documentation
Content-Language: en-US
To:     Dafna Hirschfeld <dafna@fastmail.com>,
        kieran.bingham@ideasonboard.com, linux-media@vger.kernel.org
References: <20221008215346.172559-1-dafna@fastmail.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20221008215346.172559-1-dafna@fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/8/22 15:53, Dafna Hirschfeld wrote:
> Since commit 9b4a9b31b9ae ("media: vimc: Enable set resolution at the scaler src pad")
> the configuration in the documentation does
> not work. Replace it with the configuration
> described in commit 9b4a9b31b9ae
> 
> Signed-off-by: Dafna Hirschfeld <dafna@fastmail.com>
> ---
>   Documentation/admin-guide/media/vimc.rst | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/media/vimc.rst b/Documentation/admin-guide/media/vimc.rst
> index 3b4d2b36b4f3..29d843a8ddb1 100644
> --- a/Documentation/admin-guide/media/vimc.rst
> +++ b/Documentation/admin-guide/media/vimc.rst
> @@ -35,11 +35,11 @@ of commands fits for the default topology:
>   
>           media-ctl -d platform:vimc -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
>           media-ctl -d platform:vimc -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
> -        media-ctl -d platform:vimc -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
> -        media-ctl -d platform:vimc -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
> -        v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
> +        media-ctl -d platform:vimc -V '"Scaler":0[fmt:RGB888_1X24/640x480]'
> +        media-ctl -d platform:vimc -V '"Scaler":0[crop:(100,50)/400x150]'
> +        media-ctl -d platform:vimc -V '"Scaler":1[fmt:RGB888_1X24/300x700]'
> +        v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=300,height=700
>           v4l2-ctl -z platform:vimc -d "Raw Capture 0" -v pixelformat=BA81
> -        v4l2-ctl -z platform:vimc -d "Raw Capture 1" -v pixelformat=BA81
>   
>   Subdevices
>   ----------

Thank you - I will apply this after the merge window closes and send it in
for an upcoming 6.1 rc.

thanks,
-- Shuah
