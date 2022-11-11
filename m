Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA7696254F6
	for <lists+linux-media@lfdr.de>; Fri, 11 Nov 2022 09:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbiKKIKs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Nov 2022 03:10:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233129AbiKKIKn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Nov 2022 03:10:43 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE117832C
        for <linux-media@vger.kernel.org>; Fri, 11 Nov 2022 00:10:42 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id g12so7276812lfh.3
        for <linux-media@vger.kernel.org>; Fri, 11 Nov 2022 00:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MzAy5meGjwQ/InrlG2I98BKggIHGTjNBmOG6pUO6dkc=;
        b=Xcw9On4h27nqAtUbOOYseoVPLsY2bnsEhPNaKyOn+TVR9n9njJAGcVymZzpkYfnhbv
         ZJMonHYchoaWGeFvKk+jggNPnFf2wNL8ggpoxFvz8X1fL5jgZ/nigPywRAQwCpt63DLs
         Q1DdxWObKNQc5yiWArbq4LI4wRYhlnpSB4r85v7jw7AaLgZ2+QQ3DTC6J8urLzlQPqva
         HUT3fvdP7eYbbOJe4Dr9x1ha0D+nb/uSCUPYWg5xhrnnwhwjdwEphzDUsVdnq1MstSMj
         BfXSosIK0+fwt7BsL+JGCzbMYW1+0/aPejqTDDzmK+e4dq2r4rzqjKQvDJHY9ifXxsNa
         y3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzAy5meGjwQ/InrlG2I98BKggIHGTjNBmOG6pUO6dkc=;
        b=GCnmqW/60uRrDMuvyZPnkzWXAD5QoS97hxYy+Vvigv2BBXyVK7QU3OUxp62t6UxzNH
         X4LxAhlPT5ewVyuaHgLaE4Cyut3WN6eRtrIlR8hZGaKJbOJLL54BK/1JgJSHndbhQVO9
         msnhiMRFkFbDJbdoTYU7rXGpM2otExb22wvYMTVIOTwVNXeCttJQ8zewkXVgUdD4SYDx
         /XYQ0sRUWbbIsrMiEKxBvn7NN2Zk5OJbpVfi2T6pBSSPLMUWn0+1Rj6f8Xn5d606Vpsm
         984PUdLHyNoQmmMqzKsIXQ0DVaNI8e916Ay0AyDWCJowxBpUnRAM++tpcevTx1jQJs8q
         oLBw==
X-Gm-Message-State: ANoB5plLPkdGjmehhhbB5FNPHCDTcyIifrQqqbrrD2ly9rEzJz0vo0UI
        /UMetB1A+CFEoJ6dvU85cel2nw==
X-Google-Smtp-Source: AA0mqf6NiswRKjxe+tlWxl+vlzIGWnrSa2ODCTbyizH2znT83X8Z+gfAEU3Uluz0WJ0ykTWLAeiKtQ==
X-Received: by 2002:ac2:48a7:0:b0:4b3:9fcb:df92 with SMTP id u7-20020ac248a7000000b004b39fcbdf92mr341884lfg.607.1668154240758;
        Fri, 11 Nov 2022 00:10:40 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id m1-20020a056512114100b004ac6a444b26sm209790lfg.141.2022.11.11.00.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 00:10:40 -0800 (PST)
Message-ID: <b766bd0b-aecc-3b9d-27df-2615d648d9bd@linaro.org>
Date:   Fri, 11 Nov 2022 09:10:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [Patch v3 3/3] ARM: dts: exynos: Rename compatible string
 property from version to SoC specific
Content-Language: en-US
To:     Aakarsh Jain <aakarsh.jain@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     m.szyprowski@samsung.com, andrzej.hajda@intel.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@vanguardiasur.com.ar, jernej.skrabec@gmail.com,
        benjamin.gaignard@collabora.com, krzysztof.kozlowski+dt@linaro.org,
        stanimir.varbanov@linaro.org, dillon.minfei@gmail.com,
        david.plowman@raspberrypi.com, mark.rutland@arm.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, andi@etezian.org,
        alim.akhtar@samsung.com, aswani.reddy@samsung.com,
        pankaj.dubey@samsung.com, smitha.t@samsung.com
References: <20221111032337.79219-1-aakarsh.jain@samsung.com>
 <CGME20221111031718epcas5p3df130145b4bb99424fd5aa4addf77ba5@epcas5p3.samsung.com>
 <20221111032337.79219-4-aakarsh.jain@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221111032337.79219-4-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/11/2022 04:23, Aakarsh Jain wrote:
> commit "752d3a23d1f68de87e3c" which adds MFC codec device node
> for exynos3250 SoC. Since exynos3250.dtsi and exynos5420.dtsi are
> using same compatible string as "samsung,mfc-v7" but their
> node properties are different.As both SoCs have MFC v7 hardware
> module but with different clock hierarchy and complexity.
> So renaming compatible string from version specific to SoC based.
> 
> Reviewed-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> Suggested-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index 326b9e0ed8d3..98105c64f7d9 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -485,7 +485,7 @@
>  		};
>  
>  		mfc: codec@13400000 {
> -			compatible = "samsung,mfc-v7";
> +			compatible = "samsung,exynos3250-mfc";

No improvements. Changeset is non-bisectable. I said it in v1, then in
v2. So now third time... Don't send a new version if you are not going
to fix it or resolve discussion.

In cover letter you said "Addressed review comments from Krzysztof
Kozlowski", so please explain me, how did you resolve my comments about
fallback for this patch and for bindings patch?

Best regards,
Krzysztof

