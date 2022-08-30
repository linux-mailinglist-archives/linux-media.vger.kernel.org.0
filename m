Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 505D85A6BE0
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 20:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbiH3SPs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 14:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbiH3SPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 14:15:46 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5670B1C122
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 11:15:42 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id j14so6314092lfu.4
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 11:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=yCTK3mOs5kt7UV0vR4JE9ejuWymqfsOPx96b3ngX21M=;
        b=Zx/L/t+dMvs/yYGQ6ucoXPtQISYgGfy18aV1801pZc3YtEvdS1zA9KH+dBkzj4e3w5
         NQWyEmeZBdeao2urBJxKfR//keXnOvVOIgbIihliGlUQ1kbMtO21bzZKQca+SoeaKW2s
         zoGRoNKQY8DoqtTxE652QI3efuBrCbQ/7fCvL+63y7taLG4xr9ApSQjKuljhr1rLtot/
         O8zV/Hq8AXsJ//+7lKams3nfwFQOVC1tY7PaChEITHC7XPNUOMlY2buUNEPmzwwiQXmq
         vQqa09bYpaJzyWLZnvFDgIFIadhXAKZvb/mJCwtP+Gu4y+BgH9/K5laJM65v0oAEQ47b
         mzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=yCTK3mOs5kt7UV0vR4JE9ejuWymqfsOPx96b3ngX21M=;
        b=dWtAJwQoj8fhaa3Q3zxIf/0khw7hRXacnN/0bk4Uzy3jmELAO9b+uSg4Tfd1cqY6M/
         BrtEpBsHY9NpV4XK35L61kE5wyrxxeBlpJl5WLhHswtqTMF5lqgGHgtIKx3jys4eZ7u8
         NDCTFeHWqJ13DlfLUjfWeLtFkJca51g+mqA6a2w16x2pdTOIMFAebFyxxhsjBn4Gmr7V
         rhYBlo7ODL5J45Oxz/z/2O9PY2v4xtC2vslPdsUS+7WK7MMR9DZiL8sAzJoJLZq8jj9q
         0M+m8+ILqj4hilB8yTn28YtKgmO3bthDSrQTA3C1bi+wSLaYPKb9+nG6anqi83cjZC6z
         KiDA==
X-Gm-Message-State: ACgBeo3gwig2kjJkTDPCweNTeca+jNJoBcGOwPaagU1bBxJPTWNsyW/E
        +mYJbDzqkEXP5lC0MxB1Ztf16IejLMC42pk6
X-Google-Smtp-Source: AA6agR56keDBwbENAgvE0UZ0rhe66Ucc21kYxUA0/vebsAZbSIBZUFHvPHdZxPhEBm+QM7gK3nr6kw==
X-Received: by 2002:a05:6512:3991:b0:494:70ce:7b85 with SMTP id j17-20020a056512399100b0049470ce7b85mr2731651lfu.80.1661883340808;
        Tue, 30 Aug 2022 11:15:40 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id y20-20020a05651c107400b00261cd70e41asm1147544ljm.32.2022.08.30.11.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 11:15:39 -0700 (PDT)
Message-ID: <096ad2e8-8a54-5ca0-b4a0-0ba652a88cc4@linaro.org>
Date:   Tue, 30 Aug 2022 21:15:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] Added platform module alias for the xiic I2C driver
Content-Language: en-US
To:     "Tuma, Martin (Digiteq Automotive)" 
        <Martin.Tuma@digiteqautomotive.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20220822194721.1238-1-martin.tuma@digiteqautomotive.com>
 <20220822194721.1238-2-martin.tuma@digiteqautomotive.com>
 <51e77545-e029-69f3-f5cd-f2fdf8846582@linaro.org>
 <AM8PR05MB723552BC9CB2FE2FB23EF273FB769@AM8PR05MB7235.eurprd05.prod.outlook.com>
 <812ca17b-5e51-b974-16aa-2180d07b4be9@linaro.org>
 <AM8PR05MB7235232C96D3F847EE5AFC8CFB799@AM8PR05MB7235.eurprd05.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <AM8PR05MB7235232C96D3F847EE5AFC8CFB799@AM8PR05MB7235.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/08/2022 20:56, Tuma, Martin (Digiteq Automotive) wrote:
> 
> 
>>>> Thanks for the patch. Empty commits are not accepted, so instead you
>>>> should explain here why do you need it. In general, your change should
>>>> not be needed, so please explain in detail why do you think otherwise.
>>>
>>> The reason the alias is required is that without the "platform" prefix, loading
>>> the xiic module does not work properly in the mgb4 module. I can not explain
>>> exactly why as my knowledge of the module loading mechanism in linux/modprobe
>>> is quite limited, but that's how it is. The mgb4 v4l2 module requires two modules
>>> that are defined using MODULE_SOFTDEP() to be loaded prior to the mgb4
>>> module - the Xilinx I2C module and the Xilinx SPI module. The SPI module already
>>> has the "platform" prefixed alias and loads fine, while the I2C doesn't and does
>>> not get loaded without it. So I added the alias to make the loading work.
>>>
>>> I will add the info that the alias is required by the mgb4 module to the commit
>>> message the next time I will send the fixed patches, thanks for pointing this out.
> 
>> Driver matches only by Devicetree, so instead of this patch you rather
>> miss proper DTS.
> 
> Can you please explain this in more depth? There is AFAIK no device tree on x86
> and I have no idea how this should work for a PCIe card on ARM either.

Ah, right, you do not use it for DT platform. Then you need proper ID
table, e.g. for ACPI. platform_device_id table would also do the trick
but I don't think it is suitable for such matching via ACPI.

> 
> The fact really is, that on x86_64 and ARM (Nvidia jetson) without any specific devicetree
> where I tested the driver, the mgb4 driver loads properly both the I2C and SPI modules
> defined using MODULE_SOFTDEP (there is no link dependency) if and only if they are
> defined using the "platform" prefix (and the module has that alias, hence this patch). So
> there must IMHO be some mechanism in the kernel or in modprobe, that works based
> on the prefix.

Nvidia Jetson is ARM (and not an ACPI?) so it comes with DT. Let's don't
mix problems. Depending on the type of your system where this is used,
you need proper matching. Sprinkling aliases is not the way, usually.

Best regards,
Krzysztof
