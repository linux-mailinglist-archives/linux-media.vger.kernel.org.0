Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5D222CE95
	for <lists+linux-media@lfdr.de>; Fri, 24 Jul 2020 21:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgGXTVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jul 2020 15:21:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47564 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbgGXTVD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jul 2020 15:21:03 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8D990538;
        Fri, 24 Jul 2020 21:20:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595618459;
        bh=2JZm1KdMmDSqj/9d1IlQ04Y2y+SNFCLN5o3y0I4H6Ak=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WYMHYHG4BYlJgED3y4HqzakTdYHDzMzDOOZj+DDzY1CurpbxxnjQvDqfrh6iylggd
         Xec/mIJZOIV2bjLGgfRPUi2rvqeKFTJOFC9YVYBL6pfSWOc6wZp6sCDZyTA3BoKbkn
         MqDL16DVQSU1XyOVatu+CC9hynf2ZuS4qNlVGnqA=
Date:   Fri, 24 Jul 2020 22:20:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Garrit Franke <garritfranke@gmail.com>
Cc:     sakari.ailus@linux.intel.com, linux-media@vger.kernel.org,
        mchehab@kernel.org, trivial@kernel.org
Subject: Re: [PATCH] trivial: uapi: replace bitshifts with BIT macro
Message-ID: <20200724192052.GB5921@pendragon.ideasonboard.com>
References: <20200724190118.24020-1-garritfranke@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724190118.24020-1-garritfranke@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Garrit,

Thank you for the patch.

On Fri, Jul 24, 2020 at 09:01:18PM +0200, Garrit Franke wrote:

A commit message would be nice.

> Signed-off-by: Garrit Franke <garritfranke@gmail.com>
> ---
>  include/uapi/linux/media.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 383ac7b7d8..5710ba0c83 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -142,8 +142,8 @@ struct media_device_info {
>  #define MEDIA_ENT_F_DV_ENCODER			(MEDIA_ENT_F_BASE + 0x6002)
>  
>  /* Entity flags */
> -#define MEDIA_ENT_FL_DEFAULT			(1 << 0)
> -#define MEDIA_ENT_FL_CONNECTOR			(1 << 1)
> +#define MEDIA_ENT_FL_DEFAULT			BIT(0)
> +#define MEDIA_ENT_FL_CONNECTOR			BIT(1)

The BIT() macro isn't available in the uapi headers.

>  
>  /* OR with the entity id value to find the next entity */
>  #define MEDIA_ENT_ID_FLAG_NEXT			(1U << 31)
> @@ -207,9 +207,9 @@ struct media_entity_desc {
>  	};
>  };
>  
> -#define MEDIA_PAD_FL_SINK			(1 << 0)
> -#define MEDIA_PAD_FL_SOURCE			(1 << 1)
> -#define MEDIA_PAD_FL_MUST_CONNECT		(1 << 2)
> +#define MEDIA_PAD_FL_SINK				BIT(0)
> +#define MEDIA_PAD_FL_SOURCE				BIT(1)
> +#define MEDIA_PAD_FL_MUST_CONNECT		BIT(2)
>  
>  struct media_pad_desc {
>  	__u32 entity;		/* entity ID */
> @@ -218,13 +218,13 @@ struct media_pad_desc {
>  	__u32 reserved[2];
>  };
>  
> -#define MEDIA_LNK_FL_ENABLED			(1 << 0)
> -#define MEDIA_LNK_FL_IMMUTABLE			(1 << 1)
> -#define MEDIA_LNK_FL_DYNAMIC			(1 << 2)
> +#define MEDIA_LNK_FL_ENABLED			BIT(0)
> +#define MEDIA_LNK_FL_IMMUTABLE			BIT(1)
> +#define MEDIA_LNK_FL_DYNAMIC			BIT(2)
>  
>  #define MEDIA_LNK_FL_LINK_TYPE			(0xf << 28)
>  #  define MEDIA_LNK_FL_DATA_LINK		(0 << 28)
> -#  define MEDIA_LNK_FL_INTERFACE_LINK		(1 << 28)
> +#  define MEDIA_LNK_FL_INTERFACE_LINK		BIT(28)

This is wrong, BIT() should only be used for fields that are 1-bit wide.
If you look at MEDIA_LNK_FL_LINK_TYPE you can see the field is 4-bits
wide, it stores a value between 0 and 15. MEDIA_LNK_FL_INTERFACE_LINK
happens to match the (1 << n) pattern, but it doesn't mean it's a single
bit field.

>  
>  struct media_link_desc {
>  	struct media_pad_desc source;
> @@ -433,7 +433,7 @@ struct media_v2_topology {
>  #define MEDIA_INTF_T_ALSA_TIMER                (MEDIA_INTF_T_ALSA_BASE + 7)
>  
>  /* Obsolete symbol for media_version, no longer used in the kernel */
> -#define MEDIA_API_VERSION			((0 << 16) | (1 << 8) | 0)
> +#define MEDIA_API_VERSION			((0 << 16) | BIT(8) | 0)

Even worse here, this is clearly not a bitfield.

>  
>  #endif
>  

-- 
Regards,

Laurent Pinchart
