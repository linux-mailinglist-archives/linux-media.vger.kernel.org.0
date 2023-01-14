Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B98366AC23
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 16:36:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjANPgb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 10:36:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjANPg0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 10:36:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6207EC7;
        Sat, 14 Jan 2023 07:36:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5862DE68;
        Sat, 14 Jan 2023 16:36:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673710581;
        bh=oDrlfSPdTFyXZaTTXgrkv7YDc/MFOXiCVSywrVWuIMk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OaArFeaVkN77RcrzMMOuoAQhQcvzG1DBgHu+z2zNrwo3LP4zdiPFefB+/iAaMdojQ
         CpiPg2PCIGddun65fJWvWk4oN24SJaDy32AS5G/QHC3NtwwKG91xKFz8mQazIPCCYc
         sgWtC2YgEQ3CGUy3Hu/wBK0sxrbAoLYWMQaJEf5I=
Date:   Sat, 14 Jan 2023 17:36:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 6/6] ARM: dts: stm32: Use new media bus type macros
Message-ID: <Y8LL9RuzIFTAbcvC@pendragon.ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-7-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220615221410.27459-7-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hugues, Maxime, Alexandre, could one of you take this patch in your tree
for v6.3 ? The two patches that it depends on have both been merged in
v6.2.

On Thu, Jun 16, 2022 at 01:14:10AM +0300, Laurent Pinchart wrote:
> Now that a header exists with macros for the media interface bus-type
> values, replace hardcoding numerical constants with the corresponding
> macros in the DT sources.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/boot/dts/stm32429i-eval.dts  | 3 ++-
>  arch/arm/boot/dts/stm32mp157c-ev1.dts | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/stm32429i-eval.dts b/arch/arm/boot/dts/stm32429i-eval.dts
> index 0d98aca01736..5fae11e6607b 100644
> --- a/arch/arm/boot/dts/stm32429i-eval.dts
> +++ b/arch/arm/boot/dts/stm32429i-eval.dts
> @@ -50,6 +50,7 @@
>  #include "stm32f429-pinctrl.dtsi"
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interfaces.h>
>  
>  / {
>  	model = "STMicroelectronics STM32429i-EVAL board";
> @@ -186,7 +187,7 @@ &dcmi {
>  	port {
>  		dcmi_0: endpoint {
>  			remote-endpoint = <&ov2640_0>;
> -			bus-type = <5>;
> +			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
>  			bus-width = <8>;
>  			hsync-active = <0>;
>  			vsync-active = <0>;
> diff --git a/arch/arm/boot/dts/stm32mp157c-ev1.dts b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> index d142dd30e16b..306d41a6138f 100644
> --- a/arch/arm/boot/dts/stm32mp157c-ev1.dts
> +++ b/arch/arm/boot/dts/stm32mp157c-ev1.dts
> @@ -8,6 +8,7 @@
>  #include "stm32mp157c-ed1.dts"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/media/video-interfaces.h>
>  
>  / {
>  	model = "STMicroelectronics STM32MP157C eval daughter on eval mother";
> @@ -90,7 +91,7 @@ &dcmi {
>  	port {
>  		dcmi_0: endpoint {
>  			remote-endpoint = <&ov5640_0>;
> -			bus-type = <5>;
> +			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
>  			bus-width = <8>;
>  			hsync-active = <0>;
>  			vsync-active = <0>;

-- 
Regards,

Laurent Pinchart
