Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE144D7DD5
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 09:50:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236643AbiCNIv5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 04:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiCNIvz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 04:51:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9481A803
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 01:50:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E119E332;
        Mon, 14 Mar 2022 09:50:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647247842;
        bh=M+N59pjkfZI1mQCJRYosu6vUIw6RWZ/zr0f6J53rQgw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bQAAd6vEr5NrzCK6ZIRFIOF+xHhMkHcpSR6tJjBpbDrVZXlbbJZ7hNpwW14795g3q
         3E3uORuMKUKRL8CHGe9+hr+Yor4HsD6hd0++QMXYYspmfZRO4Xvj16+3GnqcZn15oI
         HAOT82xhBVRtDwZIpcqIbpRJAkDb4UoBMfKuYO6I=
Date:   Mon, 14 Mar 2022 10:50:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, sakari.ailus@iki.fi,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/6] media: i2c: ov5670: Allow probing with OF
Message-ID: <Yi8B0MiUUNlfL5Ld@pendragon.ideasonboard.com>
References: <20220310130829.96001-1-jacopo@jmondi.org>
 <20220310130829.96001-3-jacopo@jmondi.org>
 <Yi4AqIrOWBEY7DHU@pendragon.ideasonboard.com>
 <20220314084208.ndamzsmki465uoor@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220314084208.ndamzsmki465uoor@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Mon, Mar 14, 2022 at 09:42:08AM +0100, Jacopo Mondi wrote:
> On Sun, Mar 13, 2022 at 04:33:12PM +0200, Laurent Pinchart wrote:
> > On Thu, Mar 10, 2022 at 02:08:25PM +0100, Jacopo Mondi wrote:
> > > The ov5670 driver currently only supports probing using ACPI matching.
> > > Add support for OF and add a missing header inclusion.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > ---
> > >  drivers/media/i2c/ov5670.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> > > index 02f75c18e480..39786f3c9489 100644
> > > --- a/drivers/media/i2c/ov5670.c
> > > +++ b/drivers/media/i2c/ov5670.c
> > > @@ -3,7 +3,9 @@
> > >
> > >  #include <linux/acpi.h>
> > >  #include <linux/i2c.h>
> > > +#include <linux/mod_devicetable.h>
> > >  #include <linux/module.h>
> > > +#include <linux/of.h>
> > >  #include <linux/pm_runtime.h>
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-device.h>
> > > @@ -2583,6 +2585,12 @@ static const struct acpi_device_id ov5670_acpi_ids[] = {
> > >  };
> > >
> > >  MODULE_DEVICE_TABLE(acpi, ov5670_acpi_ids);
> > > +#elif defined CONFIG_OF
> >
> > This should be
> >
> > #ifdef CONFIG_OF
> > ...
> > #endif
> >
> > to support kernels compiled with both CONFIG_ACPI and CONFIG_OF.
> 
> Actually, as kernel test robot reported, I should declare the id
> tables unconditionally, and let of_match_ptr() and ACPI_PTR() macros
> expand to NULL if the corresponding symbol is not defined

With a __maybe_unused that should work too. I don't mind either way.

> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20220310130829.96001-3-jacopo@jmondi.org/#135841
> 
> > With this fixed,
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks
> 
> > > +static const struct of_device_id ov5670_of_ids[] = {
> > > +	{ .compatible = "ovti,ov5670" },
> > > +	{ /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, ov5670_of_ids);
> > >  #endif
> > >
> > >  static struct i2c_driver ov5670_i2c_driver = {
> > > @@ -2590,6 +2598,7 @@ static struct i2c_driver ov5670_i2c_driver = {
> > >  		.name = "ov5670",
> > >  		.pm = &ov5670_pm_ops,
> > >  		.acpi_match_table = ACPI_PTR(ov5670_acpi_ids),
> > > +		.of_match_table = of_match_ptr(ov5670_of_ids),
> > >  	},
> > >  	.probe_new = ov5670_probe,
> > >  	.remove = ov5670_remove,

-- 
Regards,

Laurent Pinchart
