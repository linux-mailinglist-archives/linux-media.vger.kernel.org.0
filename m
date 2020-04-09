Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 903CB1A3183
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 11:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgDIJFL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 05:05:11 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:45009 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgDIJFL (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 05:05:11 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 9EAF51BF21F;
        Thu,  9 Apr 2020 09:05:05 +0000 (UTC)
Date:   Thu, 9 Apr 2020 11:08:09 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        dave.stevenson@raspberrypi.com,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, hyun.kwon@xilinx.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] media: v4l2-subdv: Introduce get_mbus_config pad op
Message-ID: <20200409090809.kqa4b6zgzgqyqyn5@uno.localdomain>
References: <20200313144035.401430-1-jacopo+renesas@jmondi.org>
 <20200313144035.401430-3-jacopo+renesas@jmondi.org>
 <20200408084704.GE5206@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200408084704.GE5206@paasikivi.fi.intel.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On Wed, Apr 08, 2020 at 11:47:04AM +0300, Sakari Ailus wrote:
> Hi Jacopo,
>
> Thanks for the patchset.
>
> "subdev" in the subject.
>
> On Fri, Mar 13, 2020 at 03:40:33PM +0100, Jacopo Mondi wrote:
> > Introduce a new pad operation to allow retrieving the media bus
> > configuration on a subdevice pad.
> >
> > The newly introduced operation reassembles the s/g_mbus_config video
> > operation, which have been on their way to be deprecated since a long
> > time.
>
> How is this expected to work with existing drivers that just get their
> configuration from DT/ACPI? Update to use this API driver by driver as
> needed basis, or something else?

I think so.

The firmware specifies a somehow immutable value depending on the
hardware configuration (like the number of CSI-2 data lanes actually
wired between a receiver and a transmitter), this operation allow to
specify how many of them are actually in use depending on the
currently configured mode of operation, if ever required, otherwise
the firmware property provided value is used.

Dave's use case is slightly different, as clock continuous or
non-continuous would be specified in the receiver as a default, but
given the ability to switch between to transmitter at run-time, it has
to be refreshed by querying the current configuration using this op,
similar to the "two parallel sensors sharing the same data lines" I
tried to describe in the series' cover letter.

>
> Have you thought about setting the configuration as well?
>

Didn't get it, which configuration ?

> Where is this expected to be implemented? Transmitters only, and to be
> called by receiver drivers?

For the use cases at end at the moment, yes. Hyun had the same concern
in his reply to this series, but I don't feel like ruling out other
usages, as I can't tell at the moment on which busses this could prove
useful.

>
> I think ideally the g_mbus_config video op should go with this patchset,

Agreed

> and drivers using it converted. Given the likely small intersection of the
> two (drivers usign the old video op), this might be possible to do later on
> as well. But in that case g_mbus_config should be deprecated in
> documentation.

I'm fine deprecating the other operation in documentation, but porting
old drivers using the video ops should be done on top, otherwise it
will take some time and I could only compile test them.

Thanks
  j

>
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  include/media/v4l2-subdev.h | 67 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 761aa83a3f3c..3a1afc00e094 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -350,6 +350,70 @@ struct v4l2_mbus_frame_desc {
> >  	unsigned short num_entries;
> >  };
> >
> > +/**
> > + * struct v4l2_mbus_parallel_config - parallel mbus configuration
> > + * @hsync_active: hsync active state: true for high, false for low
> > + * @vsync_active: vsync active state: true for high, false for low
> > + * @pclk_rising: pixel clock active edge: true for rising, false for falling
> > + * @data_active: data lines active state: true for high, false for low
> > + */
> > +struct v4l2_mbus_parallel_config {
> > +	bool hsync_active : 1;
> > +	bool vsync_active : 1;
> > +	bool pclk_rising : 1;
> > +	bool data_active : 1;
>
> unsigned int, please.
>
> > +};
> > +
> > +/**
> > + * struct v4l2_mbus_csi2_dphy_config - MIPI CSI-2 DPHY mbus configuration
> > + * @data_lanes: number of data lanes in use
> > + * @clock_noncontinuous: non continuous clock enable flag
> > + */
> > +struct v4l2_mbus_csi2_dphy_config {
> > +	unsigned int data_lanes : 3;
> > +	bool clock_noncontinuous : 1;
>
> This should be unsigned int as well.
>
> > +};
> > +
> > +/**
> > + * struct v4l2_mbus_csi2_cphy_config - MIPI CSI-2 CPHY mbus configuration
> > + *
> > + * TODO
> > + */
> > +struct v4l2_mbus_csi2_cphy_config {
> > +	/* TODO */
> > +};
> > +
> > +/**
> > + * struct v4l2_mbus_pad_config - media bus configuration
> > + *
> > + * Report the subdevice media bus information to inform the caller of the
> > + * current bus configuration. The structure describes bus configuration
> > + * parameters that might change in-between streaming sessions, in order to allow
> > + * the caller to adjust its media bus configuration to match what is reported
> > + * here.
> > + *
> > + * TODO: add '_pad_' to the name to distinguish this from the structure
> > + * defined in v4l2_mediabus.h used for the same purpose by the g/s_mbus_config
> > + * video operations. Reuse the there defined enum v4l2_mbus_type to define
> > + * the bus type.
> > + *
> > + * @type: mbus type. See &enum v4l2_mbus_type
> > + * @parallel: parallel bus configuration parameters.
> > + *	      See &struct v4l2_mbus_parallel_config
> > + * @csi2_dphy: MIPI CSI-2 DPHY configuration parameters
> > + *	       See &struct v4l2_mbus_csi2_dphy_config
> > + * @csi2_cphy: MIPI CSI-2 CPHY configuration parameters
> > + *	       See &struct v4l2_mbus_csi2_cphy_config
> > + */
> > +struct v4l2_mbus_pad_config {
> > +	enum v4l2_mbus_type type;
> > +	union {
> > +		struct v4l2_mbus_parallel_config parallel;
> > +		struct v4l2_mbus_csi2_dphy_config csi2_dphy;
> > +		struct v4l2_mbus_csi2_cphy_config csi2_cphy;
> > +	};
> > +};
> > +
> >  /**
> >   * struct v4l2_subdev_video_ops - Callbacks used when v4l device was opened
> >   *				  in video mode.
> > @@ -670,6 +734,7 @@ struct v4l2_subdev_pad_config {
> >   *
> >   * @set_frame_desc: set the low level media bus frame parameters, @fd array
> >   *                  may be adjusted by the subdev driver to device capabilities.
> > + * @get_mbus_config: get the current mbus configuration
> >   */
> >  struct v4l2_subdev_pad_ops {
> >  	int (*init_cfg)(struct v4l2_subdev *sd,
> > @@ -710,6 +775,8 @@ struct v4l2_subdev_pad_ops {
> >  			      struct v4l2_mbus_frame_desc *fd);
> >  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
> >  			      struct v4l2_mbus_frame_desc *fd);
> > +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > +			       struct v4l2_mbus_pad_config *config);
> >  };
> >
> >  /**
>
> --
> Kind regards,
>
> Sakari Ailus
