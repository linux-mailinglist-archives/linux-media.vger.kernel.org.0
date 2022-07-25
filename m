Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E763F5802B6
	for <lists+linux-media@lfdr.de>; Mon, 25 Jul 2022 18:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236147AbiGYQbO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Jul 2022 12:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236027AbiGYQbN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Jul 2022 12:31:13 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C76B65FB
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 09:31:12 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id m12so17808411lfj.4
        for <linux-media@vger.kernel.org>; Mon, 25 Jul 2022 09:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=4Njask7Y7NcDaGQmjQ0MHzpAHWiB3LrAGSEayvbjElM=;
        b=dlWIzQSxMabu5KosPx5jW4XNbWn99t4uk1uInDNruuL4aWMZlnsGAdwmkuESz9kni6
         EjVtsRxXB89YYEWRkNtZq0LdT0b94qQudSi6Gp7AtD5X64t+GvjKi6/s1hBMv9v5l3O1
         B4Yir05ezUIL6CO95+wKCdnoO3lZ+wK983HCNnaD5FOG28hAysfhxPRqcSFh+CiXc9Fw
         XIR7Z2ifAmR7KqHZ7Iy2Scf6VcPVDFhK9Dt+ytNUvw0OB7D9HBx39UDjGgKzeVW2jwf6
         sxXpSHCkDCnrLRFnnSI5a1itXbaftgXbJf/9jEZ4a/E86huInVm8Py6660ZDxsOr8w1I
         2Nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4Njask7Y7NcDaGQmjQ0MHzpAHWiB3LrAGSEayvbjElM=;
        b=hWHg7eUnX8fc4Z3vz99Iq1UhHZsTgSwJ+uwFe+AKNwVzABJQGpUnb0ZVVmJlAa7dbF
         x1WGcqktYjPoC9nbYKxuRo2rR1c7jIFn4GoIEYECEw4sNUpywaj/9ENsW13T1vVUKodM
         S+yYmXuPadvKxUy8sK2wRFTMgbJJIn3vkN2/8I5mGDVy2GowLb1Cpv4rP9gUh0GRc554
         IXBYZHWx7+uTeFColkm+xw9ZyIqXI0RZoK2skTuZKRtYspbkJMserG802/APoVWCdNaQ
         7yOXemzuPJjKrELjJm+rrUigu1nkB5nAwBj9DrQvuU+CEYdT3j0OWbK/9XkGjz13QgLO
         nfgA==
X-Gm-Message-State: AJIora/43d5eYBiVtiiAVlDrY0Ye0VDarDZgCgst1fMJ2nh0Gx61o806
        zujWaBjCk//rjbxKO6eBWr7E/g==
X-Google-Smtp-Source: AGRyM1uZV+8Fizi+VmedQAV84B90DJEWpiCH26Mk33Otp0KJLxGM3PrgDc4XawhKFmqciR5YDfgoLw==
X-Received: by 2002:a05:6512:4020:b0:48a:8d1b:c8c3 with SMTP id br32-20020a056512402000b0048a8d1bc8c3mr2315086lfb.131.1658766670590;
        Mon, 25 Jul 2022 09:31:10 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id c6-20020a056512324600b0048759bc6c1asm163179lfr.203.2022.07.25.09.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 09:31:10 -0700 (PDT)
Message-ID: <efb62771-4a4c-c166-7a31-0e44df2c0908@linaro.org>
Date:   Mon, 25 Jul 2022 18:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [v5 3/4] dt-bindings: arm: add Magicbox M16S bindings
Content-Language: en-US
To:     Zhang Ning <zhangn1985@qq.com>, martin.blumenstingl@googlemail.com,
        narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        sean@mess.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20220724231704.132472-1-zhangn1985@qq.com>
 <tencent_529DC7E641BA7022B2C1C7C0E7427C2CB805@qq.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_529DC7E641BA7022B2C1C7C0E7427C2CB805@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/07/2022 01:17, Zhang Ning wrote:
> Add the board binding for Magicbox M16S Tv Box
> 
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>

Don't forget proper mail titles (PATCH and prefix). git format-patch
solves the first, git log --oneline gives you hint about second. So this
should be:

[PATCH v5 3/4] dt-bindings: arm: amlogic: add Magicbox M16S bindings

> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +


Best regards,
Krzysztof
