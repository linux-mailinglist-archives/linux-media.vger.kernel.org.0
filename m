Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 689DD6A92D5
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 09:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbjCCInf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 03:43:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbjCCIne (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 03:43:34 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA4D2FCFE
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 00:43:31 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id cw28so7355242edb.5
        for <linux-media@vger.kernel.org>; Fri, 03 Mar 2023 00:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677833010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n1SHnypdnvbI7SIdNVtDw35hlwQf+FyIzygcPEhvN5k=;
        b=BYmToDteLTHaLTm4P9MHkO6cvhq95+Lmg3ZHCcoiaiChkRjBFbD6fIPnwy1OXzkpBr
         pbbqDOcAogwTCRFdFEBqnsd6Zw67bUZ0Ko49rT2RY6zCMPMn3D8GRn1kbe+AK6v87cbT
         zRFmJt2DBxA2tOg6tnn3iDdeV6zVX7s+v1jKYpb5HoeUh9cCKMvwlqEiQZ5M4rUvyI+Y
         nJv6kUvLBbIkUrus7lneqZejeMfWejKg5t/JNkm13alTtUAwOxwWEvsykjTBk1OwfHCJ
         K8+rH5xUvIV7UzEKt2MwAUq7VjgAYHI8ZyrPuPThlYPM+fwfK5K1lZmiUpSByhKv0tJf
         uajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677833010;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n1SHnypdnvbI7SIdNVtDw35hlwQf+FyIzygcPEhvN5k=;
        b=ObyWYww94aKZKU4rXRDcZZFOEfqhE7S4zfY9uwFD8sYw52DnNcGJJsC96AHSAKizbX
         ktewpJBhqS3v823X1XgnZ0/LGU47TiDTC6ir58Ii/utdI/GHl7x0ND1cix8oFV3O+Cfz
         3FgGVutacVrjaFMcZ1n3TgGXk8Qid2LaoSU73shNC3PMY330u8ixXxbXM8ixHnTwyYGP
         N52/QE+WVQoya1zNDpNM5MA6mfCwAxSuACqBMpz6J+NpY9tiVeJSMwsAfDS7C1u3tOvS
         NMDhAVow7mWh0oT4W8lMaoru/s71tkEdjGwifJvkoSiEpq55yk0bZKmpb2k199K25Ot7
         KWeQ==
X-Gm-Message-State: AO0yUKWjiBMYtOoQD16PCtSej+3uJ2egTFE9dEzDzbEmE5UR6Qs1Mk0i
        +e1qFysxO3Y4qnmEI4/PUr61tQ==
X-Google-Smtp-Source: AK7set/+JGRmw9ap1A1Qpd1ItK/VpFw3Zdya1otCv0GrqomDlgivyeq9IO7YrQGwxjrhPnvMiXw7Fg==
X-Received: by 2002:a17:907:8c09:b0:88a:888b:c8b with SMTP id ta9-20020a1709078c0900b0088a888b0c8bmr1062300ejc.35.1677833009833;
        Fri, 03 Mar 2023 00:43:29 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n26-20020a50c21a000000b004a27046b7a7sm877520edf.73.2023.03.03.00.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 00:43:29 -0800 (PST)
Message-ID: <bd6c9135-e12c-a6ac-db46-416403850751@linaro.org>
Date:   Fri, 3 Mar 2023 09:43:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 11/11] media: starfive: enable building
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
 <20230302091921.43309-12-jack.zhu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302091921.43309-12-jack.zhu@starfivetech.com>
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
> Add Kconfig and Makefie, update platform/Kconfig and platform/Makefile
> to enable building of the Starfive Camera subsystem driver.
> 
> Signed-off-by: jack.zhu <jack.zhu@starfivetech.com>
> ---
>  drivers/media/platform/Kconfig           |  1 +
>  drivers/media/platform/Makefile          |  1 +
>  drivers/media/platform/starfive/Kconfig  | 18 ++++++++++++++++++
>  drivers/media/platform/starfive/Makefile | 14 ++++++++++++++

This is not a separate commit. If it were, it would mean you just added
dead code in previous commits, so why adding dead code in first place?

Squash it.

Best regards,
Krzysztof

