Return-Path: <linux-media+bounces-40814-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD98AB3286F
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 13:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 912675A0B78
	for <lists+linux-media@lfdr.de>; Sat, 23 Aug 2025 11:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7E5259CAC;
	Sat, 23 Aug 2025 11:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Cbu8brKP"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C672339A8
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755950384; cv=none; b=jmEJg/18OsKg3FMiHkpUG9DngVoA56jeW+GviHl+ghSRxkEjo1zg/HMNH/D/oMLkwU2+5G4qk3L32QjJoaNmBZkgHgXRIuO8gOmnSCBW7nUMkhJ4FkB6lUAK4kkeeOVjoP/gTdpRFYXrMsn+o6GdQUJVZiPFooeOeiLaFBfpXeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755950384; c=relaxed/simple;
	bh=/Ug/L3tKFgEpQdqM8e0FqxPaEr1dmPxuR4e6I4gemhM=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=e0hRcPLlHhYS8SjBhoQhSqTjihQYuzBW7dKYiT9+5NsnI8i67m4gyUeXDbVgp3qkz0pg8AsiEmedyWFCzqN0y7yJNsred2iJ2Sbkxf3o7zCwX7SOQ5EL2ceok5Gtv8lkr/IVV4LcbyEQtNjmNBNk6AMA6Odb/zFtZ+NYdK9pMRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Cbu8brKP; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250823115939epoutp041b68630e708cf674e9c47d25a70693c7~eY5EtCqf10126201262epoutp04q
	for <linux-media@vger.kernel.org>; Sat, 23 Aug 2025 11:59:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250823115939epoutp041b68630e708cf674e9c47d25a70693c7~eY5EtCqf10126201262epoutp04q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755950379;
	bh=iH6hgTPw7EB8v1igevb2sHc8YeKV98oq0HbpxzaPbH8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=Cbu8brKPTHiSPUck8omOCZ+4XX6eADeAYqycHNAjNyUT8G4ZH2DM4TVYp5uWVmmvu
	 LNVVfGnhJAPRWMOg40TQh+rG6A7rCTqgO0NxyH34+z4gdYYdIyLb9JNBIto+riJsUF
	 rkVV+YBObGH0Qo25e7emKlkPmDKFaymXeRJYniCk=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250823115938epcas5p2a6483ded6bd42ae2b0c2a1058f77a3cd~eY5D0z5D91074810748epcas5p20;
	Sat, 23 Aug 2025 11:59:38 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.93]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c8FwT6tQ4z6B9m9; Sat, 23 Aug
	2025 11:59:37 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250823115937epcas5p1f853b0000848b6d8b15b9008429e7b4a~eY5COYS6T0189601896epcas5p1H;
	Sat, 23 Aug 2025 11:59:37 +0000 (GMT)
