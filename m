Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C34DA765326
	for <lists+linux-media@lfdr.de>; Thu, 27 Jul 2023 14:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232976AbjG0MDv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jul 2023 08:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbjG0MDu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jul 2023 08:03:50 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E522D4D
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 05:03:48 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe0c566788so1583309e87.0
        for <linux-media@vger.kernel.org>; Thu, 27 Jul 2023 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690459427; x=1691064227;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z08R74GQA6CyF7eBp92IqFAgOett4AVkmld9D8flfYY=;
        b=ZLydEIpvv7c48Ba5bqwcafZCK6LOTVbh3b+SF8NL90DZpBQaoswdQDzvyoUqOXKbce
         2nwNmhbyhn2wTjMZiETFGnE1XFFEN4XEVt78GG02981SbMaWa/gz+k/qwYWT+X0Jm28y
         UGdUvaCslMGwWwQlt9fb8sB0IN8Be47cl1Hfx+/lXjWoIlLcLrqeWosqbj19rkBrAehQ
         orkpELqg1tUgfmve4OFvguKCoAEVv0kBVnmMoXzh6SaL2aR0J3tZ2vVbeAvwgXsH3Y2J
         5fkWIOk2fUX4Q3JEcky6AHemPK/RkpBxCT0SXtSxPZPOrPKNgUWhZZ8jIT1+n19SluPn
         4W+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690459427; x=1691064227;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z08R74GQA6CyF7eBp92IqFAgOett4AVkmld9D8flfYY=;
        b=PVwY+/O6beQBVC9u1gqiLVC9ZpUq/EDG9eJ7aZKiM8c4UJNi1HmEllB1dLYGytI3oc
         nuKGhuQx8dOpHv7aTZmJyj0DXvSF80JM9GIt4H3K3cEXtZZU4p+ecFWJIfXrOxHBoftg
         UqCYlfSy1or6t8uvYIKOfnW5+hCh3gAT2v5ES4Sv0uMQ9G0yF0r69chGBcpudQccuH3t
         eqziZzIqZsviR/EoW9ZjMYbAtGw/bKdi/B0EcRgSTdqxb/Nyz/OHfPlAJWvhQGqK/I7u
         9QxbIJwwZJXGYZFDo9jWL5k/ic4Vr7elcVbjLRotnPb40OW/LUB8/lafuyyrn1Rsb9Pz
         Vx9g==
X-Gm-Message-State: ABy/qLZGFc+0/HC3XyF56GKhyo6VDhiiknr4TWOp6qD5mNYx8b+KTS7y
        RHuZMTOs5Mzoar6RCkdhOP/5Lg==
X-Google-Smtp-Source: APBJJlGa68G3SvlEaCpzoejDcYyswYaJYSgF3P2jkQad5FJeIKerdjwgECPqPT+mVs4ZtzlmWRMgYQ==
X-Received: by 2002:a05:651c:c8:b0:2b4:45bc:7bd with SMTP id 8-20020a05651c00c800b002b445bc07bdmr1473275ljr.4.1690459426956;
        Thu, 27 Jul 2023 05:03:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id s13-20020a1709060c0d00b009928b4e3b9fsm691425ejf.114.2023.07.27.05.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 05:03:46 -0700 (PDT)
Message-ID: <d6217fc3-e5f8-b629-2eac-4a778452ce74@linaro.org>
Date:   Thu, 27 Jul 2023 14:03:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] dt-bindings: media: Add bindings for Imagination
 E5010 JPEG Encoder driver
Content-Language: en-US
To:     Devarsh Thakkar <devarsht@ti.com>, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, eugen.hristev@collabora.com,
        ezequiel@vanguardiasur.com.ar, u.kleine-koenig@pengutronix.de,
        sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     praneeth@ti.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
        j-luthra@ti.com, b-brnich@ti.com, detheridge@ti.com,
        p-mantena@ti.com, vijayp@ti.com
References: <20230727112546.2201995-1-devarsht@ti.com>
 <20230727112546.2201995-2-devarsht@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230727112546.2201995-2-devarsht@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 27/07/2023 13:25, Devarsh Thakkar wrote:
> Add dt-bindings for Imagination E5010 JPEG Encoder driver which is
> implemented as stateful V4L2 M2M driver.
> 
> Co-developed-by: David Huang <d-huang@ti.com>
> Signed-off-by: David Huang <d-huang@ti.com>
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V2: No change, just sending this together with driver and cover-letter

So all other comments get ignored? Yeah, I see.

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

