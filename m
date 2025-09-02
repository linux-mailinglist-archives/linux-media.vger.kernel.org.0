Return-Path: <linux-media+bounces-41603-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C77B40CF3
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 20:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A04B01B64F70
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 18:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C43634A335;
	Tue,  2 Sep 2025 18:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="annzOnK4"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45F7199252;
	Tue,  2 Sep 2025 18:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756836849; cv=none; b=trU0xTOoN8O0vh3K/EW3S9oUcjXeSoCFMaGQ5Y6gmn6kU7tz7qmqvEgVA133jkZrohSmfICSNITI3mfa8HTFGwZ5QoikPiwUwnQ0jDIzAPG68iOQQ2EOzmsmpiRbSAMPkDzUVRSiUBMUXk+iNNYpNaVenogv3eHdW2GspD1xNng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756836849; c=relaxed/simple;
	bh=9FXlkRNezVVh36P6t+TaeP3d9O4CmaR5C7VkAHxWSBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEHw09H8p0JtNJ68D2OzIk1sS922mTyT8aQ3ya5ooQfV3c7q07FbqMyfxY8asSxCHV1W/yuxqiCEbgXK9uaI71k2yTQnld/GG1k/zqsOQDaUcTq8jmClYd1eufSl2m16yLTosPm/bMOlowzUmYQxTo4f4GwgHQfZWcFBIhqqp5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=annzOnK4; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=prInBSTc958Smv0ZFj1+aRfjobzPNDuMLS/wI5zg1QA=; b=annzOnK4yKgF70nE
	k0cEd0SooPPpXr13FzLO4tHBmS60iLrkntS6YIPuc9otL5H5aPzlmEEAJeGnuq+1lf4JaWoY0g4nu
	gXPSIZW71/IXPOEoMK/vyUSNIrWlC+3fGY8ngBRadNLUy7uX6wfyKyrA/l1PPq5/+rzGaIgQnSIWL
	N/0zKysgj3ahZmEQFUxvUZZjO2n5HZJf1mmuvm8p2w07Pu46KwRAM+MtptgkGF8MRr4D936gRuXMc
	Mpy0v84U8UHj3GUgaWzzOmATCjZksdtS8ddNO1PbrJq8PRWl9fNs1nQbAMl7tVRfEeBP/oI7jDo59
	lm6Xyf3M7podY2HFRg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1utV8A-0087xg-2k;
	Tue, 02 Sep 2025 17:49:18 +0000
Date: Tue, 2 Sep 2025 17:49:18 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>,
	arnd@arndb.de, mchehab@kernel.org, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Remove the wl1273 FM Radio
Message-ID: <aLcuHnj_h3Xf7DiK@gallifrey>
References: <20250625133258.78133-1-linux@treblig.org>
 <20250808154903.GB23187@pendragon.ideasonboard.com>
 <20250902103249.GG2163762@google.com>
 <20250902113527.GB1694@pendragon.ideasonboard.com>
 <88042d72-b428-442e-ba3c-b15e587e12a7@sirena.org.uk>
 <20250902121015.GI13448@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250902121015.GI13448@pendragon.ideasonboard.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 17:48:35 up 128 days,  2:02,  1 user,  load average: 0.01, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> On Tue, Sep 02, 2025 at 12:47:39PM +0100, Mark Brown wrote:
> > On Tue, Sep 02, 2025 at 01:35:27PM +0200, Laurent Pinchart wrote:
> > 
> > > Patch 1/4 has been queued in the media tree and should be in linux-next
> > > as commit 103b0cfc9ab6. It is based straight on v6.17-rc1. Patch 2/4 is
> > > also in linux-next, but is based on other ALSA patches. The simplest
> > > course of action would be for you to merge 3/4 for v6.18, and 4/4 for
> > > v6.19.
> > 
> > Or given that it's a driver removal we could just get a rebase of the
> > series against the meda tree applied?  The conflicts with ASoC should be
> > trivial to resolve.
> 
> I don't mind either way. I know Linus doesn't like having the same patch
> merged with different commit IDs, but I don't know how strict the rule
> is, especially when git should be able to resolve the conflict
> transparently.

I still think the easiest thing is to leave 1/4 and 2/4 as you currently
have them; and let Lee take 3/4 and 4/4 next time around.

Dave

> -- 
> Regards,
> 
> Laurent Pinchart
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

