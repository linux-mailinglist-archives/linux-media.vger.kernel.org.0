Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25EC8269A0A
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 02:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgIOADR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 20:03:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725997AbgIOADQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 20:03:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728B3C06174A;
        Mon, 14 Sep 2020 17:03:15 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D6CC0275;
        Tue, 15 Sep 2020 02:03:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600128194;
        bh=5FZVQHFM7M/hSLktvktLwDFu+XOReaOvpfvIBcBD0qw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hFseKHifO1nAL3jjWmUG6AZov+d8cRSU266Fq6CsrbdZZvJKIzLjcx6oTdwKxdi9O
         A4mIBhQdHseWGZ57OXU2VzrfHxgQVpoAlxE6ESxuKINjrQPP9J5b4pICgrDynNrdit
         PXSGClNsOV0nPR9Gu7hJXmPn0WCH7jJwGnEat5C0=
Date:   Tue, 15 Sep 2020 03:02:46 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3] media: rcar-vin: Enable YDS bit depending on
 bus_width and data_shift
Message-ID: <20200915000246.GN15543@pendragon.ideasonboard.com>
References: <20200913181608.32077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200914234532.GI15543@pendragon.ideasonboard.com>
 <20200915000140.GA1698816@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200915000140.GA1698816@oden.dyn.berto.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Tue, Sep 15, 2020 at 02:01:40AM +0200, Niklas Söderlund wrote:
> On 2020-09-15 02:45:32 +0300, Laurent Pinchart wrote:
> > On Sun, Sep 13, 2020 at 07:16:08PM +0100, Lad Prabhakar wrote:
> > > Enable YDS bit if bus_width and data_shift is set to 8 in parallel mode
> > > for MEDIA_BUS_FMT_UYVY8_2X8 format.
> > > 
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > Changes for v3:
> > > * Dropped BIT macro
> > > * Introduced struct v4l2_fwnode_bus_parallel
> > > 
> > > Changes for v2:
> > > * Dropped DT binding documentation patch
> > > * Select the data pins depending on bus-width and data-shift
> > > 
> > > v1 -
> > > https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=323799
> > > ---
> > >  drivers/media/platform/rcar-vin/rcar-core.c |  9 ++++-----
> > >  drivers/media/platform/rcar-vin/rcar-dma.c  | 17 ++++++++++++++---
> > >  drivers/media/platform/rcar-vin/rcar-vin.h  |  5 +++--
> > >  3 files changed, 21 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> > > index 7440c8965d27..1149ab76cf5c 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-core.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> > > @@ -626,12 +626,11 @@ static int rvin_parallel_parse_v4l2(struct device *dev,
> > >  
> > >  	switch (vin->parallel->mbus_type) {
> > >  	case V4L2_MBUS_PARALLEL:
> > > -		vin_dbg(vin, "Found PARALLEL media bus\n");
> > > -		vin->parallel->mbus_flags = vep->bus.parallel.flags;
> > > -		break;
> > >  	case V4L2_MBUS_BT656:
> > > -		vin_dbg(vin, "Found BT656 media bus\n");
> > > -		vin->parallel->mbus_flags = 0;
> > > +		vin_dbg(vin, "Found %s media bus\n",
> > > +			vin->parallel->mbus_type == V4L2_MBUS_PARALLEL ?
> > > +			"PARALLEL" : "BT656");
> > 
> > I'd write "parallel" and "BT.656".
> 
> I agree with this change.
> 
> > > +		vin->parallel->bus = vep->bus.parallel;
> > >  		break;
> > >  	default:
> > >  		vin_err(vin, "Unknown media bus type\n");
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> > > index a5dbb90c5210..d067439b0b0d 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> > > +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> > > @@ -125,6 +125,7 @@
> > >  #define VNDMR2_VPS		(1 << 30)
> > >  #define VNDMR2_HPS		(1 << 29)
> > >  #define VNDMR2_CES		(1 << 28)
> > > +#define VNDMR2_YDS		(1 << 22)
> > >  #define VNDMR2_FTEV		(1 << 17)
> > >  #define VNDMR2_VLV(n)		((n & 0xf) << 12)
> > >  
> > > @@ -698,16 +699,26 @@ static int rvin_setup(struct rvin_dev *vin)
> > >  
> > >  	if (!vin->is_csi) {
> > >  		/* Hsync Signal Polarity Select */
> > > -		if (!(vin->parallel->mbus_flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
> > > +		if (!(vin->parallel->bus.flags & V4L2_MBUS_HSYNC_ACTIVE_LOW))
> > >  			dmr2 |= VNDMR2_HPS;
> > >  
> > >  		/* Vsync Signal Polarity Select */
> > > -		if (!(vin->parallel->mbus_flags & V4L2_MBUS_VSYNC_ACTIVE_LOW))
> > > +		if (!(vin->parallel->bus.flags & V4L2_MBUS_VSYNC_ACTIVE_LOW))
> > >  			dmr2 |= VNDMR2_VPS;
> > >  
> > >  		/* Data Enable Polarity Select */
> > > -		if (vin->parallel->mbus_flags & V4L2_MBUS_DATA_ENABLE_LOW)
> > > +		if (vin->parallel->bus.flags & V4L2_MBUS_DATA_ENABLE_LOW)
> > >  			dmr2 |= VNDMR2_CES;
> > > +
> > > +		switch (vin->mbus_code) {
> > > +		case MEDIA_BUS_FMT_UYVY8_2X8:
> > > +			if (vin->parallel->bus.bus_width == 8 &&
> > 
> > You can possibly drop this check, as UYVY8_2X8 implies a bus_width equal
> > to 8. Apart from that,
> 
> I agree here as well, I think the check for UYVY8_2X8 may be dropped.
> 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > 
> > > +			    vin->parallel->bus.data_shift == 8)
> > > +				dmr2 |= VNDMR2_YDS;
> > > +			break;
> > > +		default:
> > > +			break;
> > > +		}
> > >  	}
> > >  
> > >  	/*
> > > diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> > > index c19d077ce1cb..8396e0e45478 100644
> > > --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> > > +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> > > @@ -19,6 +19,7 @@
> > >  #include <media/v4l2-ctrls.h>
> > >  #include <media/v4l2-dev.h>
> > >  #include <media/v4l2-device.h>
> > > +#include <media/v4l2-fwnode.h>
> > >  #include <media/videobuf2-v4l2.h>
> > >  
> > >  /* Number of HW buffers */
> > > @@ -92,7 +93,7 @@ struct rvin_video_format {
> > >   * @asd:	sub-device descriptor for async framework
> > >   * @subdev:	subdevice matched using async framework
> > >   * @mbus_type:	media bus type
> > > - * @mbus_flags:	media bus configuration flags
> > > + * @bus:	media bus parallel configuration
> > >   * @source_pad:	source pad of remote subdevice
> > >   * @sink_pad:	sink pad of remote subdevice
> > >   *
> > > @@ -102,7 +103,7 @@ struct rvin_parallel_entity {
> > >  	struct v4l2_subdev *subdev;
> > >  
> > >  	enum v4l2_mbus_type mbus_type;
> > > -	unsigned int mbus_flags;
> > > +	struct v4l2_fwnode_bus_parallel bus;
> 
> I think you could break this change (and the fallout) out to a separate 
> patch to make the functional change clearer.

You're often on the side of breaking patches in too small pieces :-) In
this case the patch is small, so I don't think breaking it in two is
required. It would be different if the changes were larger and more
intertwined.

> > >  
> > >  	unsigned int source_pad;
> > >  	unsigned int sink_pad;

-- 
Regards,

Laurent Pinchart
