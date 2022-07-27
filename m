Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6E1E582991
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 17:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233268AbiG0P0a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 11:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiG0P0Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 11:26:25 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDC2043E5F
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 08:26:23 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id z13so19811628ljj.6
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 08:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0mF1oI1pJZmSieB3wXSlOY9epoXI1hphuf7YfBoklfM=;
        b=UNT7Qim9QA+w/2JT+GGYhUKLSQKuXqZrEm5f5ZQZN7pycIf9opQaqjb+mKNaGsFYZc
         ts/7lMlWz6z3PW1L3Uqm7LyZTRkY9FUcMx5V8o8yzif761m8LxIpXTINJM0XZdWK/PdB
         +kaAFZET6+RR/3Q+qLUY1WSsnQZCWqwRtPo0m1ZqDtIZTlQGbhpJrZReuLj7v+Bg75nW
         PX8v3XM2H/aclDwO70+i2xC2zyDNbD+09fPQBpfcBrHLEBRaSx7TIy4cIuwtEVwSk0gw
         rDd/XaRdqplClZ32ww73wlqTFSPhVMviFgCzyWxeEw6iA6KhAWKMchr/o0l/tf0a9UjG
         0Izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0mF1oI1pJZmSieB3wXSlOY9epoXI1hphuf7YfBoklfM=;
        b=nk4lHNLKiq9gZXjOchHCuUex7RL+CdNCefgLQ8YEqcQ/WwrRlY2miyW0jqWwL0LGUO
         G6uPazfO8pt0aONNTP3Bktuhe/WcIdEv19CId3u1tA22jvEDbrkY5xGGPPn3kpX/t0py
         KChpGC7TriUIg+k8kJP9kcNum3ZzCykfcznueou4ltXm7jmzriZRIOLmza3XrW8ROis2
         MrsH9Q1wFiiw4x2infqS5ObS+gPll4/zZhhhAAx7FKTIu9iNDVoyBugD3k0W7hCnlSAm
         k449IxyWvd985qi6nos54HhFjGIIj1IOZkx41jXVGfiTd0mLAhB4dZxu+7N8wdE4g0oP
         8kuQ==
X-Gm-Message-State: AJIora+1kCPjO0/AkkQ3ts0AcQTFitNblg1G8ISS/4Rc4TFtggSvXCNF
        rzfQpItImM0q04KewhdvQBweVg==
X-Google-Smtp-Source: AGRyM1vyqiinwPc4/1VoCNVulna424uhIP0azt/mhoIusJSkQdyKzzPC3faBTIa0mC+S0u8/9vTR1g==
X-Received: by 2002:a2e:2a85:0:b0:25e:1f29:404c with SMTP id q127-20020a2e2a85000000b0025e1f29404cmr1813882ljq.308.1658935582046;
        Wed, 27 Jul 2022 08:26:22 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id p16-20020a05651211f000b0047f7c897b61sm3846341lfs.129.2022.07.27.08.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 08:26:21 -0700 (PDT)
Message-ID: <b1aa7835-631b-9380-e529-687ee0c16f7d@linaro.org>
Date:   Wed, 27 Jul 2022 17:26:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [v7 3/4] dt-bindings: arm: amlogic: add MagicBox M16S bindings
Content-Language: en-US
To:     Zhang Ning <zhangn1985@qq.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        narmstrong@baylibre.com, martin.blumenstingl@googlemail.com,
        sean@mess.org, christianshewitt@gmail.com,
        linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220726143649.142574-1-zhangn1985@qq.com>
 <tencent_A962A641C180EEC2680CA53DDD6643BA6E05@qq.com>
 <20725cba-220c-5664-5766-14d89d24b93c@linaro.org>
 <tencent_27A429274A1A0E0C082FA6C700DA856DDA09@qq.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_27A429274A1A0E0C082FA6C700DA856DDA09@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/07/2022 16:41, Zhang Ning wrote:
> On Wed, Jul 27, 2022 at 09:06:07AM +0200, Krzysztof Kozlowski wrote:
>> On 26/07/2022 16:36, Zhang Ning wrote:
>>> Add manufactor bindings for Tmall
>>> Add the board bindings for Magicbox M16S Tv Box
>>>
>>> Signed-off-by: Zhang Ning <zhangn1985@qq.com>
>>
>> All your subjects are still partially wrong. I pointed this out in v5
>> and you still send v6 and v7 without proper patch prefix.
>>
>>> ---
>>>  Documentation/devicetree/bindings/arm/amlogic.yaml     | 1 +
>>>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>>  2 files changed, 3 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
>>> index 61a6cabb375b..a67af2adf6a5 100644
>>> --- a/Documentation/devicetree/bindings/arm/amlogic.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
>>> @@ -125,6 +125,7 @@ properties:
>>>                - libretech,aml-s912-pc
>>>                - minix,neo-u9h
>>>                - nexbox,a1
>>> +              - tmall,magicbox-m16s
>>
>> Previously the vendor was magicbox... now it is tmall. But you write
>> also Alibaba. It's a bit confusing.
> 
> Tmall is sub-company of Alibaba, if I use alibaba,tmall-magicbox-m16s
> this will be too long.

OK


Best regards,
Krzysztof
