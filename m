Return-Path: <linux-media+bounces-1102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCAE7FA1A3
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 14:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69476B21071
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 13:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB33E3064F;
	Mon, 27 Nov 2023 13:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="1XjDfyKO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11701BFD;
	Mon, 27 Nov 2023 05:55:33 -0800 (PST)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AR8W491020325;
	Mon, 27 Nov 2023 14:55:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=selector1; bh=c7sVCLbdbIsSSVXrD1aEo
	LgXUO8xa7qqmhRYF03VJgc=; b=1XjDfyKOELRTgDd6RM601zZBHKa4C6eUWK7Tj
	Ml4RnWHCCSMR8PjBTOkvJqqUvJ4/3XZycnRSif74GQKGsp5JsyyT7sOCLRGl7Bud
	+JkYOozYc2E81/a81bSylEIkSoM6A4qe+wgrsfhyCWxaXCTroo3+8E06iowGGTdx
	OouPXrukmWxNgndazEobvaFEbF5jjPvJ14E1GuWAZMgKF6OTNM3SIeHaHUfrBq/A
	lX6jbm7BxMmA3YQCBdqe650rbxtN73bdvs9SssGs/5AfdE4i/7hP120VxQIhd/fM
	gs6ka3dMgkBzhNNbg28xc0JwqNrijwS63dHQA4YbT7QUzWVEA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uk8pjqq1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 14:55:09 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DAF7610002A;
	Mon, 27 Nov 2023 14:55:08 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D189A2291C4;
	Mon, 27 Nov 2023 14:55:08 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 27 Nov
 2023 14:55:08 +0100
Date: Mon, 27 Nov 2023 14:55:03 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>,
        Sakari
 Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Dan Scally
	<dan.scally@ideasonboard.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 3/5] media: stm32-dcmipp: STM32 DCMIPP camera
 interface driver
Message-ID: <20231127135503.GA1423796@gnbcxd0016.gnb.st.com>
Mail-Followup-To: Philipp Zabel <p.zabel@pengutronix.de>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231122073927.788810-1-alain.volmat@foss.st.com>
 <20231122073927.788810-4-alain.volmat@foss.st.com>
 <ba856a09de62a6ddbf1c19d5fd502de1cbc3e273.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ba856a09de62a6ddbf1c19d5fd502de1cbc3e273.camel@pengutronix.de>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_11,2023-11-27_01,2023-05-22_02

Hi Philipp,

On Mon, Nov 27, 2023 at 12:38:21PM +0100, Philipp Zabel wrote:
> On Mi, 2023-11-22 at 08:39 +0100, Alain Volmat wrote:
> > From: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > 
> > This V4L2 subdev driver enables Digital Camera Memory Interface
> > Pixel Processor(DCMIPP) of STMicroelectronics STM32 SoC series.
> > 
> > Signed-off-by: Hugues Fruchet <hugues.fruchet@foss.st.com>
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> [...]
> > diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > new file mode 100644
> > index 000000000000..28ddb26314c3
> > --- /dev/null
> > +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > @@ -0,0 +1,604 @@
> [...]
> > +struct dcmipp_device {
> > +	/* The platform device */
> > +	struct platform_device		pdev;
> > +	struct device			*dev;
> > +
> > +	/* Hardware resources */
> > +	struct reset_control		*rstc;
> 
> As long as rstc is only used in dcmipp_probe(), there is no need to
> carry it around in struct dcmipp_device.

Oups, thanks.  Indeed, in first series reset was being used in another
place but this is no longer necessary now.  Thanks.

I fixed this and will push it into the v9.

Regards,
Alain
> 
> [...]
> > +static int dcmipp_probe(struct platform_device *pdev)
> > +{
> > +	struct dcmipp_device *dcmipp;
> > +	struct clk *kclk;
> 
> rstc could be a local variable here.
> 
> [...]
> 
> > +	/* Get hardware resources from devicetree */
> > +	dcmipp->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> > +	if (IS_ERR(dcmipp->rstc))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(dcmipp->rstc),
> > +				     "Could not get reset control\n");
> [...]
> > +	/* Reset device */
> > +	ret = reset_control_assert(dcmipp->rstc);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to assert the reset line\n");
> > +		return ret;
> > +	}
> > +
> > +	usleep_range(3000, 5000);
> > +
> > +	ret = reset_control_deassert(dcmipp->rstc);
> > +	if (ret) {
> > +		dev_err(&pdev->dev, "Failed to deassert the reset line\n");
> > +		return ret;
> > +	}
> 
> regards
> Philipp

