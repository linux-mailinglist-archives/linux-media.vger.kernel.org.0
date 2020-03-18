Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EFF718989F
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 10:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727578AbgCRJz2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 05:55:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41970 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727405AbgCRJz1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 05:55:27 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7683F9;
        Wed, 18 Mar 2020 10:55:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584525326;
        bh=jse4p8CidqqLBfDIycC52gS27VGbXSD8DVFN04FkBhI=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=PKofjSQGBzrQIfryAQV1sin/dV2PhT7UV+RgFj04ltYIh78rH22lLMitIpksLs7Nz
         K/nWMMZgra/84SLo1Y65foFv2dudUy7AvHlUOSZzdnFeh0s6um5fyXFi7O90wFJagM
         0ymjfjBPp7HXgMKP2aH/NOfgCUvU+rX9ysqFVGKg=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 4/5] dt-bindings: media: max9286: Add reverse channel
 amplitude
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     hyunk@xilinx.com, manivannan.sadhasivam@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
References: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
 <20200316202757.529740-5-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <8c9ef39a-5318-a103-1855-952323670bc1@ideasonboard.com>
Date:   Wed, 18 Mar 2020 09:55:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200316202757.529740-5-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/03/2020 20:27, Jacopo Mondi wrote:
> The MAX9286 chip exposes registers to control the reverse channel
> amplitude signal. The channel amplitude has to be configured according
> to the connected remote serializer settings, in order to guarantee
> reliable communications.
> 
> Serializer might be pre-programmed and initialize with their reverse
> channel noise threshold level increased. While this is intended to
> increase the signal/noise immunity ratio on the channel, the
> deserializer should be initialized accordingly, with its channel
> amplitude increased to 170mV.
> 
> Add to the bindings documentation a required property to allow DTS users
> to specify the initial setting of the deserializer reverse channel and
> accommodate different serializer models.
> 

Same comments really as the other property, that these are highly
dependent upon the serializer which is connected, so I wonder if there's
a better way to describe that association / communication requirement.

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../bindings/media/i2c/maxim,max9286.yaml     | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index ee8e0418b3f0..a1c56734a727 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -54,6 +54,25 @@ properties:
>      allOf:
>        - $ref: /schemas/types.yaml#/definitions/uint32
>  
> +  maxim,reverse-channel-amplitude:
> +    description: |
> +      The reverse channel amplitude initial value, in milliVolts. If the remote

Should there be a newline after milliVolts. ? That seems like a brief,
followed by a description but all flowing together?

> +      serializer is pre-programmed with an high reverse channel noise threshold,

/an/a/

> +      the deserializer channel amplitude shall initially be increased to 170mV
> +      to allow the two to communicate reliably. Likewise, if the remote
> +      serializer probes without an increased reverse channel noise threshold,
> +      the deserializer initial reverse channel amplitude should be set to 100mV
> +      to be later increased to 170mV after serializers have increased their

/after/after the/

> +      reverse channel noise threshold.
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    # The property can be easily expanded to support more values if needed,
> +    # but that's what's supported today by the driver.

Stating "that's what's supported today" seems a bit redundant...

> +    oneOf:
> +      - const: 100
> +      - const: 170
> +
>    ports:
>      type: object
>      description: |
> @@ -155,6 +174,7 @@ required:
>    - compatible
>    - reg
>    - maxim,overlap-window
> +  - maxim,reverse-channel-amplitude
>    - ports
>    - i2c-mux
>  
> @@ -177,6 +197,7 @@ examples:
>          poc-supply = <&camera_poc_12v>;
>          enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
>          maxim,overlap-window = MAX9286_OVLP_WINDOW_DISABLED;
> +        maxim,reverse-channel-amplitude = <170>;
>  
>          ports {
>            #address-cells = <1>;
> 

