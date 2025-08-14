Return-Path: <linux-media+bounces-39919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1111AB2687B
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 16:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12F79A27E1C
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 13:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10432301012;
	Thu, 14 Aug 2025 13:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="dRCP630f"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6FC3002BE
	for <linux-media@vger.kernel.org>; Thu, 14 Aug 2025 13:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179869; cv=none; b=cYyi0L52yqvR4VpEB/kAoIxJIAdtRyw2y3FfJDXYl5202vOj8oCBAE4b8E7JbOsbOwDPKMPNtKA8U0cmQIheqdFIf4gqxQW5FBY5tBLB0F08qVBI86MFxFb46ilL97RHj/CW/a4+9RynMG0NJnMoMhSwmjJU6SwHGfnAsCJyWCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179869; c=relaxed/simple;
	bh=Cgp/UzZGk5TSeJwqQbv8uw9KQWDXbiM8lVT7wHE47lQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jUuxaD2gW7U6saO5D1oyggjTsPSU4hXfTc2q6Od4THfEQ627FqOu4qV2clSHZQ2cIZ8aQTsaf+08VS8H0/Mf0h/PNv0wgLYx3QU2LAbsIXDhBRpIXCnDpUvG2xcbipCtqgUoVjCZSeVlkEi7nCWQoNYBDDb/id64cAdid380iWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=dRCP630f; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=W1E6lYXTOtYOdLICqJXEmH/mSFsGgZoONzpmV4Qyebs=; b=dRCP630fYPEiTWPs
	NdWovFsaa9AvQn29wlOc4lBsoNFrWd9tnq17URrxq2ntP0kWw43r+h6w8JFYIa8WCndSCoVE02ezg
	O9GEsY5ztTEcIZIMglYzjIDTU9PyDkbbhpBNgV5ZgNYYaMbflbJuF53ljzF43lxQ3Ek/dZrxpVjD7
	nSjPKsIuaQrdKmQ9LL8On57R5I+Mx0/jF7y0cUzpxlR8VmhnSXBj9WXfzExaJEIEwVA6fBzzrfBIo
	a15xdY6TfgMrhOdd5PAPbmB9uPxTKlOiWkTtHZxoCM0q25okC/SpuWiEDTfaz5SlDcUZjaESGFdCb
	cdVbLUpWzvAlM2xQxg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1umYSY-003vZN-2Q;
	Thu, 14 Aug 2025 13:57:38 +0000
Date: Thu, 14 Aug 2025 13:57:38 +0000
From: "Dr. David Alan Gilbert" <dave@treblig.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [0/4] Remove the wl1273 FM Radio
Message-ID: <aJ3rUqbqU-_FSo1P@gallifrey>
References: <20250625133258.78133-1-linux@treblig.org>
 <685c08d5.050a0220.350bff.01b0@mx.google.com>
 <aF1CCjVmRruMORto@gallifrey>
 <20250808140400.GA23187@pendragon.ideasonboard.com>
 <aJYFNMO4W4dv2i6U@gallifrey>
 <20250808160123.GE23187@pendragon.ideasonboard.com>
 <aJaVH5eCDhLutPSn@gallifrey>
 <20250809220146.GB17105@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250809220146.GB17105@pendragon.ideasonboard.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 13:53:31 up 108 days, 22:07,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> On Sat, Aug 09, 2025 at 12:23:59AM +0000, Dr. David Alan Gilbert wrote:
> > * Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> > > On Fri, Aug 08, 2025 at 02:09:56PM +0000, Dr. David Alan Gilbert wrote:
> > > > * Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> > > > > On Thu, Jun 26, 2025 at 12:50:18PM +0000, Dr. David Alan Gilbert wrote:
> > > > > > * Patchwork Integration (patchwork@media-ci.org) wrote:
> > > > > > > Dear Dr. David Alan Gilbert:
> > > > > > > 
> > > > > > > Thanks for your patches! Unfortunately the Media CI robot detected some
> > > > > > > issues:
> > > > > > > 
> > > > > > > # Test checkpatch:./0001-media-radio-wl1273-Remove.patch checkpatch
> > > > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > > > #7: 
> > > > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > > > 
> > > > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > > > #61: 
> > > > > > > deleted file mode 100644
> > > > > > > 
> > > > > > > total: 0 errors, 2 warnings, 0 checks, 30 lines checked
> > > > > > 
> > > > > > I did check that, couldn't find any appropriate MAINTAINERS entry anyway
> > > > > > 
> > > > > > > # Test checkpatch:./0002-ASoC-wl1273-Remove.patch checkpatch
> > > > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > > > #7: 
> > > > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > > 
> > > > > > Yep, said that in my cover letter; suggestions on how to refer to that URL
> > > > > > in a better way are welcome.
> > > > > 
> > > > > You can ignore those two warnings.
> > > > 
> > > > Thanks for confirming that.
> > > > Could you (or some other -media maintainer) pick 1/4 for linux-media please;
> > > > Generally I think Lee tends only to pick the mfd specific bit up, so I need
> > > > to get the specifics in through the other trees.
> > > 
> > > We can take patch 1/4 in the media tree, but merging the different
> > > pieces in an uncoordinated fashion will result in breakages in
> > > linux-next :-/
> > 
> > It should be safe to go in order; so you taking patch 1/4 should move
> > things forward.
> 
> 1/4 to 3/4 can be merged in any order, but 4/4 depends on the first
> three patches getting merged first. The simplest option is to merge 1/4
> to 3/4 for v6.18 through their respective trees, and 4/4 for v6.19. To
> speed up merging 4/4 in v6.18 we need to coordinate between the three
> subsystem maintainers.

I see you've picked 1/4 up in -next - thanks!
I'll give the sound folk a prod for 2/4.
For 3/4 and 4/4 probably the easiest thing if we can get 2 in is if 3/4 and 4/4
go in as a pair in 6.19.
All this coordination thing seems to be rare!

Dave

> > > I think the simplest option would be to create a branch on top of v6.16
> > > (or v6.17-rc1) with the 4 patches applied, and merge it in the media,
> > > mfd and sound trees. That would require Lee to drop patches 3/4 and 4/4
> > > that he already applied to the mfd tree though.
> > > 
> > > > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > > > #71: 
> > > > > > > deleted file mode 100644
> > > > > > > 
> > > > > > > total: 0 errors, 2 warnings, 0 checks, 36 lines checked
> > > > > > > 
> > > > > > > # Test checkpatch:./0003-mfd-wl1273-core-Remove.patch checkpatch
> > > > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > > > #8: 
> > > > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > > > 
> > > > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > > > #55: 
> > > > > > > deleted file mode 100644
> > > > > > > 
> > > > > > > total: 0 errors, 2 warnings, 0 checks, 23 lines checked
> > > > > > > 
> > > > > > > # Test checkpatch:./0004-mfd-wl1273-core-Remove-the-header.patch checkpatch
> > > > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > > > #7: 
> > > > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > > > 
> > > > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > > > #35: 
> > > > > > > deleted file mode 100644
> > > > > > > 
> > > > > > > total: 0 errors, 2 warnings, 0 checks, 7 lines checked
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > Please fix your series, and upload a new version. If you have a patchwork
> > > > > > > account, do not forget to mark the current series as Superseded.
> > > > > > > 
> > > > > > > For more details, check the full report at:
> > > > > > > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/79088843/artifacts/report.htm .
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > Best regards, and Happy Hacking!
> > > > > > > Media CI robot on behalf of the linux-media community.
> > > > > > > 
> > > > > > > ---
> > > > > > > Check the latest rules for contributing your patches at:
> > > > > > > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> > > > > > > 
> > > > > > > If you believe that the CI is wrong, kindly open an issue at
> > > > > > > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > > > > > > to this message.
> > > > > > > 
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

