Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2281A2169
	for <lists+linux-media@lfdr.de>; Wed,  8 Apr 2020 14:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728072AbgDHMKX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Apr 2020 08:10:23 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59478 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbgDHMKX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Apr 2020 08:10:23 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EB4FB522;
        Wed,  8 Apr 2020 14:10:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586347821;
        bh=0RVmavHkVibnxpVdIQn+9bbiCkla5GEqa64mmvd5tbk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tKbvQSyPBTjLgBDODAJmeQwvB6NKGfzpGd+rkMaJ1i5gjVtAMmTfE1DW3P7XFK5hC
         i72+c/vAWoItMpgKv+uFbjUdY4NsEjtHdptIfGBZqbp2w3xG+P5Gmr1i+jNQgqtqmF
         +yFi2wuUHymdHhv2lo18jmtsmgOpLZwlAacBFj+M=
Date:   Wed, 8 Apr 2020 15:10:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: Re: [PATCH v3 3/6] media: staging: rkisp1: cap: change the logic for
 writing to uv swap register
Message-ID: <20200408121011.GE4881@pendragon.ideasonboard.com>
References: <20200408114822.27360-1-dafna.hirschfeld@collabora.com>
 <20200408114822.27360-4-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200408114822.27360-4-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Wed, Apr 08, 2020 at 01:48:19PM +0200, Dafna Hirschfeld wrote:
> The register RKISP1_CIF_MI_XTD_FORMAT_CTRL is currently written
> with "on" only if the u,v streams need to be swapped. This patch
> also write to it with "off" if they don't need to be swapped.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

I think you can squash this with 1/6 and 2/6.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 21 ++++++++++---------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 5d0e489505f0..4830083c33fd 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -383,12 +383,12 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
>  		     cap->config->mi.cr_size_init);
>  
>  	rkisp1_irq_frame_end_enable(cap);
> -	if (cap->pix.cfg->uv_swap) {
> -		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
> -
> +	reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
> +	if (cap->pix.cfg->uv_swap)
>  		reg |= RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
> -		rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
> -	}
> +	else
> +		reg &= ~RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
> +	rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>  
>  	rkisp1_mi_config_ctrl(cap);
>  
> @@ -406,7 +406,7 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
>  {
>  	const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
>  	struct rkisp1_device *rkisp1 = cap->rkisp1;
> -	u32 mi_ctrl;
> +	u32 mi_ctrl, reg;
>  
>  	rkisp1_write(rkisp1, rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_Y),
>  		     cap->config->mi.y_size_init);
> @@ -420,12 +420,13 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
>  	rkisp1_write(rkisp1, cap->sp_y_stride, RKISP1_CIF_MI_SP_Y_LLENGTH);
>  
>  	rkisp1_irq_frame_end_enable(cap);
> -	if (cap->pix.cfg->uv_swap) {
> -		u32 reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>  
> +	reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
> +	if (cap->pix.cfg->uv_swap)
>  		reg |= RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
> -		rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
> -	}
> +	else
> +		reg &= ~RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;
> +	rkisp1_write(rkisp1, reg, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>  
>  	rkisp1_mi_config_ctrl(cap);
>  

-- 
Regards,

Laurent Pinchart
