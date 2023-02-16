Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0F76990CC
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 11:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjBPKM4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 05:12:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbjBPKMy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 05:12:54 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE5B4DE1A
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 02:12:40 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id f21so3872463ejq.8
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 02:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HtoS5Fc6kievsx7bkF2ANsfXMDRCk+9jlUcWB2a1kVs=;
        b=MUX74fM+IUHv+p/En8Yx6YhlFnIv6hh8V9CUrNCxRSYE7l4PjbApUlcA6ub94vtGVf
         QvphSRTONfgz3x2IbC6Zfjt4xEhMN24MNXBQp+Q2rHiQWIM+mslW0QOehyLiqeSOr7ug
         skGENiBlQm+XFiJXDuHvtNfLxW7kHUOLh62ITu+SCn2eZ2WjtphbfHiuYFhA+9jSFqFU
         kAxmI8DirqgfGDul2Cd1zPdLhuYNX44/Fp4XhQW7ZoPSnfKehDxs1AX9HIiZfddoeeHJ
         yUuvEau0BAoLfQN4YeKCX6lBSg4heK4AGah1njTUCw/S5fFfBI0+2RrZds6SzvgB/B+A
         sxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HtoS5Fc6kievsx7bkF2ANsfXMDRCk+9jlUcWB2a1kVs=;
        b=MOXnGdY48UIuTBgk2yhFs3gGlHSVOJrcHhxipS8AsBOt6MN5vJLnEhPWBqgQibua/K
         lf0air1mO6OGxAFau683vZWtNG4V3MBhGGUI9WyZ3+BzHkRJeNt1mUof2qcY279HV0hk
         2EuCtGtZpm3gyGzJGrIqKz18PsQVWrAViy8tXay4J3eUztHhNKHIbftGRMOO6+DLTVks
         o/R1VKTeUjrBPZWA55htY1aT9NwiszUBhAMj6hhQVMFscIna6QhFbqZzDzTisN77+x/I
         ds9SfssyAL1gCkxQoztdIQDUEQuGuScc7dPzcgUMLTXZAUa70Hqfyl9+IBnSrb9LC2BQ
         nwZA==
X-Gm-Message-State: AO0yUKUqQiNhZ/bXYtwPFwui1jbgbY9WBUD7um7DJG6SfxAkHdOgWn2k
        8dyE8sDbVjHwtCcVTGTvq5xTHQ==
X-Google-Smtp-Source: AK7set9kEv33IzlcpbMW6jNn8Fo9bLHGXIfOLqekrMZyoJvtmhsq1EtAcSC3UaXikWeXB/MULq0fkQ==
X-Received: by 2002:a17:907:96a0:b0:8af:4418:8700 with SMTP id hd32-20020a17090796a000b008af44188700mr7029881ejc.47.1676542359481;
        Thu, 16 Feb 2023 02:12:39 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p9-20020a17090653c900b008b13039003csm609343ejo.166.2023.02.16.02.12.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:12:38 -0800 (PST)
Message-ID: <35ce2119-f33d-31cb-7c93-e68642828dfe@linaro.org>
Date:   Thu, 16 Feb 2023 11:12:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: media: meson-ir: Convert Amlogic Meson IR
 controller binding
Content-Language: en-US
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-media@vger.kernel.org,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        neil.armstrong@linaro.org
References: <a91e3a8e-7ef1-70bb-f6be-01a9a90c0e05@gmail.com>
 <a0e11df2-576c-da61-a583-81528cb77d20@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a0e11df2-576c-da61-a583-81528cb77d20@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/02/2023 10:02, Neil Armstrong wrote:
> Hi Heiner,
> 
> On 12/02/2023 17:51, Heiner Kallweit wrote:
>> Convert Amlogic Meson IR controller binding to yaml.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>   .../devicetree/bindings/media/meson-ir.txt    | 20 ---------
>>   .../devicetree/bindings/media/meson-ir.yaml   | 45 +++++++++++++++++++
>>   2 files changed, 45 insertions(+), 20 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/media/meson-ir.txt
>>   create mode 100644 Documentation/devicetree/bindings/media/meson-ir.yaml
> 
> I've already posted a patch for ir which is reviewed and ready to be merged :
> https://lore.kernel.org/all/20221117-b4-amlogic-bindings-convert-v3-4-e28dd31e3bed@linaro.org/

lore has useful keyword "dfn". Just put there "dfn:meson-ir.txt" before
converting bindings and it can spare you some effort.

Best regards,
Krzysztof

