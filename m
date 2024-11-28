Return-Path: <linux-media+bounces-22245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4349DBC43
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 19:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A50A4B21B9C
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 18:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0121C1F14;
	Thu, 28 Nov 2024 18:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYo/h7jt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAFE17BA5;
	Thu, 28 Nov 2024 18:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732819683; cv=none; b=aobuZTV0A8y2V2VGDQ6i6kUv8wVqXQFVchaTzFrtEb++X6kLtc2aNIeu+2RydGQRe2xKvVslMOLynZgh/VB0RDKai7wbCtFRsQL9M+QxYk8YEqHcxT0blA+xYwqeh8BskTfN+7ACZpmmZSr1c7Gof88aC06uUUw+DEZWbKfCla8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732819683; c=relaxed/simple;
	bh=M60yQ7WFpyB3zuCo3SDMJf3A+WWuW11FSKk7keSRpAM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FPGb2Q/6T88lT822VloSlxnHw8TjzJ8lzqtPG9LLwFwVXJ5b7+JvFJo5nGR1nlHguP7tRg7JfEvDAfBtDhqQ9lsZgJKx0zS7+atsLuHlEthbUGL5nWcDS0U/3AULXpmFm1rghkY985t5n5B/B+TR2+QUMlw+O21IvZKlYJsHBoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYo/h7jt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39280C4CECE;
	Thu, 28 Nov 2024 18:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732819683;
	bh=M60yQ7WFpyB3zuCo3SDMJf3A+WWuW11FSKk7keSRpAM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BYo/h7jt/jLafjNAiiUvGJTmFZVecd0QWc5j707MgPm/Het2/poFECqTvlB7yaKT/
	 w4WCQDd0adnJW2zzqmtH9Zvlx4/r3N/BlsHpbHTo/srdrBa44V22irekgiav3YkvKP
	 qKxcue28MjWmWOC/84DRmFIKBkxDuGneaPZgziUVCgSZAEtRlufmMPXdw7iO4jUoK2
	 WVq6cMnX7DbFLibwajLs4ilEWDByLBAIUVmk6fWj1bcU+caW7GE/0qt4MKDYJOIipg
	 +kBbX99LLuaceYP3eqCPNN7xByWasid7Z6SSQVi+GoOtOKtxsrRDcjDLB3sOiKhR3H
	 CtKGkwg7AJaag==
Date: Thu, 28 Nov 2024 19:47:58 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, workflows@vger.kernel.org, Hans Verkuil
 <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241128194758.7d2e7656@foz.lan>
In-Reply-To: <87iks7wqi3.fsf@intel.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
	<20241126151930.GA5493@pendragon.ideasonboard.com>
	<20241127103948.501b5a05@foz.lan>
	<20241127111901.GG31095@pendragon.ideasonboard.com>
	<CAKMK7uFZsc+-Os+Pb9MHHbdt1K5Pj+D069d-+FvsDeeWgeZASw@mail.gmail.com>
	<87iks7wqi3.fsf@intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 28 Nov 2024 13:24:04 +0200
Jani Nikula <jani.nikula@intel.com> escreveu:

> On Wed, 27 Nov 2024, Simona Vetter <simona.vetter@ffwll.ch> wrote:
> > Jumping in the middle here with some clarifications.
> >
> > On Wed, 27 Nov 2024 at 12:19, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:  
> >> On Wed, Nov 27, 2024 at 10:39:48AM +0100, Mauro Carvalho Chehab wrote:  
> >> > It is somewhat similar to drm-intel and drm-xe, where reviews are part
> >> > of the acceptance criteria to become committers.  
> >>
> >> Those are corporate trees, so it's easier to set such rules.  
> >
> > Imo it's the other way round, because it's corporate you need stricter
> > rules and spell them all out clearly - managers just love to apply
> > pressure on their engineers too much otherwise "because it's our own
> > tree". Totally forgetting that it's still part of the overall upstream,
> > and that they don't own upstream.  
> 
> The required commits and reviews to become a committer may sound
> somewhat artificial and arbitrary, but it's a sort of compromise. The
> goal is to have a relatively low bar for entry, while ensuring the
> committers have just enough experience to judge whether a patch passes
> merge criteria (more on that below). It's also the same for everyone,
> and something to strive for.

We used to have a low bar for entry on our past multi-committers
model (back in 2005-2007). It was a disaster, as one of the
committer did very evil things. He was blocked, but that didn't
prevent some of us to be threatened with physical violence - and 
some people even reported death threats.

So, let's start slow to ensure that things like that won't ever
happen again.

> Frankly, I'm not fond of the invite-only model. You need to be careful
> to not lose transparency.

The intent is to be as transparent as possible without violating regulations
like GPDR.

> It can be scary to have a lot of committers. You put a lot of trust in
> them. But at the same time, you do monitor what's going on, and can
> revert commits - and commit rights, if needed.

The scariest part is to receive threats like what happened in the past.
Some were publicly documented; others happened via private talks and
e-mails.

> > So that's why the corporate trees are stricter than drm-misc, but the
> > goals are still exactly the same:
> >
> > - peer review is required in a tit-for-tat market, but not more.
> >
> > - committers push their own stuff, that's all. Senior committers often
> >   also push other people's work, like for smaller work they just reviewed
> >   or of people they mentor, but it's not required at all.  
> 
> I think it's also important to define merge criteria. A set of rules by
> which a committer can commit. And it's not really about technical
> checkboxes. For example, in drm it really boils down to two things: at
> least two people have been involved, and there are no open issues.

That's the same criteria we're aiming for. We'll start without
two people reviewing, as there won't be enough committers at the
beginning for that, but maintainers may revert/rebase the tree in
case they don't agree with changes.

> (And have those people recorded in git trailers with Sob/Rb/Ab, with
> tooling to ensure that's the case. There are very few commis in
> drm-misc/drm-intel without either 2xSob, Sob+Rb, or Sob+Ab.)

We added a CI engine to check this and other issues. If CI fails,
commit will be automatically be blocked.

> > - maintainership duties, like sending around pr, making sure patches dont
> >   get lost and things like that, is separate from commit rights. In my
> >   opinion, if you tie commit rights to maintainership you're doing
> >   something else than drm and I'd more call it a group maintainership
> >   model, not a commit rights model for landing patches.  
> 
> Agreed. Personally, I like the committer/maintainer model, because it's
> a low barrier to entry, with limited responsibilities. Not everyone
> wants to become even a committer, and the more loaded it becomes, even
> less so. Yet the committers help maintainers immensely, and you grow a
> pool of people who can become maintainers.

Currently, for most of the drivers, the number of committers per driver
is equal to the number of maintainers for the same driver.

So, on this stage, we're aiming on get maintainers commit rights,
starting with the ones that are long time contributors and regularly
participate at the media summits.

Once the "slow start" phase finishes, we can review the process and
start thinking on getting more developers and committers.

> > Anyway just figured I'll clarify what we do over at drm. I haven't looked
> > at all the details of this proposal here and the already lengthy
> > discussion, plus it's really not on me to chime in since I'm not involved.  
> 
> To be honest, IMO the length is one of the shortcomings of the
> proposal. Lots of up front process, which will inevitably have to be
> ironed out as you gain experience. You just won't be able to figure it
> all out in advance.

Agreed.

> All that said, I commend all efforts to move towards shared
> maintainership models, whether it's group maintainership or
> committer/maintainer model or something in between. Just offering my
> views here, which you're obviously free to completely ignore to your
> benefit or detriment. ;)

Thank you for you valuable feedback!

Best regards,
Mauro

