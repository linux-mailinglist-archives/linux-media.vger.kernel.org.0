Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC4C418984C
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 10:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbgCRJpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 05:45:19 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41890 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbgCRJpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 05:45:19 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2690F9;
        Wed, 18 Mar 2020 10:45:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584524717;
        bh=SjB4WrG5Cvh4/ecX+bx1L6N3BtX1CRYvdWcFVhHF3bI=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=H43ZxQtzeyCjt6+MdCSr5eJORngQAfregC7eYZ6Bmu3AXRwOYBNHtknX3MS7R3lqD
         bSarVIRocQDy3GhbHUHINZ4TBXpng/rf38L3J6XBNalbeWhWf0GiynYi5Mb9nFQztJ
         CdTselcWhGKy9PcUTVtxyocYxCPtQ4RSVrc34MTw=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 2/5] dt-bindings: media: max9286: Add overlap window
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund@ragnatech.se, laurent.pinchart@ideasonboard.com
Cc:     hyunk@xilinx.com, manivannan.sadhasivam@linaro.org,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
References: <20200316202757.529740-1-jacopo+renesas@jmondi.org>
 <20200316202757.529740-3-jacopo+renesas@jmondi.org>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <c029c8b3-928b-24d0-777e-add1136bf051@ideasonboard.com>
Date:   Wed, 18 Mar 2020 09:45:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200316202757.529740-3-jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 16/03/2020 20:27, Jacopo Mondi wrote:
> The MAX9286 chip exposes a way to control the 'overlap window'
> parameter, most probably used in calculation of the frame
> synchronization interval.
> 
> When used in conjunction with some serializers, the overlap window has to
> be disabled in order to correctly achieve frame sync locking.
> 
> As the exact meaning of that control is not documented in the chip's
> manual, require all DTS users to specify the value of the window. When,
> and if, in future the meaning of control gets clarified and a default

/in future/in the future/
/of control/of the control/

> behaviour (window enabled or disabled) can be established, a new boolean
> property could supersede this one while being sure that older DTB are

/DTB/DTBs/

> fully specified to avoid confusion.
> 
> Provide a few convenience macros for the window disabled and window
> default value.

Well it's not the best solution (putting hardcode values into the DTB)
but I agree, without documentation these are almost 'magic values for
the hardware' which is unfortunate.

I do fear this may be the wrong place still though.

This is dependent upon the 'serializer' connected, so is it a property
of the serializer that the max9286 should query at probe time to see
what it has connected?

But that's just back to the whole topic of bus-parameter negotiations
between the serializer and deserializer ...


But with this solution, any dtb segment or overlay for the serializer
needs to modify the max9286 depending on it's requirements ... that
feels a bit odd. Possible, I think, but odd.

Do we have any precedence in existing DT to reference on this topic?




> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../devicetree/bindings/media/i2c/maxim,max9286.yaml  | 11 +++++++++++
>  MAINTAINERS                                           |  1 +
>  include/dt-bindings/media/maxim-gmsl.h                |  9 +++++++++
>  3 files changed, 21 insertions(+)
>  create mode 100644 include/dt-bindings/media/maxim-gmsl.h
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> index f9d3e5712c59..ee8e0418b3f0 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> @@ -46,6 +46,14 @@ properties:
>      description: GPIO connected to the \#PWDN pin with inverted polarity
>      maxItems: 1
>  
> +  # Until the overlap window control gets not clarified, require dts
> +  # to set its value explicitly,
> +  maxim,overlap-window:
> +    description: Overlap window duration, in pixel clock cycles.
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
>    ports:
>      type: object
>      description: |
> @@ -146,6 +154,7 @@ properties:
>  required:
>    - compatible
>    - reg
> +  - maxim,overlap-window
>    - ports
>    - i2c-mux
>  
> @@ -154,6 +163,7 @@ additionalProperties: false
>  examples:
>    - |
>      #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/maxim-gmsl.h>
>  
>      i2c@e66d8000 {
>        #address-cells = <1>;
> @@ -166,6 +176,7 @@ examples:
>          reg = <0x2c>;
>          poc-supply = <&camera_poc_12v>;
>          enable-gpios = <&gpio 13 GPIO_ACTIVE_HIGH>;
> +        maxim,overlap-window = MAX9286_OVLP_WINDOW_DISABLED;
>  
>          ports {
>            #address-cells = <1>;
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 21a9ff4fe684..3d2455085c80 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10190,6 +10190,7 @@ M:	Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/i2c/maxim,max9286.yaml
> +F:	include/dt-bindings/media/maxim-gmsl.h
>  F:	drivers/media/i2c/max9286.c
>  
>  MAX9860 MONO AUDIO VOICE CODEC DRIVER
> diff --git a/include/dt-bindings/media/maxim-gmsl.h b/include/dt-bindings/media/maxim-gmsl.h
> new file mode 100644
> index 000000000000..47945ffc3a4d
> --- /dev/null
> +++ b/include/dt-bindings/media/maxim-gmsl.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _DT_BINDINGS_MEDIA_MAXIM_GMSL_H
> +#define _DT_BINDINGS_MEDIA_MAXIM_GMSL_H
> +
> +/* MAX9286 default overlap values. */
> +#define MAX9286_OVLP_WINDOW_DISABLED	<0>
> +#define MAX9286_OVLP_WINDOW_DEFAULT	<0x1680>
> +
> +#endif /* _DT_BINDINGS_MEDIA_MAXIM_GMSL_H */
> 

