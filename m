Return-Path: <linux-media+bounces-11837-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA248CDBB4
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 23:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8535E1F23DE4
	for <lists+linux-media@lfdr.de>; Thu, 23 May 2024 21:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97033127E12;
	Thu, 23 May 2024 21:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="uIwnwoh6"
X-Original-To: linux-media@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B932384E1E;
	Thu, 23 May 2024 21:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716498237; cv=pass; b=Yc2Pu4MpnERfbGmnyqJagVtUQIskosSPHfEt6OgEFuS1ltw27xb8RbSvyJHhiZU5Z142TXjtBiNEuCvwwKJJIbV38HYn14BOMxRb0q7llqRUNJBWUVGf+n3J+rOZy5gmPN9wROn9HoFmbiGj+9s8Ajh4LmCAe67TnCqEGLw4YhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716498237; c=relaxed/simple;
	bh=R1t6C//B8gSD/AIZktIWn+8AMhOunLKxiAHFhU/hQco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCfOPuNuZC7JaVTLqbg3YQhptWyMVMQ6wxOkJcD2olWGr6XclXvTTlr2vc4P1RS+zg4po+as8ZIiZtRpLRXikjfWNeFFPN9UpmhTgU3VVsVqNAIT1yyIh+Zgd7ijmQlb7krUFKA/fXv4+ks7VCe3yCQ5j6MwQnXD1kdvgbz0OfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=uIwnwoh6; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4VlgdK71RxzyQB;
	Fri, 24 May 2024 00:03:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1716498232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nX5AM6A77Xa/XF19LQISasEtvJWDxAUMgMeFptk88W4=;
	b=uIwnwoh6y8HKJgdMmYI32f/+CE5j2OXmqMsOWLxasi1Tar3BCqK4ukKVJEpP+aGZMNTiy7
	3RqS6iP63P1/KabRK5oPgJHxhRGvH2kfs2aBzCi4WLGke5xrk0ymDQKUgS2s3SUL/mF73N
	SatqbdmNKsGNNc/6E83hMhos2npU/zo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1716498232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nX5AM6A77Xa/XF19LQISasEtvJWDxAUMgMeFptk88W4=;
	b=noKXayHbQhCc59boEnu+EDysqSOtri2Vcy5LDcomLIA5JYpDQ/rr1WncvFHzT5XqkhJvED
	mufNm7LE5dLIdQ3NtDsH/LQFrMWEBK0AGbXcdwnyvqtU48xTBHSYYCg63OO+qqeyyzTAOU
	Nig/rw3Tskys0sMY6vDBIvdmnIeMvFk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1716498232; a=rsa-sha256; cv=none;
	b=h74XJVUA4gw4YWSwOsUi3HV09ROPT/qtvKIp+9vv7maL2FMl/imNuVR84M5NFlTy8aKYly
	ULzCPjZ21lfF4gz57xuM1UXPJD4AgYjVNvGQfj6CFHD4FCqwAojFIzDBPEsxZQLG71fGqZ
	9OElxNnIAkCCyr2J0S8D56qv1UlTlZI=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 54D83634C94;
	Fri, 24 May 2024 00:01:08 +0300 (EEST)
Date: Thu, 23 May 2024 21:01:07 +0000
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
Message-ID: <Zk-ukx7rh3kNMIRx@valkosipuli.retiisi.eu>
References: <20240418090825.624747-1-dan.scally@ideasonboard.com>
 <20240418090825.624747-4-dan.scally@ideasonboard.com>
 <Zk74ZZqn568-Wa3M@valkosipuli.retiisi.eu>
 <npqgtwqhpixoixikgrhzq3soqywfla3gmrx44t76idfiryycs7@qkfd4yphgv4q>
 <20240523094926.GA10295@pendragon.ideasonboard.com>
 <417b2d78-6233-4fd7-9b32-aa176938f682@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <417b2d78-6233-4fd7-9b32-aa176938f682@ideasonboard.com>

Hi Dan,

On Thu, May 23, 2024 at 12:22:45PM +0100, Dan Scally wrote:
> Hello
> 
> On 23/05/2024 10:49, Laurent Pinchart wrote:
> > On Thu, May 23, 2024 at 11:48:02AM +0200, Jacopo Mondi wrote:
> > > On Thu, May 23, 2024 at 08:03:49AM GMT, Sakari Ailus wrote:
> > > > Hi Daniel,
> > > [snip]
> > > 
> > > > > +
> > > > > +static int mali_c55_vb2_start_streaming(struct vb2_queue *q, unsigned int count)
> > > > > +{
> > > > > +	struct mali_c55_cap_dev *cap_dev = q->drv_priv;
> > > > > +	struct mali_c55 *mali_c55 = cap_dev->mali_c55;
> > > > > +	struct mali_c55_resizer *rzr = cap_dev->rzr;
> > > > > +	struct mali_c55_isp *isp = &mali_c55->isp;
> > > > > +	int ret;
> > > > > +
> > > > > +	guard(mutex)(&isp->lock);
> > > > > +
> > > > > +	ret = pm_runtime_resume_and_get(mali_c55->dev);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	ret = video_device_pipeline_start(&cap_dev->vdev,
> > > > > +					  &cap_dev->mali_c55->pipe);
> > > > > +	if (ret) {
> > > > > +		dev_err(mali_c55->dev, "%s failed to start media pipeline\n",
> > > > > +			mali_c55_cap_dev_to_name(cap_dev));
> > > > > +		goto err_pm_put;
> > > > > +	}
> > > > > +
> > > > > +	mali_c55_cap_dev_stream_enable(cap_dev);
> > > > > +	mali_c55_rzr_start_stream(rzr);
> > > > > +
> > > > > +	/*
> > > > > +	 * We only start the ISP if we're the only capture device that's
> > > > > +	 * streaming. Otherwise, it'll already be active.
> > > > > +	 */
> > > > > +	if (mali_c55->pipe.start_count == 1) {
> > > > Do you start streaming on the sensor when the first video node does?
> > > > 
> > > > This means that frames may be lost. E.g. the IPU6 ISYS driver only starts
> > > > streaming on the sensor once all video nodes of the pipeline have been
> > > > started.
> > > How would you ever know which nodes will be started ?
> > That can be done with link setup. Any video device that has an active
> > link to the ISP would need to be started.
> 
> 
> So if you don't want to stream data from one of the two capture nodes, you'd
> need to disable the link between it and the resizer? That seems quite
> clunky. Does it matter if one of them starts a frame or two later? As
> opposed to both of them starting in sync a frame or two later?

Video frames on a given queue are lost due to the driver implementation.
I might consider that to be a driver bug.

It's also true that some use cases could also benefit from the behaviour
but on regular CSI-2 receivers that's probably quite rare. We'd need
additional APIs to be able to convey the desired behaviour to the drivers.

-- 
Regards,

Sakari Ailus

