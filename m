Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFED55608D3
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 20:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231562AbiF2SO6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 14:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiF2SO5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 14:14:57 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E5DB3981D
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 11:14:56 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id d2so22486002ejy.1
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 11:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=NziNT6MNguSPfaLeIkcj56yMTj39Rh5hBsiCp5bGSdg=;
        b=LsJXJbFZRJTbiLn5URdeYDqyRrsEB9AjiEI3FZW3SzmJPnqEHB8mj08e0nd/gDZGmG
         yV85LKcnG0crC9zMUr9MabIwVPSOeTF9EDD5yNon9vscKAHcZrKr2f5Pz004Kzt9Nt0A
         iwYGWuOe+WgTlitjnO5rlk42Lj+ugdU+QxhRaI7pUAfE6PB1cH9chWg6aV4dT1yeIi8f
         cT59NteWT13PRpe7EfiPKdXq4KhhA++yOm7qFr9DJ0o2wWTyT2Q481b7qAB3mq1UnNx7
         +5ooICn20J01plV04b2utW5Il3MYdtLc/wxslTb0miKoOYpPjbnLFl8PUuAPHyLBTpI4
         46Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NziNT6MNguSPfaLeIkcj56yMTj39Rh5hBsiCp5bGSdg=;
        b=UcYvIMfl/HsedIT8UKKG35fxlKHfhUkTS2xsa2qngoNcfuvT7PW6lxartscTx5gyrT
         mHDTmx1dErBY5ANf8RAihfuoUfDet5KGbZt+K2RViefDRTBnsvGteoKBeq1tpixeBtjv
         ucNHteX0AS+h9Zj6f2MTSM3sX4D620f3t7w0GStBosmafTGHtANN4EvPnWkmIZ/2WkOc
         CbfOj1VOZT5qmwLJxpiUc7Ll86+k+Qi0Nkn2ma9dsklqNyALHYhLKxQ/g2BOkYIY9AlM
         u03vngcEy5zhJwQ3bWRIaG+5g5loD+EpLlw7U3DG7oGyx/B5NGNw+EdW3vTyFZJLDuze
         yUuA==
X-Gm-Message-State: AJIora/tXFyKsYLimlUDG4AO0C9dF+8+Xwlmopku4UCvgTSnAFgAQM3i
        G4ttgOoEX15Qd0zB9Jz1RtmEfXK00j3jKw==
X-Google-Smtp-Source: AGRyM1u/G4E7GLqQZ4XLYwXSjMnjgtISwubh4x4xRbKvOAOKAMpyY7/fomUlsZKQ6WoUlSnXYLT94g==
X-Received: by 2002:a17:907:3e86:b0:6f5:917:10cc with SMTP id hs6-20020a1709073e8600b006f5091710ccmr4703960ejc.53.1656526494727;
        Wed, 29 Jun 2022 11:14:54 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id fx7-20020a170906b74700b0072232a898f1sm8030915ejb.103.2022.06.29.11.14.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 11:14:54 -0700 (PDT)
Message-ID: <673c2e59-d1c5-f6b8-df80-b5a46a7aa92e@linaro.org>
Date:   Wed, 29 Jun 2022 20:14:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 5/6] media: dt-bindings: ov5693: document YAML binding
Content-Language: en-US
To:     Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220629152933.422990-1-tommaso.merciai@amarulasolutions.com>
 <20220629152933.422990-6-tommaso.merciai@amarulasolutions.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629152933.422990-6-tommaso.merciai@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/06/2022 17:29, Tommaso Merciai wrote:
> Add documentation of device tree in YAML schema for the OV5693
> CMOS image sensor from Omnivision
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> ---
> Changes since v1:
>  - Fix allOf position as suggested by Krzysztof
>  - Remove port description as suggested by Krzysztof
>  - Fix EOF as suggested by Krzysztof
> 
> Changes since v2:
>  - Fix commit body as suggested by Krzysztof

You received a tag, so if you decided to send v3, you need to include it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
