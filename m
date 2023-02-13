Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31C01694281
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 11:17:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbjBMKRA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 05:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjBMKQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 05:16:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F332696
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 02:16:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D840B501;
        Mon, 13 Feb 2023 11:16:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676283414;
        bh=jYRBFWVwARF+v+eZCtuBsg7oHeJ2qileuC2mF412uhc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eEARQG0pI0A4Et4Rbr2ZTe3iE490SJutpMVtUyiIM36RLp1ACMxi5ngmrnRn4X4jg
         CNLYHM0fuxSoy7aM7cf0N4qpOK4YiUFJj49iJzZvliloVOqP1nG9fEeoOv5SWCDHj0
         M7bgPollI3DQ9w5ru4ez6ZMvlOs31kq46zWw20lY=
Date:   Mon, 13 Feb 2023 12:16:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        satish.nagireddy@getcruise.com
Subject: Re: [PATCH v3 1/3] v4l2-ctl: Add routing and streams support
Message-ID: <Y+oOFWaokKGPgwO/@pendragon.ideasonboard.com>
References: <20230210115546.199809-1-tomi.valkeinen@ideasonboard.com>
 <20230210115546.199809-2-tomi.valkeinen@ideasonboard.com>
 <c5980db0-5ef2-bcd7-79d3-f45746eaf3d0@ideasonboard.com>
 <d8716fa3-03fa-32b9-9dea-48c5d45151b0@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8716fa3-03fa-32b9-9dea-48c5d45151b0@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 13, 2023 at 11:00:14AM +0100, Hans Verkuil wrote:
