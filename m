Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2946ED9D5
	for <lists+linux-media@lfdr.de>; Tue, 25 Apr 2023 03:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233180AbjDYB2t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Apr 2023 21:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233106AbjDYB2s (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Apr 2023 21:28:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDD855269
        for <linux-media@vger.kernel.org>; Mon, 24 Apr 2023 18:28:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B65575B;
        Tue, 25 Apr 2023 03:28:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682386116;
        bh=JxtwDg3PMzijXMZhPYjiDhByuVX9B04M9EF9PWn8Ev8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wi3kF4jM3yPh4Mf+29e6myMixSX4gqJBwLyHZ0J1sxD4lJT6z3AZR6/hExHv92M1T
         bwwUdYcVLsSSAfGy2mA1jyBUcDXf4g2P3Oj5xBfOTKJEykygULA3fQGK3YVEV6dNiB
         Vqc6YEg8vCFhhS3pP4FgPyxMoijIYQvibyNiq2/4=
Date:   Tue, 25 Apr 2023 04:28:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>, hverkuil@xs4all.nl,
        Francesco Dolcini <francesco@dolcini.it>,
        aishwarya.kothari@toradex.com, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Hyun Kwon <hyun.kwon@xilinx.com>
Subject: Re: [PATCH 01/18] media: v4l: async: Return async sub-devices to
 subnotifier list
Message-ID: <20230425012857.GK4921@pendragon.ideasonboard.com>
References: <20230330115853.1628216-1-sakari.ailus@linux.intel.com>
 <20230330115853.1628216-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230330115853.1628216-2-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Thu, Mar 30, 2023 at 02:58:36PM +0300, Sakari Ailus wrote:
> When an async notifier is unregistered, the async sub-devices in the
> notifier's done list will disappear with the notifier. However this is
> currently also done to the sub-notifiers that remain registered. Their
> sub-devices only need to be unbound while the async sub-devices themselves
> need to be returned to the sub-notifier's waiting list. Do this now.
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

I've read this as "read d" and was wondering what it meant. Maybe
"re_add" would be a better variable name ?

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
