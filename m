Return-Path: <linux-media+bounces-39185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B2CB1F174
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 02:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B6F5D1C81B9D
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BBA420D51A;
	Sat,  9 Aug 2025 00:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="oY7atmAm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9CF1FC7CB
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 00:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754699043; cv=none; b=RajCNZit7DwEPfgphVINldh1ErJqBwb84zgpNn5j0e5T6WNvbPEx1xSIRjrK3iNNgJEg1k1rOVoVjLYH48VwI8Rbk26CUH/a/0KlcYjpOeZa5ki1dFBIFOjFMgfbv+A90He/a25eluvS863haa9xTXsqvzWUI7kVK8JM4uMwKKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754699043; c=relaxed/simple;
	bh=sXKvzDbi2KG0bh4L+vDqs0vn5iZIdafW4aQGFdzJKtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/ZibqK7DgE6IA+j9/Mwv4Na5/YVSNarws8LOs3ZjWJ3+oNC/ey47ZY74VmwNZTbsLyf940MuqkYW9vOxBBh2BNE0Jxf4ohCvTdgJ7vIjjngNMkAAs3phA2NI4KtGLUkqOmBEF2NqRQxlsHLOA7KlNshqHHgneQjuScLE6ZsDng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=oY7atmAm; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=8ABOe7cm/pk+yLZ7VIriJHl3XyfNvydrZ1iKOlkR9tI=; b=oY7atmAm8WYY1qjZ
	TtnyC6+3Ypt7+aokeSx1nxbuMcHTeMzhkL5/ahUAh05ih+SUDM5PE53o+erF75fbr4PIBMc2TKiya
	FMkkBXU0B6m/p7aaQp6Ekwq5wvTLvtes1/GY56teMnB4N22lUnGK51NW9drnyMMWbR5n4akTWLWS1
	Y6ROzZQijcZq/vKl6o6MpCSHv0BHNuC92YrwXe0Asub4D4Se8Y1eoSyFpZGS/UEyATMT+iAomYjSo
	AIrf44DHcVntS6nnI1Ui0D0b5HpoRHu5UlyLTUwd9xhz6/6A0AzPo50aK5lp3HG7IrJHH2HCCCJKj
	7SFZbw7XVSyB8rrmRg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1ukXNP-002pdV-0z;
	Sat, 09 Aug 2025 00:23:59 +0000
Date: Sat, 9 Aug 2025 00:23:59 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [0/4] Remove the wl1273 FM Radio
Message-ID: <aJaVH5eCDhLutPSn@gallifrey>
References: <20250625133258.78133-1-linux@treblig.org>
 <685c08d5.050a0220.350bff.01b0@mx.google.com>
 <aF1CCjVmRruMORto@gallifrey>
 <20250808140400.GA23187@pendragon.ideasonboard.com>
 <aJYFNMO4W4dv2i6U@gallifrey>
 <20250808160123.GE23187@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250808160123.GE23187@pendragon.ideasonboard.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 00:18:07 up 103 days,  8:31,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> On Fri, Aug 08, 2025 at 02:09:56PM +0000, Dr. David Alan Gilbert wrote:
> > * Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> > > On Thu, Jun 26, 2025 at 12:50:18PM +0000, Dr. David Alan Gilbert wrote:
> > > > * Patchwork Integration (patchwork@media-ci.org) wrote:
> > > > > Dear Dr. David Alan Gilbert:
> > > > > 
> > > > > Thanks for your patches! Unfortunately the Media CI robot detected some
> > > > > issues:
> > > > > 
> > > > > # Test checkpatch:./0001-media-radio-wl1273-Remove.patch checkpatch
> > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > #7: 
> > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > 
> > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > #61: 
> > > > > deleted file mode 100644
> > > > > 
> > > > > total: 0 errors, 2 warnings, 0 checks, 30 lines checked
> > > > 
> > > > I did check that, couldn't find any appropriate MAINTAINERS entry anyway
> > > > 
> > > > > # Test checkpatch:./0002-ASoC-wl1273-Remove.patch checkpatch
> > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > #7: 
> > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > 
> > > > Yep, said that in my cover letter; suggestions on how to refer to that URL
> > > > in a better way are welcome.
> > > 
> > > You can ignore those two warnings.
> > 
> > Thanks for confirming that.
> > Could you (or some other -media maintainer) pick 1/4 for linux-media please;
> > Generally I think Lee tends only to pick the mfd specific bit up, so I need
> > to get the specifics in through the other trees.
> 
> We can take patch 1/4 in the media tree, but merging the different
> pieces in an uncoordinated fashion will result in breakages in
> linux-next :-/

It should be safe to go in order; so you taking patch 1/4 should move
things forward.

Dave

> I think the simplest option would be to create a branch on top of v6.16
> (or v6.17-rc1) with the 4 patches applied, and merge it in the media,
> mfd and sound trees. That would require Lee to drop patches 3/4 and 4/4
> that he already applied to the mfd tree though.
> 
> > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > #71: 
> > > > > deleted file mode 100644
> > > > > 
> > > > > total: 0 errors, 2 warnings, 0 checks, 36 lines checked
> > > > > 
> > > > > # Test checkpatch:./0003-mfd-wl1273-core-Remove.patch checkpatch
> > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > #8: 
> > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > 
> > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > #55: 
> > > > > deleted file mode 100644
> > > > > 
> > > > > total: 0 errors, 2 warnings, 0 checks, 23 lines checked
> > > > > 
> > > > > # Test checkpatch:./0004-mfd-wl1273-core-Remove-the-header.patch checkpatch
> > > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > > #7: 
> > > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > > 
> > > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > > #35: 
> > > > > deleted file mode 100644
> > > > > 
> > > > > total: 0 errors, 2 warnings, 0 checks, 7 lines checked
> > > > > 
> > > > > 
> > > > > 
> > > > > Please fix your series, and upload a new version. If you have a patchwork
> > > > > account, do not forget to mark the current series as Superseded.
> > > > > 
> > > > > For more details, check the full report at:
> > > > > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/79088843/artifacts/report.htm .
> > > > > 
> > > > > 
> > > > > 
> > > > > Best regards, and Happy Hacking!
> > > > > Media CI robot on behalf of the linux-media community.
> > > > > 
> > > > > ---
> > > > > Check the latest rules for contributing your patches at:
> > > > > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> > > > > 
> > > > > If you believe that the CI is wrong, kindly open an issue at
> > > > > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > > > > to this message.
> > > > > 
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

