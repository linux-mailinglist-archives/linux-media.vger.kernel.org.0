Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18FCD4D7DB7
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 09:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236689AbiCNIn1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 04:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236675AbiCNInY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 04:43:24 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4F63F333
        for <linux-media@vger.kernel.org>; Mon, 14 Mar 2022 01:42:14 -0700 (PDT)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 95C5E240011;
        Mon, 14 Mar 2022 08:42:10 +0000 (UTC)
Date:   Mon, 14 Mar 2022 09:42:08 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        jeanmichel.hautbois@ideasonboard.com,
        paul.kocialkowski@bootlin.com, sakari.ailus@iki.fi,
        paul.elder@ideasonboard.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:OMNIVISION OV5670 SENSOR DRIVER" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/6] media: i2c: ov5670: Allow probing with OF
Message-ID: <20220314084208.ndamzsmki465uoor@uno.localdomain>
References: <20220310130829.96001-1-jacopo@jmondi.org>
 <20220310130829.96001-3-jacopo@jmondi.org>
 <Yi4AqIrOWBEY7DHU@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yi4AqIrOWBEY7DHU@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Sun, Mar 13, 2022 at 04:33:12PM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> Thank you for the patch.
>
> On Thu, Mar 10, 2022 at 02:08:25PM +0100, Jacopo Mondi wrote:
> > The ov5670 driver currently only supports probing using ACPI matching.
> > Add support for OF and add a missing header inclusion.
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  drivers/media/i2c/ov5670.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> > index 02f75c18e480..39786f3c9489 100644
> > --- a/drivers/media/i2c/ov5670.c
> > +++ b/drivers/media/i2c/ov5670.c
> > @@ -3,7 +3,9 @@
> >
> >  #include <linux/acpi.h>
> >  #include <linux/i2c.h>
> > +#include <linux/mod_devicetable.h>
> >  #include <linux/module.h>
> > +#include <linux/of.h>
> >  #include <linux/pm_runtime.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> > @@ -2583,6 +2585,12 @@ static const struct acpi_device_id ov5670_acpi_ids[] = {
> >  };
> >
> >  MODULE_DEVICE_TABLE(acpi, ov5670_acpi_ids);
> > +#elif defined CONFIG_OF
>
> This should be
>
> #ifdef CONFIG_OF
> ...
> #endif
>
> to support kernels compiled with both CONFIG_ACPI and CONFIG_OF.

Actually, as kernel test robot reported, I should declare the id
tables unconditionally, and let of_match_ptr() and ACPI_PTR() macros
expand to NULL if the corresponding symbol is not defined

https://patchwork.linuxtv.org/project/linux-media/patch/20220310130829.96001-3-jacopo@jmondi.org/#135841

>
> With this fixed,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks
   j

>
> > +static const struct of_device_id ov5670_of_ids[] = {
> > +	{ .compatible = "ovti,ov5670" },
> > +	{ /* sentinel */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, ov5670_of_ids);
> >  #endif
> >
> >  static struct i2c_driver ov5670_i2c_driver = {
> > @@ -2590,6 +2598,7 @@ static struct i2c_driver ov5670_i2c_driver = {
> >  		.name = "ov5670",
> >  		.pm = &ov5670_pm_ops,
> >  		.acpi_match_table = ACPI_PTR(ov5670_acpi_ids),
> > +		.of_match_table = of_match_ptr(ov5670_of_ids),
> >  	},
> >  	.probe_new = ov5670_probe,
> >  	.remove = ov5670_remove,
>
> --
> Regards,
>
> Laurent Pinchart
