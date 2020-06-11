Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03FD21F6056
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 05:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgFKDKe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 23:10:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45448 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgFKDKe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 23:10:34 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9BB5826A;
        Thu, 11 Jun 2020 05:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591845032;
        bh=UWpt1sM6SDAiqZs/tZljy1+goqPHhJWDJtZFS/FLfYA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L1naQBxfM/aT8W79pntzbW3pnUH9yrXyX2d+oGqFA32u7RWRBNg4pVz1Pr0P+KQDb
         d8l+5EkRE4S1QpNqPzfdUeoFp2oVLrZuKit/jqrahTIQmXiLBPLxw4VASwns7gtUFa
         A/tpBlt/voJ9lHscvO5ae6UseVLJCHWccCS+ZNb8=
Date:   Thu, 11 Jun 2020 06:10:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/5] v4l2-async: Flag when media graph is complete
Message-ID: <20200611031011.GD13598@pendragon.ideasonboard.com>
References: <20200610230541.1603067-1-niklas.soderlund+renesas@ragnatech.se>
 <20200610230541.1603067-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200610230541.1603067-4-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, Jun 11, 2020 at 01:05:39AM +0200, Niklas Söderlund wrote:
> When the notifier completes set the complete flag in the struct
> media_device. This flag can can then be reported to user-space to let it
> know the graph is complete.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/v4l2-core/v4l2-async.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
> index 8bde33c21ce45f98..331594ca5b3bb723 100644
> --- a/drivers/media/v4l2-core/v4l2-async.c
> +++ b/drivers/media/v4l2-core/v4l2-async.c
> @@ -217,6 +217,11 @@ v4l2_async_notifier_try_complete(struct v4l2_async_notifier *notifier)
>  	if (!v4l2_async_notifier_can_complete(notifier))
>  		return 0;
>  
> +#if defined(CONFIG_MEDIA_CONTROLLER)
> +	if (notifier->v4l2_dev->mdev)
> +		notifier->v4l2_dev->mdev->complete = true;
> +#endif

Does this work with sub-notifiers ?

> +
>  	return v4l2_async_notifier_call_complete(notifier);

Isn't there a race here, if we report the complete flag before the
notifier calls the .complete() operation ?

>  }
>  

-- 
Regards,

Laurent Pinchart
