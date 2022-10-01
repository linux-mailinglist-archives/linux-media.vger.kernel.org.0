Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD7A5F1B76
	for <lists+linux-media@lfdr.de>; Sat,  1 Oct 2022 11:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229770AbiJAJi2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Oct 2022 05:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiJAJiH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Oct 2022 05:38:07 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 128A09E137
        for <linux-media@vger.kernel.org>; Sat,  1 Oct 2022 02:36:16 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id d42so10279114lfv.0
        for <linux-media@vger.kernel.org>; Sat, 01 Oct 2022 02:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ySbgyWorO38LTKoI632Q6sfES0ZxGVIwthdcT35EN3s=;
        b=mJ/9ekSO9l8O12V28K4iivy8XqKo2KIaLUmuGRw9zvgRVhgPgDKCQFOUVu7JzW7WQ9
         nmDIkf/G4ZY3Ftfa8DQYuzbws0JY8rcgovS3o+ZJ5UM2o0S3PSZe4O9UPvKlNr0Hyc/p
         Y9PDjP4idxY/CQGHJqz7IZKPYpzFLYacT4HHqS4JJnNGqdJGsdjWRtn2Fu+S70qHuC3G
         kJW7SiIS9ECVCWeGfhC4zVQh5MLlGZ5O9vCoRnviTub4Tt352aO+dA2/A8EP+od+BuDV
         eKenX8Y1EI3zxGiTtdEfg1I5joXQHbWlOB6h5jPYMuaUcTTo3I7vhM4z6juR1o61Qoms
         12bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ySbgyWorO38LTKoI632Q6sfES0ZxGVIwthdcT35EN3s=;
        b=FkyduHMEacASbITrlARUH6CBz4aySQcjqBRJq0EmzMN6hj62QdqgPVe65rD1a0L8ga
         wjWno/zqcvkyYeTA3UjLifxuAC/KJO0pGUtx/HxUJIqS5z9e0Y3cQhA/nzB9PduvOENj
         LnegmFa45acq0+IXoaKcytte8mkuYHz/X/i2toJfJiFN935eYroNQ4C1WQFZhyIS4dJO
         SO2x4Zx9lcPdg+OMyWDxYRdtgh9m9xmOShtOFyoaWYXOUDK39BcF5GX4VIJduKGI75oh
         dch/K0zKFOnErWj1v79zisCmPccMbYVz8INEbN90o04WrVhsIM14wnrNc0miSjSrn3Jq
         avjA==
X-Gm-Message-State: ACrzQf0C/hQ3qC8rkvdQ9WY8oK3VXJ2fAHqep8fvKW9XDofXEepo3Ezr
        8p+pblGVv/63GAUI4POs2vGtcQ==
X-Google-Smtp-Source: AMsMyM6bbgFZJ8+sMNM9l/WKxhLRKRd0nJAXEV+hIpBTsCya1wPJA5qXAuI/pKK8yArz4xPTLWDwvw==
X-Received: by 2002:a05:6512:b9d:b0:49b:9ad9:17c2 with SMTP id b29-20020a0565120b9d00b0049b9ad917c2mr4388114lfv.16.1664616974877;
        Sat, 01 Oct 2022 02:36:14 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id be43-20020a056512252b00b00494935ddb88sm704465lfb.240.2022.10.01.02.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 02:36:14 -0700 (PDT)
Message-ID: <c4870076-324a-a3a5-af1a-e812493b6436@linaro.org>
Date:   Sat, 1 Oct 2022 11:36:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] dt-bindings: mediatek: vcodec: Add the platform
 compatible to schema
Content-Language: en-US
To:     Irui Wang <irui.wang@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Maoguang Meng <maoguang.meng@mediatek.com>
References: <20221001030752.14486-1-irui.wang@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221001030752.14486-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/10/2022 05:07, Irui Wang wrote:
> There are venc node warnings when running dtbs_check, the clock-names
> was unexpected, missing properties '#address-cells' and '#size-cells'.
> Add the corresponding platform compatible to schema.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  .../bindings/media/mediatek,vcodec-encoder.yaml      | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

