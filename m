Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1610478929
	for <lists+linux-media@lfdr.de>; Fri, 17 Dec 2021 11:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234972AbhLQKqW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Dec 2021 05:46:22 -0500
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:33779 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbhLQKqV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Dec 2021 05:46:21 -0500
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A66B620011;
        Fri, 17 Dec 2021 10:46:17 +0000 (UTC)
Date:   Fri, 17 Dec 2021 11:47:10 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: max9286: Add support for
 per-port supplies
Message-ID: <20211217104710.76ofsnwmrsfdm5fe@uno.localdomain>
References: <20211216220946.20771-1-laurent.pinchart+renesas@ideasonboard.com>
 <20211216220946.20771-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211216220946.20771-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi LAurent

On Fri, Dec 17, 2021 at 12:09:44AM +0200, Laurent Pinchart wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Power supplies for the ports can be controlled per port depending on the
> hardware design. Support per-port supplies in the DT bindings, mutually
> exclusive with the global supply.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../bindings/media/i2c/maxim,max9286.yaml     | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index 02f656e78700..33aa307e8ee5 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -39,7 +39,7 @@ properties:
>      maxItems: 1
>
>    poc-supply:
> -    description: Regulator providing Power over Coax to the cameras
> +    description: Regulator providing Power over Coax to all the ports
>

Can anything but a camera be connected to a port ?

>    enable-gpios:
>      description: GPIO connected to the \#PWDN pin with inverted polarity
> @@ -160,6 +160,10 @@ properties:
>
>              additionalProperties: false
>
> +patternProperties:
> +  "^port[0-3]-poc-supply$":
> +    description: Regulator providing Power over Coax for a particular port
> +
>  required:
>    - compatible
>    - reg
> @@ -167,6 +171,25 @@ required:
>    - i2c-mux
>    - gpio-controller
>
> +allOf:
> +  - if:
> +      required:
> +        - poc-supply
> +    then:
> +      allOf:
> +        - not:
> +            required:
> +              - port0-poc-supply
> +        - not:
> +            required:
> +              - port1-poc-supply
> +        - not:
> +            required:
> +              - port2-poc-supply
> +        - not:
> +            required:
> +              - port3-poc-supply

Isn't this simply expressed as

if:
  required:
    - poc-supply
then:
  properties:
    port0-poc-supply: false
    port1-poc-supply: false
    port2-poc-supply: false
    port3-poc-supply: false

I tried tweaking the DTS file example with the above applied as

        poc-supply = <&camera_poc_12v>;
        port0-poc-supply = <&camera0_poc>;

And validation fails as expected
.../maxim,max9286.example.dt.yaml: gmsl-deserializer@2c: port0-poc-supply: False schema does not allow [[4294967295]]

Also, could you make sure this does not conflict with the introduction
of gpio-poc in "dt-bindings: media: max9286: Define 'maxim,gpio-poc'".

Thanks
   j


> +
>  additionalProperties: false
>
>  examples:
> --
> Regards,
>
> Laurent Pinchart
>
