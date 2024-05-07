Return-Path: <linux-media+bounces-11103-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3BD8BECA0
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 21:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 880AD1F234C6
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 19:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED16516E862;
	Tue,  7 May 2024 19:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A+vQwDRi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB02F14D2BE;
	Tue,  7 May 2024 19:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715110464; cv=none; b=BakwmvGGnwhcQZHJi2KSfilPywi/zqcAWrUqqrBN8OycG/58Uqay8BaJH6Sb6hBHfMlvhU5pm4kjN4H4cpGQPeNS+A+pRhQ0hsqQuaZbLXtM1SyjaJfeCFPaSvnGW/VWT3+PxNvKIaBVxgvSmW5pIzCJgCgM6B/gHsmsaNnwx60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715110464; c=relaxed/simple;
	bh=JIzGYwzsIqdboqdXrPWYdf1tKATH1z3ErUquMcGhApk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQzw9bZqKl2/7x4RHeNPznpqYKCdR13SbbKzeyoAztRRIoyBmFXwJ0F07m25YsSc5wtN2AJtXKDYZh27O5W1SIYtcp1fnamIi1AnqPT/q2npvpmPgW8KE7hqh7CdKcscch8wcfABiIXZ2cdS+qnIhXPs7V83ZOm/J9QxwYJAvBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A+vQwDRi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 68DAC9CE;
	Tue,  7 May 2024 21:34:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715110458;
	bh=JIzGYwzsIqdboqdXrPWYdf1tKATH1z3ErUquMcGhApk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A+vQwDRiW39L1GyVYDDr8Ke7BHjnv1ZRARyd9AgaMz9IZs7Bu4gl7CiR50V044kXh
	 W3iGv3yvC1MYin7qslkmhmMbbPuEBRlTcIGhyk6dwI7AvvbNh1oW0O87GfKEFOVdtk
	 YsmtKzbvBuEFl2Ip8FP64t1y9YI8P/qZP/O2hHr8=
Date: Tue, 7 May 2024 22:34:12 +0300
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
Subject: Re: [PATCH v2 02/18] media: xilinx: Refactor struct xvip_dma
Message-ID: <20240507193412.GB2012@pendragon.ideasonboard.com>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-2-7aea262cf065@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240507-cocci-flexarray-v2-2-7aea262cf065@chromium.org>

Hi Ricardo,

Thank you for the patch.

On Tue, May 07, 2024 at 04:27:07PM +0000, Ricardo Ribalda wrote:
> Replace a single element array with a single field.
> 
> The following cocci warning is fixed:
> drivers/media/platform/xilinx/xilinx-dma.h:100:19-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

This is a false positive, as I really meant ab array with a single
element, this isn't a VLA. I think the current code is a bit clearer,
but I don't think this patch is such a regression in terms of
readability that I'll argue for the driver to remain the last coccinelle
warning :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
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

