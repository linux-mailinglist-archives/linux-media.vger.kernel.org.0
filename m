Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC273A7E41
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2019 10:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727544AbfIDIrI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 04:47:08 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:45488 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727387AbfIDIrH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Sep 2019 04:47:07 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 9DC604BD3EBF724F5012;
        Wed,  4 Sep 2019 16:47:06 +0800 (CST)
Received: from [127.0.0.1] (10.184.213.217) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Wed, 4 Sep 2019
 16:46:58 +0800
Subject: Re: [PATCH v2] media: mc-device.c: fix memleak in
 media_device_register_entity
To:     <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
CC:     <yi.zhang@huawei.com>
References: <1566179490-15413-1-git-send-email-zhengbin13@huawei.com>
From:   "zhengbin (A)" <zhengbin13@huawei.com>
Message-ID: <b71c3fe2-0a52-e706-5787-5c1693cf95e9@huawei.com>
Date:   Wed, 4 Sep 2019 16:46:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1566179490-15413-1-git-send-email-zhengbin13@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.184.213.217]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

ping

On 2019/8/19 9:51, zhengbin wrote:
> In media_device_register_entity, if media_graph_walk_init fails,
> need to free the previously memory.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
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
> --
> 2.7.4
>
>
> .
>

