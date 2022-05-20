Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32C2552E679
	for <lists+linux-media@lfdr.de>; Fri, 20 May 2022 09:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345588AbiETHpF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 May 2022 03:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346601AbiETHpD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 May 2022 03:45:03 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192D314C773
        for <linux-media@vger.kernel.org>; Fri, 20 May 2022 00:45:02 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bu29so12992884lfb.0
        for <linux-media@vger.kernel.org>; Fri, 20 May 2022 00:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+aBavLEkYJU8ppHKZfPEoTzJMPVM0ajWgFW8w1xSHTI=;
        b=lJ76KJ2sv44ZiGDsP12pyEW4q4uQr5xfyiwEalACZa8qvGzmBfyDqS+gVgH7Qk84w+
         HpHVZhzEwgzaOu48uV4DDYaKQ5Y1ffDlYlkjnpcCquL8VRF5SmY8Hq+Kwgy7HMt5EvSW
         qOKTVBru/qLwTm1sfcJmi1leUvzCmiXTuW2HOUlCvSL1PeQ36FD+zPEp2xTsJ4cOoesQ
         uIj0O0b5XCmWWI7pHW2Q3Rojxjcl9IMGsmdmpyNhFN7swsICmB1rtteOg7da0gMOfuFx
         EiBChwTia3ySw739to/i3eUzD2kk88AHr8s3BiFQMDE7vHWLoz9qcwKk09kVshszbBa4
         B2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+aBavLEkYJU8ppHKZfPEoTzJMPVM0ajWgFW8w1xSHTI=;
        b=mgBS09o4RlUh/+d11G46fSlg+2yoQzGJyEe/n03oHWMsHSQ//5s4tAEBgh4n6vmT2S
         l6pddcvNcNlX18sOK8AeQvHzBCleCaBjw/wvg/A9cRVMn5sinL/hQN6TXp5WWPFf0DZ4
         TDHShmtB5wyXj8N7+pT/pNDlnAIjiJ1GRiPO1RnNGkkdJ1Tojt2ZHoU92opJAIcU0l8o
         jE4kGJhoEHm+94zDIQxL0+7Il5JPybL7RHkfE4YqVyfAzxWDkj1u5i/ghkytjO+65qOU
         dytn3atsoOS+n49l7J2sqTI9jPl1Xc+qgQpvItXjFxgcSZWI/Mxp+59eyhIfU+SyDWOz
         SmAg==
X-Gm-Message-State: AOAM532rOEeyO5G2LEXAS5b4RGpYjjYfUA7JQ71G0OKHQLNfiv8wlq8J
        dvlYM3tUu9bmhTq7YsXba1dLSw==
X-Google-Smtp-Source: ABdhPJzny5YrTxA6USed7c9Qh1HoLb1QzlJ3c45ATl9O2YI4km3mZhR7V+Wsf+RupbtwytpqfGZvig==
X-Received: by 2002:a05:6512:951:b0:477:aa57:3e9d with SMTP id u17-20020a056512095100b00477aa573e9dmr5763789lft.525.1653032700488;
        Fri, 20 May 2022 00:45:00 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n3-20020ac242c3000000b0047255d211e8sm556912lfl.279.2022.05.20.00.44.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 00:44:59 -0700 (PDT)
Message-ID: <02c3ef16-dbbb-e6b6-58f2-b0e691af2dfb@linaro.org>
Date:   Fri, 20 May 2022 09:44:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RESEND 1/6 v2] dt-bindings: vendor-prefixes: Add Geekworm
Content-Language: en-US
To:     Chris Morgan <macroalpha82@gmail.com>,
        dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mchehab@kernel.org,
        emma@anholt.net, mripard@kernel.org,
        Chris Morgan <macromorgan@hotmail.com>
References: <20220519162935.1585-1-macroalpha82@gmail.com>
 <20220519162935.1585-2-macroalpha82@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220519162935.1585-2-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/05/2022 18:29, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add vendor prefix for Geekworm (https://geekworm.com).
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
