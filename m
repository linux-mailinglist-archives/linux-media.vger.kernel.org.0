Return-Path: <linux-media+bounces-43680-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BA0BB53A0
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 22:52:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56A2B18985FA
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 20:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D06277003;
	Thu,  2 Oct 2025 20:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="C69Ah66b"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683FE1C4A10;
	Thu,  2 Oct 2025 20:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759438236; cv=none; b=ITxyFni55KTlgngHdwXXLhd5wTInMV/p70VeHlWPhcFqd+IdmQiSk7WlomW4lLxFAAW1YobwJ8faL0o1ckbk2AldosRt8/EuoPczaH3jHD62t2mrRxoVixBbrTrtHBRO2VWHD+OxxswLbF2oqFDN1g23yIaq8vhi4GgGHKFMJRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759438236; c=relaxed/simple;
	bh=UTpRTPC7u6vNzbnK8EDdA8HMy/2iR/0ZlTpwgM8uRGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emOKOdhfCyPwwti3QAox9u0qg3q6ZK57QE8f6dXZzFXlTj3+a6DM7Z549eWfKcn6Vx2iNiWqmrWSYaojUpGDrm/2967zj2tv0u2DI3zgOx+UPlLk14AApi8uG6jgO2zPjOeScLoKQ/HuHIRXti6Kj/zG5+FsxqJ3vInLjMwocNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=C69Ah66b; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=EXs6IZ4idy9yeg4n6KxHIZ/ibHP7AdPo7DYQz33da8g=; b=C69Ah66b9sLO6yz0
	8KLv6iEanfRNtaIYZzZLAZzLbmpPYjXZhWNRoZv3Xb43w6X60+D0SHCUm1MjJjiHoEJh2F6CheAvk
	3HQDZ17dKoLKqxWN2sTDEc5a2UzLESuxy5AnFmDmX95noFpZxSonhY8zYpofp4fpn9lSTb7uxQkzP
	q8lqCL18VOvQv5Cv0XtPwwbewKKu0NWUQPb67VuKNwCu9HEe5dktLlqQ9eONu2sneZcmk1ueykqF6
	kqHeFWXt2+dnvcck/0wccCQWTjXMHJFhsJKZxfHUSerrWJui8SpUHxMiqFOtG610Duuz9q23Fzoit
	VR82hsYZnE51ny5GhA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1v4PyJ-00Ebda-1f;
	Thu, 02 Oct 2025 20:32:15 +0000
Date: Thu, 2 Oct 2025 20:32:15 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Lee Jones <lee@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mark Brown <broonie@kernel.org>, arnd@arndb.de, mchehab@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-media@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Remove the wl1273 FM Radio
Message-ID: <aN7hT_59V6KcOxTe@gallifrey>
References: <20250625133258.78133-1-linux@treblig.org>
 <20250808154903.GB23187@pendragon.ideasonboard.com>
 <20250902103249.GG2163762@google.com>
 <20250902113527.GB1694@pendragon.ideasonboard.com>
 <88042d72-b428-442e-ba3c-b15e587e12a7@sirena.org.uk>
 <20250902121015.GI13448@pendragon.ideasonboard.com>
 <aLcuHnj_h3Xf7DiK@gallifrey>
 <20250903072301.GZ2163762@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250903072301.GZ2163762@google.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 20:29:51 up 158 days,  4:43,  1 user,  load average: 0.05, 0.01,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Lee Jones (lee@kernel.org) wrote:
> On Tue, 02 Sep 2025, Dr. David Alan Gilbert wrote:
> 
> > * Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> > > On Tue, Sep 02, 2025 at 12:47:39PM +0100, Mark Brown wrote:
> > > > On Tue, Sep 02, 2025 at 01:35:27PM +0200, Laurent Pinchart wrote:
> > > > 
> > > > > Patch 1/4 has been queued in the media tree and should be in linux-next
> > > > > as commit 103b0cfc9ab6. It is based straight on v6.17-rc1. Patch 2/4 is
> > > > > also in linux-next, but is based on other ALSA patches. The simplest
> > > > > course of action would be for you to merge 3/4 for v6.18, and 4/4 for
> > > > > v6.19.
> > > > 
> > > > Or given that it's a driver removal we could just get a rebase of the
> > > > series against the meda tree applied?  The conflicts with ASoC should be
> > > > trivial to resolve.
> > > 
> > > I don't mind either way. I know Linus doesn't like having the same patch
> > > merged with different commit IDs, but I don't know how strict the rule
> > > is, especially when git should be able to resolve the conflict
> > > transparently.
> > 
> > I still think the easiest thing is to leave 1/4 and 2/4 as you currently
> > have them; and let Lee take 3/4 and 4/4 next time around.
> 
> It's more disjointed than I like.  But it's okay.  Remind me later.

Hi Lee,
  1 and 2 of this series just got merged into Linus' tree.
Thanks all!
3 and 4 can go in at your convenience.

Dave

> -- 
> Lee Jones [李琼斯]
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

