Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2122EACDB
	for <lists+linux-media@lfdr.de>; Thu, 31 Oct 2019 10:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbfJaJub (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 31 Oct 2019 05:50:31 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:45634 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbfJaJub (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 31 Oct 2019 05:50:31 -0400
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 8FAF828B418;
        Thu, 31 Oct 2019 09:50:28 +0000 (GMT)
Date:   Thu, 31 Oct 2019 10:50:25 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 05/10] media: hantro: Reduce H264 extra space for
 motion vectors
Message-ID: <20191031105025.5a32113c@collabora.com>
In-Reply-To: <HE1PR06MB4011C972A372449941929026AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <HE1PR06MB401108289F09802C261374F8AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
        <20191029012430.24566-1-jonas@kwiboo.se>
        <HE1PR06MB4011C972A372449941929026AC610@HE1PR06MB4011.eurprd06.prod.outlook.com>
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

> A decoded 8-bit 4:2:0 frame need memory for up to 448 bytes per
> macroblock with additional 32 bytes on multi-core variants.
> 
> Memory layout is as follow:
> 
> +---------------------------+
> | Y-plane   256 bytes x MBs |
> +---------------------------+
> | UV-plane  128 bytes x MBs |
> +---------------------------+
> | MV buffer  64 bytes x MBs |
> +---------------------------+
> | MC sync          32 bytes |
> +---------------------------+

As for patch 4, can we point this diagram as a comment in the code too?

> 
> Reduce the extra space allocated now that motion vector buffer offset no
> longer is based on the extra space.
> 
> Only allocate extra space for 64 bytes x MBs of motion vector buffer
> and 32 bytes for multi-core sync.
> 
> Fixes: a9471e25629b ("media: hantro: Add core bits to support H264 decoding")
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
> Changes in v2:
>   - updated commit message
> ---
>  drivers/staging/media/hantro/hantro_v4l2.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index 3dae52abb96c..b3a4368b37de 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -242,12 +242,12 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f,
>  		/*
>  		 * The H264 decoder needs extra space on the output buffers
>  		 * to store motion vectors. This is needed for reference
> -		 * frames.
> +		 * frames. 32 extra bytes is used for multi-core sync.
>  		 */
>  		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
>  			pix_mp->plane_fmt[0].sizeimage +=
> -				128 * DIV_ROUND_UP(pix_mp->width, 16) *
> -				      DIV_ROUND_UP(pix_mp->height, 16);
> +				64 * MB_WIDTH(pix_mp->width) *
> +				     MB_WIDTH(pix_mp->height) + 32;
>  	} else if (!pix_mp->plane_fmt[0].sizeimage) {
>  		/*
>  		 * For coded formats the application can specify

