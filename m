Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFBB20AA18
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 03:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbgFZBM4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 21:12:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46868 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbgFZBM4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 21:12:56 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13A1D595;
        Fri, 26 Jun 2020 03:12:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593133973;
        bh=OGnn3Du3CGaosILghe0jhZN8MxKh5aDNKLaqOQFHkps=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=grSCHd6GQJkQiVjtsiow7VRDaWX/2mg+YJHmhO/Csv4kPpErwiM+AktRcwgZ3cd0g
         jXSdHvuy6gISYKdgEueXpt1KLlyWRJuroN3lkRP6oOKevlD4Y6ZtQRlvJNtKNzSebq
         e0ecGJsBTkMQqVxxKmFvlSyIZlCRAAtlJFu+QIDc=
Date:   Fri, 26 Jun 2020 04:12:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <steve_longerbeam@mentor.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Ramzi BEN MEFTAH <rbmeftah@de.adit-jv.com>,
        niklas soderlund <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Rodin <mrodin@de.adit-jv.com>,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com
Subject: Re: [PATCH 1/3] v4l2-subdev: Add subdev ioctl support for
 ENUM/GET/SET INPUT
Message-ID: <20200626011251.GP5865@pendragon.ideasonboard.com>
References: <1592301619-17631-1-git-send-email-rbmeftah@de.adit-jv.com>
 <20200624075307.hl6wew7vr5ue225t@uno.localdomain>
 <20200625020138.GW5980@pendragon.ideasonboard.com>
 <c57d416d-14d4-6d5d-a281-ddbf3183395a@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c57d416d-14d4-6d5d-a281-ddbf3183395a@mentor.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Thu, Jun 25, 2020 at 10:41:09AM -0700, Steve Longerbeam wrote:
> On 6/24/20 7:01 PM, Laurent Pinchart wrote:
> > On Wed, Jun 24, 2020 at 09:53:07AM +0200, Jacopo Mondi wrote:
> >> On Tue, Jun 16, 2020 at 12:00:15PM +0200, Ramzi BEN MEFTAH wrote:
> >>> From: Steve Longerbeam <steve_longerbeam@mentor.com>
> >>   +Niklas, +Laurent
> >>
> >> Niklas, Laurent, how does this play with CAP_IO_MC ?
> > I don't think it's related to CAP_IO_MC, but I don't think it's a good
> > idea either :-) Routing doesn't go through the subdev [gs]_input
> > operations in MC-based drivers. It should be configured through link
> > setup instead. This patch goes in the wrong direction, sorry Steve.
> 
> That's OK! :) I didn't submit this patch, and as stated in the commit 
> header, I never recommended this patch be submitted to upstream in the 
> first place.
> 
> Selecting inputs at a subdev should normally make use of media link 
> setup. But for selecting analog signal inputs, such as the ADV748x AFE 
> standard definition inputs, that would  mean there would need to exist 
> source "analog" subdevs that connect to the AFE inputs, if only for the 
> purpose of selecting those inputs, which seems silly IMHO. The ADV748x 
> AFE subdev defines these inputs as media pads, but have no connections, 
> so link setup API can't be used to select those inputs.
> 
> So a new subdev pad API is clearly needed, not just to get input status 
> at a subdev pad, but to select/make active such analog inputs without 
> requiring link setup API.

There was an attempt to create a subdev ioctl to configure internal
routing. See "[PATCH v4 19/31] media: Documentation: Add GS_ROUTING
documentation" ([1]) and the related patches in the series.

[1] https://lore.kernel.org/linux-media/20190328200608.9463-20-jacopo+renesas@jmondi.org/

> >>> This commit enables VIDIOC_ENUMINPUT, VIDIOC_G_INPUT, and VIDIOC_S_INPUT
> >>> ioctls for use via v4l2 subdevice node.
> >>>
> >>> This commit should probably not be pushed upstream, because the (old)
> >>> idea of video inputs conflicts with the newer concept of establishing
> >>> media links between src->sink pads.
> >>>
> >>> However it might make sense for some subdevices to support enum/get/set
> >>> inputs. One example would be the analog front end subdevice for the
> >>> ADV748x. By providing these ioctls, selecting the ADV748x analog inputs
> >>> can be done without requiring the implementation of media entities that
> >>> would define the analog source for which to establish a media link.
> >>>
> >>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> >>> ---
> >>>   drivers/media/v4l2-core/v4l2-subdev.c |  9 +++++++++
> >>>   include/media/v4l2-subdev.h           | 11 +++++++++++
> >>>   2 files changed, 20 insertions(+)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> index 6b989fe..73fbfe9 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> @@ -378,6 +378,15 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >>>   			return -ENOTTY;
> >>>   		return v4l2_querymenu(vfh->ctrl_handler, arg);
> >>>
> >>> +	case VIDIOC_ENUMINPUT:
> >>> +		return v4l2_subdev_call(sd, video, enuminput, arg);
> >>> +
> >>> +	case VIDIOC_G_INPUT:
> >>> +		return v4l2_subdev_call(sd, video, g_input, arg);
> >>> +
> >>> +	case VIDIOC_S_INPUT:
> >>> +		return v4l2_subdev_call(sd, video, s_input, *(u32 *)arg);
> >>> +
> >>>   	case VIDIOC_G_CTRL:
> >>>   		if (!vfh->ctrl_handler)
> >>>   			return -ENOTTY;
> >>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >>> index f7fe78a..6e1a9cd 100644
> >>> --- a/include/media/v4l2-subdev.h
> >>> +++ b/include/media/v4l2-subdev.h
> >>> @@ -383,6 +383,14 @@ struct v4l2_mbus_frame_desc {
> >>>    * @g_input_status: get input status. Same as the status field in the
> >>>    *	&struct &v4l2_input
> >>>    *
> >>> + * @enuminput: enumerate inputs. Should return the same input status as
> >>> + *      @g_input_status if the passed input index is the currently active
> >>> + *      input.
> >>> + *
> >>> + * @g_input: returns the currently active input index.
> >>> + *
> >>> + * @s_input: set the active input.
> >>> + *
> >>>    * @s_stream: used to notify the driver that a video stream will start or has
> >>>    *	stopped.
> >>>    *
> >>> @@ -423,6 +431,9 @@ struct v4l2_subdev_video_ops {
> >>>   	int (*g_tvnorms)(struct v4l2_subdev *sd, v4l2_std_id *std);
> >>>   	int (*g_tvnorms_output)(struct v4l2_subdev *sd, v4l2_std_id *std);
> >>>   	int (*g_input_status)(struct v4l2_subdev *sd, u32 *status);
> >>> +	int (*enuminput)(struct v4l2_subdev *sd, struct v4l2_input *input);
> >>> +	int (*g_input)(struct v4l2_subdev *sd, u32 *index);
> >>> +	int (*s_input)(struct v4l2_subdev *sd, u32 index);
> >>>   	int (*s_stream)(struct v4l2_subdev *sd, int enable);
> >>>   	int (*g_pixelaspect)(struct v4l2_subdev *sd, struct v4l2_fract *aspect);
> >>>   	int (*g_frame_interval)(struct v4l2_subdev *sd,
> 

-- 
Regards,

Laurent Pinchart
