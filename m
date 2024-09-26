Return-Path: <linux-media+bounces-18628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9CC9872A0
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 13:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE857B2B706
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 11:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D601AF4D8;
	Thu, 26 Sep 2024 11:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r6OSB6ts"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42871AE86B
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 11:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727349193; cv=none; b=kdjzvn+TAIc0UJ2h5kA5vqW4CTCExJDfgJY+yndV8wnMkfrkDkWYAt3Dr/rX8opQoaCKD8EMiKumeJPnJzEtuylI0VgysJzIXKD46c7QaWj0bkq+yNAP92AHmhDdNRTnptli0+PLQY98BSpEhY6kYvEC+k8jI9EquFur5/gKhLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727349193; c=relaxed/simple;
	bh=0mAXBbv2sS2led6U3cjvD3VXtAzTjZ7/oRcRQrZM0lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gc2eriobxid62j7+c0gn1wLcGn6vMOOEF8NlVEKJAltGaFwcrw0ZF+ItUlRhlg3qd26VzsKsSg2PitdyCoTFnAzvDu8Pd5EgW3CUpIwBc09hgaYO8/SBJqXsyudZAoyy7o+HsYtYdoSdJe1kkVuXufBOGThG2NYMLLCNcTnJUFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r6OSB6ts; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 825DD8D4;
	Thu, 26 Sep 2024 13:11:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727349101;
	bh=0mAXBbv2sS2led6U3cjvD3VXtAzTjZ7/oRcRQrZM0lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r6OSB6tsNrHov5ZpjTxHf7o/LubRPXOusUp6+IjU6FQkS4LGGZ6f9FkmKoNeUMj3E
	 9BDW7n1YbgMii4FjvOo82j+14H1+nlgFJwR7kifIRuwfx9lA7NAc0sb9OTQCmDLLoF
	 stjTvGJI+kg/M774+p3IrwjrEiJ4JPZk9cR6UqRc=
Date: Thu, 26 Sep 2024 14:13:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
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
Message-ID: <20240926111307.GG21788@pendragon.ideasonboard.com>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
 <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan>
 <20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
 <20240918132323.2a384f87@sal.lan>
 <20240925195653.GJ30399@pendragon.ideasonboard.com>
 <20240926003815.6537fdbb@foz.lan>
 <20240926103002.GB21788@pendragon.ideasonboard.com>
 <20240926130615.5397cc30@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240926130615.5397cc30@foz.lan>

On Thu, Sep 26, 2024 at 01:06:15PM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 26 Sep 2024 13:30:02 +0300
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> 
> > On Thu, Sep 26, 2024 at 12:38:15AM +0200, Mauro Carvalho Chehab wrote:
> > > Em Wed, 25 Sep 2024 22:56:53 +0300
> > > Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:
> > >   
> > > > Hi Mauro,
> > > > 
> > > > On Wed, Sep 18, 2024 at 01:23:23PM +0200, Mauro Carvalho Chehab wrote:  
> > > > > Em Wed, 18 Sep 2024 11:30:20 +0200 Sebastian Fricke escreveu:    
> > > > > > On 18.09.2024 09:24, Mauro Carvalho Chehab wrote:    
> > > > > > > Em Tue, 17 Sep 2024 14:52:19 +0200 Hans Verkuil escreveu:    
> > > > > > >> On 9/17/24 11:17 AM, Sebastian Fricke wrote:      
> > > > > > >> > Greetings,
> > > > > > >> >
> > > > > > >> > I remember that we wanted to still define a couple of processes for the
> > > > > > >> > multi-committer model for which we hadn't have the time on the media
> > > > > > >> > summit. Just would like to gather who would be interested to meet for
> > > > > > >> > that, where we meet (probably LPC venue) and when (Laurent just told me
> > > > > > >> > that Friday is probably a good slot for that).      
> > > > > > >>
> > > > > > >> Can you refresh my memory which processes need more work?      
> > > > > > 
> > > > > > Well I basically remember that we had a bunch of topics in our meetings
> > > > > > that we wanted to skip in order to talk about them here.
> > > > > > We looked at the documentation from DRM and wanted to think about
> > > > > > equivalent policies for media.
> > > > > > https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-misc.html#where-do-i-apply-my-patch    
> > > > > 
> > > > > Thanks for the pointer. Yeah, examples from other trees can be helpful when
> > > > > improving media developers profile and writing the committers agreement,
> > > > > even when they have a message that it is just the opposite of what we
> > > > > we want, like this (from DRM-misc ruleset):
> > > > > 
> > > > > 	"Since even a broken driver is more useful than no driver minimal
> > > > > 	 review standards are a lot lower."
> > > > > 
> > > > > In this particular case, for instance, as discussed at media summit, we'd
> > > > > like to have high quality standards for stuff under drivers/media. After
> > > > > all, we do use drivers/media/staging for low quality drivers. 
> > > > > 
> > > > > It it worth mentioning that committers shall not merge low quality drivers
> > > > > nor patches for staging. If ever needed, those should be done via PRs or
> > > > > be explicitly authorized by maintainers.    
> > > > 
> > > > Do you mean new drivers only, or also patches for existing staging/
> > > > drivers ?  
> > > 
> > > New drivers only. Patches for drivers already at staging can go via
> > > committers tree.  
> > 
> > I think those could still be pushed directly, but I'm fine with a pull
> > request for the time being. If the concern is that you'd like to have a
> > look at the driver first, in the long run I'd rather ping you for a
> > review and then push once you give an ack. We should move away from
> > reviews at pull request time, they don't scale.
> 
> There aren't many new stage drivers, so this doesn't need to scale.

