Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69E633C92BE
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 23:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234591AbhGNVH5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 17:07:57 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:40504 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbhGNVH5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 17:07:57 -0400
Received: by mail-io1-f43.google.com with SMTP id l5so3849808iok.7;
        Wed, 14 Jul 2021 14:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uFlLvjLhE+D5X3z01n3T7/D1edVtL4g+ysZ7NAiCzC8=;
        b=Y0LOmIYtMXR5Jt9BKurpaNTU8tSl/d+x9BSFnUPtffusCFULWCA3lui3WTjrLHW74Q
         ducFR0yA8x0D4t8ZWjKC8r/JxkJiqEVlBg9rHpatnRA05ABLRyV363LjWQrP5FpiVW2i
         qbqNZDhw6o9GFb4fBZIrPFJqYzt6UHvg8R0A38GP9dR5IH536VjpSGg9Owtj4g3ziUD/
         LBojmgyvxrC8sheXA8rqyBe8m9k747v+VqeNM9nvedBct4WnC5yQxOvq9EkkrjaT+TXl
         x49s0nQI9EItG+iPPcv1LfZ4kasxEAFdly3Wsil4FeYFE+Av4SMWEye+QMIfb9/2drgU
         lcKw==
X-Gm-Message-State: AOAM5337fV/mXxQH/oWrVzEWQsnowzFJZuWt5uVTkvrWQbySYEHSPVSU
        1OTjvK1XizCZZ8LBpfEJbA==
X-Google-Smtp-Source: ABdhPJwHfWZOiOMqxgq7S7wSy3VFa4SGeHXDDjjR+0+RTr6LodRjuwpKb3ch8Qwm9JHaUJ9lq+nE+w==
X-Received: by 2002:a05:6602:2bc9:: with SMTP id s9mr60381iov.11.1626296704235;
        Wed, 14 Jul 2021 14:05:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h6sm1718611iop.40.2021.07.14.14.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 14:05:03 -0700 (PDT)
Received: (nullmailer pid 3521178 invoked by uid 1000);
        Wed, 14 Jul 2021 21:04:58 -0000
Date:   Wed, 14 Jul 2021 15:04:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ming Qian <ming.qian@nxp.com>
Cc:     mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 01/13] dt-bindings: media: imx8q: add imx video codec
 bindings
Message-ID: <20210714210458.GA3512308@robh.at.kernel.org>
References: <cover.1624954576.git.ming.qian@nxp.com>
 <201c608e24da92498fde48708afa2dedde5c8f0b.1624954576.git.ming.qian@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201c608e24da92498fde48708afa2dedde5c8f0b.1624954576.git.ming.qian@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 29, 2021 at 04:21:02PM +0800, Ming Qian wrote:
> Add devicetree binding documentation for IMX8Q Video Processing Unit IP
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,imx8q-vpu.yaml         | 191 ++++++++++++++++++
>  1 file changed, 191 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> new file mode 100644
> index 000000000000..b9e38caf3d10
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> @@ -0,0 +1,191 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/nxp,imx8q-vpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX8Q video encode and decode accelerators
> +
> +maintainers:
> +  - Ming Qian <ming.qian@nxp.com>
> +  - Shijie Qin <shijie.qin@nxp.com>
> +
> +description: |-
> +  The Amphion MXC video encoder(Windsor) and decoder(Malone) accelerators present
> +  on NXP i.MX8Q SoCs.
> +
> +properties:
> +  $nodename:
> +    pattern: "^vpu@[0-9a-f]+$"
> +
> +  compatible:
> +    oneOf:
> +      - const: nxp,imx8qm-vpu
> +      - const: nxp,imx8qxp-vpu
> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  memory-region:
> +    description:
> +      Phandle to a node describing reserved memory used by VPU.
> +      (see bindings/reserved-memory/reserved-memory.txt)

How many?

> +
> +patternProperties:
> +  "^mailbox@[0-9a-f]+$":
> +    description:
> +      Each vpu encoder or decoder correspond a MU, which used for communication
> +      between driver and firmware. Implement via mailbox on driver.
> +    $ref: ../mailbox/fsl,mu.yaml#
> +
> +
> +  "^vpu_core@[0-9a-f]+$":
> +    description:
> +      Each core correspond a decoder or encoder, need to configure them
> +      separately. NXP i.MX8QM SoC has one decoder and two encoder, i.MX8QXP SoC
> +      has one decoder and one encoder.
> +    type: object
> +
> +    properties:
> +      compatible:
> +        oneOf:
> +          - const: nxp,imx8q-vpu-decoder
> +          - const: nxp,imx8q-vpu-encoder
> +
> +      reg:
> +        maxItems: 1
> +
> +      power-domains:
> +        maxItems: 1
> +
> +      mbox-names:
> +        items:
> +          - const: tx0
> +          - const: tx1
> +          - const: rx
> +
> +      mboxes:
> +        description:
> +          List of phandle of 2 MU channels for tx, 1 MU channel for rx.
> +        maxItems: 1
> +
> +      nxp,boot-region:
> +        description:
> +          Phandle to a node describing reserved memory used by firmware
> +          loading.
> +        $ref: /schemas/types.yaml#/definitions/phandle

