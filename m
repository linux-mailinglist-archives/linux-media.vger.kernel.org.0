Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3694822449C
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 21:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgGQTvJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 15:51:09 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35028 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728202AbgGQTvJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 15:51:09 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF69971D;
        Fri, 17 Jul 2020 21:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595015466;
        bh=oZltVqbFT77MxEwYl4ZqGkdG266h0lg52MSzsPVW8js=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xkw4ze+kgu0oAVhdIkkSLA/vN5nGtHgsQcJTj3tgHhTLfnquyjuvR/0+28fx5w6cd
         T/KKI+hp0Le3RFyrw5zweQDdt8bYVuh3dspT5C6B1XaNJZP/v5Co9U2gwV3rhz7Pnf
         jTmYFTrLqpv5JzUvf52B2Bb1PX85nIlZNm2aoGP0=
Date:   Fri, 17 Jul 2020 22:50:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        slongerbeam@gmail.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 06/13] dt-bindings: media: ov5640: Require ep properties
Message-ID: <20200717195058.GH5961@pendragon.ideasonboard.com>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-7-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-7-jacopo+renesas@jmondi.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Fri, Jul 17, 2020 at 03:28:52PM +0200, Jacopo Mondi wrote:
> Now that the bus-type property has been made mandatory for
> the ov5640 bindings, use the property value to mark endpoint
> properties as required depending on the data interface in use.

Ah, please disregard my comment on 05/13 that asked for this :-)

> Mark as 'required' all the properties that were defined as required
> in the original bindings in textual form. Adjust the example to
> comply with validation requirement but do not update the existing
> users as most of the required properties will be demoted in the
> next patches.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/ov5640.yaml | 41 +++++++++++++++++--
>  1 file changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> index 16e6c2dc629a..8fd54575a1db 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> @@ -110,9 +110,40 @@ properties:
>            pclk-sample:
>              enum: [0, 1]
>  
> -        required:
> -          - remote-endpoint
> -          - bus-type
> +        allOf:
> +          - if:
> +              properties:
> +                bus-type:
> +                  const: 4
> +            then:
> +                properties:

I think there's one indentation level too much here.

This should really be moved to video-interfaces.yaml, I'll let you
decide if you want to bite the bullet now or if it should be done on
top.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +                  bus-width: false
> +                  data-shift: false
> +                  hsync-active: false
> +                  vsync-active: false
> +                  pclk-sample: false
> +                required:
> +                  - remote-endpoint
> +                  - bus-type
> +                  - clock-lanes
> +                  - data-lanes
> +
> +          - if:
> +              properties:
> +                bus-type:
> +                  const: 5
> +            then:
> +              properties:
> +                clock-lanes: false
> +                data-lanes: false
> +              required:
> +                - remote-endpoint
> +                - bus-type
> +                - bus-width
> +                - data-shift
> +                - hsync-active
> +                - vsync-active
> +                - pclk-sample
>  
>      additionalProperties: false
>  
> @@ -179,6 +210,10 @@ examples:
>                      remote-endpoint = <&parallel_from_ov5640>;
>                      bus-type = <5>;
>                      bus-width = <10>;
> +                    data-shift = <0>;
> +                    hsync-active = <1>;
> +                    vsync-active = <1>;
> +                    pclk-sample = <1>;
>                  };
>              };
>          };

-- 
Regards,

Laurent Pinchart
