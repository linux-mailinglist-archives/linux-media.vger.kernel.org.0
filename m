Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1D0E1A300F
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 09:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgDIHcJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 03:32:09 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:43067 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbgDIHcJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 03:32:09 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id CFF0D1BF210;
        Thu,  9 Apr 2020 07:32:04 +0000 (UTC)
Date:   Thu, 9 Apr 2020 09:35:07 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hyun Kwon <hyun.kwon@xilinx.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 2/4] media: v4l2-subdv: Introduce get_mbus_config pad op
Message-ID: <20200409073507.yes2rnvqhbj3k3ya@uno.localdomain>
References: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
 <20200313144035.401430-3-jacopo+renesas@jmondi.org>
 <20200401223037.GB583@smtp.xilinx.com>
 <20200407222255.GS1716317@oden.dyn.berto.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200407222255.GS1716317@oden.dyn.berto.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas, Huyn,
On Wed, Apr 08, 2020 at 12:22:55AM +0200, niklas.soderlund+renesas@ragnatech.se wrote:
> Hi Hyun and Jacopo,
>
> On 2020-04-01 15:30:38 -0700, Hyun Kwon wrote:
> > Hi Jacopo,
> >
> > Thanks for the patch.
> >
> > On Fri, 2020-03-13 at 07:40:33 -0700, Jacopo Mondi wrote:
> > > Introduce a new pad operation to allow retrieving the media bus
> > > configuration on a subdevice pad.
> > >
> > > The newly introduced operation reassembles the s/g_mbus_config video
> > > operation, which have been on their way to be deprecated since a long
> > > time.
> > >
> > > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > ---
> > >  include/media/v4l2-subdev.h | 67 +++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 67 insertions(+)
> > >
> > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > index 761aa83a3f3c..3a1afc00e094 100644
> > > --- a/include/media/v4l2-subdev.h
> > > +++ b/include/media/v4l2-subdev.h
> > > @@ -350,6 +350,70 @@ struct v4l2_mbus_frame_desc {
> > >  	unsigned short num_entries;
> > >  };
> > >
> > > +/**
> > > + * struct v4l2_mbus_parallel_config - parallel mbus configuration
> > > + * @hsync_active: hsync active state: true for high, false for low
> > > + * @vsync_active: vsync active state: true for high, false for low
> > > + * @pclk_rising: pixel clock active edge: true for rising, false for falling
> > > + * @data_active: data lines active state: true for high, false for low
> > > + */
> > > +struct v4l2_mbus_parallel_config {
> > > +	bool hsync_active : 1;
> > > +	bool vsync_active : 1;
> > > +	bool pclk_rising : 1;
> > > +	bool data_active : 1;
> > > +};
> > > +
> > > +/**
> > > + * struct v4l2_mbus_csi2_dphy_config - MIPI CSI-2 DPHY mbus configuration
> > > + * @data_lanes: number of data lanes in use
> > > + * @clock_noncontinuous: non continuous clock enable flag
> > > + */
> > > +struct v4l2_mbus_csi2_dphy_config {
> > > +	unsigned int data_lanes : 3;
> > > +	bool clock_noncontinuous : 1;
> > > +};
> > > +
> > > +/**
> > > + * struct v4l2_mbus_csi2_cphy_config - MIPI CSI-2 CPHY mbus configuration
> > > + *
> > > + * TODO
> > > + */
> > > +struct v4l2_mbus_csi2_cphy_config {
> > > +	/* TODO */
> > > +};
> > > +
> > > +/**
> > > + * struct v4l2_mbus_pad_config - media bus configuration
> > > + *
> > > + * Report the subdevice media bus information to inform the caller of the
> > > + * current bus configuration. The structure describes bus configuration
> > > + * parameters that might change in-between streaming sessions, in order to allow
> > > + * the caller to adjust its media bus configuration to match what is reported
> > > + * here.
> > > + *
> > > + * TODO: add '_pad_' to the name to distinguish this from the structure
> > > + * defined in v4l2_mediabus.h used for the same purpose by the g/s_mbus_config
> > > + * video operations. Reuse the there defined enum v4l2_mbus_type to define
> > > + * the bus type.
> > > + *
> > > + * @type: mbus type. See &enum v4l2_mbus_type
> > > + * @parallel: parallel bus configuration parameters.
> > > + *	      See &struct v4l2_mbus_parallel_config
> > > + * @csi2_dphy: MIPI CSI-2 DPHY configuration parameters
> > > + *	       See &struct v4l2_mbus_csi2_dphy_config
> > > + * @csi2_cphy: MIPI CSI-2 CPHY configuration parameters
> > > + *	       See &struct v4l2_mbus_csi2_cphy_config
> > > + */
> > > +struct v4l2_mbus_pad_config {
> > > +	enum v4l2_mbus_type type;
> > > +	union {
> > > +		struct v4l2_mbus_parallel_config parallel;
> > > +		struct v4l2_mbus_csi2_dphy_config csi2_dphy;
> > > +		struct v4l2_mbus_csi2_cphy_config csi2_cphy;
> > > +	};
> > > +};
> > > +
> > >  /**
> > >   * struct v4l2_subdev_video_ops - Callbacks used when v4l device was opened
> > >   *				  in video mode.
> > > @@ -670,6 +734,7 @@ struct v4l2_subdev_pad_config {
> > >   *
> > >   * @set_frame_desc: set the low level media bus frame parameters, @fd array
> > >   *                  may be adjusted by the subdev driver to device capabilities.
> > > + * @get_mbus_config: get the current mbus configuration
> > >   */
> > >  struct v4l2_subdev_pad_ops {
> > >  	int (*init_cfg)(struct v4l2_subdev *sd,
> > > @@ -710,6 +775,8 @@ struct v4l2_subdev_pad_ops {
> > >  			      struct v4l2_mbus_frame_desc *fd);
> > >  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
> > >  			      struct v4l2_mbus_frame_desc *fd);
> > > +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > > +			       struct v4l2_mbus_pad_config *config);
> >
> > Because this can be used in many different ways, there's more chance it can
> > be misused. That means, drivers call this in different locations, ex probe,
> > get format, start stream,,,, and on differnt pads, src or sink. So imagine
> > one set of drivers call on sink pad, and the other set call on source pad.
> > It works well only until those are mixed together.

