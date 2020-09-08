Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6C42609D2
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 07:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbgIHFIf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 01:08:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44768 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgIHFIc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 01:08:32 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27CB735;
        Tue,  8 Sep 2020 07:08:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599541710;
        bh=t9UAlaw1UbJux2agySqSdIA8bFmPTov3VuBYD9+aDbs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b/S46Z+1qcYNNfJjchf0L4niL4sTTM/znuXXNn2MWc8xAWar6LL3sJb/hhPHBsh5t
         80VHtnwKMWUAnjrqV3KffbFDWTJqrTCfCnhQHofF8CgpZSZN0I57jvLniOOEFv+6QK
         KTa1vUixPO2xpdvSKmRy6ZowBx35CsQUygumeSrw=
Date:   Tue, 8 Sep 2020 08:08:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: Re: [PATCH 1/5] media: v4l2-async: Document asd allocation
 requirements
Message-ID: <20200908050805.GI6047@pendragon.ideasonboard.com>
References: <20200811205939.19550-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200811205939.19550-2-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200811205939.19550-2-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Gentle ping for reviews.

On Tue, Aug 11, 2020 at 11:59:35PM +0300, Laurent Pinchart wrote:
> The v4l2_async_notifier_add_subdev() function requires the asd pointer
> it receives to be allocated dynamically, but doesn't explicitly say so.
> Only one driver out of 13 get its right (atmel-sama5d2-isc.c, but with
> memory leaks in the error paths), clearly showing we have an issue.
> 
> Update the v4l2_async_notifier_add_subdev() documentation to clearly
> state the allocation requirement. Whether this will be enough to avoid
> new offending code isn't certain, but it's a good first step
> nonetheless.
> 
> Fixes: 9ca465312132 ("media: v4l: fwnode: Support generic parsing of graph endpoints in a device")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  include/media/v4l2-async.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 8319284c93cb..d6e31234826f 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -154,8 +154,9 @@ void v4l2_async_notifier_init(struct v4l2_async_notifier *notifier);
>   * @notifier: pointer to &struct v4l2_async_notifier
>   * @asd: pointer to &struct v4l2_async_subdev
>   *
> - * Call this function before registering a notifier to link the
> - * provided asd to the notifiers master @asd_list.
> + * Call this function before registering a notifier to link the provided @asd to
> + * the notifiers master @asd_list. The @asd must be allocated with k*alloc() as
> + * it will be freed by the framework when the notifier is destroyed.
>   */
>  int v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_async_subdev *asd);

-- 
Regards,

Laurent Pinchart
