Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1EEB8AAA2
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 00:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbfHLWlE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 18:41:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47316 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbfHLWlE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 18:41:04 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CDEC327;
        Tue, 13 Aug 2019 00:41:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565649662;
        bh=CisoocJzGVjgFY/95maoSr0odtfImnDMdbr2mCYFUyM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qa1vTlimYboTVz5xPTphS02T3Ms0ZvxF58VebFy3NG5KvL2CeCzQG+ATz7UOzINHy
         VY1uGhFZFlsY0DwB50CBTChlGS5WPVNPOzn8Ugg8peMwDvKRPd5jGZ/IYvxO9nulvm
         zXB8I6YOcs2pgEVttRRkOMHhWt0NsKQzTZB1duUk=
Date:   Tue, 13 Aug 2019 01:40:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 2/2] omap3isp: Don't set streaming state on random subdevs
Message-ID: <20190812224059.GM5006@pendragon.ideasonboard.com>
References: <20190812083227.11838-1-sakari.ailus@linux.intel.com>
 <20190812083227.11838-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190812083227.11838-3-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Aug 12, 2019 at 11:32:27AM +0300, Sakari Ailus wrote:
> The streaming state should be set to the first upstream sub-device only,
> not everywhere, for a sub-device driver itself knows how to best control
> the streaming state of its own upstream sub-devices.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/omap3isp/isp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
> index 008933beebe0..52533cdafb47 100644
> --- a/drivers/media/platform/omap3isp/isp.c
> +++ b/drivers/media/platform/omap3isp/isp.c
> @@ -722,6 +722,10 @@ static int isp_pipeline_enable(struct isp_pipeline *pipe,
>  					s_stream, mode);
>  			pipe->do_propagation = true;
>  		}
> +
> +		/* Stop at the first external sub-device. */
> +		if (subdev->dev != isp->dev)
> +			break;
>  	}
>  
>  	return 0;
> @@ -836,6 +840,10 @@ static int isp_pipeline_disable(struct isp_pipeline *pipe)
>  						      &subdev->entity);
>  			failure = -ETIMEDOUT;
>  		}
> +
> +		/* Stop at the first external sub-device. */
> +		if (subdev->dev != isp->dev)
> +			break;
>  	}
>  
>  	return failure;

-- 
Regards,

Laurent Pinchart
