Return-Path: <linux-media+bounces-62525-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D9VBXsjD2rPGAYAu9opvQ
	(envelope-from <linux-media+bounces-62525-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 17:23:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E0C5A83A8
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 17:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A68743330DBE
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:23:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B0D3D88F1;
	Thu, 21 May 2026 14:23:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E24037B02A
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 14:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779373392; cv=none; b=GyZkgfSWNUW5JQ9OqTDF95BmkWXjATq05Xpw5Oe0B3MuriXKef+gqM4OlPUNznsOeFLQ/lJOMBCa2I/5r3yno/vkg75GxEGn5v9ZMb7IdqcKSwNTL7GuBcoeVcf067tBcSlfoNX9EmgjpaDy3zg5wOliKI8COYEG6LxBcxjTFsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779373392; c=relaxed/simple;
	bh=3cxjaq2yY4S67NbxUO26/PmmDn2G+GWCPtESH1e5xhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T/nyWm5n9FK19ExyLqa7jDCrkO3n1mlDHWycJOPIsNXF7vQtQtUfBedp5oAIKAHI/RPzz180UItjUkpPzF47ExNdmb3XXCmW3po+Zv4f2BRAw0MXZSRDey/Jy0J2Wl6NbJE4v6bJb2dPc8aIDYEMMkae7F2LyTwzz79Rmk/D15Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4Ic-00005O-K7; Thu, 21 May 2026 16:22:58 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4Ia-0017OY-2m;
	Thu, 21 May 2026 16:22:57 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4Ib-00000004Wwg-1IML;
	Thu, 21 May 2026 16:22:57 +0200
Date: Thu, 21 May 2026 16:22:57 +0200
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
Subject: Re: [PATCH v7 15/28] media: rockchip: rga: align stride to 4 bytes
Message-ID: <ag8VQas7BPnKZNxd@pengutronix.de>
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
 <20260521-spu-rga3-v7-15-3f33e8c7145f@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521-spu-rga3-v7-15-3f33e8c7145f@pengutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-62525-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,collabora.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,pengutronix.de:url,pengutronix.de:email,pengutronix.de:mid]
X-Rspamd-Queue-Id: 17E0C5A83A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 00:44:20 +0200, Sven Püschel wrote:
> Add an alignment setting to rga_hw to set the desired stride alignment.
> As the RGA2 register for the stride counts in word units, the code
> already divides the bytesperline value by 4 when writing it into the
> register. Therefore fix the alignment to a multiple of 4 to avoid
> potential off by one errors due from the division.
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> 
> ---
> Changed in v6:
> - Drop unintended change from fmt->fourcc to pix_fmt->pixelformat
>   Flagged by Sashiko:
>   https://sashiko.dev/#/patchset/20260428-spu-rga3-v5-0-eb7f5d019d86%40pengutronix.de?part=15
> ---
>  drivers/media/platform/rockchip/rga/rga-hw.c |  1 +
>  drivers/media/platform/rockchip/rga/rga.c    | 11 ++++++-----
>  drivers/media/platform/rockchip/rga/rga.h    |  1 +
>  3 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 9881c14f908d5..dac3cb6aa17d3 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -580,6 +580,7 @@ const struct rga_hw rga2_hw = {
>  	.max_width = MAX_WIDTH,
>  	.min_height = MIN_HEIGHT,
>  	.max_height = MAX_HEIGHT,
> +	.stride_alignment = 4,
>  
>  	.start = rga_hw_start,
>  	.handle_irq = rga_handle_irq,
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index bf6bbcbfc869b..d080cb672740b 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -234,10 +234,10 @@ static int rga_open(struct file *file)
>  	ctx->in = def_frame;
>  	ctx->out = def_frame;
>  
> -	v4l2_fill_pixfmt_mp(&ctx->in.pix,
> -			    ctx->in.fmt->fourcc, def_width, def_height);
> -	v4l2_fill_pixfmt_mp(&ctx->out.pix,
> -			    ctx->out.fmt->fourcc, def_width, def_height);
> +	v4l2_fill_pixfmt_mp_aligned(&ctx->in.pix, ctx->in.fmt->fourcc,
> +				    def_width, def_height, rga->hw->stride_alignment);
> +	v4l2_fill_pixfmt_mp_aligned(&ctx->out.pix, ctx->out.fmt->fourcc,
> +				    def_width, def_height, rga->hw->stride_alignment);
>  
>  	if (mutex_lock_interruptible(&rga->mutex)) {
>  		ret = -ERESTARTSYS;
> @@ -393,7 +393,8 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  		fmt = &hw->formats[0];
>  
>  	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &frmsize);
> -	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt->height);
> +	v4l2_fill_pixfmt_mp_aligned(pix_fmt, fmt->fourcc,
> +				    pix_fmt->width, pix_fmt->height, hw->stride_alignment);
>  	pix_fmt->field = V4L2_FIELD_NONE;
>  
>  	return 0;
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
> index 04aeb7b429523..38518146910a6 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -150,6 +150,7 @@ struct rga_hw {
>  	size_t cmdbuf_size;
>  	u32 min_width, min_height;
>  	u32 max_width, max_height;
> +	u8 stride_alignment;
>  
>  	void (*start)(struct rockchip_rga *rga,
>  		      struct rga_vb_buffer *src, struct rga_vb_buffer *dst);
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

