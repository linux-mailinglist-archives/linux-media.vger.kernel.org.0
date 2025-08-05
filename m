Return-Path: <linux-media+bounces-38879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14381B1ABEA
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 03:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB87A18A1E6D
	for <lists+linux-media@lfdr.de>; Tue,  5 Aug 2025 01:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EA51922C4;
	Tue,  5 Aug 2025 01:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OCj9KBCa"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E4F341AA;
	Tue,  5 Aug 2025 01:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754356119; cv=none; b=SAGJLrfncqhISXD08GaJubcr4KWtP5+HjXhWxmmcNUF9rXGqpiLWFKJd7NxGStTJYWqph9kjLMWQyByN82WF7cKGRP0Zc5+nOP/wipkpUl+fGm900vmcMAz6H1VPu9B0yeERG34Wz0pwkF/6N0Q4ezF+mpNRcHi2FlEKneyRUC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754356119; c=relaxed/simple;
	bh=HRK77S8jj98fxjdYajHbsWPldKElX/RjHec2I/UjYD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTD1KqpnREIXFI+7tiainN1HWCqeEbccgwIUZC6hUYtct2acX2VRJzU4WlFq3T+wqanwpiSlerS9cmIjM/U0pYABg2IrrjXQQi98gAOilBv4IGL1XQ/RfK4oQBjC7Jl7T7x0KGKxcAnsdsipNvDyrB/kUVVcyEsBRF5acyBUPnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OCj9KBCa; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8AEC31775;
	Tue,  5 Aug 2025 03:07:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754356068;
	bh=HRK77S8jj98fxjdYajHbsWPldKElX/RjHec2I/UjYD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCj9KBCayppPj1P1bSZyw8bSVTMcSmTyEs7pPkLC/y9oSKN/RiCxM8DHX8xHF9DT1
	 ntGfR6Rm6AFub/qKEuhdfR5QYghYPJ8KWEhDSF0ISH5hAgdzYKN8xJvh/layVF1/l/
	 Gr39JmEt0BsUqq/TJQI/06JcyIwuTYunZ8StyC3I=
Date: Tue, 5 Aug 2025 04:08:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
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
Message-ID: <20250805010822.GC24627@pendragon.ideasonboard.com>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>

Hi Frank,

Thank you for the patches.

I've quite busy these days, and I don't believe I will have time to
review this series before coming back from OSS Europe at the beginning
of September. Let's see if anyone on CC could volunteer.

On Tue, Jul 29, 2025 at 12:06:21PM -0400, Frank Li wrote:
> Add parallel camera support for i.MX8 chips.
> 
> The below patch to add new format support to test ov5640 sensor
>    media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
> 
> The bindings and driver for parallel CSI
>    dt-bindings: media: add i.MX parallel csi support
>    media: nxp: add V4L2 subdev driver for parallel CSI
> 
> DTS part need depend on previous MIPI CSI patches.
>   https://lore.kernel.org/imx/20250522-8qxp_camera-v5-13-d4be869fdb7e@nxp.com/
> 
>   arm64: dts: imx8: add parellel csi nodes
>   arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v4:
> - remove imx93 driver support since have not camera sensor module to do test now.
>   Add it later
> - Add new patch
>   media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
> - See each patche's change log for detail.
> - Link to v3: https://lore.kernel.org/r/20250708-imx8qxp_pcam-v3-0-c8533e405df1@nxp.com
> 
> Changes in v3:
> - replace CSI with CPI.
> - detail change see each patch's change logs
> - Link to v2: https://lore.kernel.org/r/20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com
> 
> Changes in v2:
> - remove patch media: nxp: isi: add support for UYVY8_2X8 and YUYV8_2X8 bus codes
>   because pcif controller convert 2x8 to 1x16 to match isi's input
> - rename comaptible string to fsl,imx8qxp-pcif
> - See each patches's change log for detail
> - Link to v1: https://lore.kernel.org/r/20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com
> 
> ---
> Alice Yuan (2):
>       dt-bindings: media: add i.MX parallel CPI support
>       media: nxp: add V4L2 subdev driver for camera parallel interface (CPI)
> 
> Frank Li (3):
>       media: v4l2-common: Add helper function v4l_get_required_align_by_bpp()
>       arm64: dts: imx8: add camera parallel interface (CPI) node
>       arm64: dts: imx8qxp-mek: add parallel ov5640 camera support
> 
>  .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 ++++
>  MAINTAINERS                                        |   2 +
>  arch/arm64/boot/dts/freescale/Makefile             |   3 +
>  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     |  13 +
>  .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso |  83 +++
>  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  27 +
>  drivers/media/platform/nxp/Kconfig                 |  11 +
>  drivers/media/platform/nxp/Makefile                |   1 +
>  drivers/media/platform/nxp/imx-parallel-cpi.c      | 728 +++++++++++++++++++++
>  include/media/v4l2-common.h                        |  30 +
>  10 files changed, 1024 insertions(+)
> ---
> base-commit: 37a294c6211bea9deb14bedd2dcce498935cbd4e
> change-id: 20250626-imx8qxp_pcam-d851238343c3

-- 
Regards,

Laurent Pinchart

