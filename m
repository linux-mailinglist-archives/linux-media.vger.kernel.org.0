Return-Path: <linux-media+bounces-39922-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3358BB26932
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 16:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 554E31CC7949
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 14:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FD91D6188;
	Thu, 14 Aug 2025 14:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="oQt2UZmw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73831CEACB
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 14:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755180448; cv=none; b=VJWZQLf3RNZqi6XTY+VpKeNCxlReeIBh7AJ0w436bbJdIiOiiA+aZI/HxuKuK573UEIUduAXTQg0tEokCODjRzf0Pm22s06l8NUbMr2M+yI1SrYcwQ+cZJLg3q3x73zBMazwJbeBxxrkAbLwJqYWAY5gZgKp1kraDMMF77zbBb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755180448; c=relaxed/simple;
	bh=NcDLXnzTjI0OLHEsadR9AX20JekiFQ24kZZX8TxyYS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhQ2nwjOt4gSqETGAq3lQH9COesQ2/dinXCEKL3ddPEs3f57sr81S4kGMnm05GTRpoS9O/4nHXfURn5FGe6/0QjF7e8HRRWsxEzQcyZLAi6E0VlAhGLzOGtV3nJRIKSqBz8CtpboSetNpi/C+CbOxvjRuZXAr2MwaXwYD0XxKDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oQt2UZmw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 43A9B3D5;
	Thu, 14 Aug 2025 16:06:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755180389;
	bh=NcDLXnzTjI0OLHEsadR9AX20JekiFQ24kZZX8TxyYS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oQt2UZmweM1kXE70POqJoob64EKnyDP3mpByIKm49Y40IfVJgOna2Hd2W0GVfSYuL
	 5VFQDVPEpI0HdyMxaWxlcueWjJLPxIp03MmgDOwjL5YkyXq/4nQrvWgmzNnpIU9TBV
	 VGrKX7fgQsgXL2zmecc9rpetw0yWwVD8f0BfMPGs=
Date: Thu, 14 Aug 2025 17:07:03 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Dr. David Alan Gilbert" <dave@treblig.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [0/4] Remove the wl1273 FM Radio
Message-ID: <20250814140703.GA23634@pendragon.ideasonboard.com>
References: <20250625133258.78133-1-linux@treblig.org>
 <685c08d5.050a0220.350bff.01b0@mx.google.com>
 <aF1CCjVmRruMORto@gallifrey>
 <20250808140400.GA23187@pendragon.ideasonboard.com>
 <aJYFNMO4W4dv2i6U@gallifrey>
 <20250808160123.GE23187@pendragon.ideasonboard.com>
 <aJaVH5eCDhLutPSn@gallifrey>
 <20250809220146.GB17105@pendragon.ideasonboard.com>
 <aJ3rUqbqU-_FSo1P@gallifrey>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJ3rUqbqU-_FSo1P@gallifrey>

