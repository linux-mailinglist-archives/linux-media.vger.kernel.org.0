Return-Path: <linux-media+bounces-473-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E875E7EEE09
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 10:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 159071C20B1B
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 09:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B449EDF60;
	Fri, 17 Nov 2023 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="quZWRCfE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CDC311F;
	Fri, 17 Nov 2023 01:02:38 -0800 (PST)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AH5IQSR030464;
	Fri, 17 Nov 2023 10:02:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=selector1; bh=9l8YIXvr1qCb4mjD4T+dz
	Zsbd0D1nt4OOpppCFXT1bE=; b=quZWRCfEARhxtxImgE/22rUGQWRFKFiXH/f9c
	ugAWKAgOQj2eZtLDZomMdVgDLuFjnwq72+YOsmBRqup9VrdzvXfav2Edr60CToDu
	97r75SRBfh9h8N8IB88K6B7bFaXw1wobs95yKyPdcHiEp3XNYos/ZQ1Qtt+qLBfv
	pGpu+q07MUF+efJSqTFsa4uBBm/VvwzGiZU9kwFkI72fPDJKS8HyNk57RQpiENqL
	EQ5M3aXLp60SW+8zYjG0tMg+5vBkFJ1WDPVUq9BSYKFOceozMre6ls9zuIdREVlx
	3iXKJlvf+4ILXTpmGDhvciRmdAKULgDrFwQL3sAr3nlY+EGMg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ua1u2a9kw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 10:02:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AB89110002A;
	Fri, 17 Nov 2023 10:02:07 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A2F7D211603;
	Fri, 17 Nov 2023 10:02:07 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 17 Nov
 2023 10:02:07 +0100
Date: Fri, 17 Nov 2023 10:02:06 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Pavel Machek <pavel@ucw.cz>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi
	<jacopo.mondi@ideasonboard.com>,
        Kieran Bingham
	<kieran.bingham@ideasonboard.com>,
        Rob Herring <robh@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] media: i2c: gc2145: Galaxy Core GC2145 sensor
 support
Message-ID: <20231117090206.GB523678@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Pavel Machek <pavel@ucw.cz>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Rob Herring <robh@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231107081345.3172392-1-alain.volmat@foss.st.com>
 <20231107081345.3172392-4-alain.volmat@foss.st.com>
 <ZU/UX9Jjk288ELUx@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZU/UX9Jjk288ELUx@duo.ucw.cz>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_06,2023-11-16_01,2023-05-22_02

Hi Pavel,

On Sat, Nov 11, 2023 at 08:22:07PM +0100, Pavel Machek wrote:
> Hi!
> 
> > Addition of support for the Galaxy Core GC2145 XVGA sensor.
> > The sensor supports both DVP and CSI-2 interfaces however for
> > the time being only CSI-2 is implemented.
> > 
> > Configurations is currently based on initialization scripts
> 
> "are"?

Fixed

> 
> > coming from Galaxy Core and for that purpose only 3 static
> 
> "and so"?

Fixed

> 
> > resolutions are supported.
> 
> "supported:"?

Fixed

> 
> >  - 640x480
> >  - 1280x720
> >  - 1600x1200
> 
> 
> > --- /dev/null
> > +++ b/drivers/media/i2c/gc2145.c
> > @@ -0,0 +1,1404 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * A V4L2 driver for Galaxycore GC2145 camera.
> > + * Copyright (C) 2023, STMicroelectronics SA
> > + *
> > + * Inspired from the imx219.c driver
> 
> "by the"?

Fixed

> 
> Link to some kind of datasheet / documentation /... would be welcome
> here.

Seems an old version of the datasheet is available on pine64.org so I
guess I could add a link to this one.

http://files.pine64.org/doc/datasheet/PinebookPro/GC2145%20CSP%20DataSheet%20release%20V1.0_20131201.pdf

