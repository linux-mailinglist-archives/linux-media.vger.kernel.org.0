Return-Path: <linux-media+bounces-24544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9EEA07E50
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 18:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E59B0169AA9
	for <lists+linux-media@lfdr.de>; Thu,  9 Jan 2025 17:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2602E18B482;
	Thu,  9 Jan 2025 17:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJz0GlbO"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90566273F9;
	Thu,  9 Jan 2025 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736442381; cv=none; b=a6fDKFHXA5OstHDsW2h+z2Zh9Gvy09lAFKVHJFXxAd2djYHhvnNwCysHESFa68tdzUx/LxO3Cpx7cyc86Y2x17cvh/oJxG1EoHW55oPoynBm78uxdl0v1up2saJ82kGFgJ/geW58C+JiLWuSzZv2sLRfA9NrwBLGpcJgaH5dFIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736442381; c=relaxed/simple;
	bh=nRlcHIWMWNlXsOd44T5vQ9NpUDVOuQOnfEVemUhpcOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBWK2mQN2feycklxo6gMi85CC3Yq37hs3H60wcEsIM1pz8gGR9IOUUrb0zEPjxb3+BNP+e92cQUdiUvY50JLIFdTjlBcNnWRqAgnUdmyRjDbb3HpYWD0kHzr1nfo4FFLFYvIyIortKWyQKuBWA6bomTixJzhdaZbY5R8aQAReMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJz0GlbO; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736442380; x=1767978380;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nRlcHIWMWNlXsOd44T5vQ9NpUDVOuQOnfEVemUhpcOQ=;
  b=jJz0GlbOhR+Hhy7qT2EeAQWpsBidDw564b7nO8svBMbgFXGEcLhSV8nn
   VhVdf9DtQXNZMt/5YEoo65G3ThSnZ81dmh5jlRhvS3jJgVT0Qor9qbj4H
   ZRGTApZkX9kWktrP3pWlUHhCYR0RfLr378e0+8fGi3VCocEv1rMRbUh34
   JyI5H/mmzA8YDO1tGMY6/tARn4GeOHUi+OhQeJyP0r4dGQNqoSVRa91rz
   x6yM+bUqYmVgTuGIZ//kyHpsg6y840O4waHPA+LJr0ESrwW+8zsuXeham
   +9m8N+5D2zzNHSpAJUhu3QeVQVyg8MaKFwutOWIf4OVXAu7uN8gEcLTYU
   A==;
X-CSE-ConnectionGUID: P9Oc+vsdRY+FClNuOifONw==
X-CSE-MsgGUID: FGGooiwFTMWJiSmFBnTkeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="59187431"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="59187431"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 09:06:17 -0800
X-CSE-ConnectionGUID: cBRNnM2EQTmTyLxB4/0c3w==
X-CSE-MsgGUID: RTSHhsAZTra0iE/QVd9KiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="108461943"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 09:06:11 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 1F59A11F951;
	Thu,  9 Jan 2025 19:06:08 +0200 (EET)
Date: Thu, 9 Jan 2025 17:06:08 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Alexander Shiyan <eagle.alexander923@gmail.com>,
	Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Mehdi Djait <mehdi.djait@bootlin.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>
Subject: Re: [PATCH v2 4/6] media: rockchip: add a driver for the rockchip
 camera interface (cif)
Message-ID: <Z4ACALOeioLroqmw@kekkonen.localdomain>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
 <20241217-v6-8-topic-rk3568-vicap-v2-4-b1d488fcc0d3@wolfvision.net>
 <Z3-f1SrrRjMnB-1C@kekkonen.localdomain>
 <561bef3e-2511-4741-9175-5c15239f9b1f@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <561bef3e-2511-4741-9175-5c15239f9b1f@wolfvision.net>

Hi Michael,

On Thu, Jan 09, 2025 at 02:05:54PM +0100, Michael Riesch wrote:
> Hi Sakari,
> 
> Thanks a lot for your review!

You're welcome!

> 
> On 1/9/25 11:07, Sakari Ailus wrote:
> > Hi Michael,
> > 
> > Thanks for the update.
> > 
> > On Tue, Dec 17, 2024 at 04:55:16PM +0100, Michael Riesch wrote:
...
> >> +static int cif_subdev_notifier_register(struct cif_device *cif_dev, int index)
> > 
> > This function name is misleading. It does not register a notifier, it
> > prepares one though.
> 
> cif_subdev_notifier_add(..) ?

