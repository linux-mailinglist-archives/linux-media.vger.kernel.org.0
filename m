Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A28204D9557
	for <lists+linux-media@lfdr.de>; Tue, 15 Mar 2022 08:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345470AbiCOHe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Mar 2022 03:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345500AbiCOHeZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Mar 2022 03:34:25 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE840E6F
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 00:33:03 -0700 (PDT)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8701A405A8
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 07:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647329581;
        bh=SV2UTHDm29TdFZJH1h2mBGhiPhGr+9tNpA2QsBF0jyc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=sUFBwoEiL6EQbh2R8g2wOjizGa4QGkde6OrT4RHRipn7cGISRTx//ehOThcTxGq39
         SKNI2TzXUqo3T2zCmiN22rO4ejZU7jLnCg8+1eo5sPOl2RK1tUi4A4WraSwNR5gjm/
         7V8llrS16a+SiC1pKKcgHpQPBT+5iGKRkWghrLwRllNT45iIO7kbFr/WxvIcSzMYpM
         uU5PSZEL8xIdxd76tqa0QPy+sXZizl3qqtVEdYnv2auV81EcoQ8O1gopfux33GsD9F
         i7Y89DoFIcxJw+1a47BjRZ6UdWujrGpJGu2cPnPqvdSyMA2pTf77tWxIzHGVZrWwi4
         dffTzyNhxkzKA==
Received: by mail-ej1-f69.google.com with SMTP id jy20-20020a170907763400b006db62b6f4e0so9184620ejc.11
        for <linux-media@vger.kernel.org>; Tue, 15 Mar 2022 00:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SV2UTHDm29TdFZJH1h2mBGhiPhGr+9tNpA2QsBF0jyc=;
        b=doPTPbwFxFB1c0Ra4HdtdfvnZOiqHYtqzZflmkvhFqCGC3USxgclKiEIG+qBPkfRkR
         McYWWJgebH79FfCiIvV1coEGQcidblPjkzpQrqX2jmUMkItdGOlHbjJqnzrCRQx+qXPL
         jNCduIWNnF33NdXsHtitA9tNhRU4lI9cEerTvR85lBTyWxrEbnMZMwQEw1KFKZr01O/y
         aiQc4PDWMgNQ3oADF7NViF7mnVJuV2LLdaxzUaPltWRf3FYQd4jz5wZIf9u3kkX0KTEy
         dj5hM3Vs46KbGhMq4CEW3/i1jFsokAG/ILUj64oh1xzBbQOermS0I6wQlzQwYIR7zszF
         YwZA==
X-Gm-Message-State: AOAM530NR4P+yxybs9vtqaU/UGr4ujIDOQmBfUs5+kr4OW4V6kYnJOrr
        1vL2XNiXFzS0m+Wo8DV45t+QUAzxj7nnTSY+IqvuWiBL8nzTzJh8G0gYvTkbXXNlMcPbA23QckQ
        KHoaIQORL/+oUiSDeme/pbK4ftktWfm8C2XxGngzL
X-Received: by 2002:a17:907:d20:b0:6d7:1a45:c1ed with SMTP id gn32-20020a1709070d2000b006d71a45c1edmr20855066ejc.447.1647329580323;
        Tue, 15 Mar 2022 00:33:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrszn0BOZqvxe77cGVmY2rxwKxvK3Ef/M0iTJ3u9ds3NiixHlWuiMTRgQwWyCGq5KscJeIqw==
X-Received: by 2002:a17:907:d20:b0:6d7:1a45:c1ed with SMTP id gn32-20020a1709070d2000b006d71a45c1edmr20855059ejc.447.1647329580122;
        Tue, 15 Mar 2022 00:33:00 -0700 (PDT)
Received: from [192.168.0.153] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.googlemail.com with ESMTPSA id a1-20020aa7d901000000b00416217c99bcsm9103884edr.65.2022.03.15.00.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Mar 2022 00:32:59 -0700 (PDT)
Message-ID: <ba09e048-d619-5bd2-e6c3-da071a6d2ab6@canonical.com>
Date:   Tue, 15 Mar 2022 08:32:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/8] media: dt-bindings: i2c: Document ov5670
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc:     jeanmichel.hautbois@ideasonboard.com,
        laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
        sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>, robh@kernel.org,
        devicetree@vger.kernel.org
References: <20220314162714.153970-1-jacopo@jmondi.org>
 <20220314162714.153970-2-jacopo@jmondi.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220314162714.153970-2-jacopo@jmondi.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 14/03/2022 17:27, Jacopo Mondi wrote:
> Provide the bindings documentation for Omnivision OV5670 image sensor.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> ---
> v1->v2 (comments from Krzysztof)
> 
> - Rename to include manufacturer name
> - Add entry to MAINTAINERS
> - Add maxItems: to -gpios properties
> - Use common clock properties
> - Use enum: [1, 2] for data lanes
> - Fix whitespace issue in example
> ---
> 
>  .../bindings/media/i2c/ovti,ov5670.yaml       | 99 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  2 files changed, 100 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> new file mode 100644
> index 000000000000..73cf72203f17
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5670.yaml
> @@ -0,0 +1,99 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov5670.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV5670 5 Megapixels raw image sensor
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo@jmondi.org>
> +
> +description: |-
> +  The OV5670 is a 5 Megapixels raw image sensor which provides images in 10-bits
> +  RAW BGGR Bayer format on a 2 data lanes MIPI CSI-2 serial interface and is
> +  controlled through an I2C compatible control bus.
> +
> +properties:
> +  compatible:
> +    const: ovti,ov5670
> +
> +  reg:
> +    maxItems: 1
> +
> +  assigned-clocks: true
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true

You should not need these. These are coming with schema. You can add
these to example schema below and double-check.

> +
> +  clocks:
> +    description: System clock. From 6 to 27 MHz.
> +    maxItems: 1
> +
> +  pwdn-gpios:
> +    description: Reference to the GPIO connected to the PWDNB pin. Active low.

This does not look like a standard property, so you need a vendor prefix.

> +    maxItems: 1
> +

Best regards,
Krzysztof
