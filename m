Return-Path: <linux-media+bounces-11785-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6FE8CCF9D
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 11:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BDB51F232AE
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 09:48:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6EC13D51D;
	Thu, 23 May 2024 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iuCbuSej"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA9E13CFA3;
	Thu, 23 May 2024 09:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716457689; cv=none; b=Uqod+fcSTpThQrAZhQfMaOqkCTH19Nri9MkC+aufQjSPpd4VtYGRQcljzTqHy5RsF6GBcQulQHvobBmBtbfQGI0qYSEzjgDgW0QeTVNVZva9zR/LPsRFJaFnZUjNGZ3mBL0csD4n4I/qJDk7saHtLilfv06QWyo6UOlEKCzba2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716457689; c=relaxed/simple;
	bh=F5Gdhx4r1vdxvrii/iY09p/Ywlq0QtwfgnRkazBrFsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TLBnAz9cWaUdGKS7MyfO/LsOG3LuH6VxaUPAol+f4QBWGkN13grCBuAGWSjliTN6MQG3W7hGr2WSQNXKyoeXkH4Qio0IcLQ1bE7At7ZME+BbE2U6+QFINZv7pLPM1oWAHFARLZozwji2ccnECkaKPRrRn6eMwhKU15GnEyVhr38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iuCbuSej; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 567697E1;
	Thu, 23 May 2024 11:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716457672;
	bh=F5Gdhx4r1vdxvrii/iY09p/Ywlq0QtwfgnRkazBrFsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iuCbuSejDuV8hBzibqFQlqbuchX52iAWJ5AjAgpKI3fFiAQPS60aF7bQqAIB3q5IC
	 ZTl11iXPtdYH+wtEFDqZtC7FUAterAAJgYrIxUk5vhjY5WyjuTDmnSXqTaAJMHLejM
	 r+xijT8PEZeTy9q4RzEw9f8d/jJr5NwvVvU+dzQU=
Date: Thu, 23 May 2024 11:48:02 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jerome.forissier@linaro.org, 
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v4 3/5] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <npqgtwqhpixoixikgrhzq3soqywfla3gmrx44t76idfiryycs7@qkfd4yphgv4q>
References: <20240418090825.624747-1-dan.scally@ideasonboard.com>
 <20240418090825.624747-4-dan.scally@ideasonboard.com>
 <Zk74ZZqn568-Wa3M@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zk74ZZqn568-Wa3M@valkosipuli.retiisi.eu>

Hi Sakari

On Thu, May 23, 2024 at 08:03:49AM GMT, Sakari Ailus wrote:
> Hi Daniel,

[snip]

>
> > +
> > +static int mali_c55_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
> > +{
> > +	struct mali_c55_cap_dev *cap_dev = q->drv_priv;
> > +	struct mali_c55 *mali_c55 = cap_dev->mali_c55;
> > +	struct mali_c55_resizer *rzr = cap_dev->rzr;
> > +	struct mali_c55_isp *isp = &mali_c55->isp;
> > +	int ret;
> > +
> > +	guard(mutex)(&isp->lock);
> > +
> > +	ret = pm_runtime_resume_and_get(mali_c55->dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = video_device_pipeline_start(&cap_dev->vdev,
> > +					  &cap_dev->mali_c55->pipe);
> > +	if (ret) {
> > +		dev_err(mali_c55->dev, "%s failed to start media pipeline\n",
> > +			mali_c55_cap_dev_to_name(cap_dev));
> > +		goto err_pm_put;
> > +	}
> > +
> > +	mali_c55_cap_dev_stream_enable(cap_dev);
> > +	mali_c55_rzr_start_stream(rzr);
> > +
> > +	/*
> > +	 * We only start the ISP if we're the only capture device that's
> > +	 * streaming. Otherwise, it'll already be active.
> > +	 */
> > +	if (mali_c55->pipe.start_count == 1) {
>
> Do you start streaming on the sensor when the first video node does?
>
> This means that frames may be lost. E.g. the IPU6 ISYS driver only starts
> streaming on the sensor once all video nodes of the pipeline have been
> started.
>

How would you ever know which nodes will be started ?

