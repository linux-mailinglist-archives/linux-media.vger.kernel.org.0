Return-Path: <linux-media+bounces-38878-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 494B4B1ABC8
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 02:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E12083BE1E1
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 00:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B33318A6A5;
	Tue,  5 Aug 2025 00:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sR7bGovM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D8FBF6;
	Tue,  5 Aug 2025 00:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754354740; cv=none; b=jU13FWDuHhsrpbL1xh1V6wE6C6kIk+6WJQdLFJUtCAyy1qF7Vo+81tT1RkGdO4IjX7c5kLdZAZMBuiCQ0jTislYWuYPwsdYkGD3RFvaGu/HOYXtLJOexyXeaE7TyggjaM+FkzGxt6M+hgGV32YGa5QEh86VGFvau2CMctuxUVLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754354740; c=relaxed/simple;
	bh=jJ2HdpSRn3L0bjsPQAigHcB0H8EMFzqi56r1nk4Dxso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kptZRR6SKx577V6Cb3sSgvVosZ4ArFj6R6bafzWozPl/87hvepEZ51gdw2TfALl1UI/NE1Yuf/GAhHt1pA9w4nZ0kOh3bMZqQ2vu83CG2oyg0+MWM7NjRVjv21AeNoHx6ca7zSPcUnlKhjel71qBiefWTjN3XK0jf8ViI+26wng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sR7bGovM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D8E7B1FE4;
	Tue,  5 Aug 2025 02:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754354689;
	bh=jJ2HdpSRn3L0bjsPQAigHcB0H8EMFzqi56r1nk4Dxso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sR7bGovMJnIVXgczy+KOr7tbpkeKXVhH5srHSpD3nLcQqSIC2hhbeRvfD18AN0DVq
	 tQDo9oTuvOcLTsmxc2s5yFc1DqWUBk5kq8/wRk6uIlEs4uGStjt23a+lWoghHrHvXM
	 rOp0GlksT9JnNFbhLK1VageL08rvUDxQUiI10mZ0=
Date: Tue, 5 Aug 2025 03:45:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jack Zhu <jack.zhu@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] media: starfive: camss: Use common dma-contig dma addr
 helper
Message-ID: <20250805004522.GA24627@pendragon.ideasonboard.com>
References: <20250801082149.591192-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250801082149.591192-1-paulk@sys-base.io>

Hi Paul,

Thank you for the patch.

On Fri, Aug 01, 2025 at 10:21:49AM +0200, Paul Kocialkowski wrote:
> The vb2_plane_cookie helpers is not meant to be used directly by
> drivers using the generic dma-contig allocator.
> 
> Use the common helper to retrieve the plane dma address instead.
> 
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/staging/media/starfive/camss/stf-video.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-video.c b/drivers/staging/media/starfive/camss/stf-video.c
> index a0420eb6a0aa..b0b9b70b9641 100644
> --- a/drivers/staging/media/starfive/camss/stf-video.c
> +++ b/drivers/staging/media/starfive/camss/stf-video.c
> @@ -167,10 +167,8 @@ static int video_buf_init(struct vb2_buffer *vb)
>  	struct stfcamss_video *video = vb2_get_drv_priv(vb->vb2_queue);
>  	struct stfcamss_buffer *buffer = to_stfcamss_buffer(vbuf);
>  	const struct v4l2_pix_format *fmt = &video->active_fmt.fmt.pix;
> -	dma_addr_t *paddr;
>  
> -	paddr = vb2_plane_cookie(vb, 0);
> -	buffer->addr[0] = *paddr;
> +	buffer->addr[0] = vb2_dma_contig_plane_dma_addr(vb, 0);

That looks good,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

However, I think the driver should be dropped from the kernel. It has
been merged in staging because it wasn't complete, and startfive made it
clear they don't plan to work on it anymore.

Would you like to submit a patch to drop the driver instead ?

>  
>  	if (fmt->pixelformat == V4L2_PIX_FMT_NV12)
>  		buffer->addr[1] =

-- 
Regards,

Laurent Pinchart

