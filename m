Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4673342B925
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 09:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238385AbhJMHeJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 03:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232424AbhJMHeJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 03:34:09 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51091C061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 00:32:06 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id aYk5mFRcTk3b0aYk8mTKFh; Wed, 13 Oct 2021 09:32:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634110324; bh=IIQUKwEPesYQISOro7NPFnNrYAIeUPN0fmSmOn/oZ1A=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=A3lJgv4o0ha3r9V+PwrQGoTKc4GjNv+bMNjCMqwetcR46Z7V0aeL1kayi1RRMDdD/
         4RBpBt35dwUROfkPsFDwWMgaG/MtvG0qHOIgcQAQeaSI75sCVlV912wk1DCw/X3Rqf
         cmGaPLH1/rTpezuFTCu+0ya0Ae3BaTnUMtK6QS0RZK+fY89Ry9Ty6kR7vV2NdOYqnf
         HxrjgD+GlSjGKhyCCMJgP4+6K00I3fNqqe5rvs/3/gdZwsL5kfamnF9cyzpWolTqlm
         sMFxKe5eBwPeyCU/nieveTUn1xOTpaO9jBgg1EY/f14VN6YxIuttDgF7AopPmkmeLA
         Otc+ZRwm2JbpA==
Subject: Re: [PATCH v9 34/36] media: subdev: add v4l2_subdev_get_fmt() helper
 function
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-35-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e2a7cd65-7231-771c-44dd-181399abcecb@xs4all.nl>
Date:   Wed, 13 Oct 2021 09:32:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-35-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfL3yc3TXgfRbuRyOhVRF4ZZ/D5X/m+HYv6xPTY2lRI1iGKPfg8PHBNTb10LmKIwEZaGHwBcHuqcjzlOaXFxy9m+RRgSbm3dZjqLqOkZ3cN5V2iFAbDa+
 z3OG9neiHyAcSZESLw3lIHNHUqDIWX6rLkpKbZ0w7lkSFTTeG4VrI+2pGRNcFgYC330+LOn9g8D6VHMKwBp6iQyqYCx0lARwUSIp1eEnC+X9I9mouf9jn5L/
 pZeXeNDXIJjWqAvOvhgeOjjlhQgcZyVBgCy9g6fNZzZ9fdK4h2cY3FMvbEZ/za3EGeRwoJKijxm+UrEtxz/c9fyHQez8qh8djAC0FOF8S6TZk6nodrqdyaDR
 YCUhqVdbquXimqmmJvmK6qbWYfiEDdv4fSjLT7yOvZjWcRCYZiY+4FLXsNpP8iC4iqeSEUB15tAUE0bo41VlxVNvDZiBjZlajpJO/Y1KzdFgzbJGUjbmkPB8
 EGrjAXEEyv1GdVfeTn+Xbs1L/AC4Gno/i4k2gA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> Add v4l2_subdev_get_fmt() helper function which implements
> v4l2_subdev_pad_ops.get_fmt using streams. Subdev drivers that do not
> need to do anything special in their get_fmt op can use this helper
> directly for v4l2_subdev_pad_ops.get_fmt.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 21 +++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 16 ++++++++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 9eeadad997c8..d402ffeef560 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1526,3 +1526,24 @@ v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
>  	return v4l2_state_get_stream_format(state, other_pad, other_stream);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_state_get_opposite_stream_format);
> +
> +int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> +			struct v4l2_subdev_format *format)
> +{
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	v4l2_subdev_lock_state(state);
> +
> +	fmt = v4l2_state_get_stream_format(state, format->pad, format->stream);
> +	if (!fmt) {
> +		v4l2_subdev_unlock_state(state);
> +		return -EINVAL;
> +	}
> +
> +	format->format = *fmt;
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 4b9520410783..04fca595aa91 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1532,5 +1532,21 @@ int v4l2_state_find_opposite_end(struct v4l2_subdev_krouting *routing, u32 pad,
>  struct v4l2_mbus_framefmt *
>  v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
>  				      u32 stream);
> +/**
> + * v4l2_subdev_get_fmt() - Fill format based on state
> + * @sd: subdevice
> + * @state: subdevice state
> + * @format: pointer to &struct v4l2_subdev_format
> + *
> + * Fill @format based on the pad and stream given in the @format struct.
> + *
> + * This function can be used by the subdev drivers to implement
> + * v4l2_subdev_pad_ops.get_fmt if the subdev driver does not need to do
> + * anything special in their get_fmt op.
> + *
> + * Returns 0 on success, error value otherwise.
> + */
> +int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
> +			struct v4l2_subdev_format *format);
>  
>  #endif
> 

