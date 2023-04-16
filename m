Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F90C6E3B16
	for <lists+linux-media@lfdr.de>; Sun, 16 Apr 2023 20:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjDPSLv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 Apr 2023 14:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229956AbjDPSLt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 Apr 2023 14:11:49 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B96D62122
        for <linux-media@vger.kernel.org>; Sun, 16 Apr 2023 11:11:47 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id ud9so58346615ejc.7
        for <linux-media@vger.kernel.org>; Sun, 16 Apr 2023 11:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681668706; x=1684260706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6n5E4CO4kCJf3nGE58OKGGQOMHXRP5JjX8b0teIIoI=;
        b=ZzVcFejIqZ1u900JscVEO4eycpl/XhuypeXEfmIP1+mFuDcrOetJZg9pgtiTzhk7bV
         yv+jXuVWrZrgi63qs845JZT4+uDvwzRhGZg2n8vWHSdukWIGgXUdjiaR6Ge0TZTpLakV
         sd9idN4jVXnhSaWMnTx16O7GNfJwl2RJxPmgaOwy2gM80ImGxbWJ/eBotoETGIePkDwX
         DJuJA5rWLDcRjNYG3lJteHo2gmKiS1ZWg2Ezw/JZWqRmDGp+QFDFE0ULQWWs42ga2lHp
         SyfjD4jeLBXHheEGulco2Ne/KNSZYlVccr3fXkNH7H4NRBwIMAyPeussFZvDI/E9VsQD
         E4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681668706; x=1684260706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6n5E4CO4kCJf3nGE58OKGGQOMHXRP5JjX8b0teIIoI=;
        b=ECzCp7sFmaz28i2mpZRE4xyBhlb+j4E1FaMla8C+jdJiYWqRG/azk8Kb9edSpneNS0
         Q6h3OI1bS6xybxrZUpqG328Zkq9tuoG1qaUUVQAIH0HqrAVNyLhVdRa3bqSQKtPHPhNV
         OvqtvZs8cQAr/VT7zNa2Qc5bnLqBWpm9/yaPUgu2JQPmow/xA7yoxIokGnM9Gjsyb10+
         tWLenLhbyaSOX988u1J+VdngxVJ7BKC7M8OjxGpJztkC9NtEbxaxIM0wwka7SgUev9e/
         hjUW3KJqEVdZ8swSAV5rjdjrH77DPoes+pK5V6uuw/lXVfiXr/+uQ1xSzDHnei2wHmEF
         3Mrg==
X-Gm-Message-State: AAQBX9cdSxqzaifX/tnUx2qxBUT5yhoRmycRFwd3TthwiWqu1iI1E/mh
        upsOcCCrtqjv2XIUu/BmvKu7DQ==
X-Google-Smtp-Source: AKy350YdJ7HOUBtJuBV+9N3nl3r0pYo2W9W9x4AL+g+AIjJcSDFtAAeTr6+vxOUNtnVBQv5afOfW7w==
X-Received: by 2002:a17:906:c294:b0:94f:5242:a03a with SMTP id r20-20020a170906c29400b0094f5242a03amr2582922ejz.63.1681668706168;
        Sun, 16 Apr 2023 11:11:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id j15-20020a1709066dcf00b0094e0fab7705sm5375294ejt.107.2023.04.16.11.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 11:11:45 -0700 (PDT)
Message-ID: <930d9bfe-7b23-766a-a968-4d3822dede74@linaro.org>
Date:   Sun, 16 Apr 2023 20:11:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 11/12] dt-bindings: arm: samsung: Add Samsung Galaxy
 Tab3 family boards
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
 <20230416133422.1949-12-aweber.kernel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416133422.1949-12-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/04/2023 15:34, Artur Weber wrote:
> Add the compatible strings for the Samsung Galaxy Tab 3 8.0 series
> of tablets.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  .../bindings/arm/samsung/samsung-boards.yaml           | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index deb2cf971871..4ee026e7f7ad 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -104,6 +104,16 @@ properties:
>            - const: samsung,exynos4412
>            - const: samsung,exynos4
>  
> +      - description: Samsung Tab3 family boards

s/Samsung Tab3/Samsung Galaxy Tab3/

> +        items:
> +          - enum:
> +              - samsung,t310                    # Samsung Galaxy Tab 3 8.0 WiFi (SM-T310)
> +              - samsung,t311                    # Samsung Galaxy Tab 3 8.0 3G (SM-T311)
> +              - samsung,t315                    # Samsung Galaxy Tab 3 8.0 LTE (SM-T315)
> +          - const: samsung,tab3
> +          - const: samsung,exynos4212
> +          - const: samsung,exynos4

The entries are ordered by SoC compatible, so this should go before
Exynos4412.

> +
>        - description: Exynos5250 based boards
>          items:
>            - enum:

Best regards,
Krzysztof

