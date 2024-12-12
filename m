Return-Path: <linux-media+bounces-23259-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B639EE257
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 10:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BF041883BF7
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 09:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CAEE20E339;
	Thu, 12 Dec 2024 09:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="UfaKmSNL"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9AF20E31B;
	Thu, 12 Dec 2024 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733994726; cv=none; b=oYPhATH6f5iz68mp72nDB+fMxwHQSLK9LSa4qmJPKOouuGeOfYd9exvMzeeGw6Tf81XzmzC57rXNVBHbqs20Mcyk7QmoBup0TntjFLTGlusvAkHUt6mssNvc4Kx4SHrKyNzSABe+GMoyaLnBnfs+IEa4i+rSxkgm0Q3p05HWqDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733994726; c=relaxed/simple;
	bh=PpMIUoIrZ44jw+7akSeSRubrIo79srvb26vA3HKIHj0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+bzOlLuUe7PLbaO+cZeSeqaYPQ1LYuQimKt0exXQYQs2XfhGFUP5GnKSIUMUHeIkaiNSL/LJxvd9hoj5VPtKuSz/QjW0D0xs4Dm/f21+XJAw/mxP96gcfmzJdmHHnw67de+EdbWrf29yW4jjphaLyoHD6DO8SRHOAAjhQX2SnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=UfaKmSNL; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC1QTia013783;
	Thu, 12 Dec 2024 10:11:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=6zb5OZAehKGUZUk321obAZpz
	rqgrE+cuclYFWG9eli0=; b=UfaKmSNLaMaWCM4aDAAOlajrIlgnlcjsxQOIsXXl
	KBrK94+m/pG3mQPDOUqBUqubBoo6DcgmJgkTQ4EK0X5CGCOKea0ITL7J2PP3tIfG
	MVmkAAM6uhnBLG3oPT7I5MBPFgedZszLC8CfF//mOInAtKRu/K+MWQOkG4RPVFRT
	jERZkt6kFBLYC+0YkAEISRRA5ptTXTgTBlaK/LyBxR13q64oYT4dtq78BVCV1tAt
	PAO7096DXiHKe8TBmLgHcoOH/NtU+b4KCVk/Vw7p3b9FUcQhQO668LPZfJIjFy91
	0NHN379NnYqgSVOXo79F4kHnA9JmrimgMp4n/qmMty3vFg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 43ccnmf5p6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 10:11:34 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CDB8C40048;
	Thu, 12 Dec 2024 10:10:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6A3F9262B23;
	Thu, 12 Dec 2024 10:09:25 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 12 Dec
 2024 10:09:24 +0100
Date: Thu, 12 Dec 2024 10:09:19 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp
 Zabel <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 13/15] media: stm32: dcmipp: add core support for the
 stm32mp25
Message-ID: <20241212090919.GA3572448@gnbcxd0016.gnb.st.com>
References: <20241118-csi_dcmipp_mp25-v3-0-c1914afb0a0f@foss.st.com>
 <20241118-csi_dcmipp_mp25-v3-13-c1914afb0a0f@foss.st.com>
 <832ee6b4-8238-4ef6-b870-f541b744880b@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <832ee6b4-8238-4ef6-b870-f541b744880b@xs4all.nl>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01

Hi Hans,

