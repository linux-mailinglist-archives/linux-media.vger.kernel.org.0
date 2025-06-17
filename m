Return-Path: <linux-media+bounces-35098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD04ADCFFB
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 875817A5432
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:33:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E98201006;
	Tue, 17 Jun 2025 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="eRFjA2m2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3851F4CAE;
	Tue, 17 Jun 2025 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170875; cv=none; b=NaeUjS/3609QUp7K88huK3nszLQhytam+5OYhC1xT/oCIZKtHIE2AHaISPxKAyW5f5G1SiMd4+exH/hGj1KVzy1HPdGPJo6nIVs7orafspk422vwiQ6NZ6D5I509B5QWJuGgqro/YhWfUL6BtJaxD0u3s1g18jp9vBTPWJ4Wquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170875; c=relaxed/simple;
	bh=7eVSwYhRrsGw308e1gWXBm5X3J3BsCedcVcfc7DyDMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJcm2I2oXdB/bjRHadD7/eHuxVNDBNUxyjgj71bHyLBFjxomnKNJ+YUaXE3pPTqdA3maM9W/HrJjnqQopjpRcoAbIzZJGesLReXiHb/SYbxIE3un+pTV6/Iy7afSlHBjeSlNyek+GTPujyCUa05QH9uVoAtz0J4oKkQcAQ8+VJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=eRFjA2m2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EEB57E1;
	Tue, 17 Jun 2025 16:34:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750170859;
	bh=7eVSwYhRrsGw308e1gWXBm5X3J3BsCedcVcfc7DyDMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eRFjA2m2TzJPaNadVlp/g6nZhQtjBw8DzZMp2uaxV4XCS8ILolO/l48V2PRSJkYG7
	 615Ja/S+EC/SeBscdF5aji3VzhpJUeZz9rvH316vYgyFJ7rrCXG3BHCzHm8kDFKSkv
	 bpv0l1rrXPZER84ZeLYfbQ/1c6YQqdHsDId+UYeg=
Date: Tue, 17 Jun 2025 17:34:16 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v5 04/13] media: nxp: imx8-isi: Use
 devm_clk_bulk_get_all() to fetch clocks
Message-ID: <20250617143416.GA21052@pendragon.ideasonboard.com>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
 <20250522-8qxp_camera-v5-4-d4be869fdb7e@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522-8qxp_camera-v5-4-d4be869fdb7e@nxp.com>

Hi Frank,

On Thu, May 22, 2025 at 01:56:42PM -0400, Frank Li wrote:
> Use devm_clk_bulk_get_all() helper to simplify clock handle code.
> 
> No functional changes intended.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> change in v5
> - none
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 46 +++-------------------
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 +-
>  2 files changed, 6 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index ecfc95882f903..015350c6f2784 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -275,11 +275,6 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
>  	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
>  };
>  
> -static const struct clk_bulk_data mxc_imx8mn_clks[] = {
> -	{ .id = "axi" },
> -	{ .id = "apb" },
> -};
> -
>  static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  	.model			= MXC_ISI_IMX8MN,
>  	.num_ports		= 1,
> @@ -287,8 +282,6 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
>  	.reg_offset		= 0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v1,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.clks			= mxc_imx8mn_clks,
> -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
>  	.buf_active_reverse	= false,
>  	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= false,
> @@ -301,8 +294,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.reg_offset		= 0x2000,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.clks			= mxc_imx8mn_clks,
> -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
>  	.buf_active_reverse	= true,
>  	.gasket_ops		= &mxc_imx8_gasket_ops,
>  	.has_36bit_dma		= true,
> @@ -315,8 +306,6 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
>  	.reg_offset		= 0x0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.clks			= mxc_imx8mn_clks,
> -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
>  	.buf_active_reverse	= true,
>  	.has_36bit_dma		= false,
>  };
> @@ -328,8 +317,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.reg_offset		= 0,
>  	.ier_reg		= &mxc_imx8_isi_ier_v2,
>  	.set_thd		= &mxc_imx8_isi_thd_v1,
> -	.clks			= mxc_imx8mn_clks,
> -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
>  	.buf_active_reverse	= true,
>  	.gasket_ops		= &mxc_imx93_gasket_ops,
>  	.has_36bit_dma		= false,
> @@ -386,7 +373,7 @@ static int mxc_isi_runtime_suspend(struct device *dev)
>  {
>  	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
>  
> -	clk_bulk_disable_unprepare(isi->pdata->num_clks, isi->clks);
> +	clk_bulk_disable_unprepare(isi->num_clks, isi->clks);
>  
>  	return 0;
>  }
> @@ -396,7 +383,7 @@ static int mxc_isi_runtime_resume(struct device *dev)
>  	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
>  	int ret;
>  
> -	ret = clk_bulk_prepare_enable(isi->pdata->num_clks, isi->clks);
> +	ret = clk_bulk_prepare_enable(isi->num_clks, isi->clks);
>  	if (ret) {
>  		dev_err(dev, "Failed to enable clocks (%d)\n", ret);
>  		return ret;
> @@ -414,27 +401,6 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
>   * Probe, remove & driver
>   */
>  
> -static int mxc_isi_clk_get(struct mxc_isi_dev *isi)
> -{
> -	unsigned int size = isi->pdata->num_clks
> -			  * sizeof(*isi->clks);
> -	int ret;
> -
> -	isi->clks = devm_kmemdup(isi->dev, isi->pdata->clks, size, GFP_KERNEL);
> -	if (!isi->clks)
> -		return -ENOMEM;
> -
> -	ret = devm_clk_bulk_get(isi->dev, isi->pdata->num_clks,
> -				isi->clks);
> -	if (ret < 0) {
> -		dev_err(isi->dev, "Failed to acquire clocks: %d\n",
> -			ret);
> -		return ret;
> -	}
> -
> -	return 0;
> -}
> -
>  static int mxc_isi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -457,11 +423,9 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  	if (!isi->pipes)
>  		return -ENOMEM;
>  
> -	ret = mxc_isi_clk_get(isi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to get clocks\n");
> -		return ret;
> -	}
> +	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
> +	if (isi->num_clks < 0)
> +		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
>  
>  	isi->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(isi->regs)) {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> index e7534a80af7b4..bd3cfe5fbe063 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -169,8 +169,6 @@ struct mxc_isi_plat_data {
>  	const struct mxc_isi_ier_reg  *ier_reg;
>  	const struct mxc_isi_set_thd *set_thd;
>  	const struct mxc_gasket_ops *gasket_ops;
> -	const struct clk_bulk_data *clks;
> -	unsigned int num_clks;
>  	bool buf_active_reverse;
>  	bool has_36bit_dma;
>  };
> @@ -282,6 +280,7 @@ struct mxc_isi_dev {
>  
>  	void __iomem			*regs;
>  	struct clk_bulk_data		*clks;
> +	int				num_clks;
>  	struct regmap			*gasket;
>  
>  	struct mxc_isi_crossbar		crossbar;

-- 
Regards,

Laurent Pinchart

