Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73364792539
	for <lists+linux-media@lfdr.de>; Tue,  5 Sep 2023 18:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232866AbjIEQB4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Sep 2023 12:01:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354719AbjIENuP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Sep 2023 09:50:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D78A9191
        for <linux-media@vger.kernel.org>; Tue,  5 Sep 2023 06:50:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (ftip006315900.acc1.colindale.21cn-nte.bt.net [81.134.214.249])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F64AAF2;
        Tue,  5 Sep 2023 15:48:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1693921723;
        bh=xuwVQeEDBgqPSv1v/WcwQ3SzzjktLBTCE+E9IhAyHXQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TONqdxnxJHnfr2JMlDd83lLDyTICAMac6REkcx+L+yraN29eRc5Rbird/28RZkgj/
         Prk7wqFt+XRNTsoDGLN89iYoZkaH76wA7z8qr964ZWCLrWUSEMiwgYPtSwUKilYv0f
         VtxTS1tnRheMizoQGztJ9UhXe1sHS5DTyquyii+I=
Date:   Tue, 5 Sep 2023 16:50:22 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, tomi.valkeinen@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 03/10] media: mc: Add INTERNAL pad flag
Message-ID: <20230905135022.GH11700@pendragon.ideasonboard.com>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-4-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230808075538.3043934-4-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Tue, Aug 08, 2023 at 10:55:31AM +0300, Sakari Ailus wrote:
> Internal source pads will be used as routing endpoints in V4L2
> [GS]_ROUTING IOCTLs, to indicate that the stream begins in the entity.
> 
> Also prevent creating links to pads that have been flagged as internal.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/userspace-api/media/glossary.rst             | 6 ++++++
>  Documentation/userspace-api/media/mediactl/media-types.rst | 6 ++++++
>  drivers/media/mc/mc-entity.c                               | 6 +++++-
>  include/uapi/linux/media.h                                 | 1 +
>  4 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/glossary.rst b/Documentation/userspace-api/media/glossary.rst
> index 96a360edbf3b..f7b99a4527c7 100644
> --- a/Documentation/userspace-api/media/glossary.rst
> +++ b/Documentation/userspace-api/media/glossary.rst
> @@ -173,6 +173,12 @@ Glossary
>  	An integrated circuit that integrates all components of a computer
>  	or other electronic systems.
>  
> +_media-glossary-stream:
> +    Stream
> +	A distinct flow of data (image data or metadata) over a media pipeline
> +	from source to sink. A source may be e.g. an image sensor and a sink
> +	e.g. a memory buffer.
> +
>      V4L2 API
>  	**V4L2 userspace API**
>  
> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> index 0ffeece1e0c8..28941da27790 100644
> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
>  .. _MEDIA-PAD-FL-SINK:
>  .. _MEDIA-PAD-FL-SOURCE:
>  .. _MEDIA-PAD-FL-MUST-CONNECT:
> +.. _MEDIA-PAD-FL-INTERNAL:
>  
>  .. flat-table:: Media pad flags
>      :header-rows:  0
> @@ -382,6 +383,11 @@ Types and flags used to represent the media graph elements
>  	  when this flag isn't set; the absence of the flag doesn't imply
>  	  there is none.
>  
> +    *  -  ``MEDIA_PAD_FL_INTERNAL``
> +       -  The internal flag indicates an internal pad that has no external
> +	  connections. Such a pad shall not be connected with a link. The
> +	  internal flag indicates that the :ref:``stream
> +	  <media-glossary-stream>`` either starts or ends in the entity.
>  
>  One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
>  must be set for every pad.

You also need to update the definition of "pad" in
media-controller-model.rst. That's where you should explain what an
internal pad *is*, with enough information to make it understandable to
people who haven't worked on this patches series :-) You'll probably
need a couple of paragraphs, or possibly adding text below the list of
objects.

It would be nice to fix the indentation inconsistency in that file by
the way. I'd send a patch, but it will conflict, it would be easier if
you could handle it.

> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
> index 4991281dcccc..03a9e0b8ebab 100644
> --- a/drivers/media/mc/mc-entity.c
> +++ b/drivers/media/mc/mc-entity.c
> @@ -1071,7 +1071,8 @@ int media_get_pad_index(struct media_entity *entity, u32 pad_type,
>  
>  	for (i = 0; i < entity->num_pads; i++) {
>  		if ((entity->pads[i].flags &
> -		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE)) != pad_type)
> +		     (MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_SOURCE |
> +		      MEDIA_PAD_FL_INTERNAL)) != pad_type)
>  			continue;
>  
>  		if (entity->pads[i].sig_type == sig_type)
> @@ -1094,6 +1095,9 @@ media_create_pad_link(struct media_entity *source, u16 source_pad,
>  		return -EINVAL;
>  	if (WARN_ON(!(source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE)))
>  		return -EINVAL;
> +	if (WARN_ON(source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE &&
> +		    source->pads[source_pad].flags & MEDIA_PAD_FL_INTERNAL))
> +		return -EINVAL;
>  	if (WARN_ON(!(sink->pads[sink_pad].flags & MEDIA_PAD_FL_SINK)))
>  		return -EINVAL;
>  
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 1c80b1d6bbaf..80cfd12a43fc 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -208,6 +208,7 @@ struct media_entity_desc {
>  #define MEDIA_PAD_FL_SINK			(1U << 0)
>  #define MEDIA_PAD_FL_SOURCE			(1U << 1)
>  #define MEDIA_PAD_FL_MUST_CONNECT		(1U << 2)
> +#define MEDIA_PAD_FL_INTERNAL			(1U << 3)
>  
>  struct media_pad_desc {
>  	__u32 entity;		/* entity ID */

-- 
Regards,

Laurent Pinchart
