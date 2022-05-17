Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE1052A685
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 17:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232969AbiEQP0l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 11:26:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243729AbiEQP0C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 11:26:02 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA85CB1DB
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 08:26:00 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id d15so31946729lfk.5
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 08:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=V+X+LRsejpzXZH7tsox7umkRY7xo5WQxZtVa62UBNjU=;
        b=MAvqRFZMqTF2/qVoqgWL5T0C+ULSZS7SdHzVh6LuDRdT51k+tjmab0c7gpzsf0Ql7k
         ReP/eAAoQU51GsQD4Bz0ywyVLUNnZh/mE3GNKvawkR7gvPqBw5mXHXDDgdkNrpfTpAs1
         bAMk6xyeJ1g4mnjcaeSQMvlpPsF4rbwLd+zy7LuQWikYbxdBzh0GZpJaYHhJxcWDRPdr
         liBJ3i5eBbWp55RwkiZwR+iHlOp6uft4OXTRqqT9OHhoOaU24sAJ7WOwFhn0hed1CrBs
         PnWxpalasLu5anySlBVesTRozNRF6F1oQ8HwZT5nEhEcwxQOOhte+RNCH6dwDZuqzYvq
         U0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=V+X+LRsejpzXZH7tsox7umkRY7xo5WQxZtVa62UBNjU=;
        b=WTOy7Xz2qKQnJaUdYa3AE+ZTogXGgJtnrKKDdAMnWXhekE11Yjt1RGz6zQCehtFuhE
         TEKU878x7zSt5VxEsoNvbYLmw/cv1goLowfMUTL8Zrk+6LyvmBXrQ72Kfa6mtMyNBZzI
         7QkHHOCild+qcZ1nQ0S/4N50RHxTTbNN6T3dHumeJEl5t0pTbMrqn6FY7AhZBalKnjG7
         2aVqkTP0sF1EXf2GGN8TvLLHM43nzAL0oKggY2ZEwHcv3JbKS6W0bdrNr2lTquk9/WPF
         OybhPmu2RyJ/pNW0FJ8fMwLxNgpuDSCikKf+WLVCqj07H9utQ0azZjuYz5hajyiCQMKF
         c9Ag==
X-Gm-Message-State: AOAM532dSR8HPB7IsAlqyx87VEK9N47Ic++/60YHB02d/TFxX03knMSS
        MKeJlxBpjb2PQbpJm9xI+WHxgA==
X-Google-Smtp-Source: ABdhPJxmP1/fh87kksGIF64YeOa63xcO4AZZoPfdVcUnKNeeAX7gyD0GjdDyznBoSgv6nNdqeC5cBA==
X-Received: by 2002:a05:6512:280e:b0:473:a0c9:5bdf with SMTP id cf14-20020a056512280e00b00473a0c95bdfmr17199543lfb.337.1652801159066;
        Tue, 17 May 2022 08:25:59 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v2-20020a056512348200b0047255d21124sm2221lfr.83.2022.05.17.08.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 May 2022 08:25:57 -0700 (PDT)
Message-ID: <1327ec95-f6b4-838d-f3f2-a115c2ab632b@linaro.org>
Date:   Tue, 17 May 2022 17:25:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/3] ARM: dts: aspeed: Add USB2.0 device controller
 node
Content-Language: en-US
To:     Neal Liu <neal_liu@aspeedtech.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Felipe Balbi <balbi@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Li Yang <leoyang.li@nxp.com>
Cc:     "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
References: <20220517082558.3534161-1-neal_liu@aspeedtech.com>
 <20220517082558.3534161-3-neal_liu@aspeedtech.com>
 <96973d1d-c52c-d190-6989-3f7996dae70b@linaro.org>
 <HK0PR06MB32027CAC4BEE443F426F587380CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <0bc5ba24-5bfb-593e-cbd0-828ef44aabc5@linaro.org>
 <HK0PR06MB320295DB0748CEFC68B73CCF80CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR06MB320295DB0748CEFC68B73CCF80CE9@HK0PR06MB3202.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/05/2022 17:21, Neal Liu wrote:
>>>>>
>>>>> +		udc: udc@1e6a2000 {
>>>>
>>>> The same as DTS in bindings - generic node name, please.
>>>>
>>>
>>> Is it possible to use "udc: usb-udc@1e6a2000" to distinguish it between "vhub:
>> usb-vhub@1e6a0000"?
>>
>> Possible yes :), but not recommended and not wanted. Nodes should be generic
>> and prefixes are added only if there is no unit address. You can though use
>> some more descriptive label.
>>
> "udc: usb@1e6a2000" is okay for you?

Yes, it's perfect.


Best regards,
Krzysztof
