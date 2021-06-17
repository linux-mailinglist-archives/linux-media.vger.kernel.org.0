Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA1843AA7D2
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 02:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234835AbhFQACb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 20:02:31 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:37792 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234830AbhFQACa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 20:02:30 -0400
Received: by mail-il1-f174.google.com with SMTP id x12so3862144ill.4;
        Wed, 16 Jun 2021 17:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q3wy77k7U+ym1xGosaNyR/K8lZY/em7vg0ko50zShvo=;
        b=XWoJ5unFHDZ+tECkJD0ApaTjAM5k0HcVZH1DqRbUOgFKPASOA/MCCwtKRyaRysM+P1
         N7Awiono+dF+5jVdvth+jR0Zak9c6sHXUpMoIgxvVtS/7HYRQxFMFgcnzXcJitZkjhzS
         McK9VHFliZKpXOrbGk29jue5QS5HV919L4YbsWv9S5gjfykyUM0DTisNd2Hsmdxwwio3
         BlyKVnlQgmEmsRUxS1bagiHUi23vyJWnOnodJQKMYnsZyOpmyDq+MNT+ovvo6IKiixJz
         CotUABs47LdE9vVIMY3C+EudtEGKxa1nIsnX/Ro4YmYjuDFqcGke3MNhogrCJc04CtO2
         rm2A==
X-Gm-Message-State: AOAM530rkcsO1X+kYcVHjUPvcfD6y6H6p2IFzkmJWLG3U9cEyOJBy4Db
        Cm/1LKzh+DkX74B7zq2tQQ==
X-Google-Smtp-Source: ABdhPJwYl7LazyjQeknAyJE6FVZtc7k5TBJdLmJFPjMESumkwvwkzxk9PSd7FuojSbKpE1LeihuBdA==
X-Received: by 2002:a05:6e02:1b06:: with SMTP id i6mr1396397ilv.101.1623888022660;
        Wed, 16 Jun 2021 17:00:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p10sm1508345ilj.88.2021.06.16.17.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 17:00:21 -0700 (PDT)
Received: (nullmailer pid 327679 invoked by uid 1000);
        Thu, 17 Jun 2021 00:00:18 -0000
Date:   Wed, 16 Jun 2021 18:00:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ming Qian <ming.qian@nxp.com>
Cc:     mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 01/13] dt-bindings: media: imx8q: add imx video codec
 bindings
Message-ID: <20210617000018.GA316656@robh.at.kernel.org>
References: <cover.1623054584.git.ming.qian@nxp.com>
 <7cd02157f9a9cc7a773bd02137a92a04077638e5.1623054584.git.ming.qian@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cd02157f9a9cc7a773bd02137a92a04077638e5.1623054584.git.ming.qian@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 07, 2021 at 04:42:48PM +0800, Ming Qian wrote:
> Add devicetree binding documentation for IMX8Q Video Processing Unit IP
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,imx8q-vpu.yaml         | 198 ++++++++++++++++++
>  1 file changed, 198 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> new file mode 100644
> index 000000000000..058ca69c107a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> @@ -0,0 +1,198 @@
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
> +allOf:
> +  - $ref: /schemas/simple-bus.yaml#

This is not a 'simple-bus'. A simple bus doesn't have power-domains, 
memory-region, or mailbox.

simple-mfd maybe, but looks like there's dependencies here so you should 
trigger probing yourself.

> +
> +properties:
> +  $nodename:
> +    pattern: "^vpu-bus@[0-9a-f]+$"
> +
> +  compatible:
> +    contains:

No, must be exact.

> +      items:
> +        - enum:
> +            - nxp,imx8qm-vpu
> +            - nxp,imx8qxp-vpu
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
> +
> +  mailbox:

This needs to be a pattern looking at the example.

> +    description:
> +      Each vpu encoder or decoder correspond a MU, which used for communication
> +      between driver and firmware. Implement via mailbox on driver.
> +      (see bindings/mailbox/fsl,mu.yaml)

Do a $ref to the file.

> +
> +patternProperties:
> +  "^vpu_[en, de]coder@[0-9a-f]+$":

(en|de) 

> +    type: object
> +    description:
> +      Each core correspond a decoder or encoder, need to configure them
> +      separately. NXP i.MX8QM SoC has one decoder and two encoder, i.MX8QXP SoC
> +      has one decoder and one encoder.
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

How many? (maxItems: 1 or an 'items' list needed)

> +      boot-region:
> +        description:
> +          Phandle to a node describing reserved memory used by firmware
> +          loading.
> +
> +      rpc-region:
> +        description:
> +          Phandle to a node describing reserved memory used by RPC shared
> +          memory between firmware and driver.
> +
> +      print-offset:
> +        description:
> +          The memory offset from RPC address, used by reserve firmware log.

These need vendor prefix and type ref.

> +
> +      id:
> +        description: Index of vpu core.

Nope. We don't do indexes.

> +
> +    required:
> +      - compatible
> +      - reg
> +      - power-domains
> +      - mbox-names
> +      - mboxes
> +      - boot-region
> +      - rpc-region
> +      - print-offset
> +      - id
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
> +
> +examples:
> +  # Device node example for i.MX8QM platform:
> +  - |
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +
> +    vpu: vpu-bus@2c000000 {
> +      compatible = "nxp,imx8qm-vpu", "simple-bus";
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
> +      vpu_core0: vpu_decoder@2d080000 {
> +        compatible = "nxp,imx8q-vpu-decoder";
> +        reg = <0x2d080000 0x10000>;
> +        power-domains = <&pd IMX_SC_R_VPU_DEC_0>;
> +        mbox-names = "tx0", "tx1", "rx";
> +        mboxes = <&mu_m0 0 0
> +                  &mu_m0 0 1
> +                  &mu_m0 1 0>;
> +        boot-region = <&decoder_boot>;
> +        rpc-region = <&decoder_rpc>;
> +        print-offset = <0x180000>;
> +        id = <0>;
> +      };
> +
> +      vpu_core1: vpu_encoder@2d090000 {
> +        compatible = "nxp,imx8q-vpu-encoder";
> +        reg = <0x2d090000 0x10000>;
> +        power-domains = <&pd IMX_SC_R_VPU_ENC_0>;
> +        mbox-names = "tx0", "tx1", "rx";
> +        mboxes = <&mu1_m0 0 0
> +                  &mu1_m0 0 1
> +                  &mu1_m0 1 0>;
> +        boot-region = <&encoder1_boot>;
> +        rpc-region = <&encoder1_rpc>;
> +        print-offset = <0x80000>;
> +        id = <1>;
> +      };
> +
> +      vpu_core2: vpu_encoder@2d0a0000 {
> +        reg = <0x2d0a0000 0x10000>;
> +        compatible = "nxp,imx8q-vpu-encoder";
> +        power-domains = <&pd IMX_SC_R_VPU_ENC_1>;
> +        mbox-names = "tx0", "tx1", "rx";
> +        mboxes = <&mu2_m0 0 0
> +                  &mu2_m0 0 1
> +                  &mu2_m0 1 0>;
> +        boot-region = <&encoder2_boot>;
> +        rpc-region = <&encoder2_rpc>;
> +        print-offset = <0x80000>;
> +        id = <2>;
> +      };
> +    };
> +
> +...
> -- 
> 2.31.1
