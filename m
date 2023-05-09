Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 916726FCDAD
	for <lists+linux-media@lfdr.de>; Tue,  9 May 2023 20:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234420AbjEISWi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 May 2023 14:22:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjEISWh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 May 2023 14:22:37 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D72510C2
        for <linux-media@vger.kernel.org>; Tue,  9 May 2023 11:22:36 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-965fc25f009so830298166b.3
        for <linux-media@vger.kernel.org>; Tue, 09 May 2023 11:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683656555; x=1686248555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7dMhyasFr9nXSZl5Z5p5MReNTd4O4eHsrz0nla4Qm+s=;
        b=RMWGy7UP/JCkXpB3JKA2udiLxmUUOLWkyxxUMXXqsW+USiwJjT5yYUyCzL0hpyzENU
         6b7S6DwQW3rs7FYIMNJxBIxNL8/wfZ6EU+0LJa2x/errkOe16fJQYOGvBZIhd1tTgDKd
         5SxIHuICNQmrlSIRjzJ6ZcKgIVcF0TgB+KN6FCeXWkVac8W8U9t8+r5LvH+rZd//DDHO
         b02IJrUqA3qMztIJjAYtsa8YLbmhQUKmQU3rYN/gwHueJH+g5qID4fFcYvHEgTRaj+gU
         7OCv3HRUvrBa/+CHeBBd02Niw04FseRjJz7nojmaD6+Hl/afWqLYN2Lnkx5fmUefaxw9
         qmMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683656555; x=1686248555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7dMhyasFr9nXSZl5Z5p5MReNTd4O4eHsrz0nla4Qm+s=;
        b=Pb0q/FYAU2ZddXwMpNRLZCQt/OD57UV+mqFXd4xSYS3gNyLS5lxqzCVUyGp+GCPE5r
         XKL7dZY8Ky69mAmc2WvpFbBpdPtteEqCdQ3EQksDtbFMqbBG58yjcz+XAzfLRJ38ENUl
         WaYpH8EaYCnDKDl+fITWSCt+25l4jLwxlIZaCbEHImZ3ja70MMNVU4N0Is3KfnA5eNWA
         oJ76V5X2ogxQFlo9UTzjVuInC25KTw/JPGVmnI9kif2e8QFpyXZLL9FAR3LFhyF1LZsU
         LBj5v11471Cb4kR9Rifip4RXKNSAdjXNABROhhonDaQgra5yXPqgL0t/GpIEjHNr3O6j
         nk/A==
X-Gm-Message-State: AC+VfDyd57Lhz1sBdv++5kdf02mblKQfaPL9R0tOy7KsQyN7cpS5Xgkh
        7axzstnnk6FrkF/LbcLu8NElxw==
X-Google-Smtp-Source: ACHHUZ7GGPqJakf4qQTpgmeEUROOguTzfeOp6RuEtJHlxvapmbgQvPl4hRK3FghMJ3pOX/WWzIFvEA==
X-Received: by 2002:a17:906:58d5:b0:969:9fd0:7cee with SMTP id e21-20020a17090658d500b009699fd07ceemr5319936ejs.10.1683656554867;
        Tue, 09 May 2023 11:22:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76? ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
        by smtp.gmail.com with ESMTPSA id hy26-20020a1709068a7a00b0095fd0462695sm1630087ejc.5.2023.05.09.11.22.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 11:22:34 -0700 (PDT)
Message-ID: <7c724dc9-fef6-54e0-3470-7e8473494319@linaro.org>
Date:   Tue, 9 May 2023 20:22:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 00/13] Re-introduce Exynos4212 support and add Samsung
 Galaxy Tab 3 8.0 boards
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
References: <20230501195525.6268-1-aweber.kernel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230501195525.6268-1-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/05/2023 21:55, Artur Weber wrote:
> This patches re-introduces the Exynos4212 platform and adds support
> for the Samsung Galaxy Tab 3 8.0 series of tablets that uses it:
> 
>  - Samsung Galaxy Tab 3 8.0 WiFi (SM-T310/lt01wifi)
>  - Samsung Galaxy Tab 3 8.0 3G (SM-T311/lt013g)
>  - Samsung Galaxy Tab 3 8.0 LTE (SM-T315/lt01lte)
> 
> What works:
> 
>  - Display and backlight
>  - Touchscreen (without touchkeys)
>  - GPIO buttons, hall sensor
>  - WiFi and Bluetooth
>  - USB, fuel gauge, charging
>  - Accelerometer and magnetometer
>  - WiFi model only: light sensor


Thanks for the patches, nice work.

I applied parts of the set. Please:
1. Split the patchset per subsystems, so separate to media, phy and me.
2. Check reviews and resend bindings for display and LP855X.
3. Rebase and check/fix DTS and send a new version. I cannot apply DTS
without bindings being reviewed.


Best regards,
Krzysztof

