Return-Path: <linux-media+bounces-47343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCD6C6CBD7
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 05:29:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF4F74F61D5
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 04:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D78302F6937;
	Wed, 19 Nov 2025 04:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kVSI0E3U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB1F1F5437;
	Wed, 19 Nov 2025 04:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763526289; cv=none; b=JNB34jSuYnXpve2jGCrhowluLp1AV1BxkPR1rkHrq2gmAPd/RHHLprEzB/L8D7rffJAUo7fD+loiCuPEgtJDJS6v0OCP8FabNibmJy046rNY6CaC85yv1r9rxNKouC+RSQ7kbV4RZxtoNYSQiHa4YrMYtICsEEqYlSHs/Y29AvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763526289; c=relaxed/simple;
	bh=yJeaXoLf70VhhSAHjfistXPCj7PDJPUYG9zpDQ+w2/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyiQfRaWTk0p5l+7ScPDWq0E4yDaNwfNhDl4O/gZd9GHTiTvAnwM4NtlPDlInhA9FhCIrOJyzevrueUjcLRrjF2RmUdzCR4Yzv7DP7jrBhCjVQ2HmZFJdklWebJqDHJ/dnzO3roOK36IQvdtEjdNBUKHmzm3sVPJ239ShbMH+Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kVSI0E3U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [205.220.129.225])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 7300B14B0;
	Wed, 19 Nov 2025 05:22:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763526162;
	bh=yJeaXoLf70VhhSAHjfistXPCj7PDJPUYG9zpDQ+w2/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kVSI0E3Ui98hX4dZ9Gb+H4e1+FpH3mSIYUuu0IMS4POaM8pAeO/ByZaHEmxmDCPFq
	 Tjv+0rBXwmi0xVhfATr/t5R13TkXbYD81fiE6DrcejeUcZWGJz2c2rEZa94saLNa86
	 nvBZMRl5BUj3okfss17WLcmZMb8Kb+013yUHlMhc=
Date: Wed, 19 Nov 2025 13:24:12 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] media: nxp: imx8-isi: use devm_pm_runtime_enable()
 to simplify code
Message-ID: <20251119042412.GN10711@pendragon.ideasonboard.com>
References: <20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com>
 <20251117-cam_cleanup-v1-3-6cd42872db79@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251117-cam_cleanup-v1-3-6cd42872db79@nxp.com>

On Mon, Nov 17, 2025 at 01:58:13PM -0500, Frank Li wrote:
> Use devm_pm_runtime_enable() to simplify code. Change to use
> dev_err_probe() because previous goto change to return.
> 
> No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index c3d411ddf492eb27b372763ce5d344a90c6ec524..a884976ac8f8295120c404941f7ee19b90723924 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -499,13 +499,14 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
>  	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
>  
> -	pm_runtime_enable(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
>  
>  	ret = mxc_isi_crossbar_init(isi);
> -	if (ret) {
> -		dev_err(dev, "Failed to initialize crossbar: %d\n", ret);
> -		goto err_pm;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to initialize crossbar: %d\n", ret);

No need to print the error value anymore.

>  
>  	for (i = 0; i < isi->pdata->num_channels; ++i) {
>  		ret = mxc_isi_pipe_init(isi, i);
> @@ -528,8 +529,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  
>  err_xbar:
>  	mxc_isi_crossbar_cleanup(&isi->crossbar);
> -err_pm:
> -	pm_runtime_disable(isi->dev);
> +
>  	return ret;
>  }
>  
> @@ -548,8 +548,6 @@ static void mxc_isi_remove(struct platform_device *pdev)
>  
>  	mxc_isi_crossbar_cleanup(&isi->crossbar);
>  	mxc_isi_v4l2_cleanup(isi);
> -
> -	pm_runtime_disable(isi->dev);
>  }
>  
>  static const struct of_device_id mxc_isi_of_match[] = {
> 
> -- 
> 2.34.1
> 

-- 
Regards,

Laurent Pinchart

