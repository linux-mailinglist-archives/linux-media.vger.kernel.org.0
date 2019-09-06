Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 652C4AB4A7
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 11:12:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389544AbfIFJMM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 05:12:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53914 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730704AbfIFJML (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Sep 2019 05:12:11 -0400
Received: from pendragon.ideasonboard.com (wlan-guests.hus.fi [193.166.190.218])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76CB6542;
        Fri,  6 Sep 2019 11:12:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1567761129;
        bh=IFUoI3dTebeL4PfHjoNHuuZ8HLWlXoSyuPgwOWPuMJ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=V6jDrufoJA/EhH8enZ2njbaKVHxef3ly8xKg5frTM/g/7ovAhDwEKTZ/82/wyGgiV
         3+qx1Q9gsYFycruBGGRykSU1q60UXwjPk1EN+cLy6Tca9T5DzPiLJGinoC2iREcn4M
         cULJYcqVKljsChB0UDLDE2oTbL+qGPIw7RQjKWdc=
Date:   Fri, 6 Sep 2019 12:12:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     zhengbin <zhengbin13@huawei.com>
Cc:     sakari.ailus@linux.intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [PATCH v2] media: mc-device.c: fix memleak in
 media_device_register_entity
Message-ID: <20190906091203.GB5019@pendragon.ideasonboard.com>
References: <1566179490-15413-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1566179490-15413-1-git-send-email-zhengbin13@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Zhengbin,

On Mon, Aug 19, 2019 at 09:51:30AM +0800, zhengbin wrote:
> In media_device_register_entity, if media_graph_walk_init fails,
> need to free the previously memory.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>

This looks good to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and applied to my tree, for v5.5.

> ---
>  drivers/media/mc/mc-device.c | 65 ++++++++++++++++++++++----------------------
>  1 file changed, 33 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-device.c b/drivers/media/mc/mc-device.c
> index e19df51..da80883 100644
> --- a/drivers/media/mc/mc-device.c
> +++ b/drivers/media/mc/mc-device.c
> @@ -575,6 +575,38 @@ static void media_device_release(struct media_devnode *devnode)
>  	dev_dbg(devnode->parent, "Media device released\n");
>  }
> 
> +static void __media_device_unregister_entity(struct media_entity *entity)
> +{
> +	struct media_device *mdev = entity->graph_obj.mdev;
> +	struct media_link *link, *tmp;
> +	struct media_interface *intf;
> +	unsigned int i;
> +
> +	ida_free(&mdev->entity_internal_idx, entity->internal_idx);
> +
> +	/* Remove all interface links pointing to this entity */
> +	list_for_each_entry(intf, &mdev->interfaces, graph_obj.list) {
> +		list_for_each_entry_safe(link, tmp, &intf->links, list) {
> +			if (link->entity == entity)
> +				__media_remove_intf_link(link);
> +		}
> +	}
> +
> +	/* Remove all data links that belong to this entity */
> +	__media_entity_remove_links(entity);
> +
> +	/* Remove all pads that belong to this entity */
> +	for (i = 0; i < entity->num_pads; i++)
> +		media_gobj_destroy(&entity->pads[i].graph_obj);
> +
> +	/* Remove the entity */
> +	media_gobj_destroy(&entity->graph_obj);
> +
> +	/* invoke entity_notify callbacks to handle entity removal?? */
> +
> +	entity->graph_obj.mdev = NULL;
> +}
> +
>  /**
>   * media_device_register_entity - Register an entity with a media device
>   * @mdev:	The media device
> @@ -632,6 +664,7 @@ int __must_check media_device_register_entity(struct media_device *mdev,
>  		 */
>  		ret = media_graph_walk_init(&new, mdev);
>  		if (ret) {
> +			__media_device_unregister_entity(entity);
>  			mutex_unlock(&mdev->graph_mutex);
>  			return ret;
>  		}
> @@ -644,38 +677,6 @@ int __must_check media_device_register_entity(struct media_device *mdev,
>  }
>  EXPORT_SYMBOL_GPL(media_device_register_entity);
> 
> -static void __media_device_unregister_entity(struct media_entity *entity)
> -{
> -	struct media_device *mdev = entity->graph_obj.mdev;
> -	struct media_link *link, *tmp;
> -	struct media_interface *intf;
> -	unsigned int i;
> -
> -	ida_free(&mdev->entity_internal_idx, entity->internal_idx);
> -
> -	/* Remove all interface links pointing to this entity */
> -	list_for_each_entry(intf, &mdev->interfaces, graph_obj.list) {
> -		list_for_each_entry_safe(link, tmp, &intf->links, list) {
> -			if (link->entity == entity)
> -				__media_remove_intf_link(link);
> -		}
> -	}
> -
> -	/* Remove all data links that belong to this entity */
> -	__media_entity_remove_links(entity);
> -
> -	/* Remove all pads that belong to this entity */
> -	for (i = 0; i < entity->num_pads; i++)
> -		media_gobj_destroy(&entity->pads[i].graph_obj);
> -
> -	/* Remove the entity */
> -	media_gobj_destroy(&entity->graph_obj);
> -
> -	/* invoke entity_notify callbacks to handle entity removal?? */
> -
> -	entity->graph_obj.mdev = NULL;
> -}
> -
>  void media_device_unregister_entity(struct media_entity *entity)
>  {
>  	struct media_device *mdev = entity->graph_obj.mdev;

-- 
Regards,

Laurent Pinchart
