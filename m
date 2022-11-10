Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18C266247AC
	for <lists+linux-media@lfdr.de>; Thu, 10 Nov 2022 17:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232447AbiKJQ41 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Nov 2022 11:56:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbiKJQ4Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Nov 2022 11:56:24 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EDA18E19
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 08:56:23 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id o13so1289268ilq.6
        for <linux-media@vger.kernel.org>; Thu, 10 Nov 2022 08:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qH+k4rzdhNlbrn8y8ZyPsEWJ4foiwmUbBpsTlYKcRac=;
        b=EaUI+pigT02fbHTw9yciXq8LuwjQY/ypAvkQHyTB8iH9PnVixZrpM/uHpMJ4NLAF3K
         z3SZ3oJ7qtlT9sCr+id+xX33d+hAsETdedAKWMMfPjMBMTi2BQTdQFvU5YqivYOfW7RM
         4IlRnpE0vBuQX6TE3mBIuF6IhufOPCZmTZ+g0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qH+k4rzdhNlbrn8y8ZyPsEWJ4foiwmUbBpsTlYKcRac=;
        b=kLPBAhuPtlDxl9kd4Af7eol4vFaDw2p8NT/+O7A1sh2XSMTha12zNm0pyE6gkrZyvl
         BTfTlbS7CiY+hF5IJcKJCpLvcZV54mOyfLRrGoNf144yt3sEcZCr9w7C6xzsTH1L0fBG
         d9VA0KYbN2BZ+yIhHuPgPbfYOuzs7qpTglcVrefgTHOTfQTa9d2jbs2F16GsIZdppvmk
         orlEtbXUczS2mrWxTxc7GX4zooNqh+P1iB5n0f5x/P7h3RoI6etBEhJnDMSUl7sWuvxG
         jhEtT4AbIMTB+6Ry3Ju/S7BAZA2UDWLrgbDsj3FGmDDpx0mJaB3RWs3quT2w36dbAYk+
         ldxQ==
X-Gm-Message-State: ACrzQf3Quu6AuSHmR+Saw07aTkEAS6JQ8krPRuEBSrshq7mXuakCf6qG
        h3G8y0AIzRuJcFEVQn2LHZZtMw==
X-Google-Smtp-Source: AMsMyM7IRyqqc+gKMsu1cERbqLg9VMIzbAQVa4Gj7NZAdOjBsJ+9S0q61JPSlsVAv/mPauXuH2+g7A==
X-Received: by 2002:a92:6e0b:0:b0:300:716a:2705 with SMTP id j11-20020a926e0b000000b00300716a2705mr2998846ilc.217.1668099382697;
        Thu, 10 Nov 2022 08:56:22 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id x10-20020a02340a000000b00349d2d52f6asm5793163jae.37.2022.11.10.08.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 08:56:22 -0800 (PST)
Message-ID: <fa8b6690-5560-7feb-7616-db636161e204@linuxfoundation.org>
Date:   Thu, 10 Nov 2022 09:56:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] media: vimc: Fix wrong function called when vimc_init()
 fails
Content-Language: en-US
To:     Chen Zhongjin <chenzhongjin@huawei.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc:     kieran.bingham@ideasonboard.com, mchehab@kernel.org,
        hans.verkuil@cisco.com, helen.koike@collabora.com,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20221110072633.210437-1-chenzhongjin@huawei.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20221110072633.210437-1-chenzhongjin@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/10/22 00:26, Chen Zhongjin wrote:
> In vimc_init(), when platform_driver_register(&vimc_pdrv) fails,
> platform_driver_unregister(&vimc_pdrv) is wrongly called rather than
> platform_device_unregister(&vimc_pdev), which causes kernel warning:
> 
>   Unexpected driver unregister!
>   WARNING: CPU: 1 PID: 14517 at drivers/base/driver.c:270 driver_unregister+0x8f/0xb0
>   RIP: 0010:driver_unregister+0x8f/0xb0
>   Call Trace:
>    <TASK>
>    vimc_init+0x7d/0x1000 [vimc]
>    do_one_initcall+0xd0/0x4e0
>    do_init_module+0x1cf/0x6b0
>    load_module+0x65c2/0x7820
> 
> Fixes: 4a29b7090749 ("[media] vimc: Subdevices as modules")
> Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
> ---
>   drivers/media/test-drivers/vimc/vimc-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/test-drivers/vimc/vimc-core.c b/drivers/media/test-drivers/vimc/vimc-core.c
> index 2ae7a0f11ebf..e82cfa5ffbf4 100644
> --- a/drivers/media/test-drivers/vimc/vimc-core.c
> +++ b/drivers/media/test-drivers/vimc/vimc-core.c
> @@ -433,7 +433,7 @@ static int __init vimc_init(void)
>   	if (ret) {
>   		dev_err(&vimc_pdev.dev,
>   			"platform driver registration failed (err=%d)\n", ret);
> -		platform_driver_unregister(&vimc_pdrv);
> +		platform_device_unregister(&vimc_pdev);
>   		return ret;
>   	}
>   

Good catch. Thanks for fixing it. Now applied for next rc.

https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux.git/?h=vimc

thanks,
-- Shuah

