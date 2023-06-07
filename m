Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E00A725D10
	for <lists+linux-media@lfdr.de>; Wed,  7 Jun 2023 13:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238532AbjFGL2m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jun 2023 07:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235232AbjFGL2l (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jun 2023 07:28:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B9A1707
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 04:28:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 736AB6365A
        for <linux-media@vger.kernel.org>; Wed,  7 Jun 2023 11:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D22C433D2;
        Wed,  7 Jun 2023 11:28:37 +0000 (UTC)
Message-ID: <28a49fcb-32a3-4a48-2ce5-5805106d6656@xs4all.nl>
Date:   Wed, 7 Jun 2023 13:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 1/7] v4l2-ctl: Add routing and streams support
Content-Language: en-US
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        satish.nagireddy@getcruise.com
References: <20230529085003.47207-1-tomi.valkeinen@ideasonboard.com>
 <20230529085003.47207-2-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230529085003.47207-2-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/05/2023 10:49, Tomi Valkeinen wrote:
> Add support to get and set subdev routes and to get and set
> configurations per stream.
> 
> Based on work from Jacopo Mondi <jacopo@jmondi.org> and
> Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 310 ++++++++++++++++++++++++++---
>  utils/v4l2-ctl/v4l2-ctl.cpp        |   2 +
>  utils/v4l2-ctl/v4l2-ctl.h          |   2 +
>  3 files changed, 281 insertions(+), 33 deletions(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> index 33cc1342..fafb7d92 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> @@ -1,5 +1,13 @@
>  #include "v4l2-ctl.h"
>  
> +#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
> +
> +/*
> + * The max value comes from a check in the kernel source code
> + * drivers/media/v4l2-core/v4l2-ioctl.c check_array_args()
> + */
> +#define NUM_ROUTES_MAX 256
> +
>  struct mbus_name {
>  	const char *name;
>  	__u32 code;
> @@ -19,45 +27,57 @@ static const struct mbus_name mbus_names[] = {
>  #define SelectionFlags 		(1L<<4)
>  
>  static __u32 list_mbus_codes_pad;
> +static __u32 list_mbus_codes_stream = 0;
>  static __u32 get_fmt_pad;
> +static __u32 get_fmt_stream = 0;
>  static __u32 get_sel_pad;
> +static __u32 get_sel_stream = 0;
>  static __u32 get_fps_pad;
> +static __u32 get_fps_stream = 0;
>  static int get_sel_target = -1;
>  static unsigned int set_selection;
>  static struct v4l2_subdev_selection vsel;
>  static unsigned int set_fmt;
>  static __u32 set_fmt_pad;
> +static __u32 set_fmt_stream = 0;
>  static struct v4l2_mbus_framefmt ffmt;
>  static struct v4l2_subdev_frame_size_enum frmsize;
>  static struct v4l2_subdev_frame_interval_enum frmival;
>  static __u32 set_fps_pad;
> +static __u32 set_fps_stream = 0;
>  static double set_fps;
> +static struct v4l2_subdev_routing routing;
> +static struct v4l2_subdev_route routes[NUM_ROUTES_MAX];
>  
>  void subdev_usage()
>  {
>  	printf("\nSub-Device options:\n"
> -	       "  --list-subdev-mbus-codes <pad>\n"
> +	       "  --list-subdev-mbus-codes pad=<pad>,stream=<stream>\n"
>  	       "                      display supported mediabus codes for this pad (0 is default)\n"
>  	       "                      [VIDIOC_SUBDEV_ENUM_MBUS_CODE]\n"
> -	       "  --list-subdev-framesizes pad=<pad>,code=<code>\n"
> +	       "  --list-subdev-framesizes pad=<pad>,stream=<stream>,code=<code>\n"
>  	       "                     list supported framesizes for this pad and code\n"
>  	       "                     [VIDIOC_SUBDEV_ENUM_FRAME_SIZE]\n"
>  	       "                     <code> is the value of the mediabus code\n"
> -	       "  --list-subdev-frameintervals pad=<pad>,width=<w>,height=<h>,code=<code>\n"
> +	       "  --list-subdev-frameintervals pad=<pad>,stream=<stream>,width=<w>,height=<h>,code=<code>\n"
>  	       "                     list supported frame intervals for this pad and code and\n"
>  	       "                     the given width and height [VIDIOC_SUBDEV_ENUM_FRAME_INTERVAL]\n"
>  	       "                     <code> is the value of the mediabus code\n"
> -	       "  --get-subdev-fmt [<pad>]\n"
> -	       "     		     query the frame format for the given pad [VIDIOC_SUBDEV_G_FMT]\n"
> -	       "  --get-subdev-selection pad=<pad>,target=<target>\n"
> +	       "  --get-subdev-fmt pad=<pad>,stream=<stream>\n"
> +	       "     		     query the frame format for the given pad and optional stream [VIDIOC_SUBDEV_G_FMT]\n"
> +	       "		     <pad> the pad to get the format from\n"
> +	       "		     <stream> the stream to get the format from (0 if not specified)\n"

Here you explicitly state that <stream> is optional, but you did not do
that for --list-subdev-mbus-codes, --list-subdev-framesizes and --list-subdev-frameintervals
and other options below (just go through the list).

I also see that the 'pad' suboption is only sometimes documented.
In particular it is not clear when 'pad' is optional (defaulting
to 0) or required.

In some places I used [<pad>] to indicate that it is optional,
but I think it is better to explicitly state that <pad> defaults
to 0, or something along those lines.

If it isn't already the case, my preference is that both pad and
stream are optional and both default to 0.

> +	       "  --get-subdev-selection pad=<pad>,stream=<stream>,target=<target>\n"
>  	       "                     query the frame selection rectangle [VIDIOC_SUBDEV_G_SELECTION]\n"
>  	       "                     See --set-subdev-selection command for the valid <target> values.\n"
> -	       "  --get-subdev-fps [<pad>]\n"
> +	       "  --get-subdev-fps pad=<pad>,stream=<stream>\n"
>  	       "                     query the frame rate [VIDIOC_SUBDEV_G_FRAME_INTERVAL]\n"
>  	       "  --set-subdev-fmt   (for testing only, otherwise use media-ctl)\n"
> -	       "  --try-subdev-fmt pad=<pad>,width=<w>,height=<h>,code=<code>,field=<f>,colorspace=<c>,\n"
> +	       "  --try-subdev-fmt pad=<pad>,stream=<stream>,width=<w>,height=<h>,code=<code>,field=<f>,colorspace=<c>,\n"
>  	       "                   xfer=<xf>,ycbcr=<y>,hsv=<hsv>,quantization=<q>\n"
> -	       "                     set the frame format [VIDIOC_SUBDEV_S_FMT]\n"
> +	       "                     set the frame format for the given pad and optional stream [VIDIOC_SUBDEV_S_FMT]\n"
> +	       "                     <pad> the pad to get the format from\n"
> +	       "                     <stream> the stream to get the format from (0 if not specified)\n"
>  	       "                     <code> is the value of the mediabus code\n"
>  	       "                     <f> can be one of the following field layouts:\n"
>  	       "                       any, none, top, bottom, interlaced, seq_tb, seq_bt,\n"
> @@ -74,31 +94,74 @@ void subdev_usage()
>  	       "                     <q> can be one of the following quantization methods:\n"
>  	       "                       default, full-range, lim-range\n"
>  	       "  --set-subdev-selection (for testing only, otherwise use media-ctl)\n"
> -	       "  --try-subdev-selection pad=<pad>,target=<target>,flags=<flags>,\n"
> +	       "  --try-subdev-selection pad=<pad>,stream=<stream>,target=<target>,flags=<flags>,\n"
>  	       "                         top=<x>,left=<y>,width=<w>,height=<h>\n"
>  	       "                     set the video capture selection rectangle [VIDIOC_SUBDEV_S_SELECTION]\n"
>  	       "                     target=crop|crop_bounds|crop_default|compose|compose_bounds|\n"
>  	       "                            compose_default|compose_padded|native_size\n"
>  	       "                     flags=le|ge|keep-config\n"
> -	       "  --set-subdev-fps pad=<pad>,fps=<fps> (for testing only, otherwise use media-ctl)\n"
> +	       "  --set-subdev-fps pad=<pad>,stream=<stream>,fps=<fps> (for testing only, otherwise use media-ctl)\n"
>  	       "                     set the frame rate [VIDIOC_SUBDEV_S_FRAME_INTERVAL]\n"
> +	       "  --get-routing      Print the route topology\n"
> +	       "  --set-routing <routes>\n"
> +	       "                     Comma-separated list of route descriptors to setup\n"
> +	       "\n"
> +	       "Routes are defined as\n"
> +	       "	routes		= route { ',' route } ;\n"
> +	       "	route		= sink '->' source '[' flags ']' ;\n"
> +	       "	sink		= sink-pad '/' sink-stream ;\n"
> +	       "	source		= source-pad '/' source-stream ;\n"
> +	       "\n"
> +	       "where\n"
> +	       "	sink-pad	= Pad numeric identifier for sink\n"
> +	       "	sink-stream	= Stream numeric identifier for sink\n"
> +	       "	source-pad	= Pad numeric identifier for source\n"
> +	       "	source-stream	= Stream numeric identifier for source\n"
> +	       "	flags		= Route flags (0: inactive, 1: active)\n"
>  	       );
>  }

Regards,

	Hans
