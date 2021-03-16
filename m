Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65CA33DF80
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 21:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhCPUtC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 16:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbhCPUsp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 16:48:45 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA51DC06174A;
        Tue, 16 Mar 2021 13:48:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1F5EBD8B;
        Tue, 16 Mar 2021 21:48:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615927723;
        bh=Nu3QpWpARKdoDyOtGlqlTdoM65vNIWcxcmfwJWgA3gM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BSWf5lMLdj1PtVX1Ck91KLfgxci2D/q41wahPibk9vGCcFDnJLXt3Kvci1wa9SyFg
         6CtShwk/DYohK2occAjN18+1TR4D5Iv6ZhEDO0a2hF9aQWZkq1ONOhziqVAWuD/U+X
         XujOq+bUl7trZbTUY1ZBUXFNbWnpn532a1s+nrL0=
Date:   Tue, 16 Mar 2021 22:48:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: video-interfaces: Use documented
 bindings in example
Message-ID: <YFEZhyZO+ePjS+fr@pendragon.ideasonboard.com>
References: <20210316195100.3531414-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210316195100.3531414-1-robh@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Tue, Mar 16, 2021 at 01:51:00PM -0600, Rob Herring wrote:
> The example in video-interfaces.yaml managed to use a bunch of undocumented
> bindings. Update the example to use real bindings (and ones with a schema).
> 
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-media@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/media/video-interfaces.yaml      | 75 ++++++++-----------
>  1 file changed, 33 insertions(+), 42 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> index 0a7a73fd59f2..f30b9b91717b 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -227,17 +227,12 @@ examples:
>    # only one of the following data pipelines can be active:
>    # ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
>    - |
> +    #include <dt-bindings/clock/r8a7796-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/power/r8a7796-sysc.h>
> +
>      ceu@fe910000 {
> -        compatible = "renesas,sh-mobile-ceu";
>          reg = <0xfe910000 0xa0>;
> -        interrupts = <0x880>;
> -
> -        mclk: master_clock {
> -            compatible = "renesas,ceu-clock";
> -            #clock-cells = <1>;
> -            clock-frequency = <50000000>;  /* Max clock frequency */
> -            clock-output-names = "mclk";
> -        };
>  
>          port {
>              #address-cells = <1>;
> @@ -271,18 +266,14 @@ examples:
>          #size-cells = <0>;
>  
>          camera@21 {
> -            compatible = "ovti,ov772x";
> +            compatible = "ovti,ov7720";
>              reg = <0x21>;
> -            vddio-supply = <&regulator1>;
> -            vddcore-supply = <&regulator2>;
> -
> -            clock-frequency = <20000000>;
>              clocks = <&mclk 0>;
> -            clock-names = "xclk";
>  
>              port {
>                  /* With 1 endpoint per port no need for addresses. */
>                  ov772x_1_1: endpoint {
> +                    bus-type = <5>;
>                      bus-width = <8>;
>                      remote-endpoint = <&ceu0_1>;
>                      hsync-active = <1>;
> @@ -295,48 +286,48 @@ examples:
>          };
>  
>          camera@1a {
> -            compatible = "sony,imx074";
> +            compatible = "sony,imx334";
>              reg = <0x1a>;
> -            vddio-supply = <&regulator1>;
> -            vddcore-supply = <&regulator2>;
>  
> -            clock-frequency = <30000000>;  /* Shared clock with ov772x_1 */
>              clocks = <&mclk 0>;
> -            clock-names = "sysclk";    /* Assuming this is the
> -                       name in the datasheet */
> +
>              port {
> -                imx074_1: endpoint {
> +                imx334_1: endpoint {
>                      clock-lanes = <0>;
>                      data-lanes = <1 2>;
> +                    link-frequencies = /bits/ 64 <891000000>;
>                      remote-endpoint = <&csi2_1>;
>                  };
>              };
>          };
>      };
>  
> -    csi2: csi2@ffc90000 {
> -        compatible = "renesas,sh-mobile-csi2";
> -        reg = <0xffc90000 0x1000>;
> -        interrupts = <0x17a0>;
> -        #address-cells = <1>;
> -        #size-cells = <0>;
> +    csi2@fea80000 {
> +        compatible = "renesas,r8a7796-csi2";

That's certainly better, but the r8a7796 doesn't have a CEU :-) It has a
VIN. Maybe we could copy the last example from renesas,vin.yaml to
replace the CEU ?

> +        reg = <0xfea80000 0x10000>;
> +        interrupts = <0 184 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&cpg CPG_MOD 714>;
> +        power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
> +        resets = <&cpg 714>;
>  
> -        port@1 {
> -            compatible = "renesas,csi2c";  /* One of CSI2I and CSI2C. */
> -            reg = <1>;      /* CSI-2 PHY #1 of 2: PHY_S,
> -                       PHY_M has port address 0,
> -                       is unused. */
> -            csi2_1: endpoint {
> -                clock-lanes = <0>;
> -                data-lanes = <2 1>;
> -                remote-endpoint = <&imx074_1>;
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                csi2_1: endpoint {
> +                    clock-lanes = <0>;
> +                    data-lanes = <2 1>;
> +                    remote-endpoint = <&imx334_1>;
> +                };
>              };
> -        };
> -        port@2 {
> -            reg = <2>;      /* port 2: link to the CEU */
> +            port@1 {
> +                reg = <1>;
>  
> -            csi2_2: endpoint {
> -                remote-endpoint = <&ceu0_0>;
> +                csi2_2: endpoint {
> +                    remote-endpoint = <&ceu0_0>;
> +                };
>              };
>          };
>      };

-- 
Regards,

Laurent Pinchart
