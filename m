Return-Path: <linux-media+bounces-25734-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB2CA2B378
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 21:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C8C67A2A2C
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2025 20:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB8E1D90AE;
	Thu,  6 Feb 2025 20:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IU94JLeg"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7F01CEAD3;
	Thu,  6 Feb 2025 20:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874278; cv=none; b=AhIrZetU9WpsF1Z/uJhhkyE28Iabpd36UKQpvjIi1McJVIV1YQtY/qvXBON53OCM52lMA1CIJdj8/81QKfUfcTn4tckDmJwOcgJiVgwolVVO30W1u6AM0YRekAHy61UwqrqeCsE5PInH//BRU+ZVN6yw8iWqhwx0K0GUoB/kmWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874278; c=relaxed/simple;
	bh=5mXvQd3CneBXdKXgCdHA5M7k1+OX9VqlZ0ZD8Zqbwm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U886rT9Ckcex5i5BFVyfwiKJS/GIMVcB5q89265Wn5p73p+hdLe0zdZUyPe4fBc9xIRbT/0UDfMQ8P5yvMr58KxxzDb+TujVf103wBcuUsU+rXqphG70Ujq/vUSwoYj6VayYPbFJzlxkdbZtzrrUM4S5x5AOs659YHh0zBkV0xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IU94JLeg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE1E41198;
	Thu,  6 Feb 2025 21:36:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738874201;
	bh=5mXvQd3CneBXdKXgCdHA5M7k1+OX9VqlZ0ZD8Zqbwm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IU94JLeg6sNSomp5TUI4RVTuWRKfqiDj/mlWqvcmC/16KSKlIEcWrZ1nnVRTsb3Mp
	 3z6yoAdanHa1Sja/kBnJUPyqKLB2g0FwseptGe0C/EjROTGu4L6muaZZb7n6GXXqIU
	 ge6BIq3HCOd2126eyEximadQRIk59/lkeahaZzyo=
Date: Thu, 6 Feb 2025 22:37:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] media: nxp: imx8-isi: better handle the m2m
 usage_count
Message-ID: <20250206203749.GD7524@pendragon.ideasonboard.com>
References: <20241023085643.978729-1-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023085643.978729-1-laurentiu.palcu@oss.nxp.com>

Hi Laurentiu,

Thank you for the patch.

On Wed, Oct 23, 2024 at 11:56:43AM +0300, Laurentiu Palcu wrote:
> Currently, if streamon/streamoff calls are imbalanced we can either end up
> with a negative ISI m2m usage_count (if streamoff() is called more times
> than streamon()) in which case we'll not be able to restart the ISI pipe
> next time, or the usage_count never gets to 0 and the pipe is never
> switched off.
> 
> To avoid that, add a 'streaming' flag to mxc_isi_m2m_ctx_queue_data and use it
> in the streamon/streamoff to avoid incrementing/decrementing the usage_count
> uselessly, if called multiple times from the same context.
> 
> Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
> v3:
>  * Changed the implementation as suggested by Laurent and add a Suggested-by
>    tag to reflect that;
> 
> v2:
>  * Changed the way 'usage_count' is incremented/decremented by taking
>    into account the context the streamon/streamoff functions are called
>    from;
>  * Changed the commit message and subject to reflect the changes;
> 
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index 9745d6219a166..dc10e1a9f27c1 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -43,6 +43,7 @@ struct mxc_isi_m2m_ctx_queue_data {
>  	struct v4l2_pix_format_mplane format;
>  	const struct mxc_isi_format_info *info;
>  	u32 sequence;
> +	bool streaming;
>  };
>  
>  struct mxc_isi_m2m_ctx {
> @@ -486,6 +487,7 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
>  				enum v4l2_buf_type type)
>  {
>  	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
> +	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
>  	const struct v4l2_pix_format_mplane *out_pix = &ctx->queues.out.format;
>  	const struct v4l2_pix_format_mplane *cap_pix = &ctx->queues.cap.format;
>  	const struct mxc_isi_format_info *cap_info = ctx->queues.cap.info;
> @@ -495,6 +497,9 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
>  

While at it I'll drop the blank line here when applying the patch.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	int ret;
>  
> +	if (q->streaming)
> +		return 0;
> +
>  	mutex_lock(&m2m->lock);
>  
>  	if (m2m->usage_count == INT_MAX) {
> @@ -547,6 +552,8 @@ static int mxc_isi_m2m_streamon(struct file *file, void *fh,
>  		goto unchain;
>  	}
>  
> +	q->streaming = true;
> +
>  	return 0;
>  
>  unchain:
> @@ -569,10 +576,14 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
>  				 enum v4l2_buf_type type)
>  {
>  	struct mxc_isi_m2m_ctx *ctx = to_isi_m2m_ctx(fh);
> +	struct mxc_isi_m2m_ctx_queue_data *q = mxc_isi_m2m_ctx_qdata(ctx, type);
>  	struct mxc_isi_m2m *m2m = ctx->m2m;
>  
>  	v4l2_m2m_ioctl_streamoff(file, fh, type);
>  
> +	if (!q->streaming)
> +		return 0;
> +
>  	mutex_lock(&m2m->lock);
>  
>  	/*
> @@ -598,6 +609,8 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
>  
>  	mutex_unlock(&m2m->lock);
>  
> +	q->streaming = false;
> +
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart

