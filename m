Return-Path: <linux-media+bounces-41215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 300C0B39488
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 09:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2E2E464CF5
	for <lists+linux-media@lfdr.de>; Thu, 28 Aug 2025 07:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DFB28C84C;
	Thu, 28 Aug 2025 07:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpHkAJDP"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F31427B35F
	for <linux-media@vger.kernel.org>; Thu, 28 Aug 2025 07:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756364739; cv=none; b=Ai5MCfNDq4gX1cszMyZNlLPTjCOujyDIJi/73CWpvR2KOY69Q9x3YEVzsKBfroGPRiiQv59aE7Q89BQbjzFUg2Zce5NHiGUqiMQA1wbR8pPNqu+aHfiT+VVc4v9NeCVUEBGCHzXrGghzTjkxGp/+5C94DYHa+rIkNGlqI7DiLy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756364739; c=relaxed/simple;
	bh=Gl6s0NdFBF655FXwiS4HbIwDGSr58Ot18hPFIRAZkro=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B0ARTl6Rtmr3B2ott0krNeUev952NOU/UewoccnZBYqCpOspXNxdQbLExQ27+kLYSsSdgpR/rWV2CZtCMiMbG4+7mOwqUBMMUNtny6P1OHl2u/eE2hboQt9AUYSeBXFRvjsfNh5TPahkpKhk0656zRvZXIgEBMn/SGxk0gIBCcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpHkAJDP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB50CC4CEEB;
	Thu, 28 Aug 2025 07:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756364738;
	bh=Gl6s0NdFBF655FXwiS4HbIwDGSr58Ot18hPFIRAZkro=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NpHkAJDP5gYyrMuOfRp1FYzfgBGHwLNtwbn0+1/mJfQBeT6zd6cpr/rZmxL6vGBxf
	 WTJ5/MEHW7nIuhZ10b1gFBB/AlnNZEU6LNRFetKb2pRcooSqpK2iYwmteXmEy/QGkP
	 EldUN8Ww0vX191oKpv6IEiV5zAGUp/XbP1te0HTbBrD3jdVgjpob4S0UKcpUYT1G/7
	 av3MJJf/Z0mokIrq2QGBDaSGUidZEUcT5YrrRRoS3IBx7geCMHp9V/SVnpllQNm+jM
	 VUc5jvpXQkPiSL/NxAgDNt1YKBldS3lnlVVKPj1S6NTlylWu6LcBySRInUb8J3ZEUH
	 JjFGjv1sRK1Tg==
Date: Thu, 28 Aug 2025 09:05:34 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl
Subject: Re: [GIT FIXE FOR 6.17] Drop redundant pm_runtime_mark_last_busy()
 and lt6911uxe fix
Message-ID: <20250828090534.7ed73f64@foz.lan>
In-Reply-To: <aK7aeg47a3riJNav@valkosipuli.retiisi.eu>
References: <aJxVF0MpevVhsH0H@valkosipuli.retiisi.eu>
	<20250827110528.11f21dfb@foz.lan>
	<aK7aeg47a3riJNav@valkosipuli.retiisi.eu>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 27 Aug 2025 13:14:18 +0300
Sakari Ailus <sakari.ailus@iki.fi> escreveu:

> Hi Mauro,
> 
> On Wed, Aug 27, 2025 at 11:05:28AM +0200, Mauro Carvalho Chehab wrote:
> > Em Wed, 13 Aug 2025 09:04:23 +0000
> > Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> >   
> > > Hi Hans, Mauro,
> > > 
> > > Here are the patches to drop the redundant pm_runtime_mark_last_busy()
> > > calls in drivers and an lt6911uxe fix that should also be merged to 6.16.  
> > 
> > Please fix your description. The above is not clear and doesn't tell
> > the hole history.
> > 
> > In this specific case, I would expect the description to be
> > similar to this one:
> > 
> > 
> > 	Hi Hans, Mauro,
> > 
> > 	Please pull for:
> > 
> > 	  - drop the redundant pm_runtime_mark_last_busy() on rkvdec driver;
> > 	  - fix an error handling in probe at rkvdec driver;
> > 	  - fix an issue affecting lt6911uxe/lt6911uxc related to CSI-2
> > 	    GPIO pins at int3472.
> > 
> > 	The fix for lt6911uxe/lt6911uxc is against drivers/platform/x86/intel,
> > 	and contains an A-B from one of X86 PLATFORM DRIVERS maintainers.
> > 
> > We need to have those at the merge requests as well, as we're using them
> > to generate PR summaries.  
> 
> That sounds entirely reasonable. Still, isn't this kind of more detailed
> information already available on the patch subject lines? Could those be
> used instead? The message in the PR usually describes the patches with less
> detail.

It is available, but:

1. a short description helps reviewing the patchset;
2. If anyone uses the affected devices and have those bugs, the PR 
   summary is the only e-mail he needs to check before deciding to
   pick or not the series;
3. it is also used when maintainers send upstream PRs;
4. the upstream PR summary can also be used by distro packagers to
   detect if a sent patch fixes or not existing open bugs.

By not doing it, it means that people that could be using the hardware
will have more problems to get patches to addres their issues. 

It also means that maintainers need to open all the patches in
the series before sending a patches upstream to generate the PR description,
which doesn't scale, specially on a multi-committers scenario.

On this particular case, there was not much efforts, as this was a 
small series, but when sending a PR with hundreds of patches, not 
having proper descriptions is a nightmare for maintainers.

Thanks,
Mauro

