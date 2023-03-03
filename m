Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D62FF6A92C3
	for <lists+linux-media@lfdr.de>; Fri,  3 Mar 2023 09:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjCCImw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Mar 2023 03:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCCImv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Mar 2023 03:42:51 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C802639289
        for <linux-media@vger.kernel.org>; Fri,  3 Mar 2023 00:42:49 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id a25so7578784edb.0
        for <linux-media@vger.kernel.org>; Fri, 03 Mar 2023 00:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677832968;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLOUIZx9WDFWdN5CirsjbqxM6evn8dw+cWTW1QIfdfc=;
        b=T5+K/Y91Skx/RvzD55591mvfgziJEv9wgW4h40/fvOnkIs7CmK00GKm7gJ896NjweD
         zTLcitEoctrmfviKiehgrQ9Gm8UmA1OBQm+HjIeIIlV6QPB35BtYFA/jELYlqj/aMaFM
         oxfpbp1eAmOgPs0Fsu6/YrCOQl6TjMS56pjZKLvjW5mgvRfn6+1BDOCua9iC5IGS8PIG
         fx4KYei0z3YYd2sRpSHe/98URmToDOjiskqqlbvgnmAT+aZ8OvbqDEU885JLS98Cnri/
         0HfnTkSRV43gtvd/2+E3lp8/xNNcOHAaej6milgvuAe4I/rcR7ye2wRIRPPIvXygM/VZ
         lqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677832968;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rLOUIZx9WDFWdN5CirsjbqxM6evn8dw+cWTW1QIfdfc=;
        b=C+yEItaC04WxDZIPyLlmTSz5G3q8iFAnoaHi7KbQ9n45xvw5DQVZwrfD6jrqFEJ+Od
         2fH+RMDjfZlMvpQY2hA/46N8RWxYcnwczWjGVQhqzHrq5YyTIq0GZF2y9BZiZcNGtFeF
         wFIXx8NVLympnhf0flOPTjAKVwFBQ7P//LjELvqVjvMnOPWacuTjMyxkmdTm0mC9cIBp
         b4G1l3SysFaCt9jY972KPd/h/LG9Br+2Cly0SO5Fq6a7e+6k3BNgoYgDtV9llk010nrW
         cBMgfALNTnBFDOV8kLPzNul7qpjnjJUT/AN2Dw8VtZiMLQQU+0yTUKgd3wqPd9+jLCFo
         glnA==
X-Gm-Message-State: AO0yUKXZe91d/9u2/sJU0FuaRfaKyCu/E0uWqPU4xLgO/fCozzKtthzq
        +JO0ZJqpaHVJ8A9x61VeCEMOzA==
X-Google-Smtp-Source: AK7set9LhDmLFPCHsd81iJVWwd/0AzPrLgsgBh7lbUes1LhydkUSYO0fy6IO3TLBu+e0FZG6auPLmw==
X-Received: by 2002:a17:907:6d08:b0:8ed:5af8:d4ba with SMTP id sa8-20020a1709076d0800b008ed5af8d4bamr912025ejc.38.1677832968369;
        Fri, 03 Mar 2023 00:42:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id si9-20020a170906cec900b008c5075f5331sm695798ejb.165.2023.03.03.00.42.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 00:42:48 -0800 (PST)
Message-ID: <c39f8ecf-26e7-3187-2488-d9fb0f64d2fa@linaro.org>
Date:   Fri, 3 Mar 2023 09:42:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 04/11] MAINTAINERS: add Starfive Camera subsystem
 driver
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
 <20230302091921.43309-5-jack.zhu@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230302091921.43309-5-jack.zhu@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/03/2023 10:19, jack.zhu wrote:
> Add an entry for Starfive Camera subsystem driver.
> 
> Signed-off-by: jack.zhu <jack.zhu@starfivetech.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8ddef8669efb..a202deb4cb1a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19906,6 +19906,15 @@ M:	Ion Badulescu <ionut@badula.org>
>  S:	Odd Fixes
>  F:	drivers/net/ethernet/adaptec/starfire*
>  
> +STARFIVE CAMERA SUBSYSTEM DRIVER
> +M:	Jack Zhu <jack.zhu@starfivetech.com>
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +L:	linux-media@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/admin-guide/media/starfive_camss.rst
> +F:	Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml

Why only one binding, not all of them?

Best regards,
Krzysztof

