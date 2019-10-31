Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4BDEAC7D
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 10:21:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfJaJVG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 05:21:06 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45220 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726864AbfJaJVG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 05:21:06 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 559FC28FB05;
        Thu, 31 Oct 2019 09:21:05 +0000 (GMT)
Date:   Thu, 31 Oct 2019 10:21:02 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/10] media: hantro: Use capture buffer width and
 height for H264 decoding
Message-ID: <20191031102102.63afd4e5@collabora.com>
In-Reply-To: <HE1PR06MB4011544CF7A6F36EF1CA47EEAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
        <20191029012430.24566-1-jonas@kwiboo.se>
        <HE1PR06MB4011544CF7A6F36EF1CA47EEAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 29 Oct 2019 01:24:50 +0000
Jonas Karlman <jonas@kwiboo.se> wrote:

> Calculations for motion vector buffer offset is based on width and height
> from the configured capture format, lets use the same values for macroblock
> width and height hw regs.
> 
> Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Changes in v2:
>   - new patch split from "media: hantro: Fix H264 motion vector buffer offset"
> ---
>  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index 71bf162eaf73..eeed11366135 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -51,8 +51,8 @@ static void set_params(struct hantro_ctx *ctx)
>  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL0);
>  
>  	/* Decoder control register 1. */
> -	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(sps->pic_width_in_mbs_minus1 + 1) |
> -	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(sps->pic_height_in_map_units_minus1 + 1) |
> +	reg = G1_REG_DEC_CTRL1_PIC_MB_WIDTH(MB_WIDTH(ctx->dst_fmt.width)) |
> +	      G1_REG_DEC_CTRL1_PIC_MB_HEIGHT_P(MB_HEIGHT(ctx->dst_fmt.height)) |

I'm just curious, do they differ in practice? Also not sure what's been
decided for the "G1 post-proc", but if the dst/capture format res set
by the user is the scaled res (PP can scale IIRC), then you probably
shouldn't use those values here.

>  	      G1_REG_DEC_CTRL1_REF_FRAMES(sps->max_num_ref_frames);
>  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL1);
>  

