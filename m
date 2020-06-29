Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16DAB20E25E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 00:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390261AbgF2VEi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 Jun 2020 17:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731109AbgF2TMo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Jun 2020 15:12:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5601C0086E3;
        Mon, 29 Jun 2020 02:34:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 151892B3;
        Mon, 29 Jun 2020 11:34:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1593423287;
        bh=j0zsdCSu5FedzXiYOl5bxEOicYT1rdUAbW7P09CKJGM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bvozZtlYoWNFocjWd26temgDYOZKqdHniKIYoJovGSy6RepWl3DW4KXMn+A0WImL3
         pNG8/b8m591iElqpPwNAxj7ZDNEull+ybM/LqE9lO/HgOIp7aWXf41K8ZAwGhEmEiE
         ocSCIOBtsmq6763P6gOoA/ZF9JP+OZEq/Kuawzyo=
Date:   Mon, 29 Jun 2020 12:34:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Ramzi Ben Meftah <rbmeftah@de.adit-jv.com>
Cc:     Steve Longerbeam <steve_longerbeam@mentor.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
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
Message-ID: <20200629093444.GA10681@pendragon.ideasonboard.com>
References: <1592301619-17631-1-git-send-email-rbmeftah@de.adit-jv.com>
 <20200624075307.hl6wew7vr5ue225t@uno.localdomain>
 <20200625020138.GW5980@pendragon.ideasonboard.com>
 <c57d416d-14d4-6d5d-a281-ddbf3183395a@mentor.com>
 <20200626011251.GP5865@pendragon.ideasonboard.com>
 <20200629092413.GA84958@vmlxhi-110.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200629092413.GA84958@vmlxhi-110.adit-jv.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ramzi,

On Mon, Jun 29, 2020 at 11:24:13AM +0200, Ramzi Ben Meftah wrote:
> On Fri, Jun 26, 2020 at 04:12:51AM +0300, Laurent Pinchart wrote:
> > On Thu, Jun 25, 2020 at 10:41:09AM -0700, Steve Longerbeam wrote:
> >> On 6/24/20 7:01 PM, Laurent Pinchart wrote:
> >>> On Wed, Jun 24, 2020 at 09:53:07AM +0200, Jacopo Mondi wrote:
> >>>> On Tue, Jun 16, 2020 at 12:00:15PM +0200, Ramzi BEN MEFTAH wrote:
> >>>>> From: Steve Longerbeam <steve_longerbeam@mentor.com>
> >>>>   +Niklas, +Laurent
> >>>>
> >>>> Niklas, Laurent, how does this play with CAP_IO_MC ?
> >>> I don't think it's related to CAP_IO_MC, but I don't think it's a good
> >>> idea either :-) Routing doesn't go through the subdev [gs]_input
> >>> operations in MC-based drivers. It should be configured through link
> >>> setup instead. This patch goes in the wrong direction, sorry Steve.
> >> 
> >> That's OK! :) I didn't submit this patch, and as stated in the commit 
> >> header, I never recommended this patch be submitted to upstream in the 
> >> first place.
> >> 
> >> Selecting inputs at a subdev should normally make use of media link 
> >> setup. But for selecting analog signal inputs, such as the ADV748x AFE 
> >> standard definition inputs, that would  mean there would need to exist 
> >> source "analog" subdevs that connect to the AFE inputs, if only for the 
> >> purpose of selecting those inputs, which seems silly IMHO. The ADV748x 
> >> AFE subdev defines these inputs as media pads, but have no connections, 
> >> so link setup API can't be used to select those inputs.
> >> 
> >> So a new subdev pad API is clearly needed, not just to get input status 
> >> at a subdev pad, but to select/make active such analog inputs without 
> >> requiring link setup API.
> > 
> > There was an attempt to create a subdev ioctl to configure internal
> > routing. See "[PATCH v4 19/31] media: Documentation: Add GS_ROUTING
> > documentation" ([1]) and the related patches in the series.
> > 
> > [1] https://lore.kernel.org/linux-media/20190328200608.9463-20-jacopo+renesas@jmondi.org/
> 
> I was thinking why not just allowing linking pads of the same media entity.
> This will avoid adding a new control, and will do the same as S_INPUT ioctl.

