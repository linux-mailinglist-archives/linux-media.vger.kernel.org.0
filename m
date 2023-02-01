Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7909668721C
	for <lists+linux-media@lfdr.de>; Thu,  2 Feb 2023 00:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjBAX7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 18:59:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjBAX7V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 18:59:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9BEB48637;
        Wed,  1 Feb 2023 15:59:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7E199505;
        Thu,  2 Feb 2023 00:59:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675295958;
        bh=2aANsUcpwreSuAA4upm3Fg2ovLn+uEfNP6nBeAi6F2Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PSOPhkFaeJC9ce4v91r2RaTwn6M1IzWvVzf0KcJCshq3kGYtn2Qv0PKCWQJrNZAEt
         iLSBFGSIML5jOXRBRfaA5A8+MKKJOU12Kdr/YoYCONrXleeNkDt20e4RuWKmihpmqC
         1KEUUoPk7Ju+AflAI3tCs0Aa1Gbveuu5xsiaA4co=
Date:   Thu, 2 Feb 2023 01:59:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: media: i2c: Add mono version to
 IMX290 bindings
Message-ID: <Y9r81MozInclsonj@pendragon.ideasonboard.com>
References: <20230131190700.3476796-1-dave.stevenson@raspberrypi.com>
 <20230131190700.3476796-2-dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230131190700.3476796-2-dave.stevenson@raspberrypi.com>
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

On Tue, Jan 31, 2023 at 07:06:59PM +0000, Dave Stevenson wrote:
> The IMX290 module is available as either monochrome or colour and
> the variant is not detectable at runtime.
> 
> Add a new compatible string for the monochrome version.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../devicetree/bindings/media/i2c/sony,imx290.yaml        | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> index 21377daae026..29ca4052591f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
> @@ -12,15 +12,17 @@ maintainers:
>  
>  description: |-
>    The Sony IMX290 is a 1/2.8-Inch CMOS Solid-state image sensor with Square
> -  Pixel for Color Cameras. It is programmable through I2C and 4-wire
> -  interfaces. The sensor output is available via CMOS logic parallel SDR
> -  output, Low voltage LVDS DDR output and CSI-2 serial data output. The CSI-2
> +  Pixel, available in either mono or colour variants.
> +  It is programmable through I2C and 4-wire interfaces.
> +  The sensor output is available via CMOS logic parallel SDR output, Low
> +  voltage LVDS DDR output and CSI-2 serial data output. The CSI-2
>    bus is the default. No bindings have been defined for the other busses.

Nitpicking, could you reflow the text to the 80 columns limit, or add a
blank line between what you consider to be independent paragraphs ?

>  
>  properties:
>    compatible:
>      enum:
>        - sony,imx290
> +      - sony,imx290-mono

The monochrome version is called IMX290LLR, while the colour version is
the IMX290LQR. Could we use sony,imx290llr (or possibly sony,imx290ll)
as a compatible string instead of sony,imx290-mono ? We could also
deprecate sony,imx290 in favour of sony,imx290lqr (or sony,imx290lq) if
desired, and I can handle this on top.

>  
>    reg:

-- 
Regards,

Laurent Pinchart
