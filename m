Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D210BE0D0
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 17:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727333AbfIYPII (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 11:08:08 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51459 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfIYPII (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 11:08:08 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iD8ti-0006RX-Q7; Wed, 25 Sep 2019 17:08:06 +0200
Message-ID: <1569424085.6554.8.camel@pengutronix.de>
Subject: Re: [PATCH v4 1/3] media: v4l2-subdev: add g_csi_active_lanes() op
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Mats Randgaard <matrandg@cisco.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        kernel@pengutronix.de, Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Niklas =?ISO-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>
Date:   Wed, 25 Sep 2019 17:08:05 +0200
In-Reply-To: <20190925145125.yqeqmv7hnwlmojdl@uno.localdomain>
References: <20190924114955.13132-1-p.zabel@pengutronix.de>
         <20190924114955.13132-2-p.zabel@pengutronix.de>
         <20190925134113.GA19093@pendragon.ideasonboard.com>
         <20190925145125.yqeqmv7hnwlmojdl@uno.localdomain>
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

Hi Jacopo,

On Wed, 2019-09-25 at 16:51 +0200, Jacopo Mondi wrote:
> Hello,
>    sorry for having missed this

Thank you and Laurent for completing the list of interested parties, I
had completely forgotten about the frame descriptors.

> On Wed, Sep 25, 2019 at 04:41:13PM +0300, Laurent Pinchart wrote:
> > Hi Philipp,
> > 
> > (CC'ing Sakari, Jacopo, Kieran and Niklas)
> > 
> > Thank you for the patch.
> > 
> > On Tue, Sep 24, 2019 at 01:49:53PM +0200, Philipp Zabel wrote:
> > > Add a subdevice video operation that allows to query the number
> > > of data lanes a MIPI CSI-2 TX is actively transmitting on.
> > > 
> > > Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
> > > Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> > > ---
> > > New in v4.
> > > ---
> > >  include/media/v4l2-subdev.h | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> > > index 71f1f2f0da53..bb71eedc38f6 100644
> > > --- a/include/media/v4l2-subdev.h
> > > +++ b/include/media/v4l2-subdev.h
> > > @@ -411,6 +411,8 @@ struct v4l2_mbus_frame_desc {
> > >   * @s_rx_buffer: set a host allocated memory buffer for the subdev. The subdev
> > >   *	can adjust @size to a lower value and must not write more data to the
> > >   *	buffer starting at @data than the original value of @size.
> > > + *
> > > + * @g_csi_active_lanes: Get number of currently active MIPI CSI-2 data lanes.
> > >   */
> > >  struct v4l2_subdev_video_ops {
> > >  	int (*s_routing)(struct v4l2_subdev *sd, u32 input, u32 output, u32 config);
> > > @@ -441,6 +443,7 @@ struct v4l2_subdev_video_ops {
> > >  			     const struct v4l2_mbus_config *cfg);
> > >  	int (*s_rx_buffer)(struct v4l2_subdev *sd, void *buf,
> > >  			   unsigned int *size);
> > > +	int (*g_csi_active_lanes)(struct v4l2_subdev *sd, u32 *lanes);
> > 
> > This shouldn't be a video operation but a pad operation, as a subdev
> > could have multiple CSI-2 pads.
> > 
> > Furthermore, you need to define the semantics of this operation more
> > precisely. When can it be called, when is the information valid ? Can
> > the subdev change the number of lanes it supports at runtime ? If so,
> > how are race conditions avoided ? All this needs to be documented.
> > 
> > Finally, the number of lanes is far from being the only information
> > about a physical bus that could be interesting for a remote subdev. I
> > would much prefer a more generic operation to retrieve bus
> > information/configuration, with a data structure that we will be able to
> > extend later.
> > 
> 
> For the record we tried to get those information from the frame
> descriptor (the number of used data lanes and the clock
> continous/non-continous information to be precise)
> 
> This is the RFC series I sent
> https://patchwork.kernel.org/project/linux-media/list/?series=92501
> 
> Which depends on Sakari's patches:
> https://patchwork.kernel.org/patch/10875871/
> https://patchwork.kernel.org/patch/10875873/
> 
> The latest two were part of a much bigger series that tried to add
> support for multiplexed streams. Honestly, it now seems to be that
> part could be breakout without involving streams, and re-use that
> portion to negotiate the csi-2 bus configuration. I might be wrong
> though, and the two parts could not be separate easily (from a very
> quick look, after months, it does not seem so).
> 
> In the past I spoke against this solution as I would have preferred
> leaving frame_desc alone and introduce a bus configuration operation.
> I tried a few times and I ended up implementing g_mbus_format but on
> pads and not video. Right now with Sakari's and Laurent's ack I would
> say re-using frame_desc might actually work and get use a feature
> which is needed by many (cc also Dave, as he had a similar issue with
> TC358743 iirc)

That looks like it should work just as well. If there is agreement to
add the number of data lanes, (non-)continuous clock flag, and possibly
the chosen link frequency v4l2_mbus_frame_desc, I'll happily dig up
these patches and switch to .get_frame_desc().

regards
Philipp
