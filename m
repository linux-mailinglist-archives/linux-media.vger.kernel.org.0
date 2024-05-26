Return-Path: <linux-media+bounces-11888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 831848CF4CA
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 17:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5386281182
	for <lists+linux-media@lfdr.de>; Sun, 26 May 2024 15:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3586717BCD;
	Sun, 26 May 2024 15:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="IpL2+JO+"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B351B809;
	Sun, 26 May 2024 15:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716738366; cv=pass; b=APXbhJ8/Qglltmd3+Wj4odHL8n7yorwiCJDO9CiPG+jF/86rtPz5lnGxjcHUB/9Yyo9+UFCMXRcRgD/RVw9Ah/WjSySjwIeJgxZVibk1T59eKw6bDh82NdInYKscRQD+7AHCnk++6nEGmzCdOpC9wQo0fwcAD67q7+1G/dCr6TE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716738366; c=relaxed/simple;
	bh=McyoG9pXF5Zy1H8gAAXtLctC7D76/zKiXzKpRKlfTio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtR/XE3UUvMQUIwFSrExQB5DOJECtMdqsXKdVT8vvgkV1EV1rYqbNw4M5WPfb1DDUCpaUuXSf89eIr0ig0TArLrC9+zbU/DmB0KHm3X4T5Qtt4EJ/r6SKMKApD3cCCOAIEqc3ffbL50D4Ob7Vr58U1YYQF0WR6cT57jFPkot5K0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=IpL2+JO+; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VnNR04qw5zyR6;
	Sun, 26 May 2024 18:45:48 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1716738352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O6wpXKaPz9TFZhVFONUF9QNULDMt21/7Rcp0OPNkJj4=;
	b=IpL2+JO+Q5cLF11TgxG+SId/nqfxvktKOtjbVnU6v6VbUxshOjfebPLv/XZkIBzmI0Dacw
	PCOVNuDs3wwOa+Pn6M7KX+mxrpu78VnvwEcJLyTn9gLRMghW6fUFI1SGXy6kdgAXqnoSR4
	0BF2jBzJzZeqzLd1Y+heT54ailJTkWs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1716738352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O6wpXKaPz9TFZhVFONUF9QNULDMt21/7Rcp0OPNkJj4=;
	b=uqcQJj+8dUPiBr6g0BlGPaoNu9hqOyk2DVuX6sZobQ81ZnNJFiRMMe/oh1BtNW+5u46ieo
	D1z2yE7GgarCNARWL8zvRG3Zav+sG8hinAgcUnAqzvMi++mvIYQPkfCTe54vJdMKRa3lZ1
	XqPFcP9eWkCRs6zclyUU0SmjSRvk6Qg=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1716738352; a=rsa-sha256; cv=none;
	b=xWtt9T2ghEyutgr+cALSg8pdigQrRk++Ruiato9MkWvNk+128D/d4I5Cp0/OB1IyFL0NfD
	pWQiYhpq4Icu85FcLlrD/fUFkErEJ6ZGqfDr1JjFWSBrs8tETUyKanJR5FOL5+pl1m4YXJ
	7U4+znO5B4moT/eLJksvSYw6qkhlYPk=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 14DEE634C94;
	Sun, 26 May 2024 18:42:54 +0300 (EEST)
Date: Sun, 26 May 2024 15:42:54 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v4 3/5] media: mali-c55: Add Mali-C55 ISP driver
Message-ID: <ZlNYfu4EOObLomVk@valkosipuli.retiisi.eu>
References: <20240418090825.624747-1-dan.scally@ideasonboard.com>
 <20240418090825.624747-4-dan.scally@ideasonboard.com>
 <Zk74ZZqn568-Wa3M@valkosipuli.retiisi.eu>
 <npqgtwqhpixoixikgrhzq3soqywfla3gmrx44t76idfiryycs7@qkfd4yphgv4q>
 <20240523094926.GA10295@pendragon.ideasonboard.com>
 <417b2d78-6233-4fd7-9b32-aa176938f682@ideasonboard.com>
 <Zk-ukx7rh3kNMIRx@valkosipuli.retiisi.eu>
 <3d8679ca-28a4-4b7b-99da-7f1ccedb415c@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d8679ca-28a4-4b7b-99da-7f1ccedb415c@ideasonboard.com>

