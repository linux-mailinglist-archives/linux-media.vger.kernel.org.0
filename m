Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 125FD6E3ADC
	for <lists+linux-media@lfdr.de>; Sun, 16 Apr 2023 19:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjDPRyl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Apr 2023 13:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjDPRyk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Apr 2023 13:54:40 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72DB1FD4
        for <linux-media@vger.kernel.org>; Sun, 16 Apr 2023 10:54:38 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-94a34e3526fso544532966b.3
        for <linux-media@vger.kernel.org>; Sun, 16 Apr 2023 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681667677; x=1684259677;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JS6gaHiphUmSOWpn+pmyiSugcXzg+J545dx/xJnnaxk=;
        b=WuWEb3nQKRcBC4aQq5LCsl/QIdpbFKoJvTV/SSvo7+KcXslPZLEolPou2WpIPh9FCF
         srBTN+NGP3wj8rwbrUDV8VW47d+Ia+cdOt36cVwkpPie84WhNTiO/G08tM6139DnVgOd
         Dy8L6Fa6tgCAG04ZtOxo+uyGTfV4VjAkykB/5otTlNrA2UVIuusuAX/F56nUUuVtwxWD
         96eYsH0axlMBFn6uCuZh8OTkFdS2nLbwtuzoUk7tVDlq+GxwnO2hQIDEnvwl1J3GmSt1
         ugYCUXZV3Sj18cLHhJWSKF3gciUab1+yK2RmZV3x+B4zT8k8zJmTdCetNRpPXt6ybdBk
         ZCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681667677; x=1684259677;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JS6gaHiphUmSOWpn+pmyiSugcXzg+J545dx/xJnnaxk=;
        b=Bo3KXsqCGTzawzeJUwMYXiLBNFjPq3PyMvMOs0PEagfUvSJAU9wtlkP8XLzDzRH89p
         SGcVrnQm90xLaB3Xqdylvv08AWU9guSzG/h1MvOZJQWJCO6JF1xtt0VvrPR88nwt1OVA
         sXyXpxLhS97/7TWupF1nPN1UQrHB0DtvMuczzpkGnt/9K8Dc/p4mve4lgvonIU+B8ab2
         8V183H5gKykusbjiJP5fLl2p6U6DkRxZ4AKeu88L8eQXPohc5wK/iwWE+L0L99XKmj+T
         /E7Px5S0Q0PY3L06pavSjIX1JXuxyXFaTav8NJGCGz7U+RqqyD9lahbvICVbZ/jHEfMu
         +hfA==
X-Gm-Message-State: AAQBX9elNLgwjrowU6f8L337+vDtOZU6tg6CN96JYN00CVMXIY2VHeik
        5kHeqBY21k0d/C94MzleU6u51A==
X-Google-Smtp-Source: AKy350Y5iFghGHPVY/+36B4z9G0r8ayC/uD7aU0dvjOxkfyBYGegI5B/Jo7ShhZXPQ/Ssg96Hx350Q==
X-Received: by 2002:a05:6402:1486:b0:4fd:29a1:6a58 with SMTP id e6-20020a056402148600b004fd29a16a58mr13688436edv.19.1681667677169;
        Sun, 16 Apr 2023 10:54:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id h23-20020aa7c957000000b005066ca60b2csm4695188edt.63.2023.04.16.10.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 10:54:36 -0700 (PDT)
Message-ID: <00bd1ec1-0745-c521-4df9-e31e1057a6ff@linaro.org>
Date:   Sun, 16 Apr 2023 19:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 01/12] dt-bindings: soc: samsung: add Exynos4212 PMU
 compatible
Content-Language: en-US
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
 <20230416133422.1949-2-aweber.kernel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416133422.1949-2-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/04/2023 15:34, Artur Weber wrote:
> The platform was originally dropped in commit bca9085e0ae9 ("ARM:
> dts: exynos: remove Exynos4212 support (dead code)"), as there were
> no boards using it.

You meant commit c40610198f35e? This is the one which you partially revert.

> 
> We will be adding a device that uses it, so add it back.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Best regards,
Krzysztof

