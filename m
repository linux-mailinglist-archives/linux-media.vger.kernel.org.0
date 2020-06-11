Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 534F31F65EE
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 12:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbgFKKu0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 06:50:26 -0400
Received: from retiisi.org.uk ([95.216.213.190]:33376 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726407AbgFKKu0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 06:50:26 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id E432B634C87;
        Thu, 11 Jun 2020 13:50:19 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jjKmp-0000NF-Da; Thu, 11 Jun 2020 13:50:19 +0300
Date:   Thu, 11 Jun 2020 13:50:19 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/5] v4l2-async: Flag when media graph is complete
Message-ID: <20200611105019.GD805@valkosipuli.retiisi.org.uk>
References: <20200610230541.1603067-1-niklas.soderlund+renesas@ragnatech.se>
 <20200610230541.1603067-4-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200610230541.1603067-4-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

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
> +
>  	return v4l2_async_notifier_call_complete(notifier);
>  }
>  

Do we need this? Could you not use the complete callback from the main
notifier, that gets called only when all async subdevs have been bound?

-- 
Sakari Ailus
