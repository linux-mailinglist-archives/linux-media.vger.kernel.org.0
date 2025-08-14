Return-Path: <linux-media+bounces-39921-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD52B268E3
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 16:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEB221CE6B10
	for <lists+linux-media@lfdr.de>; Thu, 14 Aug 2025 14:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B3E30276D;
	Thu, 14 Aug 2025 13:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="qR+PgwU7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB1E3019D5;
	Thu, 14 Aug 2025 13:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179981; cv=none; b=nVlohvMX2RCp+vo+HPgSXIudoNUDvPHnHoHGYiPylkmlLEUev5bwmEXP7LV7Mu+U/TR7rCIlS7jm50E1HKn6UW56HMpdVtprWrA664FNNMqTOjZRaS49BDM9pf5By6R84bAvmHsM0xhiQIPt2VI2Wm/slEqzcMw6pAd61XUOm+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179981; c=relaxed/simple;
	bh=4L6OrNhJfmGFaWZ+b8JKogS/RpwJdYNR32VwyIgyZIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XcF+aXTgJeSPtPg3sftfzy4S2XNTDzDCqeKYnB9gBUBuJIbwSUmSS+abpwQs+q5oPFy7inLcEIRDieRllJEWDaca3v6jUGkny8OzkHnH2CNisRYB986INJkZ4mbsgrNGV8nBlD9cgIBxAnWJHi1QWlG4sK/XOH99L8BLvVHHvVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=qR+PgwU7; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=ogXuvXwN5zFRqxq6yhXGDhDFOvsNlXP+SJ496jlNU0U=; b=qR+PgwU7itFObyvf
	k2iTGmiEGahFl7nZuWuuO2rzPwGtxnSafZQbIHvbM8NxWu95gtg4qJFc4+aA+tsqzicHrzQHuGDYT
	AkSd+MYwUIZxByAgf/n2K97sUANZI5lfr+Isv0PI1AdANwYT6u7QvgXbaRIS0WWX2rwwjtikwgunE
	NpE+XraDt2Lu+6WNgYao42prkqS1L1J7kfxr3ihct+reih5/Kg+/DVqxZtl+0BS6SUjBSyDPUgpSZ
	Y5xa+MiCw1UWqO98lUt8i5JyLe34NEYxMWiHvHLP3GejSZlZMakDKvYhmU8LXVV5erEFR/obBmgbe
	slf+N/L4aNdFfbyUOw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1umYUJ-003vcV-2A;
	Thu, 14 Aug 2025 13:59:27 +0000
Date: Thu, 14 Aug 2025 13:59:27 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Mark Brown <broonie@kernel.org>, lgirdwood@gmail.com
Cc: arnd@arndb.de, lee@kernel.org, mchehab@kernel.org, perex@perex.cz,
	tiwai@suse.com, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: wl1273: Remove
Message-ID: <aJ3rv8uEerLt4J3g@gallifrey>
References: <20250625133258.78133-1-linux@treblig.org>
 <20250625133258.78133-3-linux@treblig.org>
 <97bfa9fc-c973-444c-9b37-fce557391886@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <97bfa9fc-c973-444c-9b37-fce557391886@sirena.org.uk>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 13:58:04 up 108 days, 22:11,  1 user,  load average: 0.11, 0.05,
 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)

* Mark Brown (broonie@kernel.org) wrote:
> On Wed, Jun 25, 2025 at 02:32:56PM +0100, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > The wl1273 FM radio is on Arnd's unused driver list:
> >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > Remove the codec component.
> 
> Acked-by: Mark Brown <broonie@kernel.org>

Thanks Mark; can you pick this 2/4 up via sound for 6.18 please?
(1/4 just went into -next already via media)

Thanks,

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

