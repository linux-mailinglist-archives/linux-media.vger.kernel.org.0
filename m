Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA01F223547
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 09:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgGQHQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 03:16:51 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:56177 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgGQHQv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 03:16:51 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 16886200007;
        Fri, 17 Jul 2020 07:16:45 +0000 (UTC)
Date:   Fri, 17 Jul 2020 09:20:18 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 01/10] media: v4l2-subdev: Introduce
 [get|set]_mbus_config pad ops
Message-ID: <20200717072018.crgmvfrm44kgmvcb@uno.localdomain>
References: <20200716142713.110655-1-jacopo+renesas@jmondi.org>
 <20200716142713.110655-2-jacopo+renesas@jmondi.org>
 <4042930.ejJDZkT8p0@z50>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4042930.ejJDZkT8p0@z50>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Janusz,
  thanks for review

On Fri, Jul 17, 2020 at 12:15:27AM +0200, Janusz Krzysztofik wrote:
> Hi Jacopo,
>
> On Thursday, July 16, 2020 4:27:04 P.M. CEST Jacopo Mondi wrote:
> > Introduce two new pad operations to allow retrieving and configuring the
> > media bus parameters on a subdevice pad.
> >
> > The newly introduced operations aims to replace the s/g_mbus_config video
> > operations, which have been on their way for deprecation since a long
> > time.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > ---
> >  include/media/v4l2-subdev.h | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index f7fe78a6f65a..d8b9d5735307 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -670,6 +670,29 @@ struct v4l2_subdev_pad_config {
> >   *
> >   * @set_frame_desc: set the low level media bus frame parameters, @fd array
> >   *                  may be adjusted by the subdev driver to device capabilities.
> > + *
> > + * @get_mbus_config: get the media bus configuration of a remote sub-device.
> > + *		     The media bus configuration is usually retrieved from the
> > + *		     firmware interface at sub-device probe time, immediately
> > + *		     applied to the hardware and eventually adjusted by the
> > + *		     driver. Remote sub-devices (usually video receivers) shall
> > + *		     use this operation to query the transmitting end bus
> > + *		     configuration in order to adjust their own one accordingly.
> > + *		     Callers should make sure they get the most up-to-date as
> > + *		     possible configuration from the remote end, likely calling
> > + *		     this operation as close as possible to stream on time. The
> > + *		     operation shall fail if the pad index it has been called on
> > + *		     is not valid.
> > + *
> > + * @set_mbus_config: set the media bus configuration of a remote sub-device.
> > + *		     This operations is intended to allow, in combination with
> > + *		     the get_mbus_config operation, the negotiation of media bus
> > + *		     configuration parameters between media sub-devices. The
> > + *		     operation shall not fail if the requested configuration is
> > + *		     not supported, but the driver shall update the content of
> > + *		     the %config argument to reflect what has been actually
> > + *		     applied to the hardware. The operation shall fail if the
> > + *		     pad index it has been called on is not valid.

First of all, Hans sent a pull request for this series yesterday. Are
you ok with that and with sending patches on top, or do you think the
inclusion of the series should be post-poned ? (you can imagine what
my preference is :)

>
> Could this description also clarify what results are expected in case of
> hardware errors?  The ov6650 implementation you propose may suggest such
> errors may be expected to be ignored silently as long as current configuration
> can be successfully obtained from hardware and passed back to the caller.

I guess "it depends"(tm)
I know this doesn't sound like a good answer :)

A failure in applying or reading register likely means the driver is
trying to access the hardware while it is in low power state. In this
case I would consider this a driver bug, as it should try to be smart
and cache settings and apply them at the proper time and return the
current configuration, which should be cached as well.

Of course things could go wrong for several reasons, and in the case
if any unexpected error occurs I think an error is expected to be
reported. Please note that this v7 of ov6650 does that by returning
the return value of ov6650_get_mbus_config() at the end of
ov6650_set_mbus_config.

I guess this is pretty regular behaviour, although I missed it in the
previous version, so it might be worth adding an additional line to
the documentation.

>
> Moreover, since validity of the pad argument is expected to be verified, I
> think this should be handled by the media infrastructure layer with the
> drivers/media/v4l2-core/v4l2-subdev.c:check_pad() helper called from a
> .set_mbus_config() wrapper added to v4l2_subdev_call_pad_wrappers, freeing
> drivers from reimplementing it.
>

Good point, and indeed my bad as I thought v4l2_subdev_call() would
already do that by default, but looking at the actual implementation a
wrapper might be a good idea indeed.

Patches on top ?

Thanks
  j

> Thanks,
> Janusz
>
> >   */
> >  struct v4l2_subdev_pad_ops {
> >  	int (*init_cfg)(struct v4l2_subdev *sd,
> > @@ -710,6 +733,10 @@ struct v4l2_subdev_pad_ops {
> >  			      struct v4l2_mbus_frame_desc *fd);
> >  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
> >  			      struct v4l2_mbus_frame_desc *fd);
> > +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > +			       struct v4l2_mbus_config *config);
> > +	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> > +			       struct v4l2_mbus_config *config);
> >  };
> >
> >  /**
> >
>
>
>
>
