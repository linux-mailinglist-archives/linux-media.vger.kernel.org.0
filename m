Return-Path: <linux-media+bounces-22244-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6249DBC29
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 19:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AFCD7B21060
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 18:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A601C1ADB;
	Thu, 28 Nov 2024 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TyKX5sgC"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B491BD9CF;
	Thu, 28 Nov 2024 18:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732818528; cv=none; b=HEdntxroR602pq4uX7iVefx+KymODWKObctvPQ8PmLeOphL805+reZ++OcXXPyDkn/lm0WM5oT3kWmaQRzpd7L3+R/aMFQjmIEh9KBw9Kft7tm3tzZIGqBogqQKXyFIS7AqLA4Mn+HdbuTkSB/BHCxfGb+j/fZ/0xSTk6tvrnPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732818528; c=relaxed/simple;
	bh=yvKWcaHcbhziU0+F7pVCG0MUAXOf4PB4eiRi2TsVvtA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R8Cus3guSmkHjbZ+hmsAJfM2G2nDLHOo7bQOz8Tpj4MEUnQZXz1vo+S4ZjSogWatv06mEvXGy4oGK0UjRaE37hx7ZdWTdPj/Y3eC97VMJ0UDUEjSd9PvTZGFOzL2qiBm4vjXdC1nyvp2dU35NK21xEIiA2ZYb2AnS6SeoBE/YeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TyKX5sgC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE02C4CECE;
	Thu, 28 Nov 2024 18:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732818527;
	bh=yvKWcaHcbhziU0+F7pVCG0MUAXOf4PB4eiRi2TsVvtA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TyKX5sgCx8wixT9H1IpTBHJ0ddsbi4ocIhSsPaxcgqpueh6x9DMyWZ8IVGMhmQoPA
	 rXDhVQjCuWhTqxacjxdKMrwHUzomvFixISK6EtoYnISyoa66OOiYTLpXtLv4nwhC8q
	 jDDUaHVRzf3p0aVU4XyQ/4d3RDjSAxTUXiGtS+3Vs08iKF/ASA3JO1sRjd2BY9VhnT
	 69UWpV4n6Op8OEE3pD6wWQFI3fG4W45kdxP1QF2Xp4aYxxgjlOkNB2zt5aEhFlnZ9j
	 sFxqf9zatNlq2dL/+Y4SWjOb/avi6nBEkX5vljJuozNpT02iASvkZAzXuDVSxhbokb
	 a9Hn7sIbDesPA==
Date: Thu, 28 Nov 2024 19:28:42 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 workflows@vger.kernel.org, Hans Verkuil <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241128192842.0ce29c88@foz.lan>
In-Reply-To: <CAKMK7uFZsc+-Os+Pb9MHHbdt1K5Pj+D069d-+FvsDeeWgeZASw@mail.gmail.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
	<20241126151930.GA5493@pendragon.ideasonboard.com>
	<20241127103948.501b5a05@foz.lan>
	<20241127111901.GG31095@pendragon.ideasonboard.com>
	<CAKMK7uFZsc+-Os+Pb9MHHbdt1K5Pj+D069d-+FvsDeeWgeZASw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed, 27 Nov 2024 15:48:10 +0100
Simona Vetter <simona.vetter@ffwll.ch> escreveu:

> Jumping in the middle here with some clarifications.
> 
> On Wed, 27 Nov 2024 at 12:19, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> > On Wed, Nov 27, 2024 at 10:39:48AM +0100, Mauro Carvalho Chehab wrote:  
> > > It is somewhat similar to drm-intel and drm-xe, where reviews are part
> > > of the acceptance criteria to become committers.  
> >
> > Those are corporate trees, so it's easier to set such rules.  
> 
> Imo it's the other way round, because it's corporate you need stricter
> rules and spell them all out clearly - managers just love to apply
> pressure on their engineers too much otherwise "because it's our own
> tree". Totally forgetting that it's still part of the overall upstream,
> and that they don't own upstream.
> 
> So that's why the corporate trees are stricter than drm-misc, but the
> goals are still exactly the same:
> 
> - peer review is required in a tit-for-tat market, but not more.
> 
> - committers push their own stuff, that's all. Senior committers often
>   also push other people's work, like for smaller work they just reviewed
>   or of people they mentor, but it's not required at all.
> 
> - maintainership duties, like sending around pr, making sure patches dont
>   get lost and things like that, is separate from commit rights. In my
>   opinion, if you tie commit rights to maintainership you're doing
>   something else than drm and I'd more call it a group maintainership
>   model, not a commit rights model for landing patches.

Right now, our focus is for driver maintainers to become committers,
so they all have maintainership duties as well.

The requirement we're adding is to ensure that they're doing a
good work as committers/maintainers, reviewing patches from others,
as otherwise nobody will do that.

Now, once we start getting drivers with lots of developers working
on them without maintainership status, we can start including
them, but this is not our reality, as usually, there is usually
only one or, at most a couple of developers per driver.

> Anyway just figured I'll clarify what we do over at drm. I haven't looked
> at all the details of this proposal here and the already lengthy
> discussion, plus it's really not on me to chime in since I'm not involved.

Thanks,
Mauro

