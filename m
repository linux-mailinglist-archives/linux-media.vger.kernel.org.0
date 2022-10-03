Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3825A5F3137
	for <lists+linux-media@lfdr.de>; Mon,  3 Oct 2022 15:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbiJCN0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Oct 2022 09:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiJCN0n (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Oct 2022 09:26:43 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20E3D205D0
        for <linux-media@vger.kernel.org>; Mon,  3 Oct 2022 06:26:42 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id b2so5645216lfp.6
        for <linux-media@vger.kernel.org>; Mon, 03 Oct 2022 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yRIMiFRHxfdGJDjG9K9HNpuOScDcKnyF2oEGJoSrlM4=;
        b=CCRAtD2B/gDLVtVgCmF4Q4OjwVBw0wDfwOpTt6CScLf+G88sFEV/U0as01pkrtLJ16
         mbfWdwO8Ozs19RiYvPdK81wU+r7P3sNtB3Oy7Y5NQbHzqzCU4kpcqnM1RXShBFJmTPZT
         VUkLDyIh26H2AIFUyvItrin8K2vImbAVe2K5Pn2DrjRqwLcF0BZMzV1olxAh6OCqYDSI
         8J9VYJxfljrKOO/LxRMCB9y1+rt7vzmm0iXKLw4QeFs84RtVvRK5Q+5eAMMKrgnNUjSU
         Arwdq+AcHdKwNzpsSUC8jrNjmjXUKuYBHvBYL0p90ahVtkkf577LrrkKk8sLqA1wxy5g
         gVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yRIMiFRHxfdGJDjG9K9HNpuOScDcKnyF2oEGJoSrlM4=;
        b=Q8j+QNWTQ3wsaKd2W2v9ijqDg8JXXeCy8x0UvQC0DVKBMv5UPgmmj0KAOT+9SS53Lh
         zg52+cpK6UD5BenOeP+KlhnwpbmkbtplukxoIPkRjhmTFBmqH7C9Y1LOmxaK4R9vZyaa
         8BXmBdUPo92pveqesLtXCcmkkNV8RA9AmAGHhh8KE50RqLLr3LHB65ccSGHucrqvIjeW
         4iVDUw1FthwQnKzlV9geSnAVHYKi74VueMgXC20PcY4icyDgc4cptbFpvzOs8crBx2Rt
         CVX0Ylq6OxWoeqUvnPzSDz+ghYJr1oArirZO+Zi2+L4uTA09CnPZ5GR3lFz5dPa5Vu5I
         Kx+g==
X-Gm-Message-State: ACrzQf1eFGZm7ZGI2vtC2eG5fI7+POOTrFbLtRybqOxa8WL2AlPwzqoa
        dBIXerFn0aGF7vMAcGkd8Hywcg==
X-Google-Smtp-Source: AMsMyM6LLORTXjbGJao6foKAioZdPQngaNSwlkj1I2jJGoa7BH0czKJEH7M00qNEosJEewFi3Y8F1w==
X-Received: by 2002:a05:6512:234c:b0:499:9c33:af96 with SMTP id p12-20020a056512234c00b004999c33af96mr7094704lfu.545.1664803600423;
        Mon, 03 Oct 2022 06:26:40 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n5-20020a0565120ac500b00492d7a7b4e3sm1462850lfu.4.2022.10.03.06.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 06:26:39 -0700 (PDT)
Message-ID: <01ead0ea-d0c7-7878-e411-c00cb5f78140@linaro.org>
Date:   Mon, 3 Oct 2022 15:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 1/2] media: dt-bindings: mediatek: Rename child node
 names for decoder
Content-Language: en-US
To:     Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20220930112237.14411-1-allen-kh.cheng@mediatek.com>
 <20220930112237.14411-2-allen-kh.cheng@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930112237.14411-2-allen-kh.cheng@mediatek.com>
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

On 30/09/2022 13:22, Allen-KH Cheng wrote:
> In order to make the names of the child nodes more generic, we rename
> "vcodec" to "video-codec" for decoder in patternProperties and example.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml    | 8 ++++----


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

