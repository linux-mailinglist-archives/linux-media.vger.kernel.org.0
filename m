Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6D267BA03C
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 16:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233946AbjJEOex (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 10:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234565AbjJEOcy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 10:32:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C4623D1E
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 04:05:03 -0700 (PDT)
Received: from [192.168.88.20] (91-157-153-81.elisa-laajakaista.fi [91.157.153.81])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 510ED552;
        Thu,  5 Oct 2023 13:03:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1696503793;
        bh=dkzKz6edS0EMeqf/EmoM8Q11UiLv42EX79ax28dsAT8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=J6pXUhk0iN26NANZU96yMXZBd12YNV0ZKmu41pdU/t+nclJ4hV1nMmtK+az/P8jTk
         UH2pyXK8LQ51qy55nQwmD4PCE7trnnS19GzvmEnNolV5zjXSixGsAx4rHSBGDFueVb
         Yof7KBPmm1Atx5hPIdlIcB95H7eA6cJbgm0P4i6E=
Message-ID: <0e29af0c-9bd9-4861-6d18-4d3ec5c3ee33@ideasonboard.com>
Date:   Thu, 5 Oct 2023 14:04:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 01/28] media: mc: Add INTERNAL pad flag
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-2-sakari.ailus@linux.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20231003115237.76828-2-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/10/2023 14:52, Sakari Ailus wrote:
> Internal source pads will be used as routing endpoints in V4L2
> [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.

It would probably be good to explain here and in the comments/docs, that 
a sink pad is a source pad =). When you say above "internal source pad", 
it's actually MEDIA_PAD_FL_INTERNAL | MEDIA_PAD_FL_SINK. I think this 
will confuse people time and time again, so it's probably good to 
explain it in as many places as possible.

> Also prevent creating links to pads that have been flagged as internal and
> initialising source pads with internal flag set.
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   Documentation/userspace-api/media/glossary.rst         |  6 ++++++
>   .../userspace-api/media/mediactl/media-types.rst       |  6 ++++++
>   drivers/media/mc/mc-entity.c                           | 10 ++++++++--
>   include/uapi/linux/media.h                             |  1 +
>   4 files changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> index 96a360edbf3b..f7b99a4527c7 100644
> --- a/Documentation/userspace-api/media/glossary.rst
> +++ b/Documentation/userspace-api/media/glossary.rst
> @@ -173,6 +173,12 @@ Glossary
>   	An integrated circuit that integrates all components of a computer
>   	or other electronic systems.
>   
> +_media-glossary-stream:
> +    Stream
> +	A distinct flow of data (image data or metadata) over a media pipeline
> +	from source to sink. A source may be e.g. an image sensor and a sink
> +	e.g. a memory buffer.
> +
>       V4L2 API
>   	**V4L2 userspace API**
>   
> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> index 0ffeece1e0c8..28941da27790 100644
> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
>   .. _MEDIA-PAD-FL-SINK:
>   .. _MEDIA-PAD-FL-SOURCE:
>   .. _MEDIA-PAD-FL-MUST-CONNECT:
> +.. _MEDIA-PAD-FL-INTERNAL:
>   
>   .. flat-table:: Media pad flags
>       :header-rows:  0
> @@ -382,6 +383,11 @@ Types and flags used to represent the media graph elements
>   	  when this flag isn't set; the absence of the flag doesn't imply
>   	  there is none.
>   
> +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> +       -  The internal flag indicates an internal pad that has no external
> +	  connections. Such a pad shall not be connected with a link. The
> +	  internal flag indicates that the :ref:``stream
> +	  <media-glossary-stream>`` either starts or ends in the entity.
>   
>   One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
>   must be set for every pad.
> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 543a392f8635..f5f290781021 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -213,7 +213,9 @@ int media_entity_pads_init(struct media_entity *entity, u16 num_pads,
>   		iter->index = i++;
>   
>   		if (hweight32(iter->flags & (MEDIA_PAD_FL_SINK |
> -					     MEDIA_PAD_FL_SOURCE)) != 1) {
> +					     MEDIA_PAD_FL_SOURCE)) != 1 ||
> +		    (iter->flags & MEDIA_PAD_FL_INTERNAL &&
> +		     !(iter->flags & MEDIA_PAD_FL_SINK))) {
>   			ret = -EINVAL;
>   			break;

Would it make sense to have this "only internal-sinks supported"-check 
as a separate check, with an error print? It is a valid thing to do, we 
just want to disable it for the time being.

>   		}
> @@ -1075,7 +1077,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
>   
>   	for (i = 0; i < entity->num_pads; i++) {
>   		if ((entity->pads[i].flags &
> -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
> +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> +		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
>   			continue;
>   
>   		if (entity->pads[i].sig_type == sig_type)
> @@ -1100,6 +1103,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
>   		return -EINVAL;
>   	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
>   		return -EINVAL;
> +	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL) ||
> +	    WARN_ON(source->pads[sink_pad].flags & MEDIA_PAD_FL_INTERNAL))
> +		return -EINVAL;
>   
>   	link = media_add_link(&source->links);
>   	if (link == NULL)
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 1c80b1d6bbaf..80cfd12a43fc 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -208,6 +208,7 @@ struct media_entity_desc {
>   #define MEDIA_PAD_FL_SINK			(1U << 0)
>   #define MEDIA_PAD_FL_SOURCE			(1U << 1)
>   #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
> +#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
>   
>   struct media_pad_desc {
>   	__u32 entity;		/* entity ID */

