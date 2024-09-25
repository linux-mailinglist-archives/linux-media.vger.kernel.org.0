Return-Path: <linux-media+bounces-18572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C759B986742
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 21:57:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E3751F26F30
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 19:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF37514600F;
	Wed, 25 Sep 2024 19:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="j7D1WPK6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36B8142E83
	for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 19:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727294219; cv=none; b=TFDzzxwmLgeZycf3SiX421DLnmI6WCq+xhSCUSTOmKAVaAvrOHB2lfN5T1+Ylizs1HCAoAuqbrUvt1MVv3dg+qU1MWI4eUVWVsIs7zgs2xZeRSH/pR2Z1FMhdB2sDS5hXzvnmKw+JibP8+uQpLHwQuCx4RUZDXtuaneBKvsK3rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727294219; c=relaxed/simple;
	bh=Xf/IAXg1nP83rwZQlhZno8eSQssLQACq+qJ7AP79fLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4YOt6G/3KZg8Y2CRB0KSxOqvL3cfkJHOOr2UPQ9VqPQVjezk4uXJGnCU93spGX+OjvbzDEQjFxMFTfwtv4N4VGaq1T4gTnRCccFQII8uWyWYlR1bYEz2eEm3RFImXizTTgzaF0H7WO/C1+h5mdZM10sl7q/BQMgW3jnRqIbja8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=j7D1WPK6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA0027E2;
	Wed, 25 Sep 2024 21:55:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727294127;
	bh=Xf/IAXg1nP83rwZQlhZno8eSQssLQACq+qJ7AP79fLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j7D1WPK6b//wsMICkNNOnhQGm3FIGTvcut3iodvk3A5fWfD6UN5uMUdl2Hbl7NWIZ
	 vMQeneonnDPsoypqL9ToJAeVtg+3igCKAsTmlWEjiNt9aQur9rrQMsKxazhmzj4zmI
	 lfAUFLMIvoXiC6u1Bfr65HBPEXi4G+iQMDPUNmcM=
Date: Wed, 25 Sep 2024 22:56:53 +0300
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
Message-ID: <20240925195653.GJ30399@pendragon.ideasonboard.com>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
 <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan>
 <20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
 <20240918132323.2a384f87@sal.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240918132323.2a384f87@sal.lan>

Hi Mauro,

On Wed, Sep 18, 2024 at 01:23:23PM +0200, Mauro Carvalho Chehab wrote:
> Em Wed, 18 Sep 2024 11:30:20 +0200 Sebastian Fricke escreveu:
> > On 18.09.2024 09:24, Mauro Carvalho Chehab wrote:
> > > Em Tue, 17 Sep 2024 14:52:19 +0200 Hans Verkuil escreveu:
> > >> On 9/17/24 11:17 AM, Sebastian Fricke wrote:  
> > >> > Greetings,
> > >> >
> > >> > I remember that we wanted to still define a couple of processes for the
> > >> > multi-committer model for which we hadn't have the time on the media
> > >> > summit. Just would like to gather who would be interested to meet for
> > >> > that, where we meet (probably LPC venue) and when (Laurent just told me
> > >> > that Friday is probably a good slot for that).  
> > >>
> > >> Can you refresh my memory which processes need more work?  
> > 
> > Well I basically remember that we had a bunch of topics in our meetings
> > that we wanted to skip in order to talk about them here.
> > We looked at the documentation from DRM and wanted to think about
> > equivalent policies for media.
> > https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-misc.html#where-do-i-apply-my-patch
> 
> Thanks for the pointer. Yeah, examples from other trees can be helpful when
> improving media developers profile and writing the committers agreement,
> even when they have a message that it is just the opposite of what we
> we want, like this (from DRM-misc ruleset):
> 
> 	"Since even a broken driver is more useful than no driver minimal
> 	 review standards are a lot lower."
> 
> In this particular case, for instance, as discussed at media summit, we'd
> like to have high quality standards for stuff under drivers/media. After
> all, we do use drivers/media/staging for low quality drivers. 
> 
> It it worth mentioning that committers shall not merge low quality drivers
> nor patches for staging. If ever needed, those should be done via PRs or
> be explicitly authorized by maintainers.

Do you mean new drivers only, or also patches for existing staging/
drivers ?

> > Also there were topics like how to handle backports. 
> 
> We don't handle backports on media tree. This is up to stable maintainers.
> Basically, we follow stable rules to the letter:
> 
> 	Documentation/process/stable-kernel-rules.rst
> 
> E. g. patches that require backports shall have the proper meta-tags 
> (specially cc: stable and  fixes:). 

Sebastian may have meant backmerges.

> Also, we're not implementing multi-committers for fixes, just for next.
> 
> So, fixes shall follow the normal flow: they should be sent via PR.

I see there's a fixes branch in the media-committers tree, does that
mean you have agreed with Hans and Ricardo that fixes will go through
pull requests but be pushed there for visibility ? If so, thanks for
that, I think it will improve the experience.

> > > I have the same doubt. As discussed during the summit, Hans and I had some
> > > discussions yesterday, to address a few details. For both of us the process
> > > sounds well defined.  
> > 
> > I know that we scraped a lot of topics in the meeting at the media
> > summit and I am not sure about the scope you discussed with Ricardo
> > yesterday. So, we don't have to meet if you feel like we covered
> > everything, just wanted to use the opportunity as long as we are all in
> > the same place.
> 
> I guess we covered everything that are needed for now. If required,
> further discussions may happen later via e-mail and/or virtual meetings.

-- 
Regards,

Laurent Pinchart

