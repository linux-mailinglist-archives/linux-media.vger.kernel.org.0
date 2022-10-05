Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57E045F5055
	for <lists+linux-media@lfdr.de>; Wed,  5 Oct 2022 09:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbiJEHbK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Oct 2022 03:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiJEHbH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 Oct 2022 03:31:07 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567D97434D
        for <linux-media@vger.kernel.org>; Wed,  5 Oct 2022 00:31:01 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g1so24333127lfu.12
        for <linux-media@vger.kernel.org>; Wed, 05 Oct 2022 00:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=c2rUBM3uigd0IYhg9S421AlGdWRTSjf8To3ZZq+NWCQ=;
        b=m3wGZF+gX3zyncGuUd3Pzez9su5RuKirLdKGDSC83FXdLWGxFhbTebNDgZoTiHRozC
         nCtm1enhOOfA/sgRd19TGym256+uyw1Mu8JdCBudQqisiSAPAUMsB4QfrQRPV0eitYKi
         C3TosYmyw8e7VrktJT7HnkzWtHl5jV66DP/iFvzyFkv5H0dkuqxzjEnzzDN4aU2m5Mej
         jq4wPWkojK0xTR4mNhZewc6A1zdO/LUVGfRE3/6SyWD9kmFuabF73b5+IyescPFUmkOU
         oqZes+b03aDaNgkHpkvlWAwpG2UBF7HGNtrM1a+ln/HFdETiW2CUIZi0DxIpg+VIWE+q
         fimw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=c2rUBM3uigd0IYhg9S421AlGdWRTSjf8To3ZZq+NWCQ=;
        b=w6Y2g7bPPeteqCiC/lShXQ0Zqfcz/CUwArlsN2ilI+yy71wMuhPY48qt1P55qw08Rd
         VZMA0dUjbIW4nVtNW8rKC4UKMG7fBAbMqXsFRbFSpcdokSP+kWzUPWoT1iw37EPI8hy9
         7uBWjE037kOO0wibNkFPgaT3kveKUzltWHmFWJbknWI3LP2nakXSBUwFPIPU51pBW8Xe
         Ad5Pba+HTiPjNwsI5VwqCKQtceQu4jHIGMbiWAvVTSZbo2F8k/QCxmd7BN4cXQJc+qVm
         DFAY9ZzF7taHMsEeJaiUk2gOH07XJ9udvcLvhAQPd4Vv8WP55JX0RzlCKTohaQaUSkOs
         nLJA==
X-Gm-Message-State: ACrzQf0oc55MJrxVL7RIjb0OHfJI1dXINPjLx8u+GY3pIEzICzy/aY9Q
        Lk52V3KAX46ipYmbBBKfhHifaA==
X-Google-Smtp-Source: AMsMyM5Pmg6Fb8hOCsGQtG3jJCzxwd++fUOnGu6nWEq6j5dTlkBa6OKcP6fl0JquPIxjtwCho6o8/g==
X-Received: by 2002:a05:6512:66:b0:4a2:3c36:8c3d with SMTP id i6-20020a056512006600b004a23c368c3dmr4470782lfo.687.1664955060082;
        Wed, 05 Oct 2022 00:31:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id t21-20020a2e8e75000000b0026dfdcbccd4sm68034ljk.17.2022.10.05.00.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 00:30:59 -0700 (PDT)
Message-ID: <24361bea-ecfe-b6e1-e755-5151220767f2@linaro.org>
Date:   Wed, 5 Oct 2022 09:30:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 1/2] media: dt-bindings: mediatek: Rename child node
 names for decoder
To:     =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?= 
        <Allen-KH.Cheng@mediatek.com>, "robh@kernel.org" <robh@kernel.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
References: <20220930112237.14411-1-allen-kh.cheng@mediatek.com>
 <20220930112237.14411-2-allen-kh.cheng@mediatek.com>
 <20220930220011.GA1107972-robh@kernel.org>
 <ffc56eb60a3ef74c815c8d3c170a0df51958e20d.camel@mediatek.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ffc56eb60a3ef74c815c8d3c170a0df51958e20d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2022 09:21, Allen-KH Cheng (程冠勳) wrote:
> Hi Rob,
> 
> On Fri, 2022-09-30 at 17:00 -0500, Rob Herring wrote:
>> On Fri, Sep 30, 2022 at 07:22:36PM +0800, Allen-KH Cheng wrote:
>>> In order to make the names of the child nodes more generic, we
>>> rename
>>> "vcodec" to "video-codec" for decoder in patternProperties and
>>> example.
>>
>> They are either generic or they aren't. Until something generic is 
>> defined, I don't think it's worth the churn to change.
>>
>>
>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>> Reviewed-by: AngeloGioacchino Del Regno <
>>> angelogioacchino.delregno@collabora.com>
>>> ---
>>>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml    | 8
>>> ++++----
>>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
>>> decoder.yaml
>>> b/Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-
>>> decoder.yaml
>>> index c4f20acdc1f8..67fde48f991c 100644
>>> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>> subdev-decoder.yaml
>>> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
>>> subdev-decoder.yaml
>>> @@ -91,7 +91,7 @@ properties:
>>>  
>>>  # Required child node:
>>>  patternProperties:
>>> -  '^vcodec-lat@[0-9a-f]+$':
>>> +  '^video-codec-lat@[0-9a-f]+$':
>>
>> Just 'video-codec' doesn't work?
>>
> 
> Thanks for your reply.
> 
> hmm, I think 'vidoe-codec' does wrok.
> 
> There are two seperate hardwares for the MTK video codec.
> codec-lat and codec-core.
> 
> Is it ok to keep two child node names for various hardwares?
> 

Aren't they still codecs?

Best regards,
Krzysztof

