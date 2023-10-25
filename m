Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF807D765C
	for <lists+linux-media@lfdr.de>; Wed, 25 Oct 2023 23:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbjJYVH0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Oct 2023 17:07:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjJYVHZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Oct 2023 17:07:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD9612A
        for <linux-media@vger.kernel.org>; Wed, 25 Oct 2023 14:07:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A03FAB2A;
        Wed, 25 Oct 2023 23:07:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698268028;
        bh=PdAKaYEYQxTT0O48BCX6QJmuV4RtuqffdV4r7aYMiFE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VCFSCc9fKe3YQIamUCZum3FoG16U8n+Y4IRTm3044ONyC8SZZsG3kGGKrfchHqogm
         kMUfzc0HvL4xUDEhxNZBtY1LzXumSXQcJQIdOzS872CABA3IysEkgrdm709l0uaNuY
         MyvmZASKAye3lk2xxaS38MQYrleTQ7jo4+DXWl1E=
Date:   Thu, 26 Oct 2023 00:07:26 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 18/28] media: uapi: Allow a larger number of routes
 than there's room for
Message-ID: <20231025210726.GA16151@pendragon.ideasonboard.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-9-sakari.ailus@linux.intel.com>
 <811d8344-192f-4fb6-8da6-b0c8b93165b8@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <811d8344-192f-4fb6-8da6-b0c8b93165b8@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 09, 2023 at 01:56:21PM +0300, Tomi Valkeinen wrote:
> On 03/10/2023 15:08, Sakari Ailus wrote:
> > On VIDIOC_SUBDEV_[GS]_ROUTING, only return as many routes back to the user
> > as there's room. Do not consider it an error if more routes existed.
> > Simply inform the user there are more routes.
> 
> Inform how? And I agree with Hans here. How about return ENOSPC, but the 
> kernel fills in num_routes to tell the userspace how many there actually 
> are?

For VIDIOC_SUBDEV_G_ROUTING I have no objection. For
VIDIOC_SUBDEV_S_ROUTING, however, I would prefer the ioctl to succeed if
the routes can be applied but there's not enough space to return them
all to the application. The application may not have an interest in
getting the applied routes back.

> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >   .../userspace-api/media/v4l/vidioc-subdev-g-routing.rst   | 4 ----
> >   drivers/media/v4l2-core/v4l2-subdev.c                     | 8 ++------
> >   2 files changed, 2 insertions(+), 10 deletions(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > index ced53ea5f23c..99d3c15fd759 100644
> > --- a/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-g-routing.rst
> > @@ -145,10 +145,6 @@ On success 0 is returned, on error -1 and the ``errno`` variable is set
> >   appropriately. The generic error codes are described at the
> >   :ref:`Generic Error Codes <gen-errors>` chapter.
> >   
> > -ENOSPC
> > -   The application provided ``num_routes`` is not big enough to contain
> > -   all the available routes the subdevice exposes.
> > -
> >   EINVAL
> >      The sink or source pad identifiers reference a non-existing pad, or reference
> >      pads of different types (ie. the sink_pad identifiers refers to a source pad).
> > diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> > index 9a34e13dfd96..dd48e7e549fb 100644
> > --- a/drivers/media/v4l2-core/v4l2-subdev.c
> > +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> > @@ -956,14 +956,10 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
> >   
> >   		krouting = &state->routing;
> >   
> > -		if (routing->len_routes < krouting->num_routes) {
> > -			routing->num_routes = krouting->num_routes;
> > -			return -ENOSPC;
> > -		}
> > -
> >   		memcpy((struct v4l2_subdev_route *)(uintptr_t)routing->routes,
> >   		       krouting->routes,
> > -		       krouting->num_routes * sizeof(*krouting->routes));
> > +		       min(krouting->num_routes, routing->len_routes) *
> > +		       sizeof(*krouting->routes));
> >   		routing->num_routes = krouting->num_routes;
> >   
> >   		return 0;

-- 
Regards,

Laurent Pinchart
