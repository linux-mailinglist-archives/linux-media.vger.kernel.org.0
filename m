Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC8CF66B219
	for <lists+linux-media@lfdr.de>; Sun, 15 Jan 2023 16:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbjAOPe0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Jan 2023 10:34:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbjAOPeZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Jan 2023 10:34:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60439C155;
        Sun, 15 Jan 2023 07:34:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3F87B308;
        Sun, 15 Jan 2023 16:34:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673796861;
        bh=NPaHlaCZ3kg5D6MILrq3NsKFAl4FVRtyIW7lDfO2GXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SoGvovUw2HYyMIxcke07KUUyZQbstYObd+Oj8Nh3QeCAkH6BIbuVdHXxij6Evmxco
         by5NDGSJpBVtS+zzE1L28DiBDXtqgj23Yu543baThrBlSDoC3y0w2xnl0B5baekX3D
         APUM8sPwZpkaBRdvuM7cE/Ti1hTIRcYx4fCKrUfM=
Date:   Sun, 15 Jan 2023 17:34:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH v16.1] media: subdev: Require code change to enable
 [GS]_ROUTING
Message-ID: <Y8Qc/TPLdzz6bL5b@pendragon.ideasonboard.com>
References: <20221215121634.287100-7-tomi.valkeinen@ideasonboard.com>
 <20230115124008.293634-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230115124008.293634-1-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Sun, Jan 15, 2023 at 02:40:08PM +0200, Tomi Valkeinen wrote:
> Streams API is an experimental feature. To use Streams API, the user

Nitpicking, I'd write "The Streams API" and "To use the Streams API".

I'm sure Sakari can handle this in the second version of the pull
request.

> needs to change a variable in v4l2-subdev.c and recompile the kernel.
> 
> This commit should be reverted when the Streams API is deemed ready for
> production use.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Here's a minor update to the patch:
> - Fix unused var warning
> - Don't initialize the static var to 0
> 
>  drivers/media/v4l2-core/v4l2-subdev.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 61b429016a2f..a576b22164b0 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -23,6 +23,15 @@
>  #include <media/v4l2-fh.h>
>  #include <media/v4l2-ioctl.h>
>  
> +#if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> +/*
> + * Streams API is an experimental feature. To use Streams API, set
> + * 'v4l2_subdev_enable_streams_api' to 1 below.
> + */
> +
> +static bool v4l2_subdev_enable_streams_api;
> +#endif
> +
>  /*
>   * Maximum stream ID is 63 for now, as we use u64 bitmask to represent a set
>   * of streams.
> @@ -751,6 +760,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		struct v4l2_subdev_routing *routing = arg;
>  		struct v4l2_subdev_krouting *krouting;
>  
> +		if (!v4l2_subdev_enable_streams_api)
> +			return -ENOIOCTLCMD;
> +
>  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>  			return -ENOIOCTLCMD;
>  
> @@ -778,6 +790,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  		struct v4l2_subdev_krouting krouting = {};
>  		unsigned int i;
>  
> +		if (!v4l2_subdev_enable_streams_api)
> +			return -ENOIOCTLCMD;
> +
>  		if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>  			return -ENOIOCTLCMD;
>  

-- 
Regards,

Laurent Pinchart
