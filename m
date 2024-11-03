Return-Path: <linux-media+bounces-20724-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41BAF9BA342
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2024 01:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB63C1F21D2B
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2024 00:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570DDC2FB;
	Sun,  3 Nov 2024 00:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YVmPniK8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029AE1DA26;
	Sun,  3 Nov 2024 00:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730593520; cv=none; b=jQr+s3P85iYpdwYOZ10GMS57Joi6w/iMZnxiX4PNdrN9gDFAD6MVFiRZBWgPCIN0zzyLUwPtfYC+DbUxSHbXR2gl3pXm88XSrI18nxHvWLTojTrQy8cQqrCn9FyCTOi4deyWIXrdyvDZCZ88JaiG+az5xlqMZjMZG72BX1TYZxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730593520; c=relaxed/simple;
	bh=T5lY0VFW9AW0Z5PycEDmia0b3jlRK4Bvlp4nWq1UAsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnRX7+R8iXvOygK3EQVevb77axZTjJcAZFsyufw17nQ1UB3v3rPAGBUpUeFcZbF0GOa23tlrklJF/b4AhaleY/jTkoKW20gLXWBXlj/ivKxgeGAdznOPMwnzSlRMuxqhFKcWlAIwxDChMaSgxm7J1VQIpiG3sjiQwgNKU7wI9pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YVmPniK8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 423A555;
	Sun,  3 Nov 2024 01:25:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730593511;
	bh=T5lY0VFW9AW0Z5PycEDmia0b3jlRK4Bvlp4nWq1UAsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YVmPniK86gSIGr7/pQ9PNqkrVYsdj5VhFnaGqiIKlrwgzDxW+wevmrchNXFdX0g+s
	 1fRMSs959ipS1nVGxPHF+OpnL7cRYjqStR7CcSSOEGMSuums63e38XMv/d7eMJ1dA9
	 LGGPW4xppKJnA5vMrvFBnsOg/DheMln2Ahc/UFzQ=
Date: Sun, 3 Nov 2024 02:25:10 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Naushir Patuck <naush@raspberrypi.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: raspberrypi: cfe: Fix mapping of dmabuf buffers
Message-ID: <20241103002510.GO2473@pendragon.ideasonboard.com>
References: <20241101-rp1-cfe-fixes-seg-size-v1-1-0aacf2da56e5@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101-rp1-cfe-fixes-seg-size-v1-1-0aacf2da56e5@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Fri, Nov 01, 2024 at 01:55:15PM +0200, Tomi Valkeinen wrote:
> When using buffers from DRM, DMA-API gives a warning about: "mapping sg
> segment longer than device claims to support [len=307200] [max=65536]"
> 
> Add a call to vb2_dma_contig_set_max_seg_size() to tell the DMA-API
> about the supported segment size (which is UINT_MAX).
> 
> Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> index 045910de6c57..e52d8b20df40 100644
> --- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> +++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
> @@ -2341,6 +2341,12 @@ static int cfe_probe(struct platform_device *pdev)
>  		goto err_cfe_put;
>  	}
>  
> +	ret = vb2_dma_contig_set_max_seg_size(&pdev->dev, UINT_MAX);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Unable to set max_seg_size\n");

Maybe dev_err_probe() ? Or drop the error message, as
vb2_dma_contig_set_max_seg_size() already prints an error.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +		goto err_cfe_put;
> +	}
> +
>  	/* TODO: Enable clock only when running. */
>  	cfe->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(cfe->clk))
> 
> ---
> base-commit: 698b6e3163bafd61e1b7d13572e2c42974ac85ec
> change-id: 20241101-rp1-cfe-fixes-seg-size-b70309da74a2

-- 
Regards,

Laurent Pinchart

