Return-Path: <linux-media+bounces-22247-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3959DBC63
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 20:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4AE3281A4C
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 19:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 318551C1F1E;
	Thu, 28 Nov 2024 19:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fYYEtnTO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C1341C94;
	Thu, 28 Nov 2024 19:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732820908; cv=none; b=gOwshKTx3Jh71eagpx34JHgUoNhcvFC0MrjNH7Zj5/w1pZy0SWAKXixJFFhiktxQf+mQwcRWR4wZ04WHltXIfDs13gFHn6F/W+1x1m8vqYG3wBgeF/Kp12fVOVfIMQjv1eDqP00w9QTjh2HjjLGJIGVEx9av+lXFZQyE2fHUtxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732820908; c=relaxed/simple;
	bh=v43Kz8r13RWCJirCrv+vtT1SrjfkAKhEyLOpYc4BXcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFn8Ue6ZN5uugYnKAYFsrLhDfnbIvgeiJ27UFtb94Zzb2/6xCWcu0veOTFeyDcy2udk96r1397YhPdfY+LYi6jbmb37dvienPtHBGD2GHgM70KHJ9v1LWzV2VzJQzp0ZEO5/i4/F49eqOFJR70Gyg+JtoNIaNq1dYwJzFSIzZdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fYYEtnTO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6CDB2526;
	Thu, 28 Nov 2024 20:08:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732820881;
	bh=v43Kz8r13RWCJirCrv+vtT1SrjfkAKhEyLOpYc4BXcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fYYEtnTOfC2tpd3x1H6Eek9ICxq+KMsk4O+bBbe+0MkQWMYtvhTki2Ilw4nSfdq3u
	 Y8yFev68FKeIlZ9khqK2zru9+cs1xAfYGv6N8503QvGZUYleHQdX4XVRbLiM8iFXEK
	 sN3jAD+n4NNa4groR35EVt31V13cuHGIFGjMqwU0=
Date: Thu, 28 Nov 2024 21:08:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, linux-media@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4ll.nl>
Subject: Re: [PATCH] docs: media: document media multi-committers rules and
 process
Message-ID: <20241128190813.GB13852@pendragon.ideasonboard.com>
References: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
 <20241126151930.GA5493@pendragon.ideasonboard.com>
 <20241127103948.501b5a05@foz.lan>
 <20241127111901.GG31095@pendragon.ideasonboard.com>
 <CAKMK7uFZsc+-Os+Pb9MHHbdt1K5Pj+D069d-+FvsDeeWgeZASw@mail.gmail.com>
 <20241128192842.0ce29c88@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241128192842.0ce29c88@foz.lan>

On Thu, Nov 28, 2024 at 07:28:42PM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 27 Nov 2024 15:48:10 +0100 Simona Vetter escreveu:
> 
> > Jumping in the middle here with some clarifications.
> > 
> > On Wed, 27 Nov 2024 at 12:19, Laurent Pinchart wrote:
> > > On Wed, Nov 27, 2024 at 10:39:48AM +0100, Mauro Carvalho Chehab wrote:  
> > > > It is somewhat similar to drm-intel and drm-xe, where reviews are part
> > > > of the acceptance criteria to become committers.  
> > >
> > > Those are corporate trees, so it's easier to set such rules.  
> > 
> > Imo it's the other way round, because it's corporate you need stricter
> > rules and spell them all out clearly - managers just love to apply
> > pressure on their engineers too much otherwise "because it's our own
> > tree". Totally forgetting that it's still part of the overall upstream,
> > and that they don't own upstream.
> > 
> > So that's why the corporate trees are stricter than drm-misc, but the
> > goals are still exactly the same:
> > 
> > - peer review is required in a tit-for-tat market, but not more.
> > 
> > - committers push their own stuff, that's all. Senior committers often
> >   also push other people's work, like for smaller work they just reviewed
> >   or of people they mentor, but it's not required at all.
> > 
> > - maintainership duties, like sending around pr, making sure patches dont
> >   get lost and things like that, is separate from commit rights. In my
> >   opinion, if you tie commit rights to maintainership you're doing
> >   something else than drm and I'd more call it a group maintainership
> >   model, not a commit rights model for landing patches.
> 
> Right now, our focus is for driver maintainers to become committers,
> so they all have maintainership duties as well.

Mauro, that may be your focus, but it's not "ours".

> The requirement we're adding is to ensure that they're doing a
> good work as committers/maintainers, reviewing patches from others,
> as otherwise nobody will do that.
> 
> Now, once we start getting drivers with lots of developers working
> on them without maintainership status, we can start including
> them, but this is not our reality, as usually, there is usually
> only one or, at most a couple of developers per driver.
> 
> > Anyway just figured I'll clarify what we do over at drm. I haven't looked
> > at all the details of this proposal here and the already lengthy
> > discussion, plus it's really not on me to chime in since I'm not involved.

-- 
Regards,

Laurent Pinchart

