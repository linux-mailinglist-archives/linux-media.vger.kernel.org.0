Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A1AE6A92DF
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 09:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230013AbjCCIok (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 03:44:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbjCCIoj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 03:44:39 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E636E9F
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 00:44:37 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id i34so7321731eda.7
        for <linux-media@vger.kernel.org>; Fri, 03 Mar 2023 00:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677833076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qvh2uZadadKVcOPdwQuXrWjYKqPWL4xXt9TZ6a59v/s=;
        b=aULI2xQYlTQ+8wME+luUiJjOQZk1lWtUc/mGBk3qwDvzfFnpXEasAS30316ym07zvJ
         Z2HsRmTEflb/nBxWFGEqUoqwssl7WsxkdAM3EFr08hWKXWreqcFf1BsEumK9vlxtbZf/
         kYp++5ryV9z2N/iqT5CmXGZxF9cNbL89x0PITkT8YAcCcGEj6+KgN+FeXhHiL0wycS5M
         D9KJegSzVpTaCDgfuKFf6/mw0WG7xIK6ujXVA5zXnEPvDVm82qzjtUuJih2LIbn3Y4uD
         w3M3xAMyQzQtaPBew//jOo0sg+KUVG9OsNlC74zoOIbfwyg5kiH7b6a516iV7h2K66Jf
         UgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677833076;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qvh2uZadadKVcOPdwQuXrWjYKqPWL4xXt9TZ6a59v/s=;
        b=I9Eqohn/8fz4FrPXZLJ1k6ssxnpIqVX4jb9lK3kUtYPKd4Zo2DWRBrUZjx/QMINgry
         5c8430F89gSxfdBt4n6tSVOb16l1qCG8GAXaem8JDBt2nN+KfUQxV018avwvo2fqxpg1
         BI1ZB8sgiChJ+wLEkC+sWpWfMSHUuya+VgQqXTriM6P3C1gidPg7yJdQdi/tUO9OqA1F
         NGtwEfFlBLRHfpmCM1iziGUDgF9QBzLj6sV1jhHpuy4SkCdOoP40nWUM+vVmf2sec6Vq
         1Uh33lFYbbPX7PfFc/yc3lgO40IWE1PqkKp0Rfw4EJJN54f+UOU3BD2Mo65+WfmRUnai
         I2dQ==
X-Gm-Message-State: AO0yUKUo+GPQx5wBLQK9eUrFRSecT4hAVLIZ9IrEefgv6EvNV6lO0g0O
        RMxuW3YsE5GiluVPgldn9a/IVw==
X-Google-Smtp-Source: AK7set9guf0Ei0AvJ5vPjfqlMT48crvwCPk4scTOi1NwB8aQRjacC6ZXynwtzhS1cIRCK+nhkqmuYg==
X-Received: by 2002:a17:906:5dcb:b0:8b1:7eb7:d53d with SMTP id p11-20020a1709065dcb00b008b17eb7d53dmr1037070ejv.49.1677833076008;
        Fri, 03 Mar 2023 00:44:36 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id rp21-20020a170906d97500b008de50990fa7sm718669ejb.21.2023.03.03.00.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 00:44:35 -0800 (PST)
Message-ID: <58f7f327-5328-8c03-4a0f-783588705972@linaro.org>
Date:   Fri, 3 Mar 2023 09:44:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 10/11] media: uapi: add user space interfaces
Content-Language: en-US
To:     "jack.zhu" <jack.zhu@starfivetech.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, changhuang.liang@starfivetech.com
References: <20230302091921.43309-1-jack.zhu@starfivetech.com>
 <20230302091921.43309-11-jack.zhu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302091921.43309-11-jack.zhu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2023 10:19, jack.zhu wrote:
> This patch adds user space interfaces for ISP.

Do not use "This commit/patch".
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95


Why this is a separate commit? User-space API is usually added with its
implementation. Otherwise how does your code even compile?

Best regards,
Krzysztof

