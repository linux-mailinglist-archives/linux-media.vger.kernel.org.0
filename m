Return-Path: <linux-media+bounces-11787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D50F8CCFA7
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEB751C22580
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 09:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C28613D538;
	Thu, 23 May 2024 09:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="D4zfQTiW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C1813CFA3;
	Thu, 23 May 2024 09:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716457778; cv=none; b=KjWoYjJ/8Jec6dZiJ+9BrFZ/7rnUjgGgC4GbXzaD3N4frmio+CIAdTyU3/LbsfT4C8evbrT4g7n/7q3c/MIF7WCGwTXTqj4WX1EKxHA4673knYPTl11cKK/HZYFL+RQUcyjgd30crJBieCE4TQt/b3Duzn6wglb0GdkxxUDy7Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716457778; c=relaxed/simple;
	bh=HOdS+06qu+S37zR7SKAlyZQewNTBTY36JsdDvxdut5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMrH6MnlaZVEplJk1J1ytrZq2jSGq1UI1bPRnt87x6na2KS5xmDjTVSpHGAunMM/PcJVFbDotbMSgCdPgVyJ3k+UXEjb4+aPQebG3s9yVE8QnhKuqIVkVxz8FRBulY5Ndl38pmR6zXH4Vc39eVmjc40T6c7vbidjqhRqDwAUWM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=D4zfQTiW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C3357E1;
	Thu, 23 May 2024 11:49:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716457762;
	bh=HOdS+06qu+S37zR7SKAlyZQewNTBTY36JsdDvxdut5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D4zfQTiWxTJFhwCp6e4DrMAsInFNfVzu+R7X9sdrMr9fAfZjst46yza9aVddCzGEg
	 8vUe0mqqNQt8SB8Phq6fcVRiK2H6vTrgQULhSaKwg77YohMU/EOc8UYW82pWnxHY8M
	 djTthR+SRrjg+SV/9zX8GU8jJZFLYmAHe6BFnbGg=
Date: Thu, 23 May 2024 12:49:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v4 3/5] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <20240523094926.GA10295@pendragon.ideasonboard.com>
References: <20240418090825.624747-1-dan.scally@ideasonboard.com>
 <20240418090825.624747-4-dan.scally@ideasonboard.com>
 <Zk74ZZqn568-Wa3M@valkosipuli.retiisi.eu>
 <npqgtwqhpixoixikgrhzq3soqywfla3gmrx44t76idfiryycs7@qkfd4yphgv4q>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <npqgtwqhpixoixikgrhzq3soqywfla3gmrx44t76idfiryycs7@qkfd4yphgv4q>

On Thu, May 23, 2024 at 11:48:02AM +0200, Jacopo Mondi wrote:
> On Thu, May 23, 2024 at 08:03:49AM GMT, Sakari Ailus wrote:
> > Hi Daniel,
> 
> [snip]
> 
> > > +
> > > +static int mali_c55_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
> > > +{
> > > +	struct mali_c55_cap_dev *cap_dev = q->drv_priv;
> > > +	struct mali_c55 *mali_c55 = cap_dev->mali_c55;
> > > +	struct mali_c55_resizer *rzr = cap_dev->rzr;
> > > +	struct mali_c55_isp *isp = &mali_c55->isp;
> > > +	int ret;
> > > +
> > > +	guard(mutex)(&isp->lock);
> > > +
> > > +	ret = pm_runtime_resume_and_get(mali_c55->dev);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = video_device_pipeline_start(&cap_dev->vdev,
> > > +					  &cap_dev->mali_c55->pipe);
> > > +	if (ret) {
> > > +		dev_err(mali_c55->dev, "%s failed to start media pipeline\n",
> > > +			mali_c55_cap_dev_to_name(cap_dev));
> > > +		goto err_pm_put;
> > > +	}
> > > +
> > > +	mali_c55_cap_dev_stream_enable(cap_dev);
> > > +	mali_c55_rzr_start_stream(rzr);
> > > +
> > > +	/*
> > > +	 * We only start the ISP if we're the only capture device that's
> > > +	 * streaming. Otherwise, it'll already be active.
> > > +	 */
> > > +	if (mali_c55->pipe.start_count == 1) {
> >
> > Do you start streaming on the sensor when the first video node does?
> >
> > This means that frames may be lost. E.g. the IPU6 ISYS driver only starts
> > streaming on the sensor once all video nodes of the pipeline have been
> > started.
> 
> How would you ever know which nodes will be started ?

That can be done with link setup. Any video device that has an active
link to the ISP would need to be started.

-- 
Regards,

Laurent Pinchart