> On 2/13/23 10:49, Tomi Valkeinen wrote:
> > Hi,
> > 
> > On 10/02/2023 13:55, Tomi Valkeinen wrote:
> >> Add support to get and set subdev routes and to get and set
> >> configurations per stream.
> >>
> >> Based on work from Jacopo Mondi <jacopo@jmondi.org> and
> >> Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 288 +++++++++++++++++++++++++----
> >>   utils/v4l2-ctl/v4l2-ctl.cpp        |   2 +
> >>   utils/v4l2-ctl/v4l2-ctl.h          |   2 +
> >>   3 files changed, 259 insertions(+), 33 deletions(-)
> >>
> >> diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> >> index 33cc1342..81236451 100644
> >> --- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> >> +++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> >> @@ -1,5 +1,13 @@
> >>   #include "v4l2-ctl.h"
> >>   
> >> +#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
> >> +
> >> +/*
> >> + * The max value comes from a check in the kernel source code
> >> + * drivers/media/v4l2-core/v4l2-ioctl.c check_array_args()
> >> + */
> >> +#define NUM_ROUTES_MAX 256
> >> +
> >>   struct mbus_name {
> >>   	const char *name;
> >>   	__u32 code;
> >> @@ -19,45 +27,57 @@ static const struct mbus_name mbus_names[] = {
> >>   #define SelectionFlags 		(1L<<4)
> >>   
> >>   static __u32 list_mbus_codes_pad;
> >> +static __u32 list_mbus_codes_stream = 0;
> >>   static __u32 get_fmt_pad;
> >> +static __u32 get_fmt_stream = 0;
> >>   static __u32 get_sel_pad;
> >> +static __u32 get_sel_stream = 0;
> >>   static __u32 get_fps_pad;
> >> +static __u32 get_fps_stream = 0;
> >>   static int get_sel_target = -1;
> >>   static unsigned int set_selection;
> >>   static struct v4l2_subdev_selection vsel;
> >>   static unsigned int set_fmt;
> >>   static __u32 set_fmt_pad;
> >> +static __u32 set_fmt_stream = 0;
> >>   static struct v4l2_mbus_framefmt ffmt;
> >>   static struct v4l2_subdev_frame_size_enum frmsize;
> >>   static struct v4l2_subdev_frame_interval_enum frmival;
> >>   static __u32 set_fps_pad;
> >> +static __u32 set_fps_stream = 0;
> >>   static double set_fps;
> >> +static struct v4l2_subdev_routing routing;
> >> +static struct v4l2_subdev_route routes[NUM_ROUTES_MAX];
> >>   
> >>   void subdev_usage()
> >>   {
> >>   	printf("\nSub-Device options:\n"
> >> -	       "  --list-subdev-mbus-codes <pad>\n"
> >> +	       "  --list-subdev-mbus-codes pad=<pad>,stream=<stream>\n"
> >>   	       "                      display supported mediabus codes for this pad (0 is default)\n"
> >>   	       "                      [VIDIOC_SUBDEV_ENUM_MBUS_CODE]\n"
> >> -	       "  --list-subdev-framesizes pad=<pad>,code=<code>\n"
> >> +	       "  --list-subdev-framesizes pad=<pad>,stream=<stream>,code=<code>\n"
> >>   	       "                     list supported framesizes for this pad and code\n"
> >>   	       "                     [VIDIOC_SUBDEV_ENUM_FRAME_SIZE]\n"
> >>   	       "                     <code> is the value of the mediabus code\n"
> >> -	       "  --list-subdev-frameintervals pad=<pad>,width=<w>,height=<h>,code=<code>\n"
> >> +	       "  --list-subdev-frameintervals pad=<pad>,stream=<stream>,width=<w>,height=<h>,code=<code>\n"
> >>   	       "                     list supported frame intervals for this pad and code and\n"
> >>   	       "                     the given width and height [VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL]\n"
> >>   	       "                     <code> is the value of the mediabus code\n"
> >> -	       "  --get-subdev-fmt [<pad>]\n"
> >> -	       "     		     query the frame format for the given pad [VIDIOC_SUBDEV_G_FMT]\n"
> >> -	       "  --get-subdev-selection pad=<pad>,target=<target>\n"
> >> +	       "  --get-subdev-fmt pad=<pad>,stream=<stream>\n"
> >> +	       "     		     query the frame format for the given pad and optional stream [VIDIOC_SUBDEV_G_FMT]\n"
> >> +	       "		     <pad> the pad to get the format from\n"
> >> +	       "		     <stream> the stream to get the format from (0 if not specified)\n"
> >> +	       "  --get-subdev-selection pad=<pad>,stream=<stream>,target=<target>\n"
> >>   	       "                     query the frame selection rectangle [VIDIOC_SUBDEV_G_SELECTION]\n"
> >>   	       "                     See --set-subdev-selection command for the valid <target> values.\n"
> >> -	       "  --get-subdev-fps [<pad>]\n"
> >> +	       "  --get-subdev-fps pad=<pad>,stream=<stream>\n"
> >>   	       "                     query the frame rate [VIDIOC_SUBDEV_G_FRAME_INTERVAL]\n"
> > 
> > Laurent noticed that the above option, and a few others, break backward 
> > compatibility.
> > 
> > If no one has other suggestions, I'll additionally add back the old 
> > option format. In other words, if the parameter is a number, it's a pad. 
> > Otherwise we look for pad=<pad>,stream=<stream> style option.
> 
> That will work. Only mention the new arguments in the usage text, though.
> 
> And add a comment in the code why you check if the arg is just a number.
> 
> > 
> > Well, another alternative would be to use an "extended" pad format 
> > instead. I.e. for each <pad> in the old style, we'd accept something 
> > like <pad[/stream]>. E.g. "--list-subdev-framesizes 
> > pad=<pad[/stream]>,code=<code>"
> 
> No, that's inconsistent with the argument style of v4l2-ctl.
> 
> Note that I am not terribly concerned about backwards compatibility here,
> especially w.r.t. the subdev options. So if it turns out to be too much
> work to support the old option format, then I'm OK with breaking the
> compatibility.

I'm fine with this too.

> > Opinions?

-- 
Regards,

Laurent Pinchart
