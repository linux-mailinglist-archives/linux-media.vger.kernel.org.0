Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0EE35515F
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 12:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245240AbhDFK6E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 06:58:04 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:37209 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241469AbhDFK6D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 6 Apr 2021 06:58:03 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id TjP4l4TyT43ycTjP7lNdM9; Tue, 06 Apr 2021 12:57:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617706674; bh=DNZA3oB8UWCwpjl0MBgM7pX0tWEw6GsoXltvd2t81NU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ELrtghCbyYtkMftCze+cGk8jwkrhBrEW0e0FbuDwatREOz9Vw8976h4t28+50dZrR
         yBocUbnn6OPqt43i7rGkXJJebsQ0crL9kFUmV6IzddQJ208lOnRS+DCa5OsqGl5ids
         O+Q9Cxa7B/JqoeK0YKcULW9CTmx0NgIt5uJng6sSkjFEnU4eJ+Fl62rphB7MV/CA5p
         1VWbkl2/oHW69Kt9itgyeTZW6hbwoX5sUQh11QJm9xrgO0uaToJ1u26zy4SUoVIPTs
         MMSy6BwpybaGP/VudlA+GocgyJSy8aob5Eex4tf20IYVjZjaVcwUpPyqK99aVLi+ZN
         g361PfWICMlcw==
Subject: Re: [PATCH v8 02/13] dt-bindings: media: nxp,imx8mq-vpu: Update the
 bindings for G2 support
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org,
        robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, lee.jones@linaro.org,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org,
        kernel@collabora.com, Rob Herring <robh@kernel.org>
References: <20210401160003.88803-1-benjamin.gaignard@collabora.com>
 <20210401160003.88803-3-benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <64bcdb7c-37a8-0d6e-1588-db096523725d@xs4all.nl>
Date:   Tue, 6 Apr 2021 12:57:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210401160003.88803-3-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLDv0rUrPK58xwNzO4QnehCj97lxwmR/HSBvm+VjPM3UbXxNQHw9C6pgJ3C6PGCs4LQbnvjjmq08S63vpsIpmAZ0Ib7JH9wPTn0AYPWETHPx95/3cM3o
 NuhZ4GPC0mgIgDPVGSqs/pte/3+kBas//009BMv7+MOPulMK92pFUcUflVmRwG6hlN7t6VsFfAU0dY9ZYVMam08TEXy3Yc7VmbTwEHg81P6daEQMNZNCFCOZ
 KBTc8oreJBJ/9uv5cvZHGRIcuvFFsddzLDk7CXbc/fun2VDS30dII/kb9xzq8gLB8UcTdYrhkobeHQpMlPPk3g2B+i8B31sB7SNMve5EfnVw9YgQiKIbolzB
 EAEXR/bf2jFT1TzxXMzy7T2ljlGeg6XgHngz52YJwGtQyUlxR79BuRYH/M+vbBHHjwllvtSR/4dOlXI1E9i+uZY3CNNAstwqaYF+p69LXO9d7Y4yDukwuru4
 ftAJaPGT2xlTCG3hcRgfNxmulOB+aecZpmi68VvFA+8JNvoOHIWteO+4kE8FIcMjGXe/2R7Rt02PYgVckFxneQfGKdS8PAt72cG3WnUCSP5vNgMqIingeBXy
 TXOHDOmHFEL2z0ANeVx7aQDuA7sGwn+Oy3yMsB+GhFkQu1HQxbJgVgzG9e35xD91ufqA9wiEjD3Ts/wC2rhSTYKpiliSxTUL1tAX5+ncmQ5Bi3g68iYefHou
 cVngT5n/goY+EmB/yYYNP81lUfChxPV5IYS/HrsPalto/2yqetWkRnNY0j2PFv9VoDPtREvGYJN+IJ8D2H4BwXVF9tNdZ83ykPuChDi4TjZ1Sq6CxFii/KXi
 r4ny5846jH+tD2zqKYjijNkiJaF9uBr/SoBtvU8Y9KfMHeTlC7+k3kDdJirkTpFw7immdH9Rm35HXFGYOA/HUCINKWckZ4hWJqohnd7lmgQboZcf9o6ElOX7
 vbRjfmb3Uu78VnYSE0EOF+teyRZ3udhW48HuAV0JYxpnEmwdkMlsR7Ej5+mopsYkl/cwvZwrasHR4x1Z7MtaAr3Aw4Ge2+q9744b7jt5ZZkXfr/z
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/04/2021 17:59, Benjamin Gaignard wrote:
> Introducing G2 hevc video decoder lead to modify the bindings to allow
> to get one node per VPUs.

