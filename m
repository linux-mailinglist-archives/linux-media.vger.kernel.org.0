Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D41E65B1BB8
	for <lists+linux-media@lfdr.de>; Thu,  8 Sep 2022 13:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbiIHLks (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Sep 2022 07:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiIHLkq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Sep 2022 07:40:46 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3CDD11CD69
        for <linux-media@vger.kernel.org>; Thu,  8 Sep 2022 04:40:42 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id i26so11504804lfp.11
        for <linux-media@vger.kernel.org>; Thu, 08 Sep 2022 04:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=qq/g+XZ2JG1ZYrx3xeBVADNTQBoVz4BOIGZJJbEw4f0=;
        b=heg1JrEV84eY8Gs6IdvBMz1whgCoFw1U50y9XCCyoeV//ROtbYnmpDR47lPPduAt2C
         gVYC1F9xXKQpIAA+odJPLIbbU6NVBUMthbo5CyvdQ7mpIyYhWfBCh2bBug2lXaYPDhz7
         Crs216zxWWymg+rluvLHUVEOM1ZfpRD05Z95BjhMkEIabTZowvwYzPlFXCtdln4uhPtn
         W2cGytNj3DxzUN9MRa30vvk0KawizOMwaWPbb1oI1oDCz+aqx/Ksiwt2iEc6rvq7GEBy
         1QXm24jCzjQ3kYmNrd0Ky1Ys6JuZON4QZWN9LH6wBs3O0i9oAlBSHO2ewTyNlkpt1PnH
         uirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qq/g+XZ2JG1ZYrx3xeBVADNTQBoVz4BOIGZJJbEw4f0=;
        b=02otPclK3RLKm0EGcjsjnbBE+6JDizy8pJRuXClQrxoHkF1+RtXaGtQwwVsxWSSHpi
         7g2OBESJ6URmmuRyt9M+xLqOmppQ4Syeg0kcGnIunuCERotXl6nRlLVMQHP6JjfIfzNV
         5X74d4lsfZfdWdsJKDF6PDhZDRfCo3Z3jO+xrq8FA0LOh+zHpXgruRwudKgWpaQMc4NE
         JIpffFlpVqvPmwYnDmY6ft/Hh9VeyjNbbkzTamKkYnd2RGMRONzFMa61SqlHFnyxzgdR
         vLhBHbR8DjvR8BT1Ox+XI6BmQgGJWBr1B4hKWm8b3gozAkhSCgZUEDPfUXBXkAdlnomE
         iqlQ==
X-Gm-Message-State: ACgBeo3chRVYEfDvTTTXodRm2NSGC8V1nuOR6GEtKm0jv+rzPh+rsnwH
        LVjDmjhqFg09PfBKwlpjc8CeKA==
X-Google-Smtp-Source: AA6agR4MHJFcXDkMHVXkwOkvsyyAjGenkME1tXoT11nKD0yOsg5Yi8PmifMypUg49w/SLQrIIDavvA==
X-Received: by 2002:ac2:4429:0:b0:497:a5e9:d14a with SMTP id w9-20020ac24429000000b00497a5e9d14amr2894276lfl.372.1662637241277;
        Thu, 08 Sep 2022 04:40:41 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 11-20020ac25f4b000000b00492ce573726sm3012704lfz.47.2022.09.08.04.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 04:40:40 -0700 (PDT)
Message-ID: <29d456ed-620c-8dc9-01f0-54f96b670b94@linaro.org>
Date:   Thu, 8 Sep 2022 13:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/4] media: dt-bindings: Document Renesas RZ/G2L CRU
 block
Content-Language: en-US
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jacopo Mondi <jacopo@jmondi.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
References: <20220905230406.30801-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220905230406.30801-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220905230406.30801-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/09/2022 01:04, Lad Prabhakar wrote:
> Document the CRU block found on Renesas RZ/G2L (and alike) SoCs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thank you for your patch. There is something to discuss/improve.

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a07g044-cru       # RZ/G2{L,LC}
> +          - renesas,r9a07g054-cru       # RZ/V2L
> +      - const: renesas,rzg2l-cru
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: image_conv
> +      - const: image_conv_err
> +      - const: axi_mst_err
> +
> +  clocks:
> +    items:
> +      - description: CRU Main clock
> +      - description: CPU Register access clock
> +      - description: CRU image transfer clock
> +
> +  clock-names:
> +    items:
> +      - const: vclk
> +      - const: pclk
> +      - const: aclk

Drop the "clk" suffixes. Remaining names could be made a bit more readable.

> +
Best regards,
Krzysztof
