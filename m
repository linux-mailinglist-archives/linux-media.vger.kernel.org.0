Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9D972796B
	for <lists+linux-media@lfdr.de>; Thu,  8 Jun 2023 10:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234451AbjFHIA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Jun 2023 04:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234286AbjFHIAW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Jun 2023 04:00:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 971662700
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 00:59:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 92CD9649E9
        for <linux-media@vger.kernel.org>; Thu,  8 Jun 2023 07:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE052C433EF;
        Thu,  8 Jun 2023 07:59:49 +0000 (UTC)
Message-ID: <8b315fe6-0d34-2f93-bf0f-7f3be0b37dbc@xs4all.nl>
Date:   Thu, 8 Jun 2023 09:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC 1/7] media: mc: Add INTERNAL_SOURCE pad type flag
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com
References: <20230505215257.60704-1-sakari.ailus@linux.intel.com>
 <20230505215257.60704-2-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230505215257.60704-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 05/05/2023 23:52, Sakari Ailus wrote:
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

'internal pad' or 'internal source pad'?

> +	  connections. Such a pad may not be connected with a link. The internal
> +	  flag indicates that the stream either starts or ends in the
> +	  entity.

This sentence makes no sense. The flag is for a pad, but then this sentence
talks about streams and entities and doesn't relate that to the pad. Also,
the flag is INTERNAL_SOURCE, and reading 'stream ends' suggests that it
should be INTERNAL_SINK in that case.

I think this needs to be more elaborate and ideally add some examples
of the use-case(s) (or refer to an example elsewhere).

 For a given pad, the INTERNAL_SOURCE flag may not be set if
> +	  either SINK or SOURCE flags is set.
>  
>  One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``

and 'MEDIA_PAD_FL_INTERNAL_SOURCE' as well?

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

Regards,

	Hans
