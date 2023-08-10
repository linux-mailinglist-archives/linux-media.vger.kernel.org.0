Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE0B5777A35
	for <lists+linux-media@lfdr.de>; Thu, 10 Aug 2023 16:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234556AbjHJOMY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Aug 2023 10:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232960AbjHJOMX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Aug 2023 10:12:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F5810C7
        for <linux-media@vger.kernel.org>; Thu, 10 Aug 2023 07:12:23 -0700 (PDT)
Received: from ideasonboard.com (mob-5-90-14-125.net.vodafone.it [5.90.14.125])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C3E8DD8B;
        Thu, 10 Aug 2023 16:11:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1691676673;
        bh=oTxPuT4NvOfKw780Lgb9pEzCl94KXeTHT/vWs3hQY2w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nGoK51mSNGmAVBF8q53OmOtKDkEG3OitPiIxkBumP9c5utxR640F2RR72sewbX6hs
         feWv6UWbqTM6kOeSmj5x34CO43VxrCGHIkK4UZBPh3tA3a0b1GiJ6Wl/truaXEYZBG
         /04R+1uigkasAuXlG49IcScLhDaMMF/VF0htSQYQ=
Date:   Thu, 10 Aug 2023 16:12:18 +0200
From:   Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 03/10] media: mc: Add INTERNAL pad flag
Message-ID: <frwh2hqesatlwhxqlesujfhwdvhrsxux5b5p2hsqrqqdzebrwz@2squt4aelrac>
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

Hi Sakari

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

Why do you need to check for this again here ? Hasn't the previous
if() clause just validated that

        source->pads[source_pad].flags & MEDIA_PAD_FL_SOURCE ?

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
> --
> 2.39.2
>
