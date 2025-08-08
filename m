Return-Path: <linux-media+bounces-39125-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E79B1E9F0
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 16:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 686B01899A01
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 14:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50BE227EFEB;
	Fri,  8 Aug 2025 14:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I614nTTp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB5227EC99
	for <linux-media@vger.kernel.org>; Fri,  8 Aug 2025 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754661863; cv=none; b=k1vI0h1aYJ7FQwZXNgnYthq3/OwNEih2JtsNssoznUNroNZWatXEbS5vAOitrge4+Z/5sfjIP6kr5yqt9huJs5+s0/QbRMRI+21Ri7F+M/ad7Xp7FTBM692PqKPU14/CvKJb7JLd2HW4VNLnm053LjTmPib/hZGtMdG6D0DHbzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754661863; c=relaxed/simple;
	bh=JUEZvxhDhkfFvtiJYesW2dn/PmSv3t5cgf3JZlQFtUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJoK1Zc1+EQWfsT8lN7oYoksN/foS9Rxt+aDxZzpS6KHmPsn6jHPF0A7NWuC+z9k6lKRgg2UtPwVpuzQ6RcnCTZobPGbf+0lPBg85GDl+j09FcFrdM/D44ripn00w8squESAh4waVBGMD0S0IE6SBvEvhzdCrjPylk18cK1pJ4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I614nTTp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 04C40185B;
	Fri,  8 Aug 2025 16:03:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754661807;
	bh=JUEZvxhDhkfFvtiJYesW2dn/PmSv3t5cgf3JZlQFtUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I614nTTpYDPIuAFmdi3LImsBQLV5tO+p7JZ0YF52HDL4UhJjHryHeyCEyAy4AecTL
	 b4GqGyHUWhW8xPbRSq+HVUtODdUG10ff8JIjfOhyziN3P9Up2370eggBUC5jO9J08H
	 nnYrauIUYyyhGBwT8+fDFLkPUSdCxFoz6c/BvBtc=
Date: Fri, 8 Aug 2025 17:04:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: linux-media@vger.kernel.org
Subject: Re: [0/4] Remove the wl1273 FM Radio
Message-ID: <20250808140400.GA23187@pendragon.ideasonboard.com>
References: <20250625133258.78133-1-linux@treblig.org>
 <685c08d5.050a0220.350bff.01b0@mx.google.com>
 <aF1CCjVmRruMORto@gallifrey>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aF1CCjVmRruMORto@gallifrey>

On Thu, Jun 26, 2025 at 12:50:18PM +0000, Dr. David Alan Gilbert wrote:
> * Patchwork Integration (patchwork@media-ci.org) wrote:
> > Dear Dr. David Alan Gilbert:
> > 
> > Thanks for your patches! Unfortunately the Media CI robot detected some
> > issues:
> > 
> > # Test checkpatch:./0001-media-radio-wl1273-Remove.patch checkpatch
> > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > #7: 
> >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > 
> > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > #61: 
> > deleted file mode 100644
> > 
> > total: 0 errors, 2 warnings, 0 checks, 30 lines checked
> 
> I did check that, couldn't find any appropriate MAINTAINERS entry anyway
> 
> > # Test checkpatch:./0002-ASoC-wl1273-Remove.patch checkpatch
> > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > #7: 
> >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> 
> Yep, said that in my cover letter; suggestions on how to refer to that URL
> in a better way are welcome.

You can ignore those two warnings.

> > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > #71: 
> > deleted file mode 100644
> > 
> > total: 0 errors, 2 warnings, 0 checks, 36 lines checked
> > 
> > # Test checkpatch:./0003-mfd-wl1273-core-Remove.patch checkpatch
> > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > #8: 
> >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > 
> > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > #55: 
> > deleted file mode 100644
> > 
> > total: 0 errors, 2 warnings, 0 checks, 23 lines checked
> > 
> > # Test checkpatch:./0004-mfd-wl1273-core-Remove-the-header.patch checkpatch
> > WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
> > #7: 
> >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > 
> > WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
> > #35: 
> > deleted file mode 100644
> > 
> > total: 0 errors, 2 warnings, 0 checks, 7 lines checked
> > 
> > 
> > 
> > Please fix your series, and upload a new version. If you have a patchwork
> > account, do not forget to mark the current series as Superseded.
> > 
> > For more details, check the full report at:
> > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/79088843/artifacts/report.htm .
> > 
> > 
> > 
> > Best regards, and Happy Hacking!
> > Media CI robot on behalf of the linux-media community.
> > 
> > ---
> > Check the latest rules for contributing your patches at:
> > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> > 
> > If you believe that the CI is wrong, kindly open an issue at
> > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > to this message.
> > 
> -- 
>  -----Open up your eyes, open up your mind, open up your code -------   
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
> 

-- 
Regards,

Laurent Pinchart

