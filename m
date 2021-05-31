Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27263964C4
	for <lists+linux-media@lfdr.de>; Mon, 31 May 2021 18:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbhEaQK0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 12:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233790AbhEaQIG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 12:08:06 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53214C08EB07
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 07:43:50 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id j184so11393124qkd.6
        for <linux-media@vger.kernel.org>; Mon, 31 May 2021 07:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Iyj0FEMDNsQyOiWylgBTlqAR8PKmvOeDZTh/pOMaYAE=;
        b=xXHRv5yygcu+4HP+rTBpP5725QzrMhZEgW5lM7H1HgrX+L3zEwD/AMPtHbXP1w9vLL
         X0l0oxGsnndPR6WaxH4hBxGro6aCCxRpOUm3dMkar4R8Hu17q/HWXOTokMkLsI3+r0eH
         0QbfjM/lAfPtV4oNNOMDNIS55WFRN2w8rnyFbCU2Rq8lrlbRxo7uSwAXtvYicdrXcSDM
         6J4/YqhzbpSQ3vco0ap5hPq5qg0pdqvL1Al9ehzK+rDjtox2GJ1wqI7fvrclsY3QX0Sh
         1J58YVpoXdehso4WmPuMRUSHG4a69XmBRoKe3QvyWQr4UzHVECedCA7LYmpSasPehI1j
         BrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Iyj0FEMDNsQyOiWylgBTlqAR8PKmvOeDZTh/pOMaYAE=;
        b=duqx7KCkJgp5pOLPzHLX3HX3uyskcBms42FvG7AhHKgtsOYqh63nCVTIcgGnQkUzSp
         Wu+RwK11C4+q/CuiuzUmNqa/EzXQRTnfohnaJVt6ojhgEQXhREmrh2ilR1zSlu7uT1/L
         rmqfva78iGCeF2DN8wvkdZopzBy2M0Ldl6AcLZFwie/pnNptuGVz88oJA7UpCfd2IFBK
         1+JAIsxrSj7JGmoIJ3CvNXuWSe7p/VhKyFnX5YVRHsLo9nEb6UxiNvxGZB/mgTbNytzH
         EjB2IkgkefkXWJzc2fQoRPK+YBVOPxPPZl4l8o2+mZJQcJBaP4zHzPGZ77vDkXCEi5oc
         i5rA==
X-Gm-Message-State: AOAM5313Bl1Zv3k3u11E82samWrbDtzqzU/eN3bwsG2WOWVAA0qO3VeG
        /g/0IHqXCiBHyiGA0B6kzvsmRA==
X-Google-Smtp-Source: ABdhPJzpTeU7aw3RWAK0GUJyYKnUNNgYcE3zvPCrEII4dYajZMDTnJG6Vtr+/gdUXejbNkz5qIBOrg==
X-Received: by 2002:a05:620a:16b7:: with SMTP id s23mr17205567qkj.388.1622472230125;
        Mon, 31 May 2021 07:43:50 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id h8sm8391940qtp.46.2021.05.31.07.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 07:43:49 -0700 (PDT)
Message-ID: <707ca6865504c9d37f3806bdc337b50e210373df.camel@ndufresne.ca>
Subject: Re: [PATCH 1/5] dt-bindings: media: imx8q: add imx video codec
 bindings
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Ming Qian <ming.qian@nxp.com>, mchehab@kernel.org,
        shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, aisheng.dong@nxp.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date:   Mon, 31 May 2021 10:43:48 -0400
In-Reply-To: <dd2c66ba07a8025da2c377c1b6e46f9d7304c9bc.1622429026.git.ming.qian@nxp.com>
References: <cover.1622429025.git.ming.qian@nxp.com>
         <dd2c66ba07a8025da2c377c1b6e46f9d7304c9bc.1622429026.git.ming.qian@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 31 mai 2021 à 10:51 +0800, Ming Qian a écrit :
> Add devicetree binding documentation for IMX8Q Video Processing Unit IP
> 
> Signed-off-by: Ming Qian <ming.qian@nxp.com>
> Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> ---
>  .../bindings/media/nxp,imx8q-vpu.yaml         | 201 ++++++++++++++++++
>  1 file changed, 201 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> new file mode 100644
> index 000000000000..97e428dbfdbe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> @@ -0,0 +1,201 @@
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
> +  - ming_qian <ming.qian@nxp.com>
> +  - Shijie Qin <shijie.qin@nxp.com>
> +
> +description: |-
> +  The Amphion MXC video encode and decode accelerators present on NXP i.MX8Q SoCs.

Hi, thanks for this work. Do you think it would be possible to give a version
for the Amphion design that is in used ? This is for the posterity and/or if
some non-NXP vendor needs to use this driver because it picked the same design.
Though form what I understood, Allegro acquired it, and might not be continuing
that model, it remains that is nicer if we document as much as we can, to give
maximum relevance to you rcontribution.

> +
> +allOf:
> +  - $ref: /schemas/simple-bus.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - nxp,imx8qxp-vpu
> +        - nxp,imx8qm-vpu
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
> +  vpu_lpcg:
> +    description:
> +      This is vpu Low-Power Clock Gate (LPCG) module.
> +
> +  mu_m0:
> +    description:
> +      Each vpu core correspond a MU node, which used for communication between
> +      driver and firmware. Implement via mailbox on driver.
> +
> +    vpu_core:
> +      type: object
> +      additionalProperties: false
> +      description:
> +        Each core correspond a decoder or encoder, need to configure them
> +        separately.
> +
> +      properties:
> +        compatible:
> +          oneOf:
> +            - const: nxp,imx8q-vpu-decoder
> +            - const: nxp,imx8q-vpu-encoder
> +
> +        reg:
> +          maxItems: 1
> +
> +        power-domains:
> +          maxItems: 1
> +
> +        mbox-names:
> +            - const: tx0
> +            - const: tx1
> +            - const: rx
> +
> +        mboxes:
> +          maxItems: 3
> +          description:
> +            List of phandle of 2 MU channels for tx, 1 MU channel for rx.
> +
> +        boot-region:
> +          description:
> +            Phandle to a node describing reserved memory used by firmware
> +            loading.
> +
> +        rpc-region:
> +          description:
> +            Phandle to a node describing reserved memory used by RPC shared
> +            memory between firmware and driver.
> +
> +        print-offset:
> +          description:
> +            The memory offset from RPC address, used by reserve firmware log.
> +
> +        id:
> +          description: Index of vpu core.
> +
> +      required:
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
> +
> +required:
> +  - compatible
> +  - reg
> +  - power-domains
> +  - memory-region
> +  - vpu_lpcg
> +  - mu_m0
> +  - vpu_core
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
> +      vpu_lpcg: clock-controller@2c000000 {
> +        compatible = "fsl,imx8qxp-lpcg-vpu";
> +        reg = <0x2c000000 0x2000000>;
> +        #clock-cells = <1>;
> +        status = "disabled";
> +      };
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
> +        id = <2>;
> +      };
> +    };
> +
> +...


