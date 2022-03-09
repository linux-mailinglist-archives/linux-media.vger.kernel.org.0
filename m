Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF7374D3200
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 16:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232858AbiCIPpK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 10:45:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230129AbiCIPpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 10:45:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A605F38794
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 07:44:05 -0800 (PST)
Received: from [IPV6:2a01:e0a:169:7140:3734:287e:1a7f:9772] (unknown [IPv6:2a01:e0a:169:7140:3734:287e:1a7f:9772])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2EC7A50;
        Wed,  9 Mar 2022 16:44:03 +0100 (CET)
Message-ID: <4e5c35d7-8299-3973-8430-5f8155607c97@gmail.com>
Date:   Wed, 9 Mar 2022 16:44:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/5] media: entity: Add link_type_name() helper
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org
Cc:     sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        hanlinchen@chromium.org, tfiga@chromium.org, hdegoede@redhat.com,
        kieran.bingham@ideasonboard.com, hpa@redhat.com
References: <20220302220304.1327896-1-djrscally@gmail.com>
 <20220302220304.1327896-4-djrscally@gmail.com>
From:   Jean-Michel Hautbois <jeanmichel.hautbois@gmail.com>
In-Reply-To: <20220302220304.1327896-4-djrscally@gmail.com>
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
> Now we have three types of media link, printing the right name during
> debug output is slightly more complicated. Add a helper function to
> make it easier.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Reviewed-by: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>

> ---
> 
> Changes since v2:
> 
> 	- None
> 
> Changes since v1:
> 
> 	- renamed function to link_type_name() (Laurent)
> 
> Changes since the rfc:
> 
> 	- new patch
> 
>   drivers/media/mc/mc-entity.c | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index d0563ee4b28b..1a7d0a4fb9e8 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -44,6 +44,20 @@ static inline const char *intf_type(struct media_interface *intf)
>   	}
>   };
>   
> +static inline const char *link_type_name(struct media_link *link)
> +{
> +	switch (link->flags & MEDIA_LNK_FL_LINK_TYPE) {
> +	case MEDIA_LNK_FL_DATA_LINK:
> +		return "data";
> +	case MEDIA_LNK_FL_INTERFACE_LINK:
> +		return "interface";
> +	case MEDIA_LNK_FL_ANCILLARY_LINK:
> +		return "ancillary";
> +	default:
> +		return "unknown";
> +	}
> +}
> +
>   __must_check int __media_entity_enum_init(struct media_entity_enum *ent_enum,
>   					  int idx_max)
>   {
> @@ -89,9 +103,7 @@ static void dev_dbg_obj(const char *event_name,  struct media_gobj *gobj)
>   
>   		dev_dbg(gobj->mdev->dev,
>   			"%s id %u: %s link id %u ==> id %u\n",
> -			event_name, media_id(gobj),
> -			media_type(link->gobj0) == MEDIA_GRAPH_PAD ?
> -				"data" : "interface",
> +			event_name, media_id(gobj), link_type_name(link),
>   			media_id(link->gobj0),
>   			media_id(link->gobj1));
>   		break;

