Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE9D64B6A5F
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 12:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236959AbiBOLLS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 06:11:18 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232676AbiBOLLR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 06:11:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A728A107D18;
        Tue, 15 Feb 2022 03:11:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD5BF48A;
        Tue, 15 Feb 2022 12:11:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644923465;
        bh=ijoSdbnnsunVsVOH/d/nTlGGD//f3yIO0n1WuTIGAMY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IIQRLZus0b061E0qgF+z2ARgQ9TY+GORAvpaKcDEOFSlfGfe5QZ39Ue89Ffhbm9Tc
         pmZaS6l5CxJToI06DGVVQQo7IvDJZsEeY8RAC2aP1nLGsB+jzo/zaSxd8cJ5WyVUmy
         RWlD2wr5bz94qBi5xprOhFnTt0Uws+RoqgkvNKHA=
Date:   Tue, 15 Feb 2022 13:10:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [RFC PATCH 7/8] media: v4l2-mediabus: Drop legacy
 V4L2_MBUS_CSI2_CHANNEL_* flags
Message-ID: <YguKQhpBAe8CfjjZ@pendragon.ideasonboard.com>
References: <20220103162414.27723-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220103162414.27723-8-laurent.pinchart+renesas@ideasonboard.com>
 <20220215110141.se2gyvfb2xvez2vn@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220215110141.se2gyvfb2xvez2vn@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Feb 15, 2022 at 12:01:41PM +0100, Jacopo Mondi wrote:
> On Mon, Jan 03, 2022 at 06:24:13PM +0200, Laurent Pinchart wrote:
> > The V4L2_MBUS_CSI2_CHANNEL_* flags are a legacy API. Only
> > V4L2_MBUS_CSI2_CHANNEL_0 is used, set in a single driver, and never
> > read. Drop those flags. Virtual channel information should be conveyed
> > through frame descriptors instead.
> 
> I see one more user in the latest media master
> drivers/media/platform/atmel/microchip-csi2dc.c:        if (mbus_config.flags & V4L2_MBUS_CSI2_CHANNEL_0)

Sakari has sent
https://lore.kernel.org/linux-media/20220202153609.240387-1-sakari.ailus@linux.intel.com
to address this.

Sakari, will you take the remainder of this series in your tree ?

> With that fixed
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/media/i2c/adv7180.c   |  1 -
> >  include/media/v4l2-mediabus.h | 10 ----------
> >  2 files changed, 11 deletions(-)
> >
> > diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> > index 286f5017d9c3..3ff37a550810 100644
> > --- a/drivers/media/i2c/adv7180.c
> > +++ b/drivers/media/i2c/adv7180.c
> > @@ -786,7 +786,6 @@ static int adv7180_get_mbus_config(struct v4l2_subdev *sd,
> >  		cfg->type = V4L2_MBUS_CSI2_DPHY;
> >  		cfg->bus.mipi_csi2.num_data_lanes = 1;
> >  		cfg->bus.mipi_csi2.flags =
> > -				V4L2_MBUS_CSI2_CHANNEL_0 |
> >  				V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
> >  	} else {
> >  		/*
> > diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> > index 44195ceeccca..c6626a22b394 100644
> > --- a/include/media/v4l2-mediabus.h
> > +++ b/include/media/v4l2-mediabus.h
> > @@ -67,20 +67,10 @@
> >  #define V4L2_MBUS_DATA_ENABLE_LOW		BIT(15)
> >
> >  /* Serial flags */
> > -/* CSI-2 Virtual Channel identifiers. */
> > -#define V4L2_MBUS_CSI2_CHANNEL_0		BIT(4)
> > -#define V4L2_MBUS_CSI2_CHANNEL_1		BIT(5)
> > -#define V4L2_MBUS_CSI2_CHANNEL_2		BIT(6)
> > -#define V4L2_MBUS_CSI2_CHANNEL_3		BIT(7)
> >  /* Clock non-continuous mode support. */
> >  #define V4L2_MBUS_CSI2_CONTINUOUS_CLOCK		BIT(8)
> >  #define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(9)
> >
> > -#define V4L2_MBUS_CSI2_CHANNELS		(V4L2_MBUS_CSI2_CHANNEL_0 | \
> > -					 V4L2_MBUS_CSI2_CHANNEL_1 | \
> > -					 V4L2_MBUS_CSI2_CHANNEL_2 | \
> > -					 V4L2_MBUS_CSI2_CHANNEL_3)
> > -
> >  #define V4L2_MBUS_CSI2_MAX_DATA_LANES		8
> >
> >  /**

-- 
Regards,

Laurent Pinchart
