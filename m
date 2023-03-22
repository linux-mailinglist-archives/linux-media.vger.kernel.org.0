Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE786C4B28
	for <lists+linux-media@lfdr.de>; Wed, 22 Mar 2023 13:57:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230258AbjCVM5A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Mar 2023 08:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbjCVM47 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Mar 2023 08:56:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF3E45DC8B
        for <linux-media@vger.kernel.org>; Wed, 22 Mar 2023 05:56:57 -0700 (PDT)
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 58D0B118E;
        Wed, 22 Mar 2023 13:56:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1679489816;
        bh=hMqE9qdKUxy6TViScwlcdd0uZYIC7L4ByVkirvwZDi8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qocHzxtafWODFMC6lWeHXQrt0HqzJK2g1Ge6QI17E4FttRZwzyRQWYce3J290DRbP
         4HTyAhRUpHE1k5MXeFlAsqmbP+/IRAXLOYMkbLVBAgq8VbyTjlwiVK94O5vd9tJqye
         QCRhnlNr2SvTJK9CGEgzJ4ziLPy0tmiTRJ6BaXDE=
Date:   Wed, 22 Mar 2023 13:56:54 +0100
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl, Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com
Subject: Re: [RFC 01/10] media: v4l: async: Return async sub-devices to
 subnotifier list
Message-ID: <20230322125654.dp7vyqelnujjdrq5@uno.localdomain>
References: <20230307212038.968381-1-sakari.ailus@linux.intel.com>
 <20230307212038.968381-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230307212038.968381-2-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Tue, Mar 07, 2023 at 11:20:29PM +0200, Sakari Ailus wrote:
> When an async notifier is unregistered, the async sub-devices in the
> notifier's done list will disappear with the notifier. However this is
> currently also done to the sub-notifiers that remain registered. Their
> sub-devices only need to be unbound while the async sub-devices themselves
> need to be returned to the sub-notifier's waiting list. Do this now.

I'm a bit missing the point of re-adding the async sub-device to the
waiting list if the sub-notifier is about to be un-registered as well.

The only use I found is printing out the list of pending async
subdevices. Why is this relevant for sub-notifiers only ?

Thanks

>
> Fixes: 2cab00bb076b ("media: v4l: async: Allow binding notifiers to sub-devices")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 2f1b718a9189..008a2a3e312e 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -414,7 +414,8 @@ static void v4l2_async_cleanup(struct v4l2_subdev *sd)
>
>  /* Unbind all sub-devices in the notifier tree. */
>  static void
> -v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
> +v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier,
> +				 bool readd)
>  {
>  	struct v4l2_subdev *sd, *tmp;
>
> @@ -423,9 +424,11 @@ v4l2_async_nf_unbind_all_subdevs(struct v4l2_async_notifier *notifier)
>  			v4l2_async_find_subdev_notifier(sd);
>
>  		if (subdev_notifier)
> -			v4l2_async_nf_unbind_all_subdevs(subdev_notifier);
> +			v4l2_async_nf_unbind_all_subdevs(subdev_notifier, true);
>
>  		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
> +		if (readd)
> +			list_add_tail(&sd->asd->list, &notifier->waiting);
>  		v4l2_async_cleanup(sd);
>
>  		list_move(&sd->async_list, &subdev_list);
> @@ -557,7 +560,7 @@ static int __v4l2_async_nf_register(struct v4l2_async_notifier *notifier)
>  	/*
>  	 * On failure, unbind all sub-devices registered through this notifier.
>  	 */
> -	v4l2_async_nf_unbind_all_subdevs(notifier);
> +	v4l2_async_nf_unbind_all_subdevs(notifier, false);
>
>  err_unlock:
>  	mutex_unlock(&list_lock);
> @@ -607,7 +610,7 @@ __v4l2_async_nf_unregister(struct v4l2_async_notifier *notifier)
>  	if (!notifier || (!notifier->v4l2_dev && !notifier->sd))
>  		return;
>
> -	v4l2_async_nf_unbind_all_subdevs(notifier);
> +	v4l2_async_nf_unbind_all_subdevs(notifier, false);
>
>  	notifier->sd = NULL;
>  	notifier->v4l2_dev = NULL;
> @@ -805,7 +808,7 @@ int v4l2_async_register_subdev(struct v4l2_subdev *sd)
>  	 */
>  	subdev_notifier = v4l2_async_find_subdev_notifier(sd);
>  	if (subdev_notifier)
> -		v4l2_async_nf_unbind_all_subdevs(subdev_notifier);
> +		v4l2_async_nf_unbind_all_subdevs(subdev_notifier, false);
>
>  	if (sd->asd)
>  		v4l2_async_nf_call_unbind(notifier, sd, sd->asd);
> --
> 2.30.2
>
