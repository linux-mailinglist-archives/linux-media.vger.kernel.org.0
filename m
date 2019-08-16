Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E2D3900BB
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 13:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbfHPL2y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 07:28:54 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:56143 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727124AbfHPL2y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 07:28:54 -0400
Received: from [IPv6:2001:420:44c1:2579:f913:6b08:b730:6d3b] ([IPv6:2001:420:44c1:2579:f913:6b08:b730:6d3b])
        by smtp-cloud7.xs4all.net with ESMTPA
        id yaPYhn5RgThuuyaPbhKDy3; Fri, 16 Aug 2019 13:28:52 +0200
Subject: Re: [PATCH v7 10/13] media: dt-bindings: tvp5150: cleanup bindings
 stlye
To:     Marco Felsch <m.felsch@pengutronix.de>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, Rob Herring <robh@kernel.org>
References: <20190815115747.24018-1-m.felsch@pengutronix.de>
 <20190815115747.24018-11-m.felsch@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <8a9b0580-7c7c-927f-172b-aaca9e01861b@xs4all.nl>
Date:   Fri, 16 Aug 2019 13:28:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190815115747.24018-11-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNSdp2KmEynw/WFWYmmcuItMR6tf80AigIVrXu9+bYdcT/LTQFhHZ1SI/IsULYOmm07dIJyEEjV5s6XeJm20+uX99OpP7SRrx/ohPqojlykk5+stZfgO
 xZH/Z+XCFlVUx+DFpnbMF/mXhb+ax3PvrgvZ4B4buNcxKJIUpok8OqDU9Zluh1/7S6tfNKloyPx8mVhxj1I8Mq0J//Qqd2DdL/ZDJKLPs6TW/7N4vqM/e1Qb
 zuOpayCeVywHoKfUiRou5PLDIao92/iH/fRZ+QV7GwgAXlft1NXNH9GBa2q1OlKiobPN7KWZS8aW4pbIU/kOkOlK8WRplbu/BTuNAbppFwgAypR+uHoxIVoR
 XWHDGxD8dD9FU0yjc/8dmAefefq2XZ2iCcBh6mw9H+K/BcD5tkAriXic3WXD4fuJrceKkUXh6eYwmqXiZpzavw7wnzUeiCJDbBKaQIItrKTBSprM1DLpA+HS
 xNavCmpVB46G3z1ZGMbjKfI3wN/RSTkImvaLHSOC4omVV2EivEVFPxDWxkY90ziR0gFxulCitGjlLFQMh4p9qNm4nCsAFxVxTl1desWArSz4tQuDeMcsAOU2
 FPCdiLCeZ04IXYzY3lPPlnzQ4Mdxf3dO5TNxauPkNIhDJeRfLSk5gzafCR7mms2OVxc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Typo in subject: stlye -> style.

Regards,

	Hans

On 8/15/19 1:57 PM, Marco Felsch wrote:
> Use underlines to highlight optional and required properties. This is
> quite common for all bindings. Align descriptions and start sentence
> with uppercase letter. Also reword the usage of the required
> endpoint properties for the output port in case BT.656 should be used.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/media/i2c/tvp5150.txt | 30 +++++++++++--------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
> index 28b64ad149ef..cc98b38c7e73 100644
> --- a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
> @@ -5,12 +5,14 @@ The TVP5150 and TVP5151 are video decoders that convert baseband NTSC and PAL
>  with discrete syncs or 8-bit ITU-R BT.656 with embedded syncs output formats.
>  
>  Required Properties:
> -- compatible: value must be "ti,tvp5150"
> -- reg: I2C slave address
> +====================
> +- compatible:	Value must be "ti,tvp5150".
> +- reg:		I2C slave address.
>  
>  Optional Properties:
> -- pdn-gpios: phandle for the GPIO connected to the PDN pin, if any.
> -- reset-gpios: phandle for the GPIO connected to the RESETB pin, if any.
> +====================
> +- pdn-gpios:	Phandle for the GPIO connected to the PDN pin, if any.
> +- reset-gpios:	Phandle for the GPIO connected to the RESETB pin, if any.
>  
>  The device node must contain one 'port' child node per device physical input
>  and output port, in accordance with the video interface bindings defined in
> @@ -24,9 +26,8 @@ are numbered as follows
>  	  Y-OUT		src		2
>  
>  The device node must contain at least one sink port and the src port. Each input
> -port must be linked to an endpoint defined in
> -Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt. The
> -port/connector layout is as follows
> +port must be linked to an endpoint defined in [1]. The port/connector layout is
> +as follows
>  
>  tvp-5150 port@0 (AIP1A)
>  	endpoint@0 -----------> Comp0-Con  port
> @@ -38,14 +39,17 @@ tvp-5150 port@2
>  	endpoint (video bitstream output at YOUT[0-7] parallel bus)
>  
>  Required Endpoint Properties for parallel synchronization on output port:
> +=========================================================================
>  
> -- hsync-active: active state of the HSYNC signal. Must be <1> (HIGH).
> -- vsync-active: active state of the VSYNC signal. Must be <1> (HIGH).
> -- field-even-active: field signal level during the even field data
> -  transmission. Must be <0>.
> +- hsync-active:		Active state of the HSYNC signal. Must be <1> (HIGH).
> +- vsync-active:		Active state of the VSYNC signal. Must be <1> (HIGH).
> +- field-even-active:	Field signal level during the even field data
> +			transmission. Must be <0>.
>  
> -If none of hsync-active, vsync-active and field-even-active is specified,
> -the endpoint is assumed to use embedded BT.656 synchronization.
> +Note: Do not specify any of these properties if you want to use the embedded
> +      BT.656 synchronization.
> +
> +[1] Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt.
>  
>  Example - three input sources:
>  
> 

