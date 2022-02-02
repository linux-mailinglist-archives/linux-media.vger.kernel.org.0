Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 868424A7BB5
	for <lists+linux-media@lfdr.de>; Thu,  3 Feb 2022 00:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344491AbiBBXcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Feb 2022 18:32:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37394 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348011AbiBBXcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Feb 2022 18:32:50 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85C5149C;
        Thu,  3 Feb 2022 00:32:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1643844769;
        bh=7PG1YGDT03OmPOVcvAQShxeI9MUP3kjSm7LNFCNsKWo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fZlZukLFO9deBDMrIViA9xYBHCfn2j3PANsZo6fHgWwFrL/ElNqRHUYg4Op6nc74u
         nO0lchT5FxNyUR7XgTtyDFChvb93Fk4FnsSPHARSB+9qzdhjk5Gywk10PkuojY/96L
         VDmuTDgFJKgPZA6JC9o917wjdBpVIoPI5kv7da4c=
Date:   Thu, 3 Feb 2022 01:32:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org,
        sakari.ailus@linux.intel.com, hanlinchen@chromium.org,
        tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
Subject: Re: [PATCH v2 5/6] media: entity: Add support for ancillary links
Message-ID: <YfsUiuT1qtlmbQCo@pendragon.ideasonboard.com>
References: <20220130235821.48076-1-djrscally@gmail.com>
 <20220130235821.48076-6-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220130235821.48076-6-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Thank you for the patch.

On Sun, Jan 30, 2022 at 11:58:20PM +0000, Daniel Scally wrote:
> Add functions to create ancillary links, so that they don't need to
> be manually created by users.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> 
> Changes since v1:
> 
> 	- Hardcoded MEDIA_LINK_FL_IMMUTABLE and MEDIA_LINK_FL_ENABLED (Laurent)
> 
> Changes since the rfc:
> 
> 	- (Laurent) Set gobj0 and gobj1 directly instead of the other union
> 	members
> 	- (Laurent) Added MEDIA_LNK_FL_IMMUTABLE to the kerneldoc for the new
> 	create function
> 
>  drivers/media/mc/mc-entity.c | 22 ++++++++++++++++++++++
>  include/media/media-entity.h | 21 +++++++++++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 29d1285c805a..7bf2c73a3886 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1050,3 +1050,25 @@ void media_remove_intf_links(struct media_interface *intf)
>  	mutex_unlock(&mdev->graph_mutex);
>  }
>  EXPORT_SYMBOL_GPL(media_remove_intf_links);
> +
> +struct media_link *media_create_ancillary_link(struct media_entity *primary,
> +					       struct media_entity *ancillary)
> +{
> +	struct media_link *link;
> +
> +	link = media_add_link(&primary->links);
> +	if (!link)
> +		return ERR_PTR(-ENOMEM);
> +
> +	link->gobj0 = &primary->graph_obj;
> +	link->gobj1 = &ancillary->graph_obj;
> +	link->flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED |
> +		      MEDIA_LNK_FL_ANCILLARY_LINK;
> +
> +	/* Initialize graph object embedded in the new link */
> +	media_gobj_create(primary->graph_obj.mdev, MEDIA_GRAPH_LINK,
> +			  &link->graph_obj);
> +
> +	return link;
> +}
> +EXPORT_SYMBOL_GPL(media_create_ancillary_link);
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index fea489f03d57..afeda41ece4c 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -1104,6 +1104,27 @@ void media_remove_intf_links(struct media_interface *intf);
>   * it will issue a call to @operation\(@entity, @args\).
>   */
>  
> +/**
> + * media_create_ancillary_link() - create an ancillary link between two
> + *				   instances of &media_entity
> + *
> + * @primary:	pointer to the primary &media_entity
> + * @ancillary:	pointer to the ancillary &media_entity
> + *
> + * Create an ancillary link between two entities, indicating that they
> + * represent two connected pieces of hardware that form a single logical unit.

Here you say logical unit, while in patch 3/6 you use the term "physical
relationship". I think I'd go for "logical" there too.

> + * A typical example is a camera lens being linked to the sensor that it is

s/lens/lens controller/

> + * supporting.
> + *
> + * The function sets both MEDIA_LNK_FL_ENABLED and MEDIA_LNK_FL_IMMUTABLE for
> + * the new link. This behaviour may be subject to change in the future, so
> + * userspace applications using ancillary links should ensure that ancillary
> + * links are enabled when in use.

I'd drop the last two lines as this is kernel documentation, not
userspace documentation.

> + */
> +struct media_link *
> +media_create_ancillary_link(struct media_entity *primary,
> +			    struct media_entity *ancillary);

As reported by the kernel buildbot, this should go after
media_entity_call().

> +
>  #define media_entity_call(entity, operation, args...)			\
>  	(((entity)->ops && (entity)->ops->operation) ?			\
>  	 (entity)->ops->operation((entity) , ##args) : -ENOIOCTLCMD)

-- 
Regards,

Laurent Pinchart
