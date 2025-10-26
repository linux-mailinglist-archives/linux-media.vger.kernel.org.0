Return-Path: <linux-media+bounces-45586-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7145CC0B563
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 23:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2DF364EC49E
	for <lists+linux-media@lfdr.de>; Sun, 26 Oct 2025 22:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99362283159;
	Sun, 26 Oct 2025 22:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ENJ4Qj8l"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7016972633;
	Sun, 26 Oct 2025 22:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761516925; cv=none; b=AJn/GRxfT/dzuSAbnRK24Wo7Mc4gAc5z2vOWRH3KUoclY0ZsVfOnmFnIFRuTe5nK5mjjah+YSsYbntxjS0P8Ir+bvyJN0A5fbxNoG/w+4BPTfwC5VLJeo+C8ZvCGIapHQrfM0pBrDQprw/sLpxFjr/uJqA5ok+dbROVlCX/uVSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761516925; c=relaxed/simple;
	bh=GRJJh+euJBb7Q3UYKG8XfvgSRz/qMSbefV+j3k8HTpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwOeVvigTuXtOKGSdlGT6aTiYPOkiBtgUximb/RwMKQZWqPs7UpWxOcbBrIti4pjYkW8N09lmagMqkoAVNHthkcJ+14WhN31OX+WxQDxfCgDVRyFEEhn2gAFPUdHdy7cymqAYPScmY8KsVo501Y/1Yz71IJHM+61qewIjX5w/dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ENJ4Qj8l; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4CCCE1F0E;
	Sun, 26 Oct 2025 23:13:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761516814;
	bh=GRJJh+euJBb7Q3UYKG8XfvgSRz/qMSbefV+j3k8HTpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ENJ4Qj8loGEmGVnpDuHIsZojbsdBJSMiN1hgdJoY4UptY5CwOttTMYVPGoCQGu8Ca
	 Vyih4w1LvF4Avh2CE6CUv7D5/sZEMSlAo6l+o6W3SC4Hjlmwro1LyUJqqhv/SFoO7+
	 pL3GDphfqMiL5DiVuPmLqi20em3nleOaS+sKBU8c=
Date: Mon, 27 Oct 2025 00:15:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH 3/3] media: nxp: imx8-isi: Add ISI support for i.MX95
Message-ID: <20251026221507.GI13023@pendragon.ideasonboard.com>
References: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
 <20251024-isi_imx95-v1-3-3ad1af7c3d61@nxp.com>
 <aPuEEDzY3FoeM9tQ@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aPuEEDzY3FoeM9tQ@lizhi-Precision-Tower-5810>