Received: from FDSFTE196 (unknown [107.116.189.214]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250823115933epsmtip227d8435bfceb85f01b212483a05c141f~eY4_g2_fd2947029470epsmtip2V;
	Sat, 23 Aug 2025 11:59:33 +0000 (GMT)
From: "Inbaraj E" <inbaraj.e@samsung.com>
To: "'Krzysztof Kozlowski'" <krzk@kernel.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <s.nawrocki@samsung.com>, <s.hauer@pengutronix.de>,
	<shawnguo@kernel.org>, <cw00.choi@samsung.com>, <rmfrfs@gmail.com>,
	<laurent.pinchart@ideasonboard.com>, <martink@posteo.de>,
	<mchehab@kernel.org>, <linux-fsd@tesla.com>, <will@kernel.org>,
	<catalin.marinas@arm.com>, <pankaj.dubey@samsung.com>,
	<shradha.t@samsung.com>, <ravi.patel@samsung.com>
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alim.akhtar@samsung.com>,
	<linux-samsung-soc@vger.kernel.org>, <kernel@puri.sm>,
	<kernel@pengutronix.de>, <festevam@gmail.com>,
	<linux-media@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>
In-Reply-To: 
Subject: RE: [PATCH v2 12/12] media: fsd-csis: Add support for FSD CSIS DMA
Date: Sat, 23 Aug 2025 17:29:32 +0530
Message-ID: <00e401dc1425$65ea9490$31bfbdb0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQK5oFMD+tt4mLQU5V9KgVyIDaUIUQLOIzgLAmiUCqAC0LEeUbJ0pR0QgAAo+XA=
Content-Language: en-in
X-CMS-MailID: 20250823115937epcas5p1f853b0000848b6d8b15b9008429e7b4a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141103epcas5p14516cbe45c21d28ba9e231da99940aa1
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141103epcas5p14516cbe45c21d28ba9e231da99940aa1@epcas5p1.samsung.com>
	<20250814140943.22531-13-inbaraj.e@samsung.com>
	<b1f59033-12d0-4395-85f1-e296a5dbca5f@kernel.org> 



> -----Original Message-----
> From: Inbaraj E <inbaraj.e@samsung.com>
> Sent: 23 August 2025 17:20
> To: 'Krzysztof Kozlowski' <krzk@kernel.org>; 'mturquette@baylibre.com'
> <mturquette@baylibre.com>; 'sboyd@kernel.org' <sboyd@kernel.org>;
> 'robh@kernel.org' <robh@kernel.org>; 'krzk+dt@kernel.org'
> <krzk+dt@kernel.org>; 'conor+dt@kernel.org' <conor+dt@kernel.org>;
> 's.nawrocki@samsung.com' <s.nawrocki@samsung.com>;
> 's.hauer@pengutronix.de' <s.hauer@pengutronix.de>;
> 'shawnguo@kernel.org' <shawnguo@kernel.org>;
> 'cw00.choi@samsung.com' <cw00.choi@samsung.com>; 'rmfrfs@gmail.com'
> <rmfrfs@gmail.com>; 'laurent.pinchart@ideasonboard.com'
> <laurent.pinchart@ideasonboard.com>; 'martink@posteo.de'
> <martink@posteo.de>; 'mchehab@kernel.org' <mchehab@kernel.org>;
> 'linux-fsd@tesla.com' <linux-fsd@tesla.com>; 'will@kernel.org'
> <will@kernel.org>; 'catalin.marinas@arm.com' <catalin.marinas@arm.com>;
> 'pankaj.dubey@samsung.com' <pankaj.dubey@samsung.com>;
> 'shradha.t@samsung.com' <shradha.t@samsung.com>;
> 'ravi.patel@samsung.com' <ravi.patel@samsung.com>
> Cc: 'linux-clk@vger.kernel.org' <linux-clk@vger.kernel.org>;
> 'devicetree@vger.kernel.org' <devicetree@vger.kernel.org>; 'linux-
> kernel@vger.kernel.org' <linux-kernel@vger.kernel.org>;
> 'alim.akhtar@samsung.com' <alim.akhtar@samsung.com>; 'linux-samsung-
> soc@vger.kernel.org' <linux-samsung-soc@vger.kernel.org>;
> 'kernel@puri.sm' <kernel@puri.sm>; 'kernel@pengutronix.de'
> <kernel@pengutronix.de>; 'festevam@gmail.com' <festevam@gmail.com>;
> 'linux-media@vger.kernel.org' <linux-media@vger.kernel.org>;
> 'imx@lists.linux.dev' <imx@lists.linux.dev>; 'linux-arm-
> kernel@lists.infradead.org' <linux-arm-kernel@lists.infradead.org>
> Subject: RE: [PATCH v2 12/12] media: fsd-csis: Add support for FSD CSIS DMA
> 
> Hi Krzysztof,
> 
> Thanks for the review.
> 
> >
> > On 14/08/2025 16:09, Inbaraj E wrote:
> > > FSD CSIS IP bundles DMA engine for receiving frames from MIPI-CSI2 bus.
> > > Add support internal DMA controller to capture the frames.
> > >
> > > Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> >
> > I commented on order of patches and got more surprise - final driver
> > patch after DTS defconfig. It's really wrong order.
> 
> I'll fix in next patchset.
> 
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -3334,6 +3334,14 @@ S:	Maintained
> > >  F:	Documentation/devicetree/bindings/media/samsung,s5p-mfc.yaml
> > >  F:	drivers/media/platform/samsung/s5p-mfc/
> > >
> > > +ARM/SAMSUNG FSD BRIDGE DRIVER
> >
> > TESLA FSD BRIDGE DRIVER
> > (because ARM/foo are only SoC maintainer entries)
> >
> 
> I'll change in next patchset.
> 
> > > +M:	Inbaraj E <inbaraj.e@samsung.com>
> > > +L:	linux-arm-kernel@lists.infradead.org (moderated for non-
> > subscribers)
> >
> > Replace above list with samsung-soc list.
> >
> 
> I'll change in next patchset.
> 
> > > +L:	linux-media@vger.kernel.org
> > > +S:	Maintained
> > >  source "drivers/media/platform/samsung/exynos-gsc/Kconfig"
> > >  source "drivers/media/platform/samsung/exynos4-is/Kconfig"
> > > +
> > > +config VIDEO_FSD_CSIS
> >
> > VIDEO_TSLA_FSD_CSIS
> 
> I'll change in next patchset.
> 
> >
> > > +	tristate "FSD SoC MIPI-CSI2 media controller driver"
> > > +	depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
> > > +	depends on HAS_DMA
> > > +	depends on OF
> >
> > OF seems unneeded dependency
> >
> > But you miss ARCH_TESLA_FSD instead.
> >
> >
> 
> I'll remove OF and add ARCH_TESLA_FSD in next patchset.
> 
> > > +	select VIDEOBUF2_DMA_CONTIG
> > > +	select V4L2_FWNODE
> > > +	help
> > > +	  This is a video4linux2 driver for FSD SoC MIPI-CSI2 Rx.
> >
> > Tesla FSD
> 
> I'll add in next patchset.
> 
> > > new file mode 100644
> > > index 000000000000..74f46038d506
> > > --- /dev/null
> > > +++ b/drivers/media/platform/samsung/fsd-csis/fsd-csis.c
> > > @@ -0,0 +1,1709 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2022-2025 Samsung Electronics Co., Ltd.
> > > + *             https://www.samsung.com
> > > + *
> > > + * FSD CSIS V4L2 Capture driver for FSD SoC.
> >
> > "Tesla FSD" in both places
> 
> I'll change in next patchset.
> 
> >
> > > + */
> > > +
> > > +#include <linux/clk.h>
> > > +#include <linux/pm_runtime.h>
> > > +#include <linux/regmap.h>
> > > +#include <media/v4l2-device.h>
> > > +#include <media/v4l2-ioctl.h>
> > > +#include <media/videobuf2-dma-contig.h> #include <media/v4l2-mc.h>
> >
> > How can you depend on OF if there is no single OF header?
> 
> > > +
> > > +	ret = devm_request_irq(dev, irq,
> > > +			csis_irq_handler, IRQF_SHARED, pdev->name, csis);
> >
> > Please align these (checkpatch --strict)
> 
> I'll fix in next patchset
> 
> >
> > > +
> > > +	ret = fsd_csis_clk_get(csis);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	pm_runtime_enable(dev);
> > > +	if (!pm_runtime_enabled(dev)) {
> >
> > That's odd code. Why?
> >
> > > +		ret = fsd_csis_runtime_resume(dev);
> >
> > Even more questions why?
> 

Sorry I made typo here

 If CONFIG_PM is disabled, the clocks are enabled manually in the driver
 through fsd_csis_runtime_resume API.
 
 If CONFIG_PM is enabled, the clocks are managed through the PM runtime
 framework.
 
> Can you please help me understand what wrong here?
> 
> >
> > > +		if (ret < 0)
> > > +			return ret;
> > > +	}
> > > +
> > > +	platform_set_drvdata(pdev, csis);
> > > +
> > > +	ret = fsd_csis_enable_pll(csis);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = fsd_csis_media_init(csis);
> > > +	if (ret)
> > > +		return ret;
> >
> > I think you miss clean up of csis->pll completely. Just use
> > devm_clk_get_enabled and convert everything here to devm.
> >
> >
> 
> I'll fix in next patchset.
> 
> > > +
> > > +	ret = fsd_csis_async_register(csis);
> > > +	if (ret)
> > > +		goto err_media_cleanup;
> > > +
> > > +	return 0;
> > > +
> > > +err_media_cleanup:
> > > +	fsd_csis_media_cleanup(csis);
> >
> > Also this...
> >
> 
> if fsd_csis_media_init fails, the cleanup is handled internally.
> Here, cleanup is used only for fsd_csis_async_register failure.
> 
> can you please help me understand what is wrong here?
> 
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void fsd_csis_remove(struct platform_device *pdev) {
> > > +	struct fsd_csis *csis = platform_get_drvdata(pdev);
> > > +
> > > +static struct platform_driver fsd_csis_driver = {
> > > +	.probe		= fsd_csis_probe,
> > > +	.remove		= fsd_csis_remove,
> > > +	.driver		= {
> > > +		.name		= FSD_CSIS_MODULE_NAME,
> > > +		.of_match_table = of_match_ptr(fsd_csis_of_match),
> >
> > Drop of_match_ptr, it is not really correct.
> 
> Will drop in next patchset.
> 
> Regards,
> Inbaraj E


