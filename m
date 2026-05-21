Return-Path: <linux-media+bounces-62523-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPQIE+sbD2rcFwYAu9opvQ
	(envelope-from <linux-media+bounces-62523-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 16:51:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7535A7AD2
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 16:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C471B307E2B7
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5EB31AF07;
	Thu, 21 May 2026 14:18:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 802412EF653
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 14:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779373090; cv=none; b=kDfY19TSh0t/3V9r+8SqHWPi++fVNqmr6hdTSMuhv7wzSZd0AJuXjw4VAElbMw21q01nbVjWfKPBLUBZhOIbapIf5U9LOAMwFNYe/36tlyZOkyuD65GJb3VWqtZIjCEVgEAh0s0crbZuZyE0YyvIf0WMXZxneJZFOBlxRycMlqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779373090; c=relaxed/simple;
	bh=HAfl/SaeMd4fujRbesGuMrdvcRLCdqxksnWMjbIPy1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKFcLkVBhyhw7OO3nZYJbEf6dtYAl2pjhjkahPucLyHkvxJ1sGIYMfFYgTV1ZVNCxyNSnO5xndq7IFy+5PCO7+ttlVJVl2AUcdfz/MGyrG9mGOljBDYz2pCGCqnYSgBD0Kd2CtaK8svdv5IENovDHjQ8xO6WFfUA4Bbgg2WRcRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4Dj-0007o0-Qt; Thu, 21 May 2026 16:17:55 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4Di-0017O6-30;
	Thu, 21 May 2026 16:17:55 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4Dj-00000004Wuk-1aW2;
	Thu, 21 May 2026 16:17:55 +0200
Date: Thu, 21 May 2026 16:17:55 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>
Cc: Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	nicolas@ndufresne.ca, sebastian.reichel@collabora.com,
	p.zabel@pengutronix.de,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v7 13/28] media: rockchip: rga: calculate x_div/y_div
 using v4l2_format_info
Message-ID: <ag8UEzt23aQHzGF-@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	nicolas@ndufresne.ca, sebastian.reichel@collabora.com,
	p.zabel@pengutronix.de,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
 <20260521-spu-rga3-v7-13-3f33e8c7145f@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521-spu-rga3-v7-13-3f33e8c7145f@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-62523-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,collabora.com:email]
X-Rspamd-Queue-Id: EE7535A7AD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 00:44:18 +0200, Sven Püschel wrote:
> Calculate the x_div and y_div variables with the information from
> v4l2_format_info instead of storing these in the rga_fmt struct.
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c | 45 +++++++---------------------
>  drivers/media/platform/rockchip/rga/rga.h    |  2 --
>  2 files changed, 11 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 40498796507e0..17f7a67c0b4bb 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -42,6 +42,7 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
>  {
>  	struct rga_corners_addr_offset offsets;
>  	struct rga_addr_offset *lt, *lb, *rt, *rb;
> +	const struct v4l2_format_info *format_info;
>  	unsigned int x_div = 0,
>  		     y_div = 0, uv_stride = 0, pixel_width = 0;
>  
> @@ -50,8 +51,16 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_addr_offset *offset,
>  	rt = &offsets.right_top;
>  	rb = &offsets.right_bottom;
>  
> -	x_div = frm->fmt->x_div;
> -	y_div = frm->fmt->y_div;
> +	format_info = v4l2_format_info(frm->pix.pixelformat);
> +	/* x_div is only used for the u/v planes.
> +	 * When the format doesn't have these, use 1 to avoid a division by zero.
> +	 */
> +	if (format_info->bpp[1])
> +		x_div = format_info->hdiv * format_info->bpp_div[1] /
> +			format_info->bpp[1];
> +	else
> +		x_div = 1;
> +	y_div = format_info->vdiv;
>  	uv_stride = frm->stride / x_div;
>  	pixel_width = frm->stride / frm->pix.width;
>  
> @@ -476,128 +485,96 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_ALPHA_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR8888,
>  		.depth = 32,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_ABGR32,
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR8888,
>  		.depth = 32,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_XBGR32,
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_XBGR8888,
>  		.depth = 32,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_RGB24,
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_RGB888,
>  		.depth = 24,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_BGR24,
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_RGB888,
>  		.depth = 24,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_ARGB444,
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR4444,
>  		.depth = 16,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_ARGB555,
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR1555,
>  		.depth = 16,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_RGB565,
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_BGR565,
>  		.depth = 16,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV21,
>  		.color_swap = RGA_COLOR_UV_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420SP,
>  		.depth = 12,
> -		.y_div = 2,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV61,
>  		.color_swap = RGA_COLOR_UV_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV422SP,
>  		.depth = 16,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV12,
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420SP,
>  		.depth = 12,
> -		.y_div = 2,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV12M,
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420SP,
>  		.depth = 12,
> -		.y_div = 2,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_NV16,
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV422SP,
>  		.depth = 16,
> -		.y_div = 1,
> -		.x_div = 1,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_YUV420,
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420P,
>  		.depth = 12,
> -		.y_div = 2,
> -		.x_div = 2,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_YUV422P,
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV422P,
>  		.depth = 16,
> -		.y_div = 1,
> -		.x_div = 2,
>  	},
>  	{
>  		.fourcc = V4L2_PIX_FMT_YVU420,
>  		.color_swap = RGA_COLOR_UV_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420P,
>  		.depth = 12,
> -		.y_div = 2,
> -		.x_div = 2,
>  	},
>  };
>  
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
> index 640e510285341..27b3c9b4f220c 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -20,8 +20,6 @@
>  struct rga_fmt {
>  	u32 fourcc;
>  	int depth;
> -	u8 y_div;
> -	u8 x_div;
>  	u8 color_swap;
>  	u8 hw_format;
>  };
> 
> -- 
> 2.54.0
> 
> 

-- 
Pengutronix e.K.                           | Michael Tretter             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