Sounds good.

> >> +{
> >> +	struct v4l2_async_notifier *ntf = &cif_dev->notifier;
> >> +	struct v4l2_fwnode_endpoint *vep;
> >> +	struct cif_remote *remote;
> >> +	struct device *dev = cif_dev->dev;
> >> +	struct fwnode_handle *ep;
> >> +	int ret;
> >> +
> >> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), index, 0,
> >> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> >> +	if (!ep)
> >> +		return -ENODEV;
> >> +
> >> +	if (index == 0) {
> > 
> > index seems to be always 0.
> 
> Right now, yes. The soon-to-be-added MIPI paths shall bring different
> indices into play.

Ack.

> 
> > 
> >> +		vep = &cif_dev->dvp.vep;
> >> +
> >> +		vep->bus_type = V4L2_MBUS_UNKNOWN;
> >> +		ret = v4l2_fwnode_endpoint_parse(ep, vep);
> >> +		if (ret)
> >> +			goto complete;
> >> +
> >> +		if (vep->bus_type != V4L2_MBUS_BT656 &&
> >> +		    vep->bus_type != V4L2_MBUS_PARALLEL) {
> >> +			v4l2_err(&cif_dev->v4l2_dev, "unsupported bus type\n");
> >> +			goto complete;
> >> +		}
> >> +
> >> +		remote = v4l2_async_nf_add_fwnode_remote(ntf, ep,
> >> +							 struct cif_remote);
> >> +		if (IS_ERR(remote)) {
> >> +			ret = PTR_ERR(remote);
> >> +			goto complete;
> >> +		}
> >> +
> >> +		cif_dev->dvp.stream.remote = remote;
> >> +		remote->stream = &cif_dev->dvp.stream;
> >> +	} else {
> >> +		ret = -ENODEV;
> >> +		goto complete;
> >> +	}
> >> +
> >> +complete:
> >> +	fwnode_handle_put(ep);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static void cif_subdev_notifier_unregister(struct cif_device *cif_dev,
> >> +					   int index)
> > 
> > This seems to be redundant.
> 
> Ack.
> 
> > 
> >> +{
> >> +}
> >> +
> >> +static int cif_entities_register(struct cif_device *cif_dev)
> > 
> > This function appears to be misnamed.
> 
> Hm. The function registers the different entities of this hardware, such
> as the DVP. However, I am not emotionally attached to this name and any
> suggestions are welcome :-)

Ok, fair enough: one of the things it does is to register the video device
but it does a whole lot of other stuff unrelated to it. How about just
cif_register()?

> 
> > 
> >> +{
> >> +	struct v4l2_async_notifier *ntf = &cif_dev->notifier;
> >> +	struct device *dev = cif_dev->dev;
> >> +	int ret;
> >> +
> >> +	v4l2_async_nf_init(ntf, &cif_dev->v4l2_dev);
> >> +	ntf->ops = &cif_subdev_notifier_ops;
> >> +
> >> +	if (cif_dev->match_data->dvp) {
> >> +		ret = cif_subdev_notifier_register(cif_dev, 0);
> >> +		if (ret) {
> >> +			dev_err(dev,
> >> +				"failed to register notifier for dvp: %d\n",
> >> +				ret);
> >> +			goto err;
> >> +		}
> >> +
> >> +		ret = cif_dvp_register(cif_dev);
> >> +		if (ret) {
> >> +			dev_err(dev, "failed to register dvp: %d\n", ret);
> >> +			goto err_dvp_notifier_unregister;
> >> +		}
> >> +	}
> >> +
> >> +	ret = v4l2_async_nf_register(ntf);
> >> +	if (ret)
> >> +		goto err_notifier_cleanup;
> >> +
> >> +	return 0;
> >> +
> >> +err_notifier_cleanup:
> >> +	if (cif_dev->match_data->dvp)
> >> +		cif_dvp_unregister(cif_dev);
> >> +err_dvp_notifier_unregister:
> >> +	if (cif_dev->match_data->dvp)
> >> +		cif_subdev_notifier_unregister(cif_dev, 0);
> >> +	v4l2_async_nf_cleanup(ntf);
> >> +err:
> >> +	return ret;
> >> +}
> >> +
> >> +static void cif_entities_unregister(struct cif_device *cif_dev)

