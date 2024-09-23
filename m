Return-Path: <linux-media+bounces-18478-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 804AA983973
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2024 00:01:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B2EB28258A
	for <lists+linux-media@lfdr.de>; Mon, 23 Sep 2024 22:01:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAB684E0A;
	Mon, 23 Sep 2024 22:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RTs0brzf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0914AEF5;
	Mon, 23 Sep 2024 22:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727128885; cv=none; b=qPX2T84SX2Jr3I3Ot6SGp9XbexJaMbziT9zrr1f/WGenitBVJLu46MGLiu3rZRNyVyRo8n6aJuRCIPErY0zFxUyFYNxfInZgcRicZXyDN7KoD5Zpf+PVEYxfVGi1BDkXxI07WdI0Hg4d+tDMnKAet19FVXwjLSkJJ51LNsHIkRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727128885; c=relaxed/simple;
	bh=NH1pb+6p0LfHTfpVZjf826pzBCeQgJObBOljsscCafk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPiun7BvzVxST35wr8GOtUGPJyuqS7MS1UPt7zFHwhGXGKkdYk7r5MwmL9qVTYTLzTtbidSAeAcBsHi5zgOoiNyZmWMW+rJ3h21+P5dsHW7SruzjfLe4ajIOwEyVn1gsRVkyHo1/V6pgnIw0rQRkY+1Gjmcz9QQeSAIopOg1t+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RTs0brzf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E79669CA;
	Mon, 23 Sep 2024 23:59:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727128795;
	bh=NH1pb+6p0LfHTfpVZjf826pzBCeQgJObBOljsscCafk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RTs0brzfsfkl0YyZ7PfyEklG6oYaa9PaW0d6pfwGwFgawo65Kg2gj65cq7Goc7pFZ
	 X5kqmFSaX18yiGJJzPMpS9fSCuwjRLNJGv2fHLh1HHODJWUwv7AjToT1FnY4UOSg1N
	 X9c2+axVpxG8dcMRXIYtRUMNntC127LdEQFLaJSE=
Date: Tue, 24 Sep 2024 01:00:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: fix m2m device v4l2-compliance
 test errors
Message-ID: <20240923220047.GH8227@pendragon.ideasonboard.com>
References: <20240923120048.3200166-1-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240923120048.3200166-1-laurentiu.palcu@oss.nxp.com>

Hi Laurentiu,

Thank you for the patch.

On Mon, Sep 23, 2024 at 03:00:48PM +0300, Laurentiu Palcu wrote:
> Running the v4l2-compliance (1.27.0-5208, SHA: af114250d48d) on the m2m
> device fails on the MMAP streaming tests, with the following messages:
> 
> fail: v4l2-test-buffers.cpp(240): g_field() == V4L2_FIELD_ANY
> fail: v4l2-test-buffers.cpp(1508): buf.qbuf(node)
> 
> Apparently, the driver does not properly set the field member of
> vb2_v4l2_buffer struct, returning the default V4L2_FIELD_ANY value which
> is against the guidelines.

Strange, I would have sworn v4l2-compliance passed successfully when I
submitted the driver. Maybe it has been updated in the meantime.

> Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index b71195a3ba256..3f0c9e2ac802d 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -222,6 +222,11 @@ static int mxc_isi_m2m_vb2_buffer_prepare(struct vb2_buffer *vb2)
>  	struct mxc_isi_m2m_ctx *ctx = vb2_get_drv_priv(vq);
>  	const struct mxc_isi_m2m_ctx_queue_data *qdata =
>  		mxc_isi_m2m_ctx_qdata(ctx, vq->type);
> +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2);
> +
> +	v4l2_buf->field = vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE ?
> +			  ctx->queues.out.format.field :
> +			  ctx->queues.cap.format.field;

Wouldn't it be better to handle this in mxc_isi_video_buffer_prepare() ?
I think the same issue exists for live capture, not just for M2M
operation.

>  
>  	return mxc_isi_video_buffer_prepare(ctx->m2m->isi, vb2, qdata->info,
>  					    &qdata->format);

-- 
Regards,

Laurent Pinchart

