Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 132484B6A6D
	for <lists+linux-media@lfdr.de>; Tue, 15 Feb 2022 12:12:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236965AbiBOLNA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Feb 2022 06:13:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236953AbiBOLNA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Feb 2022 06:13:00 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6919F108181;
        Tue, 15 Feb 2022 03:12:50 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1C86315;
        Tue, 15 Feb 2022 12:12:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1644923569;
        bh=yOgdoGlnwlBGyRl/P4T34fsCU68/4xWghey7pRjj8ok=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dXIhIFFtVSiaNUyUjjCofKq1KMdcbyHOmrht2HIKfmJdsIqnH/hOajLu21RBzRo3a
         F2zQ5PitqQvcuZSnxiYv0ufx4vOzdAsPIk1j8Pjd16mtWKHo/HwM9/2ItvK5+z9kxv
         Vzzi1S0skHfOPCKFKS8augL5vkzUq0UodSXZs3cM=
Date:   Tue, 15 Feb 2022 13:12:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Mats Randgaard <matrandg@cisco.com>
Subject: Re: [PATCH v1.1 8/8] media: v4l2-mediabus: Drop
 V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag
Message-ID: <YguKqgDHmrLSQ6sc@pendragon.ideasonboard.com>
References: <YdXrX9VLOm3W3YBl@valkosipuli.retiisi.eu>
 <20220105201558.31325-1-laurent.pinchart+renesas@ideasonboard.com>
 <20220215110420.btxlxlwk4e3phpg7@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220215110420.btxlxlwk4e3phpg7@uno.localdomain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Tue, Feb 15, 2022 at 12:04:20PM +0100, Jacopo Mondi wrote:
> On Wed, Jan 05, 2022 at 10:15:58PM +0200, Laurent Pinchart wrote:
> > MIPI CSI-2 continuous and non-continuous clock modes are mutually
> > exclusive. Drop the V4L2_MBUS_CSI2_CONTINUOUS_CLOCK flag and use
> > V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK only.
> 
> As continuous clock is the default configuration for CSI-2, wouldn't
> it be easier to add a boolean clock_non_cont (or similar) to
> v4l2_mbus_config_mipi_csi2 ?

That would be functionally equivalent, but flags will take less memory
compared to multiple booleans. I don't mind much though, and another
option would be to use a bitfield.

> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > Changes since v1:
> >
> > - Check all CSI2 flags in v4l2_fwnode_endpoint_parse_csi2_bus()
> > ---
> >  drivers/media/i2c/adv7180.c           | 3 +--
> >  drivers/media/i2c/tc358743.c          | 6 +++---
> >  drivers/media/v4l2-core/v4l2-fwnode.c | 6 ++----
> >  include/media/v4l2-mediabus.h         | 3 +--
> >  4 files changed, 7 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
> > index 3ff37a550810..4f5db195e66d 100644
> > --- a/drivers/media/i2c/adv7180.c
> > +++ b/drivers/media/i2c/adv7180.c
> > @@ -785,8 +785,7 @@ static int adv7180_get_mbus_config(struct v4l2_subdev *sd,
> >  	if (state->chip_info->flags & ADV7180_FLAG_MIPI_CSI2) {
> >  		cfg->type = V4L2_MBUS_CSI2_DPHY;
> >  		cfg->bus.mipi_csi2.num_data_lanes = 1;
> > -		cfg->bus.mipi_csi2.flags =
> > -				V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
> > +		cfg->bus.mipi_csi2.flags = 0;
> >  	} else {
> >  		/*
> >  		 * The ADV7180 sensor supports BT.601/656 output modes.
> > diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> > index dfbc42675143..e18b8947ad7e 100644
> > --- a/drivers/media/i2c/tc358743.c
> > +++ b/drivers/media/i2c/tc358743.c
> > @@ -717,7 +717,7 @@ static void tc358743_set_csi(struct v4l2_subdev *sd)
> >  			((lanes > 3) ? MASK_D3M_HSTXVREGEN : 0x0));
> >
> >  	i2c_wr32(sd, TXOPTIONCNTRL, (state->bus.flags &
> > -		 V4L2_MBUS_CSI2_CONTINUOUS_CLOCK) ? MASK_CONTCLKMODE : 0);
> > +		 V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK) ? 0 : MASK_CONTCLKMODE);
> >  	i2c_wr32(sd, STARTCNTRL, MASK_START);
> >  	i2c_wr32(sd, CSI_START, MASK_STRT);
> >
> > @@ -1613,7 +1613,7 @@ static int tc358743_get_mbus_config(struct v4l2_subdev *sd,
> >  	cfg->type = V4L2_MBUS_CSI2_DPHY;
> >
> >  	/* Support for non-continuous CSI-2 clock is missing in the driver */
> > -	cfg->bus.mipi_csi2.flags = V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
> > +	cfg->bus.mipi_csi2.flags = 0;
> >  	cfg->bus.mipi_csi2.num_data_lanes = state->csi_lanes_in_use;
> >
> >  	return 0;
> > @@ -2039,7 +2039,7 @@ static int tc358743_probe(struct i2c_client *client)
> >  	/* platform data */
> >  	if (pdata) {
> >  		state->pdata = *pdata;
> > -		state->bus.flags = V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
> > +		state->bus.flags = 0;
> >  	} else {
> >  		err = tc358743_probe_of(state);
> >  		if (err == -ENODEV)
> > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > index 9ff3ebb230e7..71dcc9a96535 100644
> > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > @@ -207,13 +207,11 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
> >  	if (fwnode_property_present(fwnode, "clock-noncontinuous")) {
> >  		flags |= V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
> >  		pr_debug("non-continuous clock\n");
> > -	} else {
> > -		flags |= V4L2_MBUS_CSI2_CONTINUOUS_CLOCK;
> >  	}
> >
> >  	if (bus_type == V4L2_MBUS_CSI2_DPHY ||
> > -	    bus_type == V4L2_MBUS_CSI2_CPHY || lanes_used ||
> > -	    have_clk_lane || (flags & ~V4L2_MBUS_CSI2_CONTINUOUS_CLOCK)) {
> > +	    bus_type == V4L2_MBUS_CSI2_CPHY ||
> > +	    lanes_used || have_clk_lane || flags) {
> >  		/* Only D-PHY has a clock lane. */
> >  		unsigned int dfl_data_lane_index =
> >  			bus_type == V4L2_MBUS_CSI2_DPHY;
> > diff --git a/include/media/v4l2-mediabus.h b/include/media/v4l2-mediabus.h
> > index c6626a22b394..e0db3bcff9ed 100644
> > --- a/include/media/v4l2-mediabus.h
> > +++ b/include/media/v4l2-mediabus.h
> > @@ -68,8 +68,7 @@
> >
> >  /* Serial flags */
> >  /* Clock non-continuous mode support. */
> > -#define V4L2_MBUS_CSI2_CONTINUOUS_CLOCK		BIT(8)
> > -#define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(9)
> > +#define V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK	BIT(0)
> >
> >  #define V4L2_MBUS_CSI2_MAX_DATA_LANES		8
> >
> >
> > base-commit: 68b9bcc8a534cd11fe55f8bc82f948aae7d81b3c
> > prerequisite-patch-id: cc085f7de462ead19772e3f64e1b1d13bb92d5b7
> > prerequisite-patch-id: d6943d1780603964a753d571e26bad98b4954a8a
> > prerequisite-patch-id: c63eaa2a61aeea6d4be238644f1324f0170d981c
> > prerequisite-patch-id: 797385e385b3f71f0bafe7eb8e712d52628c23d7
> > prerequisite-patch-id: 2f7fe0901f79ac1d445e443b5d3ee7ab9ae41525
> > prerequisite-patch-id: 70ddd068308b5758872349ec6e0f03e8c9427dc0
> > prerequisite-patch-id: 987cc8f39cb63badf2d6ceba946deffafba9a249

-- 
Regards,

Laurent Pinchart
