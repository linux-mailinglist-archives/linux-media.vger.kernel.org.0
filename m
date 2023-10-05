Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5067B9DE0
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 15:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231635AbjJEN4b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 09:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239897AbjJENyx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 09:54:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F092754D
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 06:12:06 -0700 (PDT)
Received: from [192.168.88.20] (91-157-153-81.elisa-laajakaista.fi [91.157.153.81])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0BF9D8C2;
        Thu,  5 Oct 2023 15:10:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696511417;
        bh=6GCZF2FRUB54pML2jE6QUxYRnnYrv5b1Ss2VrcwIaF8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=R+Lm7rD4kLhYZZmL6RKo8oAOiQCB/uYdb4+DtBt7jHxCRihWpFi9iZi+kGcHRxt0n
         LLWAFXWfzLE0Xpusj3WiLTMAsrFuNJ43Ax4pL1I2Bdi3Rfr41FEdGp2RDlDaqI4H4h
         nz1HjHr8g8aXGoCiaO1bhvyYiDajb/jVW7x9kMKs=
Message-ID: <8e843fa6-ac89-9c53-2a69-55e2bb82d928@ideasonboard.com>
Date:   Thu, 5 Oct 2023 16:12:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 12/28] media: v4l: subdev: Add helpers for format, crop
 and compose pointers
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003120813.77726-3-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20231003120813.77726-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/10/2023 15:07, Sakari Ailus wrote:
> Add a helper for obtaining format, crop and compose pointers. These are
> convenient for drivers, independently of the driver uses streams or not.

If we go with these, should we deprecate 
v4l2_subdev_state_get_stream_format() and v4l2_subdev_get_pad_format()?

Having three different ways to get the fmt seems a bit excessive.

Should we add 'num_pads' to the state? That would remove the need pass 
the subdevice to these functions.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   drivers/media/v4l2-core/v4l2-subdev.c | 54 ++++++++++++++++++++++----
>   include/media/v4l2-subdev.h           | 56 +++++++++++++++++++++++++++
>   2 files changed, 102 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index d295a4e87b66..854f9d4db923 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1573,19 +1573,57 @@ v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs *stream_config
>   	return 0;
>   }
>   
> +struct v4l2_mbus_framefmt
> +*v4l2_subdev_get_fmt_ptr(struct v4l2_subdev *sd,
> +			 struct v4l2_subdev_state *state, unsigned int pad,
> +			 unsigned int stream)
> +{
> +	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
> +		return v4l2_subdev_state_get_stream_format(state, pad, stream);
> +
> +	if (pad < sd->entity.num_pads && stream == 0)
> +		return v4l2_subdev_get_pad_format(sd, state, pad);
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt_ptr);
> +
> +struct v4l2_rect
> +*v4l2_subdev_get_crop_ptr(struct v4l2_subdev *sd,
> +			  struct v4l2_subdev_state *state, unsigned int pad,
> +			  unsigned int stream)
> +{
> +	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
> +		return v4l2_subdev_state_get_stream_crop(state, pad, stream);
> +
> +	if (pad < sd->entity.num_pads && stream == 0)
> +		return v4l2_subdev_get_pad_crop(sd, state, pad);
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_crop_ptr);
> +
> +struct v4l2_rect
> +*v4l2_subdev_get_compose_ptr(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state, unsigned int pad,
> +			     unsigned int stream)
> +{
> +	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
> +		return v4l2_subdev_state_get_stream_compose(state, pad, stream);
> +
> +	if (pad < sd->entity.num_pads && stream == 0)
> +		return v4l2_subdev_get_pad_compose(sd, state, pad);
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_compose_ptr);
> +
>   int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>   			struct v4l2_subdev_format *format)
>   {
>   	struct v4l2_mbus_framefmt *fmt;
>   
> -	if (sd->flags & V4L2_SUBDEV_FL_STREAMS)
> -		fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
> -							  format->stream);
> -	else if (format->pad < sd->entity.num_pads && format->stream == 0)
> -		fmt = v4l2_subdev_get_pad_format(sd, state, format->pad);
> -	else
> -		fmt = NULL;
> -
> +	fmt = v4l2_subdev_get_fmt_ptr(sd, state, format->pad, format->stream);
>   	if (!fmt)
>   		return -EINVAL;
>   
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 5f59ff0796b7..7c34243ffed9 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1479,6 +1479,62 @@ v4l2_subdev_lock_and_get_active_state(struct v4l2_subdev *sd)
>   
>   #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>   
> +/**
> + * v4l2_subdev_get_fmt_ptr - Obtain a pointer to V4L2 sub-device format for pad
> + *			     and stream
> + * @sd: subdevice
> + * @state: subdevice state
> + * @pad: the pad on the sub-device
> + * @stream: stream in the pad
> + *
> + * For given pad and stream, obtain a pointer to the mbus format from the
> + * sub-device.
> + *
> + * Returns NULL if the format is not found or the parameters are invalid.
> + */
> +struct v4l2_mbus_framefmt *
> +v4l2_subdev_get_fmt_ptr(struct v4l2_subdev *sd,
> +			struct v4l2_subdev_state *state, unsigned int pad,
> +			unsigned int stream);
> +
> +/**
> + * v4l2_subdev_get_crop_ptr - Obtain a pointer to V4L2 sub-device crop
> + *			      rectangle for pad and stream
> + * @sd: subdevice
> + * @state: subdevice state
> + * @pad: the pad on the sub-device
> + * @stream: stream in the pad
> + *
> + * For given pad and stream, obtain a pointer to the crop selection rectangle
> + * from the sub-device.
> + *
> + * Returns NULL if the selection rectangle is not found or the parameters are
> + * invalid.
> + */
> +struct v4l2_rect *
> +v4l2_subdev_get_crop_ptr(struct v4l2_subdev *sd,
> +			 struct v4l2_subdev_state *state, unsigned int pad,
> +			 unsigned int stream);
> +
> +/**
> + * v4l2_subdev_get_compose_ptr - Obtain a pointer to V4L2 sub-device compose
> + *				 rectangle for pad and stream
> + * @sd: subdevice
> + * @state: subdevice state
> + * @pad: the pad on the sub-device
> + * @stream: stream in the pad
> + *
> + * For given pad and stream, obtain a pointer to the compose selection rectangle
> + * from the sub-device.
> + *
> + * Returns NULL if the selection rectangle is not found or the parameters are
> + * invalid.
> + */
> +struct v4l2_rect *
> +v4l2_subdev_get_compose_ptr(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state, unsigned int pad,
> +			    unsigned int stream);
> +
>   /**
>    * v4l2_subdev_get_fmt() - Fill format based on state
>    * @sd: subdevice

