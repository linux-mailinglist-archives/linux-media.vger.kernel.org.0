Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA8D7A056F
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 15:20:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238760AbjINNUb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 09:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238623AbjINNUa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 09:20:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F00A1A5;
        Thu, 14 Sep 2023 06:20:26 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 28B8A12AE;
        Thu, 14 Sep 2023 15:18:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694697531;
        bh=P8Fv3m8a1ccWANsx+oyHLY8IHHlnvGwRC93xpQj+i9w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vd5vSVo6laW2yqhWLYoFUw2pR9IDCbyTnxTHpQWG9+oKf5HlG93fm3AxwYyzUn3+T
         Y/2a8cUk4u8/CgYi0juf/HMVld9JiFIjBb9ej/Akjm8DCptcuNp/SexuQyTX65TL4d
         Pqpwfz9GkKmitEJk38hr3Xs36ZgfNG1mY28KXRAU=
Date:   Thu, 14 Sep 2023 15:20:20 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Fabio Estevam <festevam@gmail.com>, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
        jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH] media: dt-bindings: ovti,ov772x: Make powerdown-gpios
 active-high
Message-ID: <hmic7q3hbndw3afwdktjaptcfinfjekh24zo5iryrtvtykjqmw@dydp7czzkv7z>
References: <20230913193932.1947918-1-festevam@gmail.com>
 <ZQLgauEc3VtRQUMm@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZQLgauEc3VtRQUMm@valkosipuli.retiisi.eu>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari, Fabio

On Thu, Sep 14, 2023 at 10:28:58AM +0000, Sakari Ailus wrote:
> Hi Fabio,
>
> On Wed, Sep 13, 2023 at 04:39:32PM -0300, Fabio Estevam wrote:
> > From: Fabio Estevam <festevam@denx.de>
> >
> > The powerdown-gpios description mentions:
> >
> > "Reference to the GPIO connected to the PWDN pin which is active high."

From datasheet:

        Power down mode selection:
        0: Normal mode
        1: Power down mode

> >
> > Improve the example by making powerdown-gpios active-high for consistency.
> >
> > Signed-off-by: Fabio Estevam <festevam@denx.de>
> > ---
> >  Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> > index 5d24edba8f99..5aec65b053af 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> > +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
> > @@ -114,7 +114,7 @@ examples:
> >              compatible = "ovti,ov7725";
> >              reg = <0x21>;
> >              reset-gpios = <&axi_gpio_0 0 GPIO_ACTIVE_LOW>;
> > -            powerdown-gpios = <&axi_gpio_0 1 GPIO_ACTIVE_LOW>;
> > +            powerdown-gpios = <&axi_gpio_0 1 GPIO_ACTIVE_HIGH>;
> >              clocks = <&xclk>;
> >
> >              port {
>
> Looking at the driver code, it seems the powerdown GPIO is set to state 1
> when the device is powered on and to 0 when it's powered down. This looks
> like a driver bug.
>


It is. As you can see I ported the driver from the old soc-camera
version and in 762c28121d7c ("media: i2c: ov772x: Remove soc_camera
dependencies") I defintely introduced this. I'll here play the card "I
was young in 2018".

This is also probably wrong

	priv->pwdn_gpio = gpiod_get_optional(&client->dev, "powerdown",
					     GPIOD_OUT_LOW);

As it sets the chip in power-up mode during probe() (this should be
safe to change, but there's no way I can test it unfortunately)

> But what happens if you fix something like this after five years in
> existence? Maybe just leave it as-is, and document it??? Then again,

As the rule "old dtbs are supposed to work with new versions of a
driver", "fixing" the driver would defintely break them.

I would add a comment in the .yaml file and in the driver.
As I introduced this, I can do that if Fabio doesn't.

> there's a single Renesas board that appears to have such a device, added
> two and half years ago.

yeah, that stuff is dead, but we can't tell how many users of this
driver are there in the wild..

>
> Also cc Jacopo.

Thanks, I'm listead as maintainer for this driver for odd-fixes.
Please use get_maintainer.pl

>
> --
> Regards,
>
> Sakari Ailus
