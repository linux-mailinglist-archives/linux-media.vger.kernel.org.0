Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC152DBFDE
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 12:54:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbgLPLyv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 06:54:51 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40614 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725957AbgLPLyu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 06:54:50 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E7D822CF;
        Wed, 16 Dec 2020 12:54:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608119649;
        bh=WlmyK4li8v71/hUEgr/biZ+2rK5Z8+jZfzUPyAvY5wg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kwJ52x1H7gR1YNJJducgLQJ4cUmIWUJmVx4WdyVvJYVOCp4LRLtwC947auoZYkj/G
         hdTsYIRe1OiVy+WZ+VwoDCmXP9zI2KXjcuKg930EWpdsHobWO4bB/JoXHBXeBb7eJS
         EpXlmrkV/Tn04O4R+a3K5ULn+/AknYb5AbUkc8t0=
Date:   Wed, 16 Dec 2020 13:54:02 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: vsp1: Use BIT macro for feature identification
Message-ID: <X9n1WqtWBbWlZ0LL@pendragon.ideasonboard.com>
References: <20201216114548.818985-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201216114548.818985-1-kieran.bingham+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wed, Dec 16, 2020 at 11:45:48AM +0000, Kieran Bingham wrote:
> These entries can only ever be single bits. Make use of the BIT macro
> accordingly.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> A minor trivial patch to convert the features to use BIT.
> This is used by a patch I have locally for the upcoming VSPX support
> where we introduce a new IIF feature.
> 
> That won't be sent for some time, and this update stands on it's own, so
> sending here.
> 
> 
>  drivers/media/platform/vsp1/vsp1.h | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/vsp1/vsp1.h b/drivers/media/platform/vsp1/vsp1.h
> index 56c62122a81a..37cf33c7e6ca 100644
> --- a/drivers/media/platform/vsp1/vsp1.h
> +++ b/drivers/media/platform/vsp1/vsp1.h
> @@ -44,16 +44,16 @@ struct vsp1_uif;
>  #define VSP1_MAX_UIF		2
>  #define VSP1_MAX_WPF		4
>  
> -#define VSP1_HAS_LUT		(1 << 1)
> -#define VSP1_HAS_SRU		(1 << 2)
> -#define VSP1_HAS_BRU		(1 << 3)
> -#define VSP1_HAS_CLU		(1 << 4)
> -#define VSP1_HAS_WPF_VFLIP	(1 << 5)
> -#define VSP1_HAS_WPF_HFLIP	(1 << 6)
> -#define VSP1_HAS_HGO		(1 << 7)
> -#define VSP1_HAS_HGT		(1 << 8)
> -#define VSP1_HAS_BRS		(1 << 9)
> -#define VSP1_HAS_EXT_DL		(1 << 10)
> +#define VSP1_HAS_LUT		BIT(1)
> +#define VSP1_HAS_SRU		BIT(2)
> +#define VSP1_HAS_BRU		BIT(3)
> +#define VSP1_HAS_CLU		BIT(4)
> +#define VSP1_HAS_WPF_VFLIP	BIT(5)
> +#define VSP1_HAS_WPF_HFLIP	BIT(6)
> +#define VSP1_HAS_HGO		BIT(7)
> +#define VSP1_HAS_HGT		BIT(8)
> +#define VSP1_HAS_BRS		BIT(9)
> +#define VSP1_HAS_EXT_DL		BIT(10)
>  
>  struct vsp1_device_info {
>  	u32 version;

-- 
Regards,

Laurent Pinchart
