Return-Path: <linux-media+bounces-35096-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0366DADCFC5
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 16:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9365F7A3EEB
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 14:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DA12EF670;
	Tue, 17 Jun 2025 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YkTc7U6M"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D06C2EF659;
	Tue, 17 Jun 2025 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170573; cv=none; b=AMATLyVnoD4cDWPRaAgo7YBQr/nE15TsYxEsPKD34FarPCUm7Y2qx4DVEugJ5TSXA72ugesOSVF5//epfiP1fm6Mzee2FgCzQbRtwEUO+8nCkkHEhw5cveG4OXIZ07rbwsb6J6E18lr03jYPeVb/cfyzzqgRJe1VZSJmBi2MvA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170573; c=relaxed/simple;
	bh=6uTWAt2KSetlw4KyfOPztl6CboQRTXwdcr6yCnOKtKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UATBX0uL87BNENxklQoziUuHv0QUEldXtbBK17/xVkwBLZmAW6hKdwL5CDkbNH5E+Y1OjOf5CHz0Lypv0zQdcTXYEkmqF/FHxxcdrObf14GYIzEytPAAMdVtZjqHDe1huxMEhuyyRDlj8/WExk1k88Fg/1WbdiY8hJ/OIaHhUlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YkTc7U6M; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78AFF7E1;
	Tue, 17 Jun 2025 16:29:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750170556;
	bh=6uTWAt2KSetlw4KyfOPztl6CboQRTXwdcr6yCnOKtKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YkTc7U6MN/3MVBRQ8hkw1iU4btFV0Ee/Tm/D4vpiXi1OhANWh9M/iOBCPq6QW9XPu
	 P0XDSVQFYwg8Opwly8JywbLY5V8e8QqOEC0wUjf2yA0vx7S787jbcM2FXNEFa/UPSW
	 yGaCxI7kkzWjwdbIr96i91T/g5Gsaf7jV59lkqWU=
Date: Tue, 17 Jun 2025 17:29:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rob Herring <robh@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
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
Subject: Re: [PATCH v4 04/13] media: nxp: imx8-isi: Use
 devm_clk_bulk_get_all() to fetch clocks
Message-ID: <20250617142912.GF10006@pendragon.ideasonboard.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-4-ef695f1b47c4@nxp.com>
 <20250421211438.GN17813@pendragon.ideasonboard.com>
 <aBQZjFsExJh2uRfK@lizhi-Precision-Tower-5810>
 <20250502155747.GB20093@pendragon.ideasonboard.com>
 <aBylKcZyFInlKQAR@lizhi-Precision-Tower-5810>
 <20250611141449.GA24607@pendragon.ideasonboard.com>
 <20250617141112.GA2051217-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250617141112.GA2051217-robh@kernel.org>

Hi Rob,

