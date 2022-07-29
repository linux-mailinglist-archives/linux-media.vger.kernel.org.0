Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 247C6584D4A
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 10:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235193AbiG2ISX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 04:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbiG2ISW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 04:18:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C866282;
        Fri, 29 Jul 2022 01:18:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD56252F;
        Fri, 29 Jul 2022 10:18:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659082699;
        bh=anJq2rRoindAjrB7fb7SYiCoJmaJ1DulKd+fEWSBTKw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CtntfIsMY38uv+qprfkLV60wLGlUY8mviLKKQ5SZxbgjCo4MlWPDWZJsHEHaSGlzB
         TCUOS+gNsaydrSdq7qsZAYaGfts2KeRRQvZmHScw4cvGUM/940aT8NKZSOCRIM8wuS
         KhbzGt/7jT/rsbRICZcVTtOorGlSfeoI9muS6nmw=
Date:   Fri, 29 Jul 2022 11:18:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        "Paul J . Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [PATCH v4 3/7] media: i2c: ov9282: Add ov9281 compatible
Message-ID: <YuOXyZ6XTW2DjLvd@pendragon.ideasonboard.com>
References: <20220728130237.3396663-1-alexander.stein@ew.tq-group.com>
 <20220728130237.3396663-4-alexander.stein@ew.tq-group.com>
 <4e89e55b-9312-5525-974b-0a1dbe0b3dd1@linaro.org>
 <YuOHOEUk+znzump5@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YuOHOEUk+znzump5@valkosipuli.retiisi.eu>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

(Adding Dave and Naush to the CC list)

On Fri, Jul 29, 2022 at 10:07:36AM +0300, Sakari Ailus wrote:
> On Thu, Jul 28, 2022 at 03:13:11PM +0200, Krzysztof Kozlowski wrote:
> > On 28/07/2022 15:02, Alexander Stein wrote:
> > > According to product brief they are identical from software point of view.
> > > Differences are a different chief ray angle (CRA) and the package.
> > > 
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > Acked-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
> > > ---
> > >  drivers/media/i2c/ov9282.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > > index 8a252bf3b59f..c8d83a29f9bb 100644
> > > --- a/drivers/media/i2c/ov9282.c
> > > +++ b/drivers/media/i2c/ov9282.c
> > > @@ -1113,6 +1113,7 @@ static const struct dev_pm_ops ov9282_pm_ops = {
> > >  };
> > >  
> > >  static const struct of_device_id ov9282_of_match[] = {
> > > +	{ .compatible = "ovti,ov9281" },
> > 
> > The devices seem entirely compatible, so why you add a new compatible
> > and not re-use existing?
> > 
> > The difference in lens does not explain this.
> 
> It is typically necessary to know what kind of related hardware can be
> found in the system, beyond just the device's register interface. Apart
> from USB cameras, less integrated cameras require low-level software
> control in which specific device properties are important. In this case it
> could be the lens shading table, among other things.
> 
> 	https://www.ovt.com/sensor/ov9282/
> 
> Therefore I think adding a specific compatible string for this one is
> justified.
> 
> Also cc Laurent.

Interesting coincidence, we've talked about this topic (as part of a
broader discussion) no later than yesterday.

I agree with Sakari in that userspace needs to know the exact model of
the camera sensor. I don't see a good alternative to providing that
information through the platform firmware, so the device tree in this
case. The question is how it should be provided (the question of how it
should then be exposed to userspace is also important, but out of scope
in this discussion).

The compatible string is meant to indicate a device's compatibility with
"something", and that something is often considered from the point of
view of software support, and in particular to pick an appropriate
kernel driver and tune its behaviour for the device. Here, one could
argue that the exact model is also needed to ensure proper software
support, but in userspace this time, not in the kernel. I think using a
dedicated compatible string would be reasonable. An alternative would be
to use another DT property, which should then be standardized. I'm not
sure it's worth it.

Broadening the discussion, we also need to know detailed information
about the camera lens (I'm talking about the lens itself here, not the
lens controller IC that controls the motor that moves the focus lens).
The lens isn't described in the device tree with a dedicated device tree
node today, and I don't think it should (I'd have a hard time coming up
with a naming scheme for lenses that we could use in compatible strings,
and the lens-related data that a system requires can possibly vary based
not only on the lens itself but on the ISP that the camera sensor is
used with). Typical useful data are the lens movement range, the
hyperfocal distance, but also the lens shading tables. (Part of) that
information is sometimes stored in non-volatile memory in the camera
module (OTP in the camera sensor itself, or a separate EEPROM), but
that's not always the case. We have considered the possibility of
storing the information in the device tree, but I doubt that would be
accepted. We can store the information in userspace in configuration
files, but we will still need to device tree to provide lens
identification information to select the correct configuration file. I
don't know how that should be done.

-- 
Regards,

Laurent Pinchart
