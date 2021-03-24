Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9263484D9
	for <lists+linux-media@lfdr.de>; Wed, 24 Mar 2021 23:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238901AbhCXWqX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Mar 2021 18:46:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38830 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238899AbhCXWqG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Mar 2021 18:46:06 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7BF1F580;
        Wed, 24 Mar 2021 23:46:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1616625964;
        bh=42HY5uwZ1MbcmUVScEyI1EYtiX5bQBYXMVzT77DP95U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uqfMiK2Vr92pgvCfj8Wsr0mvn5xnHYACf5C6V07SW/bVDjTQpGE2Ec53wGwRsLptr
         jAfFRR42m/l7MmXXHKptfJHacMpLTXtTO8wvzuNdKMrDwgFnZ1P/jBrQX0vWHbB3id
         5lnaXX/qDxaRM5vYQuNfzuZIt3Ccbr9UrSg44NsU=
Date:   Thu, 25 Mar 2021 00:45:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: media: video-interfaces: Drop the example
Message-ID: <YFvBAazu5yrV6r5b@pendragon.ideasonboard.com>
References: <20210324202253.3576798-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210324202253.3576798-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Wed, Mar 24, 2021 at 02:22:53PM -0600, Rob Herring wrote:
> The example in video-interfaces.yaml uses a bunch of undocumented
> bindings which will cause warnings when undocumented compatible checks
> are enabled. The example could be fixed to use documented bindings, but
> doing so would just duplicate other examples. So let's just remove the
> example.
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v2: Drop instead of fixing the example
> 
>  .../bindings/media/video-interfaces.yaml      | 127 ------------------
>  1 file changed, 127 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> index 0a7a73fd59f2..4391dce2caee 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -215,130 +215,3 @@ properties:
>        CCP2, for instance.
>  
>  additionalProperties: true
> -
> -examples:
> -  # The example snippet below describes two data pipelines.  ov772x and imx074
> -  # are camera sensors with a parallel and serial (MIPI CSI-2) video bus
> -  # respectively. Both sensors are on the I2C control bus corresponding to the
> -  # i2c0 controller node.  ov772x sensor is linked directly to the ceu0 video
> -  # host interface. imx074 is linked to ceu0 through the MIPI CSI-2 receiver
> -  # (csi2). ceu0 has a (single) DMA engine writing captured data to memory.
> -  # ceu0 node has a single 'port' node which may indicate that at any time
> -  # only one of the following data pipelines can be active:
> -  # ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
> -  - |
> -    ceu@fe910000 {
> -        compatible = "renesas,sh-mobile-ceu";
> -        reg = <0xfe910000 0xa0>;
> -        interrupts = <0x880>;
> -
> -        mclk: master_clock {
> -            compatible = "renesas,ceu-clock";
> -            #clock-cells = <1>;
> -            clock-frequency = <50000000>;  /* Max clock frequency */
> -            clock-output-names = "mclk";
> -        };
> -
> -        port {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -
> -            /* Parallel bus endpoint */
> -            ceu0_1: endpoint@1 {
> -                reg = <1>;    /* Local endpoint # */
> -                remote-endpoint = <&ov772x_1_1>;  /* Remote phandle */
> -                bus-width = <8>;  /* Used data lines */
> -                data-shift = <2>;  /* Lines 9:2 are used */
> -
> -                /* If hsync-active/vsync-active are missing,
> -                   embedded BT.656 sync is used */
> -                hsync-active = <0>;  /* Active low */
> -                vsync-active = <0>;  /* Active low */
> -                data-active = <1>;  /* Active high */
> -                pclk-sample = <1>;  /* Rising */
> -            };
> -
> -            /* MIPI CSI-2 bus endpoint */
> -            ceu0_0: endpoint@0 {
> -                reg = <0>;
> -                remote-endpoint = <&csi2_2>;
> -            };
> -        };
> -    };
> -
> -    i2c {
> -        #address-cells = <1>;
> -        #size-cells = <0>;
> -
> -        camera@21 {
> -            compatible = "ovti,ov772x";
> -            reg = <0x21>;
> -            vddio-supply = <&regulator1>;
> -            vddcore-supply = <&regulator2>;
> -
> -            clock-frequency = <20000000>;
> -            clocks = <&mclk 0>;
> -            clock-names = "xclk";
> -
> -            port {
> -                /* With 1 endpoint per port no need for addresses. */
> -                ov772x_1_1: endpoint {
> -                    bus-width = <8>;
> -                    remote-endpoint = <&ceu0_1>;
> -                    hsync-active = <1>;
> -                    vsync-active = <0>; /* Who came up with an
> -                               inverter here ?... */
> -                    data-active = <1>;
> -                    pclk-sample = <1>;
> -                };
> -            };
> -        };
> -
> -        camera@1a {
> -            compatible = "sony,imx074";
> -            reg = <0x1a>;
> -            vddio-supply = <&regulator1>;
> -            vddcore-supply = <&regulator2>;
> -
> -            clock-frequency = <30000000>;  /* Shared clock with ov772x_1 */
> -            clocks = <&mclk 0>;
> -            clock-names = "sysclk";    /* Assuming this is the
> -                       name in the datasheet */
> -            port {
> -                imx074_1: endpoint {
> -                    clock-lanes = <0>;
> -                    data-lanes = <1 2>;
> -                    remote-endpoint = <&csi2_1>;
> -                };
> -            };
> -        };
> -    };
> -
> -    csi2: csi2@ffc90000 {
> -        compatible = "renesas,sh-mobile-csi2";
> -        reg = <0xffc90000 0x1000>;
> -        interrupts = <0x17a0>;
> -        #address-cells = <1>;
> -        #size-cells = <0>;
> -
> -        port@1 {
> -            compatible = "renesas,csi2c";  /* One of CSI2I and CSI2C. */
> -            reg = <1>;      /* CSI-2 PHY #1 of 2: PHY_S,
> -                       PHY_M has port address 0,
> -                       is unused. */
> -            csi2_1: endpoint {
> -                clock-lanes = <0>;
> -                data-lanes = <2 1>;
> -                remote-endpoint = <&imx074_1>;
> -            };
> -        };
> -        port@2 {
> -            reg = <2>;      /* port 2: link to the CEU */
> -
> -            csi2_2: endpoint {
> -                remote-endpoint = <&ceu0_0>;
> -            };
> -        };
> -    };
> -
> -...

-- 
Regards,

Laurent Pinchart
