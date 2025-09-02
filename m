Return-Path: <linux-media+bounces-41573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAFEB400DC
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 631BE482F03
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93FB287507;
	Tue,  2 Sep 2025 12:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qI/pm+ny"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390A0288C81;
	Tue,  2 Sep 2025 12:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756816784; cv=none; b=Lg0V4IAJMQovRMc1nmBQmQcPCgNrf6x1ZGZeVqH99Pd1RZMSZxSSuOcUpGNg4fdQ7F7hOaRej/le7wPQarFWlZvFdmpgU2LFjStW8+1a0lN7V2wGz3hoSlhdek0DnYomGeL62/CuHSSP459zTuyBDBIB7Oi6hYmpBLaGf0s6vMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756816784; c=relaxed/simple;
	bh=fDh1rVUT2E+ochpfHW3rbcGmXbzriJy5LeM0r503rOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=im1iqss8+hRRrEt6XKpxTmcSjfDae2WgXMHq1GqoMgOx8sBnKvV06Tnza1rZK/EMQsl4N6vYC5LxGw5I7mgxco0BjIoBd9Ne+BUT+uZqqVhXqbGamZw+PMMP1ar0AZZCock0tV1M53NzifWwdvjj9PSkUhQKB2S6HqEBfWckN5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qI/pm+ny; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (230.215-178-91.adsl-dyn.isp.belgacom.be [91.178.215.230])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E2CBAC77;
	Tue,  2 Sep 2025 14:38:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756816713;
	bh=fDh1rVUT2E+ochpfHW3rbcGmXbzriJy5LeM0r503rOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qI/pm+nyTRdTSb/7Rb4s47sNeX3rkfRajqHDsIhTgVyB1RPVsK4a2HCzeVoejFtno
	 zLQLi473VX3QOwsMYXfdQ05kxih5QZ002ZcLWIOzZM14EpP9LR031KCfQWa6xNEzCg
	 TqLklRigOu/paxTyDaviol5p6P+0SrWdWD+dP1bQ=
Date: Tue, 2 Sep 2025 14:39:20 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Robert Chiras <robert.chiras@nxp.com>,
	Zhipeng Wang <zhipeng.wang_1@nxp.com>
Subject: Re: [PATCH v4 0/5] media: imx8qxp: add parallel camera support
Message-ID: <20250902123920.GM13448@pendragon.ideasonboard.com>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
 <20250805010822.GC24627@pendragon.ideasonboard.com>
 <aLbcpEZXm5G1Onq7@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aLbcpEZXm5G1Onq7@lizhi-Precision-Tower-5810>

Hi Frank,

On Tue, Sep 02, 2025 at 08:01:40AM -0400, Frank Li wrote:
> On Tue, Aug 05, 2025 at 04:08:22AM +0300, Laurent Pinchart wrote:
> > Hi Frank,
> >
> > Thank you for the patches.
> >
> > I've quite busy these days, and I don't believe I will have time to
> > review this series before coming back from OSS Europe at the beginning
> > of September. Let's see if anyone on CC could volunteer.
> 
> Laurent Pincha
> 	I hope you have good time at OSS.
> 
> 	Do you have chance to review this patch?

I'm going through my mail backlog, which is really big at the moment.
I'd like someone else to volunteer to review this series. It won't scale
if I have to review all NXP media patches in my spare time :-/

> > On Tue, Jul 29, 2025 at 12:06:21PM -0400, Frank Li wrote:
> > > Add parallel camera support for i.MX8 chips.
> > >
> > > The below patch to add new format support to test ov5640 sensor
> > >    media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
> > >
> > > The bindings and driver for parallel CSI
> > >    dt-bindings: media: add i.MX parallel csi support
> > >    media: nxp: add V4L2 subdev driver for parallel CSI
> > >
> > > DTS part need depend on previous MIPI CSI patches.
> > >   https://lore.kernel.org/imx/20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com/
> > >
> > >   arm64: dts: imx8: add parellel csi nodes
> > >   arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > Changes in v4:
> > > - remove imx93 driver support since have not camera sensor module to do test now.
> > >   Add it later
> > > - Add new patch
> > >   media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> > > - See each patche's change log for detail.
> > > - Link to v3: https://lore.kernel.org/r/20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com
> > >
> > > Changes in v3:
> > > - replace CSI with CPI.
> > > - detail change see each patch's change logs
> > > - Link to v2: https://lore.kernel.org/r/20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com
> > >
> > > Changes in v2:
> > > - remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
> > >   because pcif controller convert 2x8 to 1x16 to match isi's input
> > > - rename comaptible string to fsl,imx8qxp-pcif
> > > - See each patches's change log for detail
> > > - Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com
> > >
> > > ---
> > > Alice Yuan (2):
> > >       dt-bindings: media: add i.MX parallel CPI support
> > >       media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)
> > >
> > > Frank Li (3):
> > >       media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> > >       arm64: dts: imx8: add camera parallel interface (CPI) node
> > >       arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
> > >
> > >  .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 ++++
> > >  MAINTAINERS                                        |   2 +
> > >  arch/arm64/boot/dts/freescale/Makefile             |   3 +
> > >  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
> > >  .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso |  83 +++
> > >  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
> > >  drivers/media/platform/nxp/Kconfig                 |  11 +
> > >  drivers/media/platform/nxp/Makefile                |   1 +
> > >  drivers/media/platform/nxp/imx-parallel-cpi.c      | 728 +++++++++++++++++++++
> > >  include/media/v4l2-common.h                        |  30 +
> > >  10 files changed, 1024 insertions(+)
> > > ---
> > > base-commit: 37a294c6211bea9deb14bedd2dcce498935cbd4e
> > > change-id: 20250626-imx8qxp_pcam-d851238343c3

-- 
Regards,

Laurent Pinchart

