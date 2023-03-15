Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65A4D6BA9A7
	for <lists+linux-media@lfdr.de>; Wed, 15 Mar 2023 08:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbjCOHpo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Mar 2023 03:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbjCOHpj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Mar 2023 03:45:39 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8734F31E25
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 00:45:35 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id cy23so71760744edb.12
        for <linux-media@vger.kernel.org>; Wed, 15 Mar 2023 00:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678866334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmXwlToH/e5W1q0ZH/ZtfDxKvmto9XQ3kAoMsQSVFFE=;
        b=hCa0X9sAt53YHCVUg/TkuhK2H/6aPpMwHLOh7igrx0Ap2v8uDVo8828ZbV/D13hZMs
         vHrjrtlAF87+CupvylCtmSmbmybe2cI+nvQgsPa9V+jSwtm9+bUYEA0JsbtW4foVAPRL
         hN8roV50pJoqnPB8P3i2/GLhHKF4edP5RuZpyaUd+c0AdVZc2t5d/2YqhvBhwyOgDDMT
         cYvYdmWKaJfQEEWKl0f5uOcFJXOGAkzGWAdkt5rOMokSEk6uRQNevwsvj+mk4e2pSj8W
         UpKRKt5SkHeHvmw/QY27v1Ox9FmcTMvkt//Iygxq+atqR7+OOYeKK2imBnsmxh80rCvH
         xsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678866334;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmXwlToH/e5W1q0ZH/ZtfDxKvmto9XQ3kAoMsQSVFFE=;
        b=zeIMCqCjegWF0NRvCnLEO1xHyB/KXL5vp1iFu1Og7BsANgtGluhp+/xezIqRqUWN5w
         RsXjZS0txzZrwgir3fcDJKT2Cy1aM63XpGJWAj1Jf59RFQDY29n8030QIPFerFA7R04h
         62B2yiYgWKhzT6KxNn2DdzDGZWsBFQS2i4Arb2DR1LpCtz4o4rOAW2xYucXlOA1O0Nms
         J6wWTOuY8zkuEIJFTT0rxfgEcFiraOB+/p7G53MX4xwbin4wRFY+myyGogtZ//+Kx4x4
         yGEeE1OCOzrNSBfOM9WyiCqMCRC2UjQsA5HytXcICxpMQEuAsMRNxRBQzuyyQQs+QbMF
         SIuw==
X-Gm-Message-State: AO0yUKXJbj9un9eep7tm5srPsgpZGC10njEMh1gI9P7TtQckIq6w3I89
        zliLbexNsKnVHXgqZsoM/xikaQ==
X-Google-Smtp-Source: AK7set+2wmOAgjAOQx9LiW4tbxQH4h3rfy1lWkysHWCygxpEtOcqdLpxvdtatzMoGqHXPUZMrBnR0Q==
X-Received: by 2002:a17:906:25c5:b0:8af:5403:992d with SMTP id n5-20020a17090625c500b008af5403992dmr4792415ejb.28.1678866334005;
        Wed, 15 Mar 2023 00:45:34 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd? ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
        by smtp.gmail.com with ESMTPSA id gf4-20020a170906e20400b0092396a853bbsm2145932ejb.143.2023.03.15.00.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 00:45:33 -0700 (PDT)
Message-ID: <f97ed61d-71d0-f05a-e4f8-abae8f9fbdd8@linaro.org>
Date:   Wed, 15 Mar 2023 08:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 13/13] media: dt-bindings: Convert Cadence CSI2RX
 binding to YAML
Content-Language: en-US
To:     Vaishnav Achath <vaishnav.a@ti.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, mripard@kernel.org, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        tomi.valkeinen@ideasonboard.com
Cc:     linux-kernel@vger.kernel.org, bparrot@ti.com,
        niklas.soderlund+renesas@ragnatech.se, j-luthra@ti.com,
        devarsht@ti.com, praneeth@ti.com, u-kumar1@ti.com, vigneshr@ti.com,
        nm@ti.com, martyn.welch@collabora.com
References: <20230314115516.667-1-vaishnav.a@ti.com>
 <20230314115516.667-14-vaishnav.a@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314115516.667-14-vaishnav.a@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/03/2023 12:55, Vaishnav Achath wrote:
> From: Pratyush Yadav <p.yadav@ti.com>
> 
> Convert the Cadence CSI2RX binding to use YAML schema.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> 
> (no changes since v5)
> 

So it seems your patchset is not bisectable. Fix this and test
bisectability. All patchsets are expected to be fully bisectable.

Best regards,
Krzysztof

