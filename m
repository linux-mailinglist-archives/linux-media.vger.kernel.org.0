Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFD848785E
	for <lists+linux-media@lfdr.de>; Fri,  7 Jan 2022 14:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238893AbiAGNl6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Jan 2022 08:41:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232401AbiAGNl5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Jan 2022 08:41:57 -0500
X-Greylist: delayed 157049 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 07 Jan 2022 05:41:57 PST
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949A7C061574;
        Fri,  7 Jan 2022 05:41:57 -0800 (PST)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id B402C2030F;
        Fri,  7 Jan 2022 15:41:53 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1641562913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nd8z1qPXiFtNzk0Od8KNFXyHj6xfTvrY/39BcPblJlQ=;
        b=Jx3NpZNHbjIRz9iJa6FptoT6z2PjOW0LZ//VL65qxN0lE7F3vK+SSZyAM1hOTQrcQ3AhXU
        Sj1EMf0XNec1R49Pp5Hbur4Ecs/lYwwIXp4LMvlKe4AMD4g/ygvw5g4ggQqeUiBr8IFfWt
        kIelGVzzwvOPlCjeb2Pl7ajA7WB0yFs=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id D4A10634C90;
        Fri,  7 Jan 2022 15:41:51 +0200 (EET)
Date:   Fri, 7 Jan 2022 15:41:51 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [RFC PATCH 2/8] media: i2c: ov6650: Drop implementation of
 .set_mbus_config()
Message-ID: <YdhDH/HmJ44B3Rxa@valkosipuli.retiisi.eu>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220103162414.27723-3-laurent.pinchart+renesas@ideasonboard.com>
 <YdXdqJLKzDduVdex@valkosipuli.retiisi.eu>
 <YdX9ZaFJVSVrh41A@pendragon.ideasonboard.com>
 <CAGfqbt5ZyVAjCggqmQxp+2028Yaz+e=O6RqkfWH6LpDBm_MsSA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGfqbt5ZyVAjCggqmQxp+2028Yaz+e=O6RqkfWH6LpDBm_MsSA@mail.gmail.com>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1641562913; a=rsa-sha256; cv=none;
        b=Wf9R9GoDEhj80C058Ar0Q1WTKyMORzUNRSN36FfbzQPobU8cPoqwGFcbX4LFZSEti9S96D
        +49XV+G8RCeFkvOtaWK4plT0gLWs2Ot92LzS5Q0AG1P6R7eZVVf/vOmPhU9F7oCD7PESZp
        5TOhfN52+EqFNQkyilIJlPzQL/DpB48=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1641562913;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nd8z1qPXiFtNzk0Od8KNFXyHj6xfTvrY/39BcPblJlQ=;
        b=H3MRhSl2DEoK3I2tO9nDcoNpW6rl/uVSc63Xg4Wjto3xKbk9U9vMLwvJ3QnR0ha7KCGjtO
        DGPZI9NMvCPsA2PaPOgH37vu5esdrAj43ox7JT7ENbrhsVAamqsfaaCRBfJQ9wG2CObitH
        TK8aUh3Qz6xi7iDnzD2HKJt4Vqjv4F4=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,

On Wed, Jan 05, 2022 at 10:31:41PM +0100, Janusz Krzysztofik wrote:
> Hi Laurent,
> 
> On Wednesday, 5 January 2022 21:19:49 CET Laurent Pinchart wrote:
> > Hi Sakari,
> >
> > On Wed, Jan 05, 2022 at 08:04:24PM +0200, Sakari Ailus wrote:
> > > On Mon, Jan 03, 2022 at 06:24:08PM +0200, Laurent Pinchart wrote:
> > > > The subdev .set_mbus_config() operation is deprecated. No code in the
> > > > kernel calls it, so drop its implementation from the ov6650 driver.
> > > >
> > > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > ---
> > > >  drivers/media/i2c/ov6650.c | 37 -------------------------------------
> > > >  1 file changed, 37 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> > > > index f67412150b16..455a627e35a0 100644
> > > > --- a/drivers/media/i2c/ov6650.c
> > > > +++ b/drivers/media/i2c/ov6650.c
> > > > @@ -944,42 +944,6 @@ static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
> > > >   return 0;
> > > >  }
> > > >
> > > > -/* Alter bus settings on camera side */
> > > > -static int ov6650_set_mbus_config(struct v4l2_subdev *sd,
> > > > -                           unsigned int pad,
> > > > -                           struct v4l2_mbus_config *cfg)
> > > > -{
> > > > - struct i2c_client *client = v4l2_get_subdevdata(sd);
> > > > - int ret = 0;
> > > > -
> > > > - if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> > > > -         ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_PCLK_RISING, 0);
> > > > - else if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
> > > > -         ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);
> > >
> > > I think this configuration should come from the endpoint which the driver
> > > currently does not parse. In fact, there are no even DT bindings for the
> > > device.
> >
> > There's also no OF match table. While this isn't strictly required, it
> > may indicate that the sensor hasn't been tested much on DT-based
> > systems.
> >
> > I agree that the configuration should come from the device tree, but I
> > can't test that, so I'm tempted to let someone else implement it if the
> > driver is actually still in use (I can also write a patch if someone can
> > test it).
> 
> This driver was used with omap1_camera, removed from the tree a few years
> ago by Hans, despite my attempts to refresh it.  I tried to keep ov6650
> updated but I gave up due to lack of response to my submissions.  That also
> blocked my attempts to rework and reintroduce omap1_camera.

My apologies for this --- I indeed to see a set of unreviewed ov6650 patches
from you. Please do ping me if you expect an answer but do not get one.

> 
> I think I'm still able to update my local (v4l2, non-mc) version of
> omap1_camera to the extent required to test any changes to ov6650.
> However, the OMAP1 platform does not support DT, and will probably never
> do.  Then,  I think that it makes sense to spend my time on that only if
> you (media maintainers) are not going to depreciate non-DT support any
> soon.  Are you?

Commenting just this and not the discussion later in this thread --- it is
possible to support such sensor drivers without DT or ACPI nowadays,
through software nodes. See e.g. drivers/media/pci/intel/ipu3/cio2-bridge.c
.

-- 
Kind regards,

Sakari Ailus
