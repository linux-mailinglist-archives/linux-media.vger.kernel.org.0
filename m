Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8CA62C991
	for <lists+linux-media@lfdr.de>; Wed, 16 Nov 2022 21:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbiKPUHj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Nov 2022 15:07:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233419AbiKPUH3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Nov 2022 15:07:29 -0500
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77A565E6E;
        Wed, 16 Nov 2022 12:07:28 -0800 (PST)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-13b103a3e5dso21442831fac.2;
        Wed, 16 Nov 2022 12:07:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3o0hIsvJFOLcZ8ESMlVcurvtD+mmqbtLVyGcl/sY54=;
        b=26fupIloWNZ+QSC+uZMJM03bzNYdaZsLotSM05rWRF//exfuk2f8Q0eh6SQxBwE3Jv
         Z4b0ZVSXJkEs7w5nn5CqIas1PaUthonIzmrxAZZGv0BmDa/o8CfugY3wUrk63v7wk50C
         iJ2H69l/hDmvTh2Mb4yalXbg7iqyQgSlkIsLPlRQA9dllqdXI6H8uUug6OKDzd7ELRwS
         74YNh/sopES43wDxA5iwVVPxKvFdVdlGxONLiJ240QNdrBwnOu0vcISL23xdRrk3FIpx
         FN809AR3CmSrAr1mC6rUgqpMWA0PCFzkJZtc/PLt03lJGt7YkaJfeJmYxKd9CR3etL3w
         uXjg==
X-Gm-Message-State: ANoB5pkSy53nC1xOyunURz5ELV+cf15JYYLaJzgtSUh78cO60Wezz9A6
        B019iqeZWqsF8UYsm5Fctzm/ucjGRQ==
X-Google-Smtp-Source: AA0mqf7Y5mayIIOJnRs5fm9MG6XmlJ2p14iimv18HohLuyFxhN240z+lGGHwegz/4DlOh0LhyYyflg==
X-Received: by 2002:a05:6870:ad06:b0:13b:158f:8dad with SMTP id nt6-20020a056870ad0600b0013b158f8dadmr2598703oab.253.1668629248109;
        Wed, 16 Nov 2022 12:07:28 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f23-20020a9d7b57000000b00661a3f4113bsm6911392oto.64.2022.11.16.12.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 12:07:27 -0800 (PST)
Received: (nullmailer pid 806612 invoked by uid 1000);
        Wed, 16 Nov 2022 20:07:29 -0000
Date:   Wed, 16 Nov 2022 14:07:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Erling Ljunggren <hljunggr@cisco.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 3/5] dt-bindings: media: add cat24c208 bindings
Message-ID: <20221116200729.GA761467-robh@kernel.org>
References: <20221111132906.2212662-1-hljunggr@cisco.com>
 <20221111132906.2212662-4-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111132906.2212662-4-hljunggr@cisco.com>
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Nov 11, 2022 at 02:29:04PM +0100, Erling Ljunggren wrote:
> Add devicetree bindings for new cat24c208 EDID EEPROM driver.
> 
> Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
> ---
>  .../bindings/media/i2c/onnn,cat24c208.yaml    | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> new file mode 100644
> index 000000000000..492eecb3ab7c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/onnn,cat24c208.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ON Semiconductor CAT24C208 EDID EEPROM driver
> +
> +maintainers:
> +  - Hans Verkuil <hverkuil-cisco@xs4all.nl>
> +
> +description: |
> +  CAT24C208 is a dual port i2c EEPROM designed for EDID storage.
> +
> +properties:
> +  compatible:
> +    const: onnn,cat24c208
> +
> +  reg:
> +    maxItems: 1
> +
> +  input-connector:
> +    description: |
> +      Phandle to the video input connector, used to find
> +      the HPD gpio and the connector label, both optional.
> +    $ref: /schemas/types.yaml#/definitions/phandle

The binding and driver feel the wrong way around to me. It seems 
like you should have a driver for the connector and it needs HPD GPIO, 
label, and EEPROM. The driver instead looks mostly like an EEPROM driver 
that hooks into a few connector properties.

Reading the datasheet, I don't see anything special about accessing the 
EEPROM from the host (DSP) side. Wouldn't the default at24 driver work? 
It exposes regmap and nvmem.

Rob
