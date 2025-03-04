Return-Path: <linux-media+bounces-27528-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79862A4ED9D
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 20:41:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A581B1721EE
	for <lists+linux-media@lfdr.de>; Tue,  4 Mar 2025 19:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3082E25F794;
	Tue,  4 Mar 2025 19:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dpiixRCf"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D4F1F03C0;
	Tue,  4 Mar 2025 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741117291; cv=none; b=uoynuktMsqmNO5PGkUvQgvDSnM2q9MEICowkFgz4cLvkuesKrQARbQ8GdAaRxff5uIKpREHwsQxzHTXJEBG7zsQyTOQYlBWvfYAlcwrxSnZnLomYh3Rjp70SQplDIKP+/gPNmpbj/e0/T6YFx9lDNh4wI/x1cTleCpddI6RN43A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741117291; c=relaxed/simple;
	bh=mSXJN62c9c43TayjWMcrZoUoqbOEtw2eHIrrgusAkcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtem4aLa5klE8rxH/wNY/RbbGnkfYU6tRKe+yeXpSZfI0bKxeAlOgksKGyWRqyUopbpzoC2fg4zlEFEZK1LH0/WLpfaDcW8D6Ba4zu+3IgmTRzqVyScSeG3lnu+ZtDGcWXCq+35EaBg/mAZ4LI+GtjapSH4naeCNVY6O5Np1hDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dpiixRCf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741117290; x=1772653290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mSXJN62c9c43TayjWMcrZoUoqbOEtw2eHIrrgusAkcQ=;
  b=dpiixRCfB9O7imZOT5OBKJ0V3VzZ1+d8cACU2/+E0+cmPJ98AFbJ7Kgm
   yjo/w7Ozd5Z6ZcronZIPbiy/UMIzpK112ITMY5tJFWFAIktWJA1gvCDJl
   ZEjeDoBOPyAWAubBI4BoI3o2T+Qij4NdAQtFccBnkped/3ToXRMSNo2My
   Pl1vajgt089tNPjvWaS59dRat1G1ZANAqtBD/4Cx2Jqf2NYNN6ZJbre1n
   2HSFojUv4pRDnyXi6nGC/NahINeYzTHN6qdx3bftaOdqEOh3bXTtUg2q8
   njzqdv7/Bw9x3HMLoRm00d1hOHTmfqGa3FYCzcjYvSy9RYmruabYWqsuG
   A==;
X-CSE-ConnectionGUID: I8oVJaY4RHeLXxD3iMjx/Q==
X-CSE-MsgGUID: JhEgJ8HvRPanRSwuLnO4BQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41235958"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="41235958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 11:41:27 -0800
X-CSE-ConnectionGUID: U8VV1OeURqOA6GR9LDuIIQ==
X-CSE-MsgGUID: EHHSAZjkRsupzERpxCndxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119369326"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.231])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 11:41:22 -0800
Date: Tue, 4 Mar 2025 20:41:14 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Gerald Loacker <gerald.loacker@wolfvision.net>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 06/11] media: rockchip: rkcif: add driver for mipi
 csi-2 host
Message-ID: <3fztpczfxlfzt3bdll4alzllrrqvvr3akhkiqtmtam2v2sbw2y@6hb3aok7h62x>
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
 <20250219-v6-8-topic-rk3568-vicap-v4-6-e906600ae3b0@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-v6-8-topic-rk3568-vicap-v4-6-e906600ae3b0@wolfvision.net>

Hi Michael,

thank you for the patches.

Sorry for the big delay!

On Wed, Feb 19, 2025 at 11:16:37AM +0100, Michael Riesch wrote:
> The Rockchip RK3568 MIPI CSI-2 Host is a CSI-2 bridge with one input port
> and one output port. It receives the data with the help of an external
> MIPI PHY (C-PHY or D-PHY) and passes it to the Rockchip RK3568 Video
> Capture (VICAP) block. Add a V4L2 subdevice driver for this unit.
> 
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> ---
>  drivers/media/platform/rockchip/rkcif/Makefile     |   1 +
>  .../platform/rockchip/rkcif/rkcif-mipi-csi-host.c  | 731 +++++++++++++++++++++
>  2 files changed, 732 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
> index 818424972c7b..0c18efd1f1b4 100644
> --- a/drivers/media/platform/rockchip/rkcif/Makefile
> +++ b/drivers/media/platform/rockchip/rkcif/Makefile
> @@ -4,4 +4,5 @@ rockchip-cif-objs += rkcif-dev.o \
>  	rkcif-capture-dvp.o \
>  	rkcif-capture-mipi.o \
>  	rkcif-interface.o \
> +	rkcif-mipi-csi-host.o \

[..]

>  	rkcif-stream.o
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c b/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c
> new file mode 100644
> index 000000000000..fa3f42b2dc55

SNIP

> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-host.c
> +
> +static struct platform_driver rkcif_csi_drv = {
> +	.driver = {
> +		   .name = "rockchip-mipi-csi",
> +		   .of_match_table = rkcif_csi_of_match,
> +		   .pm = &rkcif_csi_pm_ops,
> +	},
> +	.probe = rkcif_csi_probe,
> +	.remove = rkcif_csi_remove,
> +};
> +module_platform_driver(rkcif_csi_drv);

[..]

When adding the driver for this CSI-2 Host bridge, you added another
call to  module_platform_driver()

but in the definition of this macro:

"Each module may only use this macro once, and
calling it replaces module_init() and module_exit()"

and as you can see in the diff of the Makefile,
rkcif-mipi-csi-host.0 is part of the same module as rkcif-dev.o, where
you already call module_platform_driver()

I think the solution here is to call
platform_register_drivers(drivers, ARRAY_SIZE(drivers)) in rkcif-dev.c

with

static struct platform_driver * const drivers[] = {
	&rkcif_csi_drv,
	&rkcif_plat_drv,
};

then define module_init() and module_exit()

Btw. MODULE_DEVICE_TABLE() is missing both here and in rkcif-dev.c

> +
> +MODULE_DESCRIPTION("Rockchip MIPI CSI-2 Host platform driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

--
Kind Regards
Mehdi Djait

