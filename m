Return-Path: <linux-media+bounces-18637-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EA89874BF
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 15:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B23881C225E2
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 13:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DF851C5A;
	Thu, 26 Sep 2024 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q0uO49t5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607AB1C6B2
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727358562; cv=none; b=sXCBONq/jqNhRjjvkqmG4sww9CZNhejEa20Jr5QeSYrIu+RHYH1Kr1aYAcyGpBPvOc1ai/1O5/ETmACB1/QNZQ7QkN/lcr3I1mb3h8czeEiX6RWzjkR7WeJcYAhUs+b5lU5olU0XzNLAKv5PeZVzQoS8GUqLOyWHH3K/zibfOZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727358562; c=relaxed/simple;
	bh=RGJSaa54QmQz0QO4kMCWsru8WtcECabQ4OzZcmMCiF4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mtu/x8Wi+kbh1n1yqHzedbkfj9V2vkIzxShc0R/UdXxJ+/xbwcd99zW7eoM6mFvqnDuUYK38qFTVrsLae9wDkPRrRORCN1uksa5LFAJEWXxzCWrfggDPNDoB3RomYTBcedcbb2COlMFq0d0qDyEG0I6JoBpe2Sb4dmhNC+2oQbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q0uO49t5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D36C4CEC5;
	Thu, 26 Sep 2024 13:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727358562;
	bh=RGJSaa54QmQz0QO4kMCWsru8WtcECabQ4OzZcmMCiF4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=q0uO49t5waPJah1Imen0QMTSlGWkC/D3WGwR/7s2wK4f8vyluDR3mpkNfZCDCd4Kp
	 CzWfEFaDRA/VFGQlS+rao6hCmJCBNd8nKFveHxewPBunU0OfgJgacJBk8ox9ItpwUB
	 W5nzCDa+/LKnbKpxb/Nbpuhg7knLps9l80ehQs3EU8IMlxT20Hd+dTdKQMNUS+Z/5m
	 hFDecqNCEwUh0zHNRFR7I/T5kZQheqDTzQ5MJVbPuc8vh759n3yi493Uyz8zbHheYr
	 2w5IvgEB2n4jzQwmDuXU1LVUo9P9dhOvPc83Xr1a8NjzRAfJ7vMs3vcnM7FSy+FIwR
	 8b0gMhyBOHIww==
Date: Thu, 26 Sep 2024 15:49:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Martin Hecht <martin.hecht@avnet.eu>, Tommaso Merciai
 <tomm.merciai@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Michael Tretter <m.tretter@pengutronix.de>, Alain
 Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>, Steve Cho
 <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Hidenori
 Kobayashi <hidenorik@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, Devarsh Thakkar
 <devarsht@ti.com>, r-donadkar@ti.com, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Mehdi Djait
 <mehdi.djait@linux.intel.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <20240926154913.1edd70a9@foz.lan>
In-Reply-To: <20240926120200.GA12873@pendragon.ideasonboard.com>
References: <20240918092454.21884920@sal.lan>
	<20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
	<20240918132323.2a384f87@sal.lan>
	<20240925195653.GJ30399@pendragon.ideasonboard.com>
	<20240926003815.6537fdbb@foz.lan>
	<20240926103002.GB21788@pendragon.ideasonboard.com>
	<20240926130615.5397cc30@foz.lan>
	<20240926111307.GG21788@pendragon.ideasonboard.com>
	<20240926133516.368a8367@foz.lan>
	<3081c577-46a2-4f03-a5c3-a2c7a1f52859@xs4all.nl>
	<20240926120200.GA12873@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 26 Sep 2024 15:02:00 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> > It doesn't have to be perfect from the start, and as long as we continuously
> > improve the process, I'm happy.  

As Sakari pointed, CI will prevent a lot of possible cases.

> Incremental improvements are crucial. For this reason, I would like
> every rebase to be discussed with core committers, so that we all
> understand the issues and have a change to improve the tools to ensure
> they won't happen again (malicious behaviour is a different case). Can
> we try that, and handle rebases with a consensus-seeking process ?

Good idea! Yeah, it makes sense to discuss it to improve the process
after the facts. As we're planning to do periodic meetings with committers,
this can be added to the agenda of the next meeting when this happens for
committers, core committers and maintainers to be aware of what happened
and how this can be prevented in the future.

Thanks,
Mauro

