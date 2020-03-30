Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2BD9198401
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 21:13:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727750AbgC3TN0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 15:13:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:35636 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbgC3TN0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 15:13:26 -0400
Received: from [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d] (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8095728D7FC;
        Mon, 30 Mar 2020 20:13:22 +0100 (BST)
Subject: Re: [PATCH 3/4] media: staging: rkisp1: cap: support uv swapped plane
 formats
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
References: <20200326201610.31762-1-dafna.hirschfeld@collabora.com>
 <20200326201610.31762-4-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <3e3ff331-577c-505e-a7e3-ee5071de0bc3@collabora.com>
Date:   Mon, 30 Mar 2020 16:13:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200326201610.31762-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 3/26/20 5:16 PM, Dafna Hirschfeld wrote:
> Plane formats with the u and v planes swapped can be
> supported by changing the address of the cb and cr in
> the buffer.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

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
> +	    cap->pix.cfg->uv_swap) {
> +		ispbuf->buff_addr[RKISP1_PLANE_CR] =
> +			ispbuf->buff_addr[RKISP1_PLANE_CB];
> +		ispbuf->buff_addr[RKISP1_PLANE_CB] =
> +			ispbuf->buff_addr[RKISP1_PLANE_CR] +
> +			rkisp1_pixfmt_comp_size(pixm, RKISP1_PLANE_CR);
> +	}
> +
>  	spin_lock_irqsave(&cap->buf.lock, flags);
>  
>  	/*
> 
