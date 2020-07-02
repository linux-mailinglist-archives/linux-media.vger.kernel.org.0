Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C98B212D01
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2020 21:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgGBTRE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Jul 2020 15:17:04 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:46367 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725994AbgGBTRD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Jul 2020 15:17:03 -0400
Received: by mail-qk1-f193.google.com with SMTP id r22so26683879qke.13;
        Thu, 02 Jul 2020 12:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HcxrJ2+WusVgmdl2L0G+41/G5nAxGVCAKN7ao84jcAU=;
        b=D0uYtrhaInBtRbeXpL1x/dqXcRVLVYiBgJPjZy50aNaSyj3kk1lJAYuoZym0O/4H/t
         5GHnFqp4sMSr6VMkwUr75byBFdcRnD4mHoUqXz/J/R9BjDVU2HLGuWW2+PWS9+yi96gI
         VQh/jnW1eu+KNppDK8Jqo9cKcJrAlX8gjG7f+4NmSbiUcn/+0wgcIMgw88g0IEdJRe4s
         bfPRdTYcil0d+WYYlx3XWunwBGmIM6t4/4G4AJ08obhT/z8whkkO2pM0J++u1oW+W3Fg
         CFT3T/RKN02yvwd99OZELencDTkBimS86dSSPO75nihqJYOLRu2Cptn1OQJZbLC/5sxN
         IFeA==
X-Gm-Message-State: AOAM530jibTw46IV8mJAM767sAT6yqzAHmqvxPBXNW6iwADIe/Wg9++U
        S8ADFVztJXP9U2oHDMaRy/nwQbRZ0D1yJw==
X-Google-Smtp-Source: ABdhPJz8gWebnjUucVqFpfzfURWpWF1jU56SHhyLPsGtpH6hj9QjQOnagFdF5q58Psf9vbDTFgtrYg==
X-Received: by 2002:a37:2c46:: with SMTP id s67mr31396244qkh.151.1593717422109;
        Thu, 02 Jul 2020 12:17:02 -0700 (PDT)
Received: from [192.168.1.113] ([179.159.57.76])
        by smtp.gmail.com with ESMTPSA id x26sm8784321qtp.54.2020.07.02.12.16.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2020 12:17:00 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] ARM: dts: rockchip: add rk3288 ISP and DPHY
To:     Robin Murphy <robin.murphy@arm.com>,
        Helen Koike <helen.koike@collabora.com>,
        Johan Jonker <jbx6244@gmail.com>,
        karthik poduval <karthik.poduval@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, heiko@sntech.de,
        devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
References: <karthik.poduval@gmail.com>
 <20200406073017.19462-1-karthik.poduval@gmail.com>
 <20200406073017.19462-4-karthik.poduval@gmail.com>
 <2fc95890-f938-30a5-a163-bf3fa2e223df@gmail.com>
 <CAFP0Ok-NxDDF8TMP4pN=xn6w3H=TYqN3DMfGW-vuiC5qB-Oj5g@mail.gmail.com>
 <CAFP0Ok9XGzVbghbnOOyfXiOOc5-a94uFRu7sD5wXz9sr-+AYEA@mail.gmail.com>
 <9407b6c3-b932-5904-18ff-7c6cbf6bcc8b@gmail.com>
 <ec0e43f0-95af-c0b0-c51b-ea2db4194931@collabora.com>
 <34801fe8-cc4f-ed52-674d-ee291f508e05@arm.com>
From:   Helen Koike <helen@koikeco.de>
Message-ID: <1598ce27-2456-aaa6-0984-080fed778312@koikeco.de>
Date:   Thu, 2 Jul 2020 16:16:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <34801fe8-cc4f-ed52-674d-ee291f508e05@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robin,

On 7/2/20 2:32 PM, Robin Murphy wrote:
> On 2020-07-02 17:27, Helen Koike wrote:
> [...]
>> I suggest this:
>>
>>    clocks:
>>      maxItems: 5
>>      minItems: 3
>>      description:
>>        rk3288 clocks
>>          ISP clock
>>          ISP AXI clock
>>          ISP AHB clock
>>          ISP Pixel clock
>>          ISP JPEG source clock
>>        rk3399 isp0 clocks
>>          ISP clock
>>          ISP AXI wrapper clock
>>          ISP AHB wrapper clock
>>        rk3399 isp1 clocks
>>          ISP clock
>>          ISP AXI wrapper clock
>>          ISP AHB wrapper clock
>>          ISP Pixel wrapper clock
>>
>>    clock-names:
>>      oneOf:
>>        # rk3288 clocks
>>        - items:
>>          - const: clk_isp
>>          - const: aclk_isp
>>          - const: hclk_isp
>>          - const: pclk_isp_in
>>          - const: sclk_isp_jpe
>>        # rk3399 isp0 clocks
>>        - items:
>>          - const: clk_isp
>>          - const: aclk_isp_wrap
>>          - const: hclk_isp_wrap
>>        # rk3399 isp1 clocks
>>        - items:
>>          - const: clk_isp
>>          - const: aclk_isp_wrap
>>          - const: hclk_isp_wrap
>>          - const: pclk_isp_wrap
> 
> FWIW this looks a little more involved than it might need to be. Ideally we're describing things from the point of view of what inputs the device itself wants, so the details of exactly *how* a particular SoC's clock tree delivers them shouldn't matter to the binding, only to the actual clock specifier values ultimately given in the DT.
> 
> From the ISP's PoV, it seems like we've got the fairly standard core clock, ACLK and HCLK trio, plus a pixel clock for RK3288 and RK3399 ISP1, plus a JPEG source clock for RK3288. I'd be inclined to model that as simply something like:
> 
>     clock-names:
>       minItems: 3
>       maxItems: 5
>       items:
>       - const: isp
>       - const: aclk
>       - const: hclk
>       - const: pclk
>       - const: sclk_jpe
> 
> Plus then not only do we have a nice clean binding, but we avoid all the unnecessary faff of having to deal with the "same" clocks by different names in drivers, and sidestep the conundrum of what to do when the next SoC comes along providing the basic ISP clocks from yet again slightly-differently-named branches of its clock tree.

I agree this is cleaner, thanks for this suggestions, I just submitted a new version
following this https://patchwork.linuxtv.org/project/linux-media/list/?series=2844

Thanks
Helen

> 
> Robin.