The MC link setup API doesn't offer a way to configure multiple links in
one operation, which is often needed for internal routing. There's also
the issue that extensive changes would likely be needed for the MC core,
although that's "just" a matter of implementing it.

> >>>>> This commit enables VIDIOC_ENUMINPUT, VIDIOC_G_INPUT, and VIDIOC_S_INPUT
> >>>>> ioctls for use via v4l2 subdevice node.
> >>>>>
> >>>>> This commit should probably not be pushed upstream, because the (old)
> >>>>> idea of video inputs conflicts with the newer concept of establishing
> >>>>> media links between src->sink pads.
> >>>>>
> >>>>> However it might make sense for some subdevices to support enum/get/set
> >>>>> inputs. One example would be the analog front end subdevice for the
> >>>>> ADV748x. By providing these ioctls, selecting the ADV748x analog inputs
> >>>>> can be done without requiring the implementation of media entities that
> >>>>> would define the analog source for which to establish a media link.
> >>>>>
> >>>>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> >>>>> ---
> >>>>>   drivers/media/v4l2-core/v4l2-subdev.c |  9 +++++++++
> >>>>>   include/media/v4l2-subdev.h           | 11 +++++++++++
> >>>>>   2 files changed, 20 insertions(+)
> >>>>>
> >>>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> >>>>> index 6b989fe..73fbfe9 100644
> >>>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> >>>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> >>>>> @@ -378,6 +378,15 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
> >>>>>   			return -ENOTTY;
> >>>>>   		return v4l2_querymenu(vfh->ctrl_handler, arg);
> >>>>>
> >>>>> +	case VIDIOC_ENUMINPUT:
> >>>>> +		return v4l2_subdev_call(sd, video, enuminput, arg);
> >>>>> +
> >>>>> +	case VIDIOC_G_INPUT:
> >>>>> +		return v4l2_subdev_call(sd, video, g_input, arg);
> >>>>> +
> >>>>> +	case VIDIOC_S_INPUT:
> >>>>> +		return v4l2_subdev_call(sd, video, s_input, *(u32 *)arg);
> >>>>> +
> >>>>>   	case VIDIOC_G_CTRL:
> >>>>>   		if (!vfh->ctrl_handler)
> >>>>>   			return -ENOTTY;
> >>>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> >>>>> index f7fe78a..6e1a9cd 100644
> >>>>> --- a/include/media/v4l2-subdev.h
> >>>>> +++ b/include/media/v4l2-subdev.h
> >>>>> @@ -383,6 +383,14 @@ struct v4l2_mbus_frame_desc {
> >>>>>    * @g_input_status: get input status. Same as the status field in the
> >>>>>    *	&struct &v4l2_input
> >>>>>    *
> >>>>> + * @enuminput: enumerate inputs. Should return the same input status as
> >>>>> + *      @g_input_status if the passed input index is the currently active
> >>>>> + *      input.
> >>>>> + *
> >>>>> + * @g_input: returns the currently active input index.
> >>>>> + *
> >>>>> + * @s_input: set the active input.
> >>>>> + *
> >>>>>    * @s_stream: used to notify the driver that a video stream will start or has
> >>>>>    *	stopped.
> >>>>>    *
> >>>>> @@ -423,6 +431,9 @@ struct v4l2_subdev_video_ops {
> >>>>>   	int (*g_tvnorms)(struct v4l2_subdev *sd, v4l2_std_id *std);
> >>>>>   	int (*g_tvnorms_output)(struct v4l2_subdev *sd, v4l2_std_id *std);
> >>>>>   	int (*g_input_status)(struct v4l2_subdev *sd, u32 *status);
> >>>>> +	int (*enuminput)(struct v4l2_subdev *sd, struct v4l2_input *input);
> >>>>> +	int (*g_input)(struct v4l2_subdev *sd, u32 *index);
> >>>>> +	int (*s_input)(struct v4l2_subdev *sd, u32 index);
> >>>>>   	int (*s_stream)(struct v4l2_subdev *sd, int enable);
> >>>>>   	int (*g_pixelaspect)(struct v4l2_subdev *sd, struct v4l2_fract *aspect);
> >>>>>   	int (*g_frame_interval)(struct v4l2_subdev *sd,

-- 
Regards,

Laurent Pinchart
