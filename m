Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBAF0551F99
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 17:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241314AbiFTPBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 11:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233869AbiFTPB3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 11:01:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73EB13DF0
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 07:28:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 06E22B811BE
        for <linux-media@vger.kernel.org>; Mon, 20 Jun 2022 14:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78A10C3411B;
        Mon, 20 Jun 2022 14:27:57 +0000 (UTC)
Message-ID: <7a373ba9-4736-f726-a07e-38d9c5c9062c@xs4all.nl>
Date:   Mon, 20 Jun 2022 16:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 16/55] media: v4l2-async: Add notifier operation to
 destroy asd instances
Content-Language: en-US
To:     Paul Elder <paul.elder@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
 <20220614191127.3420492-17-paul.elder@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220614191127.3420492-17-paul.elder@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/14/22 21:10, Paul Elder wrote:
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

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Looks good!

Regards,

	Hans

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

