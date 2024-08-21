Return-Path: <linux-media+bounces-16574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 778B7959F3B
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 16:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E08C1F2193F
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 14:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 497371AF4F4;
	Wed, 21 Aug 2024 14:03:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69D71AF4DB
	for <linux-media@vger.kernel.org>; Wed, 21 Aug 2024 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724249017; cv=none; b=p+hpQNkMnvHgB9Rf7G+8ggUtahMIufYqx+YvJ/Yl8bHldaIxv2UKsHFXmulx5Hqnko0d4Ka0+vTz9oG++z9zk7V+srgXrLxnyg4SpJF2vZ1/FrZSVJnLjrsSIKgQtCoY/M4HBFr9VkuoZvsJjlla3ksb2s7ohFbm8FaL01253xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724249017; c=relaxed/simple;
	bh=nX34tveEkLIAY8t2BIyCqfHjXEOyJEpYGc7XKL8RS34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A8GKyf+vYF01sHVTQxnWgGwvh6Qd2MM+GlJY2LFJWV3WNTGjYd0UYepTISZ5X+03uoKh0eWDe5G1hTJqCqGW2vHtpsKS8SVtwOladUTOGWti7RMoiNzTPJX750T3OVtzImarwX5ekWCzFVbtXHO7Ece93CwPCAE0b8m0du8yBPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1sglvq-00064b-Mg; Wed, 21 Aug 2024 16:03:26 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1sglvp-0021gA-Jl; Wed, 21 Aug 2024 16:03:25 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1sglvp-00FXHo-1a;
	Wed, 21 Aug 2024 16:03:25 +0200
Date: Wed, 21 Aug 2024 16:03:25 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: linux-media@vger.kernel.org, Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH] media: platform: rga: fix 32-bit DMA limitation
Message-ID: <ZsXzrV2vC4aB8GMq@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	John Keeping <jkeeping@inmusicbrands.com>,
	linux-media@vger.kernel.org, Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
References: <20240812143555.530279-1-jkeeping@inmusicbrands.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240812143555.530279-1-jkeeping@inmusicbrands.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Mon, 12 Aug 2024 15:35:55 +0100, John Keeping wrote:
> The destination buffer flags are assigned twice but source is not set in
> what looks like a copy+paste mistake.  Assign the source queue flags so
> the 32-bit DMA limitation is handled consistently.
> 
> Fixes: ec9ef8dda2a24 ("media: rockchip: rga: set dma mask to 32 bits")
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/rockchip/rga/rga.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index 0e768f3e9edab..de532b7ecd74c 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -102,7 +102,7 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
>  	src_vq->drv_priv = ctx;
>  	src_vq->ops = &rga_qops;
>  	src_vq->mem_ops = &vb2_dma_sg_memops;
> -	dst_vq->gfp_flags = __GFP_DMA32;
> +	src_vq->gfp_flags = __GFP_DMA32;
>  	src_vq->buf_struct_size = sizeof(struct rga_vb_buffer);
>  	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
>  	src_vq->lock = &ctx->rga->mutex;
> -- 
> 2.46.0
> 
> 

