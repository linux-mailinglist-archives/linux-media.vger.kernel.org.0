Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8233D6999
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 00:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233787AbhGZV4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 17:56:02 -0400
Received: from mail-il1-f181.google.com ([209.85.166.181]:41543 "EHLO
        mail-il1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233660AbhGZV4C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 17:56:02 -0400
Received: by mail-il1-f181.google.com with SMTP id u7so7239010ilj.8;
        Mon, 26 Jul 2021 15:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/rppsr5tYkZD3EhoihiPjK+I6AiULmSIgZNTdzPLLls=;
        b=bLlTdEFa3IAGipzOF8L4BsiO47jWJEKYdSDtwqT22Qo8/n/7ZQCja+ime+e1KTNzWT
         DhkClsFg9BQPkU2Qhod1n5Kd89oZnRHRDMHQZehikpwP6iuLLnrYACBa3LrHh64ekWAe
         0tiucfSzAtkFT7ff6IEpgsuT9J7sALIIyPKdZyQfmSSb2UdWahqLPlyc2j/3Ms3HsF+X
         lINZfyvqFHeFkbPgkQMi5v0OeDuYC6ck7j7hHS8431ziRedjXl9GIfP6XUXv+dPDlQkK
         JVADdDBddwlfKdV+MawKXUyR6k4yfScBev4zsyCi25fpoXDmUvZIDi0BZzPsWLAPXwoR
         EEFA==
X-Gm-Message-State: AOAM530H84M/W7NIo5wAr+eAGsJJjHRa1sla7Qkm5fg7249l+vZmq5cu
        AI7/7zABBDjpSms15lIDHw==
X-Google-Smtp-Source: ABdhPJwt25seF9vzoD5MRkLXGLslumuHTagO5rdQvXCo3ptNp8Q+E5gr3CgMuUv3TsgfbLsinUPs0Q==
X-Received: by 2002:a05:6e02:190e:: with SMTP id w14mr14001660ilu.61.1627338990075;
        Mon, 26 Jul 2021 15:36:30 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id t26sm728095iob.19.2021.07.26.15.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 15:36:29 -0700 (PDT)
Received: (nullmailer pid 1000057 invoked by uid 1000);
        Mon, 26 Jul 2021 22:36:26 -0000
Date:   Mon, 26 Jul 2021 16:36:26 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ming Qian <ming.qian@nxp.com>
Cc:     mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 01/13] dt-bindings: media: imx8q: add imx video codec
 bindings
Message-ID: <20210726223626.GA991611@robh.at.kernel.org>
References: <cover.1626743758.git.ming.qian@nxp.com>
 <5032168eca16a277cc8ba9e951073a37089c0eec.1626743758.git.ming.qian@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5032168eca16a277cc8ba9e951073a37089c0eec.1626743758.git.ming.qian@nxp.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 20, 2021 at 09:43:20AM +0800, Ming Qian wrote:
> Add devicetree binding documentation for IMX8Q Video Processing Unit IP
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,imx8q-vpu.yaml         | 178 ++++++++++++++++++
>  1 file changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> new file mode 100644
> index 000000000000..337c9bf2395f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> @@ -0,0 +1,178 @@
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
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true
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

3 here and...

> +
> +      mboxes:
> +        description:
> +          List of phandle of 2 MU channels for tx, 1 MU channel for rx.
> +        maxItems: 1

1 here?

> +
> +      memory-region:
> +        description:
> +          Phandle to the reserved memory nodes to be associated with the
> +          remoteproc device. The reserved memory nodes should be carveout nodes,
> +          and should be defined as per the bindings in
> +          Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> +        items:
> +          - description: region reserved for firmware image sections.
> +          - description: region used for RPC shared memory between firmware and
> +                         driver.
> +
> +    required:
> +      - compatible
> +      - reg
> +      - power-domains
> +      - mbox-names
> +      - mboxes
> +      - memory-region
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +
> +additionalProperties: false
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
> +        memory-region = <&decoder_boot>, <&decoder_rpc>;
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
> +        memory-region = <&encoder1_boot>, <&encoder1_rpc>;
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
> +        memory-region = <&encoder2_boot>, <&encoder2_rpc>;
> +      };
> +    };
> +
> +...
> -- 
> 2.32.0
> 
> 
