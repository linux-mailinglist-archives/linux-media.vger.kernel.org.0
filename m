Return-Path: <linux-media+bounces-62495-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHODJkkCD2pfEAYAu9opvQ
	(envelope-from <linux-media+bounces-62495-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:02:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA31A5A5513
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 15:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 773D53059301
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 12:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F423C0611;
	Thu, 21 May 2026 12:53:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F2B1DFF0
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 12:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779367993; cv=none; b=DAsZycS4LRw9BdcODyPHCeCNJodIZY7k+L/TCLQM6KX7EginOAohPLvXqeraMLKIJqnnqOjuqj9j6VqafDpf7tbs2savqoyp8GsnBlkgx5NAODkda2MJEfh8jg8qyntc/Nt3uIWIubhKuSqVHxLJqoF8LoqvwRGkqqYRNuVOT3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779367993; c=relaxed/simple;
	bh=WJS27sN2KcR8G/UwaF/U8NOjPw2+aAbyCHslZsn4V0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKh1lPhpP1WPIyjtE7Su5Z2nQdhNRRWCnyOqMrEZWOsO4bAhJUAQMBkUBPGnRGZ5PhTBc/n8THnmdKXDwxylWQw3m40GCKmstcnsp/S1YQK5o0RH3w5iNhgLO8nFkr7RRpFpVNq6Fq/4p+VpDx7A5iyAnCIAfE92Nhy3/s+SVg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ2tX-00021U-76; Thu, 21 May 2026 14:52:59 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ2tW-0016dq-12;
	Thu, 21 May 2026 14:52:58 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ2tW-00000004VlF-3CuZ;
	Thu, 21 May 2026 14:52:58 +0200
Date: Thu, 21 May 2026 14:52:58 +0200
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
Subject: Re: [PATCH v7 08/28] media: rockchip: rga: use stride for offset
 calculation
Message-ID: <ag8AKgcwkZTuI3H9@pengutronix.de>
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
 <20260521-spu-rga3-v7-8-3f33e8c7145f@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521-spu-rga3-v7-8-3f33e8c7145f@pengutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62495-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pengutronix.de:mid,pengutronix.de:email,collabora.com:email]
X-Rspamd-Queue-Id: AA31A5A5513
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 00:44:13 +0200, Sven Püschel wrote:
> Use the stride instead of the width for the offset calculation. This
> ensures that the bytesperline value doesn't need to match the width
> value of the image.
> 
> Furthermore this patch removes the dependency on the uv_factor property
> and instead reuses the v4l2_format_info to determine the correct
> division factor.
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/rockchip/rga/rga-buf.c | 14 +++++++++-----
>  drivers/media/platform/rockchip/rga/rga.c     | 16 ----------------
>  drivers/media/platform/rockchip/rga/rga.h     |  1 -
>  3 files changed, 9 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
> index bb575873f2b24..65fc0d5b4aa10 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -14,7 +14,6 @@
>  #include <media/videobuf2-dma-sg.h>
>  #include <media/videobuf2-v4l2.h>
>  
> -#include "rga-hw.h"
>  #include "rga.h"
>  
>  static ssize_t fill_descriptors(struct rga_dma_desc *desc, size_t max_desc,
> @@ -95,14 +94,19 @@ static int rga_buf_init(struct vb2_buffer *vb)
>  	return 0;
>  }
>  
> -static int get_plane_offset(struct rga_frame *f, int plane)
> +static int get_plane_offset(struct rga_frame *f,
> +			    const struct v4l2_format_info *info,
> +			    int plane)
>  {
> +	u32 stride = f->pix.plane_fmt[0].bytesperline;
> +
>  	if (plane == 0)
>  		return 0;
>  	if (plane == 1)
> -		return f->width * f->height;
> +		return stride * f->height;
>  	if (plane == 2)
> -		return f->width * f->height + (f->width * f->height / f->fmt->uv_factor);
> +		return stride * f->height +
> +		       (stride * f->height / info->hdiv / info->vdiv);
>  
>  	return -EINVAL;
>  }
> @@ -148,7 +152,7 @@ static int rga_buf_prepare(struct vb2_buffer *vb)
>  	/* Fill the remaining planes */
>  	info = v4l2_format_info(f->fmt->fourcc);
>  	for (i = info->mem_planes; i < info->comp_planes; i++)
> -		offsets[i] = get_plane_offset(f, i);
> +		offsets[i] = get_plane_offset(f, info, i);
>  
>  	rbuf->offset.y_off = offsets[0];
>  	rbuf->offset.u_off = offsets[1];
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index 4e710a050cb7c..c07207edffdb6 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -190,7 +190,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_ALPHA_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR8888,
>  		.depth = 32,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -199,7 +198,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR8888,
>  		.depth = 32,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -208,7 +206,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_XBGR8888,
>  		.depth = 32,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -217,7 +214,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_RGB888,
>  		.depth = 24,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -226,7 +222,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_RGB888,
>  		.depth = 24,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -235,7 +230,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR4444,
>  		.depth = 16,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -244,7 +238,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_ABGR1555,
>  		.depth = 16,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -253,7 +246,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_RB_SWAP,
>  		.hw_format = RGA_COLOR_FMT_BGR565,
>  		.depth = 16,
> -		.uv_factor = 1,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -262,7 +254,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_UV_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420SP,
>  		.depth = 12,
> -		.uv_factor = 4,
>  		.y_div = 2,
>  		.x_div = 1,
>  	},
> @@ -271,7 +262,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_UV_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV422SP,
>  		.depth = 16,
> -		.uv_factor = 2,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -280,7 +270,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420SP,
>  		.depth = 12,
> -		.uv_factor = 4,
>  		.y_div = 2,
>  		.x_div = 1,
>  	},
> @@ -289,7 +278,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420SP,
>  		.depth = 12,
> -		.uv_factor = 4,
>  		.y_div = 2,
>  		.x_div = 1,
>  	},
> @@ -298,7 +286,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV422SP,
>  		.depth = 16,
> -		.uv_factor = 2,
>  		.y_div = 1,
>  		.x_div = 1,
>  	},
> @@ -307,7 +294,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420P,
>  		.depth = 12,
> -		.uv_factor = 4,
>  		.y_div = 2,
>  		.x_div = 2,
>  	},
> @@ -316,7 +302,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_NONE_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV422P,
>  		.depth = 16,
> -		.uv_factor = 2,
>  		.y_div = 1,
>  		.x_div = 2,
>  	},
> @@ -325,7 +310,6 @@ static struct rga_fmt formats[] = {
>  		.color_swap = RGA_COLOR_UV_SWAP,
>  		.hw_format = RGA_COLOR_FMT_YUV420P,
>  		.depth = 12,
> -		.uv_factor = 4,
>  		.y_div = 2,
>  		.x_div = 2,
>  	},
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
> index 2db10acecb405..477cf5b62bbb2 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -17,7 +17,6 @@
>  struct rga_fmt {
>  	u32 fourcc;
>  	int depth;
> -	u8 uv_factor;
>  	u8 y_div;
>  	u8 x_div;
>  	u8 color_swap;
> 
> -- 
> 2.54.0
> 
> 

