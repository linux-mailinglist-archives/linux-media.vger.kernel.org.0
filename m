Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12D1A209C42
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 11:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390704AbgFYJr3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 05:47:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390052AbgFYJr2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 05:47:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FFF3C061573;
        Thu, 25 Jun 2020 02:47:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BE2C521;
        Thu, 25 Jun 2020 11:47:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593078445;
        bh=Rd6+/EiGtZUUer4Z7+8mWfSC18i6Ms0DFb9zau1uDdM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UG8w6M3V8VNc3AN7Br+6+dNZDthnouJVTanLFWakrkvOVbZv+hJOpdJhllO8IzUhN
         4dI05+mZo182HoEIt9uuuYB0fMPbQjOK6ZhR/Mn6RfBbwMhbrFnOCd2pjSPcgmik65
         LqWRlwz5C32wYvyxhLxjZNP/yEHEEhBs/h1z4Sl0=
Date:   Thu, 25 Jun 2020 12:47:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ramzi Ben Meftah <rbmeftah@de.adit-jv.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        niklas soderlund <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Steve Longerbeam <steve_longerbeam@mentor.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Rodin <mrodin@de.adit-jv.com>,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com
Subject: Re: [PATCH 1/3] v4l2-subdev: Add subdev ioctl support for
 ENUM/GET/SET INPUT
Message-ID: <20200625094724.GE5865@pendragon.ideasonboard.com>
References: <1592301619-17631-1-git-send-email-rbmeftah@de.adit-jv.com>
 <20200624075307.hl6wew7vr5ue225t@uno.localdomain>
 <20200625020138.GW5980@pendragon.ideasonboard.com>
 <20200625093046.GA91893@vmlxhi-110.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200625093046.GA91893@vmlxhi-110.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ramzi,

On Thu, Jun 25, 2020 at 11:30:46AM +0200, Ramzi Ben Meftah wrote:
> On Thu, Jun 25, 2020 at 05:01:38AM +0300, Laurent Pinchart wrote:
> > On Wed, Jun 24, 2020 at 09:53:07AM +0200, Jacopo Mondi wrote:
> >> On Tue, Jun 16, 2020 at 12:00:15PM +0200, Ramzi BEN MEFTAH wrote:
> >>> From: Steve Longerbeam <steve_longerbeam@mentor.com>
> >> 
> >>  +Niklas, +Laurent
> >> 
> >> Niklas, Laurent, how does this play with CAP_IO_MC ?
> > 
> > I don't think it's related to CAP_IO_MC, but I don't think it's a good
> > idea either :-) Routing doesn't go through the subdev [gs]_input
> > operations in MC-based drivers. It should be configured through link
> > setup instead. This patch goes in the wrong direction, sorry Steve.
> 
> ENUMINPUT ioctl allow to get the input signal status. Is there an alternative
> with Media Controller?

No there isn't at the moment. I'm not opposed to adding such a feature,
but VIDIOC_ENUMINPUT isn't the right choice. This would have to be a
subdev pad operation (v4l2_subdev_pad_ops), not a video operation
(v4l2_subdev_video_ops). We also likely shouldn't call it "enum" input,
as it would retrieve properties of the input corresponding to the pad,
not enumerate inputs.

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
> >>>  drivers/media/v4l2-core/v4l2-subdev.c |  9 +++++++++
> >>>  include/media/v4l2-subdev.h           | 11 +++++++++++
> >>>  2 files changed, 20 insertions(+)
> >>>
> >>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> index 6b989fe..73fbfe9 100644
> >>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >>> @@ -378,6 +378,15 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >>>  			return -ENOTTY;
> >>>  		return v4l2_querymenu(vfh->ctrl_handler, arg);
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
> >>>  	case VIDIOC_G_CTRL:
> >>>  		if (!vfh->ctrl_handler)
> >>>  			return -ENOTTY;
> >>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >>> index f7fe78a..6e1a9cd 100644
> >>> --- a/include/media/v4l2-subdev.h
> >>> +++ b/include/media/v4l2-subdev.h
> >>> @@ -383,6 +383,14 @@ struct v4l2_mbus_frame_desc {
> >>>   * @g_input_status: get input status. Same as the status field in the
> >>>   *	&struct &v4l2_input
> >>>   *
> >>> + * @enuminput: enumerate inputs. Should return the same input status as
> >>> + *      @g_input_status if the passed input index is the currently active
> >>> + *      input.
> >>> + *
> >>> + * @g_input: returns the currently active input index.
> >>> + *
> >>> + * @s_input: set the active input.
> >>> + *
> >>>   * @s_stream: used to notify the driver that a video stream will start or has
> >>>   *	stopped.
> >>>   *
> >>> @@ -423,6 +431,9 @@ struct v4l2_subdev_video_ops {
> >>>  	int (*g_tvnorms)(struct v4l2_subdev *sd, v4l2_std_id *std);
> >>>  	int (*g_tvnorms_output)(struct v4l2_subdev *sd, v4l2_std_id *std);
> >>>  	int (*g_input_status)(struct v4l2_subdev *sd, u32 *status);
> >>> +	int (*enuminput)(struct v4l2_subdev *sd, struct v4l2_input *input);
> >>> +	int (*g_input)(struct v4l2_subdev *sd, u32 *index);
> >>> +	int (*s_input)(struct v4l2_subdev *sd, u32 index);
> >>>  	int (*s_stream)(struct v4l2_subdev *sd, int enable);
> >>>  	int (*g_pixelaspect)(struct v4l2_subdev *sd, struct v4l2_fract *aspect);
> >>>  	int (*g_frame_interval)(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart
