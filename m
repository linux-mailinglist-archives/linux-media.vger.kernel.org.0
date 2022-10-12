Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74B175FC3C4
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 12:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiJLKbC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 06:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbiJLKbA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 06:31:00 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B435814A
        for <linux-media@vger.kernel.org>; Wed, 12 Oct 2022 03:30:59 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD41A492;
        Wed, 12 Oct 2022 12:30:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665570657;
        bh=H14mk6/p/Tkw8+ryJ2TedpXz4YtcByVPWoa4GrSXeZQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=gdgQLTWs/B9s1IMhv3FNg2rO9TlbDlXUEdC1CymR5CGqmOvTo0KzKFCx5EXIG+b4M
         fvMk7dxJf8v3xF1HioCRa1WVGG05jWO0ZQ1AJDRM5mdCcb1fbiv2qWI0XOvFCYoqQ6
         tn2ciYhdawLaaztRnLZr1j2f5os7C1SMOk1Mi/Rg=
Message-ID: <dbe3ff30-df57-e981-90c1-3b917e9ee65f@ideasonboard.com>
Date:   Wed, 12 Oct 2022 13:30:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/1] media: Documentation: Interaction between routes,
 formats and selections
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20221003121852.616745-10-tomi.valkeinen@ideasonboard.com>
 <20221011104729.1058-1-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221011104729.1058-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hoi,

On 11/10/2022 13:47, Sakari Ailus wrote:
> Document how setting up routes interacts with formats and selections.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Moi,
> 
> This could be added on top of the set.
> 
> Comments are welcome.
> 
>   .../userspace-api/media/v4l/dev-subdev.rst    | 48 ++++++++++++++-----
>   1 file changed, 37 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 5075b1828b32d..830235eb01598 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -406,6 +406,8 @@ pixel array is not rectangular but cross-shaped or round. The maximum
>   size may also be smaller than the BOUNDS rectangle.
>   
>   
> +.. _format-propagation:
> +
>   Order of configuration and format propagation
>   ---------------------------------------------
>   
> @@ -507,12 +509,12 @@ source pads.
>   Streams, multiplexed media pads and internal routing
>   ----------------------------------------------------
>   
> -Commonly V4L2 subdevices support only separate video streams, that is, only a
> -single stream can pass through a media link and a media pad. Thus each pad
> -contains a format configuration for that single stream. In some cases a subdev
> -can do stream processing and split a stream into two or compose two streams
> -into one, but the inputs and outputs for the subdev are still a single stream
> -per pad.
> +Commonly V4L2 subdevices do not support multiple, unrelated video streams.

I wonder if we should use some other word than "commonly", as it seems 
pretty common nowadays that there is at least a embedded data. Should we 
instead say, e.g., "Simple V4L2 subdevices..."

> +Only a single stream can pass through a media link and a media

This could be a continuation of the previous sentence: "... video 
streams, and only a single stream..."

> +pad. Thus each pad contains a format and selection configuration for that single stream.
> +A subdev can do stream processing and split a stream into
> +two or compose two streams into one, but the inputs and outputs for the
> +subdev are still a single stream per pad.
>   
>   Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, multiple
>   data streams are transmitted on the same bus, which is represented by a media
> @@ -539,15 +541,37 @@ streams from one end of the link to the other, and subdevices have routing
>   tables which describe how the incoming streams from sink pads are routed to the
>   source pads.
>   
> -A stream ID (often just "stream") is a media link-local identifier for a stream.
> +A stream ID is a media link-local identifier for a stream.
>   In other words, a particular stream ID must exist on both sides of a media
>   link, but another stream ID can be used for the same stream at the other side
> -of the subdevice.
> +of the subdevice. The same stream ID is used to refer to the stream on
> +both pads of the link on all ioctls operating on pads.
>   
>   A stream at a specific point in the media pipeline is identified with the
> -subdev and a (pad, stream) pair. For subdevices that do not support
> +subdev and a pad--stream pair. For subdevices that do not support

Is there a double-dash on purpose?

Btw, above you removed the "(often just "stream")", but here you use 
"stream" instead of "stream ID".

>   multiplexed streams the 'stream' is always 0.
>   
> +Interaction between routes, formats and selections
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The addition of routes to the V4L2 sub-device interface moves the
> +sub-device formats and selections from pads to pad--stream pairs. Instead

I guess it is, as you use it here also...

> +of the sub-device wide merging of streams from all source pads towards all
> +sink pads, this takes place separately for each route. The stream ID on
> +the sink pad for each configured route is used to configure format and
> +selections on the sink pad. Similarly, the stream ID on the source pad of
> +each configured route is used to configure format and selections on the
> +source pad.

Hmm, "stream ID is used to configure format" sounds odd to me. The ioctl 
is used to configure the format, but rather than using only pad ID to 
identify the configuration target, you now use pad ID - stream ID pair.

And is that just extra duplication above to talk separately about sink 
and source sides? They don't matter here, the point is just the 
pad-stream vs only pad.

> +
> +Any number of routes from streams on sink pads towards streams on source

This also sounds a bit odd to me: "a route from a stream on a sink pad". 
I think we're missing a word here which means the specific point of a 
stream in the pipeline.

I have suggested "stream endpoint", but it's not really an "end" point. 
"Stream waypoint"? So you would configure a format to a subdev's stream 
waypoint. And "Any number of routes from stream waypoints on sink pads 
towards stream waypoints on source pads".

So a "stream waypoint" would be a triplet of subdev-padID-streamID, or 
just padID-streamID if the subdev is obvious.

Even if we don't find a perfect or even a very good term for this, I 
think we should just use something. Using just "stream" makes things 
quite confusing, in my opinion.

> +pads is allowed, to the extent supported by drivers. For every stream on a
> +sink pad, however, only a single route is allowed.

Hmm, why is that?

> +
> +Pad--stream pairs are not static but are replaced by calls to the
> +:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. This also
> +applies to stream format and selection configurations which that are

Should that "applies to" be "affects the"?

> +reverted to driver defaults.
> +
>   Configuring streams
>   ^^^^^^^^^^^^^^^^^^^
>   
> @@ -565,8 +589,10 @@ Controller API <media_controller>`
>   setting the routing table will reset all the stream configurations in a media
>   entity.
>   
> -3) Configure streams. Each route endpoint must be configured

Oh, here I seem to use "route endpoint".

> -with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
> +3) Configure formats and selections on routes. Each route is configured

I'm not sure if we "configure formats on routes". Earlier I think we've 
talked about configuring the streams (stream waypoints).

> +separately as documented plain subdevices in :ref:`<format-propagation>`.

Is there something missing from above? Or drop "plain subdevices"?

> +The stream ID is set to the same stream ID used on sink and source pads of
> +the :ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl.

Yes. But I think this could be said more clearly if we have a good word 
for the padID-streamID pair.

  Tomi

