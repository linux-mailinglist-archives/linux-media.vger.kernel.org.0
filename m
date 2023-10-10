Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8CB57BFD96
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 15:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232190AbjJJNfb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 09:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231897AbjJJNfa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 09:35:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93DA4CC
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 06:35:26 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1B8A3D6;
        Tue, 10 Oct 2023 15:35:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696944921;
        bh=uJi/Jy9Bl8nP9sI0N/MntCYtUXrJ09EOaQZeTKBDV30=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=foMzobtTqXs0D+elHHyiB00P4SbL3G13vuRJ/TNGftdV2Ef58t84lQPiWa1z3QWyA
         Tm4w7QRi8d43MSiihMOAyaHOfHfAS2NX4Nv3czvenVNqTxOM6sDhHiu3pyBks0aYoi
         Spvwt6jpmhbU0IbgVMBbUMZkle2pv9g+DmpIIQ/w=
Date:   Tue, 10 Oct 2023 16:35:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Dennis Bonke <admin@dennisbonke.com>
Subject: Re: [PATCH] media: subdev: Don't report V4L2_SUBDEV_CAP_STREAMS when
 the streams API is disabled
Message-ID: <20231010133529.GO5121@pendragon.ideasonboard.com>
References: <20231010102458.111227-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231010102458.111227-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Tue, Oct 10, 2023 at 12:24:58PM +0200, Hans de Goede wrote:
> Since the stream API is still experimental it is currently locked away
> behind the internal, default disabled, v4l2_subdev_enable_streams_api flag.
> 
> Advertising V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
> confuses userspace. E.g. it causes the following libcamera error:
> 
> ERROR SimplePipeline simple.cpp:1497 Failed to reset routes for
>   /dev/v4l-subdev1: Inappropriate ioctl for device
> 
> Don't report V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
> to avoid problems like this.
> 
> Reported-by: Dennis Bonke <admin@dennisbonke.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> -Clearing the V4L2_SUBDEV_FL_STREAMS flag from sd.flags might seem
>  appealing as an alternative fix. But this causes various v4l2-core bits
>  to enter different code paths which confuses drivers which set
>  V4L2_SUBDEV_FL_STREAMS, so this is a bad idea.
> -No Closes: for the Reported-by since this was reported by private email
> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index b92348ad61f6..31752c06d1f0 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -502,6 +502,13 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>  				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
>  	int rval;
>  
> +	/*
> +	 * If the streams API is not enabled, remove V4L2_SUBDEV_CAP_STREAMS.
> +	 * Remove this when the API is no longer experimental.
> +	 */
> +	if (!v4l2_subdev_enable_streams_api)
> +		streams_subdev = false;
> +
>  	switch (cmd) {
>  	case VIDIOC_SUBDEV_QUERYCAP: {
>  		struct v4l2_subdev_capability *cap = arg;

-- 
Regards,

Laurent Pinchart
