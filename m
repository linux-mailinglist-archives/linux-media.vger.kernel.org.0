Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 875041933BD
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 23:26:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbgCYW00 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 18:26:26 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49014 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgCYW00 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 18:26:26 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5286780C;
        Wed, 25 Mar 2020 23:26:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1585175184;
        bh=q29DFtLacMDg2oCFUW//v3UN1iGhCP5VE428xshUGRU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tVQb8NMTSaiBcHIq+qvvDRPx7lOeNd6kTsN1te98TZAAGd38/sjBMHMp5TzwqftIf
         /W4ack1uBilWSRY2hMMTREBgMPcCA7z5j+OBWAONG4grVHjGtlgYxNYZq1fcq7U5k+
         5JJM3e7atrw1emS+FHG/evvNCvDi6DsIF85veGC8=
Date:   Thu, 26 Mar 2020 00:26:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: Re: [PATCH 1/2] media: media.h: Add a pad flag MEDIA_PAD_FL_METADATA
Message-ID: <20200325222621.GX19171@pendragon.ideasonboard.com>
References: <20200325212704.29862-1-dafna.hirschfeld@collabora.com>
 <20200325212704.29862-2-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200325212704.29862-2-dafna.hirschfeld@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Wed, Mar 25, 2020 at 10:27:03PM +0100, Dafna Hirschfeld wrote:
> Add a flag to the flags field of 'struct media_pad_desc'
> that indicates that the data transmitted by the pad is
> metadata.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  Documentation/media/uapi/mediactl/media-types.rst | 4 ++++
>  include/uapi/linux/media.h                        | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/Documentation/media/uapi/mediactl/media-types.rst b/Documentation/media/uapi/mediactl/media-types.rst
> index 3af6a414b501..4ca902478971 100644
> --- a/Documentation/media/uapi/mediactl/media-types.rst
> +++ b/Documentation/media/uapi/mediactl/media-types.rst
> @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
>  .. _MEDIA-PAD-FL-SINK:
>  .. _MEDIA-PAD-FL-SOURCE:
>  .. _MEDIA-PAD-FL-MUST-CONNECT:
> +.. _MEDIA-PAD-FL-METADATA:
>  
>  .. flat-table:: Media pad flags
>      :header-rows:  0
> @@ -381,6 +382,9 @@ Types and flags used to represent the media graph elements
>  	  configuration dependent) for the pad to need enabled links even
>  	  when this flag isn't set; the absence of the flag doesn't imply
>  	  there is none.
> +    *  -  ``MEDIA_PAD_FL_METADATA``
> +       -  This flag indicates that the data transmitted by the pad is of
> +          type metadata.
>  
>  
>  One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 383ac7b7d8f0..ae37226eb5c9 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -210,6 +210,7 @@ struct media_entity_desc {
>  #define MEDIA_PAD_FL_SINK			(1 << 0)
>  #define MEDIA_PAD_FL_SOURCE			(1 << 1)
>  #define MEDIA_PAD_FL_MUST_CONNECT		(1 << 2)
> +#define MEDIA_PAD_FL_METADATA			(1 << 3)

I think we need to reserve a few bits here. We'll have more than
metadata. Audio comes to mind, there will likely be more. Having
independent flags would not only waste a bit of space in the bitfield
(not that we're about to run out of bits, but still), but would make it
possible to specify invalid configurations such as MEDIA_PAD_FL_METADATA
| MEDIA_PAD_FL_AUDIO. And now that I've written this, I realize that
audio metadata could be a thing, so maybe a metadata flag is actually
the best option :-)

There are pros and cons for both options, so I won't recommend one.

>  struct media_pad_desc {
>  	__u32 entity;		/* entity ID */

-- 
Regards,

Laurent Pinchart
