Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21CE84EBBF9
	for <lists+linux-media@lfdr.de>; Wed, 30 Mar 2022 09:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243867AbiC3Hoo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Mar 2022 03:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243932AbiC3Hnw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Mar 2022 03:43:52 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE0D52B07
        for <linux-media@vger.kernel.org>; Wed, 30 Mar 2022 00:42:06 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id lr4so31298988ejb.11
        for <linux-media@vger.kernel.org>; Wed, 30 Mar 2022 00:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CAYinFU48pRYzH9ypQ83dA4qoMQIqXMxR9XiHLU1ytE=;
        b=Yxl53MkHQTDvxeth2Pj3so7IZxw6NfvkbzQAs7uD6BuTynOacGF86d/KwlId5wkDuw
         oaAI4wUkjpUO+oxJwbwIMGzndDe3Asrhrn7iWpT5Kmpd8YwJqKANq38tv5rGKoyk8dW+
         aywHgBQza72kAMy32n9tPiwLAPly3/zevxSEVnlrVUOHlfueKR6rNikwh39XXP5qiD6r
         sbRN3fG9sOAwq5zxv3S7aLEU5/KlQQO0PzGxxJ1tDOC3mg8P5xlB5sLfbP0p6OI25Qeg
         wdW36drIC+2c6ew2c9ElOaaRHo3Q0tZCit52qlhF75ijQsA1i51Sv/H2E9exJzd0xwG1
         BXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CAYinFU48pRYzH9ypQ83dA4qoMQIqXMxR9XiHLU1ytE=;
        b=faaLvhMP+OfFw0cPE3ymbJmzR1MtZ14md8N61rIdFZ1aCwkXslgQ5uwT5qznuB70Kj
         R2d1cPJBNACW+fWd3bNpykG1miQL561QEfM9W8FKVAj7oFsdQPjf1JYDLjanxsMDJOb+
         Wk4ahdc4ywSBXp0whzu3WFQ6S2yKtvg6Azdryg8y/b/BsCutyKqmgAPeMwPewj5nlcMQ
         03cuLK7rZQ4GnJByv6/HUGwdWsINo0hRd0nQ0QEaiDqQuFdhuIbJ52XE5VSCJphUeeuM
         tI+Kq+5nsm8BwcDdqxyblOg8o+2FOJ56qImTpZWrJjzqwSDJGXOny/CrHjf4U1EWP3HM
         JkRg==
X-Gm-Message-State: AOAM531IKOPEaHn6FVfBPIjaJwMsfV4bLe3CCHKFOyZTEjFTvA2CUaey
        SqcI8p+aIUgdjD75aCKhMTku0OIWBAdF5ouS
X-Google-Smtp-Source: ABdhPJyOPRhQxvUhK4fvpnSNakz63gvVXneotEDoygnpiKAsbjmeSUZhHtrQTYAFMBHAv1KsiA9lGQ==
X-Received: by 2002:a17:906:53c3:b0:6cf:742d:84de with SMTP id p3-20020a17090653c300b006cf742d84demr37677933ejo.576.1648626124935;
        Wed, 30 Mar 2022 00:42:04 -0700 (PDT)
Received: from [192.168.0.162] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id w14-20020a170906d20e00b006cee22553f7sm8002911ejz.213.2022.03.30.00.42.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Mar 2022 00:42:04 -0700 (PDT)
Message-ID: <a79e9ec2-d522-cd08-3947-60a29a702547@linaro.org>
Date:   Wed, 30 Mar 2022 09:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 1/2] dt-bindings: Convert Dongwoon dw9807-vcm bindings
 to json-schema
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org
References: <20220330073341.588550-1-sakari.ailus@linux.intel.com>
 <20220330073341.588550-2-sakari.ailus@linux.intel.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220330073341.588550-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/03/2022 09:33, Sakari Ailus wrote:
> Convert the old text based dw9807-vcm chip DT bindings to json-schema.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/i2c/dongwoon,dw9807-vcm.txt         |  9 ----
>  .../media/i2c/dongwoon,dw9807-vcm.yaml        | 41 +++++++++++++++++++
>  2 files changed, 41 insertions(+), 9 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
