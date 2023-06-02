Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C87571FE6D
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 11:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234819AbjFBJ6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 05:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233994AbjFBJ6Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 05:58:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF014C0
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 02:58:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp [126.156.168.104])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 692427FC;
        Fri,  2 Jun 2023 11:57:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685699880;
        bh=tGfkPUKy1QXbavsf+CCCMGeRi7ZV8hvK4AcduyeugmI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lWSKxJyjcKV5xbkiXfg3SI1oTQHg1RBK8XMAwIZFbJCqR3Lxg6y0LA4oVhwwE/pqc
         JGdqvjLPrB9Ysa/JWCDQgNgr0ePvxjbkZfQCr/kUy7URDQP4vhgY7M1T2skkYUC3Ss
         hC25zrh6u5Sf2Ft72qABRoF0s2XmO7Vfrh4WPI9w=
Date:   Fri, 2 Jun 2023 12:58:21 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [RFC 4/7] media: mc: Check pad flag validity
Message-ID: <20230602095821.GJ19463@pendragon.ideasonboard.com>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505215257.60704-5-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Sat, May 06, 2023 at 12:52:54AM +0300, Sakari Ailus wrote:
> Check the validity of pad flags on entity init. Exactly one of the flags
> must be set.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-entity.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index ed99160a2487..c1bc48c4d239 100644
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
> @@ -210,6 +211,15 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>  	media_entity_for_each_pad(entity, iter) {
>  		iter->entity = entity;
>  		iter->index = i++;
> +
> +		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> +					     MEDIA_PAD_FL_SOURCE |
> +					     MEDIA_PAD_FL_INTERNAL_SOURCE))
> +		    != 1) {

I would add this check as patch 1/7 in this series, with FL_SINK an
FL_SOURCE only, and then extend it in the patch where you introduce
FL_INTERNAL_SOURCE.

> +			ret = -EINVAL;
> +			break;
> +		}
> +
>  		if (mdev)
>  			media_gobj_create(mdev, MEDIA_GRAPH_PAD,
>  					  &iter->graph_obj);
> @@ -218,7 +228,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
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
