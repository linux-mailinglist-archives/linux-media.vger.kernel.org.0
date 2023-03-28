Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C58A66CC233
	for <lists+linux-media@lfdr.de>; Tue, 28 Mar 2023 16:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbjC1Ogk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 10:36:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjC1Ogj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 10:36:39 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2664C16D
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 07:36:02 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id x3so50522450edb.10
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 07:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680014161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkUxb1yN1awxacFzY/nANVpb9fbOuHgLElxbE/XrNOY=;
        b=NlviKrSbiJ6rmZgJIY/VL8iDRUl4VMonk0wujvV6GNcBmtzluNhpICT0Ja8dp/Vq5S
         E12AjeI1kEPzOpELfj85huH7m+wcQNlsZUvXLh2BTTSDx69C/CZbREsIyCRacau4esz8
         9JjbHSf9ZeMxxUKW7MMmvK1ZHj+IN0PaUa121RQ1T3xzdXJ3EN58hs2I17dfxln2/qj2
         snkgsiCg3lpu7PXAar871dT+anpr7PKrJANZhDXc8QN1MEambLNUHKzREzOOz9nat2IS
         DaxIhouOXvHf2ylVwaO6joJJQFLbZ4AGllwWd5o6JbDaHMhvpCNa6aJofxgfBT9xTGDt
         aAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680014161;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkUxb1yN1awxacFzY/nANVpb9fbOuHgLElxbE/XrNOY=;
        b=M7LWoxswJz2uzOBjupj2tuvgm+Mcn+3Qaz2B1SR/mmfk0xyEbMS4/nz4QaoBrERLHN
         jMgHkZLaUTwkkGa72BQkXO4ks+0luAgYS5yUiCHd0VFzQJLXE9cseklzIDcOY2DqCwPd
         N/UtS83cBRLm3pHiHoZESx1WqLu6CpVIodBjfr2+dnjEdMKixfWjdKJivYVbn7uSqqHN
         dXWGXiMxmnUgHgFsUyHCSb3XOd3n8JVOJq3yHUlPRJDkDFpXkor8ZfuOlLO+XOS7tgpI
         atlR9/7s4sV6DphSd+xh76bV0QMv4F1y8mLStPnTTPCL1/bXesxaHdfB42c1opvgG1OL
         wyYQ==
X-Gm-Message-State: AAQBX9fm+ohifelT8w5hrm+ocxWQPA9cG2HBLP8ITdlo9XOLylBaEM+d
        XmD5DEqHAD7mWET1jN+HnV2W/A==
X-Google-Smtp-Source: AKy350aMxSkeVpVehYPInFnohdXS1ZEfyugD9A3W5oUCVFJdHZugT2owddmW86nqFx5ryQ4w12jsRw==
X-Received: by 2002:a17:906:3449:b0:93b:b8f3:225d with SMTP id d9-20020a170906344900b0093bb8f3225dmr15892263ejb.15.1680014161037;
        Tue, 28 Mar 2023 07:36:01 -0700 (PDT)
Received: from [10.105.135.205] ([88.128.92.162])
        by smtp.gmail.com with ESMTPSA id p25-20020a50cd99000000b004bf76fdfdb3sm15808831edi.26.2023.03.28.07.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 07:36:00 -0700 (PDT)
Message-ID: <ad96f28a-7b2d-a58b-50fb-648063ed0b18@linaro.org>
Date:   Tue, 28 Mar 2023 16:35:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Patch v7] dt-bindings: media: s5p-mfc: convert bindings to
 json-schema
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
        pankaj.dubey@samsung.com
References: <CGME20230328114738epcas5p475b8fa1d1e86bbb86d004afe365e0259@epcas5p4.samsung.com>
 <20230328114729.61436-1-aakarsh.jain@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328114729.61436-1-aakarsh.jain@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 28/03/2023 13:47, Aakarsh Jain wrote:
> Convert s5p-mfc bindings to DT schema format using json-schema.
> 
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
> changes since v6:

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

