Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E38E950C980
	for <lists+linux-media@lfdr.de>; Sat, 23 Apr 2022 13:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbiDWLNr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Apr 2022 07:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235161AbiDWLNm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Apr 2022 07:13:42 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA6011759C5
        for <linux-media@vger.kernel.org>; Sat, 23 Apr 2022 04:10:44 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id r13so20895562ejd.5
        for <linux-media@vger.kernel.org>; Sat, 23 Apr 2022 04:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=YOA1DyguzoVjmBi7XCeE8zovNraVkKZ3s4vArozjUoE=;
        b=uIzGnS/huGv+QjwaGUzL9SbzKv72wyULmUBtKBPSqYGoTICDxBZKYEInQtMAIIM8n9
         FqjNjbc3uR2AJWOqscy8acx38wPlm5bMvVAJlPW0KtwlmAGJH02y4nmXdXPRCaqlJDGC
         J2DatpZ36PNJR8h7KRRIPCuaGbsjF0OIxZ5QFx8BcUbmVDugQRg9Duo9HSP+UEgJznC5
         M94tGjOPF4+zX6NNNbNfkrK1xbwOPSzJhYEAx2Cl84qhu48rf27fQlbFTxvChiLB97KM
         Ubc1raX5zuWd+7O/0hFBNZ/ylifHwVqDLfo6i0cPT655WpQDkns1be3PI7e46DnLazPb
         hk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YOA1DyguzoVjmBi7XCeE8zovNraVkKZ3s4vArozjUoE=;
        b=sFfXuvpy1qVExgnHoBN86hfJfvOqg0eQND2eV2tiEsopMCWEIS/iDY9e9bOBYDnjVB
         +ZHHQjqGCFAJGk7+kZjJuBIgc77UyP2GVR1guj1cJsGaPSkehXH8097eqcQ0+6mX6HJv
         iEaE+JL//jQWtWASJh7RllT9ciFMj/8NYbzPUjG3Ej3LMK066zgUQL6WqFGyUAAulVJJ
         QQhmpIEWLT0KUZ91Qdaq2jUmfjNdHI8858/8+HeVm7+bTY9AUz/ylM8DRG7Bc6AiVD7S
         eOJKnGjplhoeZjfd77Fhgi1uKJD8j7d+x7H0K75xupst/3IqgkRytB1CArCG7XwEPzl0
         PqbQ==
X-Gm-Message-State: AOAM533G0uleVsdviUZsChKLot4VP/6rP5CVOUMj2O53d1OiVRrgbL4T
        5MsoAFrot3Q26UtRmgTBENL0MQ==
X-Google-Smtp-Source: ABdhPJxhtL97HOhbKuFx3GU4SYR07afL0RgN1lqtAdGzxLeDjbXG68ptL7Ip57i9TdZTa4ssiU3SVg==
X-Received: by 2002:a17:906:7f02:b0:6cf:86d8:c31c with SMTP id d2-20020a1709067f0200b006cf86d8c31cmr8235764ejr.518.1650712243005;
        Sat, 23 Apr 2022 04:10:43 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c2-20020a170906170200b006efe7be5f10sm1586405eje.185.2022.04.23.04.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 04:10:42 -0700 (PDT)
Message-ID: <ff87d5cb-b0d4-95a2-90b0-7827a2a34d05@linaro.org>
Date:   Sat, 23 Apr 2022 13:10:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] media: dt-bindings: media: rockchip-vdec: Add RK3328
 compatible
Content-Language: en-US
To:     Christopher Obbard <chris.obbard@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Johan Jonker <jbx6244@gmail.com>,
        Alex Bee <knaerzche@gmail.com>,
        Elaine Zhang <zhangqing@rock-chips.com>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20220422133803.989256-1-chris.obbard@collabora.com>
 <20220422133803.989256-2-chris.obbard@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422133803.989256-2-chris.obbard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/04/2022 15:38, Christopher Obbard wrote:
> Document the RK3328 compatible for rockchip-vdec.
> 
> Signed-off-by: Christopher Obbard <chris.obbard@collabora.com>
> ---
>  Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
