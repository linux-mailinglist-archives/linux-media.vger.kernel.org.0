Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 137545BC5EF
	for <lists+linux-media@lfdr.de>; Mon, 19 Sep 2022 12:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiISKBN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 06:01:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbiISKBH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 06:01:07 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8674222BDF
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 03:01:01 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id a3so34057799lfk.9
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 03:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=WdUkk7yGHQTnyhcNnJU1k388XLuhNOGvfweCAo6fMwc=;
        b=vO5LqzsAPrNDUjoRs+Misssc19PKq07vxhSzWwiWX2rQBxBfHnl5cK5doEQlcGwsNo
         tpuIe+soZwbo9WrOfPLjHBRQLqxBai1/tefMKYyMMoUIm3aPUQ/LDmqq5bK9VNANZd+s
         5Bv/LNRTDaSVhS6cTrW/YVyyMABkP4IqzfJraJzxUzQgYREEPdhMOLV7VsjaG4xm6flK
         O1LbBk4DGuFEMFzlqru7LzCIfvfCJw5Sf7IxxUOuA2A1ukhkQNtODC7GK4FJ3Ei0qNG2
         fewGakFqr1vkSi2B7jIGEenqrICWcDmYozv+G3xm9HyfgjX4dRUu901g0ZFT2BUfQukr
         TPag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=WdUkk7yGHQTnyhcNnJU1k388XLuhNOGvfweCAo6fMwc=;
        b=sp7anT6nA7MYCEVaeSSFABmcC6TZ2X5S8iTPH15rHU+DtN5MqlJryrrn7akxALzaM+
         k5jsu0PUEBNIeZ1eHKFF+vwsCfMFAqN6svGZN3qYF+TGlcCOk0ef+P39soJN3coLa5Wd
         ksN5NtEc3HZmgybwiKTgTzLOtgM86WxBlPDR5c6EamMRtse8dDvGYQOG0u4Zlnx+YeTG
         rJtJA1vL5DWunceiCfck8JIav6g5TDWC3x3C56L4B1+T3koAlXhookiE553kMhJ218rp
         rrVPDwe/lkyBFptiAWB85FJoLTMMyDca+tglIGXtJ6gnJBKkimLo4dgBO3AdBdl279Zi
         UtiA==
X-Gm-Message-State: ACrzQf3Uao+UCAVaZsnSBDReimTLz3Bl6bcs61VqD6+OxTG3TmECj3JA
        TeOtU+TKxMC4vibVnyow2v/Jtw==
X-Google-Smtp-Source: AMsMyM6eTy9aLeRLLZfdd4mdrF4tOggHU+zSg3FhAvy4BMGppFAdGafMSo4oN8UwzI1bejZNfSFlOQ==
X-Received: by 2002:a05:6512:3da9:b0:49f:1742:c692 with SMTP id k41-20020a0565123da900b0049f1742c692mr6498107lfv.313.1663581659821;
        Mon, 19 Sep 2022 03:00:59 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id be19-20020a056512251300b0049f53d53235sm1952699lfb.50.2022.09.19.03.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 03:00:59 -0700 (PDT)
Message-ID: <7a24c242-0fc8-ded1-37c9-ec279996a4c8@linaro.org>
Date:   Mon, 19 Sep 2022 12:00:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] media: dt-bindings: i2c: ovti,ov5640: Drop ref to
 video-interface-devices.yaml
Content-Language: en-US
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220916133521.73183-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YyZS38Wo7rDsNRm2@pendragon.ideasonboard.com>
 <CA+V-a8vvNHFt818wryyuhWxPtay4czjWXiH=AWEKiJ1AzB46mA@mail.gmail.com>
 <fc1c075d-e20d-9395-d168-8cfe530f77ad@linaro.org>
 <CA+V-a8uMyU89rufmqWiGFqpVjFPvHBeVeSd1Wt07eWZo1X+Bgw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CA+V-a8uMyU89rufmqWiGFqpVjFPvHBeVeSd1Wt07eWZo1X+Bgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/09/2022 11:35, Lad, Prabhakar wrote:
>>>> The rotation property listed in this binding uses the definition from
>>>> video-interface-devices.yaml. I don't think just dropping this is the
>>>> right solution. Changing additionaProperties to unevaluatedProperties
>>>> seems a better option.
>>>>
>>> Agreed, I missed rotation was used from video-interface-devices.yaml.
>>> Agreed the changing additionaProperties to unevaluatedProperties seems
>>> a better option.
>>
>> The meaning of unevaluatedProperties:false would be here - accept other
>> properties (not mentioned here explicitly) from referenced schema. If
>> this is your actual intention for this binding, it makes sense. But if
>> the intention in this binding was to disallow these other properties,
>> then it would be wrong to change to unevaluatedProperties.
>>
> Thank you for the clarification. The intention is to disallow the property.

Which property? Can you be specific?


Best regards,
Krzysztof
