Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0D57EACF9
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 11:00:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfJaKAp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 06:00:45 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45792 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbfJaKAp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 06:00:45 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EBDBF28DB37;
        Thu, 31 Oct 2019 10:00:39 +0000 (GMT)
Date:   Thu, 31 Oct 2019 11:00:36 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 08/10] media: hantro: Set H264 FIELDPIC_FLAG_E flag
 correctly
Message-ID: <20191031110036.1af7fa3e@collabora.com>
In-Reply-To: <HE1PR06MB401120C5E10154E39D0C9865AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
        <HE1PR06MB401120C5E10154E39D0C9865AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 29 Oct 2019 01:26:00 +0000
Jonas Karlman <jonas@kwiboo.se> wrote:

> The FIELDPIC_FLAG_E bit should be set when field_pic_flag exists in stream,
> it is currently set based on field_pic_flag of current frame.
> The PIC_FIELDMODE_E bit is correctly set based on the field_pic_flag.
> 
> Fix this by setting the FIELDPIC_FLAG_E bit when frame_mbs_only is not set.
> 
> Fixes: dea0a82f3d22 ("media: hantro: Add support for H264 decoding on G1")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/staging/media/hantro/hantro_g1_h264_dec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_g1_h264_dec.c b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> index eeed11366135..c07da0ee4973 100644
> --- a/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g1_h264_dec.c
> @@ -63,7 +63,7 @@ static void set_params(struct hantro_ctx *ctx)
>  	/* always use the matrix sent from userspace */
>  	reg |= G1_REG_DEC_CTRL2_TYPE1_QUANT_E;
>  
> -	if (slices[0].flags &  V4L2_H264_SLICE_FLAG_FIELD_PIC)
> +	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
>  		reg |= G1_REG_DEC_CTRL2_FIELDPIC_FLAG_E;
>  	vdpu_write_relaxed(vpu, reg, G1_REG_DEC_CTRL2);
>  

