Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D351BE0A9
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 16:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438204AbfIYO5Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 10:57:24 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51779 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438028AbfIYO5Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 10:57:24 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iD8jK-00054E-Jt; Wed, 25 Sep 2019 16:57:22 +0200
Message-ID: <1569423438.6554.5.camel@pengutronix.de>
Subject: Re: [PATCH v4 1/3] media: v4l2-subdev: add g_csi_active_lanes() op
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Mats Randgaard <matrandg@cisco.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        kernel@pengutronix.de, Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
Date:   Wed, 25 Sep 2019 16:57:18 +0200
In-Reply-To: <20190925134113.GA19093@pendragon.ideasonboard.com>
References: <20190924114955.13132-1-p.zabel@pengutronix.de>
         <20190924114955.13132-2-p.zabel@pengutronix.de>
         <20190925134113.GA19093@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Wed, 2019-09-25 at 16:41 +0300, Laurent Pinchart wrote:
> Hi Philipp,
> 
> (CC'ing Sakari, Jacopo, Kieran and Niklas)
> 
> Thank you for the patch.
> 
> On Tue, Sep 24, 2019 at 01:49:53PM +0200, Philipp Zabel wrote:
> > Add a subdevice video operation that allows to query the number
> > of data lanes a MIPI CSI-2 TX is actively transmitting on.
> > 
> > Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
> > New in v4.
> > ---
> >  include/media/v4l2-subdev.h | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > index 71f1f2f0da53..bb71eedc38f6 100644
> > --- a/include/media/v4l2-subdev.h
> > +++ b/include/media/v4l2-subdev.h
> > @@ -411,6 +411,8 @@ struct v4l2_mbus_frame_desc {
> >   * @s_rx_buffer: set a host allocated memory buffer for the subdev. The subdev
> >   *	can adjust @size to a lower value and must not write more data to the
> >   *	buffer starting at @data than the original value of @size.
> > + *
> > + * @g_csi_active_lanes: Get number of currently active MIPI CSI-2 data lanes.
> >   */
> >  struct v4l2_subdev_video_ops {
> >  	int (*s_routing)(struct v4l2_subdev *sd, u32 input, u32 output, u32 config);
> > @@ -441,6 +443,7 @@ struct v4l2_subdev_video_ops {
> >  			     const struct v4l2_mbus_config *cfg);
> >  	int (*s_rx_buffer)(struct v4l2_subdev *sd, void *buf,
> >  			   unsigned int *size);
> > +	int (*g_csi_active_lanes)(struct v4l2_subdev *sd, u32 *lanes);
> 
> This shouldn't be a video operation but a pad operation, as a subdev
> could have multiple CSI-2 pads.

Right this should be pad specific.

> Furthermore, you need to define the semantics of this operation more
> precisely. When can it be called,

The downstream subdevice connected to this pad is expected to call this
in its s_stream(enable=1) op, right before enabling the MIPI CSI-2 RX,
and then calling s_stream(enable=1) on the same upstream subdevice.

The returned value is a decision by the upstream subdevice driver based
on external factors such as available link-frequencies and mbus frame
format, so it can change whenever those are changed, but not by itself.

> when is the information valid ?

It is valid until the next time the pad's mbus frame format or link
frequency are changed. Since the caller

> Can the subdev change the number of lanes it supports at runtime ?

At least for MIPI CSI-2, no. Are there any buses that can dynamically
change bus width while active?

> If so, how are race conditions avoided ? All this needs to be documented.

I think no, so the only possible race conditions would be with
reconfiguration, which should already be avoided by requiring this to be
called from s_stream(),as the media pipeline is already started and
all configuration locked in place at this point.

> Finally, the number of lanes is far from being the only information
> about a physical bus that could be interesting for a remote subdev. I
> would much prefer a more generic operation to retrieve bus
> information/configuration, with a data structure that we will be able to
> extend later.

This is specifically about configuration chosen by the transmitter, not
physical bus properties, which can be specified in the device tree. The
chosen link frequency (if more than one is specified in DT) could be one
of those values.

regards
Philipp
