Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1F37EAC05
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 09:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbfJaI7x (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 04:59:53 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45008 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbfJaI7x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 04:59:53 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6712128FC69;
        Thu, 31 Oct 2019 08:59:52 +0000 (GMT)
Date:   Thu, 31 Oct 2019 09:59:49 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Francois Buergisser <fbuergisser@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 03/10] media: hantro: Fix picture order count table
 enable
Message-ID: <20191031095949.6c748526@collabora.com>
In-Reply-To: <HE1PR06MB4011525BAC0F0F1DC419EB7EAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
        <20191029012430.24566-1-jonas@kwiboo.se>
        <HE1PR06MB4011525BAC0F0F1DC419EB7EAC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 29 Oct 2019 01:24:48 +0000
Jonas Karlman <jonas@kwiboo.se> wrote:

> From: Francois Buergisser <fbuergisser@chromium.org>
> 
> The picture order count table only makes sense for profiles
> higher than Baseline. This is confirmed by the H.264 specification
> (See 8.2.1 Decoding process for picture order count), which
> clarifies how POC are used for features not present in Baseline.
> 
> """
> Picture order counts are used to determine initial picture orderings
> for reference pictures in the decoding of B slices, to represent picture
> order differences between frames or fields for motion vector derivation
> in temporal direct mode, for implicit mode weighted prediction in B slices,
> and for decoder conformance checking.
> """
> 
> As a side note, this change matches various vendors downstream codebases,
> including ChromiumOS and IMX VPU libraries.
> 
> Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
> Signed-off-by: Francois Buergisser <fbuergisser@chromium.org>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Tested-by: Boris Brezillon <boris.brezillon@collabora.com>

Same as for patch 2, it would be great to have this fix queued for
5.4-rc6 so we don't have to backport it manually.

> ---
>  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index a1cb18680200..70a6b5b26477 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -34,9 +34,11 @@ static void set_params(struct hantro_ctx *ctx)
>  	reg = G1_REG_DEC_CTRL0_DEC_AXI_WR_ID(0x0);
>  	if (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD)
>  		reg |= G1_REG_DEC_CTRL0_SEQ_MBAFF_E;
> -	reg |= G1_REG_DEC_CTRL0_PICORD_COUNT_E;
> -	if (sps->profile_idc > 66 && dec_param->nal_ref_idc)
> -		reg |= G1_REG_DEC_CTRL0_WRITE_MVS_E;
> +	if (sps->profile_idc > 66) {
> +		reg |= G1_REG_DEC_CTRL0_PICORD_COUNT_E;
> +		if (dec_param->nal_ref_idc)
> +			reg |= G1_REG_DEC_CTRL0_WRITE_MVS_E;
> +	}
>  
>  	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY) &&
>  	    (sps->flags & V4L2_H264_SPS_FLAG_MB_ADAPTIVE_FRAME_FIELD ||

