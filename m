Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3302D3933FF
	for <lists+linux-media@lfdr.de>; Thu, 27 May 2021 18:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235973AbhE0QcS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 May 2021 12:32:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236071AbhE0QcR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 May 2021 12:32:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D632C061574
        for <linux-media@vger.kernel.org>; Thu, 27 May 2021 09:30:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01F5D163F;
        Thu, 27 May 2021 18:30:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622133042;
        bh=aljgzAL/xCWZfKqhZf69TKaI/WOsPME/kFwFk88tSNQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VM5KjMxun9n0wYsnnMGYwCZWzIEHJhxYVTKSloWuUimO2AT7zwnVuOzA8QndHXANJ
         7/CWMUUzL2F+vcLf3a5WSYhsx3wlC9t3OiOst7f6U+a+NGcgK8medGyO/Gwcd4Sffk
         f3k/aW4Ufx9rypVnr056/UeGI/wBAvlS4SX4yZHM=
Date:   Thu, 27 May 2021 19:30:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v3 38/38] media: ti-vpe: cal: add multiplexed streams
 support
Message-ID: <YK/JLBWfEPXqUGqY@pendragon.ideasonboard.com>
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-39-tomi.valkeinen@ideasonboard.com>
 <20210527160622.c4tumqkld2rrwbva@ti.com>
 <60f6ef13-31ba-9d1d-7a36-b9f344142465@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <60f6ef13-31ba-9d1d-7a36-b9f344142465@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, May 27, 2021 at 07:10:42PM +0300, Tomi Valkeinen wrote:
> On 27/05/2021 19:06, Pratyush Yadav wrote:
> > On 24/05/21 02:09PM, Tomi Valkeinen wrote:
> >> Add routing and stream_config support to CAL driver.
> >>
> >> Add multiplexed streams support. CAL has 8 dma-engines and can capture 8
> >> separate streams at the same time.
> >>
> >> Add 8 video device nodes, each representing a single dma-engine, and set
> >> the number of source pads on camerarx to 8. Each video node can be
> >> connected to any of the source pads on either of the camerarx instances
> >> using media links. Camerarx internal routing is used to route the
> >> incoming CSI-2 streams to one of the 8 source pads.
> >>
> >> CAL doesn't support transcoding, so the driver currently allows changes
> >> only on the camerarx sink side, and then copies the sink pad config to
> >> the source pad. This becomes slighly more complex with 8 source pads and
> >> multiple streams on the sink pad. A helper,
> >> cal_camerarx_get_opposite_stream_format(), is added, which uses the
> >> routing table to get the format from the "opposite" side.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/platform/ti-vpe/cal-camerarx.c | 303 ++++++++++++++++---
> >>   drivers/media/platform/ti-vpe/cal-video.c    | 103 ++++++-
> >>   drivers/media/platform/ti-vpe/cal.c          |  34 ++-
> >>   drivers/media/platform/ti-vpe/cal.h          |  12 +-
> >>   4 files changed, 385 insertions(+), 67 deletions(-)
> >>
> > [...]
> >> @@ -1178,18 +1177,33 @@ static int cal_probe(struct platform_device *pdev)
> >>   	}
> >>   
> >>   	/* Create contexts. */
> >> -	for (i = 0; i < cal->data->num_csi2_phy; ++i) {
> >> -		if (!cal->phy[i]->source_node)
> >> -			continue;
> >> +	if (!cal_mc_api) {
> >> +		for (i = 0; i < cal->data->num_csi2_phy; ++i) {
> >> +			if (!cal->phy[i]->source_node)
> >> +				continue;
> >> +
> >> +			cal->ctx[i] = cal_ctx_create(cal, i);
> >> +			if (!cal->ctx[i]) {
> >> +				cal_err(cal, "Failed to create context %u\n", i);
> >> +				ret = -ENODEV;
> >> +				goto error_context;
> >> +			}
> >>   
> >> -		cal->ctx[i] = cal_ctx_create(cal, i);
> >> -		if (!cal->ctx[i]) {
> >> -			cal_err(cal, "Failed to create context %u\n", i);
> >> -			ret = -ENODEV;
> >> -			goto error_context;
> >> +			cal->ctx[i]->phy = cal->phy[i];
> >> +
> >> +			cal->num_contexts++;
> >>   		}
> >> +	} else {
> >> +		for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
> >> +			cal->ctx[i] = cal_ctx_create(cal, i);
> >> +			if (!cal->ctx[i]) {
> >> +				cal_err(cal, "Failed to create context %u\n", i);
> >> +				ret = -ENODEV;
> >> +				goto error_context;
> >> +			}
> >>   
> >> -		cal->num_contexts++;
> >> +			cal->num_contexts++;
> > 
> > In cal_async_notifier_complete() I see:
> > 
> >    for (i = 0; i < cal->num_contexts; i++)
> >      ret = cal_ctx_v4l2_register();
> > 
> > This means that if the CAL device has 8 DMA contexts it will create 8
> > /dev/videoX nodes, even if the hardware setup is only capable of 1
> > stream.
> > 
> > Would it make more sense to populate /dev/videoX nodes based on the
> > configured routing? So for example, if only one pad is being used to
> > output, only create one node corresponding to that pad. If there are 3
> > pads being populated then create 3 nodes and so on.
> 
> Routing is a runtime configuration, so it could mean creating or 
> removing video nodes every time the user changes the routing. I believe 
> video nodes are supposed to be more permanent than that.
> 
> If we knew that the HW setup can only ever have N routes, we could limit 
> the number of video nodes, but I don't think we have means to figure 
> that out.

And even if we did, I think that wouldn't help userspace. The media
graph is meant to model the hardware topology, it's best to minimize the
complexity on the kernel side and let userspace deal with routing
configuration.

-- 
Regards,

Laurent Pinchart
