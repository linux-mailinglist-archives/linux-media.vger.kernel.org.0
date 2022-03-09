Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFBA4D320B
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 16:45:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233934AbiCIPql (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 10:46:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbiCIPqk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 10:46:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF4BB1107C8
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 07:45:41 -0800 (PST)
Received: from [IPV6:2a01:e0a:169:7140:3734:287e:1a7f:9772] (unknown [IPv6:2a01:e0a:169:7140:3734:287e:1a7f:9772])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AFD2A50;
        Wed,  9 Mar 2022 16:45:40 +0100 (CET)
Message-ID: <d22add5e-8c39-e5b9-453d-4a4ff809d098@gmail.com>
Date:   Wed, 9 Mar 2022 16:45:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/5] media: entity: Add support for ancillary links
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20220302220304.1327896-1-djrscally@gmail.com>
 <20220302220304.1327896-5-djrscally@gmail.com>
From:   Jean-Michel Hautbois <jeanmichel.hautbois@gmail.com>
In-Reply-To: <20220302220304.1327896-5-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NICE_REPLY_A,NML_ADSP_CUSTOM_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi !

Thanks for the patch !

On 02/03/2022 23:03, Daniel Scally wrote:
> Add functions to create ancillary links, so that they don't need to
> be manually created by users.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>

> ---
> 
> Changes since v2:
> 
> 	- Fixed some typos and comment phrasing (Laurent)
> 	- Changed the position of the new function to go after media_entity_call()
> 	(Laurent)
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
>   drivers/media/mc/mc-entity.c | 22 ++++++++++++++++++++++
>   include/media/media-entity.h | 19 +++++++++++++++++++
>   2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 1a7d0a4fb9e8..d7e2f78a83cc 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1032,3 +1032,25 @@ void media_remove_intf_links(struct media_interface *intf)
>   	mutex_unlock(&mdev->graph_mutex);
>   }
>   EXPORT_SYMBOL_GPL(media_remove_intf_links);
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
> index fea489f03d57..2a58defc4886 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -1108,4 +1108,23 @@ void media_remove_intf_links(struct media_interface *intf);
>   	(((entity)->ops && (entity)->ops->operation) ?			\
>   	 (entity)->ops->operation((entity) , ##args) : -ENOIOCTLCMD)
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
> + * A typical example is a camera lens controller being linked to the sensor that
> + * it is supporting.
> + *
> + * The function sets both MEDIA_LNK_FL_ENABLED and MEDIA_LNK_FL_IMMUTABLE for
> + * the new link.
> + */
> +struct media_link *
> +media_create_ancillary_link(struct media_entity *primary,
> +			    struct media_entity *ancillary);
> +
>   #endif

