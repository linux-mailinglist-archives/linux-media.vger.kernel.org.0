Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA7B3EABFD
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 09:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbfJaI6T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 04:58:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44978 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbfJaI6T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 04:58:19 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7076328FC69;
        Thu, 31 Oct 2019 08:58:17 +0000 (GMT)
Date:   Thu, 31 Oct 2019 09:58:14 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>, Tomasz Figa <tfiga@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Francois Buergisser <fbuergisser@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 02/10] media: hantro: Fix motion vectors usage
 condition
Message-ID: <20191031095814.25112ba0@collabora.com>
In-Reply-To: <HE1PR06MB40116FEF3EBE4706E426A5FFAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
        <20191029012430.24566-1-jonas@kwiboo.se>
        <HE1PR06MB40116FEF3EBE4706E426A5FFAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 29 Oct 2019 01:24:47 +0000
Jonas Karlman <jonas@kwiboo.se> wrote:

> From: Francois Buergisser <fbuergisser@chromium.org>
> 
> The setting of the motion vectors usage and the setting of motion
> vectors address are currently done under different conditions.
> 
> When decoding pre-recorded videos, this results of leaving the motion
> vectors address unset, resulting in faulty memory accesses. Fix it
> by using the same condition everywhere, which matches the profiles
> that support motion vectors.
> 
> Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
> Signed-off-by: Francois Buergisser <fbuergisser@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Tested-by: Boris Brezillon <boris.brezillon@collabora.com>

This fix should apply cleanly to media/fixes. Would be great to have it
queued for 5.4-rc6 so we don't have to backport it manually.

> ---
>  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index 29130946dea4..a1cb18680200 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -35,7 +35,7 @@ static void set_params(struct hantro_ctx *ctx)
>  	if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
>  		reg |= G1_REG_DEC_CTRL0_SEQ_MBAFF_E;
>  	reg |= G1_REG_DEC_CTRL0_PICORD_COUNT_E;
> -	if (dec_param->nal_ref_idc)
> +	if (sps->profile_idc > 66 && dec_param->nal_ref_idc)
>  		reg |= G1_REG_DEC_CTRL0_WRITE_MVS_E;
>  
>  	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&
> @@ -245,7 +245,7 @@ static void set_buffers(struct hantro_ctx *ctx)
>  	vdpu_write_relaxed(vpu, dst_dma, G1_REG_ADDR_DST);
>  
>  	/* Higher profiles require DMV buffer appended to reference frames. */
> -	if (ctrls->sps->profile_idc > 66) {
> +	if (ctrls->sps->profile_idc > 66 && ctrls->decode->nal_ref_idc) {
>  		size_t pic_size = ctx->h264_dec.pic_size;
>  		size_t mv_offset = round_up(pic_size, 8);
>  

