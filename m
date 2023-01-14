Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD5F66AC29
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 16:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjANPha (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 10:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbjANPh0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 10:37:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF2B65A5;
        Sat, 14 Jan 2023 07:37:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE7F8E68;
        Sat, 14 Jan 2023 16:37:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673710644;
        bh=pE4ABdxxn81iwj+Byed8sC66F5pDBBt+kKRIrDiVj/0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NwXqibWo6DKnGHdc2ei3OdP4G+4dceSdja5tI7XZmiTG2RvatuSI3JQ+BU4qj36/I
         Bgdwq/YdRWf6eITqZ24gGYPA+6ZVgcA2IDw2mIYEozLgF6s+TCFKoahiRH3iEgu3P9
         ACh7gqr2WbrEiIFJtjhjiAQzJxngQqr7cS0gOeco=
Date:   Sat, 14 Jan 2023 17:37:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v3 4/6] ARM: dts: omap: Use new media bus type macros
Message-ID: <Y8LMNDIoSZzFBLMB@pendragon.ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-5-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220615221410.27459-5-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tony, could you take this patch in your tree for v6.3 ? The two patches
that it depends on have both been merged in v6.2.

On Thu, Jun 16, 2022 at 01:14:08AM +0300, Laurent Pinchart wrote:
> Now that a header exists with macros for the media interface bus-type
> values, replace hardcoding numerical constants with the corresponding
> macros in the DT sources.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/boot/dts/omap3-n900.dts | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n900.dts
> index d40c3d2c4914..9cad9d6a83e2 100644
> --- a/arch/arm/boot/dts/omap3-n900.dts
> +++ b/arch/arm/boot/dts/omap3-n900.dts
> @@ -9,6 +9,7 @@
>  #include "omap34xx.dtsi"
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interfaces.h>
>  
>  /*
>   * Default secure signed bootloader (Nokia X-Loader) does not enable L3 firewall
> @@ -194,7 +195,7 @@ port@1 {
>  
>  			csi_isp: endpoint {
>  				remote-endpoint = <&csi_cam1>;
> -				bus-type = <3>; /* CCP2 */
> +				bus-type = <MEDIA_BUS_TYPE_CCP2>;
>  				clock-lanes = <1>;
>  				data-lanes = <0>;
>  				lane-polarity = <0 0>;
> @@ -835,7 +836,7 @@ cam1: camera@3e {
>  
>  		port {
>  			csi_cam1: endpoint {
> -				bus-type = <3>; /* CCP2 */
> +				bus-type = <MEDIA_BUS_TYPE_CCP2>;
>  				strobe = <1>;
>  				clock-inv = <0>;
>  				crc = <1>;

-- 
Regards,

Laurent Pinchart
