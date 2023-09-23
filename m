Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54B4C7AC3C5
	for <lists+linux-media@lfdr.de>; Sat, 23 Sep 2023 18:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbjIWQoM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 Sep 2023 12:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbjIWQoL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 Sep 2023 12:44:11 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E284139
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 09:44:04 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3231d6504e1so300671f8f.2
        for <linux-media@vger.kernel.org>; Sat, 23 Sep 2023 09:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695487442; x=1696092242; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rwXDdCQptEP/nw6d5R5qSVoajNpgD48V9SGyZsJIHbo=;
        b=VgAtCuhG9WB82v3Ua+ACr0m2DmqeDJ9kvZXXqQ5yV+NiZn6vuh2jLZmMERfJqtoeMh
         4BKqC9PsNaz7mmh82rnZagu4AkOsxXFMvT4sD7HHjReeVIDZgZ2eeFZlVVkxA89FbLVv
         HIy55OYhYpyKY7UMOS3CKu63piMW/U7KPDVxXQRglbdNgbtADaA8PMuyxJ5nDlIgk362
         TTZipco/PhPqcdew8f9PgIDAjZqn4sZkDrBpXd82aP3CX29S0SV+tjmv5bjLQazDH6Nn
         Ocu90pWGVGQn4rzD1h8DOaLXrOIkPOvgzy9Hx/kIiXjSxVJCczajW80SjwkNpxPvmeFC
         YLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695487442; x=1696092242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwXDdCQptEP/nw6d5R5qSVoajNpgD48V9SGyZsJIHbo=;
        b=Tdi87xeR/Ql/KMUt5Ab043mHVrNeM0iRX8hnIr05bwccvC73z4RVKP2P+X0H9C14Rn
         Fq/XjnuAt9q2iwlZrlJ5bYZMk31RhRuBa4jzovQbwYN8JUWBEv03LfN0GXEHarcXT0Qa
         agp5HfqUv7P8RuFkO3kGUw8nF93y4vMwH/Z0hdyw2Hn4HXTUkujZ2uHf+M9NF8LB4cyM
         b3lTYwamuLFftvvZ0b/rVPiNcor7YW5A+IrzqK3mqS4HfDGcgiUbYPuI+KtePrrzlxRM
         iOvpJ4HBhiLW+9CwyhbUshQtTZkeGdzWLJbC5k5vzjC8nka/QPQJUvDgd/MIjgSQpDsp
         OX6Q==
X-Gm-Message-State: AOJu0YwzaJOg5hbyOtcJpe1L4WM4D7shbBvkso6R4j2DP2LCXQoN0YfF
        dhtrMVw61B+7HhHPlcfbJH8mEA==
X-Google-Smtp-Source: AGHT+IGUp9vWURoqWCtTYN6CKaYvUBZmRKeL0YoxcxOlYDVcQJOgyOxbi3Pq3R8mE4CSABKxCOgFMg==
X-Received: by 2002:adf:fcc5:0:b0:320:b2a:4ea6 with SMTP id f5-20020adffcc5000000b003200b2a4ea6mr2618848wrs.9.1695487442674;
        Sat, 23 Sep 2023 09:44:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id s7-20020adfea87000000b0030ada01ca78sm7299990wrm.10.2023.09.23.09.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Sep 2023 09:44:02 -0700 (PDT)
Message-ID: <4e21d965-b7b6-8b2a-5e78-37b9da69b2f1@linaro.org>
Date:   Sat, 23 Sep 2023 18:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 03/16] dt-bindings: media: mediatek: mdp3: include
 common properties
Content-Language: en-US
To:     Moudy Ho <moudy.ho@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     dri-devel@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20230922072116.11009-1-moudy.ho@mediatek.com>
 <20230922072116.11009-4-moudy.ho@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230922072116.11009-4-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/09/2023 09:21, Moudy Ho wrote:
> To minimize duplication and standardize the document style,
> include the common properties for MT8183 RDMA.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> ---
>  .../bindings/media/mediatek,mdp3-rdma.yaml    | 43 ++-----------------
>  1 file changed, 4 insertions(+), 39 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> index 3e128733ef53..0539badc9821 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rdma.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/media/mediatek,mdp3-rdma.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: MediaTek Read Direct Memory Access
> +title: MediaTek MT8183 Read Direct Memory Access

How is this related to patch? Why rename is separate? This is poor way
to split your work.

Best regards,
Krzysztof

