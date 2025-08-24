Return-Path: <linux-media+bounces-40849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F810B3333A
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 00:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AAB21887114
	for <lists+linux-media@lfdr.de>; Sun, 24 Aug 2025 22:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC47124A066;
	Sun, 24 Aug 2025 22:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C/43ubgA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FED521ABDB
	for <linux-media@vger.kernel.org>; Sun, 24 Aug 2025 22:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756075233; cv=none; b=BSpKnAlDBriruZf978LD93VlQaxikI2lcAYA9ampVyVy6dS0jGzrtXUrx8WLXDf2iHYNJO5QWiU1ElMoQP6HVHfWQfLN+w2mDVgwMM0IJZzM6UWBW0IdIOndAZY7B8h1JMylVSSYIhGDr3PzKP+bZJSuCH9v4vVLxhwxo3Ai72Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756075233; c=relaxed/simple;
	bh=C0y1tJvM89XFNvs2Tqe23XGnlZagZR9uWjOkvDPLMfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/Rj9KlVPN6sS8UHVsPd4WiqT+RhmH/M2n4d7TXxSaF2RovvDHWQQrqhOKGwfldBcCXTuYCRM327Q57csRTETbQ78KG6k5VkuBrqbpBYDqupAW5t9GHmMq/CfWU2v4/QoKIN2QG8rN9OzesjTFOQ2lXRLxNL50wAwjYjx9qq9t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C/43ubgA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [185.22.192.49])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 487B6213D;
	Mon, 25 Aug 2025 00:39:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1756075167;
	bh=C0y1tJvM89XFNvs2Tqe23XGnlZagZR9uWjOkvDPLMfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C/43ubgAzf41jWaspG4nOcfJQ8dBLWX2Z1oQrBf2oU+j6tRWpCxvhCE5DovG3WapG
	 KNgys5FnLyK98Y+atH4mO7uO6B+B3Vm76stW5A3vOTbh3CjB/0VJjrW9cDePoALb2B
	 P8hO3qf/5TqF6m7zltL5voRbRirl9ApfrHjV2KVQ=
Date: Mon, 25 Aug 2025 00:40:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Dan Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	jacopo.mondi@ideasonboard.com
Subject: Re: [PATCH v2 0/3] Add media jobs framework
Message-ID: <20250824224005.GA27011@pendragon.ideasonboard.com>
References: <20250624-media-jobs-v2-0-8e649b069a96@ideasonboard.com>
 <10609f72ceb27db9245b8cadde5bcfddf49fffff.camel@ndufresne.ca>
 <94826966-05e2-4944-bc81-72ef261d2af2@ideasonboard.com>
 <ba48d78044c8954ea0878ce74b53405ecf9140af.camel@ndufresne.ca>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba48d78044c8954ea0878ce74b53405ecf9140af.camel@ndufresne.ca>

On Wed, Jun 25, 2025 at 12:07:28PM -0400, Nicolas Dufresne wrote:
> Le mercredi 25 juin 2025 à 16:40 +0100, Dan Scally a écrit :
> > Hi Nicolas - thanks for commenting
> 
> [...]
> 
> > > > - Link to v1: https://lore.kernel.org/r/20250519140403.443915-1-dan.scally@ideasonboard.com
> > > That's nice to have a link, but do you mind to summarize that changes you
> > > made from v1 ? I remember challenging the naming, and the fact jobs and request
> > > next to each other are extremely confusing. It felt rather important discussion
> > > to have, yet this cover later does say anything, and I don't remember seeing
> > > any reply.
> > 
> > I only replied yesterday. Sorry to be late - I didn't see your message for some reason until I was 
> > getting ready to post this revision; on the naming I think that just "Media Scheduler" to me feels 
> > like it begs the question "What's being scheduled?" but I'm not sure what other word to use if not 
> > job...I don't really have strong feelings about it though - just Media Scheduler is fine by me if we 
> > can't come up with anything better.
> 
> Thanks for the reply, I was getting a bit annoyed by the silence
> around the high level of the framework. Glad its accidental, My thinking is
> the a scheduler runs jobs (or slice) and this is pretty much the case through
> the kernel. So a "job" framework, can only be a scheduler. Of course, its an
> highly specialized one.
> 
> Note that M2M framework on the V4L2 side is also a multi-plexing scheduler,
> and it runs jobs despite not having a job object :-(. Its too simple, limited
> to one video node, and there is no way to carry over any state for when you
> must run more then one job at the time. We can't even consider having a job
> that depends on another ...
> 
> So basically. its the best example of what not to do, and why I care about
> your work. There is an increasing amount of multi-stage, multi-core, with
> pre/post-processor CODEC, which will need multiple video nodes. So your
> scheduler framework seem to be the direction forward.

As far as I understand, Dan's work addresses a different but related
need. What he's trying to solve is being able to schedule a job across
not just multiple video devices, but across multiple drivers. The former
is something that the kernel can support already today, albeit through
hacks: the downstream Raspberry Pi memory-to-memory ISP drivers create
multiple instances of the same media graph to represent contexts, and
those drivers then schedule jobs in a first come, first served fashion.
Jacopo's multi-context API will made this neater, removing the multiple
media device instances hack. Dan is taking the need one step further, to
cover cases where the different video devices are handled by independent
drivers.

Separately from that, we need a better scheduler. The M2M framework has
a very simple scheduler implementation, and so do the ISP drivers that
support multi contexts (with hacks today, with a standard API tomorrow).
I beliee we will need a more powerful scheduler that will cover all
those use cases, and will also catter for the needs of multi-core
codecs. It however seems to me that such a scheduler could be developed
independently from this series. Am I wrong ?

> > I took a look at the DRM scheduler and I agree that there's a lot of parallels - I don't _think_ it 
> > would be usable as-is but perhaps it would be easier to adapt than to add a new piece of code (or it 
> > might turn out we can just use it after all); I'm going to spend more time investigating that and 
> > see where it leads - thanks for pointing it out.
> 
> After further discussion with the DRM folks, using theirs directly is likely unpractical and
> difficult. But they suggested that we may want to look at a way to make the synchronization
> compatible. Notably by adopting (or supporting) the kernel side dma fence as a way to signal
> completion or failure. Once you get to that, let me know your ideas.
> 
> > > > ---
> > > > Daniel Scally (3):
> > > >        media: mc: entity: Add pipeline_started/stopped ops
> > > >        media: mc: Add media jobs framework
> > > >        media: Documentation: Add documentation for media jobs
> > > > 
> > > >   Documentation/driver-api/media/mc-core.rst | 169 ++++++++++++
> > > >   drivers/media/mc/Makefile                  |   2 +-
> > > >   drivers/media/mc/mc-entity.c               |  46 ++++
> > > >   drivers/media/mc/mc-jobs.c                 | 428 +++++++++++++++++++++++++++++
> > > >   include/media/media-entity.h               |  24 ++
> > > >   include/media/media-jobs.h                 | 317 +++++++++++++++++++++
> > > >   6 files changed, 985 insertions(+), 1 deletion(-)
> > > > ---
> > > > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > > > change-id: 20250623-media-jobs-6f3f9963063c

-- 
Regards,

Laurent Pinchart