Hi Dan,

On Fri, May 24, 2024 at 09:37:04AM +0100, Dan Scally wrote:
> Good morning Sakari
> 
> On 23/05/2024 22:01, Sakari Ailus wrote:
> > Hi Dan,
> > 
> > On Thu, May 23, 2024 at 12:22:45PM +0100, Dan Scally wrote:
> > > Hello
> > > 
> > > On 23/05/2024 10:49, Laurent Pinchart wrote:
> > > > On Thu, May 23, 2024 at 11:48:02AM +0200, Jacopo Mondi wrote:
> > > > > On Thu, May 23, 2024 at 08:03:49AM GMT, Sakari Ailus wrote:
> > > > > > Hi Daniel,
> > > > > [snip]
> > > > > 
> > > > > > > +
> > > > > > > +static int mali_c55_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
> > > > > > > +{
> > > > > > > +	struct mali_c55_cap_dev *cap_dev = q->drv_priv;
> > > > > > > +	struct mali_c55 *mali_c55 = cap_dev->mali_c55;
> > > > > > > +	struct mali_c55_resizer *rzr = cap_dev->rzr;
> > > > > > > +	struct mali_c55_isp *isp = &mali_c55->isp;
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	guard(mutex)(&isp->lock);
> > > > > > > +
> > > > > > > +	ret = pm_runtime_resume_and_get(mali_c55->dev);
> > > > > > > +	if (ret)
> > > > > > > +		return ret;
> > > > > > > +
> > > > > > > +	ret = video_device_pipeline_start(&cap_dev->vdev,
> > > > > > > +					  &cap_dev->mali_c55->pipe);
> > > > > > > +	if (ret) {
> > > > > > > +		dev_err(mali_c55->dev, "%s failed to start media pipeline\n",
> > > > > > > +			mali_c55_cap_dev_to_name(cap_dev));
> > > > > > > +		goto err_pm_put;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	mali_c55_cap_dev_stream_enable(cap_dev);
> > > > > > > +	mali_c55_rzr_start_stream(rzr);
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * We only start the ISP if we're the only capture device that's
> > > > > > > +	 * streaming. Otherwise, it'll already be active.
> > > > > > > +	 */
> > > > > > > +	if (mali_c55->pipe.start_count == 1) {
> > > > > > Do you start streaming on the sensor when the first video node does?
> > > > > > 
> > > > > > This means that frames may be lost. E.g. the IPU6 ISYS driver only starts
> > > > > > streaming on the sensor once all video nodes of the pipeline have been
> > > > > > started.
> > > > > How would you ever know which nodes will be started ?
> > > > That can be done with link setup. Any video device that has an active
> > > > link to the ISP would need to be started.
> > > 
> > > So if you don't want to stream data from one of the two capture nodes, you'd
> > > need to disable the link between it and the resizer? That seems quite
> > > clunky. Does it matter if one of them starts a frame or two later? As
> > > opposed to both of them starting in sync a frame or two later?
> > Video frames on a given queue are lost due to the driver implementation.
> > I might consider that to be a driver bug.
> 
> 
> This seems a bit odd to me; I think that the implication is when you
> **queue** a buffer to the driver you're targeting a specific frame from the
> sensor...is that right? What about if you want to start streaming on the

The behaviour there without the request API is somewhat driver specific.
Most driver's don't use it.

> second capture node at some later point, after the first had already been
> started? I think we'd be in the same situation there, with the already
> started capture node getting buffers filled after the second had had buffers
> queued, but before you could start it.

In that case you'd  start both queues but of course you can queue buffers
just to the first node before you need anything from the second one
(assuming this is supported by the driver).

> 
> 
> > 
> > It's also true that some use cases could also benefit from the behaviour
> > but on regular CSI-2 receivers that's probably quite rare. We'd need
> > additional APIs to be able to convey the desired behaviour to the drivers.
> > 

-- 
Kind regards,

Sakari Ailus

