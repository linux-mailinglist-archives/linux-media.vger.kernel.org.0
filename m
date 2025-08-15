Return-Path: <linux-media+bounces-39985-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34938B27F29
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 13:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46A906066B9
	for <lists+linux-media@lfdr.de>; Fri, 15 Aug 2025 11:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 912CB3002BB;
	Fri, 15 Aug 2025 11:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="MIyfn7dr"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4111225A4F;
	Fri, 15 Aug 2025 11:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755257394; cv=none; b=ldnIHNg+OfrZe3hdlhsV8H9yMrGD5UOaRYvfBLfePhPjPr6y8rFG99x7JwSeYZRIjABLWgncigyen8ZmAilG8gzmp05P1dCYjrpe/UsrHghzn63sriszK5ck9+iY09IDSpDzCJlrYW6gXRbZ5arrfPXci6HUZykon2cauU9NWkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755257394; c=relaxed/simple;
	bh=gI06Gz3ALf3dHDSvJ+NUQiHzyaRnSA/3F1NlwQM+LHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OqBbmzInpEJczFr9Hz7jpJlydVwlPUIkX9qmM0FFS2Psq7/MkyhQEf86JrC4JK+KFK/YOZFF3o0g9WgDE/6VbUQfX5MG8iALevdGU3TcIOBrFjVGCYFHbFS1POvg7Iw9x0FhNnDHT2W8yjZ3cfMkvJ/EsLwuyVUpMk42VxH8JEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=MIyfn7dr; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=gpGmTL9oaWZkJzI5RpIpiQ3peZ9wkoO5yOEMyS33WzU=; b=MIyfn7drCOtZB+Q+
	ID96jCrka8HnkfzAgyC6thDNtJlN9X9jdar/cknzvjnUmMliIwQnPfEzj59ywi/MeEl/dHCEA/0OJ
	ovsi0kSGtBWADnSapYYMsrRTE2wMQjXUrue6CF+bu6njSEyuuJcFLn3jM17P7eJ+JgqgxrBjFxWsr
	JycoEkuBNyCcWng+h9ieNBF1AJCPhWbarvjnHQWob4DoXEGt3RaZgsJmCgtH/K8B71C3FIlw4MSnC
	U2tRybIl44FUY2oZQXUWs7QpH00rcVoqScIXTdGLOFx3nvGvvWu92S4fD6ppmBfy1Uq2GyAxattr0
	3evEWQDqPHMTZ5+JYg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1umscz-004AXS-2P;
	Fri, 15 Aug 2025 11:29:45 +0000
Date: Fri, 15 Aug 2025 11:29:45 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Mark Brown <broonie@kernel.org>
Cc: arnd@arndb.de, lee@kernel.org, mchehab@kernel.org, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] Remove the wl1273 FM Radio
Message-ID: <aJ8aKbW65eYvHZ-0@gallifrey>
References: <20250625133258.78133-1-linux@treblig.org>
 <175520208626.152171.10554357200062278681.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <175520208626.152171.10554357200062278681.b4-ty@kernel.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 11:28:35 up 109 days, 19:42,  1 user,  load average: 0.01, 0.01,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Mark Brown (broonie@kernel.org) wrote:
> On Wed, 25 Jun 2025 14:32:54 +0100, linux@treblig.org wrote:
> > I noticed that the wl1273 radio had an unused symbol, but then noticed
> > it is on Arnd's unused driver list:
> >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > 
> > So, delete it.
> > The components seem pretty separable, except for Kconfig dependencies.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks! I see that in next; so Lee can do 3/4-4/4 maybe in the following cycle
or later in this one.

Dave

> Thanks!
> 
> [2/4] ASoC: wl1273: Remove
>       commit: a46e95c81e3a28926ab1904d9f754fef8318074d
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

