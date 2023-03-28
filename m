Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 247406CBDA2
	for <lists+linux-media@lfdr.de>; Tue, 28 Mar 2023 13:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232891AbjC1L2H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 07:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232709AbjC1L2A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 07:28:00 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5657ED3
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 04:27:39 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id x3so48127002edb.10
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 04:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680002857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GAkHG8mXBvC5XRqLHF9TQwBYaBntZMzJhH4KgLmDku4=;
        b=gOhh4hk8a4hUCtDKd8je1OeGypCqSJxEta4qbGoxzHKHb7k/9Apn1HjJAOD/bBRbIu
         SjawJOAMKp5jiy92aW7BogohcUHvK+ph1kw5DxqmTi9L1wL4s5E7lkVe0N5Vnlve4Ozy
         limmsxOgjspbytr67X0LofbLRnie2OvVo2HwGcwENJULiIKleGy06iehnvd+6KKjwEud
         oZy0po20oRcPrkvTx+xkiJjSo7g2qGTPcztIc/qKe1q9arHwumTIZ5eRDD/Xqx9HCQtO
         RuK5uHxqSyFmPcPddZz8aOOHgwm4vb3uTQQYqoweMzjkSxJa9oF7gzdtBY/0EeIAkMKH
         ce4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680002857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GAkHG8mXBvC5XRqLHF9TQwBYaBntZMzJhH4KgLmDku4=;
        b=snhlJDfH+7e9dfvaT5gwOq2EGbogQVc1voFQsk4uwUYmKz02FZl3IY2onmK8ixULhK
         Txf3q87jactQth5nuS8LXNKtNqUtEclX9yBI7QK8dAmH3MJ3zMkWEBi6ahQCXlPmjPb6
         SFoi9nbDD7ecIhiDJczUo8e1EssMsuSrTBXu0g1X1sG7d4knLDUdkpM8sr019lXdNF+j
         U2TX5h2EfsXZlIyYE+VVauTlAZMxXavxNtgWA7r1G+fnXcLIoWJybeKwtD6FIJNHMjv9
         096XrPiegCDsKMhHJMIjx+s/q8hqfXKfrKb3KJwUrUAH1NQD7fwccsSj45pyEYS/4Fk7
         U55A==
X-Gm-Message-State: AAQBX9d/z8zeYwHNFL28UOx7o2o9PCkb3At2oRq2Ai2eD0ifXlKyikE3
        OeKHSwqMHJFvW8+8ZN5vmzlAnA==
X-Google-Smtp-Source: AKy350b2FhVFE6LLZfo4qn82JGV0SdYzuoXmH5qTv2+u5e34yodQIjAQ3Qx3NTtmHQ+Iw5gC+n3T7Q==
X-Received: by 2002:a17:906:d7a2:b0:92a:f756:28fa with SMTP id pk2-20020a170906d7a200b0092af75628famr14832481ejb.31.1680002857486;
        Tue, 28 Mar 2023 04:27:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id rk28-20020a170907215c00b00933b38505f9sm12628495ejb.152.2023.03.28.04.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 04:27:37 -0700 (PDT)
Message-ID: <5ccd01bb-6df3-736b-4cc8-72f44370a0fb@linaro.org>
Date:   Tue, 28 Mar 2023 13:27:35 +0200
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
References: <CGME20230328110425epcas5p15549774de4c3a831d59cbe7e5a2c7961@epcas5p1.samsung.com>
 <20230328110419.46722-1-aakarsh.jain@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328110419.46722-1-aakarsh.jain@samsung.com>
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

On 28/03/2023 13:04, Aakarsh Jain wrote:
> Convert s5p-mfc bindings to DT schema format using json-schema.
> 
> Signed-off-by: Aakarsh Jain <aakarsh.jain@samsung.com>
> ---
> changes since v6:
> kept hw properties for Exynos3250 and Exynos4 
> under different if:then condition.
> 
> changes since v5:
> kept compatible strings under enum
> sorted compatible strings
> added iommu maxItems:2
> Added indentation with 4 spaces in dts example
> 
> changes since v4:
> Removed items from oneOf section
> dropped black line
> defined the iommus names items as
> items:
> -const left
> -const right
> 
> changes since v3:
> fixed dt-schema warnings and errors while running make dtbs_check and make dt_binding_check for ARMv7
> Since, obsolete properties are not part of dt-node so we are not including these properties in dt-schema.
> 
> changes since v2:
> changed Commit message from Adds to Convert
> Removed text "This file has moved to samsung,s5p-mfc.yaml" from s5p-mfc.txt
> fixed dt-schema warnings and errors while running make dtbs_check and make dt_binding_check
> 
> changes since v1:
> fixed dt-schema warnings and errors while running make dtbs_check and make dt_binding_check
> Removed description.
> Listed items.
> Added allOf:if:then for restricting two items to specific compatible
> 
> This patch is independent from the previous MFC v12 patch series for HW3 support.
>  .../devicetree/bindings/media/s5p-mfc.txt     |  78 --------
>  .../bindings/media/samsung,s5p-mfc.yaml       | 184 ++++++++++++++++++
>  2 files changed, 184 insertions(+), 78 deletions(-)

This patch does not apply. Please double check your setup.

Applying: dt-bindings: media: s5p-mfc: convert bindings to json-schema
Patch failed at 0001 dt-bindings: media: s5p-mfc: convert bindings to
json-schema
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".
error: dev/null: does not exist in index
hint: Use 'git am --show-current-patch=diff' to see the failed patch

Best regards,
Krzysztof

