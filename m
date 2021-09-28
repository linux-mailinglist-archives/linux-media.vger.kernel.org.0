Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32EF941B2A4
	for <lists+linux-media@lfdr.de>; Tue, 28 Sep 2021 17:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241490AbhI1PKg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Sep 2021 11:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241514AbhI1PK3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Sep 2021 11:10:29 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA23C061746;
        Tue, 28 Sep 2021 08:08:49 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: nicolas)
        with ESMTPSA id D4ABC1F4308F
Message-ID: <bdd74e895f30d77ea798b886e34c16af2684dc99.camel@collabora.com>
Subject: Re: [PATCH v6 04/10] hantro: Add quirk for NV12/NV12_4L4 capture
 format
From:   Nicolas Dufresne <nicolas.dufresne@collabora.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Date:   Tue, 28 Sep 2021 11:08:35 -0400
In-Reply-To: <20210927151958.24426-5-andrzej.p@collabora.com>
References: <20210927151958.24426-1-andrzej.p@collabora.com>
         <20210927151958.24426-5-andrzej.p@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le lundi 27 septembre 2021 à 17:19 +0200, Andrzej Pietrasiewicz a écrit :
> From: Ezequiel Garcia <ezequiel@collabora.com>
> 
> The G2 core decoder engine produces NV12_4L4 format,
> which is a simple NV12 4x4 tiled format. The driver currently
> hides this format by always enabling the post-processor engine,
> and therefore offering NV12 directly.
> 
> This is done without using the logic in hantro_postproc.c
> and therefore makes it difficult to add VP9 cleanly.
> 
> Since fixing this is not easy, add a small quirk to force
> NV12 if HEVC was configured, but otherwise declare NV12_4L4
> as the pixel format in imx8mq_vpu_g2_variant.dec_fmts.
> 
> This will be used by the VP9 decoder which will be added soon.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_v4l2.c  | 14 ++++++++++++++
>  drivers/staging/media/hantro/imx8m_vpu_hw.c |  2 +-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index bcb0bdff4a9a..d1f060c55fed 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -150,6 +150,20 @@ static int vidioc_enum_fmt(struct file *file, void *priv,
>  	unsigned int num_fmts, i, j = 0;
>  	bool skip_mode_none;
>  
> +	/*
> +	 * The HEVC decoder on the G2 core needs a little quirk to offer NV12
> +	 * only on the capture side. Once the post-processor logic is used,
> +	 * we will be able to expose NV12_4L4 and NV12 as the other cases,
> +	 * and therefore remove this quirk.
> +	 */
> +	if (capture && ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE) {
> +		if (f->index == 0) {
> +			f->pixelformat = V4L2_PIX_FMT_NV12;
> +			return 0;
> +		}
> +		return -EINVAL;
> +	}
> +
>  	/*
>  	 * When dealing with an encoder:
>  	 *  - on the capture side we want to filter out all MODE_NONE formats.
> diff --git a/drivers/staging/media/hantro/imx8m_vpu_hw.c b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> index 02e61438220a..a40b161e5956 100644
> --- a/drivers/staging/media/hantro/imx8m_vpu_hw.c
> +++ b/drivers/staging/media/hantro/imx8m_vpu_hw.c
> @@ -134,7 +134,7 @@ static const struct hantro_fmt imx8m_vpu_dec_fmts[] = {
>  
>  static const struct hantro_fmt imx8m_vpu_g2_dec_fmts[] = {
>  	{
> -		.fourcc = V4L2_PIX_FMT_NV12,
> +		.fourcc = V4L2_PIX_FMT_NV12_4L4,

This depends on some accepted patches from Ezequiel. I don't recall seeing a
mention of this in the cover, this is not a problem per see, but perhaps nice
for the testers. I believe only 76180 is needed, but here's the complete series
I refer to:

76178   Accepted     [v3,1/4] media: Rename V4L2_PIX_FMT_SUNXI_TILED_NV12 to V4L2_PIX_FMT_NV12_32L32
76179   Accepted     [v3,2/4] media: Rename V4L2_PIX_FMT_HM12 to V4L2_PIX_FMT_NV12_16L16
76180   Accepted     [v3,3/4] media: Add NV12_4L4 tiled format
76181   Accepted     [v3,4/4] media: Clean V4L2_PIX_FMT_NV12MT documentation


>  		.codec_mode = HANTRO_MODE_NONE,
>  	},
>  	{


