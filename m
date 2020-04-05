Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C59B619ED50
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 20:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbgDESOQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 14:14:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60912 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgDESOQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 14:14:16 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14037312;
        Sun,  5 Apr 2020 20:14:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586110454;
        bh=G41icyBabNRTmDS6CFNDpAEc45C/INYfp/YvDRzSkw0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jCe6ySqEGsO4may90v4XhqcnR4QM9xrU6RPstysUg54fxR360KBjuGCE1MgBFwZ07
         cTbfcpg/iekio/h7MCruwsBB51Wm+CNlKeoup3GafEfJopBh49fdx/LTlI73xiF8Ev
         MlIivkRnQz9jMlCLY1RRSAVpNMLFr06L/DOezqK0=
Date:   Sun, 5 Apr 2020 21:14:05 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 3/5] media: staging: rkisp1: cap: support uv swap only
 for semiplanar formats
Message-ID: <20200405181405.GP5846@pendragon.ideasonboard.com>
References: <20200402190419.15155-1-dafna.hirschfeld@collabora.com>
 <20200402190419.15155-4-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200402190419.15155-4-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Thu, Apr 02, 2020 at 09:04:17PM +0200, Dafna Hirschfeld wrote:
> The register RKISP1_CIF_MI_XTD_FORMAT_CTRL is relevant only
> for semiplanar formats, therefore the uv swap can be supported
> through this register only for semiplanar formats.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 84a3cf565106..fa2849209433 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -37,6 +37,10 @@
>  
>  #define RKISP1_MIN_BUFFERS_NEEDED 3
>  
> +#define RKISP1_IS_SEMI_PLANAR(write_format)				\
> +	(((write_format) == RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA) ||	\
> +	 ((write_format) == RKISP1_MI_CTRL_SP_WRITE_SPLA))
> +
>  enum rkisp1_plane {
>  	RKISP1_PLANE_Y	= 0,
>  	RKISP1_PLANE_CB	= 1,
> @@ -429,7 +433,8 @@ static void rkisp1_mp_config(struct rkisp1_capture *cap)
>  		     cap->config->mi.cr_size_init);
>  
>  	rkisp1_irq_frame_end_enable(cap);
> -	if (cap->pix.cfg->uv_swap) {
> +	if (RKISP1_IS_SEMI_PLANAR(cap->pix.cfg->write_format) &&

As this is the mp config path, I suppose write_format can only be
RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA, right ? You could then write

	if (cap->pix.cfg->write_format == RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA &&

> +	    cap->pix.cfg->uv_swap) {
>  		reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>  
>  		reg = reg | RKISP1_CIF_MI_XTD_FMT_CTRL_MP_CB_CR_SWAP;
> @@ -466,7 +471,8 @@ static void rkisp1_sp_config(struct rkisp1_capture *cap)
>  	rkisp1_write(rkisp1, cap->sp_y_stride, RKISP1_CIF_MI_SP_Y_LLENGTH);
>  
>  	rkisp1_irq_frame_end_enable(cap);
> -	if (cap->pix.cfg->uv_swap) {
> +	if (RKISP1_IS_SEMI_PLANAR(cap->pix.cfg->write_format) &&

Same here with RKISP1_MI_CTRL_SP_WRITE_SPLA.

Another option would be to check the number of planes from
v4l2_format_info, which could lead to simpler to read code.

> +	    cap->pix.cfg->uv_swap) {
>  		u32 reg = rkisp1_read(rkisp1, RKISP1_CIF_MI_XTD_FORMAT_CTRL);
>  
>  		reg = reg | RKISP1_CIF_MI_XTD_FMT_CTRL_SP_CB_CR_SWAP;

-- 
Regards,

Laurent Pinchart
