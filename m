Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD4B642A7E8
	for <lists+linux-media@lfdr.de>; Tue, 12 Oct 2021 17:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237374AbhJLPJX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 11:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232568AbhJLPJW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 11:09:22 -0400
Received: from lb2-smtp-cloud8.xs4all.net (lb2-smtp-cloud8.xs4all.net [IPv6:2001:888:0:108::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97CC7C061570
        for <linux-media@vger.kernel.org>; Tue, 12 Oct 2021 08:07:20 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aJN5msfUzx7rIaJN8mMRpV; Tue, 12 Oct 2021 17:07:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634051239; bh=nWZk2khgSq9nr/IGXSFf5g+KZA7oDyrQY7yfkr8Lp+o=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=O4uYSoYTs89DtyWxFg+I6ZfS0lHd9sOC5mA3PSXp4h4s886DUX3BeGQWpI5Q2tMTE
         FDvOuSLvKNAkEeWSlWurmX/lw96VjgUTcyhY6Y+WmYXeaXavIDJAvBl0cSFn89EEOH
         e/YifYTP8rHyb69ht5nQJqapW54wGMSv3RuzxeZDvQany6xh4wv68ei3TqbVq9Y9Kp
         8xtqu2qjh840p+SzEfmVNaLWGRESY1FHWqrOix7SNnCLnz1a/pgtXE+whEAxnQ0W07
         CzRKaauLj8+CFBff2rA0CSD/ueHZhjy1ELRp9nKLVrf15PbDn+1ZLbygGVECkTWMhI
         uxIz1tzjsqAZA==
Subject: Re: [PATCH v9 29/36] media: subdev: add v4l2_subdev_set_routing
 helper()
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211005085750.138151-1-tomi.valkeinen@ideasonboard.com>
 <20211005085750.138151-30-tomi.valkeinen@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6eb3751f-1d62-2e24-127b-61de25ad9905@xs4all.nl>
Date:   Tue, 12 Oct 2021 17:07:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211005085750.138151-30-tomi.valkeinen@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAm6RdkpZBMckme/KbbiZHXx0+SxR3pWLAF/bCqZ4XdHx5TopwsN/0Tl9ut5RyrMKSr01CV4xhdq5asyVE0/Vv17DUTpCYa1dsGYoItOAM4EGf0GLm4F
 uIR+DcKZkpQNmVjOpn6jXpu9RJ9Immc0Bvw5mYYa0Z3538i4C9DKx/VNfbPCvb3+hJQn0IYuyryDiHKk0QP8OX9AB3uZTmWY8fDychOdOKBl/ImOgoD3PU1g
 F+tHTAwxxJzyZzaonO5WaMsuDShOs2iTZk/wbBWE5BbbgRWD3XoKwPo9w+Jbp8vXjQk1fTTlanMYGKEx0AcyZV9qL7yiaDEqaPqi0B+W+6BwZdGTb6MRUD2D
 jTGxeXRX38LH3l/XhYChAnQI+mjUrxkNmlcWlWT1JFZCX8ElBMR6Pl5dgDLEWpSg8KWU51FD00VxJuYZ9idbe1XVA5Kv9/HkJdb1L9bVJko6T9ZTsCr/JXq1
 UuYXDo4q2YJxR4lQT6o2fdXv5uRlM6tc7X6c0w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/10/2021 10:57, Tomi Valkeinen wrote:
> Add a helper function to set the subdev routing. The helper can be used
> from subdev driver's set_routing op to store the routing table.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

> ---
>  drivers/media/v4l2-core/v4l2-subdev.c | 28 +++++++++++++++++++++++++++
>  include/media/v4l2-subdev.h           | 16 +++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 14b8282fe45b..af53f827ec27 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1151,3 +1151,31 @@ void v4l2_subdev_unlock_state(struct v4l2_subdev_state *state)
>  	mutex_unlock(&state->lock);
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_unlock_state);
> +
> +int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state,
> +			    struct v4l2_subdev_krouting *routing)
> +{
> +	struct v4l2_subdev_krouting *dst = &state->routing;
> +	const struct v4l2_subdev_krouting *src = routing;
> +
> +	lockdep_assert_held(&state->lock);
> +
> +	kvfree(dst->routes);
> +	dst->routes = NULL;
> +	dst->num_routes = 0;
> +
> +	if (src->num_routes > 0) {
> +		dst->routes = kvmalloc_array(src->num_routes,
> +					     sizeof(*src->routes), GFP_KERNEL);
> +		if (!dst->routes)
> +			return -ENOMEM;
> +
> +		memcpy(dst->routes, src->routes,
> +		       src->num_routes * sizeof(*src->routes));
> +		dst->num_routes = src->num_routes;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(v4l2_subdev_set_routing);
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index 8b2cf3190276..b6c5cd00831e 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -1437,4 +1437,20 @@ v4l2_subdev_validate_and_lock_state(struct v4l2_subdev *sd,
>  	return state;
>  }
>  
> +/**
> + * v4l2_subdev_set_routing() - Set given routing to subdev state
> + * @sd: The subdevice
> + * @state: The subdevice state
> + * @routing: Routing that will be copied to subdev state
> + *
> + * This will release old routing table (if any) from the state, allocate
> + * enough space for the given routing, and copy the routing.
> + *
> + * This can be used from the subdev driver's set_routing op, after validating
> + * the routing.
> + */
> +int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
> +			    struct v4l2_subdev_state *state,
> +			    struct v4l2_subdev_krouting *routing);
> +
>  #endif
> 

