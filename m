Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B2D35C334
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 12:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239750AbhDLJ6W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:58:22 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:37773 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239992AbhDLJ5A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:57:00 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 73077E0006;
        Mon, 12 Apr 2021 09:56:35 +0000 (UTC)
Date:   Mon, 12 Apr 2021 11:57:14 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 28/30] dt-bindings: media: atmel: add microchip-xisc
 binding
Message-ID: <20210412095714.uivebcatgazzq5ae@uno.localdomain>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
 <20210405155105.162529-29-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210405155105.162529-29-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugene,

On Mon, Apr 05, 2021 at 06:51:03PM +0300, Eugen Hristev wrote:
> Add bindings for the microchip xisc, a driver based on atmel-isc.
> It shares common code with atmel-isc, but the xisc is the next generation
> ISC which is present on sama7g5 product.
> It has an enhanced pipeline, additional modules, formats, and it supports
> not only parallel sensors, but also serial sensors, by connecting to a demux
> endpoint present on sama7g5.
> One of the key points for creating a new binding is the clocking scheme, as
> atmel-isc requires 3 mandatory clocks, the microchip-xisc requires a single
> input clock.
>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>
> Hello Rob, all,
>
> I did not convert this yet to yaml because I would like first your feedback
> if the binding is good.
> If it's fine I will convert both this new binding and the old atmel-isc
> to yaml.
>
> Thanks for your feedback,
> Eugen
>
>  .../bindings/media/microchip-xisc.txt         | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/microchip-xisc.txt
>
> diff --git a/Documentation/devicetree/bindings/media/microchip-xisc.txt b/Documentation/devicetree/bindings/media/microchip-xisc.txt
> new file mode 100644
> index 000000000000..080a357ed84d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/microchip-xisc.txt
> @@ -0,0 +1,64 @@
> +Microchip eXtended Image Sensor Controller (XISC)
> +----------------------------------------------
> +
> +Required properties for XISC:
> +- compatible
> +	Must be "microchip,sama7g5-xisc".
> +- reg
> +	Physical base address and length of the registers set for the device.
> +- interrupts
> +	Should contain IRQ line for the XISC.
> +- clocks
> +	List of clock specifiers, corresponding to entries in
> +	the clock-names property;
> +	Please refer to clock-bindings.txt.
> +- clock-names
> +	Required elements: "hclock".
> +	This is the clock that clocks the sensor controller, and is usually
> +	fed from the clock tree. It is used for the internal controller logic.
> +- #clock-cells
> +	Should be 0.
> +- clock-output-names
> +	Should be "isc-mck".
> +- pinctrl-names, pinctrl-0
> +	Please refer to pinctrl-bindings.txt.
> +
> +Optional properties for XISC:
> +- microchip,mipi-mode;
> +	As the XISC is usually connected to a demux/bridge, the XISC receives
> +	the same type of input, however, it should be aware of the type of
> +	signals received. The mipi-mode enables different internal handling
> +	of the data and clock lines.

What does 'mipi-mode' do to a component that has an parallel receiver ?

> +
> +XISC supports a single port node with internal parallel bus.
> +It should contain one 'port' child node with child 'endpoint' node.
> +Please refer to the bindings defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt.
> +
> +This endpoint has to be connected to a bridge that acts as a demux from either
> +a serial interface or acts as a simple direct bridge to a parallel sensor.
> +
> +Example:
> +xisc: xisc@e1408000 {
> +	compatible = "microchip,sama7g5-isc";
> +	reg = <0xe1408000 0x2000>;
> +	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	clocks = <&pmc PMC_TYPE_PERIPHERAL 56>;
> +	clock-names = "hclock";
> +	#clock-cells = <0>;
> +	clock-output-names = "isc-mck";
> +	microchip,mipi-mode;
> +
> +	port@1 {
> +		reg = <1>;
> +		xisc_in: endpoint {
> +		bus-width = <12>;
> +		hsync-active = <1>;
> +		vsync-active = <1>;
> +		remote-endpoint = <&csi2dc_out>;
nit: indentation

Have you consided using bus-type property ? As that's a new binding I
would consider making it mandatory, and to modify the DT parsinga
routine accordingly to remove auto-guessing, which according to my
understanding is almost 'deprecated' ?

> +		};
> +	};
> +};
> +
> --
> 2.25.1
>
