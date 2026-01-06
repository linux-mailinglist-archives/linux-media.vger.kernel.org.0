Return-Path: <linux-media+bounces-50033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F27E5CF8D25
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 15:40:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 80EF9309A6E8
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 14:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0769731352D;
	Tue,  6 Jan 2026 14:33:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9103126A3
	for <linux-media@vger.kernel.org>; Tue,  6 Jan 2026 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710027; cv=none; b=SCv2hxqieO7qfsUl3rXGoBIq8h8AXoUYgEEifb5BB7FPLMFI9aaqoIQ+fBZwXelX95YxpWHY/O0cRHJmhuF/EcZNmXaN/h7V1R7uujrsA3D8cM/U+2aIdjrGDn6as4uivbRhfdqCeKxCjqS23B8wDTyt9cCxkhBNA1qoK+HvNN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710027; c=relaxed/simple;
	bh=56snyi9ptnCLoa/W6ZDI+a9sAVGPG2EwnK4UXdu9zZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhBQ3NZGLf5OcVqzc5sY1WqesAQcQmg++b0FRnzP+j5qhqO0Ip55w4lNDSuGnw3WZI1Uh/VAJlyyDuLQaoJ/yowYs6z8U13ky3m+at9+3ahXjIaxSnkKRm3CuP1/iTu2agidt7fB9uQfmiT5NqL/TWkVWumLtInMLN5ToceY3L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vd87o-00072m-Kp; Tue, 06 Jan 2026 15:33:32 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vd87m-009MNP-16;
	Tue, 06 Jan 2026 15:33:30 +0100
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vd87m-00EKlW-0l;
	Tue, 06 Jan 2026 15:33:30 +0100
Date: Tue, 6 Jan 2026 15:33:30 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Alper Ak <alperyasinak1@gmail.com>
Cc: hverkuil@kernel.org, mchehab@kernel.org,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rockchip: rga: Fix possible ERR_PTR dereference
 in rga_buf_init()
Message-ID: <aV0dOj7hf1GCq7BC@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Alper Ak <alperyasinak1@gmail.com>, hverkuil@kernel.org,
	mchehab@kernel.org, Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251227084038.28679-1-alperyasinak1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251227084038.28679-1-alperyasinak1@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

On Sat, 27 Dec 2025 11:40:37 +0300, Alper Ak wrote:
> rga_get_frame() can return ERR_PTR(-EINVAL) when buffer type is
> unsupported or invalid. rga_buf_init() does not check the return value
> and unconditionally dereferences the pointer when accessing f->size.
> 
> Add proper ERR_PTR checking and return the error to prevent
> dereferencing an invalid pointer.
> 
> Fixes: 6040702ade23 ("media: rockchip: rga: allocate DMA descriptors per buffer")
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/rockchip/rga/rga-buf.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
> index 730bdf98565a..bb575873f2b2 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -80,6 +80,9 @@ static int rga_buf_init(struct vb2_buffer *vb)
>  	struct rga_frame *f = rga_get_frame(ctx, vb->vb2_queue->type);
>  	size_t n_desc = 0;
>  
> +	if (IS_ERR(f))
> +		return PTR_ERR(f);
> +
>  	n_desc = DIV_ROUND_UP(f->size, PAGE_SIZE);
>  
>  	rbuf->n_desc = n_desc;
> -- 
> 2.43.0
> 
> 

