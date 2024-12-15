Return-Path: <linux-media+bounces-23435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE249F23F9
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 13:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 010C6164F9C
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2024 12:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38077189906;
	Sun, 15 Dec 2024 12:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="Z7OF1xrl"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903E51E871;
	Sun, 15 Dec 2024 12:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734267344; cv=pass; b=sF9Ycq1UKxOY3zj+7NxMxaSP0NF+UgQ3WD0z3idRDb5uuBbxRKKNuU6G3D9kd5veJf96CCEc8iKYy6YKpEy54QqzmAkL7vKU2penm6XCy3JsChqJmWMV1fxQMJ1TlXR4XtuRf+8f/cGZxncqFet2yc9x3Mm0p7QvBCmcTx+jw14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734267344; c=relaxed/simple;
	bh=rEZaEAFKnMrfg/tX14BFwsY8wnDKODljdvXXnlo1Xgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7m33q3s7e4/SsovFg0Ih3W8hP6My4ofL5OHCz0+XAhUn3FWMltJmi4deGI3/p3Y+4g6vcbiIYI+7MwronmP/swDCAxVUBe8KPypuFPORJPIa7YOcXE+LLmFcKIU1Q+i3FQgpvH57joBB0lYcKf8FRWflCHxVMt1Ea27qa7RzSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=Z7OF1xrl; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4YB32z3c7Jz49QBk;
	Sun, 15 Dec 2024 14:55:39 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1734267339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rR6pZZS0ZDDFfUHhWMUaeQf9IKgj0ketQ2YGNGavCF0=;
	b=Z7OF1xrl2/DLXFi+OxNlp8Tet3vO0Slf/sVBkH68AobQrHeUMXiwPG27brZmuTs056Vq9d
	vfh+VTAiq9sLNGyQ4Di95J8EbwO9aZzpk3dWfcVlSQSwYqoniG6AmY7I/LjohAVrc4IO9q
	BWGFmqG1VFNVny5jGTGqsur5km/hcuBtkMXvKHaZEjrLd0syf5dZnICpg/l44QvTfRgNwo
	tfkeTDx+jzXQ57EbQlvTzIvjfJg2vmBaspfpTkfxHdMr0kFG3dSsdCESX2FtuRwmTZCfd3
	IV2SSwijt9YG9K+RVhtsD0PRDxXOUS1+ZIEndNRnG0MXP95kLqOAeRnkCoIDnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1734267339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rR6pZZS0ZDDFfUHhWMUaeQf9IKgj0ketQ2YGNGavCF0=;
	b=sZYEBqMLfaqjU/1vEASnZ2Mvfet5EWs1rKA5be1F2h3SkbAqcu9hA7PcVfuWpzMpZ4/nWI
	kww6iyevduvcqNs8STT9uFnFtb0ne1Fv5Gp2WWynnbsxM9P/dWETS3lxJ1xfVT198MGy6n
	4DaBAkwcZNvsQLJf48MovlOO+PRPQcg9Lz8VFQ3Ty3issCpZmUMLdU6hZ1NU+3kb0QBbE2
	KIL26Dx8/afIMjDJz9NUM7Jq3FGMS49jjz9It1L3jpPlksuA7WWIYZRQBAW2xfYxE0dORq
	x+HgPa8V1p+l/NtzFrd3dYJBQvmsByoOb7OnLLkm5DpkekJW3WPRBAbNlDdl5Q==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1734267339; a=rsa-sha256;
	cv=none;
	b=hhcNrbF4GI3xil+8BGByigVJSpnagb9EFPiKU/pgIikybFf8QdlqYWGQlO9YeJosfi0irX
	REHxFfhIZ//MACBCYedu/tmkXsxLyfdqu8VpYS/3Bo7mykC0Gmsg3eQFBxpSLMnjBMyec8
	xZlLSwvi6hhve1iEp9rw9Ct1VI6AYJv6MBVpiBAPcxb/PUBBllcmKHcuuO4BpNBk2FWcWJ
	/uqdTBv3EW+YYYj+AFHTxzSfpiGAa0h8oUPyQ3Uwxpx+/PSleE2f9/qt+62uv49djmONXD
	k1gvTYFTY1pMon/fUuH4EXGrpz52PKccFn8fh2vb4xd6vaXY6EehRNrmfj9lOQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 27CD3634C94;
	Sun, 15 Dec 2024 14:55:39 +0200 (EET)
Date: Sun, 15 Dec 2024 12:55:39 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Alain Volmat <alain.volmat@foss.st.com>
Cc: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 13/15] media: stm32: dcmipp: add core support for the
 stm32mp25
Message-ID: <Z17Ry6Z9OMqP1MV-@valkosipuli.retiisi.eu>
References: <20241212-csi_dcmipp_mp25-v4-0-fbeb55a05ed7@foss.st.com>
 <20241212-csi_dcmipp_mp25-v4-13-fbeb55a05ed7@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-csi_dcmipp_mp25-v4-13-fbeb55a05ed7@foss.st.com>

