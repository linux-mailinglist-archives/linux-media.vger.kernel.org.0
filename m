Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3577B71FD87
	for <lists+linux-media@lfdr.de>; Fri,  2 Jun 2023 11:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbjFBJUg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Jun 2023 05:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235219AbjFBJTw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Jun 2023 05:19:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8CE1E62
        for <linux-media@vger.kernel.org>; Fri,  2 Jun 2023 02:18:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp [126.156.168.104])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 174977FC;
        Fri,  2 Jun 2023 11:18:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685697503;
        bh=Wxg4SCbtWUQam7Ix3tE3qjPoo7w+/pdms8Qwag6f260=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dsQY5JXniX6mFteFfDhJVURPnIeZx1EnECyABgHKoSyigc4Zvox6MGflbKZGnttEc
         XE76Hm4qsr8HJgS7FctW3XN74SJIV6vorkmoLu/wFsBhn2B1hkxUuFsJ8iJZM+SZVi
         8Rt3cE5Jm8gGHzIZ7fwgqwvvMxlRs6QUxe830STA=
Date:   Fri, 2 Jun 2023 12:18:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
Subject: Re: [RFC 1/7] media: mc: Add INTERNAL_SOURCE pad type flag
Message-ID: <20230602091844.GE19463@pendragon.ideasonboard.com>
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230505215257.60704-2-sakari.ailus@linux.intel.com>
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

On Sat, May 06, 2023 at 12:52:51AM +0300, Sakari Ailus wrote:
> Internal source pads will be used as routing endpoints in V4L2
> [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> 
> Also prevent creating links to pads that have been flagged as internal.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  .../userspace-api/media/mediactl/media-types.rst          | 7 +++++++
>  drivers/media/mc/mc-entity.c                              | 8 +++++++-
>  include/uapi/linux/media.h                                | 1 +
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> index 0ffeece1e0c8..c724139ad46c 100644
> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
>  .. _MEDIA-PAD-FL-SINK:
>  .. _MEDIA-PAD-FL-SOURCE:
>  .. _MEDIA-PAD-FL-MUST-CONNECT:
> +.. _MEDIA-PAD-FL-INTERNAL-SOURCE:
>  
>  .. flat-table:: Media pad flags
>      :header-rows:  0
> @@ -382,6 +383,12 @@ Types and flags used to represent the media graph elements
>  	  when this flag isn't set; the absence of the flag doesn't imply
>  	  there is none.
>  
> +    *  -  ``MEDIA_PAD_FL_INTERNAL_SOURCE``
> +       -  This flag indicates an internal pad that has no external
> +	  connections. Such a pad may not be connected with a link. The internal
> +	  flag indicates that the stream either starts or ends in the

There's no mention of "stream" (with this meaning) anywhere in the MC
API documentation, so you will need to explain streams first.

Apart from that, and addressing Tomi's comment, this patch seems OK.

> +	  entity. For a given pad, the INTERNAL_SOURCE flag may not be set if
> +	  either SINK or SOURCE flags is set.
>  
>  One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
>  must be set for every pad.
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index ef34ddd715c9..ed99160a2487 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1062,7 +1062,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
>  
>  	for (i = 0; i < entity->num_pads; i++) {
>  		if ((entity->pads[i].flags &
> -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
> +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> +		      MEDIA_PAD_FL_INTERNAL_SOURCE)) != pad_type)
>  			continue;
>  
>  		if (entity->pads[i].sig_type == sig_type)
> @@ -1087,6 +1088,11 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
>  		return -EINVAL;
>  	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
>  		return -EINVAL;
> +	if (WARN_ON(sink->pads[sink_pad].flags &
> +		    MEDIA_PAD_FL_INTERNAL_SOURCE) ||
> +	    WARN_ON(source->pads[source_pad].flags &
> +		    MEDIA_PAD_FL_INTERNAL_SOURCE))
> +		return -EINVAL;
>  
>  	link = media_add_link(&source->links);
>  	if (link == NULL)
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index edb8dfef9eba..0e2577e8b425 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -208,6 +208,7 @@ struct media_entity_desc {
>  #define MEDIA_PAD_FL_SINK			(1U << 0)
>  #define MEDIA_PAD_FL_SOURCE			(1U << 1)
>  #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
> +#define MEDIA_PAD_FL_INTERNAL_SOURCE		(1U << 3)
>  
>  struct media_pad_desc {
>  	__u32 entity;		/* entity ID */

-- 
Regards,

Laurent Pinchart
