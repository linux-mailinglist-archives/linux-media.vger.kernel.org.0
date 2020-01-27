Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70E1A14A9C7
	for <lists+linux-media@lfdr.de>; Mon, 27 Jan 2020 19:27:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgA0S1F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jan 2020 13:27:05 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34766 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgA0S1F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jan 2020 13:27:05 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id B231829257E
Message-ID: <7cdd245cd5f4a12d02294581d9af42c723f038f0.camel@collabora.com>
Subject: Re: [PATCH 1/4] media: hantro: Read be32 words starting at every
 fourth byte
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        devel@driverdev.osuosl.org
Cc:     linux-media@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        kernel@collabora.com
Date:   Mon, 27 Jan 2020 15:26:57 -0300
In-Reply-To: <20200127143009.15677-2-andrzej.p@collabora.com>
References: <20200127143009.15677-1-andrzej.p@collabora.com>
         <20200127143009.15677-2-andrzej.p@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-01-27 at 15:30 +0100, Andrzej Pietrasiewicz wrote:
> Since (luma/chroma)_qtable is an array of unsigned char, indexing it
> returns consecutive byte locations, but we are supposed to read the arrays
> in four-byte words. Consequently, we should be pointing
> get_unaligned_be32() at consecutive word locations instead.
> 

Ouch!

Seems we were too fast on that cleanup. Please add:

Cc: stable@vger.kernel.org
Fixes: 00c30f42c7595f "media: rockchip vpu: remove some unused vars"
Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_h1_jpeg_enc.c     | 9 +++++++--
>  drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c | 9 +++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
> index 938b48d4d3d9..be787a045c7e 100644
> --- a/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
> +++ b/drivers/staging/media/hantro/hantro_h1_jpeg_enc.c
> @@ -67,12 +67,17 @@ hantro_h1_jpeg_enc_set_qtable(struct hantro_dev *vpu,
>  			      unsigned char *chroma_qtable)
>  {
>  	u32 reg, i;
> +	__be32 *luma_qtable_p;
> +	__be32 *chroma_qtable_p;
> +
> +	luma_qtable_p = (__be32 *)luma_qtable;
> +	chroma_qtable_p = (__be32 *)chroma_qtable;
>  
>  	for (i = 0; i < H1_JPEG_QUANT_TABLE_COUNT; i++) {
> -		reg = get_unaligned_be32(&luma_qtable[i]);
> +		reg = get_unaligned_be32(&luma_qtable_p[i]);
>  		vepu_write_relaxed(vpu, reg, H1_REG_JPEG_LUMA_QUAT(i));
>  
> -		reg = get_unaligned_be32(&chroma_qtable[i]);
> +		reg = get_unaligned_be32(&chroma_qtable_p[i]);
>  		vepu_write_relaxed(vpu, reg, H1_REG_JPEG_CHROMA_QUAT(i));
>  	}
>  }
> diff --git a/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c b/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
> index 067892345b5d..bdb95652d6a8 100644
> --- a/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
> +++ b/drivers/staging/media/hantro/rk3399_vpu_hw_jpeg_enc.c
> @@ -98,12 +98,17 @@ rk3399_vpu_jpeg_enc_set_qtable(struct hantro_dev *vpu,
>  			       unsigned char *chroma_qtable)
>  {
>  	u32 reg, i;
> +	__be32 *luma_qtable_p;
> +	__be32 *chroma_qtable_p;
> +
> +	luma_qtable_p = (__be32 *)luma_qtable;
> +	chroma_qtable_p = (__be32 *)chroma_qtable;
>  
>  	for (i = 0; i < VEPU_JPEG_QUANT_TABLE_COUNT; i++) {
> -		reg = get_unaligned_be32(&luma_qtable[i]);
> +		reg = get_unaligned_be32(&luma_qtable_p[i]);
>  		vepu_write_relaxed(vpu, reg, VEPU_REG_JPEG_LUMA_QUAT(i));
>  
> -		reg = get_unaligned_be32(&chroma_qtable[i]);
> +		reg = get_unaligned_be32(&chroma_qtable_p[i]);
>  		vepu_write_relaxed(vpu, reg, VEPU_REG_JPEG_CHROMA_QUAT(i));
>  	}
>  }
> -- 
> 2.17.1
> 
> 


