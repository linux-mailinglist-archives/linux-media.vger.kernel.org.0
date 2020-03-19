Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8272C18AAC6
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 03:42:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgCSCmB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 22:42:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58034 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgCSCmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 22:42:01 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84AF35F;
        Thu, 19 Mar 2020 03:41:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584585719;
        bh=i9fDJ/bw55VHprROCKltFiRDFfOsbhWlzsavGdr68tg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gmtw9aMYGM+fsNIBlUNeWOT1YraW+t4Nw6w+elMpPODSG6EShGksiL3s9cU/oTlOx
         r57W0ddFIAXgIv78OvP+Am/2KwqCUX3JB0FmAIAaCuZ4mYobHJvEIz2q4J2uUwQHdC
         VtqD7Ya5TPVr16avoKM0ZtdmUUHymjd90F+V1pfo=
Date:   Thu, 19 Mar 2020 04:41:54 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC 4/5] rcar-vin: Report the completeness of the media graph
Message-ID: <20200319024154.GF27375@pendragon.ideasonboard.com>
References: <20200318213051.3200981-1-niklas.soderlund+renesas@ragnatech.se>
 <20200318213051.3200981-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200318213051.3200981-5-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Wed, Mar 18, 2020 at 10:30:50PM +0100, Niklas Söderlund wrote:
> Implement the graph_complete callback and report if the media graph is
> complete or not.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 13 +++++++++++++
>  drivers/media/platform/rcar-vin/rcar-vin.h  |  4 ++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 7440c8965d27e64f..21ce3de8168c3224 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -221,8 +221,16 @@ static int rvin_group_link_notify(struct media_link *link, u32 flags,
>  	return ret;
>  }
>  
> +static bool rvin_group_graph_complete(struct media_device *mdev)
> +{
> +	struct rvin_group *group = container_of(mdev, struct rvin_group, mdev);
> +
> +	return group->complete;
> +}
> +
>  static const struct media_device_ops rvin_media_ops = {
>  	.link_notify = rvin_group_link_notify,
> +	.graph_complete = rvin_group_graph_complete,
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -735,6 +743,9 @@ static int rvin_group_notify_complete(struct v4l2_async_notifier *notifier)
>  			break;
>  		}
>  	}
> +
> +	vin->group->complete = true;

Going from incomplete to complete is fine...

> +
>  	mutex_unlock(&vin->group->lock);
>  
>  	return ret;
> @@ -761,6 +772,8 @@ static void rvin_group_notify_unbind(struct v4l2_async_notifier *notifier,
>  		break;
>  	}
>  
> +	vin->group->complete = false;
> +

... but the other way around is more problematic. We need to define the
exact semantics for userspace, and how it should handle this event.

>  	mutex_unlock(&vin->group->lock);
>  }
>  
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index c19d077ce1cb4f4b..ff04adbb969b07de 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -263,6 +263,8 @@ struct rvin_dev {
>   * @vin:		VIN instances which are part of the group
>   * @csi:		array of pairs of fwnode and subdev pointers
>   *			to all CSI-2 subdevices.
> + * @complete:		True if all devices of the group are in the media graph,
> + *			false otherwise.
>   */
>  struct rvin_group {
>  	struct kref refcount;
> @@ -278,6 +280,8 @@ struct rvin_group {
>  		struct fwnode_handle *fwnode;
>  		struct v4l2_subdev *subdev;
>  	} csi[RVIN_CSI_MAX];
> +
> +	bool complete;
>  };
>  
>  int rvin_dma_register(struct rvin_dev *vin, int irq);

-- 
Regards,

Laurent Pinchart