On Fri, Oct 24, 2025 at 09:50:08AM -0400, Frank Li wrote:
> On Fri, Oct 24, 2025 at 05:46:54PM +0800, Guoniu Zhou wrote:
> > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> >
> > The ISI module on i.MX95 supports up to eight channels and four link
> > sources to obtain the image data for processing in its pipelines. It
> > can process up to eight image sources at the same time.
> >
> > In i.MX95, the gasket callbacks set ISI QoS which decide the priority
> > to access system memory when there are multiple masters access memory
> > simultaneously in camera domain.
> >
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 13 +++++++
> >  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
> >  .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 44 ++++++++++++++++++++++
> >  3 files changed, 59 insertions(+)
> >
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > index adc8d9960bf0df87d4e475661a3439beaf5ce9f6..ea9cc6d72bd4605000c6cbac2fa8cb9806e3cd3b 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> > @@ -337,6 +337,18 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
> >  	.has_36bit_dma		= false,
> >  };
> >
> > +static const struct mxc_isi_plat_data mxc_imx95_data = {
> > +	.model			= MXC_ISI_IMX95,
> > +	.num_ports		= 4,
> > +	.num_channels		= 8,
> > +	.reg_offset		= 0x10000,
> > +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> > +	.set_thd		= &mxc_imx8_isi_thd_v1,
> > +	.buf_active_reverse	= true,
> > +	.gasket_ops		= &mxc_imx95_gasket_ops,
> > +	.has_36bit_dma		= true,
> > +};
> > +
> >  static const struct mxc_isi_plat_data mxc_imx8qm_data = {
> >  	.model			= MXC_ISI_IMX8QM,
> >  	.num_ports		= 5,
> > @@ -548,6 +560,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
> >  	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
> >  	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
> >  	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
> > +	{ .compatible = "fsl,imx95-isi", .data = &mxc_imx95_data },
> >  	{ /* sentinel */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > index e84af5127e4e7938e55e31b7063bee5e2cd4cb11..d1297ac26c56bdd97e4dd325b2a7394430a7adb9 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> > @@ -161,6 +161,7 @@ enum model {
> >  	MXC_ISI_IMX8QXP,
> >  	MXC_ISI_IMX8ULP,
> >  	MXC_ISI_IMX93,
> > +	MXC_ISI_IMX95,
> >  };
> >
> >  struct mxc_isi_plat_data {
> > @@ -297,6 +298,7 @@ struct mxc_isi_dev {
> >
> >  extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
> >  extern const struct mxc_gasket_ops mxc_imx93_gasket_ops;
> > +extern const struct mxc_gasket_ops mxc_imx95_gasket_ops;
> >
> >  int mxc_isi_crossbar_init(struct mxc_isi_dev *isi);
> >  void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar);
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > index f69c3b5d478209c083738477edf380e3f280c471..6418ee1aabdad3cb92e84f2ef6406c5503987401 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
> > @@ -3,6 +3,7 @@
> >   * Copyright 2019-2023 NXP
> >   */
> >
> > +#include <linux/bits.h>
> >  #include <linux/regmap.h>
> >
> >  #include <media/mipi-csi2.h>
> > @@ -83,3 +84,46 @@ const struct mxc_gasket_ops mxc_imx93_gasket_ops = {
> >  	.enable = mxc_imx93_gasket_enable,
> >  	.disable = mxc_imx93_gasket_disable,
> >  };
> > +
> > +/* -----------------------------------------------------------------------------
> > + * i.MX95 gasket
> > + */
> > +#define ISI_QOS						0x10
> > +#define ISI_QOS_AWQOS(x)				FIELD_PREP(GENMASK(2, 0), (x))
> > +
> > +#define ISI_PANIC_QOS					0x14
> > +#define ISI_PANIC_QOS_HURRY_AWQOS(x)			FIELD_PREP(GENMASK(2, 0), (x))
> > +
> > +static void mxc_imx95_set_qos(struct mxc_isi_dev *isi, unsigned int val)
> > +{
> > +	/* Config QoS */
> > +	regmap_write(isi->gasket, ISI_QOS, ISI_QOS_AWQOS(val));
> > +
> > +	/* Config Panic QoS */
> > +	regmap_write(isi->gasket, ISI_PANIC_QOS, ISI_PANIC_QOS_HURRY_AWQOS(val));
> > +}
> > +
> > +static void mxc_imx95_clear_qos(struct mxc_isi_dev *isi)
> > +{
> > +	regmap_write(isi->gasket, ISI_QOS, 0x0);
> > +	regmap_write(isi->gasket, ISI_PANIC_QOS, 0x0);
> > +}
> > +
> > +static void mxc_imx95_gasket_enable(struct mxc_isi_dev *isi,
> > +				    const struct v4l2_mbus_frame_desc *fd,
> > +				    const struct v4l2_mbus_framefmt *fmt,
> > +				    const unsigned int port)
> > +{
> > +	mxc_imx95_set_qos(isi, 0x3);
> > +}
> 
> can we use standard interconnects standard interface to config Qos stuff.
> https://elixir.bootlin.com/linux/v6.17.4/source/include/linux/interconnect.h

Good suggestion, that would be my preference too. Otherwise we'll end up
hardcoding parameters here, which doesn't feel right. I assume the
values above would need to be tweaked based on use cases.

> > +
> > +static void mxc_imx95_gasket_disable(struct mxc_isi_dev *isi,
> > +				     unsigned int port)
> > +{
> > +	mxc_imx95_clear_qos(isi);
> > +}
> > +
> > +const struct mxc_gasket_ops mxc_imx95_gasket_ops = {
> > +	.enable = mxc_imx95_gasket_enable,
> > +	.disable = mxc_imx95_gasket_disable,
> > +};

-- 
Regards,

Laurent Pinchart

