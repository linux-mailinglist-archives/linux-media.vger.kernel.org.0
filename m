Return-Path: <linux-media+bounces-39136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E93BB1ECBC
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 18:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F7CD188A69C
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 16:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EA62868B7;
	Fri,  8 Aug 2025 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="AFV8y+Mz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C65019DF9A;
	Fri,  8 Aug 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754668903; cv=none; b=SVvbcbojSS6mE+BcefFHbpRf1607TZTwuP8R7gQJvVgWcAMloW0t2ZLJXVcfcaqTvrBbecci8z2ZqbuTO5rfL9GEkmpUIRbVH5cuoMRx/oDN87COOwonNL/9R45NCt8Flg82bU4CJaB2Iph19ASDVwHykLQpZeMDMRWJ+tsB9KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754668903; c=relaxed/simple;
	bh=4wpl5kISI8+f2W8s1bQPKbUJjQqqP5TkAhzHBAkm0oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXPVOOgQ8gc+ZlUQIVfr0F6VeBV1TrN/sWFm8m8PMZrGBUChedxx5QmNMqFLKMyaSuhV1n/GA4sS+x9bLHk7BV0Ea/Izfg/A/uXVJUr5BLowfwWffRDNbm7iBut0uje5OH1XapahDw8peGJhPspjxCiyNDwM3mXOungzeUAFw1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=AFV8y+Mz; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=Pa6ymjaf+laIWDGL7nQvdthJC62smmHhReHlABClzRc=; b=AFV8y+MzC2v3/m2A
	tP1s6C5vKN1CJu/UeZkpAky9muwA4QZMopqa0F0/pkfFLF7PEZGRMLxdVGBiINmC3Hdxs9EygoOyW
	DJjjTwXsc3nKtrV6rqV9bgk/cPho/zOHP86LPcYcSyc3FdGBP5QmByCQRTz+eGMD/W7M+OyaYZKWU
	bdIqcLV7RYmSjZ+MR1F7Pv7jKOfy0fh6P/mWDN65pFqU8ZDlONdqsHFH7BFZNHT8D/dqN0BK6b/Rm
	OqeFChZjD46zgsk7IV1T3U2xYtx0XHBasJwke3smi8+N9ImCCQGhqSfnFnvfqPmBqBL0bHZKrvNmS
	Q86C2IzA8QEkZb2yyg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1ukPX7-002mNU-36;
	Fri, 08 Aug 2025 16:01:29 +0000
Date: Fri, 8 Aug 2025 16:01:29 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lee Jones <lee@kernel.org>, arnd@arndb.de, mchehab@kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
	tiwai@suse.com, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] Remove the wl1273 FM Radio
Message-ID: <aJYfWQg-B_GQtF0n@gallifrey>
References: <20250625133258.78133-1-linux@treblig.org>
 <175137646300.2319882.12045106011003909576.b4-ty@kernel.org>
 <20250808155133.GC23187@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250808155133.GC23187@pendragon.ideasonboard.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 16:01:15 up 103 days, 14 min,  1 user,  load average: 0.02, 0.03,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> Hi Lee,
> 
> On Tue, Jul 01, 2025 at 02:27:43PM +0100, Lee Jones wrote:
> > On Wed, 25 Jun 2025 14:32:54 +0100, linux@treblig.org wrote:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > > I noticed that the wl1273 radio had an unused symbol, but then noticed
> > > it is on Arnd's unused driver list:
> > >   https://lore.kernel.org/lkml/a15bb180-401d-49ad-a212-0c81d613fbc8@app.fastmail.com/
> > > 
> > > So, delete it.
> > > The components seem pretty separable, except for Kconfig dependencies.
> > > 
> > > [...]
> > 
> > Applied, thanks!
> > 
> > [3/4] mfd: wl1273-core: Remove
> >       commit: efddd98938400a570bde5bc69b5ecc7e76cacbe1
> > [4/4] mfd: wl1273-core: Remove the header
> >       commit: d356033e7b1e94e0187bb0651f4a066a4646fbb9
> 
> Ah, that may answer the question I just posted in another reply to the
> cover letter.
> 
> I think patch 4/4 will break build in -next until patches 1/4 and 2/4
> get merged too. Should we get 1/4 and 2/4 merged in the media and sound
> trees ASAP, or would you prefer a different option ?

That makes sense to me.

Dave

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

