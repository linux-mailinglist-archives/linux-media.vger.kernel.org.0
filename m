Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19D16F610B
	for <lists+linux-media@lfdr.de>; Sat,  9 Nov 2019 20:04:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726394AbfKITEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Nov 2019 14:04:36 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47282 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbfKITEg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 9 Nov 2019 14:04:36 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1E1B928E979;
        Sat,  9 Nov 2019 19:04:34 +0000 (GMT)
Date:   Sat, 9 Nov 2019 20:04:30 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/5] media: hantro: Use output buffer width and
 height for H264 decoding
Message-ID: <20191109200430.30367d27@collabora.com>
In-Reply-To: <HE1PR06MB4011E69C56DA82EAB9ECEAEEAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB4011EDD5F2686A05BC35F61CAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
        <20191106223408.2176-1-jonas@kwiboo.se>
        <HE1PR06MB4011E69C56DA82EAB9ECEAEEAC790@HE1PR06MB4011.eurprd06.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 6 Nov 2019 22:34:22 +0000
Jonas Karlman <jonas@kwiboo.se> wrote:

> Calculations for motion vector buffer offset is based on width and height
> from the configured output format, lets use the same values for macroblock
> width and height hw regs.

Still don't see what was the problem with
sps->pic_{width,height}_in_mbs_minus1, but okay.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 
> Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")

Is this really fixing a bug? Do you have cases where
->pic_{width,height}_in_mbs_minus1 and
MB_{WIDTH,HEIGHT}(src_fmt.{width,height}) do not match?

> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Changes in v3:
>   - change to use src_fmt instead of dst_fmt (Boris)
> Changes in v2:
>   - new patch split from "media: hantro: Fix H264 motion vector buffer offset"
> ---
>  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index 30d977c3d529..27d40d8d3728 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -51,8 +51,8 @@ static void set_params(struct hantro_ctx *ctx)
>  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
>  
>  	/* Decoder control register 1. */
> -	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(sps->pic_width_in_mbs_minus1 + 1) |
> -	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(sps->pic_height_in_map_units_minus1 + 1) |
> +	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(MB_WIDTH(ctx->src_fmt.width)) |
> +	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(MB_HEIGHT(ctx->src_fmt.height)) |
>  	      G1_REG_DEC_CTRL1_REF_FRAMES(sps->max_num_ref_frames);
>  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL1);
>  

