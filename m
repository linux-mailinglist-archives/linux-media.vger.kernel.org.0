Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A3A7A64D7
	for <lists+linux-media@lfdr.de>; Tue, 19 Sep 2023 15:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbjISN0z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Sep 2023 09:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbjISN0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Sep 2023 09:26:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE5C5EC
        for <linux-media@vger.kernel.org>; Tue, 19 Sep 2023 06:26:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1D54BBB2;
        Tue, 19 Sep 2023 15:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695129908;
        bh=MtejQlkDXzx7yN2pgVM7cM/dXT8Do46DLZVDtIcaf/o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gVbGopaFodMRwZ2IX2ODCxaN7c0v7SpnLjMUJdKx1hwGzOMVW3lmLvzYWUteXlTdq
         /pnxkt0rDu9fgp52nZ+H+bQUe/lMGCkQNt0e3X6PDKWYUoa//33MeEvVSXtO61iiCR
         UQISg9lL0rjPkcJyQ/CDgj98lj5jP6KIdNn0lPIw=
Date:   Tue, 19 Sep 2023 16:26:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v3 12/12] media: mc: Check pad flag validity
Message-ID: <20230919132657.GC1505@pendragon.ideasonboard.com>
References: <20230919121728.126781-1-sakari.ailus@linux.intel.com>
 <20230919121728.126781-13-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230919121728.126781-13-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Tue, Sep 19, 2023 at 03:17:28PM +0300, Sakari Ailus wrote:
> Check the validity of pad flags on entity init. Exactly one of the flags
> must be set.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-entity.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 83468d4a440b..0a54cf8bcca2 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -197,6 +197,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>  	struct media_device *mdev = entity->graph_obj.mdev;
>  	struct media_pad *iter;
>  	unsigned int i = 0;
> +	int ret = 0;
>  
>  	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
>  		return -E2BIG;
> @@ -210,15 +211,26 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>  	media_entity_for_each_pad(entity, iter) {
>  		iter->entity = entity;
>  		iter->index = i++;
> +
> +		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> +					     MEDIA_PAD_FL_SOURCE)) != 1) {
> +			ret = -EINVAL;
> +			break;
> +		}
> +
>  		if (mdev)
>  			media_gobj_create(mdev, MEDIA_GRAPH_PAD,
>  					  &iter->graph_obj);
>  	}
>  
> +	if (ret && mdev)
> +		media_entity_for_each_pad(entity, iter)
> +			media_gobj_destroy(&iter->graph_obj);

With curly braces for the if () { ... },

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	if (mdev)
>  		mutex_unlock(&mdev->graph_mutex);
>  
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(media_entity_pads_init);
>  

-- 
Regards,

Laurent Pinchart
