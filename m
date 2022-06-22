Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94953554604
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232948AbiFVJSt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 05:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348349AbiFVJSr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 05:18:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C0E340F6
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 02:18:46 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3963EDD;
        Wed, 22 Jun 2022 11:18:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655889525;
        bh=gRdyDLlUzkUc/snn2RbOYAENXWS2LE8wsctQuQSJfLI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=G5fiHFJZ0K4w5Adk/2zL+EuRqTIKFnLS0tgAGK4jWawhzP6TX9YjVkbuFnIPzPh4o
         T30FUemWFZ8uJbLCvzf1mcOqnorun8cogHQpAvTnvkJ5xFgcsgdzmUgj9eAMGbDeKb
         Dfmsj3jguQg4ZZOv/7JkutrX8tIxx18L4MgGg5QU=
Date:   Wed, 22 Jun 2022 12:18:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        paul.elder@ideasonboard.com
Subject: Re: [PATCH 2/2] media: entity: Use dedicated data link iterator
Message-ID: <YrLeZbtx4WvtD1fY@pendragon.ideasonboard.com>
References: <20220621163457.766496-1-djrscally@gmail.com>
 <20220621163457.766496-3-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220621163457.766496-3-djrscally@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Tue, Jun 21, 2022 at 05:34:57PM +0100, Daniel Scally wrote:
> Where iteration over links for an entity is clearly assuming that
> all of those links are data links, use the new iterator to guarantee
> that that assumption is met.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/mc/mc-entity.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 11f5207f73aa..f46690fd141d 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -449,7 +449,7 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>  		bitmap_zero(active, entity->num_pads);
>  		bitmap_fill(has_no_links, entity->num_pads);
>  
> -		list_for_each_entry(link, &entity->links, list) {
> +		for_each_media_entity_data_link(entity, link) {
>  			struct media_pad *pad = link->sink->entity == entity
>  						? link->sink : link->source;
>  
> @@ -888,7 +888,7 @@ media_entity_find_link(struct media_pad *source, struct media_pad *sink)
>  {
>  	struct media_link *link;
>  
> -	list_for_each_entry(link, &source->entity->links, list) {
> +	for_each_media_entity_data_link(source->entity, link) {
>  		if (link->source->entity == source->entity &&
>  		    link->source->index == source->index &&
>  		    link->sink->entity == sink->entity &&
> @@ -904,7 +904,7 @@ struct media_pad *media_entity_remote_pad(const struct media_pad *pad)
>  {
>  	struct media_link *link;
>  
> -	list_for_each_entry(link, &pad->entity->links, list) {
> +	for_each_media_entity_data_link(pad->entity, link) {
>  		if (!(link->flags & MEDIA_LNK_FL_ENABLED))
>  			continue;
>  

-- 
Regards,

Laurent Pinchart
