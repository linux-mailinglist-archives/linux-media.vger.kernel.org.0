Return-Path: <linux-media+bounces-22531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 833789E1BAC
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 13:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93D50B3A883
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 11:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14A61E3DD0;
	Tue,  3 Dec 2024 11:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="a0YCYzSL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136B52E3EE;
	Tue,  3 Dec 2024 11:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224945; cv=none; b=CQD29Gil0uL51EcHMe1oNfD6BmVBQSWmISg1+5cf48OpWP/yUccofU6eR7a2ngSStJP4Dg+Q1AEqoZOgdcoKD933kJzDdOe8yqBRLRFcK4ZcCNFvz1jzf+IKmtg3IYAq/N/AXQXfegrL2pM8gN9fphn6HzGmh+epIVG6chubkOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224945; c=relaxed/simple;
	bh=BBk+zjcEC0uJhKJnCdpNziMigOnPauW1WG4uQsbCtQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/N47Wsh6oMq1ZxneRFYQyfvfjIUGLPxDg1X3o/Mybuiw3jMiAmSXPb3l7RTk1Opfm7oTT2d37+dfn2jvdYlCozKlPcfO31s9KfCwp/bZm1fwCfkOcxPItazdxMXQIRpb8SMZLuPTqJonSiImYW9ufWn1whyQYQkIcim461tf4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=a0YCYzSL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EECFAB2B;
	Tue,  3 Dec 2024 12:21:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733224914;
	bh=BBk+zjcEC0uJhKJnCdpNziMigOnPauW1WG4uQsbCtQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a0YCYzSL2NbWGkhkPiJJSrDdBozc2h/7EDTYLjklSs7Q/3adJl8YqfBCSnmZX7Ipx
	 lEa1xTSzVPJQ6ZHc6aVUkID00a56jNwxKc2geWhTMwHDRJnquHVvWohcJNPhvh7gxV
	 DR71a0qM6yB1V5IkV7IIthtbEkllpzPL5lx1zoqc=
Date: Tue, 3 Dec 2024 13:22:09 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Document the new media-committer's model
Message-ID: <20241203112209.GR10736@pendragon.ideasonboard.com>
References: <cover.1733131405.git.mchehab+huawei@kernel.org>
 <b0843e80-c46c-4344-b9f1-1d3b57dd2bbe@xs4all.nl>
 <20241203081958.6c186835@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203081958.6c186835@foz.lan>

On Tue, Dec 03, 2024 at 08:19:58AM +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 2 Dec 2024 16:03:45 +0100 Hans Verkuil escreveu:
> > On 02/12/2024 10:26, Mauro Carvalho Chehab wrote:
> > > The media subsystem used to have a multi-commiter's model in the
> > > past, but things didn't go well on that time, and we had to move to
> > > a centralized model.
> > > 
> > > As the community has evolved, and as there are now new policies in
> > > place like CoC, let's experiment with a multi-committers again.
> > > 
> > > The model we're using was inspired by the DRM multi-committers
> > > model. Yet, media subsystem is different on several aspects, so the
> > > model is not exactly the same.
> > > 
> > > The implementation will be in phases. For this phase, the goal is that 
> > > all committers will be people listed at MAINTAINERS.
> > > 
> > > On this series,:
> > > 
> > > patch 1: updates the  media maintainer's entry profile and adds the
> > > workflow that will be used with the new model. While here, it also
> > > adds a missing "P:" tag at the MAINTAINERS file, pointing to it;
> > > 
> > > patch 2: adds a new document focused at the new maintainers
> > > process. Its target is for developers that will be granted with
> > > commit rights at the new media-maintainers.git tree. It also
> > > contains a reference tag addition to kernel.org PGP chain
> > > at process/maintainer-pgp-guide.rst.
> > > 
> > > patch 3: make documents cleared about maintainership duties.  
> > 
> > At least from my perspective, v3 is close to being ready and I hope
> > that v4 will be good enough to be merged.
> > 
> > That said, what is missing in all this is that there is nothing here
> > that explains why you would want to become a media committer. It is all
> > very dry stuff, lots of 'shall's, and 'rights' and 'trust' and obligations,
> > but nothing about the satisfaction you get when you get the responsibility
> > of a part of the kernel and being able to guide the development of that
> > area.
> > 
> > It's good enough to get the multi-committer process off the ground, but
> > it definitely needs more work to make it more inviting to become a media
> > committer. Because right now it is as dry as dust.
> 
> Agreed. We focused on getting a document describing what it is expected
> by committers, in order to start with the model. My view is that it works
> fine for such purpose. I also feel that we're close to the final document.
> 
> I'm sending today a v4 addressing the comments since last review.
> 
> Once we get people that are already interested and ready to be on board,
> and we know that the model and infrastructure works properly, we may implement
> a phase 2 focusing on allowing more committers. For such purpose, we need to 
> document the benefits/satisfaction of becoming a new committer. Depending how
> it goes, either on phase 2 or on phase 3, we can change the model from 
> invitation-only to volunteer-requests.

What's phase 3 ?

-- 
Regards,

Laurent Pinchart

