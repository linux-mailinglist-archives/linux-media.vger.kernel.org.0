Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 980BC57B118
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 08:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbiGTG2b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jul 2022 02:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239936AbiGTG23 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jul 2022 02:28:29 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5E454B48F
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 23:28:27 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id a10so19974460ljj.5
        for <linux-media@vger.kernel.org>; Tue, 19 Jul 2022 23:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=iGIlqhxSlWfDFHRJ6mC4b3eFYcIQYybstvvJnU9esOQ=;
        b=UhRYFA7/LdF7XYBnvxrhbtAKNgFbmStp01s9LorBnZT9P/gNWlUpzMtDsJ7V13Hj94
         2KBIksodqZwwgXfk90DaKlYpfP/fkforCFjRfcCGg1PzzBuHUbe4UC8KjHDw7pc7Fdvq
         AHaRWe4HyuvuPcviYulWebVolSWtE73diELmsBeyJ/dM0Kz2uKD4ETpcA4/tcPaaIKJV
         VVrhWEbLg5rhyZ1yL2KXRNcwL1TtB9XOnWKktJMRsMcOxJs6leb8iSwnfDGFiuTuqMii
         Q8ejJfNCFQtwUyMlokGb7Q+4yH18Dx/RpNeRrhS6lMOBU+rBxDf6r7FNeZhRAWqoI4RG
         oTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iGIlqhxSlWfDFHRJ6mC4b3eFYcIQYybstvvJnU9esOQ=;
        b=UC2WKCmw8WNbHotB37KmfzIaWCP8NQlI0ihRtzkpfg2tlF28WbhdP9gtysRYEWjYwR
         gqUD08zMkwsbw/kcbPad0hl5BCkHT4jpDP+t2oSv43+PmZcC1Qi+eIRbJS79uwJpl6yX
         YIPigWtre62UF3ScjlWielWuK41JGxa+ae+qZew6s13JtedVjk8/6TQsien2ANzwu7/J
         lwj0CQVzIjlWOOAjkd28z42wnJmMV6PnlVe7mA3JgCs/xKkCgZmYvLrClpnoyAFKpCMW
         LyNLZUu5M/6Me5aEZt1DG8r6WHqf0PEmi0YE9Ed5O/CvcocVOHEvHBhTGdAJZ0aDerXF
         s3mg==
X-Gm-Message-State: AJIora/RQawugmXkDppgSzQOOLU5SxOukjBjWH3USt1+P4IFRrDwqJJf
        YuJObsHeJ5BVb43Mvo9o5IzNqylMiodpUx97
X-Google-Smtp-Source: AGRyM1siG1a6lGXNfYqKnVxqm2uEHALLXWVQNvG6wDpmJgK0FropWIFYWjsRsqncZiQDfr78WgDjoQ==
X-Received: by 2002:a05:651c:4c9:b0:25d:8599:5637 with SMTP id e9-20020a05651c04c900b0025d85995637mr16842827lji.163.1658298506308;
        Tue, 19 Jul 2022 23:28:26 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id j28-20020ac2551c000000b0048329aa6c92sm3607514lfk.139.2022.07.19.23.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 23:28:25 -0700 (PDT)
Message-ID: <2a19c8ec-ee4e-5a6d-b2ac-a25ef080cd09@linaro.org>
Date:   Wed, 20 Jul 2022 08:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] dt-bindings: media: mediatek-jpeg-decoder: Add MT8188
 compatible string
Content-Language: en-US
To:     Jianhua Lin <jianhua.lin@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220719100214.2096-1-jianhua.lin@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220719100214.2096-1-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/07/2022 12:02, Jianhua Lin wrote:
> Add compatible for MT8188 jpeg decoder.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../devicetree/bindings/media/mediatek-jpeg-decoder.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
