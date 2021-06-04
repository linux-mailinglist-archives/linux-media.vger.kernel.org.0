Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2201E39C1AF
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 22:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhFDU4T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 16:56:19 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:37596 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhFDU4T (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 16:56:19 -0400
Received: by mail-oi1-f181.google.com with SMTP id h9so11031410oih.4;
        Fri, 04 Jun 2021 13:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gz+lgtM0mII+BtnwGBOzXei3KeWl3rwfr5YGfndAX+4=;
        b=B7fpD8To/dfmVRNFu4+DOCBh+COwO7//Ms1WdOpuf+d8yunk7EiPoaprx4qMDUVHDq
         CfiBJbZGrAns8Mt85yEooon9Odh+QTNVno453F75tV33fOCVbUUUdYQYsMMvRQMjhy9p
         L07oteKkiZY5hMzFBN3xFz+jPSMVcnpG3b2gFlzPhB57sQewM/awu3o2oSGuemwELWE0
         fWQ1TYa8Tpw6xp5pngrhQKnbqbjw6BvUDmKzyLYf0zawKeRo7eLJxXpfwYHI21lhrZgb
         Jec5CiGdPd6VDh4nZaLxFQGtmKwa8W1Cg/lO+gHy+vls+unxYzsGSa0OC6aznvQUSEEc
         mTtA==
X-Gm-Message-State: AOAM5310KhVBmhEcC7LZ7EQgAcwSMgAOhCWMGxctSDAsLY5NKlaMIuB3
        +GgsJzgLYfDwgfvCLZWohQ==
X-Google-Smtp-Source: ABdhPJx/GMEf9bYIk8Jplmvt1HIaYOpj7JSD4qGH4K5ceH3YEBM4OH94c4pZe8uKzxCEu9oWj+epCw==
X-Received: by 2002:aca:4a82:: with SMTP id x124mr3664289oia.43.1622840072378;
        Fri, 04 Jun 2021 13:54:32 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 129sm665752ooq.34.2021.06.04.13.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 13:54:31 -0700 (PDT)
Received: (nullmailer pid 3898550 invoked by uid 1000);
        Fri, 04 Jun 2021 20:54:30 -0000
Date:   Fri, 4 Jun 2021 15:54:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     hverkuil-cisco@xs4all.nl, lars@metafoo.de,
        matthew.michilot@gmail.com, tharvey@gateworks.com,
        linux-media@vger.kernel.org, slongerbeam@gmail.com,
        niklas.soderlund@ragnatech.se, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: adv7180: Introduce
 adv,adv7182-force-bt656-4
Message-ID: <20210604205430.GA3895085@robh.at.kernel.org>
References: <20210527173209.3874124-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210527173209.3874124-1-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 27, 2021 at 02:32:08PM -0300, Fabio Estevam wrote:
> Captured NTSC video would be out of sync when using the adv7280 with
> the BT.656-4 protocol. Certain registers (0x04, 0x31, 0xE6) need to
> be configured properly to ensure BT.656-4 compatibility.
> 
> Introduce the 'adv,adv7182-force-bt656-4' property to allow the ADV7280
> behavior to be consistent with the ADV7180, where BT.656-4 timing
> is used.

I'm confused by the part numbers. 7182 or 7280? In any case, I'd just 
drop the part number from the property name.

> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  Documentation/devicetree/bindings/media/i2c/adv7180.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> index bcfd93739b4f..83e47b0c9fa2 100644
> --- a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
> @@ -35,6 +35,11 @@ properties:
>    powerdown-gpios:
>      maxItems: 1
>  
> +  adv,adv7182-force-bt656-4:
> +    description:
> +      Indicates that ADV7182 should output a BT.656-4 compatible stream.
> +    type: boolean
> +
>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>  
> -- 
> 2.25.1
