Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 578E6646BCA
	for <lists+linux-media@lfdr.de>; Thu,  8 Dec 2022 10:23:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbiLHJX0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Dec 2022 04:23:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiLHJXX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Dec 2022 04:23:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E3C58BF8
        for <linux-media@vger.kernel.org>; Thu,  8 Dec 2022 01:23:19 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C389D25B;
        Thu,  8 Dec 2022 10:23:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670491397;
        bh=+Vg6V5z+VnhbzpPD4SOxsKlcnLC3pUvXkN0M0hWaAqQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aqSnVvjbv7FoDBQweJ2Nc2rtBHi1IwkqLJUA0es7eINh34fhflHC1AFw3ymco5Vsx
         ZdHMeE3LAGLkHW2kg790tDSm/1VpAhhyVQ01Bo3xo+L12QA+wABKYqaYCn6rBfQEvv
         fJCd9x+ASlcU3RJyH9RNqc2gnGnTmxCALGE/w3Yg=
Date:   Thu, 8 Dec 2022 11:23:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v2 1/1] media: Documentation: Interaction between routes,
 formats and selections
Message-ID: <Y5GtAmFjcaxSZ5y/@pendragon.ideasonboard.com>
References: <20221207105809.911482-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221207105809.911482-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Wed, Dec 07, 2022 at 12:58:09PM +0200, Sakari Ailus wrote:
> Document how setting up routes interacts with formats and selections.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v1:
> 
> - Rewording changes based on Tomi's comments. In particular stricter
>   separation between "stream" and "stream ID".
> 
>  .../userspace-api/media/v4l/dev-subdev.rst    | 50 ++++++++++++++-----
>  1 file changed, 37 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 5075b1828b32d..92710bb9a0caa 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -406,6 +406,8 @@ pixel array is not rectangular but cross-shaped or round. The maximum
>  size may also be smaller than the BOUNDS rectangle.
>  
>  
> +.. _format-propagation:
> +
>  Order of configuration and format propagation
>  ---------------------------------------------
>  
> @@ -507,12 +509,12 @@ source pads.
>  Streams, multiplexed media pads and internal routing
>  ----------------------------------------------------
>  
> -Commonly V4L2 subdevices support only separate video streams, that is, only a
> -single stream can pass through a media link and a media pad. Thus each pad
> -contains a format configuration for that single stream. In some cases a subdev
> -can do stream processing and split a stream into two or compose two streams
> -into one, but the inputs and outputs for the subdev are still a single stream
> -per pad.
> +Simple V4L2 subdevices do not support multiple, unrelated video streams,
> +and only a single stream can pass through a media link and a media pad.
> +Thus each pad contains a format and selection configuration for that
> +single stream. A subdev can do stream processing and split a stream into
> +two or compose two streams into one, but the inputs and outputs for the
> +subdev are still a single stream per pad.
>  
>  Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, multiple
>  data streams are transmitted on the same bus, which is represented by a media
> @@ -539,14 +541,33 @@ streams from one end of the link to the other, and subdevices have routing
>  tables which describe how the incoming streams from sink pads are routed to the
>  source pads.
>  
> -A stream ID (often just "stream") is a media link-local identifier for a stream.
> +A stream ID is a media link-local identifier for a stream.
>  In other words, a particular stream ID must exist on both sides of a media
>  link, but another stream ID can be used for the same stream at the other side
> -of the subdevice.
> +of the subdevice. The same stream ID is used to refer to the stream on
> +both pads of the link on all ioctls operating on pads.
> +
> +A stream at a specific point in the media pipeline is identified by the
> +sub-devdev and a pad ID-stream ID pair. For subdevices that do not support
> +multiplexed streams the 'stream' field is always 0.
> +
> +Interaction between routes, formats and selections

s/selections/selection rectangles/

> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The addition of routes to the V4L2 sub-device interface moves the
> +sub-device formats and selections from pads to pad ID-stream ID pairs.

This reads as "pad" "ID-stream" "ID" "pairs". Even knowing how the API
behaves, I had trouble understanding this.

> +Besides the usual pad ID, also the stream ID needs to be provided for
> +setting formats and selections.
> +
> +Instead of the sub-device wide merging of streams from all source pads
> +towards all sink pads, data flows for each route are separate from each
> +other. Any number of routes from streams on sink pads towards streams on
> +source pads is allowed, to the extent supported by drivers. For every
> +stream on a sink pad, however, only a single route is allowed.

This explains routes, not format and selection rectangles.

> -A stream at a specific point in the media pipeline is identified with the
> -subdev and a (pad, stream) pair. For subdevices that do not support
> -multiplexed streams the 'stream' is always 0.
> +Stream IDs, part of routes, are configured by using the
> +:ref:`VIDIOC_SUBDEV_S_ROUTING <VIDIOC_SUBDEV_G_ROUTING>` ioctl. This will
> +also revert the format and selection configuration to device defaults.

I don't expect someone who doesn't have detailed knowledge of the
implementation to understand what you mean here :-(

>  Configuring streams
>  ^^^^^^^^^^^^^^^^^^^
> @@ -565,8 +586,11 @@ Controller API <media_controller>`
>  setting the routing table will reset all the stream configurations in a media
>  entity.
>  
> -3) Configure streams. Each route endpoint must be configured
> -with :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>`.
> +3) Configure formats and selections. Each route is configured separately

We don't configure routes but streams, don't we ? Mentioning routes here
seems confusing to me.

> +as documented plain subdevices in :ref:`<format-propagation>`. The stream

Did you mean "as documented for plain subdevices" ?

This is the part that bothers me. I don't think we can consider the
configuration of routes to be independent in the general case. How the
formats and selection rectangle of different streams interact with each
other is what I'd like to see documented.

As this is an area that has been entirely unexplored until now as far as
I can tell, I would be fine if we wanted to merge streams support
without support for selection rectangles to start with, and experiment
with the selection API later, once we have good use cases that can be
used for design and development.

> +ID is set to the same stream ID associated with either sink or source pads
> +of routes configured using the :ref:`VIDIOC_SUBDEV_S_ROUTING
> +<VIDIOC_SUBDEV_G_ROUTING>` ioctl.
>  
>  Multiplexed streams setup example
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- 
Regards,

Laurent Pinchart
