Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4C242B926
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 09:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238401AbhJMHes (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 03:34:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbhJMHes (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 03:34:48 -0400
Received: from lb1-smtp-cloud7.xs4all.net (lb1-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1B2C061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 00:32:44 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id aYkimFRvKk3b0aYklmTKMi; Wed, 13 Oct 2021 09:32:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634110363; bh=u3NTS2SL91N2QL+kRMmdKp0g/7D9kiJnjPzOBHo/KNA=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fPkd2JRIuUT3v7yyCMvBYohLuXd9iV7KPkNKWV1jzjWdYE6AJP03a83ECcZJE6RVG
         omKa7cGdH1OOSGhbCjmiDm9aLvYgiNpuxP0DT+uyynYahxLlsnWysOM7yaBfqbVHS2
         61waQuQrz44rPZzcbPm7g3UOV/+V+ON0ksS8HW96uQoe8i8ODtvaMty6HNPy1K+Q9X
         dSNdJQp3EnkODbyeLKyiAlGWLfy0puepl8je/OPCAm7P8/ZJx4FmfkSClYmLhIV/97
         A++V6tSg0bIQYdTMu4r9hadUDAA0ib3ewGQDo0RiF9g3hxDnIVXcuhCwHPKtwdFmXz
         DlhirS1CtmC2Q==
Subject: Re: [PATCH v9 35/36] media: subdev: add
 v4l2_subdev_set_routing_with_fmt() helper
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-36-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1bfb9d78-b0bf-07cc-9a28-b9188bab9c54@xs4all.nl>
Date:   Wed, 13 Oct 2021 09:32:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-36-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfIK0xhV9Mv5mOUTXBB3fh6fvJ8Q5PlyyCpSj+UQkkpMI6pEXHtQOkm6dBHKAHgPclrBFtcyO21aqO44eJJHDF1l+1HCbYEoWfYtyXlBBZZ+oto4Izoxp
 AWMtkSkhVf/w+QDaZQDSUbpHlFyEZVwKZzRRPRW+m1t0Kr9KoAjWgUfZe3QpbToDCC2IK8L9BEIfSrQIqZUJ9YolQR3XMyt9tvx+gjSYWvWj+LdaaB/y4ccv
 lNqq+//7CgP4SkzFy6aXAeloXKR1tX3IEukRwUAGnjvyfPESj85IJPjo4IyKXE45Xvg60orW1RM0/rXLA3Bau2bdviDFfkjyCEp054RRxu+tqrlV6XCxJDn/
 nk6hZvBodV49s4cJg+oOYK0X9ZjEVJDx9sdYPQD5tMiOc80sTVpClgs+WvYJsAdwFw523yGXmtnsvAfKN+SpaXgT4HgrWF4dhjhj2aLSLax2T8HmyZwJcB8f
 IUzFpJZ2OIJMZ1vPqKzDUCg6XQgqazc6/XbKQA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> v4l2_subdev_set_routing_with_fmt() is the same as
> v4l2_subdev_set_routing(), but additionally initializes all the streams
> with the given format.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 22 ++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 16 ++++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index d402ffeef560..22a9bea0fa85 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1464,6 +1464,28 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
>  
> +int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_state *state,
> +				     struct v4l2_subdev_krouting *routing,
> +				     const struct v4l2_mbus_framefmt *fmt)
> +{
> +	struct v4l2_subdev_stream_configs *stream_configs;
> +	unsigned int i;
> +	int ret;
> +
> +	ret = v4l2_subdev_set_routing(sd, state, routing);
> +	if (ret)
> +		return ret;
> +
> +	stream_configs = &state->stream_configs;
> +
> +	for (i = 0; i < stream_configs->num_configs; ++i)
> +		stream_configs->configs[i].fmt = *fmt;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing_with_fmt);
> +
>  struct v4l2_mbus_framefmt *
>  v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
>  			     u32 stream)
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 04fca595aa91..1a4df0aafe8a 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1486,6 +1486,22 @@ int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
>  			    struct v4l2_subdev_state *state,
>  			    struct v4l2_subdev_krouting *routing);
>  
> +/**
> + * v4l2_subdev_set_routing_with_fmt() - Set given routing and format to subdev
> + *					state
> + * @sd: The subdevice
> + * @state: The subdevice state
> + * @routing: Routing that will be copied to subdev state
> + * @fmt: Format used to initialize all the streams
> + *
> + * This is the same as v4l2_subdev_set_routing, but additionally initializes
> + * all the streams using the given format.
> + */
> +int v4l2_subdev_set_routing_with_fmt(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_state *state,
> +				     struct v4l2_subdev_krouting *routing,
> +				     const struct v4l2_mbus_framefmt *fmt);
> +
>  /**
>   * v4l2_state_get_stream_format() - Get pointer to a stream format
>   * @state: subdevice state
> 

