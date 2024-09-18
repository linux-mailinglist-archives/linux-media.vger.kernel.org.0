Return-Path: <linux-media+bounces-18386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95ED97BB8D
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 13:23:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC15F1C22373
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 11:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DCD117DFFF;
	Wed, 18 Sep 2024 11:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8wPAg66"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB325291E
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 11:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726658617; cv=none; b=rtBDc0PKTzcdCH0uX9LTT4zeDKgk/n3IXRwr+AbOo2sJnKeBpu7uPfwIeOqPBFBhegJGlYoyw1eHpb9v/xi43M1VOeAD1pEk9QSzkYu1pwYG/V3Hg0wBe65w2KbALxK4Yir+rfUz2GUo9tfR48BqTwW5Agf+deFNvqE2x97tru8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726658617; c=relaxed/simple;
	bh=ntHFXfDrNjLbRc74I2u6rdn+blxfJG2PdB0xM/jYxPE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jBPITTyIW+3yjEjdkNdgSbC+lu6+LLBpX7zilyq9Z8Q7QYd+caJSNuQ9J3gUy2h1FQZLp4+kNPiJ0ySgvC0RU7/lZWxvPsgO5I1LWPoK9UkcZSE9IFfEJd5QNuVGhRgnuThqJlaW0XLjnlHjkNzRaufjtR+gA75ARY8eWIlIshU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8wPAg66; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31520C4CEC7;
	Wed, 18 Sep 2024 11:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726658617;
	bh=ntHFXfDrNjLbRc74I2u6rdn+blxfJG2PdB0xM/jYxPE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A8wPAg66O/BL4g5aWXpUZb8gFHBcFUWSrOQ62XeLBFQ2NURhOb3LcMNemnUVBlnaQ
	 RpHWwdI0KWeUWI+vudpw/RFqygBxVEQcKM5cv5ed4r5nfSzNgV2X3jrn1eQAYx3/N+
	 2pj+5qOa4b71dcg0NN7s1wKABjneMD6R54Hx2MdmcBJ+U6zk2hOQrqag458JFpzKXS
	 RKQ3f8JeTovg/FcCAqMMVsItJ0YT5ilNXZdqz2f2mDXVAw1Biy2vBTjFAXSSu3s76N
	 YtHIsaKi6d9kqW7ScwNWTQlYDPcR+IsMU3yiTf3tfO9FR0Zq5ngP1MUD/GzYYSzRrJ
	 +dc+fUIzelP3Q==
Date: Wed, 18 Sep 2024 13:23:23 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Martin Hecht <martin.hecht@avnet.eu>, Tommaso Merciai
 <tomm.merciai@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Ricardo Ribalda
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
Message-ID: <20240918132323.2a384f87@sal.lan>
In-Reply-To: <20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
	<20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
	<bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
	<20240918092454.21884920@sal.lan>
	<20240918093020.u5rz7qfjoumfezql@basti-XPS-13-9310>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 18 Sep 2024 11:30:20 +0200
Sebastian Fricke <sebastian.fricke@collabora.com> escreveu:

> Hey Hans & Mauro,
> 
> On 18.09.2024 09:24, Mauro Carvalho Chehab wrote:
> >Em Tue, 17 Sep 2024 14:52:19 +0200
> >Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> >  
> >> Hi Sebastian,
> >>
> >> On 9/17/24 11:17 AM, Sebastian Fricke wrote:  
> >> > Greetings,
> >> >
> >> > I remember that we wanted to still define a couple of processes for the
> >> > multi-committer model for which we hadn't have the time on the media
> >> > summit. Just would like to gather who would be interested to meet for
> >> > that, where we meet (probably LPC venue) and when (Laurent just told me
> >> > that Friday is probably a good slot for that).  
> >>
> >> Can you refresh my memory which processes need more work?  
> 
> Well I basically remember that we had a bunch of topics in our meetings
> that we wanted to skip in order to talk about them here.
> We looked at the documentation from DRM and wanted to think about
> equivalent policies for media.
> https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-misc.html#where-do-i-apply-my-patch

Thanks for the pointer. Yeah, examples from other trees can be helpful when
improving media developers profile and writing the committers agreement,
even when they have a message that it is just the opposite of what we
we want, like this (from DRM-misc ruleset):

	"Since even a broken driver is more useful than no driver minimal
	 review standards are a lot lower."

In this particular case, for instance, as discussed at media summit, we'd
like to have high quality standards for stuff under drivers/media. After
all, we do use drivers/media/staging for low quality drivers. 

It it worth mentioning that committers shall not merge low quality drivers
nor patches for staging. If ever needed, those should be done via PRs or
be explicitly authorized by maintainers.

> Also there were topics like how to handle backports. 

We don't handle backports on media tree. This is up to stable maintainers.
Basically, we follow stable rules to the letter:

	Documentation/process/stable-kernel-rules.rst

E. g. patches that require backports shall have the proper meta-tags 
(specially cc: stable and  fixes:). 

Also, we're not implementing multi-committers for fixes, just for next.

So, fixes shall follow the normal flow: they should be sent via PR.

> >I have the same doubt. As discussed during the summit, Hans and I had some
> >discussions yesterday, to address a few details. For both of us the process
> >sounds well defined.  
> 
> I know that we scraped a lot of topics in the meeting at the media
> summit and I am not sure about the scope you discussed with Ricardo
> yesterday. So, we don't have to meet if you feel like we covered
> everything, just wanted to use the opportunity as long as we are all in
> the same place.

I guess we covered everything that are needed for now. If required,
further discussions may happen later via e-mail and/or virtual meetings.

Regards,
Mauro

