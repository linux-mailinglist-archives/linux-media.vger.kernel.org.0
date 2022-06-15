Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68AD54D4A2
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 00:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347927AbiFOWgX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 18:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239638AbiFOWgW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 18:36:22 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D400D554B3
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 15:36:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4D28415;
        Thu, 16 Jun 2022 00:36:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655332580;
        bh=5AabepMHcw/wdiCrgPXu6Z9MDMa0s1PtWRr7KRhzlB8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OVyHZL9R4qF1XMoPty1qwaqcXUsBReGIvLqS8Wb38f0v3Ozuy/EvxwVw2PZyGPknS
         bV9KRR5MaJEjjbIaIJfUoUDe96PeqOf1vrmGZin6enKjShc5yX7Hbb+sFgaLIRwbcm
         v0jH++prvXqPtuanRghpDHkFNlJeyiKr9yyWb2oY=
Date:   Thu, 16 Jun 2022 01:36:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 16/55] media: v4l2-async: Add notifier operation to
 destroy asd instances
Message-ID: <Yqpe2e8WzeDkAhYj@pendragon.ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-17-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220614191127.3420492-17-paul.elder@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+ Sakari and Hans

This patch is needed by this series, but I think it could also be
reviewed and merged standalone already.

On Wed, Jun 15, 2022 at 04:10:48AM +0900, Paul Elder wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Drivers typically extend the v4l2_async_subdev structure by embedding it
> in a driver-specific structure, to store per-subdev custom data. The
> v4l2_async_subdev instances are freed by the v4l2-async framework, which
> makes this mechanism cumbersome to use safely when custom data needs
> special treatment to be destroyed (such as freeing additional memory, or
> releasing references to kernel objects).
> 
> To ease this, add a .destroy() operation to the
> v4l2_async_notifier_operations structure. The operation is called right
> before the v4l2_async_subdev is freed, giving drivers a chance to
> destroy data if needed.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Documentation/driver-api/media/v4l2-subdev.rst |  6 ++++++
>  drivers/media/v4l2-core/v4l2-async.c           | 10 ++++++++++
>  include/media/v4l2-async.h                     |  2 ++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/v4l2-subdev.rst b/Documentation/driver-api/media/v4l2-subdev.rst
> index cf3b52bdbfb9..6f8d79926aa5 100644
> --- a/Documentation/driver-api/media/v4l2-subdev.rst
> +++ b/Documentation/driver-api/media/v4l2-subdev.rst
> @@ -243,6 +243,12 @@ notifier callback is called. After all subdevices have been located the
>  .complete() callback is called. When a subdevice is removed from the
>  system the .unbind() method is called. All three callbacks are optional.
>  
> +Drivers can store any type of custom data in their driver-specific
> +:c:type:`v4l2_async_subdev` wrapper. If any of that data requires special
> +handling when the structure is freed, drivers must implement the ``.destroy()``
> +notifier callback. The framework will call it right before freeing the
> +:c:type:`v4l2_async_subdev`.
> +
>  Calling subdev operations
>  ~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index c6995718237a..735dede624b8 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -52,6 +52,15 @@ static int v4l2_async_nf_call_complete(struct v4l2_async_notifier *n)
>  	return n->ops->complete(n);
>  }
>  
> +static void v4l2_async_nf_call_destroy(struct v4l2_async_notifier *n,
> +				       struct v4l2_async_subdev *asd)
> +{
> +	if (!n->ops || !n->ops->destroy)
> +		return;
> +
> +	n->ops->destroy(asd);
> +}
> +
>  static bool match_i2c(struct v4l2_async_notifier *notifier,
>  		      struct v4l2_subdev *sd, struct v4l2_async_subdev *asd)
>  {
> @@ -626,6 +635,7 @@ static void __v4l2_async_nf_cleanup(struct v4l2_async_notifier *notifier)
>  		}
>  
>  		list_del(&asd->asd_list);
> +		v4l2_async_nf_call_destroy(notifier, asd);
>  		kfree(asd);
>  	}
>  }
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 13ff3ad948f4..25eb1d138c06 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -81,6 +81,7 @@ struct v4l2_async_subdev {
>   * @complete:	All subdevices have been probed successfully. The complete
>   *		callback is only executed for the root notifier.
>   * @unbind:	a subdevice is leaving
> + * @destroy:	the asd is about to be freed
>   */
>  struct v4l2_async_notifier_operations {
>  	int (*bound)(struct v4l2_async_notifier *notifier,
> @@ -90,6 +91,7 @@ struct v4l2_async_notifier_operations {
>  	void (*unbind)(struct v4l2_async_notifier *notifier,
>  		       struct v4l2_subdev *subdev,
>  		       struct v4l2_async_subdev *asd);
> +	void (*destroy)(struct v4l2_async_subdev *asd);
>  };
>  
>  /**

-- 
Regards,

Laurent Pinchart
