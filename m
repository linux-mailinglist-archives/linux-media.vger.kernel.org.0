Return-Path: <linux-media+bounces-41631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D0BB4165C
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 09:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A7791BA16B9
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 07:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506032DA74D;
	Wed,  3 Sep 2025 07:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvztLMZU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E2F27FB2A;
	Wed,  3 Sep 2025 07:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884186; cv=none; b=FwaUHZ6D2q0mfKtlUpfNBWgVSYmoYTEpJDv/hE3HBzVAvZ5omHREDJwkyh8+HUAWvLBNfItxiAI6w3/i6Hb/JxMRGBngK1HOrQk9Ph04pyJH7kAPrUWgnTb3FAePrFvylqWYxpt+IoUNY47w5K5jwB5Zx3hOsekyCMjDDV11r2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884186; c=relaxed/simple;
	bh=i8YViYCLv0G5HWt+WwVcqnR5OfAuwswwP8Ni9nzI9xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4sKLe5hWnPMpK7Z4JwqVL5o4jSwdO9OaXago77M0w75UQSPXfEGBffEk+OAaGreESrC9jYwpCo/L+eDkF9Lc/FCeTX8p8dEWS+CmVSy16X4A73N6cM7Md8cXr1MsjSAmQaAwevYeyW9OLsNl6OiksDQ76hFRdaooZjj59OiiKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvztLMZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7072C4CEF0;
	Wed,  3 Sep 2025 07:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756884186;
	bh=i8YViYCLv0G5HWt+WwVcqnR5OfAuwswwP8Ni9nzI9xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CvztLMZUOgGBrIYsh5cn0NG/ZBk1o+0TNOTDgYrnAgHgGXReGBzdFckiiDW5wTGTn
	 LzB8cRxhs7lXljN5fwMRdNapmxI0nGpde/BlCyxZ/F3YfJN+/QO/6Ss8oNOAFKaL27
	 eDlIIs7KzBIhqyKKPQPy6N7zdYsb4gNrbKzBMKwo6IgsOcWDXSPpKEAg4+gPNbffvK
	 diJZqyBEDPPCsymf89lShIPuRaPZPcI6tZbBDWuPnlMINwTAAjoQoJvK3Ys4iYNY5B
	 FFHYpTSOn9ju6UYXwQZrAbEhwSLW6yjG5tKqCLWcWHlZ3t9eRn31xkltJTk25ViNb0
	 maxJwEK6z9ZuQ==
Date: Wed, 3 Sep 2025 08:23:01 +0100
From: Lee Jones <lee@kernel.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mark Brown <broonie@kernel.org>, arnd@arndb.de, mchehab@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-media@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Remove the wl1273 FM Radio
Message-ID: <20250903072301.GZ2163762@google.com>
References: <20250625133258.78133-1-linux@treblig.org>
 <20250808154903.GB23187@pendragon.ideasonboard.com>
 <20250902103249.GG2163762@google.com>
 <20250902113527.GB1694@pendragon.ideasonboard.com>
 <88042d72-b428-442e-ba3c-b15e587e12a7@sirena.org.uk>
 <20250902121015.GI13448@pendragon.ideasonboard.com>
 <aLcuHnj_h3Xf7DiK@gallifrey>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aLcuHnj_h3Xf7DiK@gallifrey>

On Tue, 02 Sep 2025, Dr. David Alan Gilbert wrote:

> * Laurent Pinchart (laurent.pinchart@ideasonboard.com) wrote:
> > On Tue, Sep 02, 2025 at 12:47:39PM +0100, Mark Brown wrote:
> > > On Tue, Sep 02, 2025 at 01:35:27PM +0200, Laurent Pinchart wrote:
> > > 
> > > > Patch 1/4 has been queued in the media tree and should be in linux-next
> > > > as commit 103b0cfc9ab6. It is based straight on v6.17-rc1. Patch 2/4 is
> > > > also in linux-next, but is based on other ALSA patches. The simplest
> > > > course of action would be for you to merge 3/4 for v6.18, and 4/4 for
> > > > v6.19.
> > > 
> > > Or given that it's a driver removal we could just get a rebase of the
> > > series against the meda tree applied?  The conflicts with ASoC should be
> > > trivial to resolve.
> > 
> > I don't mind either way. I know Linus doesn't like having the same patch
> > merged with different commit IDs, but I don't know how strict the rule
> > is, especially when git should be able to resolve the conflict
> > transparently.
> 
> I still think the easiest thing is to leave 1/4 and 2/4 as you currently
> have them; and let Lee take 3/4 and 4/4 next time around.

It's more disjointed than I like.  But it's okay.  Remind me later.

-- 
Lee Jones [李琼斯]

