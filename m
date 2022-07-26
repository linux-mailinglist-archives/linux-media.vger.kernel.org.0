Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A887580BE9
	for <lists+linux-media@lfdr.de>; Tue, 26 Jul 2022 08:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238029AbiGZGsw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jul 2022 02:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbiGZGsv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jul 2022 02:48:51 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1240621802
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 23:48:49 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u20so7702209ljk.0
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 23:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YQAX1nHFxjgbPeWSF5HcitnTzR9QJkqmNB7ys8ahImk=;
        b=ZAQg6RBStU2emVYsrxY8SB+/iLgCdCdZppEZKCGHFcxK1B9TaEM9cGtzToIUJzmgXG
         jqm/pS2AIkbr70qUJtwGqOycsbSyLmGMZY+zpkotF+FSw7GmcqhIlrfofQbcVnVymSC2
         VxPFBg5JwJLNJPPdmylHpHT5vH1SmKsSeRH4VVcDs3MgrK6+AiyfC+cshQ1DMC047/KL
         MxbyGITrMZKRQvZLik7XvFGdoIpR/EvPBnugXEnea3HwkOBart/qpUagxM2BkKb0Yn07
         HWxYBXCu009+/uaz2rvV3j3DzLfHgHtLJhAevpB6t9ZgL+0+uNTQ8QuAkdE2e6zQXJLe
         iw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YQAX1nHFxjgbPeWSF5HcitnTzR9QJkqmNB7ys8ahImk=;
        b=NrNECX1C90Bnstd7sRL/kgYRcjXeim8GrJGrxF9Q7gk2jYUN8YFRgt6vU0pDeFIhPv
         kruDDuiht+TSFhaXl+cH1yP2xvcyqerkwl9/wnRMyrkJCUE3mbdD4N8sHIksPMixmAby
         mvkbIFM64uGQNZCW+NfM24KKCXaSthLW8AYdcGleFbbXbPaGWWObzc2YIPh/6AAgHirY
         3Cj04WdBA7Fln7YY/5/kpQtblhbtg5419P2GVnQKFoIFoGGJJXT7ltIp71Rb8f8I5mJ/
         h2xuIzrhN3UBk8SC54M5kAB0XQHLrtBCe37BRGwh/bD2lGqjU+qzfSGaKH32smdlwZiI
         8j5Q==
X-Gm-Message-State: AJIora8CK3dRuY92FyfNBbL+/JEXTrefRtHVBGj9zYF/nr0zDhlWbzIn
        odSgbATkk2hYGMsiy/FAy8DMXeZ5MdLQOnR5
X-Google-Smtp-Source: AGRyM1v50oF7j0YPM0N9tEZsNCmSS9smoq4lDxi2jLcRE6+q/pABRsU6NY2KTXRoxfo1f4c5dXAvnA==
X-Received: by 2002:a2e:b947:0:b0:25d:d6f6:adaf with SMTP id 7-20020a2eb947000000b0025dd6f6adafmr5720547ljs.230.1658818127437;
        Mon, 25 Jul 2022 23:48:47 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id j7-20020a2e6e07000000b0025d53e34fe7sm3136020ljc.56.2022.07.25.23.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 23:48:46 -0700 (PDT)
Message-ID: <62334f55-df8a-936a-ec88-2db469aede21@linaro.org>
Date:   Tue, 26 Jul 2022 08:48:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [v5 4/4] arm64: dts: meson: Add MagicBox M16S support
Content-Language: en-US
To:     Zhang Ning <zhangn1985@qq.com>
Cc:     martin.blumenstingl@googlemail.com, narmstrong@baylibre.com,
        linux-amlogic@lists.infradead.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sean@mess.org,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20220724231704.132472-1-zhangn1985@qq.com>
 <tencent_9D885D188E51B537DB904A774CEC35E4180A@qq.com>
 <677c9314-593e-3512-539a-fd74f634c470@linaro.org>
 <tencent_1B5B069917D86370ED4136BDD2C413240D08@qq.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_1B5B069917D86370ED4136BDD2C413240D08@qq.com>
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

On 26/07/2022 02:04, Zhang Ning wrote:

>>> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-magicbox-m16s.dts
>>> @@ -0,0 +1,40 @@
>>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>>> +/*
>>> + * Copyright (c) 2022 Zhang Ning <zhangn1985@qq.com>
>>> + */
>>> +
>>> +/dts-v1/;
>>> +
>>> +#include "meson-gxm.dtsi"
>>> +#include "meson-gx-p23x-q20x.dtsi"
>>> +#include <dt-bindings/input/input.h>
>>> +
>>> +/ {
>>> +	compatible = "magicbox,m16s", "amlogic,s912", "amlogic,meson-gxm";
>>> +	model = "MagicBox M16S";
>>> +
>>> +	gpio-keys-polled {
>>
>> Just gpio-keys (or even "keys").
> I see all dts for amlogic platform are using gpio-keys-polled, could I
> keep current name?

Node names should be generic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof
