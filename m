Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E2642B941
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 09:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238512AbhJMHhH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 03:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232458AbhJMHhH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 03:37:07 -0400
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net [IPv6:2001:888:0:108::2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA2CBC061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 00:35:03 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id aYmwmFT2Qk3b0aYmzmTKtt; Wed, 13 Oct 2021 09:35:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634110502; bh=YmWVjZWRzFG/uJWwJ3Kp2n6DkwAvCbJFW3P9arwKtZ0=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=uxMRdiAAyNVbncy0qIDIrq9CPSST6drH2ZQHLpPS23dQTFZJvTUhnRCwn+KQO4VI7
         tXrK0on5kBI/3eLk5NSZ8/FMCKVbXDbQ0RG/QR1URtonuY/Hqvl6a/S9AheCUGPOmN
         0QO2jV4wkFiOR6ch1mJhc8FZkK52zOq9zj/9pdrwy1HTElhUVYbfoQlWdKwK3o4X15
         NXsuWE5fRIClnhsWLDXC9QY/3Ry0Wl0g2GGza+tjTbvmTHuK+R2O44TnwybD6nUr/S
         +Ld5hlAksODPV9keQ5aI6cKNXd3sBycrMcxjN5ULUS4sn4VWdqi16LNxxGb8ozOjai
         oK3vZ16N3IvhQ==
Subject: Re: [PATCH v9 36/36] media: subdev: add v4l2_routing_simple_verify()
 helper
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-37-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <1884ad39-eb44-856e-da45-39c1dd83c35d@xs4all.nl>
Date:   Wed, 13 Oct 2021 09:34:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-37-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFpLKdevCIx6X1KS0I+50iepIVp7LEoUhJKd4NN4uNpD8nUo7I3HiFYA7XPM6ZwoIwQ4EDzvb61XH0my+tJ+1KfN0kU7UaCb9DQMktFWnKSeXgPZiI0k
 pl/0AzOaGuT+3+1v5jKBnpiHj2E5F4xpNyISwEtapDgh7QcPyR/E3MAA/QLefYd/bDr+zff0JTUVtbJ5q36hQRz2GSCMKxm46ncCrCC1jFqzKZga9BH2Eub5
 RjuqM4e0+zosF8mqCMNPIC1k5WEL2TYOyezqv5UIom5bxmz3aw3Ak3ZPbu3vvB+FgME8rh8bzMfB00cxE+1jtjRBga63JUY6N8kJ/c4At13a9FTsfj91+KlX
 KuD7Kp97XRtd1SVVb26pIcDXdxXHBRVJJa9tQW/KF4NsV/D7chiRpMOjkal/o7ijPzVtChLmxNCnaM38JBVKEwOR6/yBZMV0ZnQ73oQtCX77wRncj+AvIOR3
 Q3sDlo0UvFTiOTiAE9v81odii+UN8stL5W9eNg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> Add a helper for verifying routing for the common case of
> non-overlapping 1-to-1 streams.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 24 ++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 14 ++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 22a9bea0fa85..2a64ff003e4b 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1569,3 +1569,27 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
> +
> +int v4l2_routing_simple_verify(const struct v4l2_subdev_krouting *routing)
> +{
> +	unsigned int i, j;
> +
> +	for (i = 0; i < routing->num_routes; ++i) {
> +		const struct v4l2_subdev_route *route = &routing->routes[i];
> +
> +		for (j = i + 1; j < routing->num_routes; ++j) {
> +			const struct v4l2_subdev_route *r = &routing->routes[j];
> +
> +			if (route->sink_pad == r->sink_pad &&
> +			    route->sink_stream == r->sink_stream)
> +				return -EINVAL;
> +
> +			if (route->source_pad == r->source_pad &&
> +			    route->source_stream == r->source_stream)
> +				return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_routing_simple_verify);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 1a4df0aafe8a..5e50f2ded653 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1565,4 +1565,18 @@ v4l2_state_get_opposite_stream_format(struct v4l2_subdev_state *state, u32 pad,
>  int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format);
>  
> +/**
> + * v4l2_routing_simple_verify() - Verify that all streams are non-overlapping
> + *				  1-to-1 streams
> + * @routing: routing to verify
> + *
> + * This verifies that the given routing contains only non-overlapping 1-to-1
> + * streams. In other words, no two streams have the same source or sink
> + * stream ID on a single pad. This is the most common case of routing
> + * supported by devices.
> + *
> + * Returns 0 on success, error value otherwise.
> + */
> +int v4l2_routing_simple_verify(const struct v4l2_subdev_krouting *routing);
> +
>  #endif
> 