Introducing the G2 hevc video decoder requires modifications of the bindings to allow
one node per VPU.

> VPUs share one hardware control block which is provided as a phandle on
> an syscon.

an -> a

> Each node got now one reg and one interrupt.

got now -> has now

> Add a compatible for G2 hardware block: nxp,imx8mq-vpu-g2.
> 
> To be compatible with older DT the driver is still capable to use 'ctrl'

use -> use the

> reg-name even if it is deprecated now.

Regards,

	Hans

> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
> version 7:
> - Add Rob and Philipp reviewed-by tag
> - Change syscon phandle name to nxp,imx8m-vpu-ctrl (remove 'q' to be
>   usable for iMX8MM too)
> 
> version 5:
> - This version doesn't break the backward compatibilty between kernel
>   and DT.
> 
>  .../bindings/media/nxp,imx8mq-vpu.yaml        | 53 ++++++++++++-------
>  1 file changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> index 762be3f96ce9..18e7d40a5f24 100644
> --- a/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> +++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
> @@ -15,22 +15,18 @@ description:
>  
>  properties:
>    compatible:
> -    const: nxp,imx8mq-vpu
> +    oneOf:
> +      - const: nxp,imx8mq-vpu
> +      - const: nxp,imx8mq-vpu-g2
>  
>    reg:
> -    maxItems: 3
> -
> -  reg-names:
> -    items:
> -      - const: g1
> -      - const: g2
> -      - const: ctrl
> +    maxItems: 1
>  
>    interrupts:
> -    maxItems: 2
> +    maxItems: 1
>  
>    interrupt-names:
> -    items:
> +    oneOf:
>        - const: g1
>        - const: g2
>  
> @@ -46,14 +42,18 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  nxp,imx8m-vpu-ctrl:
> +    description: Specifies a phandle to syscon VPU hardware control block
> +    $ref: "/schemas/types.yaml#/definitions/phandle"
> +
>  required:
>    - compatible
>    - reg
> -  - reg-names
>    - interrupts
>    - interrupt-names
>    - clocks
>    - clock-names
> +  - nxp,imx8m-vpu-ctrl
>  
>  additionalProperties: false
>  
> @@ -62,18 +62,33 @@ examples:
>          #include <dt-bindings/clock/imx8mq-clock.h>
>          #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
> -        vpu: video-codec@38300000 {
> +        vpu_ctrl: syscon@38320000 {
> +                 compatible = "nxp,imx8mq-vpu-ctrl", "syscon";
> +                 reg = <0x38320000 0x10000>;
> +        };
> +
> +        vpu_g1: video-codec@38300000 {
>                  compatible = "nxp,imx8mq-vpu";
> -                reg = <0x38300000 0x10000>,
> -                      <0x38310000 0x10000>,
> -                      <0x38320000 0x10000>;
> -                reg-names = "g1", "g2", "ctrl";
> -                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> -                             <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> -                interrupt-names = "g1", "g2";
> +                reg = <0x38300000 0x10000>;
> +                interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupt-names = "g1";
> +                clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
> +                         <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
> +                         <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
> +                clock-names = "g1", "g2", "bus";
> +                power-domains = <&pgc_vpu>;
> +                nxp,imx8m-vpu-ctrl = <&vpu_ctrl>;
> +        };
> +
> +        vpu_g2: video-codec@38310000 {
> +                compatible = "nxp,imx8mq-vpu-g2";
> +                reg = <0x38300000 0x10000>;
> +                interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupt-names = "g2";
>                  clocks = <&clk IMX8MQ_CLK_VPU_G1_ROOT>,
>                           <&clk IMX8MQ_CLK_VPU_G2_ROOT>,
>                           <&clk IMX8MQ_CLK_VPU_DEC_ROOT>;
>                  clock-names = "g1", "g2", "bus";
>                  power-domains = <&pgc_vpu>;
> +                nxp,imx8m-vpu-ctrl = <&vpu_ctrl>;
>          };
> 

