Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D19FC7779ED
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 15:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235437AbjHJNys (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Aug 2023 09:54:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235279AbjHJNyr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Aug 2023 09:54:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D09626A9
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 06:54:46 -0700 (PDT)
Received: from ideasonboard.com (mob-5-90-14-125.net.vodafone.it [5.90.14.125])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0582DD51;
        Thu, 10 Aug 2023 15:53:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691675616;
        bh=+1cx3BAiMbM6h5eWry2ExLAxaL33Q6jH+06aYrX9P1s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qjLRFi85okqZ5/AjDy9BXw2SPM21DGHunLW6iwS36mYrl42zse69DJJjmuHjSPGaI
         AODZUahSCPzPUnV1/eQEQDR9q7D48NpPNJNsbf0XOpRX9qvPJ9EWlr5gH1mTzdu7A3
         fwRvU093a2b6YqUVsD8n0wHKc62LXiwFVYEd2iD0=
Date:   Thu, 10 Aug 2023 15:54:40 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 02/10] media: mc: Check pad flag validity
Message-ID: <lk7muh5ptwxfyujwwr7mon4tw23bexgvgtx4rfju34fycgl7xb@fzor6lkcvem6>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-3-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230808075538.3043934-3-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Tue, Aug 08, 2023 at 10:55:30AM +0300, Sakari Ailus wrote:
> Check the validity of pad flags on entity init. Exactly one of the flags
> must be set.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/mc/mc-entity.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 83468d4a440b..4991281dcccc 100644
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
> @@ -210,6 +211,14 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>  	media_entity_for_each_pad(entity, iter) {
>  		iter->entity = entity;
>  		iter->index = i++;
> +
> +		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> +					     MEDIA_PAD_FL_SOURCE))
> +		    != 1) {

Fits on the previous line, if you like it

> +			ret = -EINVAL;
> +			break;

Now that we can interrupt the for loop earlier, do you need to cleanup
objects appended to the mdev list with the media_gobj_create() call here below ?

> +		}
> +
>  		if (mdev)
>  			media_gobj_create(mdev, MEDIA_GRAPH_PAD,
>  					  &iter->graph_obj);
> @@ -218,7 +227,7 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>  	if (mdev)
>  		mutex_unlock(&mdev->graph_mutex);
>
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL_GPL(media_entity_pads_init);
>
> --
> 2.39.2
>
