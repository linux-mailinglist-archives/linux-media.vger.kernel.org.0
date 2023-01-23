Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB973678590
	for <lists+linux-media@lfdr.de>; Mon, 23 Jan 2023 19:57:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbjAWS5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Jan 2023 13:57:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232405AbjAWS4m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Jan 2023 13:56:42 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE2434C1E
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 10:56:34 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id g10so9821526wmo.1
        for <linux-media@vger.kernel.org>; Mon, 23 Jan 2023 10:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7P5hcEaheNNmOvOI92M/UaXJ9usXWngKAfzU751Q808=;
        b=Dh+IPZrC81ABHdlrTFXxjKVt2deQLm6OYqnMWLhyblF2Vs9es46cOfQ3Zssfyg0b4Z
         iCS7aLuxdeNS39SCSFy6TFKLWwYYwz6quXz2vEUw4jCxvjFVAQvGTTobkcOoJi3HXYL4
         Trt48iGMnCaDgwgcLp+ZAegL5JUSDNYp1v6u93XzqrFZXpdtdY89DJQt2nUqMqxWSS+s
         vDHRmHU7UtP1P6OuXyrQhAjlBV7+TK3ps6nQxFvLAVxR7Es14xqVDh4JPFlYWWETCNWn
         qoRM57JktCazOv6GwRFxGE4wQDgHc9Zdj/9lDM2I5k7R98bgcvq5C2aO+70W0jpI5JbP
         cxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7P5hcEaheNNmOvOI92M/UaXJ9usXWngKAfzU751Q808=;
        b=zSOphW6xJiul7YyLHENVwNM1BxHkDnfgxSlfSyO9w0Lh2MN2dNsMRcLkk66I4Md+W6
         mP4PwG7Ru1pEVc6TpftVUUa7IM+CRIU90hbnHUkO417BsnfntBEJ0BUnkdiHbR3fjP0Y
         uzfdRSiTaQO7hcHmjP8i2oJV4kihM0M0yj3DEEV4boonPlKeetqLnFWw3QQPGLsWrclf
         bGK5NFNmVY+AxgMegVT4n62gkdJHPAvR9kZwDy2L9L+oWq5y4uiMrFSeA72JZyXQFlyQ
         WuY0ojPM++SrN7zTOUS7WD82Wko86IU324oxC1N0Sf06gH5hpvjplLs9ngdZ4BfqtJSs
         /7aQ==
X-Gm-Message-State: AFqh2kqeIul2kqxXof127uCN/vyeeIz0ngXLWzeDtdWGLK6a3z2lnUq8
        d27fGiwwJTGhJ/yd4+8038ApeQ==
X-Google-Smtp-Source: AMrXdXsHIotgqdwCyduVSCyhPS8Cv15rRVIPuogNv2CC3YO5vKSQ9gSFrBNp+pSjVYcFJknpowzMmA==
X-Received: by 2002:a05:600c:3296:b0:3cf:82b9:2fe6 with SMTP id t22-20020a05600c329600b003cf82b92fe6mr26077571wmp.8.1674500191948;
        Mon, 23 Jan 2023 10:56:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e17-20020a05600c439100b003dafa04ecc4sm16964wmn.6.2023.01.23.10.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 10:56:31 -0800 (PST)
Message-ID: <2b5c823f-16a2-297e-5f0f-04e4a7f20dc9@linaro.org>
Date:   Mon, 23 Jan 2023 19:56:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 2/7] dt-bindings: nvmem: convert
 amlogic-meson-mx-efuse.txt to dt-schema
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org
References: <20221117-b4-amlogic-bindings-convert-v3-0-e28dd31e3bed@linaro.org>
 <20221117-b4-amlogic-bindings-convert-v3-2-e28dd31e3bed@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v3-2-e28dd31e3bed@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/01/2023 11:09, Neil Armstrong wrote:
> Convert the Amlogic Meson6 eFuse bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

