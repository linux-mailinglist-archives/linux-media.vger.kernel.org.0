Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50096633163
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 01:36:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbiKVAgI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Nov 2022 19:36:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiKVAgG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Nov 2022 19:36:06 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EEEC6972
        for <linux-media@vger.kernel.org>; Mon, 21 Nov 2022 16:36:05 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5298E88F;
        Tue, 22 Nov 2022 01:36:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669077363;
        bh=orWK0Bo2WGn8GVjSoxAYIlHSXtIoc9aAKiQluEASgsI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=v9vpdus1hB2dM6GslgUcNGG5/gf9qr1ENmUtmpo2dcXCZgPQRnnV/Uw8DOzhvKXxQ
         Jdwrb5VtJbs2wWOp50/MXWflN3JK7+2Sz4fEzbVKJ56bhzy4PBIvsl3zFuxJIX8Vnq
         9jSIu4/uSTH6erBOTNvFaV75QcEB3xF5VZ5KPpgc=
Date:   Tue, 22 Nov 2022 02:35:48 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 1/1] v4l: subdev: Warn if disabling streaming failed,
 return success
Message-ID: <Y3wZZM/fl/lbBcaT@pendragon.ideasonboard.com>
References: <20221026065123.595777-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221026065123.595777-1-sakari.ailus@linux.intel.com>
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

On Wed, Oct 26, 2022 at 09:51:23AM +0300, Sakari Ailus wrote:
> Complain in the newly added s_stream video op wrapper if disabling
> streaming failed. Also return zero in this case as there's nothing the
> caller can do to return the error.
> 
> This way drivers also won't need to bother with printing error messages.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 15 +++++++++++++++
>  include/media/v4l2-subdev.h           |  6 ++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 5c27bac772ea4..8a4ca2bd1584d 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -318,6 +318,20 @@ static int call_get_mbus_config(struct v4l2_subdev *sd, unsigned int pad,
>  	       sd->ops->pad->get_mbus_config(sd, pad, config);
>  }
>  
> +static int call_s_stream(struct v4l2_subdev *sd, int enable)
> +{
> +	int ret;
> +
> +	ret = sd->ops->video->s_stream(sd, enable);
> +
> +	if (!enable && ret < 0) {
> +		dev_warn(sd->dev, "disabling streaming failed (%d)\n", ret);
> +		return 0;
> +	}
> +
> +	return ret;
> +}
> +
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  /*
>   * Create state-management wrapper for pad ops dealing with subdev state. The
> @@ -377,6 +391,7 @@ static const struct v4l2_subdev_pad_ops v4l2_subdev_call_pad_wrappers = {
>  static const struct v4l2_subdev_video_ops v4l2_subdev_call_video_wrappers = {
>  	.g_frame_interval	= call_g_frame_interval,
>  	.s_frame_interval	= call_s_frame_interval,
> +	.s_stream		= call_s_stream,
>  };
>  
>  const struct v4l2_subdev_ops v4l2_subdev_call_wrappers = {
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 54566d139da79..b15fa9930f30c 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -440,8 +440,10 @@ enum v4l2_subdev_pre_streamon_flags {
>   * @g_input_status: get input status. Same as the status field in the
>   *	&struct v4l2_input
>   *
> - * @s_stream: used to notify the driver that a video stream will start or has
> - *	stopped.
> + * @s_stream: start (enabled == 1) or stop (enabled == 0) streaming on the
> + *	sub-device. Failure on stop will remove any resources acquired in
> + *	streaming start, while the error code is still returned by the driver.
> + *	Also see call_s_stream wrapper in v4l2-subdev.c.
>   *
>   * @g_pixelaspect: callback to return the pixelaspect ratio.
>   *

-- 
Regards,

Laurent Pinchart
