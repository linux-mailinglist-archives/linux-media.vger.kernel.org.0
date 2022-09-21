Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5FED5C031C
	for <lists+linux-media@lfdr.de>; Wed, 21 Sep 2022 18:00:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbiIUQAi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Sep 2022 12:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232273AbiIUP6y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Sep 2022 11:58:54 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F175FA1D19
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 08:52:32 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id a14so7537002ljj.8
        for <linux-media@vger.kernel.org>; Wed, 21 Sep 2022 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5OG5SisV8+7i2AMwo/Sd4BMGPY2tVr/jGlwWZADlTZw=;
        b=WxcWk76UCtI4moz+JlBbxvyDthZlRKJfHZICdSLfKoRbEnWODyIrJmNReWY/ekETj5
         9Y5sxyo4j7/FuchDzZQ+JSgCTleMmfip2kury4TROdHIbQ4tF6kdJ3g9QYOYv7I+XoBU
         W3LnjqR58xXJtXng2rQXzYX99EoFskQKaqC4vGmXjTreX9wFhY9J3ZYnuOLUQH7klHm7
         jNSFDJpDpS4OQDSjYlwhBWtuqn1k0Y8LE6lbE1ywlJtushBY2Y6v2/KNSdpoT5UEMWjL
         VqsBkm+bupHhHMlHdZkQifb3B2iMi3xTTQQd6k276xQap8PzSQl8IJjoPP7ToOqQqOYr
         bHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5OG5SisV8+7i2AMwo/Sd4BMGPY2tVr/jGlwWZADlTZw=;
        b=D4a3gEuOo+yD6cn83Bypy1v6JyMP+OVyyDgCAAH1tX0aYc6d3Gs5047x1SZvMTAMlS
         rLwjPwWbOXoBBKI7n8qC9lRYH7uzBt5CuXrm0SgfMk3DKOg5geEWbPcqlHLjFE4KfDdp
         IcPRbaM/dbF5FNpcGiGumTrklPzYrzKbV3X3ssh7U/RFvYuIYJ6UDhis78aUQnmo8Vl6
         DkBQZc+Pu9S/7f89VaVcEWwC22L0gw4eqJhT8f0ANn/pi5TjnxcFK6D9msIbqguGJYwo
         pnanbgRD50fuA3JIEt//1E/HLURklUgPz9+IUNbEHXF4OeIiUmcoN2TZRYWLt+IeQXTd
         y0CA==
X-Gm-Message-State: ACrzQf3fFvpE0MZ6PentmlWmdAtuYUs8F3hdIGZtqMLjkWDq6OTt1+XW
        bf+Ui0g6JDr9OKNEA414QCu7VQ==
X-Google-Smtp-Source: AMsMyM7DOE0+aiBvnN7Btb1HXRYL1PZdW1uo8lmQH74Kpe8qQiE0hinGQyDTL65vVZvYXcN09FeVPg==
X-Received: by 2002:a2e:2f03:0:b0:261:cb0e:c329 with SMTP id v3-20020a2e2f03000000b00261cb0ec329mr8602752ljv.106.1663775490874;
        Wed, 21 Sep 2022 08:51:30 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o4-20020a198c04000000b0049f54a976efsm492085lfd.29.2022.09.21.08.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 08:51:30 -0700 (PDT)
Message-ID: <ba436dd5-2ea2-b2e0-7056-5bae6b4c7bb4@linaro.org>
Date:   Wed, 21 Sep 2022 17:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/4] media: dt-bindings: Document Renesas RZ/G2L CRU
 block
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220905230406.30801-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220905230406.30801-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <29d456ed-620c-8dc9-01f0-54f96b670b94@linaro.org>
 <YysHAkWBfTTAJF3E@pendragon.ideasonboard.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YysHAkWBfTTAJF3E@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/09/2022 14:43, Laurent Pinchart wrote:
> On Thu, Sep 08, 2022 at 01:40:39PM +0200, Krzysztof Kozlowski wrote:
>> On 06/09/2022 01:04, Lad Prabhakar wrote:
>>> Document the CRU block found on Renesas RZ/G2L (and alike) SoCs.
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - renesas,r9a07g044-cru       # RZ/G2{L,LC}
>>> +          - renesas,r9a07g054-cru       # RZ/V2L
>>> +      - const: renesas,rzg2l-cru
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 3
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: image_conv
>>> +      - const: image_conv_err
>>> +      - const: axi_mst_err
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: CRU Main clock
>>> +      - description: CPU Register access clock
>>> +      - description: CRU image transfer clock
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: vclk
>>> +      - const: pclk
>>> +      - const: aclk
>>
>> Drop the "clk" suffixes. Remaining names could be made a bit more readable.
> 
> These names come from the documentation, isn't it better to match the
> datasheet ?

If datasheet calls it "vclk_really_clk_it_is_clk_clk", it's not the
reason to use it. :)

The "clk" is redundant even if the hardware engineer thought different.

The same for IRQs ("tx" not "txirq"), for dmas ("tx" not "txdma").

Best regards,
Krzysztof