> 
> > +/**
> > + * struct gc2145_mode - GC2145 mode description
> > + * @width: frame width (in pixel)
> > + * @height: frame height (in pixel)
> 
> "in pixels".

Ok

> 
> > +static const struct gc2145_mode supported_modes[] = {
> ...
> > +	{
> > +		/* 1280x720 30fps mode */
> > +		.width = 1280,
> > +		.height = 720,
> > +		.reg_seq = gc2145_mode_1280_720_regs,
> > +		.reg_seq_size = ARRAY_SIZE(gc2145_mode_1280_720_regs),
> > +		.pixel_rate = GC2145_1280_720_PIXELRATE,
> > +		.crop = {
> > +			.top = 160,
> > +			.left = 240,
> > +			.width = 1280,
> > +			.height = 720,
> > +		},
> > +		.hblank = GC2145_1280_720_HBLANK,
> > +		.vblank = GC2145_1280_720_VBLANK,
> > +	},
> 
> Won't this result in 1120x480 mode due to crop?

The crop struct indicates the top left corner and width/height so this
leads to 720p mode.

> 
> > +/* All supported formats */
> > +static const struct gc2145_format supported_formats[] = {
> > +	{
> > +		.code		= MEDIA_BUS_FMT_UYVY8_1X16,
> > +		.code		= MEDIA_BUS_FMT_VYUY8_1X16,
> > +		.code		= MEDIA_BUS_FMT_YUYV8_1X16,
> > +		.code		= MEDIA_BUS_FMT_YVYU8_1X16,
> > +		.code		= MEDIA_BUS_FMT_RGB565_1X16,
> > +};
> 
> So ... the hardware can do 10bit ADC, but we don't actually have a
> mode exposing that?

We don't have YET (in the driver).  Choice is to have this first serie
with only non-RAW modes.  RAW8/10 will be added later on.

> 
> > +	 * Adjust the MIPI buffer settings.
> > +	 * For YUV/RGB, LWC = image width * 2
> > +	 * For RAW8, LWC = image width
> > +	 * For RAW10, LWC = image width * 1.25
> > +	 */
> > +	lwc = gc2145->mode->width * 2;
> > +	cci_write(gc2145->regmap, GC2145_REG_LWC_HIGH, lwc >> 8, &ret);
> > +	cci_write(gc2145->regmap, GC2145_REG_LWC_LOW, lwc & 0xff, &ret);
> > +
> > +	/*
> > +	 * Adjust the MIPI Fifo Full Level
> 
> Fifo -> FIFO?

Ok

> 
> > +	/*
> > +	 * Set the fifo gate mode / MIPI wdiv set:
> > +	 * 0xf1 in case of RAW mode and 0xf0 otherwise
> > +	 */
> 
> fifo -> FIFO?

Ok

> 
> > +	/*
> > +	 * Datasheet doesn't mention timing between PWDN/RESETB control and
> > +	 * i2c access however experimentation shows that a rather big delay is
> > +	 * needed
> > +	 */
> 
> "however," "needed."

Ok

> 
> > +static const struct v4l2_ctrl_ops gc2145_ctrl_ops = {
> > +	.s_ctrl = gc2145_s_ctrl,
> > +};
> > +
> > +/* Initialize control handlers */
> > +static int gc2145_init_controls(struct gc2145 *gc2145)
> > +{
> > +	ret = v4l2_ctrl_handler_init(hdl, 12);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ctrls->pixel_rate = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_PIXEL_RATE,
> > +					      GC2145_640_480_PIXELRATE,
> > +					      GC2145_1280_720_PIXELRATE, 1,
> 
> Should the second pixelrate be one from 1600x1200?

Indeed.  This will actually evolve in the v4 since I implemented instead
the V4L2_CID_LINK_FREQ control.

> 
> > +static int gc2145_check_hwcfg(struct device *dev)
> > +{
> > +	struct fwnode_handle *endpoint;
> > +	struct v4l2_fwnode_endpoint ep_cfg = {
> > +		.bus_type = V4L2_MBUS_CSI2_DPHY
> > +	};
> > +	int ret = -EINVAL;
> 
> This "ret" value is unused. Not sure if something will warn about this.

Corrected.

> 
> > +MODULE_AUTHOR("Alain Volmat <alain.volmat@foss.st.com");
> 
> ">" is missing at the end of address.

Done.

> 
> The driver looks good, thank you!
> 
> Best regards,
> 								Pavel
> -- 
> People of Russia, stop Putin before his war on Ukraine escalates.

Regards,
Alain


