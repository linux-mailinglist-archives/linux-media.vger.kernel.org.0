Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3E87728FC
	for <lists+linux-media@lfdr.de>; Mon,  7 Aug 2023 17:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjHGPVh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Aug 2023 11:21:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjHGPVg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Aug 2023 11:21:36 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF9710FD
        for <linux-media@vger.kernel.org>; Mon,  7 Aug 2023 08:21:34 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fe490c05c9so17321265e9.0
        for <linux-media@vger.kernel.org>; Mon, 07 Aug 2023 08:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691421693; x=1692026493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+nsJrZUa4VkqTGqcaTSNi/vYZDLgC/AzsBWnapgNPsA=;
        b=Nsw7w4sr6+BEI6GiS03rJCR+qP7FKXFucjKae0xybflt8CRyBmkvE/AK7Ih9GAwJ1d
         YwVj6sDRHm2S6kbyYSzEeYmxO7MOe2L+afG9Amhf0Bcx08O/S5m4N03QkI7Ku2guggME
         ZcuSP6qJxDsN3NPTD1qlO+coXiLPrJeFwqtKIbQUhLkTfPHjJqKQk7JlRqT9NMXJWO4y
         VwiESOBTJXc/rGae2+69lFgZHNIv3TTXb6j2G2LzRyUtV3Ae9URl/FS6GDmVyl6Ev+/F
         4C/bCPUA1NyaAU2WtHIeKkuLW/1tTrQyoA0wdOvCv6ZZHrIZe/lzjCJYmI6++mQ8UaXE
         pCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691421693; x=1692026493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+nsJrZUa4VkqTGqcaTSNi/vYZDLgC/AzsBWnapgNPsA=;
        b=PIk2UeQa9dWagmEh23nlyVxgYzWrnKVnnxXwJHZZd+rhI7+nE9sftRglhvhQFgu3og
         yYh9bpXAbRFmOuINiWFHLe5onUfJnJhpJSgDKHC61/sr9naPcNc80a2jOpW4zfumFw5/
         J/AjZ9gr3vFQwgwTf417HUKHLrNtH8CyzumgAXeaV/8rqFK7W4VtZbVlzzWCUXtFC3aj
         OIgXkIoG2aanCTjB5rrkU6TNDmaVFqVhbXDxBrFRpP94rwuYQ9dz/7anBjkd7Cu/cplZ
         xSNKcDq/9X71wjaz3+99La2qTi1XyGfNFZ4hxFUe0mHgLcBUbDJ+lMaEuxVE07xx9ubw
         1Nbw==
X-Gm-Message-State: AOJu0YzVVEqGrLxxE8Tsb2uxQCp94ouPlL+Kp59V/N/ke4Hym1Tz7dtR
        C9jrr5jmD44+Zjex7QmA6JxztF7yi8MwmXOwHMQ=
X-Google-Smtp-Source: AGHT+IGQCfrlQO64alS7N0QfuUt8zy4HfzB7owueYTq7zYyg0AdGu2V3y/eAffkk7npb6rrpoIcScA==
X-Received: by 2002:a5d:6ac5:0:b0:317:6570:afec with SMTP id u5-20020a5d6ac5000000b003176570afecmr5904245wrw.3.1691421692754;
        Mon, 07 Aug 2023 08:21:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id t6-20020a5d6a46000000b003142e438e8csm10789411wrw.26.2023.08.07.08.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 08:21:32 -0700 (PDT)
Message-ID: <7cf31e92-ea7d-80f6-9fab-a9c2886c96d1@linaro.org>
Date:   Mon, 7 Aug 2023 17:21:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/6] media: dt-bindings: Document SC8280XP/SM8350 Venus
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230731-topic-8280_venus-v1-0-8c8bbe1983a5@linaro.org>
 <20230731-topic-8280_venus-v1-1-8c8bbe1983a5@linaro.org>
 <84ab9380-2fb2-76f9-2eb9-71d9202718cc@linaro.org>
 <659e30a7-80f7-4fd8-af58-45505213a2ef@linaro.org>
 <ba40de82-b308-67b1-5751-bb2d95f2b8a5@linaro.org>
 <fa5dc696-6c67-49d0-b158-f1e3398813e2@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fa5dc696-6c67-49d0-b158-f1e3398813e2@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/08/2023 17:02, Konrad Dybcio wrote:
> On 7.08.2023 16:04, Krzysztof Kozlowski wrote:
>> On 07/08/2023 14:41, Konrad Dybcio wrote:
>>> On 5.08.2023 21:29, Krzysztof Kozlowski wrote:
>>>> On 04/08/2023 22:09, Konrad Dybcio wrote:
>>>>> Both of these SoCs implement an IRIS2 block, with SC8280XP being able
>>>>> to clock it a bit higher.
>>>>>
>>>>
>>>> ...
>>>>
>>>>> +
>>>>> +  iommus:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  video-decoder:
>>>>> +    type: object
>>>>> +
>>>>> +    properties:
>>>>> +      compatible:
>>>>> +        const: venus-decoder
>>>>
>>>> That's not how compatibles are constructed... missing vendor prefix, SoC
>>>> or IP block name.
>>>>
>>>>> +
>>>>> +    required:
>>>>> +      - compatible
>>>>> +
>>>>> +    additionalProperties: false
>>>>
>>>> Why do you need this child node? Child nodes without properties are
>>>> usually useless.
>>> For both comments: I aligned with what was there..
>>>
>>> The driver abuses these compats to probe enc/dec submodules, even though
>>> every Venus implementation (to my knowledge) is implicitly enc/dec capable..
>>
>> Holy crap, I see...
>>
>>>
>>> Perhaps a bigger clean-up is due. I guess I could just create the venc/vdec
>>> devices from the venus core probe and get rid of this fake stuff?
>>
>> Few devices (qcom,msm8996-venus.yaml, sdm660, sdm845) have clocks there,
>> so we actually could stay with these subnodes, just correct the
>> compatibles to a list with correct prefixes:
>>
>> qcom,sc8280xp-venus-decoder + qcom,venus-decoder
> Hm.. looks like pre-845-v2 (with the v2 being "v2 binding" and not
> "v2 chip" or "v2 hardware") these were used to look up clocks but
> then they were moved to the root node.
> 
> I am not quite sure if it makes sense to distinguish e.g.
> sc8280xp-venus-decoder within sc8280xp-venus..>
> Perhaps deprecating the "8916 way" (clocks under subnodes), adding
> some boilerplate to look up clocks/pds in both places and converting
> everybody to the "7180 way" way of doing things (clocks under venus),
> and then getting rid of venus encoder/decoder completely (by calling
> device creation from venus probe) would be better. WDYT?

Yes, this makes more sense. I think this is controlled by
"legacy_binding" variable (see
drivers/media/platform/qcom/venus/pm_helpers.c).

Once all bindings are converted to new one (clocks in main/parent node),
then we can drop the children and instantiate devices as MFD.

Best regards,
Krzysztof

