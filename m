Return-Path: <linux-media+bounces-24621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CC7A0936E
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 15:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B399C163292
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 14:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34848210F50;
	Fri, 10 Jan 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5t4E4w4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B8820C017;
	Fri, 10 Jan 2025 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736519303; cv=none; b=C1s3RW3RYjHts+5S02YkfXyjNO2vUY+Jcg5hjkiEqkgf/eyNEcVpxgtSdAPp2wTOqN5cCuAlMyp9ml5l3XXywczbNO7FcwLoacCxAx0RllIcPewWp0VUqeLfsNW8Lo8dBScOcYPNpZ+GZLFzqPFr0MAkUC6W5398A4VJkhHoB6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736519303; c=relaxed/simple;
	bh=F+pRqybOv0EfGT0TG8OreId9zOD5mPSZO+2Pu0L++UI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pMRjlN/88GvH6WDbdzfWgD6ceQiGbunjEDAaW+Cg+vOAuC2hY+1kzEEq6FSiVVOAllTjj082b+2N3p+LjB5ocN3UttIfjCmRxrZANp/SBDrOYs+EV4VWbpmbh8rHG0rDYqP4WhqmIC+zA3ZCdORBBKu/nSySTrJbxkomY1ffw7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5t4E4w4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC34C4CEE0;
	Fri, 10 Jan 2025 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736519303;
	bh=F+pRqybOv0EfGT0TG8OreId9zOD5mPSZO+2Pu0L++UI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u5t4E4w4hmmlWCg5X8zLnMDjGObdeJf2B/92elesFrEpf6tIYAfjaq9aG3HlpFgO5
	 FFf7Gu8YgokXqTBvCvDQLWh0JgQQh8+50XbsMAL7nQcqbp+De2+PXLOCeVEGS4eiLy
	 M9XBNF3N5CxL0i9KmZVtmJT/+V+ureB5vs/5SDXBUnpfd6H8kWGP0nBazOiK2pBjQd
	 bm3aQ/6ipo6lJO3CplNeliC9B/JDZjEtBOAhE8vbDJQ2G2mL/5BAeRCgbIk3Wy9l+e
	 UfTGf9nOiIYcUfi/e7awe1eEDWw0VhB0n0W+n/naY0QO/N8d32U5BPg109SwjdSMwn
	 8Jjp0EpJBPoXw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tWFzs-000000005Lx-16wQ;
	Fri, 10 Jan 2025 15:28:24 +0100
Date: Fri, 10 Jan 2025 15:28:24 +0100
From: Johan Hovold <johan@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jianhua Lu <lujianhua000@gmail.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <Z4EuiPEw8mvDQ2gv@hovoldconsulting.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <Z3_nCPk_g8znto4A@hovoldconsulting.com>
 <64f8bebd-35e1-c743-b212-e1a3292bade2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64f8bebd-35e1-c743-b212-e1a3292bade2@quicinc.com>

On Thu, Jan 09, 2025 at 11:18:29PM +0530, Vikash Garodia wrote:
> On 1/9/2025 8:41 PM, Johan Hovold wrote:
> > On Thu, Dec 12, 2024 at 05:21:49PM +0530, Dikshita Agarwal wrote:
> >> Initialize the platform data and enable video driver probe of SM8250
> >> SoC. Add a kernel param to select between venus and iris drivers for
> >> platforms supported by both drivers, for ex: SM8250.
> > 
> > Why do you want to use a module parameter for this? What would be the
> > default configuration? (Module parameters should generally be avoided.)

> This was discussed during v4 [1] and implemented as per suggestion
> 
> [1]
> https://lore.kernel.org/linux-media/eea14133-2152-37bb-e2ff-fcc7ed4c47f5@quicinc.com/

First, the background and motivation for this still needs to go in the
commit message (and be mentioned in the cover letter).

Second, what you implemented here is not even equivalent to what was
done in the mdm drm driver since that module parameter is honoured by
both drivers so that at most one driver tries to bind to the platform
device.

With this patch as it stands, which driver ends up binding depends on
things like link order and what driver has been built a module, etc. (as
I pointed out below).

> > Why not simply switch to the new driver (and make sure that the new
> > driver is selected if the old one was enabled in the kernel config)?

> Its about the platform in migration i.e sm8250. Since new driver is not yet
> feature parity with old driver, choice is provided to client if it wants to use
> the new driver (default being old driver for sm8250)

This should be described in the commit message, along with details on
what the delta is so that the reasoning can be evaluated.

And I'm still not sure using a module parameter for this is the right
thing to do as it is generally something that should be avoided.

> >>  static int iris_probe(struct platform_device *pdev)
> >>  {
> >>  	struct device *dev = &pdev->dev;
> >> @@ -196,6 +224,9 @@ static int iris_probe(struct platform_device *pdev)
> >>  	u64 dma_mask;
> >>  	int ret;
> >>  
> >> +	if (!video_drv_should_bind(&pdev->dev, true))
> >> +		return -ENODEV;
> > 
> > AFAICT nothing is preventing venus from binding even when 'prefer_venus'
> > is false.
> > 
> >> +
> >>  	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> >>  	if (!core)
> >>  		return -ENOMEM;

Johan

