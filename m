Return-Path: <linux-media+bounces-39135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAABB1ECBA
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 18:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20A301795EC
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 16:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EF828540B;
	Fri,  8 Aug 2025 16:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C1jFTyY5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9123613AD38
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754668902; cv=none; b=KAxt3/BsV9/LetO9EbuX8q70YEO9VPI7Y5Nt8QfqRUeEmKqrP+CNXG2IEMVEx4n+mB0zhkIy/itWNtquXThX9oCMou7t+4pMGUaw+QOpVFNQPPkIpZoU7kGl0Ke3IoiMAPzf+HfkrRGdZOVjWphr+rVl1jnBodeK1HfA2FMP1VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754668902; c=relaxed/simple;
	bh=1XzFOrQJlDwZcTvCgIpcpYfqQI9mAYdObdGudYX6hfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNlUNmVVQJP+x2STKqt79RDBCWj7HT4b+8DKHtnWx7y1UcLfvZ9SwIPe1OFCLn/5Ix22/YNLVyg6qr0hx8lBimutcdwkl59nALXGWL0zJd/qgBUfyMhdr1m6tVYaBPP0TWwNFDoOQL0Bc2c8fIG2tPAPmA/khIAdnqf/MbXGgoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C1jFTyY5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 91E691920;
	Fri,  8 Aug 2025 18:00:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754668848;
	bh=1XzFOrQJlDwZcTvCgIpcpYfqQI9mAYdObdGudYX6hfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C1jFTyY5IOcp1ygcbqT90SQzmpNHPKp2PajgVi14+wEB5tm6AHxSRbyDnp13Yykok
	 s+Un/XCssDhYxD584koNshrESaPyiIttDkGzTLo7preLu43urw/s2+FFQ2lNnKNG42
	 k212bXwWgNjFm75I7G/VfTtFmF02sAKGpbVw9Z9o=
Date: Fri, 8 Aug 2025 19:01:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [0/4] Remove the wl1273 FM Radio
Message-ID: <20250808160123.GE23187@pendragon.ideasonboard.com>
References: <20250625133258.78133-1-linux@treblig.org>
 <685c08d5.050a0220.350bff.01b0@mx.google.com>
 <aF1CCjVmRruMORto@gallifrey>
 <20250808140400.GA23187@pendragon.ideasonboard.com>
 <aJYFNMO4W4dv2i6U@gallifrey>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJYFNMO4W4dv2i6U@gallifrey>

On Fri, Aug 08, 2025 at 02:09:56PM +0000, Dr. David Alan Gilbert wrote:
> * Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> > On Thu, Jun 26, 2025 at 12:50:18PM +0000, Dr. David Alan Gilbert wrote:
> > > * Patchwork Integration (patchwork@media-ci.org) wrote:
> > > > Dear Dr. David Alan Gilbert:
> > > > 
> > > > Thanks for your patches! Unfortunately the Media CI robot detected some
> > > > issues:
> > > > 
> > > > # Test checkpatch:./0001-media-radio-wl1273-Remove.patch checkpatch
> > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > #7: 
> > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > 
> > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > #61: 
> > > > deleted file mode 100644
> > > > 
> > > > total: 0 errors, 2 warnings, 0 checks, 30 lines checked
> > > 
> > > I did check that, couldn't find any appropriate MAINTAINERS entry anyway
> > > 
> > > > # Test checkpatch:./0002-ASoC-wl1273-Remove.patch checkpatch
> > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > #7: 
> > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > 
> > > Yep, said that in my cover letter; suggestions on how to refer to that URL
> > > in a better way are welcome.
> > 
> > You can ignore those two warnings.
> 
> Thanks for confirming that.
> Could you (or some other -media maintainer) pick 1/4 for linux-media please;
> Generally I think Lee tends only to pick the mfd specific bit up, so I need
> to get the specifics in through the other trees.

We can take patch 1/4 in the media tree, but merging the different
pieces in an uncoordinated fashion will result in breakages in
linux-next :-/

I think the simplest option would be to create a branch on top of v6.16
(or v6.17-rc1) with the 4 patches applied, and merge it in the media,
mfd and sound trees. That would require Lee to drop patches 3/4 and 4/4
that he already applied to the mfd tree though.

> > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > #71: 
> > > > deleted file mode 100644
> > > > 
> > > > total: 0 errors, 2 warnings, 0 checks, 36 lines checked
> > > > 
> > > > # Test checkpatch:./0003-mfd-wl1273-core-Remove.patch checkpatch
> > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > #8: 
> > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > 
> > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > #55: 
> > > > deleted file mode 100644
> > > > 
> > > > total: 0 errors, 2 warnings, 0 checks, 23 lines checked
> > > > 
> > > > # Test checkpatch:./0004-mfd-wl1273-core-Remove-the-header.patch checkpatch
> > > > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > > > #7: 
> > > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > > 
> > > > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > > > #35: 
> > > > deleted file mode 100644
> > > > 
> > > > total: 0 errors, 2 warnings, 0 checks, 7 lines checked
> > > > 
> > > > 
> > > > 
> > > > Please fix your series, and upload a new version. If you have a patchwork
> > > > account, do not forget to mark the current series as Superseded.
> > > > 
> > > > For more details, check the full report at:
> > > > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/79088843/artifacts/report.htm .
> > > > 
> > > > 
> > > > 
> > > > Best regards, and Happy Hacking!
> > > > Media CI robot on behalf of the linux-media community.
> > > > 
> > > > ---
> > > > Check the latest rules for contributing your patches at:
> > > > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> > > > 
> > > > If you believe that the CI is wrong, kindly open an issue at
> > > > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > > > to this message.
> > > > 

-- 
Regards,

Laurent Pinchart

