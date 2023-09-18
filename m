Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97EDA7A4F3D
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 18:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbjIRQgV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 12:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbjIRQfy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 12:35:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D302C23CD2
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 09:14:55 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3FFD880D;
        Mon, 18 Sep 2023 15:46:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695044774;
        bh=7SX4NBZGv/KIc9VDRZTQguXMQ/C7k8NXunTfKw0QkCE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vuIL4YVsMfTuLWsQ+MDA5eY4ZqKrzK2SLPxr7Qkz5+Hr+k+vDw1qZewuSyL3zDnFC
         1/jxEAHnpQMJsUXCIfczSSr2OdA3Lrz0F3BT4PYxltqL/dnCjZToiHWbrQdSbg3QL9
         tEw4T5k1I1cxda850sKryTIppunY+p1WYyshCtk8=
Date:   Mon, 18 Sep 2023 16:48:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tianshu Qiu <tian.shu.qiu@intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Martin Kepplinger <martink@posteo.de>
Subject: Re: [PATCH v2 12/12] media: mc: Check pad flag validity
Message-ID: <20230918134802.GH28874@pendragon.ideasonboard.com>
References: <20230918125138.90002-1-sakari.ailus@linux.intel.com>
 <20230918125138.90002-13-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230918125138.90002-13-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Sep 18, 2023 at 03:51:38PM +0300, Sakari Ailus wrote:
> Check the validity of pad flags on entity init. Exactly one of the flags
> must be set.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-entity.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 83468d4a440b..38d5bbae33d7 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -195,8 +195,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>  			   struct media_pad *pads)
>  {
>  	struct media_device *mdev = entity->graph_obj.mdev;
> -	struct media_pad *iter;
> +	struct media_pad *iter, *iter2;
>  	unsigned int i = 0;
> +	int ret = 0;
>  
>  	if (num_pads >= MEDIA_ENTITY_MAX_PADS)
>  		return -E2BIG;
> @@ -210,15 +211,30 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
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
> +	if (ret && mdev) {
> +		media_entity_for_each_pad(entity, iter2) {
> +			if (iter2 == iter)
> +				break;
> +			media_gobj_destroy(&iter->graph_obj);

Wrong iterator.

Instead of using a second iterator, which can be error-prone as shown
here, how about breaking when !iter->graph_obj.mdev, which indicates an
uninitialized object ?

> +		}
> +	}
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
