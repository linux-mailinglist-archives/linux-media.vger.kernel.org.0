Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0C269E478
	for <lists+linux-media@lfdr.de>; Tue, 21 Feb 2023 17:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234033AbjBUQZp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Feb 2023 11:25:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233708AbjBUQZn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Feb 2023 11:25:43 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22EF02364A
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 08:25:40 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id ck15so20675934edb.0
        for <linux-media@vger.kernel.org>; Tue, 21 Feb 2023 08:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EmtAropobHH5jGpYqAHqkULaNt2W7gxQm/IEh3Ch+0Y=;
        b=ymFAFLnesLHd3HEddgDcOcWsL0flQAAZA4gDciZdrxtkrcefcGweSrVJ4qhYOcwOeZ
         MVCLVkipshGbYLo/4KYCTNIfk7ZDN9iy+EtCP3r5XAQD5lvORlFfNLgLLXeA2Ef8FHwH
         IuuU/7AceKQUboT1MBCoYwRga7Yjx3Z3aNbQ+hL25XWv6A16GoEaPoUdKUon6w7rAmgq
         hOgEzc/S7Lcm1tj1nCNdrCRWMN5g0qVmOAAZmBlJqP0OizXVzLjJqgnxpkaSZkhxJoIw
         qp20qb71pTnS2wcIDpQdsO3LQAtrmK3WT5JMj+en1hDA0VYPNXbFhJmppQizoDSBL5sv
         8aEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EmtAropobHH5jGpYqAHqkULaNt2W7gxQm/IEh3Ch+0Y=;
        b=PK/lta9lKZZZ6do4EGngjBvSilNBM764NUQqExLwk86maYuDlzEsdHvfyOt5HTZZY5
         K6f72fxNx8lpKl4TKksHLdwfjLuQNm2h6h4c9MEKecQyd2WFfv8z0rCzmkhFkWfXnTrR
         FNnEBoWHPh4BPAqor7AFk5ZqA1+NvrT1tXs+bme9g2Ie2yeQwndldioCsLZJ6Srg4hzR
         aMYWMDLSQG1VqddfGtjXsb6B9m5PMsi4X3o7xC2brCJdOU8gZK72iOul3EiQUWtajFOc
         FGIgsRuEzSYffzWRRdkFEdDzWnhdxjKxd4aveybayYe3jRR/fXxvaba/6bz+9ReQuRQ1
         1OwQ==
X-Gm-Message-State: AO0yUKWHcnhhe0gtvRtGKfAZtEY1YldVZjqt2vRjBLZ1P+IYjFqOgrsM
        jxubKDOvUauLYeToHoPEY66mgQ==
X-Google-Smtp-Source: AK7set/mkLPXdZ5zUCcZhfGhJur4lYeYl9s3OmjcVyHcjZbvltRDLZAFJc+mDfFL8V3WjDaEXgdVpw==
X-Received: by 2002:aa7:d88f:0:b0:4ac:cb71:42c with SMTP id u15-20020aa7d88f000000b004accb71042cmr6004659edq.37.1676996738520;
        Tue, 21 Feb 2023 08:25:38 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t21-20020a50ab55000000b004acce817ab7sm2119014edc.2.2023.02.21.08.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 08:25:38 -0800 (PST)
Message-ID: <1c5eae73-04fa-722c-b6b2-8a39576ad1c5@linaro.org>
Date:   Tue, 21 Feb 2023 17:25:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Patch v3 01/15] dt-bindings: media: s5p-mfc: Add new DT schema
 for MFC
Content-Language: en-US
To:     aakarsh jain <aakarsh.jain@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     m.szyprowski@samsung.com, andrzej.hajda@intel.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, jernej.skrabec@gmail.com,
        benjamin.gaignard@collabora.com, stanimir.varbanov@linaro.org,
        dillon.minfei@gmail.com, david.plowman@raspberrypi.com,
        mark.rutland@arm.com, robh+dt@kernel.org, krzk+dt@kernel.org,
        andi@etezian.org, alim.akhtar@samsung.com,
        aswani.reddy@samsung.com, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, smitha.t@samsung.com
References: <20221011122516.32135-1-aakarsh.jain@samsung.com>
 <CGME20221011125142epcas5p13c858a5f27830fb1de50fa51e9730eca@epcas5p1.samsung.com>
 <20221011122516.32135-2-aakarsh.jain@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221011122516.32135-2-aakarsh.jain@samsung.com>
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

On 11/10/2022 14:25, aakarsh jain wrote:
> From: Smitha T Murthy <smitha.t@samsung.com>
> 
> Convert DT schema for s5p-mfc in yaml format
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Smitha T Murthy <smitha.t@samsung.com>
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
>  .../devicetree/bindings/media/s5p-mfc.txt     |  75 --------
>  .../bindings/media/samsung,s5p-mfc.yaml       | 163 ++++++++++++++++++

Hi Aakarsh,

Any plans for new version of this DT schema conversion? The Samsung MFC
is one of last remaining bigger pieces for conversion. We already have
100% bindings compliance for ARM64 but the MFC is missing for ARMv7:

https://pastebin.com/D8jXnjEe
(that's on my pending branch with all patches from LKML collected).

Best regards,
Krzysztof

