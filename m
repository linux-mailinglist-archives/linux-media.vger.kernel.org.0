Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8268E1A8F2C
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 01:33:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392169AbgDNXdZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 19:33:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38178 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731539AbgDNXdY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 19:33:24 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 513E1521;
        Wed, 15 Apr 2020 01:33:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586907202;
        bh=Iiq9bjMpLaSNZ4afUvYUoXLDjEJ3EFvve4nS0Ny/DpM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DMACIlvZ3NyWVvPJ5nwk4/wO8DIKHBz47kQ4xU1g81of+aVdImi+MYDxgio6LgRRr
         BZ3DAf9jnrXJ/divZJDAReCVhfKA4+R2bwZcybXIARLTBt6aHMYZi3Pvp+d5O6n0Ru
         6+nbH4tAU/iDzBSWJTpngdmV3dtu4wCbDQUUg7kA=
Date:   Wed, 15 Apr 2020 02:33:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 16/17] media: imx: silence a couple debug messages
Message-ID: <20200414233310.GE28533@pendragon.ideasonboard.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-17-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200303234256.8928-17-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

Thank you for the patch.

On Tue, Mar 03, 2020 at 03:42:55PM -0800, Steve Longerbeam wrote:
> Convert to dev_dbg the "subdev bound" and IPU-internal media-link
> creation messages.
> 
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/imx/imx-media-dev-common.c  | 4 +++-
>  drivers/staging/media/imx/imx-media-dev.c         | 2 +-
>  drivers/staging/media/imx/imx-media-internal-sd.c | 6 +++---
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
> index f7ad3cbbeec2..b23bbfab388a 100644
> --- a/drivers/staging/media/imx/imx-media-dev-common.c
> +++ b/drivers/staging/media/imx/imx-media-dev-common.c
> @@ -24,7 +24,9 @@ static int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
>  				  struct v4l2_subdev *sd,
>  				  struct v4l2_async_subdev *asd)
>  {
> -	v4l2_info(sd->v4l2_dev, "subdev %s bound\n", sd->name);
> +	struct imx_media_dev *imxmd = notifier2dev(notifier);
> +
> +	dev_dbg(imxmd->md.dev, "subdev %s bound\n", sd->name);
>  
>  	return 0;
>  }
> diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
> index 2c3c2adca683..6d2205461e56 100644
> --- a/drivers/staging/media/imx/imx-media-dev.c
> +++ b/drivers/staging/media/imx/imx-media-dev.c
> @@ -32,7 +32,7 @@ static int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
>  			return ret;
>  	}
>  
> -	v4l2_info(&imxmd->v4l2_dev, "subdev %s bound\n", sd->name);
> +	dev_dbg(imxmd->md.dev, "subdev %s bound\n", sd->name);
>  
>  	return 0;
>  }
> diff --git a/drivers/staging/media/imx/imx-media-internal-sd.c b/drivers/staging/media/imx/imx-media-internal-sd.c
> index d4237e1a4241..da4109b2fd13 100644
> --- a/drivers/staging/media/imx/imx-media-internal-sd.c
> +++ b/drivers/staging/media/imx/imx-media-internal-sd.c
> @@ -142,9 +142,9 @@ static int create_internal_link(struct imx_media_dev *imxmd,
>  				   &sink->entity.pads[link->remote_pad]))
>  		return 0;
>  
> -	v4l2_info(&imxmd->v4l2_dev, "%s:%d -> %s:%d\n",
> -		  src->name, link->local_pad,
> -		  sink->name, link->remote_pad);
> +	dev_dbg(imxmd->md.dev, "%s:%d -> %s:%d\n",
> +		src->name, link->local_pad,
> +		sink->name, link->remote_pad);
>  
>  	ret = media_create_pad_link(&src->entity, link->local_pad,
>  				    &sink->entity, link->remote_pad, 0);

-- 
Regards,

Laurent Pinchart
