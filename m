Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5CA7AC40A
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 19:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbjIWRi2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 13:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbjIWRi0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 13:38:26 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8FF193
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 10:38:19 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40535597f01so38410655e9.3
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 10:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695490698; x=1696095498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V10gzi2RlVQOmrv/zaocoqbYLQ49RKI1zclTkXbhh6E=;
        b=qHRpuCk+zZZenbhV9rlmHo+SQ5viQqIHa3HNxyyJfHOTssYG3D0U/1ds/naEiuCatl
         ExvFiun7pThXb49Z/R7hiKpVDxrxPr8XbwzrBEXgE52deOwYXIhOZ6NLzd6A6gyD3kw1
         VND3hgiV4+LXakH6+p2KnrRiH+lSU50o3RKyju6srNWqMugQD8yYi6fiGBfGg4Af+98H
         +y1jQdaKPZDxbNxsWbsxNp/PP+zuzjb9+xc9NGT2nlME38JlBbX0c6Hjt00Yos0qWJsf
         t3JRVzEzdf2ROYsKzLPM8jjyctjD7FQStZBBiKvnjPM+Nkv8UM/ynNPIkkmuoKTwvjYg
         JFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695490698; x=1696095498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V10gzi2RlVQOmrv/zaocoqbYLQ49RKI1zclTkXbhh6E=;
        b=BYH9JkLnVZEcKUsN6dCBkwDoez6zHzXc4VtRPWF8kVPKYwoP2syt5FfhRl8zN7DwXj
         FZ3r09P83hFk+sukKQLicNJ1XkDBi0SwkDUDdINtm6bzbCt6M3zSyG9uf+bPRzQT5IyR
         U2T0cZz3+1cf2Fo6kl53dQXG/Y9uuGBtIn3jg6gGeolHt/hU2Dad/xAvUI4Ubm2mtZiG
         cMegZIEhKLyAtvabG5xrDMUS5QLuihGfqXR5L7NqSBQPnAKnfSoVKENCWrhJbPaaGPgc
         TNO+7EbjW4lynccbFIuiVhsWvyrimMTSwoKrBWuL3TzzStMkC23dz1dFWFcHZnDLY6OV
         janQ==
X-Gm-Message-State: AOJu0YyOAVDnMvsohYBJiRcNIZu/D62N+GVJQfh/wVrtgLPvPAfeJsnX
        D76GEHdwi19AFTL/mqo88HeDbg==
X-Google-Smtp-Source: AGHT+IFCjRZIcLO+0g8diFjimp5gtGgP355llzi7E+8lc8YGycCcAJHapljUSf7AamsNzyP9lncAsA==
X-Received: by 2002:a7b:c38e:0:b0:405:37bb:d942 with SMTP id s14-20020a7bc38e000000b0040537bbd942mr1967658wmj.4.1695490697643;
        Sat, 23 Sep 2023 10:38:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c248b00b003fee567235bsm10604723wms.1.2023.09.23.10.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 10:38:17 -0700 (PDT)
Message-ID: <e4311804-bb06-ec04-8479-dfa0466e4b35@linaro.org>
Date:   Sat, 23 Sep 2023 19:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/2] media: dt-bindings: mediatek: Add phandle to
 mediatek,scp on MDP3 RDMA
Content-Language: en-US
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, mchehab@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, matthias.bgg@gmail.com, moudy.ho@mediatek.com,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        u.kleine-koenig@pengutronix.de, linqiheng@huawei.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        wenst@chromium.org
References: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com>
 <20230919095938.70679-2-angelogioacchino.delregno@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230919095938.70679-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/09/2023 11:59, AngeloGioacchino Del Regno wrote:
> The MDP3 RDMA needs to communicate with the SCP remote processor: allow
> specifying a phandle to a SCP core.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/media/mediatek,mdp3-rdma.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index d639a1461143..0e5ce2e77e99 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -46,6 +46,11 @@ properties:
>        include/dt-bindings/gce/<chip>-gce.h of each chips.
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>  
> +  mediatek,scp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the System Control Processor (SCP) node

Why? Why do you need it? For what do you add here phandle? Your
description should explain the purpose.

Best regards,
Krzysztof