On Tue, Jun 17, 2025 at 09:11:12AM -0500, Rob Herring wrote:
> On Wed, Jun 11, 2025 at 05:14:49PM +0300, Laurent Pinchart wrote:
> > On Thu, May 08, 2025 at 08:35:53AM -0400, Frank Li wrote:
> > > On Fri, May 02, 2025 at 06:57:47PM +0300, Laurent Pinchart wrote:
> > > > On Thu, May 01, 2025 at 09:02:04PM -0400, Frank Li wrote:
> > > > > On Tue, Apr 22, 2025 at 12:14:38AM +0300, Laurent Pinchart wrote:
> > > > > > On Tue, Apr 08, 2025 at 05:53:02PM -0400, Frank Li wrote:
> > > > > > > Use devm_clk_bulk_get_all() helper to simplify clock handle code.
> > > > > > >
> > > > > > > No functional changes intended.
> > > > > > >
> > > > > > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > > > > > ---
> > > > > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 46 +++-------------------
> > > > > > >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 +-
> > > > > > >  2 files changed, 6 insertions(+), 43 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > > > index ecfc95882f903..015350c6f2784 100644
> > > > > > > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > > > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > > > > > > @@ -275,11 +275,6 @@ static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
> > > > > > >  	.panic_set_thd_v = { .mask = 0xf0000, .offset = 16, .threshold = 0x7 },
> > > > > > >  };
> > > > > > >
> > > > > > > -static const struct clk_bulk_data mxc_imx8mn_clks[] = {
> > > > > > > -	{ .id = "axi" },
> > > > > > > -	{ .id = "apb" },
> > > > > > > -};
> > > > > > > -
> > > > > > >  static const struct mxc_isi_plat_data mxc_imx8mn_data = {
> > > > > > >  	.model			= MXC_ISI_IMX8MN,
> > > > > > >  	.num_ports		= 1,
> > > > > > > @@ -287,8 +282,6 @@ static const struct mxc_isi_plat_data mxc_imx8mn_data = {
> > > > > > >  	.reg_offset		= 0,
> > > > > > >  	.ier_reg		= &mxc_imx8_isi_ier_v1,
> > > > > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > > > > -	.clks			= mxc_imx8mn_clks,
> > > > > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > > > > >  	.buf_active_reverse	= false,
> > > > > > >  	.gasket_ops		= &mxc_imx8_gasket_ops,
> > > > > > >  	.has_36bit_dma		= false,
> > > > > > > @@ -301,8 +294,6 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
> > > > > > >  	.reg_offset		= 0x2000,
> > > > > > >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> > > > > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > > > > -	.clks			= mxc_imx8mn_clks,
> > > > > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > > > > >  	.buf_active_reverse	= true,
> > > > > > >  	.gasket_ops		= &mxc_imx8_gasket_ops,
> > > > > > >  	.has_36bit_dma		= true,
> > > > > > > @@ -315,8 +306,6 @@ static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
> > > > > > >  	.reg_offset		= 0x0,
> > > > > > >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> > > > > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > > > > -	.clks			= mxc_imx8mn_clks,
> > > > > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > > > > >  	.buf_active_reverse	= true,
> > > > > > >  	.has_36bit_dma		= false,
> > > > > > >  };
> > > > > > > @@ -328,8 +317,6 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
> > > > > > >  	.reg_offset		= 0,
> > > > > > >  	.ier_reg		= &mxc_imx8_isi_ier_v2,
> > > > > > >  	.set_thd		= &mxc_imx8_isi_thd_v1,
> > > > > > > -	.clks			= mxc_imx8mn_clks,
> > > > > > > -	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> > > > > > >  	.buf_active_reverse	= true,
> > > > > > >  	.gasket_ops		= &mxc_imx93_gasket_ops,
> > > > > > >  	.has_36bit_dma		= false,
> > > > > > > @@ -386,7 +373,7 @@ static int mxc_isi_runtime_suspend(struct device *dev)
> > > > > > >  {
> > > > > > >  	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
> > > > > > >
> > > > > > > -	clk_bulk_disable_unprepare(isi->pdata->num_clks, isi->clks);
> > > > > > > +	clk_bulk_disable_unprepare(isi->num_clks, isi->clks);
> > > > > > >
> > > > > > >  	return 0;
> > > > > > >  }
> > > > > > > @@ -396,7 +383,7 @@ static int mxc_isi_runtime_resume(struct device *dev)
> > > > > > >  	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
> > > > > > >  	int ret;
> > > > > > >
> > > > > > > -	ret = clk_bulk_prepare_enable(isi->pdata->num_clks, isi->clks);
> > > > > > > +	ret = clk_bulk_prepare_enable(isi->num_clks, isi->clks);
> > > > > > >  	if (ret) {
> > > > > > >  		dev_err(dev, "Failed to enable clocks (%d)\n", ret);
> > > > > > >  		return ret;
> > > > > > > @@ -414,27 +401,6 @@ static const struct dev_pm_ops mxc_isi_pm_ops = {
> > > > > > >   * Probe, remove & driver
> > > > > > >   */
> > > > > > >
> > > > > > > -static int mxc_isi_clk_get(struct mxc_isi_dev *isi)
> > > > > > > -{
> > > > > > > -	unsigned int size = isi->pdata->num_clks
> > > > > > > -			  * sizeof(*isi->clks);
> > > > > > > -	int ret;
> > > > > > > -
> > > > > > > -	isi->clks = devm_kmemdup(isi->dev, isi->pdata->clks, size, GFP_KERNEL);
> > > > > > > -	if (!isi->clks)
> > > > > > > -		return -ENOMEM;
> > > > > > > -
> > > > > > > -	ret = devm_clk_bulk_get(isi->dev, isi->pdata->num_clks,
> > > > > > > -				isi->clks);
> > > > > > > -	if (ret < 0) {
> > > > > > > -		dev_err(isi->dev, "Failed to acquire clocks: %d\n",
> > > > > > > -			ret);
> > > > > > > -		return ret;
> > > > > > > -	}
> > > > > > > -
> > > > > > > -	return 0;
> > > > > > > -}
> > > > > > > -
> > > > > > >  static int mxc_isi_probe(struct platform_device *pdev)
> > > > > > >  {
> > > > > > >  	struct device *dev = &pdev->dev;
> > > > > > > @@ -457,11 +423,9 @@ static int mxc_isi_probe(struct platform_device *pdev)
> > > > > > >  	if (!isi->pipes)
> > > > > > >  		return -ENOMEM;
> > > > > > >
> > > > > > > -	ret = mxc_isi_clk_get(isi);
> > > > > > > -	if (ret < 0) {
> > > > > > > -		dev_err(dev, "Failed to get clocks\n");
> > > > > > > -		return ret;
> > > > > > > -	}
> > > > > > > +	isi->num_clks = devm_clk_bulk_get_all(dev, &isi->clks);
> > > > > >
> > > > > > This prevents validating that the DT contains the expected clocks, which
> > > > > > could cause hard to debug issues. Isn't it a problem ?
> > > > >
> > > > > It is checked by dt-binding. Now no warning by DTB_CHECK under arm64 freecale.
> > > > > CHECK_DTB should be enough to find expected clocks.
> > > >
> > > > Yes, the DTB check will catch issues at build time, but the driver will
> > > > not enforce that. I'm not sure if there's a clear policy here, and if
> > > > ensuring at runtime in drivers that the expected clocks are present is
> > > > considered as a good practice by the DT maintainers. Rob, Krzysztof,
> > > > Conor, do you have an opinion ?
> > > 
> > > Rob:
> > > 	can you comment this?
> > 
> > Rob, any comment on this ?
> 
> My preference is to not do validation of the DT in the kernel. Unless 
> you need greater control of the clocks, I would use 
> devm_clk_bulk_get_all(). 

Thank you for your feedback. We'll go forward with this patch then.

-- 
Regards,

Laurent Pinchart

