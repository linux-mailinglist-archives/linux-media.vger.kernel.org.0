Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C13C2650FCB
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 17:07:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231938AbiLSQGa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 11:06:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbiLSQGU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 11:06:20 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CB3624E
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 08:06:18 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id l8so9555973ljh.13
        for <linux-media@vger.kernel.org>; Mon, 19 Dec 2022 08:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M+4tYd3CxbSvf8zH5cdwJjhDf6cj78jW8dlV2PwZrO4=;
        b=Yj7JXHUtphgN5jXsu6UmBBLgfBUgb81AY/LintM9iY/2MITDq+AFIJw0IzqFvv0jhP
         1pcvfDrD8Qoue5N3wzPh5TiGnVYxkhv1w0R87fNVBlBsSt9DpjqUECy5mE0D5/6s68kc
         Epq8DBgT+ozFUCyQ/+6SyX3e/jllfUaRDYszAOzcL3JR20/XKBkkWRu+4CHH4E6CzHD5
         uo88eKrjzRwHEmkm3QbErdaBsVAFZ/C5b1LsGMSxx8QKPuFRm5BKYzwFrTcoN0PiUedI
         AiCdtOvLuzIIV2EL6ofK2pGAED1Iq0HbnBHUKFmFSRxJdeTMgv/hVUYber1CRSzKglue
         ig3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M+4tYd3CxbSvf8zH5cdwJjhDf6cj78jW8dlV2PwZrO4=;
        b=qnMnMTpbCFLnvOU1ihwXYdXNvYNJivCpGOd9P1btxgiUovtggPzgnxVINH3XmKMLOE
         gNBIMdkD8jND+QVXaau06ZB/m7PHjYN1Wu4dJb1mdrOhpicxh1Y2/SQRG54ruBAwBm9j
         Jb7hfBiZ1z9sLkcflPzP+NbLryVa+O5MoRUPzBIceuianCeCu/vhPKeq3VcnRYoytWxK
         nRXo57bZn3hxyKNEOqXy2u9QK5vY4UEI3gNq2gQ0X9rTdDnXqBseCf5x8AwzBTMEJdEO
         kMRu3V34oft+oeR7NEH3r2E+fRZOqykEGfR+MH4IlENtkFmd49iUg2KSw3C7ttJ9p9vg
         IHPA==
X-Gm-Message-State: ANoB5plByFGFy5ccga7aS+gWcCI/zsC7NQ/7pcFBx9HdQ9fjHu6qa9/f
        ElhtAM+UiNgFly/n6NCWY1fWWA==
X-Google-Smtp-Source: AA0mqf6bOLXKFRkGnajgbY32B8ChnrA0jqtigotJ2lGx8ta88YSyTO2ePQaOpALU7q1z+4AB2xZx1Q==
X-Received: by 2002:a2e:a5c5:0:b0:277:360c:f95e with SMTP id n5-20020a2ea5c5000000b00277360cf95emr12010169ljp.31.1671465976704;
        Mon, 19 Dec 2022 08:06:16 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b3-20020a2eb903000000b0027c8bc7d6fcsm742840ljb.136.2022.12.19.08.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 08:06:16 -0800 (PST)
Message-ID: <15146b26-438b-698a-9e17-cb4ef2318420@linaro.org>
Date:   Mon, 19 Dec 2022 17:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 1/9] dt-bindings: media: rockchip-vpu: Add rk3588 vpu
 compatible
Content-Language: en-US
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
        mchehab@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de,
        daniel.almeida@collabora.com, nicolas.dufresne@collabora.co.uk
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20221219155616.848690-1-benjamin.gaignard@collabora.com>
 <20221219155616.848690-2-benjamin.gaignard@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221219155616.848690-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/12/2022 16:56, Benjamin Gaignard wrote:
> Add compatible for rk3588 AV1 vpu decoder.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip-vpu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> index 6cc4d3e5a61d..8454df53f5cb 100644
> --- a/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/rockchip-vpu.yaml
> @@ -24,6 +24,7 @@ properties:
>            - rockchip,rk3399-vpu
>            - rockchip,px30-vpu
>            - rockchip,rk3568-vpu
> +          - rockchip,rk3588-av1-vpu

Why "av1" suffix? Is there another type (different device, different
programming model) expected on rk3588?

Best regards,
Krzysztof

