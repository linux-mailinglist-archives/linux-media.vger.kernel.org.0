Return-Path: <linux-media+bounces-999-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F417F875B
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 01:40:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28A1A28148B
	for <lists+linux-media@lfdr.de>; Sat, 25 Nov 2023 00:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DDC7F9;
	Sat, 25 Nov 2023 00:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="hLu1MVm5"
X-Original-To: linux-media@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBF11739
	for <linux-media@vger.kernel.org>; Fri, 24 Nov 2023 16:40:03 -0800 (PST)
Received: from localhost (ec2-34-240-57-77.eu-west-1.compute.amazonaws.com [34.240.57.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dbrouwer)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8B700660739A;
	Sat, 25 Nov 2023 00:40:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700872801;
	bh=bynndVqydqsjkhi9n3htwlx+9RQy0P5LjMM5oe2L3Vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hLu1MVm5mXfzIHtY4yHB8x+uZNUtk0HApZbJHlihqookmqDhdnJn9axuSrlZZ8WOi
	 clKWQDkBj5/f+lGVKoY91AA0ovwDhaZetKwqRturKWLsW+7EuChrAqS95BikLscnlS
	 zzJeExGneQ4mjziisnvaZP+rm2zK/RpIXE5OlU759Xr0nfAR+ziu5VVvTwetZGHSk6
	 5Tg2zYzI4SQAmPCRvU8gOx0+1kARm2d8dHPlZfW21Rd0d/gqKfD8E2gPLDYTx0hSB8
	 JWKF3BcjosIKzEBV0b3zIV7dhPAMAUWcOQBVzeNufsDmfwaa3O16T5RNXi43ect5jS
	 TXpq4VKF5KM2Q==
Date: Fri, 24 Nov 2023 16:39:57 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Shengyu Qu <wiagn233@outlook.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	nicolas.dufresne@collabora.com
Subject: Re: [PATCH v2 01/13] media: rockchip: rga: fix swizzling for RGB
 formats
Message-ID: <ZWFCXaB5KpRL0Ssf@mz550>
References: <20230914-rockchip-rga-multiplanar-v2-0-bbfa6abf8bbf@pengutronix.de>
 <20230914-rockchip-rga-multiplanar-v2-1-bbfa6abf8bbf@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914-rockchip-rga-multiplanar-v2-1-bbfa6abf8bbf@pengutronix.de>

On Fri, Oct 13, 2023 at 01:00:22PM +0200, Michael Tretter wrote:

Hi Michael,

> When using 32 bit RGB formats, the RGA on the rk3568 produces wrong
> colors as the wrong color channels are read or written.  The reason is
> that the format description for the channel swizzeling is wrong and the
> wrong bits are configured. For example, when converting ARGB32 to NV12,
> the alpha channel is used as blue channel.. This doesn't happen if the
> color format is the same on both sides.
> 
> Fix the color_swap settings of the formats to correctly handle 32 bit
> RGB formats.

You mentioned in your cover letter that you only tested this on rk3568
so I tested it on an rk3399 as well.

I used gstreamer to convert each of the formats that you changed
(V4L2_PIX_FMT_ARGB32, V4L2_PIX_FMT_ABGR32, V4L2_PIX_FMT_XBGR32) into
each of:
BA24, AR24, XR24, RGB3, BGRI 3, NV21, YU12, 422P, YV12, and NM12.

All the colour conversions are working and much better than before which
I could see was definitely broken.

Tested-by: Deborah Brouwer <deborah.brouwer@collabora.com>

> 
> For RGA_COLOR_FMT_XBGR8888, the RGA_COLOR_ALPHA_SWAP bit doesn't have an
> effect. Thus, it isn't possible to handle the V4L2_PIX_FMT_XRGB32. Thus,
> it is removed from the list of supported formats.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changes in v2: None
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index f1c532a5802a..25f5b5eebf13 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -184,25 +184,16 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
>  static struct rga_fmt formats[] = {
>  	{
>  		.fourcc = V4L2_PIX_FMT_ARGB32,
> -		.color_swap = RGA_COLOR_RB_SWAP,
> +		.color_swap = RGA_COLOR_ALPHA_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR8888,
>  		.depth = 32,
>  		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> -	{
> -		.fourcc = V4L2_PIX_FMT_XRGB32,
> -		.color_swap = RGA_COLOR_RB_SWAP,
> -		.hw_format = RGA_COLOR_FMT_XBGR8888,
> -		.depth = 32,
> -		.uv_factor = 1,
> -		.y_div = 1,
> -		.x_div = 1,
> -	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_ABGR32,
> -		.color_swap = RGA_COLOR_ALPHA_SWAP,
> +		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR8888,
>  		.depth = 32,
>  		.uv_factor = 1,
> @@ -211,7 +202,7 @@ static struct rga_fmt formats[] = {
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_XBGR32,
> -		.color_swap = RGA_COLOR_ALPHA_SWAP,
> +		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_XBGR8888,
>  		.depth = 32,
>  		.uv_factor = 1,
> 
> -- 
> 2.39.2
> 

