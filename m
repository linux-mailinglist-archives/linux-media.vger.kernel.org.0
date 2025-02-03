Return-Path: <linux-media+bounces-25532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D97A25497
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 09:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A7FB160421
	for <lists+linux-media@lfdr.de>; Mon,  3 Feb 2025 08:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9281B1FC0FA;
	Mon,  3 Feb 2025 08:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XJD1AePS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D659D1D7E50;
	Mon,  3 Feb 2025 08:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738571938; cv=none; b=oetnAs9NABpTjk5SPHi27TeHjWdnsDphqcM6jpzT63dESggPpC8XkcvgVtamMOPj2jZA5b3zuZVerDsYAVhlafVpJpz4UdRg1DHv5qvcCVouCx0Ri3cPibfn+VvA5ATfzOFDNbkvimOuok7M3qi2zBC96Sl7wSGx9567dEA6AH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738571938; c=relaxed/simple;
	bh=tn2D/VXU3gO/10cPKSVc8ExofoOyoDNBmyGrz4AHorQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LgC9ALmLcfFouFN4Tbmhymdcw9ZhrW5GHzj90wyZuz2OZuQdsfsj4xdelz/ephU9auzFsCkJhiorVhBJNkWwCCINqVHhY3fQ/qissI9DywuPM19j9qKM0KXdt3v4KQsRGxYsHMgcwB8qlxcfo+AGzkslewWZMsKmUi62zSnO7aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XJD1AePS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D083C4CED2;
	Mon,  3 Feb 2025 08:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738571937;
	bh=tn2D/VXU3gO/10cPKSVc8ExofoOyoDNBmyGrz4AHorQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XJD1AePSGYwbioAb3WD4/DaRdqVJx86k9Bzfr76DIsjvOVKDl3UpC5Z8mWTjmylg1
	 Bc8CUIz4LWEhU57kSly8ZnU3sD93k7vhpuLy6uhC+5wCl6r2/J1qDdCoBdXqlJ1+IM
	 VvqBRJGwX3lj5UtIu1SbfbWbd+X7nMly6v/Y6k97/QtNO7ldRbmZIEzi+WCWAWGt4K
	 UJAame1Rzn1JAA+OwZ60w93WeKw23eJPHitaf/F476ENkNSxKWQeR/Qdy9xG6KlEm/
	 NKYiKx6QzF4osT3Q3fr1gBw0FK5yvI0EO5bQvsZVyDw45BTFsgSFOTQ089FiJxE5QG
	 RQFXHiWUgAdzA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1teryu-000000006Yr-03dx;
	Mon, 03 Feb 2025 09:39:00 +0100
Date: Mon, 3 Feb 2025 09:39:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
Message-ID: <Z6CApNuSlPGvVL2k@hovoldconsulting.com>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <Z3_nCPk_g8znto4A@hovoldconsulting.com>
 <64f8bebd-35e1-c743-b212-e1a3292bade2@quicinc.com>
 <Z4EuiPEw8mvDQ2gv@hovoldconsulting.com>
 <24334fb8-4d83-eb06-aee3-dfe1f8e4937b@quicinc.com>
 <552972B8-1ACA-4243-A8E3-8F48DAF39C5C@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <552972B8-1ACA-4243-A8E3-8F48DAF39C5C@linaro.org>

On Fri, Jan 10, 2025 at 08:01:21PM +0200, Dmitry Baryshkov wrote:
> On 10 January 2025 19:30:30 EET, Dikshita Agarwal <quic_dikshita@quicinc.com> wrote:
> >
> >
> >On 1/10/2025 7:58 PM, Johan Hovold wrote:
> >> On Thu, Jan 09, 2025 at 11:18:29PM +0530, Vikash Garodia wrote:
> >>> On 1/9/2025 8:41 PM, Johan Hovold wrote:
> >>>> On Thu, Dec 12, 2024 at 05:21:49PM +0530, Dikshita Agarwal wrote:
> >>>>> Initialize the platform data and enable video driver probe of SM8250
> >>>>> SoC. Add a kernel param to select between venus and iris drivers for
> >>>>> platforms supported by both drivers, for ex: SM8250.
> >>>>
> >>>> Why do you want to use a module parameter for this? What would be the
> >>>> default configuration? (Module parameters should generally be avoided.)
> >> 
> >>> This was discussed during v4 [1] and implemented as per suggestion
> >>>
> >>> [1]
> >>> https://lore.kernel.org/linux-media/eea14133-2152-37bb-e2ff-fcc7ed4c47f5@quicinc.com/
> >> 
> >> First, the background and motivation for this still needs to go in the
> >> commit message (and be mentioned in the cover letter).
> >> 
> >> Second, what you implemented here is not even equivalent to what was
> >> done in the mdm drm driver since that module parameter is honoured by
> >> both drivers so that at most one driver tries to bind to the platform
> >> device.
> >> 
> >> With this patch as it stands, which driver ends up binding depends on
> >> things like link order and what driver has been built a module, etc. (as
> >> I pointed out below).
> >> 
> >>>> Why not simply switch to the new driver (and make sure that the new
> >>>> driver is selected if the old one was enabled in the kernel config)?
> >> 
> >>> Its about the platform in migration i.e sm8250. Since new driver is not yet
> >>> feature parity with old driver, choice is provided to client if it wants to use
> >>> the new driver (default being old driver for sm8250)
> >> 
> >> This should be described in the commit message, along with details on
> >> what the delta is so that the reasoning can be evaluated.
> >> 
> >> And I'm still not sure using a module parameter for this is the right
> >> thing to do as it is generally something that should be avoided.
> >> 
> >I understand your concern of using module params.
> >I will modify it to rely on Kconfig to select the driver (suggested by
> >Hans) instead of module param.
> 
> Please don't. This makes it impossible to perform side-by-side
> comparison.

Why? You can have two kernel builds and run the same tests. And you
obviously cannot run iris and venus on the same hardware at once anyway.

> Also as venus and iris drivers are not completely
> equivalent wrt supported platforms, distributions will have to select
> whether to disable support for older platforms or for new platforms:
> Kconfig dependency will make it impossible to enable support for both
> kinds.

You shouldn't have both enabled. The only reason for keeping support
for the same hardware in both drivers is that the iris support is
incomplete and considered experimental. No one should enable that except
for development and evaluation purposes until the driver is up to par.
And then you drop support from the old driver along with the config
option.

Johan

