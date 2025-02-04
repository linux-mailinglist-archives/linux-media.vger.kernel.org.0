Return-Path: <linux-media+bounces-25630-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CCFA26E80
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 10:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36FFC166695
	for <lists+linux-media@lfdr.de>; Tue,  4 Feb 2025 09:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5922B209F4A;
	Tue,  4 Feb 2025 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naZ5rfyq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EB718784A;
	Tue,  4 Feb 2025 09:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661506; cv=none; b=kvYOKGvId6BDAxj84Ua4xerwhWMhk60PdymVkl2X41y5kXw6edVw/UxB25qXNxRmBHBdJaTwEC3Nsy75x4UpPLtO2wdRT2idUN4jQk59zvvO7j54m6V+aDQOaFglyeFjxzbOgvz/xnXTgvcqNLNzpkbKMJZfPegpPaTYK6FTRh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661506; c=relaxed/simple;
	bh=OfSjjEDlFSr4Tneahj5ga67WISKYtolfFhaQOy1EYi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8f0DHhvWDthCp5JCthvmdDAobVfR4ReSC5vV3syPJU7+LFbZyfVwQNaR1+7s3wN//FiUYDy0sdbV2V0KuM0eyrgL3R02c6z9n/pTJH8bJZ+arB5+c3a6eZoxj2e+Q6w/+BWJWdR4DQoheGvJaWLypGg5Q9GDBZSLsNngv/sZsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=naZ5rfyq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09319C4CEDF;
	Tue,  4 Feb 2025 09:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738661506;
	bh=OfSjjEDlFSr4Tneahj5ga67WISKYtolfFhaQOy1EYi4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=naZ5rfyq28gAWLr188rgx5miMbHlHkuCkziSEWNewm6RwitUzyD41N6Wu+BnEKt/b
	 qv5pjxYxf4iH0kwOGcsuIVR87YhfWLEEKVE7vHLgTc1bl7k1dz4OwpInw9NlH60TEW
	 xt0EbVp6YaA52S4IKYelN+aL62lbDM0W6oAEvxC1USqcsN4cOw3wUy2RPzoswA/GBv
	 R7VxUSW0UXcVi3qnQH0gZzR8H+QCOYvUZeRqev7UmSTgRTs12MvbU4q/5EF/1VjUuf
	 Ur9pSmUdxw4eFzlXF7F7alwicNJfiIAYt7h4+vCXfVROc7RbhzOK66cNrKQLw1kXfn
	 zeYU6rN7gYNgg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tfFHZ-000000007wi-1X0q;
	Tue, 04 Feb 2025 10:31:50 +0100
Date: Tue, 4 Feb 2025 10:31:49 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	quic_vgarodia@quicinc.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, p.zabel@pengutronix.de, hverkuil@xs4all.nl,
	sebastian.fricke@collabora.com, bryan.odonoghue@linaro.org,
	neil.armstrong@linaro.org, nicolas@ndufresne.ca,
	u.kleine-koenig@baylibre.com, stefan.schmidt@linaro.org,
	lujianhua000@gmail.com, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
Message-ID: <Z6HehbKL88LW1lxC@hovoldconsulting.com>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
 <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>
 <Z6B822-6UTxQfX46@hovoldconsulting.com>
 <tqbm672pi223ipcw7btiemlb745weeeiy4gnazzeghozhq2emj@wppbkms6hir5>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tqbm672pi223ipcw7btiemlb745weeeiy4gnazzeghozhq2emj@wppbkms6hir5>

On Mon, Feb 03, 2025 at 05:16:50PM +0200, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 09:22:51AM +0100, Johan Hovold wrote:
> > On Fri, Jan 31, 2025 at 10:44:28AM -0800, Abhinav Kumar wrote:

> > > Solution: If the user prefers iris driver and iris driver has not probed 
> > > yet, and if venus tries to probe ahead of iris we keep -EDEFERing till 
> > > iris probes and succeeds. Vice-versa when the preference is venus as well.
> > 
> > This sounds wrong too.
> > 
> > Look, first you guys need to explain *why* you want to have two drivers
> > for the same hardware (not just to me, in the commit message and cover
> > letter).
> >
> > That's something that really should never be the case and would need to
> > be motivated properly.
> 
> I think it has been written several time (not sure about this commit):
> to provide a way for a migration path _while_ people are working on Iris
> features. Being able to A/B test Venus and Iris drivers and to report
> possible regressions or lack of those on the common platforms supported
> by those (sm8250 at this moment).

You don't need a module parameter for that.

And we're still waiting to hear the answers to all of Hans' questions. I
still haven't seen anyone explaining why any of this is needed. You
could have just continued letting Venus support 8250 so presumably there
is some benefit in using Iris instead. Which? And is that potential
benefit important enough to not just wait until Iris is up to par
feature wise?

I'm sure you have some answers, but you need to provide them as part of
the series.

> > Second, if the reasons for keeping both drivers are deemed justifiable,
> > you need to come up with mechanism for only binding one of them.
> > 
> > I already told you that module parameters is not the way to go here (and
> > the msm drm driver's abuse of module parameters is not a good precedent
> > here).
> > 
> > If this is a transitional thing (which it must be), then just add a
> > Kconfig symbol to determine which driver should probe. That's good
> > enough for evaluating whatever needs to be evaluated, and doesn't
> > depend on adding anti-patterns like module parameters (and helper
> > modules for them).
> 
> No, Kconfig complicates A/B testing. What you usually want to do is to
> boot a kernel, then go over a bunch of files testing that they work with
> both drivers. Kconfig implies booting abother kernel, etc.

No, I'm pretty sure you'd even want to reboot in between so as not to
rely on state left behind by the other driver.

Unbinding and rebinding drivers is not part of any normal work flow
expect possibly during development. And a developer can easily compare
Venus and Iris for 8250 without a module parameter too.

Johan