Hi Alain,

On Thu, Dec 12, 2024 at 10:17:37AM +0100, Alain Volmat wrote:
> The stm32mp25 supports both parallel & csi inputs.
> An additional clock control is necessary.
> Skeleton of the subdev structures for the stm32mp25 is added,
> identical for the time being to the stm32mp13 however more subdeves
> will be added in further commits.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> v4:
>   - correct clock handling within dcmipp_runtime_resume
> ---
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   | 104 +++++++++++++++++----
>  1 file changed, 85 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> index 62dd17e0488d..71acf539e1f3 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> @@ -40,6 +40,7 @@ struct dcmipp_device {
>  
>  	/* Hardware resources */
>  	void __iomem			*regs;
> +	struct clk			*mclk;
>  	struct clk			*kclk;
>  
>  	/* The pipeline configuration */
> @@ -132,6 +133,40 @@ static const struct dcmipp_pipeline_config stm32mp13_pipe_cfg = {
>  	.hw_revision	= DCMIPP_STM32MP13_VERR
>  };
>  
> +static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
> +	{
> +		.name = "dcmipp_input",
> +		.init = dcmipp_inp_ent_init,
> +		.release = dcmipp_inp_ent_release,
> +	},
> +	{
> +		.name = "dcmipp_dump_postproc",
> +		.init = dcmipp_byteproc_ent_init,
> +		.release = dcmipp_byteproc_ent_release,
> +	},
> +	{
> +		.name = "dcmipp_dump_capture",
> +		.init = dcmipp_bytecap_ent_init,
> +		.release = dcmipp_bytecap_ent_release,
> +	},
> +};
> +
> +static const struct dcmipp_ent_link stm32mp25_ent_links[] = {
> +	DCMIPP_ENT_LINK(ID_INPUT, 1, ID_DUMP_BYTEPROC, 0,
> +			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> +	DCMIPP_ENT_LINK(ID_DUMP_BYTEPROC, 1, ID_DUMP_CAPTURE,  0,
> +			MEDIA_LNK_FL_ENABLED | MEDIA_LNK_FL_IMMUTABLE),
> +};
> +
> +#define DCMIPP_STM32MP25_VERR  0x30
> +static const struct dcmipp_pipeline_config stm32mp25_pipe_cfg = {
> +	.ents		= stm32mp25_ent_config,
> +	.num_ents	= ARRAY_SIZE(stm32mp25_ent_config),
> +	.links		= stm32mp25_ent_links,
> +	.num_links	= ARRAY_SIZE(stm32mp25_ent_links),
> +	.hw_revision    = DCMIPP_STM32MP25_VERR
> +};
> +
>  #define LINK_FLAG_TO_STR(f) ((f) == 0 ? "" :\
>  			     (f) == MEDIA_LNK_FL_ENABLED ? "ENABLED" :\
>  			     (f) == MEDIA_LNK_FL_IMMUTABLE ? "IMMUTABLE" :\
> @@ -212,6 +247,7 @@ static int dcmipp_create_subdevs(struct dcmipp_device *dcmipp)
>  
>  static const struct of_device_id dcmipp_of_match[] = {
>  	{ .compatible = "st,stm32mp13-dcmipp", .data = &stm32mp13_pipe_cfg },
> +	{ .compatible = "st,stm32mp25-dcmipp", .data = &stm32mp25_pipe_cfg },
>  	{ /* end node */ },
>  };
>  MODULE_DEVICE_TABLE(of, dcmipp_of_match);
> @@ -261,13 +297,22 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
>  {
>  	struct dcmipp_device *dcmipp = notifier_to_dcmipp(notifier);
>  	unsigned int ret;
> -	int src_pad;
> +	int src_pad, i;

unsigned int?

>  	struct dcmipp_ent_device *sink;
> -	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_PARALLEL };
> +	struct v4l2_fwnode_endpoint vep = { 0 };
>  	struct fwnode_handle *ep;
> +	enum v4l2_mbus_type supported_types[] = {
> +		V4L2_MBUS_PARALLEL, V4L2_MBUS_BT656, V4L2_MBUS_CSI2_DPHY
> +	};
> +	int supported_types_nb = ARRAY_SIZE(supported_types);
>  
>  	dev_dbg(dcmipp->dev, "Subdev \"%s\" bound\n", subdev->name);
>  
> +	/* Only MP25 supports CSI input */
> +	if (!of_device_is_compatible(dcmipp->dev->of_node,
> +				     "st,stm32mp25-dcmipp"))

This would be much cleaner with match data. You seem to already be using it
for other purposes. 

> +		supported_types_nb--;
> +
>  	/*
>  	 * Link this sub-device to DCMIPP, it could be
>  	 * a parallel camera sensor or a CSI-2 to parallel bridge
> @@ -284,21 +329,23 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
>  		return -ENODEV;
>  	}
>  
> -	/* Check for parallel bus-type first, then bt656 */
> -	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> -	if (ret) {
> -		vep.bus_type = V4L2_MBUS_BT656;
> +	/* Check for supported MBUS type */
> +	for (i = 0; i < supported_types_nb; i++) {
> +		vep.bus_type = supported_types[i];
>  		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> -		if (ret) {
> -			dev_err(dcmipp->dev, "Could not parse the endpoint\n");
> -			fwnode_handle_put(ep);
> -			return ret;
> -		}
> +		if (!ret)
> +			break;
>  	}
>  
>  	fwnode_handle_put(ep);
>  
> -	if (vep.bus.parallel.bus_width == 0) {
> +	if (ret) {
> +		dev_err(dcmipp->dev, "Could not parse the endpoint\n");
> +		return ret;
> +	}
> +
> +	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
> +	    vep.bus.parallel.bus_width == 0) {
>  		dev_err(dcmipp->dev, "Invalid parallel interface bus-width\n");
>  		return -ENODEV;
>  	}
> @@ -311,11 +358,13 @@ static int dcmipp_graph_notify_bound(struct v4l2_async_notifier *notifier,
>  		return -ENODEV;
>  	}
>  
> -	/* Parallel input device detected, connect it to parallel subdev */
> +	/* Connect input device to the dcmipp_input subdev */
>  	sink = dcmipp->entity[ID_INPUT];
> -	sink->bus.flags = vep.bus.parallel.flags;
> -	sink->bus.bus_width = vep.bus.parallel.bus_width;
> -	sink->bus.data_shift = vep.bus.parallel.data_shift;
> +	if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
> +		sink->bus.flags = vep.bus.parallel.flags;
> +		sink->bus.bus_width = vep.bus.parallel.bus_width;
> +		sink->bus.data_shift = vep.bus.parallel.data_shift;
> +	}
>  	sink->bus_type = vep.bus_type;
>  	ret = media_create_pad_link(&subdev->entity, src_pad, sink->ent, 0,
>  				    MEDIA_LNK_FL_IMMUTABLE |
> @@ -414,7 +463,7 @@ static int dcmipp_graph_init(struct dcmipp_device *dcmipp)
>  static int dcmipp_probe(struct platform_device *pdev)
>  {
>  	struct dcmipp_device *dcmipp;
> -	struct clk *kclk;
> +	struct clk *kclk, *mclk;
>  	const struct dcmipp_pipeline_config *pipe_cfg;
>  	struct reset_control *rstc;
>  	int irq;
> @@ -474,12 +523,20 @@ static int dcmipp_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	kclk = devm_clk_get(&pdev->dev, NULL);
> +	kclk = devm_clk_get(&pdev->dev, "kclk");
>  	if (IS_ERR(kclk))
>  		return dev_err_probe(&pdev->dev, PTR_ERR(kclk),
>  				     "Unable to get kclk\n");
>  	dcmipp->kclk = kclk;
>  
> +	if (!of_device_is_compatible(pdev->dev.of_node, "st,stm32mp13-dcmipp")) {

Same here.

> +		mclk = devm_clk_get(&pdev->dev, "mclk");
> +		if (IS_ERR(mclk))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(mclk),
> +					     "Unable to get mclk\n");
> +		dcmipp->mclk = mclk;
> +	}
> +
>  	dcmipp->entity = devm_kcalloc(&pdev->dev, dcmipp->pipe_cfg->num_ents,
>  				      sizeof(*dcmipp->entity), GFP_KERNEL);
>  	if (!dcmipp->entity)
> @@ -542,6 +599,7 @@ static int dcmipp_runtime_suspend(struct device *dev)
>  	struct dcmipp_device *dcmipp = dev_get_drvdata(dev);
>  
>  	clk_disable_unprepare(dcmipp->kclk);
> +	clk_disable_unprepare(dcmipp->mclk);
>  
>  	return 0;
>  }
> @@ -551,9 +609,17 @@ static int dcmipp_runtime_resume(struct device *dev)
>  	struct dcmipp_device *dcmipp = dev_get_drvdata(dev);
>  	int ret;
>  
> +	ret = clk_prepare_enable(dcmipp->mclk);
> +	if (ret) {
> +		dev_err(dev, "%s: Failed to prepare_enable mclk\n", __func__);
> +		return ret;
> +	}
> +
>  	ret = clk_prepare_enable(dcmipp->kclk);
> -	if (ret)
> +	if (ret) {
> +		clk_disable_unprepare(dcmipp->mclk);
>  		dev_err(dev, "%s: Failed to prepare_enable kclk\n", __func__);
> +	}
>  
>  	return ret;
>  }
> 
> 

-- 
Kind regards,

Sakari Ailus

