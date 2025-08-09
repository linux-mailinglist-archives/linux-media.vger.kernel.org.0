Return-Path: <linux-media+bounces-39272-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F5FB1F6EB
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 00:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE604189B363
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 22:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD00424728D;
	Sat,  9 Aug 2025 22:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PMA7dEvy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D455224D7
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 22:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754776927; cv=none; b=c1e8t0pmdJBag0b3kI5yJiq11WkdisfyZjXkvLCsIBddxZmIhLY40K0+wVXJYozHES31+f9y8qvzMowRctQOhhSdbW9ic8fx81fYaDT35+xmJJsc6sVVQBlRdmiGprdq6OjMLBIrA8asCXrBKPEK73BU8jlTikzr3E2MDvKnjrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754776927; c=relaxed/simple;
	bh=xQDpXEIZzn2mYTzw3eND8+XSn6AHBYCog9JxB/0+898=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZgv48fk/JCYvrFvbJPe3sucnEadXEa/HC778xCHtXzzQExrl5ae/C2CLeUEuVfwHqY1quPHVJI0JKIH+7yW+ZjqDDk5w3vS/rs5qEJTJgv7yX93fLZM/uZ+h8reo09Fl2VY6ABSPMFrFa/oRpQqu9tiSOkaieIN8+m1NgadjCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PMA7dEvy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 65BE01121;
	Sun, 10 Aug 2025 00:01:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754776872;
	bh=xQDpXEIZzn2mYTzw3eND8+XSn6AHBYCog9JxB/0+898=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PMA7dEvyPBaDDrRUKowg14tAFMv0h1ukeX1db56+wsGTGHE1pxx58jwXA6TfviRB4
	 Uo3rJfy3kMkAlZgljr0DmJhHg3pV1CoGIf0SS6iDTuIZSYSxP7Uk4DbymEL2UEDFtQ
	 3431I1adjLFH3NK6MQGyszQql001BBgwumd2JkHI=
Date: Sun, 10 Aug 2025 01:01:46 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [0/4] Remove the wl1273 FM Radio
Message-ID: <20250809220146.GB17105@pendragon.ideasonboard.com>
References: <20250625133258.78133-1-linux@treblig.org>
 <685c08d5.050a0220.350bff.01b0@mx.google.com>
 <aF1CCjVmRruMORto@gallifrey>
 <20250808140400.GA23187@pendragon.ideasonboard.com>
 <aJYFNMO4W4dv2i6U@gallifrey>
 <20250808160123.GE23187@pendragon.ideasonboard.com>
 <aJaVH5eCDhLutPSn@gallifrey>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJaVH5eCDhLutPSn@gallifrey>

On Sat, Aug 09, 2025 at 12:23:59AM +0000, Dr. David Alan Gilbert wrote:
> * Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> > On Fri, Aug 08, 2025 at 02:09:56PM +0000, Dr. David Alan Gilbert wrote:
> > > * Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> > > > On Thu, Jun 26, 2025 at 12:50:18PM +0000, Dr. David Alan Gilbert wrote:
> > > > > * Patchwork Integration (patchwork@media-ci.org) wrote:
> > > > > > Dear Dr. David Alan Gilbert:
> > > > > > 
> > > > > > Thanks for your patches! Unfortunately the Media CI robot detected some
> > > > > > issues:
> > > > > > 
> > > > > > # Test checkpatch:./0001-media-radio-wl1273-Remove.patch checkpatch
> > > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > > #7: 
> > > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > > 
> > > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > > #61: 
> > > > > > deleted file mode 100644
> > > > > > 
> > > > > > total: 0 errors, 2 warnings, 0 checks, 30 lines checked
> > > > > 
> > > > > I did check that, couldn't find any appropriate MAINTAINERS entry anyway
> > > > > 
> > > > > > # Test checkpatch:./0002-ASoC-wl1273-Remove.patch checkpatch
> > > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > > #7: 
> > > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > 
> > > > > Yep, said that in my cover letter; suggestions on how to refer to that URL
> > > > > in a better way are welcome.
> > > > 
> > > > You can ignore those two warnings.
> > > 
> > > Thanks for confirming that.
> > > Could you (or some other -media maintainer) pick 1/4 for linux-media please;
> > > Generally I think Lee tends only to pick the mfd specific bit up, so I need
> > > to get the specifics in through the other trees.
> > 
> > We can take patch 1/4 in the media tree, but merging the different
> > pieces in an uncoordinated fashion will result in breakages in
> > linux-next :-/
> 
> It should be safe to go in order; so you taking patch 1/4 should move
> things forward.

1/4 to 3/4 can be merged in any order, but 4/4 depends on the first
three patches getting merged first. The simplest option is to merge 1/4
to 3/4 for v6.18 through their respective trees, and 4/4 for v6.19. To
speed up merging 4/4 in v6.18 we need to coordinate between the three
subsystem maintainers.

> > I think the simplest option would be to create a branch on top of v6.16
> > (or v6.17-rc1) with the 4 patches applied, and merge it in the media,
> > mfd and sound trees. That would require Lee to drop patches 3/4 and 4/4
> > that he already applied to the mfd tree though.
> > 
> > > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > > #71: 
> > > > > > deleted file mode 100644
> > > > > > 
> > > > > > total: 0 errors, 2 warnings, 0 checks, 36 lines checked
> > > > > > 
> > > > > > # Test checkpatch:./0003-mfd-wl1273-core-Remove.patch checkpatch
> > > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > > #8: 
> > > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > > 
> > > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > > #55: 
> > > > > > deleted file mode 100644
> > > > > > 
> > > > > > total: 0 errors, 2 warnings, 0 checks, 23 lines checked
> > > > > > 
> > > > > > # Test checkpatch:./0004-mfd-wl1273-core-Remove-the-header.patch checkpatch
> > > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > > #7: 
> > > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > > 
> > > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > > #35: 
> > > > > > deleted file mode 100644
> > > > > > 
> > > > > > total: 0 errors, 2 warnings, 0 checks, 7 lines checked
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > Please fix your series, and upload a new version. If you have a patchwork
> > > > > > account, do not forget to mark the current series as Superseded.
> > > > > > 
> > > > > > For more details, check the full report at:
> > > > > > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/79088843/artifacts/report.htm .
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > > Best regards, and Happy Hacking!
> > > > > > Media CI robot on behalf of the linux-media community.
> > > > > > 
> > > > > > ---
> > > > > > Check the latest rules for contributing your patches at:
> > > > > > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> > > > > > 
> > > > > > If you believe that the CI is wrong, kindly open an issue at
> > > > > > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > > > > > to this message.
> > > > > > 

-- 
Regards,

Laurent Pinchart

