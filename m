Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9D5A19EE6D
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 00:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbgDEWoI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 18:44:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34412 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727254AbgDEWoI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 18:44:08 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B02C8312;
        Mon,  6 Apr 2020 00:44:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586126647;
        bh=sz6sqvto6+1dBFatlRj/VFmY3Pq8kv/LPs6U42sWQ74=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TJrr43fzbJFp83xPbtD+U9PhBk5bKqIW89NC0wNh0CN6Lck4mt3UyObbr1hzAOGfz
         +Eb+Pat0IUb2xoQXpG7pEhXaD86YS+T6B2BwgTN9LTjzx2phoSINXwZmYGRBypf4Tx
         KIXd6OImhD3g0mEHWZQkz9rj88mnb6uRFaO8cMv8=
Date:   Mon, 6 Apr 2020 01:43:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     linux-media@vger.kernel.org, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 5/5] media: staging: rkisp1: cap: remove unsupported
 formats
Message-ID: <20200405224357.GR5846@pendragon.ideasonboard.com>
References: <20200402190419.15155-1-dafna.hirschfeld@collabora.com>
 <20200402190419.15155-6-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200402190419.15155-6-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thank you for the patch.

On Thu, Apr 02, 2020 at 09:04:19PM +0200, Dafna Hirschfeld wrote:
> For Ycbcr packed formats only YUYV can be supported by
> the driver. This patch removes the other formats.

The RKISP1_CIF_MI_BYTE_SWAP bit could possibly help achieving other YUV
orders, but as far as I can tell, it would affect both the main path and
the self path, so it wouldn't be very convenient. At a quick glance I
haven't found a way to support those formats, but just to make sure,
have you double-checked that the nv21_self and nv21_main bits of
MI_XTD_FORMAT_CTRL don't also affect packed mode ? If they don't,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Acked-by: Helen Koike <helen.koike@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-capture.c | 21 -------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
> index 2d274e8f565b..076335193f40 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-capture.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
> @@ -98,15 +98,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
>  		.fmt_type = RKISP1_FMT_YUV,
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> -	}, {
> -		.fourcc = V4L2_PIX_FMT_YVYU,
> -		.fmt_type = RKISP1_FMT_YUV,
> -		.uv_swap = 1,
> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
> -	}, {
> -		.fourcc = V4L2_PIX_FMT_VYUY,
> -		.fmt_type = RKISP1_FMT_YUV,
> -		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV422P,
>  		.fmt_type = RKISP1_FMT_YUV,
> @@ -234,18 +225,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
>  		.uv_swap = 0,
>  		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
>  		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> -	}, {
> -		.fourcc = V4L2_PIX_FMT_YVYU,
> -		.fmt_type = RKISP1_FMT_YUV,
> -		.uv_swap = 1,
> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
> -	}, {
> -		.fourcc = V4L2_PIX_FMT_VYUY,
> -		.fmt_type = RKISP1_FMT_YUV,
> -		.uv_swap = 1,
> -		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
> -		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
>  	}, {
>  		.fourcc = V4L2_PIX_FMT_YUV422P,
>  		.fmt_type = RKISP1_FMT_YUV,

-- 
Regards,

Laurent Pinchart
