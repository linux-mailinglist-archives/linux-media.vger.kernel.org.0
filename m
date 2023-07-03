Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9279C745676
	for <lists+linux-media@lfdr.de>; Mon,  3 Jul 2023 09:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbjGCHxk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jul 2023 03:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjGCHxj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jul 2023 03:53:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB55CE44
        for <linux-media@vger.kernel.org>; Mon,  3 Jul 2023 00:53:25 -0700 (PDT)
Received: from ideasonboard.com (85-160-45-219.reb.o2.cz [85.160.45.219])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBA16558;
        Mon,  3 Jul 2023 09:52:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1688370761;
        bh=flvwaYgB0rx/a54n7mUKs03R5jBKgGzL0HqWCdPd1Bk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ozYrG/0lwgB7xkl3DLSDUH1Guq1GLIBOw+9U4+nvPXH6JgrkxXamA4QvqV8sLaecs
         BpPKVoP+fNFBCzcDHLgo+yV1ujeka8aLOj0R+rm/6QwZswvP3r/HnxWAgwW5ml0Wk3
         8yv1Y3G3BREIM5vG9pqsIx1/ewBTMcqH6+/U+Xx0=
Date:   Mon, 3 Jul 2023 09:53:14 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/7] media: mc: Check pad flag validity
Message-ID: <wsb6xkn2inp7wrfld6txhv4lhtdsccgpdxhnnbwvjj5v575kxo@kqtwh7sn7txo>
References: <20230630204338.126583-1-sakari.ailus@linux.intel.com>
 <20230630204338.126583-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230630204338.126583-2-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari

On Fri, Jun 30, 2023 at 11:43:32PM +0300, Sakari Ailus wrote:
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

Fits on the previous line ?

> +			ret = -EINVAL;
> +			break;
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