On Tue, Dec 03, 2024 at 10:07:31AM +0100, Hans Verkuil wrote:
> Hi Alain,
> 
> On 18/11/2024 14:35, Alain Volmat wrote:
> > The stm32mp25 supports both parallel & csi inputs.
> > An additional clock control is necessary.
> > Skeleton of the subdev structures for the stm32mp25 is added,
> > identical for the time being to the stm32mp13 however more subdeves
> > will be added in further commits.
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 98 ++++++++++++++++++----
> >  1 file changed, 80 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > index d2cc19bb40d77f67a1f5fe565bc62f45eff2d266..0087f9017f024ba6b918b99c1ef39212ad6b881a 100644
> > --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> > @@ -40,6 +40,7 @@ struct dcmipp_device {
> >  
> >  	/* Hardware resources */
> >  	void __iomem			*regs;
> > +	struct clk			*mclk;
> >  	struct clk			*kclk;
> >  
> >  	/* The pipeline configuration */
> > @@ -132,6 +133,40 @@ static const struct dcmipp_pipeline_config stm32mp13_pipe_cfg = {
> >  	.hw_revision	= DCMIPP_STM32MP13_VERR
> >  };
> >  
> > +static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
> > +	{
> > +		.name = "dcmipp_input",
> > +		.init = dcmipp_inp_ent_init,
> > +		.release = dcmipp_inp_ent_release,
> > +	},
> > +	{
> > +		.name = "dcmipp_dump_postproc",
> > +		.init = dcmipp_byteproc_ent_init,
> > +		.release = dcmipp_byteproc_ent_release,
> > +	},
> > +	{
> > +		.name = "dcmipp_dump_capture",
> > +		.init = dcmipp_bytecap_ent_init,
> > +		.release = dcmipp_bytecap_ent_release,
> > +	},
> > +};
> > +
> > +static const struct dcmipp_ent_link stm32mp25_ent_links[] = {
> > +	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0,
> > +			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> > +	DCMIPP_ENT_LINK(ID_DUMP_BYTEPROC, 1, ID_DUMP_CAPTURE,  0,
> > +			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> > +};
> > +
> > +#define DCMIPP_STM32MP25_VERR  0x30
> > +static const struct dcmipp_pipeline_config stm32mp25_pipe_cfg = {
> > +	.ents		= stm32mp25_ent_config,
> > +	.num_ents	= ARRAY_SIZE(stm32mp25_ent_config),
> > +	.links		= stm32mp25_ent_links,
> > +	.num_links	= ARRAY_SIZE(stm32mp25_ent_links),
> > +	.hw_revision    = DCMIPP_STM32MP25_VERR
> > +};
> > +
> >  #define LINK_FLAG_TO_STR(f) ((f) == 0 ? "" :\
> >  			     (f) == MEDIA_LNK_FL_ENABLED ? "ENABLED" :\
> >  			     (f) == MEDIA_LNK_FL_IMMUTABLE ? "IMMUTABLE" :\
> > @@ -212,6 +247,7 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
> >  
> >  static const struct of_device_id dcmipp_of_match[] = {
> >  	{ .compatible = "st,stm32mp13-dcmipp", .data = &stm32mp13_pipe_cfg },
> > +	{ .compatible = "st,stm32mp25-dcmipp", .data = &stm32mp25_pipe_cfg },
> >  	{ /* end node */ },
> >  };
> >  MODULE_DEVICE_TABLE(of, dcmipp_of_match);
> > @@ -261,13 +297,22 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
> >  {
> >  	struct dcmipp_device *dcmipp = notifier_to_dcmipp(notifier);
> >  	unsigned int ret;
> > -	int src_pad;
> > +	int src_pad, i;
> >  	struct dcmipp_ent_device *sink;
> > -	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_PARALLEL };
> > +	struct v4l2_fwnode_endpoint vep = { 0 };
> >  	struct fwnode_handle *ep;
> > +	enum v4l2_mbus_type supported_types[] = {
> > +		V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656, V4L2_MBUS_CSI2_DPHY
> > +	};
> > +	int supported_types_nb = ARRAY_SIZE(supported_types);
> >  
> >  	dev_dbg(dcmipp->dev, "Subdev \"%s\" bound\n", subdev->name);
> >  
> > +	/* Only MP25 supports CSI input */
> > +	if (!of_device_is_compatible(dcmipp->dev->of_node,
> > +				     "st,stm32mp25-dcmipp"))
> > +		supported_types_nb--;
> > +
> >  	/*
> >  	 * Link this sub-device to DCMIPP, it could be
> >  	 * a parallel camera sensor or a CSI-2 to parallel bridge
> > @@ -284,21 +329,23 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
> >  		return -ENODEV;
> >  	}
> >  
> > -	/* Check for parallel bus-type first, then bt656 */
> > -	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > -	if (ret) {
> > -		vep.bus_type = V4L2_MBUS_BT656;
> > +	/* Check for supported MBUS type */
> > +	for (i = 0; i < supported_types_nb; i++) {
> > +		vep.bus_type = supported_types[i];
> >  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> > -		if (ret) {
> > -			dev_err(dcmipp->dev, "Could not parse the endpoint\n");
> > -			fwnode_handle_put(ep);
> > -			return ret;
> > -		}
> > +		if (!ret)
> > +			break;
> >  	}
> >  
> >  	fwnode_handle_put(ep);
> >  
> > -	if (vep.bus.parallel.bus_width == 0) {
> > +	if (ret) {
> > +		dev_err(dcmipp->dev, "Could not parse the endpoint\n");
> > +		return ret;
> > +	}
> > +
> > +	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
> > +	    vep.bus.parallel.bus_width == 0) {
> >  		dev_err(dcmipp->dev, "Invalid parallel interface bus-width\n");
> >  		return -ENODEV;
> >  	}
> > @@ -311,11 +358,13 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
> >  		return -ENODEV;
> >  	}
> >  
> > -	/* Parallel input device detected, connect it to parallel subdev */
> > +	/* Connect input device to the dcmipp_input subdev */
> >  	sink = dcmipp->entity[ID_INPUT];
> > -	sink->bus.flags = vep.bus.parallel.flags;
> > -	sink->bus.bus_width = vep.bus.parallel.bus_width;
> > -	sink->bus.data_shift = vep.bus.parallel.data_shift;
> > +	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> > +		sink->bus.flags = vep.bus.parallel.flags;
> > +		sink->bus.bus_width = vep.bus.parallel.bus_width;
> > +		sink->bus.data_shift = vep.bus.parallel.data_shift;
> > +	}
> >  	sink->bus_type = vep.bus_type;
> >  	ret = media_create_pad_link(&subdev->entity, src_pad, sink->ent, 0,
> >  				    MEDIA_LNK_FL_IMMUTABLE |
> > @@ -414,7 +463,7 @@ static int dcmipp_graph_init(struct dcmipp_device *dcmipp)
> >  static int dcmipp_probe(struct platform_device *pdev)
> >  {
> >  	struct dcmipp_device *dcmipp;
> > -	struct clk *kclk;
> > +	struct clk *kclk, *mclk;
> >  	const struct dcmipp_pipeline_config *pipe_cfg;
> >  	struct reset_control *rstc;
> >  	int irq;
> > @@ -474,12 +523,20 @@ static int dcmipp_probe(struct platform_device *pdev)
> >  		return ret;
> >  	}
> >  
> > -	kclk = devm_clk_get(&pdev->dev, NULL);
> > +	kclk = devm_clk_get(&pdev->dev, "kclk");
> >  	if (IS_ERR(kclk))
> >  		return dev_err_probe(&pdev->dev, PTR_ERR(kclk),
> >  				     "Unable to get kclk\n");
> >  	dcmipp->kclk = kclk;
> >  
> > +	if (!of_device_is_compatible(pdev->dev.of_node, "st,stm32mp13-dcmipp")) {
> > +		mclk = devm_clk_get(&pdev->dev, "mclk");
> > +		if (IS_ERR(mclk))
> > +			return dev_err_probe(&pdev->dev, PTR_ERR(mclk),
> > +					     "Unable to get mclk\n");
> > +		dcmipp->mclk = mclk;
> > +	}
> > +
> >  	dcmipp->entity = devm_kcalloc(&pdev->dev, dcmipp->pipe_cfg->num_ents,
> >  				      sizeof(*dcmipp->entity), GFP_KERNEL);
> >  	if (!dcmipp->entity)
> > @@ -542,6 +599,7 @@ static int dcmipp_runtime_suspend(struct device *dev)
> >  	struct dcmipp_device *dcmipp = dev_get_drvdata(dev);
> >  
> >  	clk_disable_unprepare(dcmipp->kclk);
> > +	clk_disable_unprepare(dcmipp->mclk);
> >  
> >  	return 0;
> >  }
> > @@ -551,6 +609,10 @@ static int dcmipp_runtime_resume(struct device *dev)
> >  	struct dcmipp_device *dcmipp = dev_get_drvdata(dev);
> >  	int ret;
> >  
> > +	ret = clk_prepare_enable(dcmipp->mclk);
> > +	if (ret)
> > +		dev_err(dev, "%s: Failed to prepare_enable mclk\n", __func__);
> > +
> 
> Shouldn't this return on error?

Yes indeed.

> 
> >  	ret = clk_prepare_enable(dcmipp->kclk);
> >  	if (ret)
> >  		dev_err(dev, "%s: Failed to prepare_enable kclk\n", __func__);
> 
> And on error here, it should call clk_disable_unprepare for mclk.

Ok.
> 
> > 
> 
> This was reported by smatch:
> 
> .../dcmipp-core.c:620 dcmipp_runtime_resume() warn: 'dcmipp->mclk' from clk_prepare_enable() not released on lines: 620.
> 
> Everything else in this series looks good to me, so you can either post a fix for this
> and I will fold it into this 13/15 patch, or you post an updated v3.1 13/15 patch.
> Or of course a v4, if you prefer.

I prepared a v4 with this fix in the 13/15 (that's the only difference
between the v3 and the v4). Will post it right away.

Regards,
Alain

> 
> Regards,
> 
> 	Hans