The comment about scaling was about reviews at PR time, not about
drivers/staging/.

> Also, we prefer drivers going directly to drivers/media, so staging
> should be used only on unusual cases.

No disagreement there, and I think that accepting new drivers in staging
is something worth discussing when it happens. Nobody said drivers
should be sneaked in there.

> Subsystem maintainers should
> give a final word if a driver should be merged there or directly on
> drivers/media.
>
> > > > > > Also there were topics like how to handle backports.     
> > > > > 
> > > > > We don't handle backports on media tree. This is up to stable maintainers.
> > > > > Basically, we follow stable rules to the letter:
> > > > > 
> > > > > 	Documentation/process/stable-kernel-rules.rst
> > > > > 
> > > > > E. g. patches that require backports shall have the proper meta-tags 
> > > > > (specially cc: stable and  fixes:).     
> > > > 
> > > > Sebastian may have meant backmerges.
> > > >   
> > > > > Also, we're not implementing multi-committers for fixes, just for next.
> > > > > 
> > > > > So, fixes shall follow the normal flow: they should be sent via PR.    
> > > > 
> > > > I see there's a fixes branch in the media-committers tree, does that
> > > > mean you have agreed with Hans and Ricardo that fixes will go through
> > > > pull requests but be pushed there for visibility ? If so, thanks for
> > > > that, I think it will improve the experience.  
> > > 
> > > Hans and I are planning to push fixes at the media-committers tree, as it
> > > allows CI to run those, but the goal here is not about visibility - it is
> > > just to ensure that CI will execute tests on the merged patches.   
> > 
> > That's also a useful goal of course. If we can kill two birds with one
> > stone, that's a good outcome.
> > 
> > > For committers and developers, the fixes workflow remains the same:
> > > PRs for committers and patches for developers.
> > > 
> > > -
> > > 
> > > See, the main repository is hosted at linuxtv.org. We intend to avoid 
> > > as much as possible rebases at the media tree at linuxtv.org, on both
> > > fixes and next branches.
> > > 
> > > The media-committers tree at fdo is focused on executing patches at CI
> > > and should only be used by committers. All other developers should base 
> > > their work at the repository stored at linuxtv.org[1].  
> > 
> > That I don't like. We want people working on the media subsystem to test
> > the very latest code, and to base their work on the tree that their
> > patches will land in. Otherwise there will be conflicts, and the risk of
> > conflict will increase as we pick up pace with the new workflow and
> > merge patches faster.
> 
> This is unavoidable: in the beginning committers may (and will) make
> mistakes, as this is a different workflow. As we keep adding more committers, 
> more mistakes may happen, specially for the newbies.
> 
> So, we need to protect the tree where patches land in (media at 
> linuxtv.org) from potential issues that might happen at the shared tree.
> 
> Besides that, conflicts are unavoidable on a multi-committers tree.
> 
> > > [1] We are planning to have a "media" repository there, replacing the
> > >     current "media-stage" tree.
> > > 
> > > See, the media-committers repository at fdo can be rebased. This might
> > > happen, for instance, if we don't agree with some merge there during
> > > our merge review or if other committers disagree with merges. On such
> > > case, the not-accepted patches will be dropped via rebase and the patches
> > > will need to be reviewed the normal way.  
> > 
> > Things that haven't reached a consensus should not be merged in the
> > first place, and in the rare cases where it happens, a revert is fine.
> > Rebases should be kept for situations where no other option is possible.
> 
> I guess we agree to disagree.

I certainly disagree, yes. I won't comment further, I think you know my
position well enough, and I'm certain the majority of the community is
also against rebases.

-- 
Regards,

Laurent Pinchart

