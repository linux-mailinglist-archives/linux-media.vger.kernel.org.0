Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72E736953DA
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 23:27:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjBMW1S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 17:27:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjBMW1R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 17:27:17 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345932101
        for <linux-media@vger.kernel.org>; Mon, 13 Feb 2023 14:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676327236; x=1707863236;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uoHw2hTxbrnAjD0tozURjcNy/KhxXT08rWTz1h3KrO4=;
  b=D0n9Zg64HxMOT+6PMD1UoIHvLQwT+2BdHZ9uiRK0WAyNuxiRUgdasHDA
   X5lX/S+COf2pNvau6A5Ge4eZndfMh3skn/FKm2QEpnFDeJE8see/ikYoo
   dF7boctJwnBbm0yvdWX8f+CW94Q10hG8BWqTzBiauoNRemb8rpyalIYGO
   EmWxHc6kHyl2nLxAY0065TZtWWehtAWzsXNvLmxtR4N9GFB0LdxUaYPlI
   ALRr5oFUaXq8s9NuTxg1soLofRnjqNW65TzQbnEsRQ+GrFyG5zV5a1P3C
   OlxuEOQHS6iSYwcoi4aGWVLDMEfa5qVf0gnb61Z1g2Zt88coEElF11JiS
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393416729"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="393416729"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 14:27:00 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="662344722"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="662344722"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 14:26:57 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 8306C12227E;
        Tue, 14 Feb 2023 00:26:53 +0200 (EET)
Date:   Tue, 14 Feb 2023 00:26:53 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        satish.nagireddy@getcruise.com
Subject: Re: [PATCH v3 1/3] v4l2-ctl: Add routing and streams support
Message-ID: <Y+q5LZdmcxOO+mrC@kekkonen.localdomain>
References: <20230210115546.199809-1-tomi.valkeinen@ideasonboard.com>
 <20230210115546.199809-2-tomi.valkeinen@ideasonboard.com>
 <c5980db0-5ef2-bcd7-79d3-f45746eaf3d0@ideasonboard.com>
 <d8716fa3-03fa-32b9-9dea-48c5d45151b0@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8716fa3-03fa-32b9-9dea-48c5d45151b0@xs4all.nl>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Tomi,

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

This would be my preference, too.

-- 
Sakari Ailus
