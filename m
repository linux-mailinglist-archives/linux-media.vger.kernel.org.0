Return-Path: <linux-media+bounces-39126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E890CB1EA01
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 16:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A73A47B527A
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 14:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E146F27F019;
	Fri,  8 Aug 2025 14:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="WDh33i1g"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADDF27EC99
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 14:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754662207; cv=none; b=U6bzj4O74uaZM9xYtIlQZqxor19PdDXSXhRD1kmCQwqOW2WhnL2wMXZBLXYKZKKJIohoBzISgomMjF4FJeMBNhWMpwseUFNn+w/O+e15hJYUriek+WipHJAlAOOsmXxYnsoDHzEV4t3m+8RcJupYhRjxb2RGWZhrS4sWLHY8kc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754662207; c=relaxed/simple;
	bh=w/5l0ePUEj2minL/c1wuh6DN1mVCoGOT038D5lot+w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qM7X6BBB4tGo15A5izB/j4gjjdSIm3eeE+9HEgRRZZ8YVDin9xFu6+py0ceLYetrABamz1qnzCHxNb0la0EIEnZINfbbZlDwiyGdcxYwGqfvgaTe/33KNWoCRy2gm48nYck+ce06pKwO0dsHgzOdUSxJmySlzIb5xKl090dItVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=WDh33i1g; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=t+zZNKZczLFhceTiUGaI+0E2KLW7wySYgytz3vs1sps=; b=WDh33i1gr45xA9LL
	jCOOvFVcQjKsVGYJ16/KRs2DsVxfTtS3PKu0MkLRfeycOc73xkE9U954PvbWK2ObYAdhRQ9ODGFSq
	m59ZnNY8lBLPPXgsQ2rUSJd+g5CPUQn34FnicFzqMznkFYcrKCj5l3nB8Mcp5aPKt3HkWgjunErx6
	1B5YtFhhEcjylgvxFE0QVT3GNOp2HpO8gDHTBf9cs9ccPlva7Ou8QOLi7xKnyIbFcQWacyr09vtEC
	u52Lo6YybgIddw9wWLdpNHwYOmr9kiyAVk3913+VG06L0cP6d8i95JXqH/ACrPhmnuJRzGe/QMUo4
	0ZT4j0ek1y66fYGOCQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1ukNnA-002kfE-2H;
	Fri, 08 Aug 2025 14:09:56 +0000
Date: Fri, 8 Aug 2025 14:09:56 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [0/4] Remove the wl1273 FM Radio
Message-ID: <aJYFNMO4W4dv2i6U@gallifrey>
References: <20250625133258.78133-1-linux@treblig.org>
 <685c08d5.050a0220.350bff.01b0@mx.google.com>
 <aF1CCjVmRruMORto@gallifrey>
 <20250808140400.GA23187@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250808140400.GA23187@pendragon.ideasonboard.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 14:08:40 up 102 days, 22:22,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> On Thu, Jun 26, 2025 at 12:50:18PM +0000, Dr. David Alan Gilbert wrote:
> > * Patchwork Integration (patchwork@media-ci.org) wrote:
> > > Dear Dr. David Alan Gilbert:
> > > 
> > > Thanks for your patches! Unfortunately the Media CI robot detected some
> > > issues:
> > > 
> > > # Test checkpatch:./0001-media-radio-wl1273-Remove.patch checkpatch
> > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > #7: 
> > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > 
> > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > #61: 
> > > deleted file mode 100644
> > > 
> > > total: 0 errors, 2 warnings, 0 checks, 30 lines checked
> > 
> > I did check that, couldn't find any appropriate MAINTAINERS entry anyway
> > 
> > > # Test checkpatch:./0002-ASoC-wl1273-Remove.patch checkpatch
> > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > #7: 
> > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > 
> > Yep, said that in my cover letter; suggestions on how to refer to that URL
> > in a better way are welcome.
> 
> You can ignore those two warnings.

Thanks for confirming that.
Could you (or some other -media maintainer) pick 1/4 for linux-media please;
Generally I think Lee tends only to pick the mfd specific bit up, so I need
to get the specifics in through the other trees.

Thanks again.

Dave

> > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > #71: 
> > > deleted file mode 100644
> > > 
> > > total: 0 errors, 2 warnings, 0 checks, 36 lines checked
> > > 
> > > # Test checkpatch:./0003-mfd-wl1273-core-Remove.patch checkpatch
> > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > #8: 
> > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > 
> > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > #55: 
> > > deleted file mode 100644
> > > 
> > > total: 0 errors, 2 warnings, 0 checks, 23 lines checked
> > > 
> > > # Test checkpatch:./0004-mfd-wl1273-core-Remove-the-header.patch checkpatch
> > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > #7: 
> > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > 
> > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > #35: 
> > > deleted file mode 100644
> > > 
> > > total: 0 errors, 2 warnings, 0 checks, 7 lines checked
> > > 
> > > 
> > > 
> > > Please fix your series, and upload a new version. If you have a patchwork
> > > account, do not forget to mark the current series as Superseded.
> > > 
> > > For more details, check the full report at:
> > > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/79088843/artifacts/report.htm .
> > > 
> > > 
> > > 
> > > Best regards, and Happy Hacking!
> > > Media CI robot on behalf of the linux-media community.
> > > 
> > > ---
> > > Check the latest rules for contributing your patches at:
> > > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> > > 
> > > If you believe that the CI is wrong, kindly open an issue at
> > > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > > to this message.
> > > 
> > -- 
> >  -----Open up your eyes, open up your mind, open up your code -------   
> > / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
> > \        dave @ treblig.org |                               | In Hex /
> >  \ _________________________|_____ http://www.treblig.org   |_______/
> > 
> 
> -- 
> Regards,
> 
> Laurent Pinchart
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

