Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3F107145BD
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 09:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbjE2HuC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 03:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbjE2Ht7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 03:49:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D4CAC
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 00:49:58 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126255106133.24.openmobile.ne.jp [126.255.106.133])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F492836;
        Mon, 29 May 2023 09:49:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685346577;
        bh=xRx15xlpYjxotHlEx0nT/bdhErZ5OsfFNsmEow5tnks=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FQAwrHeCAXQlcmsChGRWS7CcF4i4jgacvWtfF230dHjuIQxXiwC6wY28/66IGoRc/
         tMXEZ5qj7XcCDzvetl53JEALQbTdFXn3PvJ55dWogajqWTLdF9RHjfPSbHC0nbsg4F
         g7uY7/KadXy6PvY4CLtbpNlVsXzMO9lDJvw8SwfI=
Date:   Mon, 29 May 2023 10:49:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
Subject: Re: [PATCH v4 2/8] media-ctl: Add support for routes and streams
Message-ID: <20230529074958.GF25984@pendragon.ideasonboard.com>
References: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
 <20230421124428.393261-3-tomi.valkeinen@ideasonboard.com>
 <20230424072932.GD4926@pendragon.ideasonboard.com>
 <3de25532-983d-0d13-1a3e-d818e34c01c0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3de25532-983d-0d13-1a3e-d818e34c01c0@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, May 29, 2023 at 10:34:16AM +0300, Tomi Valkeinen wrote:
> On 24/04/2023 10:29, Laurent Pinchart wrote:
> 
> >> +
> >>   	if (media_entity_type(entity) != MEDIA_ENT_T_V4L2_SUBDEV)
> >>   		return;
> >>   
> >> -	v4l2_subdev_print_format(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
> >> -	v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
> >> +	if (!routes) {
> >> +		v4l2_subdev_print_format(entity, pad->index, 0, V4L2_SUBDEV_FORMAT_ACTIVE);
> >> +		v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
> >> +
> >> +		if (pad->flags & MEDIA_PAD_FL_SOURCE)
> >> +			v4l2_subdev_print_subdev_dv(entity);
> >> +
> >> +		return;
> >> +	}
> >> +
> >> +	printed_streams_mask = 0;
> >> +
> >> +	for (i = 0; i < num_routes; ++i) {
> >> +		const struct v4l2_subdev_route *r = &routes[i];
> > 
> > Naming the variable 'route' would be more explicit.
> > 
> >> +		unsigned int stream;
> >>   
> >> -	if (pad->flags & MEDIA_PAD_FL_SOURCE)
> >> -		v4l2_subdev_print_subdev_dv(entity);
> >> +		if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> >> +			continue;
> >> +
> >> +		if (pad->flags & MEDIA_PAD_FL_SINK) {
> >> +			if (r->sink_pad != pad->index)
> >> +				continue;
> >> +
> >> +			stream = r->sink_stream;
> >> +		} else {
> >> +			if (r->source_pad != pad->index)
> >> +				continue;
> >> +
> >> +			stream = r->source_stream;
> >> +		}
> >> +
> >> +		if (printed_streams_mask & (1 << stream))
> >> +			continue;
> >> +
> >> +		v4l2_subdev_print_format(entity, pad->index, stream, V4L2_SUBDEV_FORMAT_ACTIVE);
> >> +		v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
> >> +
> >> +		if (pad->flags & MEDIA_PAD_FL_SOURCE)
> >> +			v4l2_subdev_print_subdev_dv(entity);
> > 
> > v4l2_subdev_print_pad_dv() and v4l2_subdev_print_subdev_dv() don't
> > depend on routes or streams, should they be printed outside of the loop
> > ?
> 
> There's an if-block above the for loop which handles the no-routes case.

What I meant is that the pad and entity variables are constant through
the whole loop, so why should the pad dv and subdev dv information be
printed for each route?

-- 
Regards,

Laurent Pinchart
