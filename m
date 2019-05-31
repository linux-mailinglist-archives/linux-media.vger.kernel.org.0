Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83B4230C90
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 12:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfEaKaB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 06:30:01 -0400
Received: from retiisi.org.uk ([95.216.213.190]:47934 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726233AbfEaKaB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 06:30:01 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 3143F634C7B;
        Fri, 31 May 2019 13:29:56 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hWenM-0000JZ-90; Fri, 31 May 2019 13:29:56 +0300
Date:   Fri, 31 May 2019 13:29:56 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Shuah Khan <shuah@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: avoid skipping MEDIA_PAD_FL_MUST_CONNECT logic
Message-ID: <20190531102956.rd5q72yobbdwyut5@valkosipuli.retiisi.org.uk>
References: <20190531080637.4341-1-nikita.yoush@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190531080637.4341-1-nikita.yoush@cogentembedded.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nikita,

On Fri, May 31, 2019 at 11:06:37AM +0300, Nikita Yushchenko wrote:
> In the current code, __media_pipeline_start() skips check of
> MEDIA_PAD_FL_MUST_CONNECT logic for entity not providing link_validate()
> op.
> 
> Fix that by checking for existence of link_validate() at different code
> location.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
> ---
>  drivers/media/mc/mc-entity.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index a998a2e0ea1d..8b4912be30d1 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -449,9 +449,6 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  		if (entity->stream_count > 1)
>  			continue;
>  
> -		if (!entity->ops || !entity->ops->link_validate)
> -			continue;
> -
>  		bitmap_zero(active, entity->num_pads);
>  		bitmap_fill(has_no_links, entity->num_pads);
>  
> @@ -479,6 +476,9 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  			    !(link->flags & MEDIA_LNK_FL_ENABLED))
>  				continue;
>  
> +			if (!entity->ops || !entity->ops->link_validate)
> +				continue;
> +
>  			ret = entity->ops->link_validate(link);
>  			if (ret < 0 && ret != -ENOIOCTLCMD) {
>  				dev_dbg(entity->graph_obj.mdev->dev,

Thanks for the patch. This generally hasn't been an issue as drivers do
implement link_validate function. But it still is a bug in the code.

The link validation function does not change during the loop. How about
caching it locally and implementing a static nop variant you call in case
there's nothing to theck, so there's no need to check for entity->ops and
the entity->ops->link_validate separately on every iteration?

-- 
Kind regards,

Sakari Ailus
