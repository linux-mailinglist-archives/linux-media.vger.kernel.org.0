Return-Path: <linux-media+bounces-12094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B3A8D1DCD
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 16:00:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BA16283679
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 14:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC0716F826;
	Tue, 28 May 2024 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MRzE0Htp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDD313A868;
	Tue, 28 May 2024 14:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716904845; cv=none; b=F36wslGsQeyO+ACGn6+DLAdiVf3mVxfhBLTWrU9pGxc1kPvXugL/jrqt9pkLerMZUHuC+CbUD3VXUBAICayedGhN5O2kUXfyfXRR1LYM/8aKUNu9e+qbK+cN4jwO6qzPAylC0xsdwgTqcjjcbV+wGmU2nPHrsD+8gAF/47/ur7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716904845; c=relaxed/simple;
	bh=RpvPxqY9P5P6+k99Ou+ScAsGrm+nMKFfYqjpYkPApvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2Jmvukl7lxSz4MAsDlB8lPmBVTVso8dbtI9/SK0TGuiYWhLcZiOm+CerYoX1+ao5juW4EQrJHH+G/L62TPgZsOT1R1YahEQMKp6RRZfv5P3zcRHp4bVXgTuIWdO+ZzPm4lUik2lY3PJtV7AtRCHKF+nJag9mGzfqmguPUP2ews=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MRzE0Htp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECF81B53;
	Tue, 28 May 2024 16:00:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716904837;
	bh=RpvPxqY9P5P6+k99Ou+ScAsGrm+nMKFfYqjpYkPApvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MRzE0HtpjHHIz/aVF84FOU4Be253ICC82oLOG1BnSJFopBUt/+D18o77MsrY/T+mz
	 1EGLiluzRXft/D8XfLNClhVHjpluCgjQg7/lhAy8d+pUpfhUG7BmcqgFuddwPesD74
	 Bpy2RXaNdIFAl+8V4m+4kUxbNdvxSxNorw6yIXnk=
Date: Tue, 28 May 2024 17:00:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v3 02/18] media: xilinx: Refactor struct xvip_dma
Message-ID: <20240528140028.GC29970@pendragon.ideasonboard.com>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
 <20240527-cocci-flexarray-v3-2-cda09c535816@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240527-cocci-flexarray-v3-2-cda09c535816@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Mon, May 27, 2024 at 09:08:52PM +0000, Ricardo Ribalda wrote:
> Replace a single element array with a single field.
> 
> The following cocci warning is fixed:
> drivers/media/platform/xilinx/xilinx-dma.h:100:19-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/xilinx/xilinx-dma.c | 4 ++--
>  drivers/media/platform/xilinx/xilinx-dma.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
> index a96de5d388a1..a1687b868a44 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.c
> +++ b/drivers/media/platform/xilinx/xilinx-dma.c
> @@ -348,8 +348,8 @@ static void xvip_dma_buffer_queue(struct vb2_buffer *vb)
>  	}
>  
>  	dma->xt.frame_size = 1;
> -	dma->sgl[0].size = dma->format.width * dma->fmtinfo->bpp;
> -	dma->sgl[0].icg = dma->format.bytesperline - dma->sgl[0].size;
> +	dma->sgl.size = dma->format.width * dma->fmtinfo->bpp;
> +	dma->sgl.icg = dma->format.bytesperline - dma->sgl.size;
>  	dma->xt.numf = dma->format.height;
>  
>  	desc = dmaengine_prep_interleaved_dma(dma->dma, &dma->xt, flags);
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.h b/drivers/media/platform/xilinx/xilinx-dma.h
> index 9c6d4c18d1a9..18f77e1a7b39 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.h
> +++ b/drivers/media/platform/xilinx/xilinx-dma.h
> @@ -97,7 +97,7 @@ struct xvip_dma {
>  	struct dma_chan *dma;
>  	unsigned int align;
>  	struct dma_interleaved_template xt;
> -	struct data_chunk sgl[1];
> +	struct data_chunk sgl;
>  };
>  
>  #define to_xvip_dma(vdev)	container_of(vdev, struct xvip_dma, video)

-- 
Regards,

Laurent Pinchart

