Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0723C9478
	for <lists+linux-media@lfdr.de>; Thu, 15 Jul 2021 01:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237585AbhGNXZ7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 19:25:59 -0400
Received: from mail-io1-f45.google.com ([209.85.166.45]:34589 "EHLO
        mail-io1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhGNXZ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 19:25:59 -0400
Received: by mail-io1-f45.google.com with SMTP id g22so4251340iom.1;
        Wed, 14 Jul 2021 16:23:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ToZ6NY20pj8+1z2HLFxJgFpOq59/gnhKty7JQKi5xcg=;
        b=dgcUZJIRGzUB1nRAqhLsaJl6tC0geliNkf7rZ58UZMZR8eCrGN6MxuELT3r9CyAn6Z
         EG6B/zIs4nE1dWlTQc2DheO2GqCdLGPhEFSBgytccR2MDahlWbIwF5DtNTbcVMcIATW1
         170+yNoD2IMyinn0WFDzzHndrUt1a+DsZf/65c7QhzcnUdlSEHPpwpSCOHKd4VNWdtx3
         wL+JY/hmh/3Hx9JJqUSIlkoWT2dgXIWaBUgWa35Om7kPshW278xOmDR7dhM96n732EAN
         p+PDNPuSbk3J4XFtl2BP2EIQdrOr+WVmg8LbcqD0M+OrzK+3CQ50KXQz/4BNRK28L25G
         FEsg==
X-Gm-Message-State: AOAM532+RfatINyAUWal/Os7wjSDRjfeV057P1iqd3nc1H9qHrkPbAfR
        dP7YDrq0qcCvMPzXo71pRw==
X-Google-Smtp-Source: ABdhPJxfw9SHxbrbwickx7w/F5na0i6rWNyFm1PDKfzfrJ/f/+TLM8pzZ5E1dknUASd44A4KH9STUw==
X-Received: by 2002:a05:6602:134f:: with SMTP id i15mr421616iov.143.1626304986652;
        Wed, 14 Jul 2021 16:23:06 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f7sm2125738ilk.64.2021.07.14.16.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 16:23:05 -0700 (PDT)
Received: (nullmailer pid 3734548 invoked by uid 1000);
        Wed, 14 Jul 2021 23:23:03 -0000
Date:   Wed, 14 Jul 2021 17:23:03 -0600
From:   Rob Herring <robh@kernel.org>
To:     Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc:     sean@mess.org, mchehab@kernel.org, khilman@baylibre.com,
        narmstrong@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, rockosov@gmail.com
Subject: Re: [PATCH v3 1/2] media: rc: meson-irblaster: document device tree
 bindings
Message-ID: <20210714232303.GA3730974@robh.at.kernel.org>
References: <20210709165753.29353-1-viktor.prutyanov@phystech.edu>
 <20210709165753.29353-2-viktor.prutyanov@phystech.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210709165753.29353-2-viktor.prutyanov@phystech.edu>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 09, 2021 at 07:57:52PM +0300, Viktor Prutyanov wrote:
> This patch adds binding documentation for the IR transmitter
> available in Amlogic Meson SoCs.
> 
> Signed-off-by: Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> ---
>  changes in v2:
>    - compatible = "amlogic,meson-g12a-irblaster" added
>    - clocks, clock-names and mod-clock updated
>  changes in v3:
>    - mod-clock removed
>    - max-fifo-level added
> 
>  .../media/amlogic,meson-irblaster.yaml        | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml b/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
> new file mode 100644
> index 000000000000..1e10aa0d3a94
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/amlogic,meson-irblaster.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/media/amlogic,meson-irblaster.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Amlogic Meson IR blaster
> +
> +maintainers:
> +  - Viktor Prutyanov <viktor.prutyanov@phystech.edu>
> +
> +description: |
> +  Some Amlogic SoCs such as A311D and T950D4 have IR transmitter
> +  (blaster) controller onboard. It is capable of sending IR signals
> +  with arbitrary carrier frequency and duty cycle.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: amlogic,meson-irblaster
> +      - items:
> +          - const: amlogic,meson-g12a-irblaster
> +          - const: amlogic,meson-irblaster
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: sysclk
> +      - const: xtal
> +
> +  max-fifo-level:
> +    maxItems: 1

An array?

Needs a vendor prefix, type reference and constraints on allowed values.

> +    description:
> +      Maximum IR blaster FIFO fill level
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/g12a-clkc.h>
> +
> +    irblaster@ff80014c {
> +      compatible = "amlogic,meson-g12a-irblaster", "amlogic,meson-irblaster";
> +      reg = <0xff80014c 0x10>;
> +      interrupts = <0 198 IRQ_TYPE_EDGE_RISING>;
> +      clocks = <&clkc CLKID_CLK81>, <&xtal>;
> +      clock-names = "sysclk", "xtal";
> +    };
> -- 
> 2.21.0
> 
> 
