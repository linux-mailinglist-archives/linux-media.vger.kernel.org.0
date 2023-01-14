Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62AD366AC17
	for <lists+linux-media@lfdr.de>; Sat, 14 Jan 2023 16:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjANPaL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 14 Jan 2023 10:30:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjANPaK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 14 Jan 2023 10:30:10 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4D456597;
        Sat, 14 Jan 2023 07:30:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78530E68;
        Sat, 14 Jan 2023 16:30:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673710207;
        bh=tP6Hjycs1/g7PJIhsmoUXKIXkZCkiWBCs2PF9z9Q8+c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G/KAig60CfDCNjhAFp2mk//uX8j7Uy25ScKBwyxRRzt6O+Q4rmYT3rTpxACIDyRGD
         OxbWGVLZZqpWRb/YuTpvaxMghcUaQIckbQYKTX0b2U+1IcJvjycw531PghWgwYyxOI
         mblGwqd9ZDNEFv1Qj0nltVRnAqfUnOiwUOz7kKDM=
Date:   Sat, 14 Jan 2023 17:30:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Shawn Guo <shawnguo@kernel.org>
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
        Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 3/6] ARM: dts: freescale: Use new media bus type macros
Message-ID: <Y8LKf0ez1vM+a2YB@pendragon.ideasonboard.com>
References: <20220615221410.27459-1-laurent.pinchart@ideasonboard.com>
 <20220615221410.27459-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220615221410.27459-4-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Shawn, could you please take this in your tree for v6.3 ? The two
patches that the DT changes depend on have been merged in v6.2.

On Thu, Jun 16, 2022 at 01:14:07AM +0300, Laurent Pinchart wrote:
> Now that a header exists with macros for the media interface bus-type
> values, replace hardcoding numerical constants with the corresponding
> macros in the DT sources.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  arch/arm/boot/dts/imx6ul-14x14-evk.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
> index 1a18c41ce385..d98111f2100f 100644
> --- a/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
> +++ b/arch/arm/boot/dts/imx6ul-14x14-evk.dtsi
> @@ -2,6 +2,8 @@
>  //
>  // Copyright (C) 2015 Freescale Semiconductor, Inc.
>  
> +#include <dt-bindings/media/video-interfaces.h>
> +
>  / {
>  	chosen {
>  		stdout-path = &uart1;
> @@ -170,7 +172,7 @@ &csi {
>  	port {
>  		parallel_from_ov5640: endpoint {
>  			remote-endpoint = <&ov5640_to_parallel>;
> -			bus-type = <5>; /* Parallel bus */
> +			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
>  		};
>  	};
>  };

-- 
Regards,

Laurent Pinchart
