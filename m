Return-Path: <linux-media+bounces-18579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D87A986937
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 00:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7CAB1F24B21
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 22:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EF0154BF5;
	Wed, 25 Sep 2024 22:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e7tfeSU+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C53E56A
	for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 22:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727303904; cv=none; b=qOVNgJE+gAtaE5W8ZBUVe1IBRlElxCRc3JREWbnk47dvOmN4qNiseUdJx613kX/7ra7jgjmWhVTj82ayeT7UmJttBQ+DUJoAniarkD+TOWZ944eXO7lYas2mLePgQqmFn75zd5SJW/PBdaJ6vyI2ONkwLRxDx9pptOz0hCd/38o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727303904; c=relaxed/simple;
	bh=G8exd1NnFsB5ReUc3RWHgiZWKY+4CBwK5uR8NGkPF58=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YASbRL2VZO2EKo27h29LvU6USiQpJ3rB3Cs+0MlqGn8FJfIXmzss+uD5p1dE1jIvMut5kbnHw4mMgNAu0N3QB/Bq2md46CFCRdviBLOAdrkwflspJXCi75EPgSifvMXLcbvTlqV/plxkYWejCSCwLtU6QeMYzbLLsDOfr/S5ax0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e7tfeSU+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC1AC4CEC3;
	Wed, 25 Sep 2024 22:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727303903;
	bh=G8exd1NnFsB5ReUc3RWHgiZWKY+4CBwK5uR8NGkPF58=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=e7tfeSU+ges1DxuWAtv6W+MfstZzI/JVybD7MtRGGz0P+9lpPgHd3SBJrZnel1n19
	 WOoifeTKj4/7e7BTwf40Q7l8guq3Y4Ba7H7B9oPBCIyWYpDoZpI+Dj0RTndqry0MB5
	 Lp5OKb5pTPIjdCIFfLYogkPdRpAKEPXcx2hDGb5nv683IOE5APKGSoVlahj8oKm2+H
	 0y94GGPSvPjB972MLrsBmYQsQNOUUZgy1cQo8LqmSGXCs5uOX07CdQVGiVoBCCaicN
	 QLv8fn0aYCY41oNOiuMEn1y93xNm+xedBlC6Py3dRJsCqklYgrbyoIEwe/YxTFVTLh
	 KD5muXbTAQH9A==
Date: Thu, 26 Sep 2024 00:38:15 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>, Linux Media Mailing List
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
Message-ID: <20240926003815.6537fdbb@foz.lan>
In-Reply-To: <20240925195653.GJ30399@pendragon.ideasonboard.com>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
	<20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
	<bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
	<20240918092454.21884920@sal.lan>
	<20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
	<20240918132323.2a384f87@sal.lan>
	<20240925195653.GJ30399@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 25 Sep 2024 22:56:53 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> On Wed, Sep 18, 2024 at 01:23:23PM +0200, Mauro Carvalho Chehab wrote:
> > Em Wed, 18 Sep 2024 11:30:20 +0200 Sebastian Fricke escreveu:  
> > > On 18.09.2024 09:24, Mauro Carvalho Chehab wrote:  
> > > > Em Tue, 17 Sep 2024 14:52:19 +0200 Hans Verkuil escreveu:  
> > > >> On 9/17/24 11:17 AM, Sebastian Fricke wrote:    
> > > >> > Greetings,
> > > >> >
> > > >> > I remember that we wanted to still define a couple of processes for the
> > > >> > multi-committer model for which we hadn't have the time on the media
> > > >> > summit. Just would like to gather who would be interested to meet for
> > > >> > that, where we meet (probably LPC venue) and when (Laurent just told me
> > > >> > that Friday is probably a good slot for that).    
> > > >>
> > > >> Can you refresh my memory which processes need more work?    
> > > 
> > > Well I basically remember that we had a bunch of topics in our meetings
> > > that we wanted to skip in order to talk about them here.
> > > We looked at the documentation from DRM and wanted to think about
> > > equivalent policies for media.
> > > https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-misc.html#where-do-i-apply-my-patch  
> > 
> > Thanks for the pointer. Yeah, examples from other trees can be helpful when
> > improving media developers profile and writing the committers agreement,
> > even when they have a message that it is just the opposite of what we
> > we want, like this (from DRM-misc ruleset):
> > 
> > 	"Since even a broken driver is more useful than no driver minimal
> > 	 review standards are a lot lower."
> > 
> > In this particular case, for instance, as discussed at media summit, we'd
> > like to have high quality standards for stuff under drivers/media. After
> > all, we do use drivers/media/staging for low quality drivers. 
> > 
> > It it worth mentioning that committers shall not merge low quality drivers
> > nor patches for staging. If ever needed, those should be done via PRs or
> > be explicitly authorized by maintainers.  
> 
> Do you mean new drivers only, or also patches for existing staging/
> drivers ?

New drivers only. Patches for drivers already at staging can go via
committers tree.

> 
> > > Also there were topics like how to handle backports.   
> > 
> > We don't handle backports on media tree. This is up to stable maintainers.
> > Basically, we follow stable rules to the letter:
> > 
> > 	Documentation/process/stable-kernel-rules.rst
> > 
> > E. g. patches that require backports shall have the proper meta-tags 
> > (specially cc: stable and  fixes:).   
> 
> Sebastian may have meant backmerges.
> 
> > Also, we're not implementing multi-committers for fixes, just for next.
> > 
> > So, fixes shall follow the normal flow: they should be sent via PR.  
> 
> I see there's a fixes branch in the media-committers tree, does that
> mean you have agreed with Hans and Ricardo that fixes will go through
> pull requests but be pushed there for visibility ? If so, thanks for
> that, I think it will improve the experience.

Hans and I are planning to push fixes at the media-committers tree, as it
allows CI to run those, but the goal here is not about visibility - it is
just to ensure that CI will execute tests on the merged patches. 
For committers and developers, the fixes workflow remains the same:
PRs for committers and patches for developers.

-

See, the main repository is hosted at linuxtv.org. We intend to avoid 
as much as possible rebases at the media tree at linuxtv.org, on both
fixes and next branches.

The media-committers tree at fdo is focused on executing patches at CI
and should only be used by committers. All other developers should base 
their work at the repository stored at linuxtv.org[1].

[1] We are planning to have a "media" repository there, replacing the
    current "media-stage" tree.

See, the media-committers repository at fdo can be rebased. This might
happen, for instance, if we don't agree with some merge there during
our merge review or if other committers disagree with merges. On such
case, the not-accepted patches will be dropped via rebase and the patches
will need to be reviewed the normal way.

> > > > I have the same doubt. As discussed during the summit, Hans and I had some
> > > > discussions yesterday, to address a few details. For both of us the process
> > > > sounds well defined.    
> > > 
> > > I know that we scraped a lot of topics in the meeting at the media
> > > summit and I am not sure about the scope you discussed with Ricardo
> > > yesterday. So, we don't have to meet if you feel like we covered
> > > everything, just wanted to use the opportunity as long as we are all in
> > > the same place.  
> > 
> > I guess we covered everything that are needed for now. If required,
> > further discussions may happen later via e-mail and/or virtual meetings.  

Thanks,
Mauro