And similarly here.

> >> +{
> >> +	v4l2_async_nf_unregister(&cif_dev->notifier);
> >> +	v4l2_async_nf_cleanup(&cif_dev->notifier);
> >> +
> >> +	if (cif_dev->match_data->dvp) {
> >> +		cif_subdev_notifier_unregister(cif_dev, 0);
> >> +		cif_dvp_unregister(cif_dev);
> >> +	}
> >> +}
> >> +
> >> +static irqreturn_t cif_isr(int irq, void *ctx)
> >> +{
> >> +	irqreturn_t ret = IRQ_NONE;
> >> +
> >> +	if (cif_dvp_isr(irq, ctx) == IRQ_HANDLED)
> >> +		ret = IRQ_HANDLED;
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static int cif_probe(struct platform_device *pdev)
> >> +{
> >> +	struct device *dev = &pdev->dev;
> >> +	struct cif_device *cif_dev;
> >> +	u32 cif_clk_delaynum = 0;
> >> +	int ret, irq, i;
> >> +
> >> +	cif_dev = devm_kzalloc(dev, sizeof(*cif_dev), GFP_KERNEL);
> >> +	if (!cif_dev)
> >> +		return -ENOMEM;
> >> +
> >> +	cif_dev->match_data = of_device_get_match_data(dev);
> >> +	if (!cif_dev->match_data)
> >> +		return -ENODEV;
> >> +
> >> +	dev_set_drvdata(dev, cif_dev);
> >> +	cif_dev->dev = dev;
> >> +
> >> +	cif_dev->base_addr = devm_platform_ioremap_resource(pdev, 0);
> >> +	if (IS_ERR(cif_dev->base_addr))
> >> +		return PTR_ERR(cif_dev->base_addr);
> >> +
> >> +	irq = platform_get_irq(pdev, 0);
> >> +	if (irq < 0)
> >> +		return irq;
> >> +
> >> +	ret = devm_request_irq(dev, irq, cif_isr, IRQF_SHARED,
> >> +			       dev_driver_string(dev), dev);
> >> +	if (ret)
> >> +		return dev_err_probe(dev, ret, "failed to request irq\n");
> >> +	cif_dev->irq = irq;
> > 
> > Where do you need the irq field?
> 
> Hm. Seems to be a leftover. Should we check irq == cif_dev->irq in the
> ISR or is this unnecessary?

You've got the device context already, I don't think you need to check the
irq.

> >> +	cif_dev->media_dev.dev = dev;
> >> +	strscpy(cif_dev->media_dev.model, CIF_DRIVER_NAME,
> >> +		sizeof(cif_dev->media_dev.model));
> >> +	media_device_init(&cif_dev->media_dev);
> >> +
> >> +	cif_dev->v4l2_dev.mdev = &cif_dev->media_dev;
> >> +	cif_dev->v4l2_dev.notify = cif_notify;
> >> +	strscpy(cif_dev->v4l2_dev.name, CIF_DRIVER_NAME,
> >> +		sizeof(cif_dev->v4l2_dev.name));
> > 
> > Do you need to set the name? v4l2_device_register() assigns a default one.
> 
> I guess we can use the default, then.
> 
> We do need to set the model of the media device, though, right?

Correct.

> >> +static int cif_stream_start_streaming(struct vb2_queue *queue,
> >> +				      unsigned int count)
> >> +{
> >> +	struct cif_stream *stream = queue->drv_priv;
> >> +	struct cif_device *cif_dev = stream->cif_dev;
> >> +	struct v4l2_subdev *sd = stream->remote->sd;
> >> +	int ret;
> >> +
> >> +	stream->frame_idx = 0;
> >> +	stream->frame_phase = 0;
> >> +
> >> +	ret = video_device_pipeline_start(&stream->vdev, &stream->pipeline);
> >> +	if (ret) {
> >> +		dev_err(cif_dev->dev, "failed to start pipeline %d\n", ret);
> >> +		goto err_out;
> >> +	}
> >> +
> >> +	ret = pm_runtime_resume_and_get(cif_dev->dev);
> >> +	if (ret < 0) {
> >> +		dev_err(cif_dev->dev, "failed to get runtime pm, %d\n", ret);
> >> +		goto err_pipeline_stop;
> >> +	}
> >> +
> >> +	ret = cif_stream_init_buffers(stream);
> >> +	if (ret)
> >> +		goto err_runtime_put;
> >> +
> >> +	if (stream->start_streaming) {
> >> +		ret = stream->start_streaming(stream);
> >> +		if (ret < 0)
> >> +			goto err_runtime_put;
> >> +	}
> >> +
> >> +	ret = v4l2_subdev_call(sd, video, s_stream, 1);
> > 
> > Could you use v4l2_subdev_enable_streams() instead for this?
> > 
> > See e.g. drivers/media/pci/intel/ipu6 for an example.
> 
> This should be pretty much a 1:1 replacement I guess? But with support
> for streams?

Yes, and I'd prefer to get rid of the s_stream() op altogether. That may
take a long time though.

> >> +static int cif_stream_enum_framesizes(struct file *file, void *fh,
> >> +				      struct v4l2_frmsizeenum *fsize)
> >> +{
> >> +	struct cif_stream *stream = video_drvdata(file);
> >> +	struct v4l2_subdev_frame_size_enum fse = {
> >> +		.index = fsize->index,
> >> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> >> +	};
> >> +	struct v4l2_subdev *sd = stream->remote->sd;
> >> +	const struct cif_output_fmt *fmt;
> >> +	int ret;
> >> +
> >> +	fmt = cif_stream_find_output_fmt(stream, fsize->pixel_format);
> >> +	if (!fmt)
> >> +		return -EINVAL;
> >> +
> >> +	fse.code = fmt->mbus_code;
> >> +
> >> +	ret = v4l2_subdev_call(sd, pad, enum_frame_size, NULL, &fse);
> > 
> > You shouldn't get this information from the sensor driver but just convey
> > what this device supports.
> 
> OK, but what does this device support? In principle, there is a
> continuous range of frame sizes up to a certain maximum size. But in
> practice, it depends on the subdevice as there is no scaler in the DVP
> path. Thus, every frame size but the one that the subdevice delivers
> will result in a broken stream?

Could you use CIF_MAX_WIDTH and CIF_MAX_HEIGHT?

> 
> If this does not return the only possible frame size, is this callback
> useful at all?

In order not to configure an output size for the sensor that can't be
received by this block?

> >> diff --git a/drivers/media/platform/rockchip/cif/cif-stream.h b/drivers/media/platform/rockchip/cif/cif-stream.h
> >> new file mode 100644
> >> index 000000000000..5bfa260eda83
> >> --- /dev/null
> >> +++ b/drivers/media/platform/rockchip/cif/cif-stream.h
> >> @@ -0,0 +1,24 @@
> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> +/*
> >> + * Rockchip Camera Interface (CIF) Driver
> >> + *
> >> + * Copyright (C) 2024 Michael Riesch <michael.riesch@wolfvision.net>
> >> + */
> >> +
> >> +#ifndef _CIF_STREAM_H
> >> +#define _CIF_STREAM_H
> >> +
> >> +#include "cif-common.h"
> >> +
> >> +struct cif_stream_config {
> >> +	const char *name;
> >> +};
> >> +
> >> +void cif_stream_pingpong(struct cif_stream *stream);
> >> +
> >> +int cif_stream_register(struct cif_device *cif_dev, struct cif_stream *stream,
> >> +			const struct cif_stream_config *config);
> >> +
> >> +void cif_stream_unregister(struct cif_stream *stream);
> > 
> > There are other CIFs out there. I think it'd be good to use either some
> > Rockchip specific prefix (rk maybe?) or a namespace.
> 
> Are there? In drivers/media or in general?

I may recall something that may be after all related to this.

Either way, "cif" is a non-specific short string and it's entirely
conceivable it'll easily conflict with something else.

> 
> And would that apply to all the method and struct names in this driver
> or to the driver as well (location, file names)?
> 
> The name has been discussed several times during the 13 iterations of
> the PX30 VIP series and I believe it changed from (cif//rkcif_) in
> downstream -> (vip//vip_) in Maximes work -> (cif/cif-/cif_) in Mehdis
> work, where the tuple is (driver directory/filename prefix/function and
> structs prefix).
> 
> Hence I am a bit reluctant to change the naming convention yet again.
> That said, I'll be prepared to change it JUST ONE MORE TIME to any tuple
> you suggest -- but this really should be the end of the name bikeshedding.

I don't care about the internal naming but the global symbols. Using a
namespace is another option.

-- 
Kind regards,

Sakari Ailus