I don't think we can right now establish all possible use cases, or
prevent people from shooting in their foot, moreover, the 'right'
usage really depends on the bus in use, and I can't tell where this is
will be used in the wild...

>
> That subdevice operations can be called at both probe and s_stream() is
> nothing new, I don't thin this is a new problem. But I agree maybe we
> could limit get_mbus_config() in the core to only be valid four source
> pads? Apart from this open question I think this patch looks good.
>

I'm a bit skeptical on limiting this to source pads as, again, this
really depends on the bus on which this operation is used. For my
limited knowledge, yes, the use case is always the receiver quering
the transmitter, but I don't feel like ruling out the opposite.

> >
> > So wouldn't it be better to put some restrictions? One is to document
> > recommendations. I think this better be called in stream on because
> > some bus config may change at runtime depending on other configuration.
> > So any bus config prior to stream-on may be outdated. The other is to
> > enforce in the code. Some, but maybe not all, can be handled in
> > v4l2_subdev_call_pad_wrappers, for example allowing this call only on
> > source pad.
> >

I hear your concern, but I think it really depends on the use cases
and I would have an hard time to provide recommendations that
address all use cases.

Is your concern due to some mis-uses example you can describe ?

Thanks
   j

> > Thanks,
> > -hyun
> >
> > >  };
> > >
> > >  /**
> > > --
> > > 2.25.1
> > >
>
> --
> Regards,
> Niklas Söderlund
