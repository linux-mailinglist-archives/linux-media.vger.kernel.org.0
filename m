Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63C9E4E1B5C
	for <lists+linux-media@lfdr.de>; Sun, 20 Mar 2022 12:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244904AbiCTL6Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Mar 2022 07:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbiCTL6P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Mar 2022 07:58:15 -0400
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98840AC92B;
        Sun, 20 Mar 2022 04:56:52 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id r13so24978248ejd.5;
        Sun, 20 Mar 2022 04:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sruYchkBRXH3sRK8ZEllhY7HtHs0rZDzWFFzAzqzRS8=;
        b=BggyK1VS4pnoVswAeeue+Ow7SCmFHo3B27Km0hNsbVQISQNrFV4qzO3dYCad3OMsbJ
         j5EpADdvsyrezN8bvypWBwucDrZMCHAHRdeDaB2TvMZUkDKxdSzcGB+fzjWosKBqbsgg
         NjPdDMK6Age6TYWsg2mXx/vsR/3Apzixt8H/0f2jlQ/yUo3ASHYdL/5JH2bHAj0T5FXq
         JkaNQqsSIk8WDQFmw7TRj5AQeV+UWf4Md7pMN9XpmObZr18GkGOn864/+G2cSyxSifeD
         GhDWdgHz0sMQU9+RiBI8crKyxjEDii7Ah73+xpuXqFUAH6SzQSrtfpbvn839yTDLCb7C
         FIgw==
X-Gm-Message-State: AOAM5310fwit1yO2WBMg3ouXsoHs0bofGKT/GQs8WdBN20mwhUTlrReh
        TqDxAG2OT78vEQaaCmrEpO1jNkloPbs=
X-Google-Smtp-Source: ABdhPJzQ8Tv2cmjmTcxLJIr2WjFtv9c/hihaoWIMZurnhNCRHkuWnF+hVK6g8YcEyy9Sc2iubjVKRw==
X-Received: by 2002:a17:906:c145:b0:6da:aaaf:770c with SMTP id dp5-20020a170906c14500b006daaaaf770cmr16497046ejc.504.1647777411094;
        Sun, 20 Mar 2022 04:56:51 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.googlemail.com with ESMTPSA id v2-20020a509d02000000b00412d53177a6sm6697913ede.20.2022.03.20.04.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Mar 2022 04:56:50 -0700 (PDT)
Message-ID: <035a1501-4a40-2f1a-2220-1a35a4419876@kernel.org>
Date:   Sun, 20 Mar 2022 12:56:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] dt-bindings: Convert Dongwoon dw9807-vcm bindings to
 json-schema
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     devicetree@vger.kernel.org, robh@kernel.org
References: <20220318165119.12191-1-sakari.ailus@linux.intel.com>
 <20220318165119.12191-2-sakari.ailus@linux.intel.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220318165119.12191-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/03/2022 17:51, Sakari Ailus wrote:
> Convert the old text based dw9807-vcm chip DT bindings to json-schema.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../media/i2c/dongwoon,dw9807-vcm.txt         |  9 ----
>  .../media/i2c/dongwoon,dw9807-vcm.yaml        | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 9 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
> deleted file mode 100644
> index c4701f1eaaf63..0000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.txt
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -Dongwoon Anatech DW9807 voice coil lens driver
> -
> -DW9807 is a 10-bit DAC with current sink capability. It is intended for
> -controlling voice coil lenses.
> -
> -Mandatory properties:
> -
> -- compatible: "dongwoon,dw9807-vcm"
> -- reg: I2C slave address
> diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
> new file mode 100644
> index 0000000000000..0cf153ed547fe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9807-vcm.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2018, 2021 Intel Corporation
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9807-vcm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Dongwoon Anatech DW9807 voice coil lens driver
> +
> +maintainers:
> +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> +
> +description: |
> +  DW9807 is a 10-bit DAC with current sink capability. It is intended for
> +  controlling voice coil lenses.
> +
> +properties:
> +

No blank line.

> +  compatible:
> +    const: "dongwoon,dw9807-vcm"

No quotes.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +

No blank line.


With the changes above:

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
