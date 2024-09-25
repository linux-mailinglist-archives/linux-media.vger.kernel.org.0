Return-Path: <linux-media+bounces-18569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC19C9866F6
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 21:36:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECD451C21635
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 19:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CA1145324;
	Wed, 25 Sep 2024 19:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gq9BKWir"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108B438DE4;
	Wed, 25 Sep 2024 19:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727292969; cv=none; b=rZLq2IDrrV4PdopOGSvaOk3UGG8B6Yv1du0INuAfryhqDTxgN/MXk81J1I+PUCkRnYn2cAdNYpkxXoSqmP8SBCaSdpeWSuzBngmDZ5j93Lqi09f9xMR1JmhSGnRxr0ZpptCe6cKj8exzAKlzcqL/NjWkbcON9fxdpQK25ZcRZjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727292969; c=relaxed/simple;
	bh=g65BxwBJyJxd6ZpqTbeNfzfkPJAGkZKQsFaE6FtwJ9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xw+nCrkHK4NpUDAhqakEtqHaW/Ffwnzidqk9S4kUB9qU/Id/e2/8Q3CG3uD/EW/lkBnXjbdB6VzdrwBOXoMbRF8nmNsj8C+s4GUPF8UANJyiLPI9PCKz2vpoVaVeXDYo0sCWD1bISP/4qWjtXBM+sUDcQ3uykv2CFjk2F9ZYpbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Gq9BKWir; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B43417E2;
	Wed, 25 Sep 2024 21:34:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727292876;
	bh=g65BxwBJyJxd6ZpqTbeNfzfkPJAGkZKQsFaE6FtwJ9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gq9BKWirY8TRrjLKkYv8KHEmWP8ieKH/nOQcEkHEvGZ3w/1yjLlfXdFbv/MNjbrgX
	 G/Neou3jqlKJ1PYnNNWzPhYQfE0eirAzZJMpIzUiPPcnK20kjOhgQCXOKV8geCyZhp
	 EWGCgoMeQX0uEIDoG4qM+W0KJTCJFBQcRIEBpRNA=
Date: Wed, 25 Sep 2024 22:36:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: nxp: imx8-isi: fix v4l2-compliance test errors
Message-ID: <20240925193602.GG30399@pendragon.ideasonboard.com>
References: <20240924103304.124085-1-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240924103304.124085-1-laurentiu.palcu@oss.nxp.com>

Hi Laurentiu,

Thank you for the patch.

On Tue, Sep 24, 2024 at 01:33:04PM +0300, Laurentiu Palcu wrote:
> Running the v4l2-compliance (1.27.0-5208, SHA: af114250d48d) on the m2m
> device fails on the MMAP streaming tests, with the following messages:
> 
> fail: v4l2-test-buffers.cpp(240): g_field() == V4L2_FIELD_ANY
> fail: v4l2-test-buffers.cpp(1508): buf.qbuf(node)
> 
> Apparently, the driver does not properly set the field member of
> vb2_v4l2_buffer struct, returning the default V4L2_FIELD_ANY value which
> is against the guidelines.
> 
> Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
> v2:
>  * set the 'field' in mxc_isi_video_buffer_prepare() as suggested by
>    Laurent;
>  * change the commit subject to make it more generic as the fix does
>    not address only the M2M device compliance errors but also the
>    video capture ones;
> 
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index ddd42a8f17884..60c55d6839431 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -898,6 +898,7 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
>  				 const struct v4l2_pix_format_mplane *pix)
>  {
>  	unsigned int i;
> +	struct vb2_v4l2_buffer *v4l2_buf = to_vb2_v4l2_buffer(vb2);

I'll swap those two lines when applying, we usually sort lines (roughly)
by decreasing length.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	for (i = 0; i < info->mem_planes; i++) {
>  		unsigned long size = pix->plane_fmt[i].sizeimage;
> @@ -911,6 +912,8 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
>  		vb2_set_plane_payload(vb2, i, size);
>  	}
>  
> +	v4l2_buf->field = pix->field;
> +
>  	return 0;
>  }
>  

-- 
Regards,

Laurent Pinchart