'memory-region' is what points to reserved regions. If you have more 
than one, then you need to define what each index is.

> +
> +      nxp,rpc-region:
> +        description:
> +          Phandle to a node describing reserved memory used by RPC shared
> +          memory between firmware and driver.
> +        $ref: /schemas/types.yaml#/definitions/phandle
> +
> +      nxp,print-offset:
> +        description:
> +          The memory offset from RPC address, used by reserve firmware log.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +    required:
> +      - compatible
> +      - reg
> +      - power-domains
> +      - mbox-names
> +      - mboxes
> +      - nxp,boot-region
> +      - nxp,rpc-region
> +      - nxp,print-offset
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - memory-region
> +
> +additionalProperties: true

Nope. 'true' is only acceptible for common bindings.

> +
> +examples:
> +  # Device node example for i.MX8QM platform:
> +  - |
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +
> +    vpu: vpu@2c000000 {
> +      compatible = "nxp,imx8qm-vpu";
> +      ranges = <0x2c000000 0x2c000000 0x2000000>;
> +      reg = <0x2c000000 0x1000000>;
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      power-domains = <&pd IMX_SC_R_VPU>;
> +      memory-region = <&vpu_reserved>;
> +
> +      mu_m0: mailbox@2d000000 {
> +        compatible = "fsl,imx6sx-mu";
> +        reg = <0x2d000000 0x20000>;
> +        interrupts = <0 472 4>;
> +        #mbox-cells = <2>;
> +        power-domains = <&pd IMX_SC_R_VPU_MU_0>;
> +      };
> +
> +      mu1_m0: mailbox@2d020000 {
> +        compatible = "fsl,imx6sx-mu";
> +        reg = <0x2d020000 0x20000>;
> +        interrupts = <0 473 4>;
> +        #mbox-cells = <2>;
> +        power-domains = <&pd IMX_SC_R_VPU_MU_1>;
> +      };
> +
> +      mu2_m0: mailbox@2d040000 {
> +        compatible = "fsl,imx6sx-mu";
> +        reg = <0x2d040000 0x20000>;
> +        interrupts = <0 474 4>;
> +        #mbox-cells = <2>;
> +        power-domains = <&pd IMX_SC_R_VPU_MU_2>;
> +      };
> +
> +      vpu_core0: vpu_core@2d080000 {
> +        compatible = "nxp,imx8q-vpu-decoder";
> +        reg = <0x2d080000 0x10000>;
> +        power-domains = <&pd IMX_SC_R_VPU_DEC_0>;
> +        mbox-names = "tx0", "tx1", "rx";
> +        mboxes = <&mu_m0 0 0
> +                  &mu_m0 0 1
> +                  &mu_m0 1 0>;
> +        nxp,boot-region = <&decoder_boot>;
> +        nxp,rpc-region = <&decoder_rpc>;
> +        nxp,print-offset = <0x180000>;
> +      };
> +
> +      vpu_core1: vpu_core@2d090000 {
> +        compatible = "nxp,imx8q-vpu-encoder";
> +        reg = <0x2d090000 0x10000>;
> +        power-domains = <&pd IMX_SC_R_VPU_ENC_0>;
> +        mbox-names = "tx0", "tx1", "rx";
> +        mboxes = <&mu1_m0 0 0
> +                  &mu1_m0 0 1
> +                  &mu1_m0 1 0>;
> +        nxp,boot-region = <&encoder1_boot>;
> +        nxp,rpc-region = <&encoder1_rpc>;
> +        nxp,print-offset = <0x80000>;
> +      };
> +
> +      vpu_core2: vpu_core@2d0a0000 {
> +        reg = <0x2d0a0000 0x10000>;
> +        compatible = "nxp,imx8q-vpu-encoder";
> +        power-domains = <&pd IMX_SC_R_VPU_ENC_1>;
> +        mbox-names = "tx0", "tx1", "rx";
> +        mboxes = <&mu2_m0 0 0
> +                  &mu2_m0 0 1
> +                  &mu2_m0 1 0>;
> +        nxp,boot-region = <&encoder2_boot>;
> +        nxp,rpc-region = <&encoder2_rpc>;
> +        nxp,print-offset = <0x80000>;
> +      };
> +    };
> +
> +...
> -- 
> 2.31.1
> 
> 
