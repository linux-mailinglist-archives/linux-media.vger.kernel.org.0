Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1B342B921
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 09:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238358AbhJMHcn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 03:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232284AbhJMHcm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 03:32:42 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1A6C061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 00:30:39 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id aYigmFQwnk3b0aYijmTJwk; Wed, 13 Oct 2021 09:30:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634110238; bh=7V8lBiO+Ly7eNryQmci0Q5ot0HTeFdj6+PK5G+v+yEE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NwX50KXGs24a5BOo3gE7RFGMEZ9oW7loLFWfFC0JZHIpb8U/70gOQ+M5R3N0sqgOT
         o85mrhrkWZU5ZpzOmCysgaqHjkwzWYtDRaMYZ2se1p9DQBnpOABYyIu5RWAnwhvEl/
         XK7eXC/yzmTu37s/HKBP2aRxYzMc5PrMEjwV099tperC1VTCWVtTU3Cv1U+blCu2NB
         rqCkH093WVV+1vm1HkI6SBCf/xptjLkUCDTzc91oIVKjKY7ogoZbv0DP4Oko6j1+fb
         QWK1NGWw3fn3j+J5GKhe5ZyNmy+YdSPB2KED9+s9Yl4vEcumuNfSHqvdhYbQZfrqkx
         GNqOO8MTzQccA==
Subject: Re: [PATCH v9 33/36] media: subdev: add "opposite" stream helper
 funcs
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-34-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <d488ad71-fd13-4961-8dc2-2bd20a58cc46@xs4all.nl>
Date:   Wed, 13 Oct 2021 09:30:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-34-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGXbeUOMZz3VQLJIS0VekLsoJNKXrzibsacPYYffKHpDvtIvrXQLIw1/2r1WUhr/ZCR82VpMjOzY6w98UUoo8LEgmL2cXGFV89E7G8OpWM3LHCFRklgX
 XiKMxFNGLOXHvuAtmJwsyt5E1pL36/XzQwBFRym0jwxxwaGENupA9j03I7o4vtbdSrzD8kd1gWYMhZ4w83UXAwROrxY1T3fPs9x/cHpAYj2/gLtAVVF0n+Qo
 TFYsGcJh6aH44lwhjwILDakwW5qb8YrJ5EQRUEVjCSrywPiuPMHsLLQGHtBHYeiQUxVINcaMYRwp+UodEc+TPkH/7jWlpmL9VK4PPbBo5s/lswyDU+16tc08
 XTCSHlOLIyXHAWQQDuHgf1XBiIuKzKqneGgNETaUtJ8A6g2uxobnrUB2iU0rcB4C3lnWBiIIlxLxcMrB9jRpCE8UNuW6527SY4vET30cUFGQOmdtHZUnPZCu
 RuRouQgwzd0mIw6rRmcGmwrcZ8DnsTbuwzF59Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> Add two helper functions to make dealing with streams easier:
> 
> v4l2_state_find_opposite_end - given a routing table and a pad + stream,
> return the pad + stream on the opposite side of the subdev.
> 
> v4l2_state_get_opposite_stream_format - return a pointer to the format
> on the pad + stream on the opposite side from the given pad + stream.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 42 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 32 ++++++++++++++++++++
>  2 files changed, 74 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 37e2e1f907fc..9eeadad997c8 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1484,3 +1484,45 @@ v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
>  	return NULL;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_state_get_stream_format);
> +
> +int v4l2_state_find_opposite_end(struct v4l2_subdev_krouting *routing, u32 pad,
> +				 u32 stream, u32 *other_pad, u32 *other_stream)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		struct v4l2_subdev_route *route = &routing->routes[i];
> +
> +		if (route->source_pad == pad &&
> +		    route->source_stream == stream) {
> +			*other_pad = route->sink_pad;
> +			*other_stream = route->sink_stream;
> +			return 0;
> +		}
> +
> +		if (route->sink_pad == pad && route->sink_stream == stream) {
> +			*other_pad = route->source_pad;
> +			*other_stream = route->source_stream;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_state_find_opposite_end);
> +
> +struct v4l2_mbus_framefmt *
> +v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
> +				      u32 stream)
> +{
> +	u32 other_pad, other_stream;
> +	int ret;
> +
> +	ret = v4l2_state_find_opposite_end(&state->routing, pad, stream,
> +					   &other_pad, &other_stream);
> +	if (ret)
> +		return NULL;
> +
> +	return v4l2_state_get_stream_format(state, other_pad, other_stream);
> +}
> +EXPORT_SYMBOL_GPL(v4l2_state_get_opposite_stream_format);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 1dc824416c1b..4b9520410783 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1501,4 +1501,36 @@ struct v4l2_mbus_framefmt *
>  v4l2_state_get_stream_format(struct v4l2_subdev_state *state, unsigned int pad,
>  			     u32 stream);
>  
> +/**
> + * v4l2_state_find_opposite_end() - Find the opposite stream
> + * @routing: routing used to find the opposite side
> + * @pad: pad id
> + * @stream: stream id
> + * @other_pad: pointer used to return the opposite pad
> + * @other_stream: pointer used to return the opposite stream
> + *
> + * This function uses the routing table to find the pad + stream which is
> + * opposite the given pad + stream.
> + *
> + * Returns 0 on success, or -EINVAL if no matching route is found.
> + */
> +int v4l2_state_find_opposite_end(struct v4l2_subdev_krouting *routing, u32 pad,
> +				 u32 stream, u32 *other_pad, u32 *other_stream);
> +
> +/**
> + * v4l2_state_get_opposite_stream_format() - Get pointer to opposite stream
> + *					     format
> + * @state: subdevice state
> + * @pad: pad id
> + * @stream: stream id
> + *
> + * This returns a pointer to &struct v4l2_mbus_framefmt for the pad + stream
> + * that is opposite the given pad + stream in the subdev state.
> + *
> + * If the state does not contain the given pad + stream, NULL is returned.
> + */
> +struct v4l2_mbus_framefmt *
> +v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
> +				      u32 stream);
> +
>  #endif
> 

