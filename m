Return-Path: <linux-media+bounces-11441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D94518C5861
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 16:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97D11284130
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 14:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1D017EB8D;
	Tue, 14 May 2024 14:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jb1pYVjP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393B7144D0D;
	Tue, 14 May 2024 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715698698; cv=none; b=nx3pL9G4VFjUxTNK0VylWIg+QReQsEKwIDdqX11iN1yqiXAUalItgUUH0zNV8KGdTI/WvtJ2oLJefdqZ62oT4LsSEcDATFj/QhVq3JR6bEMouwDfzZk0ReEbHrVB2gMoKBIjKk9RVCyhAMB6XOTb2C5EbShB83q1dz1LbtaP1Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715698698; c=relaxed/simple;
	bh=wNSTj4hGmGdOckhYdKmd03we4J0ObyzxoIG5cd67V7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1t0aIRTlBkC+6jbZicNq3qlxuRFVNjvZnl4Cbq8GC98OpGCSi9+MtV2WAJAGSzIEY9ETSyHfuwhqrsfT5M9Ei5sX2Hri0QYPqr+xSesWqrFHpDlmaKIDDso+FuYNQT7x8HH5KOcV5l+5eFR4W1BVia1nQuq2MfrDkLz3hAnGx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jb1pYVjP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E436E22A;
	Tue, 14 May 2024 16:58:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1715698688;
	bh=wNSTj4hGmGdOckhYdKmd03we4J0ObyzxoIG5cd67V7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jb1pYVjPx0opwTVqVSzahYGKGTNYfJpucPGTQgREbRTROoAaeGj+ZZEDWOaGGqduD
	 8UdoCQUkK6rRl+tkF5dsjLjWQwFFR0juEkV17e+YqdOsbtaKNevNRdTRHeGtvu+eLX
	 AQENBoUJ7sbclrso/oLXRmtF4FuwvUR/hxsBGW+4=
Date: Tue, 14 May 2024 17:58:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH v2] media: imx-pxp: fix ERR_PTR dereference in pxp_probe()
Message-ID: <20240514145807.GF32013@pendragon.ideasonboard.com>
References: <20240514095038.3464191-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240514095038.3464191-1-harshit.m.mogalapalli@oracle.com>

Hi Harshit,

Thank you for the patch.

On Tue, May 14, 2024 at 02:50:38AM -0700, Harshit Mogalapalli wrote:
> devm_regmap_init_mmio() can fail, add a check and bail out in case of
> error.
> 
> Fixes: 4e5bd3fdbeb3 ("media: imx-pxp: convert to regmap")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> This is based on static analysis and only compile tested.
> v1->v2: fix error message, we dont need %d in dev_err_probe()
> ---
>  drivers/media/platform/nxp/imx-pxp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-pxp.c b/drivers/media/platform/nxp/imx-pxp.c
> index e62dc5c1a4ae..e4427e6487fb 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -1805,6 +1805,9 @@ static int pxp_probe(struct platform_device *pdev)
>  		return PTR_ERR(mmio);
>  	dev->regmap = devm_regmap_init_mmio(&pdev->dev, mmio,
>  					    &pxp_regmap_config);
> +	if (IS_ERR(dev->regmap))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(dev->regmap),
> +				     "Failed to init regmap\n");
>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)

-- 
Regards,

Laurent Pinchart

