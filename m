Return-Path: <linux-media+bounces-18636-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C45987335
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 14:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 342681F246A2
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E5D171088;
	Thu, 26 Sep 2024 12:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YPzxFpyq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188F115DBA3
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 12:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727352127; cv=none; b=FrBZxFBzOxGWA4jvYfAzrqdD0xKMdSIkD2+xl58UvLFW40Hl1Sxxuu7oNIAY9nl+fj6Tl/UkCJx8GGKnxqiIaCjhm2W0cZDEfQfo27MAKKNiohgiEXjYdA/JH9Puv3i7VDwiZv3k7g2BwMRV3vm0VMfpFnbVbI/Q77YARx9Erck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727352127; c=relaxed/simple;
	bh=MfEcY38eJBlHpT8lELz9Nkd0l77jiy435CCv/wqbfhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SmjmvpBa8z0mt6Lq2rtzsVIXewGZ/ELmhKPXXZipWl+TCoQNiQltM3SVnc1UUMB3HUEB7geYQ1Cnh8xAWe2MMstKG9XMSpsNfs6RKUXoo/xi8hBx+ALR0rTv2FdTQoTcIm+RFBU7rnby6azjU5fyXWbKicDfqzv79Dkf70l4/lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YPzxFpyq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 383C7163;
	Thu, 26 Sep 2024 14:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727352035;
	bh=MfEcY38eJBlHpT8lELz9Nkd0l77jiy435CCv/wqbfhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPzxFpyqPZ8MfO5gzeFG+/ukXJLf2BGEabrtxSMabgMnXQy45SEusSwYQ1JWtYzlw
	 qct6c3Hv4sqo9NUdqLwrdTMmUGVuum4LEmDqx8iad+jg4azqFGYg9DgJh9kliFryWj
	 nmavaeQ86FWo2NteDpkHNjbaEO+GtPNWgsUTnS8E=
Date: Thu, 26 Sep 2024 15:02:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <20240926120200.GA12873@pendragon.ideasonboard.com>
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
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3081c577-46a2-4f03-a5c3-a2c7a1f52859@xs4all.nl>

On Thu, Sep 26, 2024 at 01:43:10PM +0200, Hans Verkuil wrote:
> On 26/09/2024 13:35, Mauro Carvalho Chehab wrote:
> > Em Thu, 26 Sep 2024 14:13:07 +0300 Laurent Pinchart escreveu:
> > 
> >>>>> See, the media-committers repository at fdo can be rebased. This might
> >>>>> happen, for instance, if we don't agree with some merge there during
> >>>>> our merge review or if other committers disagree with merges. On such
> >>>>> case, the not-accepted patches will be dropped via rebase and the patches
> >>>>> will need to be reviewed the normal way.    
> >>>>
> >>>> Things that haven't reached a consensus should not be merged in the
> >>>> first place, and in the rare cases where it happens, a revert is fine.
> >>>> Rebases should be kept for situations where no other option is possible.  
> >>>
> >>> I guess we agree to disagree.  
> >>
> >> I certainly disagree, yes. I won't comment further, I think you know my
> >> position well enough, and I'm certain the majority of the community is
> >> also against rebases.
> > 
> > Nobody like rebases, including subsystem maintainers. A rebase means

I'm glad we at least agree on that :-)

> > lots of manual work that we would very much prefer not to do it.
> > 
> > You don't want rebases, fine. There shouldn't be any rebases if every
> > committer ensures that each patch they merged were properly 
> > reviewed/accepted and have the proper license and tags, including
> > SPDX, SoBs, A-B, R-B, etc.
> > 
> > Yet, if a committer screws up somehow (intentionally or not), subsystem 
> > maintainers will handle it the way they think it is the best, deciding 
> > either to rebases or revert, depending on the case.
> 
> We just need to have the rebase option as a last resort. The CI should help
> to prevent rebases, and if we do need to rebase, we need to look whether a
> better/new check should be added to the CI to prevent that in the future.
> 
> Especially in the beginning things may slip through (I made mistakes when I
> started as co-maintainer!), but let's just learn from the mistakes, improve
> the CI and processes, and after 2-3 kernel cycles we take another look where
> we are.
> 
> It doesn't have to be perfect from the start, and as long as we continuously
> improve the process, I'm happy.

Incremental improvements are crucial. For this reason, I would like
every rebase to be discussed with core committers, so that we all
understand the issues and have a change to improve the tools to ensure
they won't happen again (malicious behaviour is a different case). Can
we try that, and handle rebases with a consensus-seeking process ?

> So let's all relax, take a nice cup of tea/coffee/wine/beer/whisky/etc. and
> raise it to Ricardo for doing the great work on the CI system, since that was
> a very important step forward!

Ricardo has done an amazing job there, I'm really grateful. Sebastian
also deserves big kudos, and we should be thankful for all the other
contributions. I'm personally thankful to you and Mauro for agreeing to
move forward. There's no secret that I'd like a faster pace (possibly
due to all the accumulated frustrations over the years), but there is
clear progress and I want to acknowledge that.

-- 
Regards,

Laurent Pinchart

