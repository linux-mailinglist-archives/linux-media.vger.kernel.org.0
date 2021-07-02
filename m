Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45B593BA110
	for <lists+linux-media@lfdr.de>; Fri,  2 Jul 2021 15:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232548AbhGBNSV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jul 2021 09:18:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53048 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231929AbhGBNST (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jul 2021 09:18:19 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0B8354AB;
        Fri,  2 Jul 2021 15:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1625231746;
        bh=lPQJSYgt7FOS0ZkOS6nFwGRvOUGexo8giKIh+LYutSc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pHLzrIklM+D1u9072Zq6oG9RldGQojp2iOKsBao67u0bSDf33eZQ8EGZwjVrJAxyZ
         IHflh82diE7LOOBMsucWscYMFwEps7iAjKnAZOd98e/a8u6r7DFA38LIJ0UQb7pzyU
         DTLOLaJqp8Q3Vxwc2juwVUxHZVmL1+X3MzNS0JQ8=
Date:   Fri, 2 Jul 2021 16:15:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] dt-bindings: media: mt9p031: Add missing required
 properties
Message-ID: <YN8RWoy0xryBw3bL@pendragon.ideasonboard.com>
References: <20210702095922.118614-1-s.riedmueller@phytec.de>
 <20210702095922.118614-4-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210702095922.118614-4-s.riedmueller@phytec.de>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

Thank you for the patch.

On Fri, Jul 02, 2021 at 11:59:19AM +0200, Stefan Riedmueller wrote:
> Add missing required clocks and supply regulator properties for the
> sensor input clock and vdd, vdd_io and vaa supply regulators.

Can I volunteer you to convert these bindings to YAML first, and add the
properties on top ? :-)

> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  .../devicetree/bindings/media/i2c/mt9p031.txt        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/mt9p031.txt b/Documentation/devicetree/bindings/media/i2c/mt9p031.txt
> index cb60443ff78f..4437d0e3147d 100644
> --- a/Documentation/devicetree/bindings/media/i2c/mt9p031.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/mt9p031.txt
> @@ -9,6 +9,12 @@ Required Properties:
>  	(a) "aptina,mt9p031" for mt9p031 sensor
>  	(b) "aptina,mt9p031m" for mt9p031m sensor
>  
> +- clocks: Reference to the sensor input clock
> +
> +- vdd-supply: VDD supply regulator
> +- vdd_io-supply: VDD_IO supply regulator
> +- vaa-supply: VAA supply regulator
> +
>  - input-clock-frequency: Input clock frequency.
>  
>  - pixel-clock-frequency: Pixel clock frequency.
> @@ -29,6 +35,12 @@ Example:
>  			reg = <0x5d>;
>  			reset-gpios = <&gpio3 30 0>;
>  
> +			clocks = <&sensor_clk>;
> +
> +			vdd-supply = <&reg_vdd>;
> +			vdd_io-supply = <&reg_vdd_io>;
> +			vaa-supply = <&reg_vaa>;
> +
>  			port {
>  				mt9p031_1: endpoint {
>  					input-clock-frequency = <6000000>;

-- 
Regards,

Laurent Pinchart
