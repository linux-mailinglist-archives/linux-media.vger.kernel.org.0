Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F84768CBB4
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 02:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjBGBG6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Feb 2023 20:06:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjBGBG4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Feb 2023 20:06:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A706B34004;
        Mon,  6 Feb 2023 17:06:55 -0800 (PST)
Received: from pendragon.ideasonboard.com (unknown [109.136.43.56])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E81704AF;
        Tue,  7 Feb 2023 02:06:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675732014;
        bh=c2Qu8Wp1UbsjpkAchT6uwglhJB3kvNERynnbEKu2x4Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=prsTNnXW0gU+hi9x2SaMT59fsSDq7gVl9B+yZHtWgMZceEsJDNp+FUbMnqatKiR/c
         AzMQ/k4yAvqJyE6wD+vqAZX9WG++1Q32NTJ1LNYXJ6JGRosr7Z67Ii9ftLHq8E+A6i
         8tF/Cj7QKZtaShUkrS1HYIV/ZrvW6UhOToaEWThI=
Date:   Tue, 7 Feb 2023 03:06:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] media: dt-bindings: media: i2c: Add mono version
 to IMX290 bindings
Message-ID: <Y+GkLLQdLx0SgQMO@pendragon.ideasonboard.com>
References: <20230203191644.947643-1-dave.stevenson@raspberrypi.com>
 <20230203191644.947643-2-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230203191644.947643-2-dave.stevenson@raspberrypi.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dave,

Thank you for the patch.

On Fri, Feb 03, 2023 at 07:16:43PM +0000, Dave Stevenson wrote:
> The IMX290 module is available as either monochrome or colour and
> the variant is not detectable at runtime.
> 
> Add a new compatible string for the monochrome version.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/media/i2c/sony,imx290.yaml          | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> index 21377daae026..dacecb0cd9aa 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> @@ -12,15 +12,23 @@ maintainers:
>  
>  description: |-
>    The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with Square
> -  Pixel for Color Cameras. It is programmable through I2C and 4-wire
> -  interfaces. The sensor output is available via CMOS logic parallel SDR
> -  output, Low voltage LVDS DDR output and CSI-2 serial data output. The CSI-2
> -  bus is the default. No bindings have been defined for the other busses.
> +  Pixel, available in either mono or colour variants.
> +  It is programmable through I2C and 4-wire interfaces.
> +
> +  The sensor output is available via CMOS logic parallel SDR output, Low voltage
> +  LVDS DDR output and CSI-2 serial data output. The CSI-2 bus is the default.
> +  No bindings have been defined for the other busses.
> +
> +  imx290lqr is the full model identifier for the colour variant. "sony,imx290"
> +  is treated the same as this as it was the original compatible string.
> +  imx290llr is the mono version of the sensor.
>  
>  properties:
>    compatible:
>      enum:
>        - sony,imx290
> +      - sony,imx290lqr
> +      - sony,imx290llr

Let's mark the first one as deprecated:

properties:
  compatible:
    oneOf:
      - enum:
          - sony,imx290lqr # Colour
          - sony,imx290llr # Monochrome
      - const: sony,imx290
        deprecated: true

and update the example. I would then update the commit message to

  The IMX290 module is available as either monochrome or colour and
  the variant is not detectable at runtime.

  Add a new compatible string for the monochrome version, based on the
  full device name IMX290LLR. For consistency, add a new compatible
  string for the colour version based on the IMX290LQR full device name,
  and deprecate the current ambiguous compatible string.

With this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>    reg:
>      maxItems: 1

-- 
Regards,

Laurent Pinchart
