Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9909D19ED52
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 20:16:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgDESQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 14:16:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60938 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgDESQd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 14:16:33 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90736312;
        Sun,  5 Apr 2020 20:16:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586110592;
        bh=6I2KujTbCZll3Yyt2ypPUSXE5uM18DZss0se4L4MeJo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XSVo29Ai+DigFoYHI7nfEyYeNrFVHAmfXXIIB7JPbAnIFaBRp9qtQf+0S8PHz/Nxf
         az4tp+PTjRVyx57MKWfNAz7qI9238Lzrm0jEmBS2xP5a9m/E1AOWuTl13NRj04W6+k
         Wk60nGHqBamJOv/pE6XGwGir1vGMXQ7hmQNx+FH8=
Date:   Sun, 5 Apr 2020 21:16:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 4/5] media: staging: rkisp1: cap: support uv swapped
 plane formats
Message-ID: <20200405181623.GQ5846@pendragon.ideasonboard.com>
References: <20200402190419.15155-1-dafna.hirschfeld@collabora.com>
 <20200402190419.15155-5-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200402190419.15155-5-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Thu, Apr 02, 2020 at 09:04:18PM +0200, Dafna Hirschfeld wrote:
> Plane formats with the u and v planes swapped can be
> supported by changing the address of the cb and cr in
> the buffer.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index fa2849209433..2d274e8f565b 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -41,6 +41,10 @@
>  	(((write_format) == RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA) ||	\
>  	 ((write_format) == RKISP1_MI_CTRL_SP_WRITE_SPLA))
>  
> +#define RKISP1_IS_PLANAR(write_format)					\
> +	(((write_format) == RKISP1_MI_CTRL_SP_WRITE_PLA) ||		\
> +	 ((write_format) == RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8))
> +
>  enum rkisp1_plane {
>  	RKISP1_PLANE_Y	= 0,
>  	RKISP1_PLANE_CB	= 1,
> @@ -788,6 +792,19 @@ static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
>  			rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CB);
>  	}
>  
> +	/*
> +	 * uv swap can be supported for plane formats by switching
> +	 * the address of cb and cr
> +	 */
> +	if (RKISP1_IS_PLANAR(cap->pix.cfg->write_format) &&

As commented on patch 3/5, could this be checked from the data in
v4l2_format_info ?

> +	    cap->pix.cfg->uv_swap) {
> +		ispbuf->buff_addr[RKISP1_PLANE_CR] =
> +			ispbuf->buff_addr[RKISP1_PLANE_CB];
> +		ispbuf->buff_addr[RKISP1_PLANE_CB] =
> +			ispbuf->buff_addr[RKISP1_PLANE_CR] +
> +			rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR);

How about

		swap(ispbuf->buff_addr[RKISP1_PLANE_CR],
		     ispbuf->buff_addr[RKISP1_PLANE_CB]);

?

> +	}
> +
>  	spin_lock_irqsave(&cap->buf.lock, flags);
>  
>  	/*

-- 
Regards,

Laurent Pinchart
