Return-Path: <linux-media+bounces-12197-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA18D3F94
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 22:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59016B2412B
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 20:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F981C68B5;
	Wed, 29 May 2024 20:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r+Tl+ymE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26FB14534D;
	Wed, 29 May 2024 20:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717014501; cv=none; b=r5NRAIBiP5YkEEfldYKdJQHjkqz1gXBF0FtRjJN/i66sYLh/JDqDVYBUFMdmYa11+k4Y4RoVf+1PATKKxdnM2NKdm9q+sMbMfX5pOEdpOKFGr2BnEKoAbR65l80Nl8BUVPXTF6pD/Tvhpb8KjzHpRV3pbAz/5Skzpc0MioFJL0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717014501; c=relaxed/simple;
	bh=3QziVyeQJ5+bmOBqAbI9ShrOSA0+myPUejTCp+CgK60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlCh0CC+ymkmg0ZBHQ3E1mIZF0KHTiyV3VlSGWEFjI6cU3NvzqWX6Q1/O7vhS969XioT/PV2GmUIm+da36HPwbtkHUiRQpWGhD4fTHQ7s4dmgPPcKdVQXjeEz9PSaS+/QYTDmuDeHgIMVeKXTLj/AuhWrJpns87DgePIYKYc1yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r+Tl+ymE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A29C2D31;
	Wed, 29 May 2024 22:28:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717014493;
	bh=3QziVyeQJ5+bmOBqAbI9ShrOSA0+myPUejTCp+CgK60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r+Tl+ymERk6Urf1SKofdPY4MiaGWLVpueKcz9X02vDbJIagLxXuS02wxk8vwHPp5y
	 0ZhcEBjCNHtDNzqIeB75IW6wBt4xxTB1keUQdeNQz+Num4wq6qTUHmSfaqKnpyQYJT
	 11/5nrrUr/CVjuwDeyko7EIYtWwNWxwTPV2rDjY4=
Date: Wed, 29 May 2024 23:28:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Dan Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v4 3/5] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <20240529202804.GA10133@pendragon.ideasonboard.com>
References: <20240418090825.624747-1-dan.scally@ideasonboard.com>
 <20240418090825.624747-4-dan.scally@ideasonboard.com>
 <Zk74ZZqn568-Wa3M@valkosipuli.retiisi.eu>
 <npqgtwqhpixoixikgrhzq3soqywfla3gmrx44t76idfiryycs7@qkfd4yphgv4q>
 <20240523094926.GA10295@pendragon.ideasonboard.com>
 <417b2d78-6233-4fd7-9b32-aa176938f682@ideasonboard.com>
 <Zk-ukx7rh3kNMIRx@valkosipuli.retiisi.eu>
 <3d8679ca-28a4-4b7b-99da-7f1ccedb415c@ideasonboard.com>
 <ZlNYfu4EOObLomVk@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZlNYfu4EOObLomVk@valkosipuli.retiisi.eu>

On Sun, May 26, 2024 at 03:42:54PM +0000, Sakari Ailus wrote:
> On Fri, May 24, 2024 at 09:37:04AM +0100, Dan Scally wrote:
> > On 23/05/2024 22:01, Sakari Ailus wrote:
> > > On Thu, May 23, 2024 at 12:22:45PM +0100, Dan Scally wrote:
> > > > On 23/05/2024 10:49, Laurent Pinchart wrote:
> > > > > On Thu, May 23, 2024 at 11:48:02AM +0200, Jacopo Mondi wrote:
> > > > > > On Thu, May 23, 2024 at 08:03:49AM GMT, Sakari Ailus wrote:
> > > > > > > Hi Daniel,
> > > > > > [snip]
> > > > > > 
> > > > > > > > +
> > > > > > > > +static int mali_c55_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
> > > > > > > > +{
> > > > > > > > +	struct mali_c55_cap_dev *cap_dev = q->drv_priv;
> > > > > > > > +	struct mali_c55 *mali_c55 = cap_dev->mali_c55;
> > > > > > > > +	struct mali_c55_resizer *rzr = cap_dev->rzr;
> > > > > > > > +	struct mali_c55_isp *isp = &mali_c55->isp;
> > > > > > > > +	int ret;
> > > > > > > > +
> > > > > > > > +	guard(mutex)(&isp->lock);
> > > > > > > > +
> > > > > > > > +	ret = pm_runtime_resume_and_get(mali_c55->dev);
> > > > > > > > +	if (ret)
> > > > > > > > +		return ret;
> > > > > > > > +
> > > > > > > > +	ret = video_device_pipeline_start(&cap_dev->vdev,
> > > > > > > > +					  &cap_dev->mali_c55->pipe);
> > > > > > > > +	if (ret) {
> > > > > > > > +		dev_err(mali_c55->dev, "%s failed to start media pipeline\n",
> > > > > > > > +			mali_c55_cap_dev_to_name(cap_dev));
> > > > > > > > +		goto err_pm_put;
> > > > > > > > +	}
> > > > > > > > +
> > > > > > > > +	mali_c55_cap_dev_stream_enable(cap_dev);
> > > > > > > > +	mali_c55_rzr_start_stream(rzr);
> > > > > > > > +
> > > > > > > > +	/*
> > > > > > > > +	 * We only start the ISP if we're the only capture device that's
> > > > > > > > +	 * streaming. Otherwise, it'll already be active.
> > > > > > > > +	 */
> > > > > > > > +	if (mali_c55->pipe.start_count == 1) {
> > > > > > >
> > > > > > > Do you start streaming on the sensor when the first video node does?
> > > > > > > 
> > > > > > > This means that frames may be lost. E.g. the IPU6 ISYS driver only starts
> > > > > > > streaming on the sensor once all video nodes of the pipeline have been
> > > > > > > started.
> > > > > >
> > > > > > How would you ever know which nodes will be started ?
> > > > >
> > > > > That can be done with link setup. Any video device that has an active
> > > > > link to the ISP would need to be started.
> > > > 
> > > > So if you don't want to stream data from one of the two capture nodes, you'd
> > > > need to disable the link between it and the resizer? That seems quite
> > > > clunky.

Why so ? I think it's a neat solution to communicate userspace's
expected behaviour to the driver.

> > > > Does it matter if one of them starts a frame or two later? As
> > > > opposed to both of them starting in sync a frame or two later?
> > >
> > > Video frames on a given queue are lost due to the driver implementation.
> > > I might consider that to be a driver bug.
> > 
> > This seems a bit odd to me; I think that the implication is when you
> > **queue** a buffer to the driver you're targeting a specific frame from the
> > sensor...is that right? What about if you want to start streaming on the
> 
> The behaviour there without the request API is somewhat driver specific.
> Most driver's don't use it.

I agree. If we want some of the outputs to be optional, we need the
request API. Without it, all video devices that are started (or I'd like
to say included in the pipeline) will need buffers, and I think they
should start at the same time.

> > second capture node at some later point, after the first had already been
> > started? I think we'd be in the same situation there, with the already
> > started capture node getting buffers filled after the second had had buffers
> > queued, but before you could start it.
> 
> In that case you'd  start both queues but of course you can queue buffers
> just to the first node before you need anything from the second one
> (assuming this is supported by the driver).
> 
> > > It's also true that some use cases could also benefit from the behaviour
> > > but on regular CSI-2 receivers that's probably quite rare. We'd need
> > > additional APIs to be able to convey the desired behaviour to the drivers.

-- 
Regards,

Laurent Pinchart

