Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB1B36E36B
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 04:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhD2Cyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 22:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbhD2Cyu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 22:54:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5A97C06138B
        for <linux-media@vger.kernel.org>; Wed, 28 Apr 2021 19:54:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36999BC0;
        Thu, 29 Apr 2021 04:54:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619664842;
        bh=92ztRtJ9DGOjym4pRngtfCYkX+iV4y/zOFn5lu8jlcg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cDxXOfFDxZqMjRn8Maxnrosa4R+MlKrvQmwGwrwOEFYgBBamHjZQ8Ap52gJIUAdo8
         EsxfaRzoiwPIxtg1U3nv+7Z26ZTGtKqrEv1VFnv/ZNFbhwDl8TYEfSxDjKcNNWJdF0
         pByP1xUw8nFT68OdqEIH32afKdz9CkXGE5m2eBHE=
Date:   Thu, 29 Apr 2021 05:53:56 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v6 22/24] media: uapi: add MEDIA_PAD_FL_MULTIPLEXED flag
Message-ID: <YIofxE3idwWgJGTr@pendragon.ideasonboard.com>
References: <20210427124523.990938-1-tomi.valkeinen@ideasonboard.com>
 <20210427124523.990938-23-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210427124523.990938-23-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Apr 27, 2021 at 03:45:21PM +0300, Tomi Valkeinen wrote:
> Add a pad flag to indicate that the pad uses multiplexed streams. A pad
> with multiplexed streams won't support pad format configuration and e.g.
> VIDIOC_SUBDEV_S_FMT should return -ENOIOCTLCMD.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  Documentation/userspace-api/media/mediactl/media-types.rst | 6 ++++++
>  include/uapi/linux/media.h                                 | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> index 0a26397bd01d..d1dca50649f9 100644
> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
>  .. _MEDIA-PAD-FL-SINK:
>  .. _MEDIA-PAD-FL-SOURCE:
>  .. _MEDIA-PAD-FL-MUST-CONNECT:
> +.. _MEDIA-PAD-FL-MULTIPLEXED:
>  
>  .. flat-table:: Media pad flags
>      :header-rows:  0
> @@ -382,6 +383,11 @@ Types and flags used to represent the media graph elements
>  	  when this flag isn't set; the absence of the flag doesn't imply
>  	  there is none.
>  
> +    *  -  ``MEDIA_PAD_FL_MULTIPLEXED``
> +       -  The pad has multiplexed streams. A pad with multiplexed streams
> +          won't support pad format configuration and e.g. VIDIOC_SUBDEV_S_FMT
> +          should return -ENOIOCTLCMD.

This should also mention if the flag is set by drivers or by userspace,
and if it static or can change dynamically. If it can change
dynamically, the documentation should explain the circumstances under
which the flag can change.

Other than expanding the documentation, I see no issue here, this looks
good.

> +
>  
>  One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
>  must be set for every pad.
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 200fa8462b90..bdaadef80cbd 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -211,6 +211,7 @@ struct media_entity_desc {
>  #define MEDIA_PAD_FL_SINK			(1 << 0)
>  #define MEDIA_PAD_FL_SOURCE			(1 << 1)
>  #define MEDIA_PAD_FL_MUST_CONNECT		(1 << 2)
> +#define MEDIA_PAD_FL_MULTIPLEXED		(1 << 3)
>  
>  struct media_pad_desc {
>  	__u32 entity;		/* entity ID */

-- 
Regards,

Laurent Pinchart
