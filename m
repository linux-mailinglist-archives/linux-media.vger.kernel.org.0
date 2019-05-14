Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B91C1CF0B
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2019 20:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbfENS1S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 14:27:18 -0400
Received: from casper.infradead.org ([85.118.1.10]:49610 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbfENS1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 14:27:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=eoZeV8fsdntOXcb906iAMkEczgAtLby5AJHGuW+PA7s=; b=uinyovkr04iCJQ5bIzL+E4GGd2
        W9pAPxbYXW3sxW9CAyn2/GJ6g8JQdnZ7yGg70i5gBwPYDSM1W1haslA2B8r9KxmoMFnzQFcjSLwPv
        5NtkZivTsd0n9JIIN3z7E2OTzV6nDNick818sYeS/HWilHJKEWcistt7DcNvQ8pl9qz7db7csp3Cu
        k2+psv26CtdOuRgXFJnEDCTttZ8gBKS8LDudDdq1sEhYzDtCNyCrZmD18gS9GhpoZ4ibEu+w1iVEt
        m57Bm+drlfdpI/I+2uEFM6pJeyDb7mtaEE5yiDpe5nU5tkMSyM38iDLIXYaoH4jQOulyGcoKPk+B4
        oXwQ23fA==;
Received: from [179.179.44.200] (helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hQc8r-00040e-Lq; Tue, 14 May 2019 18:27:10 +0000
Date:   Tue, 14 May 2019 15:27:04 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v6 06/13] media: dt-bindings: tvp5150: Add input port
 connectors DT bindings
Message-ID: <20190514152704.48208c7d@coco.lan>
In-Reply-To: <20190415124413.18456-7-m.felsch@pengutronix.de>
References: <20190415124413.18456-1-m.felsch@pengutronix.de>
        <20190415124413.18456-7-m.felsch@pengutronix.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 15 Apr 2019 14:44:06 +0200
Marco Felsch <m.felsch@pengutronix.de> escreveu:

> The TVP5150/1 decoders support different video input sources to their
> AIP1A/B pins.
> 
> Possible configurations are as follows:
>   - Analog Composite signal connected to AIP1A.
>   - Analog Composite signal connected to AIP1B.
>   - Analog S-Video Y (luminance) and C (chrominance)
>     signals connected to AIP1A and AIP1B respectively.
> 
> This patch extends the device tree bindings documentation to describe
> how the input connectors for these devices should be defined in a DT.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> Reviewed-by: Rob Herring <robh@kernel.org>

Looks good to me.

> ---
> Changelog:
> 
> v3:
> - remove examples for one and two inputs
> - replace space by tabs
> 
> v2:
> - adapt port layout in accordance with
>   https://www.spinics.net/lists/linux-media/msg138546.html with the
>   svideo-connector deviation (use only one endpoint)
> 
>  .../devicetree/bindings/media/i2c/tvp5150.txt | 92 +++++++++++++++++--
>  1 file changed, 85 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
> index 8c0fc1a26bf0..bdd273d8b44d 100644
> --- a/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
> +++ b/Documentation/devicetree/bindings/media/i2c/tvp5150.txt
> @@ -12,11 +12,31 @@ Optional Properties:
>  - pdn-gpios: phandle for the GPIO connected to the PDN pin, if any.
>  - reset-gpios: phandle for the GPIO connected to the RESETB pin, if any.
>  
> -The device node must contain one 'port' child node for its digital output
> -video port, in accordance with the video interface bindings defined in
> -Documentation/devicetree/bindings/media/video-interfaces.txt.
> +The device node must contain one 'port' child node per device physical input
> +and output port, in accordance with the video interface bindings defined in
> +Documentation/devicetree/bindings/media/video-interfaces.txt. The port nodes
> +are numbered as follows
>  
> -Required Endpoint Properties for parallel synchronization:
> +	  Name		Type		Port
> +	--------------------------------------
> +	  AIP1A		sink		0
> +	  AIP1B		sink		1
> +	  Y-OUT		src		2
> +
> +The device node must contain at least one sink port and the src port. Each input
> +port must be linked to an endpoint defined in
> +Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt. The
> +port/connector layout is as follows
> +
> +tvp-5150 port@0 (AIP1A)
> +	endpoint@0 -----------> Comp0-Con  port
> +	endpoint@1 -----------> Svideo-Con port
> +tvp-5150 port@1 (AIP1B)
> +	endpoint   -----------> Comp1-Con  port
> +tvp-5150 port@2
> +	endpoint (video bitstream output at YOUT[0-7] parallel bus)
> +
> +Required Endpoint Properties for parallel synchronization on output port:
>  
>  - hsync-active: active state of the HSYNC signal. Must be <1> (HIGH).
>  - vsync-active: active state of the VSYNC signal. Must be <1> (HIGH).
> @@ -26,17 +46,75 @@ Required Endpoint Properties for parallel synchronization:
>  If none of hsync-active, vsync-active and field-even-active is specified,
>  the endpoint is assumed to use embedded BT.656 synchronization.
>  
> -Example:
> +Example - three input sources:
> +
> +comp_connector_0 {
> +	compatible = "composite-video-connector";
> +	label = "Composite0";
> +
> +	port {
> +		composite0_to_tvp5150: endpoint {
> +			remote-endpoint = <&tvp5150_to_composite0>;
> +		};
> +	};
> +};
> +
> +comp_connector_1 {
> +	compatible = "composite-video-connector";
> +	label = "Composite1";
> +
> +	port {
> +		composite1_to_tvp5150: endpoint {
> +			remote-endpoint = <&tvp5150_to_composite1>;
> +		};
> +	};
> +};
> +
> +svid_connector {
> +	compatible = "svideo-connector";
> +	label = "S-Video";
> +
> +	port {
> +		svideo_to_tvp5150: endpoint {
> +			remote-endpoint = <&tvp5150_to_svideo>;
> +		};
> +	};
> +};
>  
>  &i2c2 {
> -	...
>  	tvp5150@5c {
>  		compatible = "ti,tvp5150";
>  		reg = <0x5c>;
>  		pdn-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
>  		reset-gpios = <&gpio6 7 GPIO_ACTIVE_LOW>;
>  
> -		port {
> +		port@0 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +
> +			tvp5150_to_composite0: endpoint@0 {
> +				reg = <0>;
> +				remote-endpoint = <&composite0_to_tvp5150>;
> +			};
> +
> +			tvp5150_to_svideo: endpoint@1 {
> +				reg = <1>;
> +				remote-endpoint = <&svideo_to_tvp5150>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			tvp5150_to_composite1: endpoint {
> +                                remote-endpoint = <&composite1_to_tvp5150>;
> +			};
> +		};
> +
> +		port@2 {
> +			reg = <2>;
> +
>  			tvp5150_1: endpoint {
>  				remote-endpoint = <&ccdc_ep>;
>  			};



Thanks,
Mauro
