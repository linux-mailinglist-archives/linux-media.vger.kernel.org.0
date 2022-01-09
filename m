Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D64C4888FB
	for <lists+linux-media@lfdr.de>; Sun,  9 Jan 2022 12:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233810AbiAILrM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Jan 2022 06:47:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbiAILrM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Jan 2022 06:47:12 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CD4C06173F;
        Sun,  9 Jan 2022 03:47:11 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1B06A100007;
        Sun,  9 Jan 2022 11:47:07 +0000 (UTC)
Date:   Sun, 9 Jan 2022 12:48:08 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Thomas Nizan <tnizan@witekio.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: media: i2c: max9286: Add support
 for per-port supplies
Message-ID: <20220109114808.rg2yjdnkmw4rl33x@uno.localdomain>
References: <20220101182806.19311-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220101182806.19311-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220101182806.19311-2-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sat, Jan 01, 2022 at 08:27:56PM +0200, Laurent Pinchart wrote:
> Power supplies for the ports can be controlled per port depending on the
> hardware design. Support per-port supplies in the DT bindings, mutually
> exclusive with the global supply.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
> Changes since v1:
>
> - Simplify mutual exclusion condition
> ---
>  .../bindings/media/i2c/maxim,max9286.yaml          | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index 02f656e78700..c20557b52e45 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -39,7 +39,7 @@ properties:
>      maxItems: 1
>
>    poc-supply:
> -    description: Regulator providing Power over Coax to the cameras
> +    description: Regulator providing Power over Coax to all the ports
>
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
> @@ -167,6 +171,14 @@ required:
>    - i2c-mux
>    - gpio-controller
>
> +allOf:
> +  - if:
> +      required:
> +        - poc-supply
> +    then:
> +      patternProperties:
> +        "^port[0-3]-poc-supply$": false
> +
>  additionalProperties: false
>
>  examples:
> --
> Regards,
>
> Laurent Pinchart
>
