Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51FAD665D4F
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 15:09:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234614AbjAKOJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 09:09:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234013AbjAKOJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 09:09:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018BC270
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 06:09:05 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A84304DD;
        Wed, 11 Jan 2023 15:09:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673446143;
        bh=3+aW0npNIzDJDU+iADwu31j7qfH7/zIQMfmCqMkVXM8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=DC+wVeXwE/IhXwtRX4lrl2Yp6A1NY8Vr2HtwmaBgI8BvKb5t7RmSxxP4iNAedEkKP
         Zo2A998nGijk7IOHFKOL4gevI1I5jEC929e8G+OQjXC1w0KxND9HeIXcgTIXCst3oy
         tAM/bPe+Ms7Q2zBGDVnc8yvaF+ZN731zvgYg4Z3I=
Message-ID: <fa887a38-8551-16bb-fa34-3e3b3f6b02dc@ideasonboard.com>
Date:   Wed, 11 Jan 2023 16:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/1] media: Documentation: Update documentation for
 streams
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20221215121634.287100-1-tomi.valkeinen@ideasonboard.com>
 <20230111110920.2004227-1-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230111110920.2004227-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 11/01/2023 13:09, Sakari Ailus wrote:
> Document how streams interacts with formats and selections.
> 
> Update documentation in respect to what is allowed, in particular streams
> are only supported via full routes, source-only routes are not supported
> right now.
> 
> The centerpiece of the API additions are streams. Albeit routes are
> configured via S_ROUTING IOCTL that also declares streams, it is streams
> that are accessed through other APIs. Thus refer to streams instead of
> routes in documentation.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v1:
> 
> - Address Tomi's comments:
> 
>    - Fix wrong terms (sink vs. source, others)
> 
>    - Align subdev, subdevice to sub-device consistently
> 
>    - Improve wording in a number of places
> 
>    - Rebase on plain v16 streams set (i.e. not additional patches in between)
> 
>    - Drop a few redundant sentences
> 
>    See: <URL:https://lore.kernel.org/linux-media/Y76SpkZTxtPvpXtU@paasikivi.fi.intel.com/T/#me8bb137ec1bc7fb20efe8042be04b40753928f1d>
> 
>   .../userspace-api/media/v4l/dev-subdev.rst    | 74 +++++++++++++------
>   1 file changed, 51 insertions(+), 23 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 7d1b8ebd4e173..cf720a257a9bb 100644
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
> +Simple V4L2 subdevices do not support multiple, unrelated video streams,
> +and only a single stream can pass through a media link and a media pad.
> +Thus each pad contains a format and selection configuration for that
> +single stream. A subdev can do stream processing and split a stream into
> +two or compose two streams into one, but the inputs and outputs for the
> +subdev are still a single stream per pad.
>   
>   Some hardware, e.g. MIPI CSI-2, support multiplexed streams, that is, multiple
>   data streams are transmitted on the same bus, which is represented by a media
> @@ -539,14 +541,35 @@ streams from one end of the link to the other, and subdevices have routing
>   tables which describe how the incoming streams from sink pads are routed to the
>   source pads.
>   
> -A stream ID (often just "stream") is a media link-local identifier for a stream.
> -In other words, a particular stream ID must exist on both sides of a media
> +A stream ID is a media pad-local identifier for a stream. Streams IDs of
> +the same stream must be equal on both ends of a link. In other words,
> +a particular stream ID must exist on both sides of a media
>   link, but another stream ID can be used for the same stream at the other side
> -of the subdevice.
> +of the subdevice. The same stream ID is used to refer to the stream on
> +both pads of the link on all ioctls operating on pads.
> +
> +A stream at a specific point in the media pipeline is identified by the
> +sub-devdev and a (pad, stream) pair. For subdevices that do not support

"sub-devdev". Also, you have "subdevice" (also in other places in the 
text), not "sub-device".

Other than that, looks fine:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