On Thu, Aug 14, 2025 at 01:57:38PM +0000, Dr. David Alan Gilbert wrote:
> * Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> > On Sat, Aug 09, 2025 at 12:23:59AM +0000, Dr. David Alan Gilbert wrote:
> > > * Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> > > > On Fri, Aug 08, 2025 at 02:09:56PM +0000, Dr. David Alan Gilbert wrote:
> > > > > * Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> > > > > > On Thu, Jun 26, 2025 at 12:50:18PM +0000, Dr. David Alan Gilbert wrote:
> > > > > > > * Patchwork Integration (patchwork@media-ci.org) wrote:
> > > > > > > > Dear Dr. David Alan Gilbert:
> > > > > > > > 
> > > > > > > > Thanks for your patches! Unfortunately the Media CI robot detected some
> > > > > > > > issues:
> > > > > > > > 
> > > > > > > > # Test checkpatch:./0001-media-radio-wl1273-Remove.patch checkpatch
> > > > > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > > > > #7: 
> > > > > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > > > > 
> > > > > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > > > > #61: 
> > > > > > > > deleted file mode 100644
> > > > > > > > 
> > > > > > > > total: 0 errors, 2 warnings, 0 checks, 30 lines checked
> > > > > > > 
> > > > > > > I did check that, couldn't find any appropriate MAINTAINERS entry anyway
> > > > > > > 
> > > > > > > > # Test checkpatch:./0002-ASoC-wl1273-Remove.patch checkpatch
> > > > > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > > > > #7: 
> > > > > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > > > 
> > > > > > > Yep, said that in my cover letter; suggestions on how to refer to that URL
> > > > > > > in a better way are welcome.
> > > > > > 
> > > > > > You can ignore those two warnings.
> > > > > 
> > > > > Thanks for confirming that.
> > > > > Could you (or some other -media maintainer) pick 1/4 for linux-media please;
> > > > > Generally I think Lee tends only to pick the mfd specific bit up, so I need
> > > > > to get the specifics in through the other trees.
> > > > 
> > > > We can take patch 1/4 in the media tree, but merging the different
> > > > pieces in an uncoordinated fashion will result in breakages in
> > > > linux-next :-/
> > > 
> > > It should be safe to go in order; so you taking patch 1/4 should move
> > > things forward.
> > 
> > 1/4 to 3/4 can be merged in any order, but 4/4 depends on the first
> > three patches getting merged first. The simplest option is to merge 1/4
> > to 3/4 for v6.18 through their respective trees, and 4/4 for v6.19. To
> > speed up merging 4/4 in v6.18 we need to coordinate between the three
> > subsystem maintainers.
> 
> I see you've picked 1/4 up in -next - thanks!

I haven't, but Hans did :-)

> I'll give the sound folk a prod for 2/4.
> For 3/4 and 4/4 probably the easiest thing if we can get 2 in is if 3/4 and 4/4
> go in as a pair in 6.19.

3/4 could go in v6.18 already, it's only 4/4 that is bothersome.

> All this coordination thing seems to be rare!

It's not the most common case indeed, but it still happens routinely.

> > > > I think the simplest option would be to create a branch on top of v6.16
> > > > (or v6.17-rc1) with the 4 patches applied, and merge it in the media,
> > > > mfd and sound trees. That would require Lee to drop patches 3/4 and 4/4
> > > > that he already applied to the mfd tree though.
> > > > 
> > > > > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > > > > #71: 
> > > > > > > > deleted file mode 100644
> > > > > > > > 
> > > > > > > > total: 0 errors, 2 warnings, 0 checks, 36 lines checked
> > > > > > > > 
> > > > > > > > # Test checkpatch:./0003-mfd-wl1273-core-Remove.patch checkpatch
> > > > > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > > > > #8: 
> > > > > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > > > > 
> > > > > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > > > > #55: 
> > > > > > > > deleted file mode 100644
> > > > > > > > 
> > > > > > > > total: 0 errors, 2 warnings, 0 checks, 23 lines checked
> > > > > > > > 
> > > > > > > > # Test checkpatch:./0004-mfd-wl1273-core-Remove-the-header.patch checkpatch
> > > > > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > > > > #7: 
> > > > > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > > > > 
> > > > > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > > > > #35: 
> > > > > > > > deleted file mode 100644
> > > > > > > > 
> > > > > > > > total: 0 errors, 2 warnings, 0 checks, 7 lines checked
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > Please fix your series, and upload a new version. If you have a patchwork
> > > > > > > > account, do not forget to mark the current series as Superseded.
> > > > > > > > 
> > > > > > > > For more details, check the full report at:
> > > > > > > > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/79088843/artifacts/report.htm .
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > Best regards, and Happy Hacking!
> > > > > > > > Media CI robot on behalf of the linux-media community.
> > > > > > > > 
> > > > > > > > ---
> > > > > > > > Check the latest rules for contributing your patches at:
> > > > > > > > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> > > > > > > > 
> > > > > > > > If you believe that the CI is wrong, kindly open an issue at
> > > > > > > > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > > > > > > > to this message.
> > > > > > > > 

-- 
Regards,

Laurent Pinchart

