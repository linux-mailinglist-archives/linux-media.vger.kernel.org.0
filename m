Return-Path: <linux-media+bounces-1410-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D42F7FF086
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 14:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC0031C20D37
	for <lists+linux-media@lfdr.de>; Thu, 30 Nov 2023 13:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17FC482D4;
	Thu, 30 Nov 2023 13:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ox4zOnnG"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C00C4;
	Thu, 30 Nov 2023 05:45:46 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C80155;
	Thu, 30 Nov 2023 14:45:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701351907;
	bh=XHpARKgcvdjeAqbtIxtvOde4zZgRWl+NFysb0Gz1TpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ox4zOnnGPuQWmJwVUbeyvRZWzI2YNcP8mXjBQ9GlN7B45LOxdmpB75fncpTJzv6X4
	 bUnOrXo9MY1a/MkSyXx2fijg8PJv1AEHuNurpX+O9OyUP5kVscyupg3kUkZg+ZH2Vr
	 /n+g0BvDG8wle0BfT+1NOcUcdBfw/HkJg85dFsNM=
Date: Thu, 30 Nov 2023 15:45:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Elder <paul.elder@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	kieran.bingham@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	umang.jain@ideasonboard.com, Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	"moderated list:ARM/Rockchip SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] media: rkisp1: regs: Consolidate MI interrupt wrap
 fields
Message-ID: <20231130134550.GN8402@pendragon.ideasonboard.com>
References: <20231129092956.250129-1-paul.elder@ideasonboard.com>
 <20231129092956.250129-2-paul.elder@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231129092956.250129-2-paul.elder@ideasonboard.com>

Hi Paul,

Thank you for the patch.

On Wed, Nov 29, 2023 at 06:29:54PM +0900, Paul Elder wrote:
> Consolidate the wraparound fields in the memory interface interrupt
> status registers, so that it can be more succinctly expressed by taking
> the stream ID (main or self) as a parameter.
> 
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index 350f452e676f..bea69a0d766a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -172,12 +172,9 @@
>  #define RKISP1_CIF_MI_FRAME(stream)			BIT((stream)->id)
>  #define RKISP1_CIF_MI_MBLK_LINE				BIT(2)
>  #define RKISP1_CIF_MI_FILL_MP_Y				BIT(3)
> -#define RKISP1_CIF_MI_WRAP_MP_Y				BIT(4)
> -#define RKISP1_CIF_MI_WRAP_MP_CB			BIT(5)
> -#define RKISP1_CIF_MI_WRAP_MP_CR			BIT(6)
> -#define RKISP1_CIF_MI_WRAP_SP_Y				BIT(7)
> -#define RKISP1_CIF_MI_WRAP_SP_CB			BIT(8)
> -#define RKISP1_CIF_MI_WRAP_SP_CR			BIT(9)
> +#define RKISP1_CIF_MI_WRAP_Y(stream)			BIT(4 + (stream)->id * 3)
> +#define RKISP1_CIF_MI_WRAP_CB(stream)			BIT(5 + (stream)->id * 3)
> +#define RKISP1_CIF_MI_WRAP_CR(stream)			BIT(6 + (stream)->id * 3)
>  #define RKISP1_CIF_MI_DMA_READY				BIT(11)
>  
>  /* MI_STATUS */

-- 
Regards,

Laurent Pinchart

