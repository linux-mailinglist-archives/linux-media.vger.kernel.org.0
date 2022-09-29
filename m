Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 654765EF681
	for <lists+linux-media@lfdr.de>; Thu, 29 Sep 2022 15:27:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235240AbiI2N1p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Sep 2022 09:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235502AbiI2N1M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Sep 2022 09:27:12 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D3F91B2D0C;
        Thu, 29 Sep 2022 06:26:59 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id cy15-20020a056830698f00b0065c530585afso835589otb.2;
        Thu, 29 Sep 2022 06:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=oNT1DEKI3TdF1HI/qkSD42aLEyNijprBhsci8wmzfrE=;
        b=GSPKxDfrKkuHCHBmANXa6h42J1bc6nBqzsukqZo5J2nR6ofWGo42ZR4tGxncGEQUqL
         wrgxcirxRGsX0MLvMXDdbIU7jm7kvD1ckOvT2yoIvRUoLjraC7xMwLRa23D5qhodLaBm
         N/C2If0gwaPqSAF3UncffuPXxeCPeUHTsJQKoD4zf7JWXNsC7j1MY0Q1jsL7Ctezl4KJ
         fpFOR3X1iR5xwdR/+CWalcD50JhdTSp7+GL5rW1ZyH9q7+shoBhMEysz4YghObYv4fgq
         EmFtet4THA0QP/jalKu/HFJ1EJv5azwqTbTk/nuoDSfzDFjeO/7YVa87jHs7ldBpqFi6
         1+xQ==
X-Gm-Message-State: ACrzQf3ri0NBAVMtBFciz6OYMnMKy6z2vInGblKLr1xZsRM+Xbl6al4y
        R21H6O9t+c9t1YRT+/K3Eg==
X-Google-Smtp-Source: AMsMyM5+BBcdZkC7+B9FQICq1MumQkAyEKVPwHqYg6DLqIAVE+cqHK6wc1WEEkXaK3RVvgjFEXpomw==
X-Received: by 2002:a05:6830:43ab:b0:658:2908:d909 with SMTP id s43-20020a05683043ab00b006582908d909mr1272894otv.294.1664458007300;
        Thu, 29 Sep 2022 06:26:47 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x4-20020a056870434400b0011bde9f5745sm3902079oah.23.2022.09.29.06.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 06:26:46 -0700 (PDT)
Received: (nullmailer pid 1958793 invoked by uid 1000);
        Thu, 29 Sep 2022 13:26:46 -0000
Date:   Thu, 29 Sep 2022 08:26:46 -0500
From:   Rob Herring <robh@kernel.org>
To:     Erling Ljunggren <hljunggr@cisco.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/5] dt-bindings: media: add cat24c208 bindings
Message-ID: <20220929132646.GA1881529-robh@kernel.org>
References: <20220928112147.358745-1-hljunggr@cisco.com>
 <20220928112147.358745-4-hljunggr@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928112147.358745-4-hljunggr@cisco.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 28, 2022 at 01:21:45PM +0200, Erling Ljunggren wrote:
> Add devicetree bindings for new cat24c208 EDID EEPROM driver.
> 
> Signed-off-by: Erling Ljunggren <hljunggr@cisco.com>
> ---
>  .../bindings/media/i2c/onnn,cat24c208.yaml    | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml b/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> new file mode 100644
> index 000000000000..fcfaccb5e39f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/onnn,cat24c208.yaml
> @@ -0,0 +1,48 @@
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
> +
> +properties:
> +  compatible:
> +    const: onnn,cat24c208
> +
> +  reg:
> +    maxItems: 1
> +
> +  hpd-gpios:
> +    maxItems: 1
> +    description:
> +      References to the GPIO that controls the HDMI hot-plug detection pin.
> +      The active flag indicates the GPIO level that enables hot-plug detection.

This node is supposed to represent a device, cat24c208, but that device 
I'm guessing knows nothing about HPD. That's a property of the connector 
and belongs in a connector node much like we have for the other side of 
display connections. It may seem like overkill, but it frequently 
evolves such that not having a connector node becomes a problem. See 
'hdmi-connector' binding for example.

Rob
